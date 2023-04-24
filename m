Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9074A6ED222
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 18:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E018F10E406;
	Mon, 24 Apr 2023 16:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4F01510E1A6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 16:10:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.99,223,1677510000"; d="scan'208";a="157087326"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 25 Apr 2023 01:10:30 +0900
Received: from localhost.localdomain (unknown [10.226.92.191])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7E3794048F3A;
 Tue, 25 Apr 2023 01:10:27 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v8 0/5] Add RZ/{G2L,G2LC} and RZ/V2L Display Unit support
Date: Mon, 24 Apr 2023 17:10:19 +0100
Message-Id: <20230424161024.136316-1-biju.das.jz@bp.renesas.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, dri-devel@lists.freedesktop.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RZ/G2L LCD controller composed of Frame compression Processor(FCPVD), Video
signal processor (VSPD) and Display unit(DU). The output of LCDC is
connected to Display parallel interface and MIPI link video interface.
 
The output from DSI is connected to ADV7535.

Created a vendor specific directory renesas and moved all renesas drm drivers
to it (rcar-du and shmobile). Then added support for RZ/G2L DU DRM driver by
creating rz_du directory.

v7->v8:
Ref:
 https://lore.kernel.org/linux-renesas-soc/OS0PR01MB5922717E4CCFE07F3C25FBC986989@OS0PR01MB5922.jpnprd01.prod.outlook.com/#t

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

Biju Das (5):
  drm: Place Renesas drivers in a separate dir
  dt-bindings: display: Document Renesas RZ/G2L DU bindings
  dt-bindings: display: renesas,rzg2l-du: Document RZ/V2L DU bindings
  drm: Add RZ/G2L DU Support
  MAINTAINERS: Add maintainer for RZ DU drivers

 .../bindings/display/renesas,rzg2l-du.yaml    | 129 +++
 MAINTAINERS                                   |  14 +-
 drivers/gpu/drm/Kconfig                       |   4 +-
 drivers/gpu/drm/Makefile                      |   3 +-
 drivers/gpu/drm/renesas/Kconfig               |   5 +
 drivers/gpu/drm/renesas/Makefile              |   5 +
 drivers/gpu/drm/{ => renesas}/rcar-du/Kconfig |   0
 .../gpu/drm/{ => renesas}/rcar-du/Makefile    |   0
 .../gpu/drm/{ => renesas}/rcar-du/rcar_cmm.c  |   0
 .../gpu/drm/{ => renesas}/rcar-du/rcar_cmm.h  |   0
 .../drm/{ => renesas}/rcar-du/rcar_du_crtc.c  |   0
 .../drm/{ => renesas}/rcar-du/rcar_du_crtc.h  |   0
 .../drm/{ => renesas}/rcar-du/rcar_du_drv.c   |   0
 .../drm/{ => renesas}/rcar-du/rcar_du_drv.h   |   0
 .../{ => renesas}/rcar-du/rcar_du_encoder.c   |   0
 .../{ => renesas}/rcar-du/rcar_du_encoder.h   |   0
 .../drm/{ => renesas}/rcar-du/rcar_du_group.c |   0
 .../drm/{ => renesas}/rcar-du/rcar_du_group.h |   0
 .../drm/{ => renesas}/rcar-du/rcar_du_kms.c   |   0
 .../drm/{ => renesas}/rcar-du/rcar_du_kms.h   |   0
 .../drm/{ => renesas}/rcar-du/rcar_du_plane.c |   0
 .../drm/{ => renesas}/rcar-du/rcar_du_plane.h |   0
 .../drm/{ => renesas}/rcar-du/rcar_du_regs.h  |   0
 .../drm/{ => renesas}/rcar-du/rcar_du_vsp.c   |   0
 .../drm/{ => renesas}/rcar-du/rcar_du_vsp.h   |   0
 .../{ => renesas}/rcar-du/rcar_du_writeback.c |   0
 .../{ => renesas}/rcar-du/rcar_du_writeback.h |   0
 .../drm/{ => renesas}/rcar-du/rcar_dw_hdmi.c  |   0
 .../gpu/drm/{ => renesas}/rcar-du/rcar_lvds.c |   0
 .../gpu/drm/{ => renesas}/rcar-du/rcar_lvds.h |   0
 .../{ => renesas}/rcar-du/rcar_lvds_regs.h    |   0
 .../drm/{ => renesas}/rcar-du/rcar_mipi_dsi.c |   0
 .../drm/{ => renesas}/rcar-du/rcar_mipi_dsi.h |   0
 .../rcar-du/rcar_mipi_dsi_regs.h              |   0
 .../{ => renesas}/rcar-du/rzg2l_mipi_dsi.c    |   0
 .../rcar-du/rzg2l_mipi_dsi_regs.h             |   0
 drivers/gpu/drm/renesas/rz-du/Kconfig         |  20 +
 drivers/gpu/drm/renesas/rz-du/Makefile        |   8 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 716 ++++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h |  99 +++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 188 +++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  89 ++
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  | 112 +++
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.h  |  28 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  | 770 ++++++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.h  |  43 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_regs.h |  67 ++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c  | 430 ++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h  |  94 +++
 .../gpu/drm/{ => renesas}/shmobile/Kconfig    |   0
 .../gpu/drm/{ => renesas}/shmobile/Makefile   |   0
 .../shmobile/shmob_drm_backlight.c            |   0
 .../shmobile/shmob_drm_backlight.h            |   0
 .../{ => renesas}/shmobile/shmob_drm_crtc.c   |   0
 .../{ => renesas}/shmobile/shmob_drm_crtc.h   |   0
 .../{ => renesas}/shmobile/shmob_drm_drv.c    |   0
 .../{ => renesas}/shmobile/shmob_drm_drv.h    |   0
 .../{ => renesas}/shmobile/shmob_drm_kms.c    |   0
 .../{ => renesas}/shmobile/shmob_drm_kms.h    |   0
 .../{ => renesas}/shmobile/shmob_drm_plane.c  |   0
 .../{ => renesas}/shmobile/shmob_drm_plane.h  |   0
 .../{ => renesas}/shmobile/shmob_drm_regs.h   |   0
 62 files changed, 2816 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
 create mode 100644 drivers/gpu/drm/renesas/Kconfig
 create mode 100644 drivers/gpu/drm/renesas/Makefile
 rename drivers/gpu/drm/{ => renesas}/rcar-du/Kconfig (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/Makefile (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_cmm.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_cmm.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_crtc.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_crtc.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_drv.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_drv.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_encoder.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_encoder.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_group.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_group.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_kms.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_kms.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_plane.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_plane.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_regs.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_vsp.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_vsp.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_writeback.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_du_writeback.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_dw_hdmi.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_lvds.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_lvds.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_lvds_regs.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_mipi_dsi.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_mipi_dsi.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rcar_mipi_dsi_regs.h (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rzg2l_mipi_dsi.c (100%)
 rename drivers/gpu/drm/{ => renesas}/rcar-du/rzg2l_mipi_dsi_regs.h (100%)
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
 rename drivers/gpu/drm/{ => renesas}/shmobile/Kconfig (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/Makefile (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_backlight.c (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_backlight.h (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_crtc.c (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_crtc.h (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_drv.c (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_drv.h (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_kms.c (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_kms.h (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_plane.c (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_plane.h (100%)
 rename drivers/gpu/drm/{ => renesas}/shmobile/shmob_drm_regs.h (100%)

-- 
2.25.1

