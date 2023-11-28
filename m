Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F31A57FB890
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 11:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39CA210E4CF;
	Tue, 28 Nov 2023 10:51:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id D7BD110E4CF
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 10:51:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.04,233,1695654000"; d="scan'208";a="184518412"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 28 Nov 2023 19:51:37 +0900
Received: from localhost.localdomain (unknown [10.226.92.91])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3AFD941DFE5D;
 Tue, 28 Nov 2023 19:51:31 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Biju Das <biju.das.jz@bp.renesas.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v15 0/5] Add RZ/{G2L,G2LC} and RZ/V2L Display Unit support
Date: Tue, 28 Nov 2023 10:51:24 +0000
Message-Id: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Biju Das <biju.das.au@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This path series aims to add support for RZ/G2L DU DRM driver.

RZ/G2L LCD controller composed of Frame compression Processor(FCPVD), Video
signal processor (VSPD) and Display unit(DU). The output of LCDC is
connected to Display parallel interface and MIPI link video interface.
=20
The output from DSI is connected to ADV7535.

Ref:
 https://lore.kernel.org/linux-renesas-soc/OS0PR01MB5922717E4CCFE07F3C25FBC=
986989@OS0PR01MB5922.jpnprd01.prod.outlook.com/#t

This patch series is tested with [2]
[2] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=3D7=
42810

Test logs kmscube: [3]
v14->v15:
 * Added patch#4, The rcar-du has never been maintained in drm-misc. So
   exclude only this driver from drm-misc. Also, add the tree entry for
   sh_mobile.
 * Added drm-misc tree entry.
 * Sorted the entry(Placed before SHMOBILE)
v13->v14:
 * Replaced the label 'error'->'done' in rzg2l_du_vsps_init() as it
   applies to non-error case as well.
 * Update the error check condition for rcar_du_vsp_init() to avoid
   breakage in future, if it returns positive value.
 * Now SHMOBILE has maintainer entries. So dropped updating
   DRM DRIVERS FOR RENESAS RCAR AND SHMOBILE.
 * Updated comment header and description for maintainer entry patch.
v12->v13:
 * Dropped DU_MCR0_DPI_OE and unused macros.
 * Dropped unneeded backward compatibility with old DTBs as it is new drive=
r.
 * Replaced "cells > 1"-> "cells !=3D 1" in rzg2l_du_vsps_init().
 * Fixed memory leak in rzg2l_du_vsps_init().
 * Dropped drm_plane_create_{alpha,zpos,blend_mode}_property().
v11->v12:
 * Dropped quotes in ref handle for renesas,vsps property.
 * Retained tags as it is trivial change.
 * Replaced rzg2l_du_write()->writel().
v10->v11:
 * Replaced CONFIG_DRM_RCAR_VSP->CONFIG_VIDEO_RENESAS_VSP1 for building
   rzg2l_du_vsp driver.
 * Dropped "rzg2l_du_regs.h" instead the relevant definitions defined in
   .c file.
 * Dropped setting ditr5 based on latest HW manual 1.3.0/1.4.0
 * Updated the comment for auto clear.
 * Replaced writel()->rzg2l_du_write() in rzg2l_du_start_stop().
 * Dropped CRC related functions as it does not have DISCOM.
 * Replaced the variable possible_crtcs->possible_outputs in
   struct rzg2l_du_output_routing.
 * Updated DMA_BIT_MASK from 40->32.
 * Dropped unneeded struct drm_bridge from rzg2l_du_drv.h.
 * Dropped colour keying support as it doesn't have planes.
 * Added only RGB formats in rzg2l_du_format_infos.
 * Dropped chroma planes from rzg2l_du_fb_create().
 * Updated the comment for max_pitch in rzg2l_du_fb_create().
 * Dropped possible_crtcs check in rzg2l_du_encoders_init().
 * Dropped additional empty line from struct rzg2l_du_device.
