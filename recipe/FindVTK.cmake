message( STATUS Using custom FindVTK )

add_library( VTK::WrappingPythonCore UNKNOWN IMPORTED )
add_library( VTK::RenderingCore UNKNOWN IMPORTED )
add_library( VTK::CommonDataModel UNKNOWN IMPORTED )
add_library( VTK::CommonExecutionModel UNKNOWN IMPORTED )
add_library( VTK::CommonCore UNKNOWN IMPORTED )
add_library( VTK::Sys UNKNOWN IMPORTED )

file( GLOB python_core_file "$ENV{CONDA_PREFIX}/lib/libvtkWrappingPythonCore*")
file( GLOB rendering_core_file "$ENV{CONDA_PREFIX}/lib/libvtkRenderingCore*")
file( GLOB data_model_file "$ENV{CONDA_PREFIX}/lib/libvtkCommonDataModel*")
file( GLOB execution_model_file "$ENV{CONDA_PREFIX}/lib/libvtkCommonExecutionModel*")
file( GLOB common_core_file "$ENV{CONDA_PREFIX}/lib/libvtkCommonCore*")
file( GLOB sys_file "$ENV{CONDA_PREFIX}/lib/libvtksys*")
file( GLOB include_dir LIST_DIRECTORIES True "$ENV{CONDA_PREFIX}/include/vtk-*")

list (GET python_core_file 0 python_core_file)
list (GET rendering_core_file 0 rendering_core_file)
list (GET data_model_file 0 data_model_file)
list (GET execution_model_file 0 execution_model_file)
list (GET common_core_file 0 common_core_file)
list (GET sys_file 0 sys_file)
list (GET include_dir 0 include_dir)

set_target_properties( VTK::WrappingPythonCore PROPERTIES
	INTERFACE_INCLUDE_DIRECTORIES "${include_dir}"
	INTERFACE_LINK_LIBRARIES "VTK::CommonCore;VTK::Sys"
	IMPORTED_LOCATION "${python_core_file}"
)

set_target_properties( VTK::RenderingCore PROPERTIES
	IMPORTED_LOCATION "${rendering_core_file}"
)

set_target_properties( VTK::CommonDataModel PROPERTIES
	IMPORTED_LOCATION "${data_model_file}"
)

set_target_properties( VTK::CommonExecutionModel PROPERTIES
	IMPORTED_LOCATION "${execution_model_file}"
)

set_target_properties( VTK::CommonCore PROPERTIES
	IMPORTED_LOCATION "${common_core_file}"
)

set_target_properties( VTK::Sys PROPERTIES
	IMPORTED_LOCATION "${sys_file}"
)

message( STATUS "VTK py core file: ${python_core_file}" )
