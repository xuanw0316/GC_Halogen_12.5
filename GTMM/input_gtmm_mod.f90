!------------------------------------------------------------------------------
!          Harvard University Atmospheric Chemistry Modeling Group            !
!------------------------------------------------------------------------------
!BOP
!
! !MODULE: INPUT\_GTMM\_MOD
!
! !DESCRIPTION: Module INPUT\_GTMM\_MOD contains subroutines to read 
!  input file for GTMM. (ccc, 11/3/09)
!
! !INTERFACE:
!
MODULE INPUT_GTMM_MOD
!
! !USES:
!
  USE defineConstants
  USE defineArrays

  IMPLICIT NONE

  ! Make everything PRIVATE ...
  PRIVATE
!
! !PRIVATE DATA MEMBERS:
! 
  INTEGER, PARAMETER :: FIRSTCOL = 38
  INTEGER, PARAMETER :: HEADER   = 8
  CHARACTER(LEN=255) :: FILENAME = 'input.gtmm'
!
! !PUBLIC MEMBER FUNCTION:
!
  PUBLIC :: READ_GTMM_INPUT_FILE
!
! !REVISION HISTORY:
!  17 Dec 2009 - C. Carouge   - Initial version
!
!EOP
!-----------------------------------------------------------------------------

CONTAINS

!------------------------------------------------------------------------------
!          Harvard University Atmospheric Chemistry Modeling Group            !
!------------------------------------------------------------------------------
!BOP
!
! !ROUTINE: READ\_GTMM\_INPUT\_FILE
!
! !DESCRIPTION: Subroutine READ\_GTMM\_INPUT\_FILE reads the input.gtmm file. 
!  (ccc, 12/17/09)
!
! !INTERFACE:
!
  SUBROUTINE READ_GTMM_INPUT_FILE
!
! !REVISION HISTORY:
!  17 Dec 2009 - C. Carouge  -- Initial version
!
!EOP
!------------------------------------------------------------------------------
!BOC
!
! !LOCAL VARIABLES
!
    LOGICAL            :: EOF
    INTEGER            :: IOS, I, IU_GTMM
    CHARACTER(LEN=255) :: LINE

    IU_GTMM=20
    ! Open file
    OPEN( IU_GTMM, FILE=TRIM( FILENAME ), STATUS='OLD', IOSTAT=IOS )
    IF ( IOS /= 0 ) THEN
       print*, 'Problem opening the input file for GTMM'
       stop
    ENDIF

    !Read header
    DO i=1,HEADER
       READ(IU_GTMM, '(a)') LINE
    ENDDO

    !Read data
    !Read a line from the file, exit if EOF
    READ(IU_GTMM,'(a)') LINE
       
    !Keep only the data part of the line
    LINE=LINE(FIRSTCOL:)

    READ(LINE,*) NPPequilibriumYear
       
    !Read a line from the file, exit if EOF
    READ(IU_GTMM,'(a)') LINE
       
    !Keep only the data part of the line
    LINE=LINE(FIRSTCOL:)

    READ(LINE,*) HgPoolsequilibriumYear

    !Initialize indYear too.
    indYear = HgPoolsequilibriumYear
       
    !Read a line from the file, exit if EOF
    READ(IU_GTMM,'(a)') LINE
       
    !Keep only the data part of the line
    LINE=LINE(FIRSTCOL:)

    READ(LINE,*) preindYear
    
    !Read a line from the file, exit if EOF
    READ(IU_GTMM,'(a)') LINE
       
    !Keep only the data part of the line
    LINE=LINE(FIRSTCOL:)

    READ(LINE,*) LRESTART
    
    !Read a line from the file, exit if EOF
    READ(IU_GTMM,'(a)') LINE
       
    !Keep only the data part of the line
    LINE=LINE(FIRSTCOL:)

    READ(LINE,*) restartfile
    
    CLOSE(IU_GTMM)
  END SUBROUTINE READ_GTMM_INPUT_FILE

END MODULE INPUT_GTMM_MOD
!EOC
!------------------------------------------------------------------------------