v9->v10:
 * patch#1 is mainlined, so dropped from this series.
 * Added Rb tag from Laurent for the binding patch.
 * Updated the commit description.
 * Updated description of the port by dropping the text "specified in
   Documentation/devicetree/bindings/graph.txt."
 * Dropped empty endpoint from example.
 * Dropped ARM64 dependency from Kconfig.
 * Sorted the configs alphabetically in Kconfig.
 * Dropped DRM_RCAR_VSP config option and make DRM_RZG2L_DU depend on
   VIDEO_RENESAS_VSP1.
 * On rzg2l_du_crtc_set_display_timing() replaced the setting of parent
   clk rate with dclk rate.
 * Added rzg2l_du_write() wrapper function.
 * Updated the comment atomic_begin->atomic_flush.
 * Dropped .atomic_check and .atomic_begin callback
 * Renamed __rzg2l_du_crtc_plane_atomic_check->__rzg2l_du_vsp_plane_atomic
   _check and moved it to rzg2l_du_vsp.c
 * Added struct clk in rzg2l_du_crtc.h
 * Dropped the variables mmio_offset,index,vblank_lock,vblank_wait,
   vblank_count from struct rzg2l_du_crtc.
 * Replaced the macro to_rzg2l_crtc with static inline functions.
 * Dropped the unneeded header files clk.h, io.h, mm.h, pm.h, slab.h,
   wait.h and drm_managed.h from rzg2l_du_drv.c.
 * Replaced DRM_INFO->drm_info
 * Dropped the callbacks prime_handle_to_fd, prime_fd_to_handle and
   gem_prime_mmap.
 * Replaced the callback remove->remove_new.
 * Dropped header file wait.h and added forward declarations struct clk and
   rzg2l_du_device from rzg2l_du_drv.h.
 * Dropped the dsi and dpad0_source variables from struct rzg2l_du_device.
 * Replaced the macro to_rzg2l_encoder with static inline functions.
 * Dropped header files dma-buf.h and wait.h from rzg2l_du_kms.c.
 * Dropped struct sg_table and added the scatterlist.h header file in
   rzg2l_du_vsp.h
 * Added container_of.h header file, forward declarations struct device and
   struct rzg2l_du_device in rzg2l_du_vsp.h.
v8->v9:
 * Added Rb tag from Laurent and Acked-by tag from Kieran for patch#1.
 * Added Rb tag from Laurent and Geert for patch#3.
 * Dropped reset_control_assert() from error patch for rzg2l_du_crtc_get() =
as
   suggested by Philipp Zabel.
 * Added Rb tag from Laurent oatch#5.
 * Updated MAINTAINERS entries for common parts(Makefile and Kconfig).
v7->v8:
 * Moved rcar-du and shmobile DRM drivers to renesas specific vendor direct=
ory.
 * Fixed the typo vsp2->du in RZ/V2L DU bindings patch.
 * Added Rb tag from Rob for RZ/V2L DU bindings patch.
 * Dropped RCar du lib and created RZ/G2L DU DRM driver by creating rz_du f=
older.
 * Updated MAINTAINERS entries.
v6->v7:
 * Split DU lib and  RZ/G2L du driver as separate patch series as
   DU support added to more platforms based on RZ/G2L alike SoCs.
 * Rebased to latest drm-tip.
 * Added patch #2 for binding support for RZ/V2L DU
 * Added patch #4 for driver support for RZ/V2L DU
 * Added patch #5 for SoC DTSI support for RZ/G2L DU
 * Added patch #6 for SoC DTSI support for RZ/V2L DU
 * Added patch #7 for Enabling DU on SMARC EVK based on RZ/{G2L,V2L} SoCs.
 * Added patch #8 for Enabling DU on SMARC EVK based on RZ/G2LC SoC.
v5->v6:
 * Merged DU lib and RZ/G2L du driver in same patch series
 * Rebased to latest drm-misc.
 * Merged patch#1 to RZ/G2L Driver patch.
 * Updated KConfig dependency from ARCH_RENESAS->ARCH_RZG2L.
 * Optimized rzg2l_du_output_name() by removing unsupported outputs.

v4->v5:
 * Added Rb tag from Rob for binding patch.
 * Started using RCar DU libs(kms, vsp and encoder)
 * Started using rcar_du_device, rcar_du_write, rcar_du_crtc,
   rcar_du_format_info and rcar_du_encoder.
v3->v4:
 * Changed compatible name from renesas,du-r9a07g044->renesas,r9a07g044-du
 * started using same compatible for RZ/G2{L,LC}
 * Removed rzg2l_du_group.h and struct rzg2l_du_group
 * Renamed __rzg2l_du_group_start_stop->rzg2l_du_start_stop
 * Removed rzg2l_du_group_restart
 * Updated rzg2l_du_crtc_set_display_timing
 * Removed mode_valid callback.
 * Updated rzg2l_du_crtc_create() parameters
 * Updated compatible
 * Removed RZG2L_DU_MAX_GROUPS
V2->v3:
 * Added new bindings for RZ/G2L DU
 * Removed indirection and created new DRM driver based on R-Car DU
