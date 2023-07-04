Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18521746CBB
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 11:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD0110E0A5;
	Tue,  4 Jul 2023 09:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id A433C10E0A5
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 09:04:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="6.01,180,1684767600"; d="scan'208";a="166753292"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 04 Jul 2023 18:04:54 +0900
Received: from localhost.localdomain (unknown [10.226.93.53])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8B6A541D8BDC;
 Tue,  4 Jul 2023 18:04:50 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v10 0/4] Add RZ/{G2L,G2LC} and RZ/V2L Display Unit support
Date: Tue,  4 Jul 2023 10:04:43 +0100
Message-Id: <20230704090447.27420-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This path series aims to add support for RZ/G2L DU DRM driver.

RZ/G2L LCD controller composed of Frame compression Processor(FCPVD), Video
signal processor (VSPD) and Display unit(DU). The output of LCDC is
connected to Display parallel interface and MIPI link video interface.
 
The output from DSI is connected to ADV7535.

Ref:
 https://lore.kernel.org/linux-renesas-soc/OS0PR01MB5922717E4CCFE07F3C25FBC986989@OS0PR01MB5922.jpnprd01.prod.outlook.com/#t

This patch series is tested with [2]
[2] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=742810

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
 * Dropped reset_control_assert() from error patch for rzg2l_du_crtc_get() as
   suggested by Philipp Zabel.
 * Added Rb tag from Laurent oatch#5.
 * Updated MAINTAINERS entries for common parts(Makefile and Kconfig).
v7->v8:
 * Moved rcar-du and shmobile DRM drivers to renesas specific vendor directory.
 * Fixed the typo vsp2->du in RZ/V2L DU bindings patch.
 * Added Rb tag from Rob for RZ/V2L DU bindings patch.
 * Dropped RCar du lib and created RZ/G2L DU DRM driver by creating rz_du folder.
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

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220312084205.31462-2-biju.das.jz@bp.renesas.com/

Biju Das (4):
  dt-bindings: display: Document Renesas RZ/G2L DU bindings
  dt-bindings: display: renesas,rzg2l-du: Document RZ/V2L DU bindings
  drm: renesas: Add RZ/G2L DU Support
  MAINTAINERS: Add maintainer for RZ DU drivers

 .../bindings/display/renesas,rzg2l-du.yaml    | 126 +++
 MAINTAINERS                                   |  15 +-
 drivers/gpu/drm/renesas/Kconfig               |   1 +
 drivers/gpu/drm/renesas/Makefile              |   1 +
 drivers/gpu/drm/renesas/rz-du/Kconfig         |  12 +
 drivers/gpu/drm/renesas/rz-du/Makefile        |   8 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 599 ++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h |  92 +++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 180 +++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  84 ++
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  | 109 +++
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.h  |  32 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  | 741 ++++++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h  |  43 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_regs.h |  67 ++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c  | 469 +++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h  |  97 +++
 17 files changed, 2674 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
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
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_regs.h
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
 create mode 100644 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h

-- 
2.25.1