v1->v2:
 * Based on [1], all references to 'rzg2l_lcdc' replaced with 'rzg2l_du'
 * Updated commit description for bindings
 * Removed LCDC references from bindings
 * Changed clock name from du.0->aclk from bindings
 * Changed reset name from du.0->du from bindings
 * Replaced crtc_helper_funcs->rcar_crtc_helper_funcs
 * Updated macro DRM_RZG2L_LCDC->DRM_RZG2L_DU
 * Replaced rzg2l-lcdc-drm->rzg2l-du-drm
 * Added forward declaration for struct reset_control

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/2022031208=
4205.31462-2-biju.das.jz@bp.renesas.com/

[3]
root@smarc-rzv2l:/cip-test-scripts# kmscube
Using display 0xaaaad2a6a160 with EGL version 1.4
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
EGL information:
  version: "1.4"
  vendor: "Mesa Project"
  client extensions: "EGL_EXT_client_extensions EGL_EXT_device_base EGL_EXT=
_device_enumeration EGL_EXT_device_query EGL_EXT_platform_base EGL_KHR_clie=
nt_get_all_proc_addresses EGL_KHR_debug EGL_EXT_platform_device EGL_EXT_pla=
tform_wayland EGL_KHR_platform_wayland EGL_MESA_platform_gbm EGL_KHR_platfo=
rm_gbm EGL_MESA_platform_surfaceless"
  display extensions: "EGL_ANDROID_blob_cache EGL_EXT_buffer_age EGL_EXT_im=
age_dma_buf_import EGL_EXT_image_dma_buf_import_modifiers EGL_KHR_cl_event2=
 EGL_KHR_config_attribs EGL_KHR_create_context EGL_KHR_create_context_no_er=
ror EGL_KHR_fence_sync EGL_KHR_get_all_proc_addresses EGL_KHR_gl_colorspace=
 EGL_KHR_gl_renderbuffer_image EGL_KHR_gl_texture_2D_image EGL_KHR_gl_textu=
re_3D_image EGL_KHR_gl_texture_cubemap_image EGL_KHR_image EGL_KHR_image_ba=
se EGL_KHR_image_pixmap EGL_KHR_no_config_context EGL_KHR_partial_update EG=
L_KHR_reusable_sync EGL_KHR_surfaceless_context EGL_EXT_pixel_format_float =
EGL_KHR_wait_sync EGL_MESA_configless_context EGL_MESA_drm_image EGL_MESA_i=
mage_dma_buf_export EGL_MESA_query_driver EGL_WL_bind_wayland_display "
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
OpenGL ES 2.x information:
  version: "OpenGL ES 3.1 Mesa 21.3.7"
  shading language version: "OpenGL ES GLSL ES 3.10"
  vendor: "Panfrost"
  renderer: "Mali-G31 (Panfrost)"
  extensions: "GL_EXT_blend_minmax GL_EXT_multi_draw_arrays GL_EXT_texture_=
filter_anisotropic GL_EXT_texture_compression_rgtc GL_EXT_texture_format_BG=
RA8888 GL_OES_compressed_ETC1_RGB8_texture GL_OES_depth24 GL_OES_element_in=
dex_uint GL_OES_fbo_render_mipmap GL_OES_mapbuffer GL_OES_rgb8_rgba8 GL_OES=
_standard_derivatives GL_OES_stencil8 GL_OES_texture_3D GL_OES_texture_floa=
t GL_OES_texture_float_linear GL_OES_texture_half_float GL_OES_texture_half=
_float_linear GL_OES_texture_npot GL_OES_vertex_half_float GL_EXT_draw_inst=
anced GL_EXT_texture_sRGB_decode GL_OES_EGL_image GL_OES_depth_texture GL_O=
ES_packed_depth_stencil GL_EXT_texture_type_2_10_10_10_REV GL_NV_conditiona=
l_render GL_OES_get_program_binary GL_APPLE_texture_max_level GL_EXT_discar=
d_framebuffer GL_EXT_read_format_bgra GL_EXT_frag_depth GL_NV_fbo_color_att=
achments GL_OES_EGL_image_external GL_OES_EGL_sync GL_OES_vertex_array_obje=
ct GL_ANGLE_pack_reverse_row_order GL_EXT_occlusion_query_boolean GL_EXT_te=
xture_rg GL_EXT_unpack_subimage GL_NV_draw_buffers GL_NV_read_buffer GL_NV_=
read_depth GL_NV_read_depth_stencil GL_NV_read_stencil GL_EXT_draw_buffers =
GL_EXT_map_buffer_range GL_KHR_debug GL_KHR_texture_compression_astc_ldr GL=
_NV_pixel_buffer_object GL_OES_depth_texture_cube_map GL_OES_required_inter=
nalformat GL_OES_surfaceless_context GL_EXT_color_buffer_float GL_EXT_sRGB_=
write_control GL_EXT_separate_shader_objects GL_EXT_shader_framebuffer_fetc=
h GL_EXT_shader_implicit_conversions GL_EXT_shader_integer_mix GL_EXT_base_=
instance GL_EXT_compressed_ETC1_RGB8_sub_texture GL_EXT_draw_buffers_indexe=
d GL_EXT_draw_elements_base_vertex GL_EXT_gpu_shader5 GL_EXT_primitive_boun=
ding_box GL_EXT_shader_io_blocks GL_EXT_texture_border_clamp GL_EXT_texture=
_buffer GL_EXT_texture_view GL_KHR_blend_equation_advanced GL_KHR_blend_equ=
ation_advanced_coherent GL_KHR_context_flush_control GL_NV_image_formats GL=
_OES_draw_buffers_indexed GL_OES_draw_elements_base_vertex GL_OES_gpu_shade=
r5 GL_OES_primitive_bounding_box GL_OES_sample_shading GL_OES_sample_variab=
les GL_OES_shader_io_blocks GL_OES_shader_multisample_interpolation GL_OES_=
texture_border_clamp GL_OES_texture_buffer GL_OES_texture_stencil8 GL_OES_t=
exture_storage_multisample_2d_array GL_OES_texture_view GL_EXT_blend_func_e=
xtended GL_EXT_float_blend GL_EXT_texture_sRGB_R8 GL_EXT_texture_sRGB_RG8 G=
L_KHR_no_error GL_KHR_texture_compression_astc_sliced_3d GL_OES_EGL_image_e=
xternal_essl3 GL_OES_shader_image_atomic GL_EXT_multisampled_render_to_text=
ure GL_EXT_multisampled_render_to_texture2 GL_MESA_shader_integer_functions=
 GL_EXT_color_buffer_half_float GL_EXT_texture_mirror_clamp_to_edge GL_KHR_=
parallel_shader_compile GL_EXT_EGL_image_storage GL_EXT_shader_framebuffer_=
fetch_non_coherent GL_INTEL_blackhole_render GL_MESA_framebuffer_flip_y GL_=
EXT_depth_clamp GL_MESA_bgra "
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 cat /sys/class/devfreq/11840000.gpu/trans_stat
 [INFO]      From  :   To
 [INFO]            :  50000000  62500000 100000000 125000000 200000000 2500=
00000 400000000 500000000   time(ms)
 [INFO]    50000000:         0         0         0         0         0     =
    0         0         2       380
 [INFO]    62500000:         0         0         0         0         0     =
    0         0         0         0
 [INFO]   100000000:         0         0         0         0         0     =
    0         0         0         0
 [INFO]   125000000:         0         0         0         0         0     =
    0         0         0         0
 [INFO] * 200000000:         1         0         0         0         0     =
    0         0        79      4576
 [INFO]   250000000:         0         0         0         0        69     =
    0         0         0      5292
 [INFO]   400000000:         0         0         0         0         5     =
    0         0         2       440
 [INFO]   500000000:         1         0         0         0         7     =
   69         7         0      5340
 [INFO] Total transition : 242

Biju Das (5):
  dt-bindings: display: Document Renesas RZ/G2L DU bindings
  dt-bindings: display: renesas,rzg2l-du: Document RZ/V2L DU bindings
  drm: renesas: Add RZ/G2L DU Support
  MAINTAINERS: Update entries for Renesas DRM drivers
  MAINTAINERS: Create entry for Renesas RZ DRM drivers

 .../bindings/display/renesas,rzg2l-du.yaml    | 126 +++++
 MAINTAINERS                                   |  12 +-
 drivers/gpu/drm/renesas/Kconfig               |   1 +
 drivers/gpu/drm/renesas/Makefile              |   1 +
 drivers/gpu/drm/renesas/rz-du/Kconfig         |  12 +
 drivers/gpu/drm/renesas/rz-du/Makefile        |   8 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 431 ++++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h |  89 ++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 176 +++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  78 +++
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  |  72 +++
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.h  |  32 ++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  | 433 +++++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h  |  43 ++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c  | 460 ++++++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h  |  97 ++++
 16 files changed, 2070 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/renesas,rzg2l=
-du.yaml
 create mode 100644 drivers/gpu/drm/renesas/rz-du/Kconfig
 create mode 100644 drivers/gpu/drm/renesas/rz-du/Makefile
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h


base-commit: e17049148678725248a57ecbf9c21df0fde3b434
--=20
2.25.1

