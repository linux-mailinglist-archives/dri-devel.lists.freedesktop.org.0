Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9EA4DB0A4
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 14:11:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CFD710E57E;
	Wed, 16 Mar 2022 13:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2E76210E57E
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 13:11:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.90,186,1643641200"; d="scan'208";a="113700594"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 16 Mar 2022 22:11:26 +0900
Received: from localhost.localdomain (unknown [10.226.92.179])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id E0ADF429C365;
 Wed, 16 Mar 2022 22:11:23 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 7/7] drm: rcar-du: Add RZ/G2L DU Support
Date: Wed, 16 Mar 2022 13:11:00 +0000
Message-Id: <20220316131100.30685-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220316131100.30685-1-biju.das.jz@bp.renesas.com>
References: <20220316131100.30685-1-biju.das.jz@bp.renesas.com>
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The LCD controller is composed of Frame Compression Processor (FCPVD),
Video Signal Processor (VSPD), and Display Unit (DU).

It has DPI/DSI interfaces and supports a maximum resolution of 1080p
along with 2 RPFs to support blending of two picture layers and
raster operations (ROPs).

The DU part is similar to RCar like DU is connected to VSPD, so reusing
most of the functionality from RCar. This patch introduces separate CRTC
handling as it does not have plane/group registers.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Based on [1], all references to 'rzg2l_lcdc' replaced with 'rzg2l_du'
 * Updated commit header
 * Updated macro DRM_RZG2L_LCDC->DRM_RZG2L_DU
 * Replaced rzg2l-lcdc-drm->rzg2l-du-drm
 * Added forward declaration for struct reset_control

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220312084205.31462-2-biju.das.jz@bp.renesas.com/
RFC->v1:
 * Added RZ/G2L LCDC driver with special handling for CRTC reusing
   most of RCar DU code
RFC:
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-19-biju.das.jz@bp.renesas.com/
---
 drivers/gpu/drm/rcar-du/Kconfig          |  18 +-
 drivers/gpu/drm/rcar-du/Makefile         |  12 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h   |   8 +
 drivers/gpu/drm/rcar-du/rcar_du_plane.h  |  12 +
 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c  | 705 +++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rzg2l_du_drv.c   | 221 +++++++
 drivers/gpu/drm/rcar-du/rzg2l_du_plane.c |  82 +++
 drivers/gpu/drm/rcar-du/rzg2l_du_regs.h  |  64 ++
 8 files changed, 1120 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_drv.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_plane.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_regs.h

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index f6e6a6d5d987..e40fb0c53f9b 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -11,6 +11,19 @@ config DRM_RCAR_DU
 	  Choose this option if you have an R-Car chipset.
 	  If M is selected the module will be called rcar-du-drm.
 
+config DRM_RZG2L_DU
+	tristate "DRM Support for RZ/G2L DU"
+	depends on DRM && OF
+	depends on ARM || ARM64
+	depends on ARCH_RENESAS || COMPILE_TEST
+	select DRM_KMS_HELPER
+	select DRM_GEM_CMA_HELPER
+	select VIDEOMODE_HELPERS
+	help
+	  Choose this option if you have an RZ/G2L chipset.
+	  If M is selected the module will be called rzg2l-du-drm.
+
+
 config DRM_RCAR_USE_CMM
 	bool "R-Car DU Color Management Module (CMM) Support"
 	depends on DRM_RCAR_DU
@@ -54,12 +67,13 @@ config DRM_RCAR_MIPI_DSI
 config DRM_RCAR_VSP
 	bool "R-Car DU VSP Compositor Support" if ARM
 	default y if ARM64
-	depends on DRM_RCAR_DU
+	depends on DRM_RCAR_DU || DRM_RZG2L_DU
 	depends on VIDEO_RENESAS_VSP1=y || (VIDEO_RENESAS_VSP1 && DRM_RCAR_DU=m)
+	depends on VIDEO_RENESAS_VSP1=y || (VIDEO_RENESAS_VSP1 && DRM_RZG2L_DU=m)
 	help
 	  Enable support to expose the R-Car VSP Compositor as KMS planes.
 
 config DRM_RCAR_WRITEBACK
 	bool
 	default y if ARM64
-	depends on DRM_RCAR_DU
+	depends on DRM_RCAR_DU || DRM_RZG2L_DU
diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
index 331e12d65a6b..01ba78e56b53 100644
--- a/drivers/gpu/drm/rcar-du/Makefile
+++ b/drivers/gpu/drm/rcar-du/Makefile
@@ -7,15 +7,27 @@ rcar-du-drm-y := rcar_du_crtc.o \
 		 rcar_du_kms.o \
 		 rcar_du_plane.o \
 
+rzg2l-du-drm-y := rzg2l_du_crtc.o \
+		  rcar_du_common.o \
+		  rzg2l_du_drv.o \
+		  rcar_du_encoder.o \
+		  rcar_du_kms.o \
+		  rzg2l_du_plane.o \
+
 rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
 rcar-du-drm-$(CONFIG_DRM_RCAR_WRITEBACK) += rcar_du_writeback.o
 
+rzg2l-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
+rzg2l-du-drm-$(CONFIG_DRM_RCAR_WRITEBACK) += rcar_du_writeback.o
+
 obj-$(CONFIG_DRM_RCAR_CMM)		+= rcar_cmm.o
 obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
 obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+= rcar_dw_hdmi.o
 obj-$(CONFIG_DRM_RCAR_LVDS)		+= rcar_lvds.o
 obj-$(CONFIG_DRM_RCAR_MIPI_DSI)		+= rcar_mipi_dsi.o
 
+obj-$(CONFIG_DRM_RZG2L_DU)		+= rzg2l-du-drm.o
+
 # 'remote-endpoint' is fixed up at run-time
 DTC_FLAGS_rcar_du_of_lvds_r8a7790 += -Wno-graph_endpoint
 DTC_FLAGS_rcar_du_of_lvds_r8a7791 += -Wno-graph_endpoint
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index 66e8839db708..65c1bf9a7e97 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -21,6 +21,7 @@
 
 struct rcar_du_group;
 struct rcar_du_vsp;
+struct reset_control;
 
 /**
  * struct rcar_du_crtc - the CRTC, representing a DU superposition processor
@@ -28,6 +29,7 @@ struct rcar_du_vsp;
  * @dev: the DU device
  * @clock: the CRTC functional clock
  * @extclock: external pixel dot clock (optional)
+ * @rstc: reset controller (optional)
  * @mmio_offset: offset of the CRTC registers in the DU MMIO block
  * @index: CRTC hardware index
  * @initialized: whether the CRTC has been initialized and clocks enabled
@@ -50,6 +52,7 @@ struct rcar_du_crtc {
 	struct rcar_du_device *dev;
 	struct clk *clock;
 	struct clk *extclock;
+	struct reset_control *rstc;
 	unsigned int mmio_offset;
 	unsigned int index;
 	bool initialized;
@@ -100,4 +103,9 @@ void rcar_du_crtc_finish_page_flip(struct rcar_du_crtc *rcrtc);
 
 void rcar_du_crtc_dsysr_clr_set(struct rcar_du_crtc *rcrtc, u32 clr, u32 set);
 
+int rzg2l_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
+			 unsigned int hwindex);
+
+void rzg2l_du_crtc_finish_page_flip(struct rcar_du_crtc *rcrtc);
+
 #endif /* __RCAR_DU_CRTC_H__ */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.h b/drivers/gpu/drm/rcar-du/rcar_du_plane.h
index 81bbf207ad0e..62caeebf0c76 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.h
@@ -83,4 +83,16 @@ static inline void rcar_du_plane_setup(struct rcar_du_plane *plane)
 	return __rcar_du_plane_setup(plane->group, state);
 }
 
+int rzg2l_du_atomic_check_planes(struct drm_device *dev,
+				 struct drm_atomic_state *state);
+
+int __rzg2l_du_plane_atomic_check(struct drm_plane *plane,
+				  struct drm_plane_state *state,
+				  const struct rcar_du_format_info **format);
+
+int rzg2l_du_planes_init(struct rcar_du_group *rgrp);
+
+void __rzg2l_du_plane_setup(struct rcar_du_group *rgrp,
+			    const struct rcar_du_plane_state *state);
+
 #endif /* __RCAR_DU_PLANE_H__ */
diff --git a/drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c b/drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c
new file mode 100644
index 000000000000..2eeb99c686af
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c
@@ -0,0 +1,705 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * rzg2l_du_crtc.c  --  RZ/G2L DU CRTCs
+ *
+ * Copyright (C) 2022 Renesas Electronics Corporation
+ *
+ * Based on rcar_du_crtc.c
+ */
+
+#include <linux/clk.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+#include <linux/sys_soc.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_device.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_plane_helper.h>
+#include <drm/drm_vblank.h>
+
+#include "rcar_du_crtc.h"
+#include "rcar_du_drv.h"
+#include "rcar_du_encoder.h"
+#include "rcar_du_kms.h"
+#include "rcar_du_plane.h"
+#include "rcar_du_vsp.h"
+#include "rzg2l_du_regs.h"
+
+/* -----------------------------------------------------------------------------
+ * Hardware Setup
+ */
+
+static void rzg2l_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
+{
+	const struct drm_display_mode *mode = &rcrtc->crtc.state->adjusted_mode;
+	struct rcar_du_device *rcdu = rcrtc->dev;
+	unsigned long mode_clock = mode->clock * 1000;
+	u32 ditr0, ditr1, ditr2, ditr3, ditr4, ditr5, pbcr0;
+
+	clk_set_rate(rcrtc->extclock, mode_clock);
+
+	ditr0 = (DU_DITR0_DEMD_HIGH
+		 | ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? DU_DITR0_VSPOL : 0)
+		 | ((mode->flags & DRM_MODE_FLAG_PHSYNC) ? DU_DITR0_HSPOL : 0));
+
+	ditr1 = DU_DITR1_VSA(mode->vsync_end - mode->vsync_start)
+		| DU_DITR1_VACTIVE(mode->vdisplay);
+
+	ditr2 = DU_DITR2_VBP(mode->vtotal - mode->vsync_end)
+		| DU_DITR2_VFP(mode->vsync_start - mode->vdisplay);
+
+	ditr3 = DU_DITR3_HSA(mode->hsync_end - mode->hsync_start)
+		| DU_DITR3_HACTIVE(mode->hdisplay);
+
+	ditr4 = DU_DITR4_HBP(mode->htotal - mode->hsync_end)
+		| DU_DITR4_HFP(mode->hsync_start - mode->hdisplay);
+
+	ditr5 = DU_DITR5_VSFT(0) | DU_DITR5_HSFT(0);
+
+	pbcr0 = DU_PBCR0_PB_DEP(0x1F);
+
+	rcar_du_write(rcdu, DU_DITR0, ditr0);
+	rcar_du_write(rcdu, DU_DITR1, ditr1);
+	rcar_du_write(rcdu, DU_DITR2, ditr2);
+	rcar_du_write(rcdu, DU_DITR3, ditr3);
+	rcar_du_write(rcdu, DU_DITR4, ditr4);
+	rcar_du_write(rcdu, DU_DITR5, ditr5);
+	rcar_du_write(rcdu, DU_PBCR0, pbcr0);
+}
+
+static void rzg2l_du_crtc_update_planes(struct rcar_du_crtc *rcrtc)
+{
+}
+
+/* -----------------------------------------------------------------------------
+ * Page Flip
+ */
+
+void rzg2l_du_crtc_finish_page_flip(struct rcar_du_crtc *rcrtc)
+{
+	struct drm_pending_vblank_event *event;
+	struct drm_device *dev = rcrtc->crtc.dev;
+	unsigned long flags;
+
+	spin_lock_irqsave(&dev->event_lock, flags);
+	event = rcrtc->event;
+	rcrtc->event = NULL;
+	spin_unlock_irqrestore(&dev->event_lock, flags);
+
+	if (!event)
+		return;
+
+	spin_lock_irqsave(&dev->event_lock, flags);
+	drm_crtc_send_vblank_event(&rcrtc->crtc, event);
+	wake_up(&rcrtc->flip_wait);
+	spin_unlock_irqrestore(&dev->event_lock, flags);
+
+	drm_crtc_vblank_put(&rcrtc->crtc);
+}
+
+static bool rzg2l_du_crtc_page_flip_pending(struct rcar_du_crtc *rcrtc)
+{
+	struct drm_device *dev = rcrtc->crtc.dev;
+	unsigned long flags;
+	bool pending;
+
+	spin_lock_irqsave(&dev->event_lock, flags);
+	pending = rcrtc->event;
+	spin_unlock_irqrestore(&dev->event_lock, flags);
+
+	return pending;
+}
+
+static void rzg2l_du_crtc_wait_page_flip(struct rcar_du_crtc *rcrtc)
+{
+	struct rcar_du_device *rcdu = rcrtc->dev;
+
+	if (wait_event_timeout(rcrtc->flip_wait,
+			       !rzg2l_du_crtc_page_flip_pending(rcrtc),
+			       msecs_to_jiffies(50)))
+		return;
+
+	dev_warn(rcdu->dev, "page flip timeout\n");
+
+	rzg2l_du_crtc_finish_page_flip(rcrtc);
+}
+
+/* -----------------------------------------------------------------------------
+ * Start/Stop and Suspend/Resume
+ */
+
+static void rzg2l_du_crtc_setup(struct rcar_du_crtc *rcrtc)
+{
+	/* Configure display timings and output routing */
+	rzg2l_du_crtc_set_display_timing(rcrtc);
+
+	/* Enable the VSP compositor. */
+	rcar_du_vsp_enable(rcrtc);
+
+	/* Turn vertical blanking interrupt reporting on. */
+	drm_crtc_vblank_on(&rcrtc->crtc);
+}
+
+static int rzg2l_du_crtc_get(struct rcar_du_crtc *rcrtc)
+{
+	int ret;
+
+	/*
+	 * Guard against double-get, as the function is called from both the
+	 * .atomic_enable() and .atomic_begin() handlers.
+	 */
+	if (rcrtc->initialized)
+		return 0;
+
+	ret = reset_control_deassert(rcrtc->rstc);
+	if (ret < 0)
+		goto error_reset;
+
+	ret = clk_prepare_enable(rcrtc->clock);
+	if (ret < 0)
+		return ret;
+
+	ret = clk_prepare_enable(rcrtc->extclock);
+	if (ret < 0)
+		goto error_clock;
+
+	rzg2l_du_crtc_setup(rcrtc);
+	rcrtc->initialized = true;
+
+	return 0;
+
+error_clock:
+	clk_disable_unprepare(rcrtc->clock);
+error_reset:
+	reset_control_assert(rcrtc->rstc);
+	return ret;
+}
+
+static void rzg2l_du_crtc_put(struct rcar_du_crtc *rcrtc)
+{
+	clk_disable_unprepare(rcrtc->extclock);
+	clk_disable_unprepare(rcrtc->clock);
+	reset_control_assert(rcrtc->rstc);
+
+	rcrtc->initialized = false;
+}
+
+static void __rzg2l_du_group_start_stop(struct rcar_du_group *rgrp, bool start)
+{
+	rcar_du_write(rgrp->dev, DU_MCR0, start ? DU_MCR0_DI_EN : 0);
+}
+
+static void rzg2l_du_crtc_start(struct rcar_du_crtc *rcrtc)
+{
+	__rzg2l_du_group_start_stop(rcrtc->group, true);
+}
+
+static void rzg2l_du_crtc_disable_planes(struct rcar_du_crtc *rcrtc)
+{
+	struct rcar_du_device *rcdu = rcrtc->dev;
+	struct drm_crtc *crtc = &rcrtc->crtc;
+
+	/* Make sure vblank interrupts are enabled. */
+	drm_crtc_vblank_get(crtc);
+
+	if (!wait_event_timeout(rcrtc->vblank_wait, rcrtc->vblank_count == 0,
+				msecs_to_jiffies(100)))
+		dev_warn(rcdu->dev, "vertical blanking timeout\n");
+
+	drm_crtc_vblank_put(crtc);
+}
+
+static void rzg2l_du_crtc_stop(struct rcar_du_crtc *rcrtc)
+{
+	struct drm_crtc *crtc = &rcrtc->crtc;
+
+	/*
+	 * Disable all planes and wait for the change to take effect. This is
+	 * required as the plane enable registers are updated on vblank, and no
+	 * vblank will occur once the CRTC is stopped. Disabling planes when
+	 * starting the CRTC thus wouldn't be enough as it would start scanning
+	 * out immediately from old frame buffers until the next vblank.
+	 *
+	 * This increases the CRTC stop delay, especially when multiple CRTCs
+	 * are stopped in one operation as we now wait for one vblank per CRTC.
+	 * Whether this can be improved needs to be researched.
+	 */
+	rzg2l_du_crtc_disable_planes(rcrtc);
+
+	/*
+	 * Disable vertical blanking interrupt reporting. We first need to wait
+	 * for page flip completion before stopping the CRTC as userspace
+	 * expects page flips to eventually complete.
+	 */
+	rzg2l_du_crtc_wait_page_flip(rcrtc);
+	drm_crtc_vblank_off(crtc);
+
+	/* Disable the VSP compositor. */
+	rcar_du_vsp_disable(rcrtc);
+
+	__rzg2l_du_group_start_stop(rcrtc->group, false);
+}
+
+/* -----------------------------------------------------------------------------
+ * CRTC Functions
+ */
+
+static int rzg2l_du_crtc_atomic_check(struct drm_crtc *crtc,
+				      struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
+									  crtc);
+	struct rcar_du_crtc_state *rstate = to_rcar_crtc_state(crtc_state);
+	struct drm_encoder *encoder;
+
+	/* Store the routes from the CRTC output to the DU outputs. */
+	rstate->outputs = 0;
+
+	drm_for_each_encoder_mask(encoder, crtc->dev,
+				  crtc_state->encoder_mask) {
+		struct rcar_du_encoder *renc;
+
+		/* Skip the writeback encoder. */
+		if (encoder->encoder_type == DRM_MODE_ENCODER_VIRTUAL)
+			continue;
+
+		renc = to_rcar_encoder(encoder);
+		rstate->outputs |= BIT(renc->output);
+	}
+
+	return 0;
+}
+
+static void rzg2l_du_crtc_atomic_enable(struct drm_crtc *crtc,
+					struct drm_atomic_state *state)
+{
+	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+
+	rzg2l_du_crtc_get(rcrtc);
+
+	rzg2l_du_crtc_start(rcrtc);
+}
+
+static void rzg2l_du_crtc_atomic_disable(struct drm_crtc *crtc,
+					 struct drm_atomic_state *state)
+{
+	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+
+	rzg2l_du_crtc_stop(rcrtc);
+	rzg2l_du_crtc_put(rcrtc);
+
+	spin_lock_irq(&crtc->dev->event_lock);
+	if (crtc->state->event) {
+		drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		crtc->state->event = NULL;
+	}
+	spin_unlock_irq(&crtc->dev->event_lock);
+}
+
+static void rzg2l_du_crtc_atomic_begin(struct drm_crtc *crtc,
+				       struct drm_atomic_state *state)
+{
+	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+
+	WARN_ON(!crtc->state->enable);
+
+	/*
+	 * If a mode set is in progress we can be called with the CRTC disabled.
+	 * We thus need to first get and setup the CRTC in order to configure
+	 * planes. We must *not* put the CRTC in .atomic_flush(), as it must be
+	 * kept awake until the .atomic_enable() call that will follow. The get
+	 * operation in .atomic_enable() will in that case be a no-op, and the
+	 * CRTC will be put later in .atomic_disable().
+	 *
+	 * If a mode set is not in progress the CRTC is enabled, and the
+	 * following get call will be a no-op. There is thus no need to balance
+	 * it in .atomic_flush() either.
+	 */
+	rzg2l_du_crtc_get(rcrtc);
+
+	rcar_du_vsp_atomic_begin(rcrtc);
+}
+
+void rzg2l_du_group_restart(struct rcar_du_group *rgrp)
+{
+	__rzg2l_du_group_start_stop(rgrp, false);
+	__rzg2l_du_group_start_stop(rgrp, true);
+}
+
+static void rzg2l_du_crtc_atomic_flush(struct drm_crtc *crtc,
+				       struct drm_atomic_state *state)
+{
+	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+	struct drm_device *dev = rcrtc->crtc.dev;
+	unsigned long flags;
+
+	rzg2l_du_crtc_update_planes(rcrtc);
+
+	if (crtc->state->event) {
+		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
+
+		spin_lock_irqsave(&dev->event_lock, flags);
+		rcrtc->event = crtc->state->event;
+		crtc->state->event = NULL;
+		spin_unlock_irqrestore(&dev->event_lock, flags);
+	}
+
+	rcar_du_vsp_atomic_flush(rcrtc);
+}
+
+static enum drm_mode_status
+rzg2l_du_crtc_mode_valid(struct drm_crtc *crtc,
+			 const struct drm_display_mode *mode)
+{
+	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+	struct rcar_du_device *rcdu = rcrtc->dev;
+	bool interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE;
+	unsigned int min_sync_porch;
+	unsigned int vbp;
+
+	if (interlaced && !rcar_du_has(rcdu, RCAR_DU_FEATURE_INTERLACED))
+		return MODE_NO_INTERLACE;
+
+	/*
+	 * The hardware requires a minimum combined horizontal sync and back
+	 * porch of 20 pixels (when CMM isn't used) or 45 pixels (when CMM is
+	 * used), and a minimum vertical back porch of 3 lines.
+	 */
+	min_sync_porch = 20;
+
+	if (mode->htotal - mode->hsync_start < min_sync_porch)
+		return MODE_HBLANK_NARROW;
+
+	vbp = (mode->vtotal - mode->vsync_end) / (interlaced ? 2 : 1);
+	if (vbp < 3)
+		return MODE_VBLANK_NARROW;
+
+	return MODE_OK;
+}
+
+static const struct drm_crtc_helper_funcs crtc_helper_funcs = {
+	.atomic_check = rzg2l_du_crtc_atomic_check,
+	.atomic_begin = rzg2l_du_crtc_atomic_begin,
+	.atomic_flush = rzg2l_du_crtc_atomic_flush,
+	.atomic_enable = rzg2l_du_crtc_atomic_enable,
+	.atomic_disable = rzg2l_du_crtc_atomic_disable,
+	.mode_valid = rzg2l_du_crtc_mode_valid,
+};
+
+static void rzg2l_du_crtc_crc_init(struct rcar_du_crtc *rcrtc)
+{
+	const char **sources;
+	unsigned int count;
+	int i = -1;
+
+	/* Reserve 1 for "auto" source. */
+	count = rcrtc->vsp->num_planes + 1;
+
+	sources = kmalloc_array(count, sizeof(*sources), GFP_KERNEL);
+	if (!sources)
+		return;
+
+	sources[0] = kstrdup("auto", GFP_KERNEL);
+	if (!sources[0])
+		goto error;
+
+	for (i = 0; i < rcrtc->vsp->num_planes; ++i) {
+		struct drm_plane *plane = &rcrtc->vsp->planes[i].plane;
+		char name[16];
+
+		sprintf(name, "plane%u", plane->base.id);
+		sources[i + 1] = kstrdup(name, GFP_KERNEL);
+		if (!sources[i + 1])
+			goto error;
+	}
+
+	rcrtc->sources = sources;
+	rcrtc->sources_count = count;
+	return;
+
+error:
+	while (i >= 0) {
+		kfree(sources[i]);
+		i--;
+	}
+	kfree(sources);
+}
+
+static void rzg2l_du_crtc_crc_cleanup(struct rcar_du_crtc *rcrtc)
+{
+	unsigned int i;
+
+	if (!rcrtc->sources)
+		return;
+
+	for (i = 0; i < rcrtc->sources_count; i++)
+		kfree(rcrtc->sources[i]);
+	kfree(rcrtc->sources);
+
+	rcrtc->sources = NULL;
+	rcrtc->sources_count = 0;
+}
+
+static struct drm_crtc_state *
+rzg2l_du_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
+{
+	struct rcar_du_crtc_state *state;
+	struct rcar_du_crtc_state *copy;
+
+	if (WARN_ON(!crtc->state))
+		return NULL;
+
+	state = to_rcar_crtc_state(crtc->state);
+	copy = kmemdup(state, sizeof(*state), GFP_KERNEL);
+	if (!copy)
+		return NULL;
+
+	__drm_atomic_helper_crtc_duplicate_state(crtc, &copy->state);
+
+	return &copy->state;
+}
+
+static void rzg2l_du_crtc_atomic_destroy_state(struct drm_crtc *crtc,
+					       struct drm_crtc_state *state)
+{
+	__drm_atomic_helper_crtc_destroy_state(state);
+	kfree(to_rcar_crtc_state(state));
+}
+
+static void rzg2l_du_crtc_cleanup(struct drm_crtc *crtc)
+{
+	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+
+	rzg2l_du_crtc_crc_cleanup(rcrtc);
+
+	return drm_crtc_cleanup(crtc);
+}
+
+static void rzg2l_du_crtc_reset(struct drm_crtc *crtc)
+{
+	struct rcar_du_crtc_state *state;
+
+	if (crtc->state) {
+		rzg2l_du_crtc_atomic_destroy_state(crtc, crtc->state);
+		crtc->state = NULL;
+	}
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return;
+
+	state->crc.source = VSP1_DU_CRC_NONE;
+	state->crc.index = 0;
+
+	__drm_atomic_helper_crtc_reset(crtc, &state->state);
+}
+
+static int rzg2l_du_crtc_enable_vblank(struct drm_crtc *crtc)
+{
+	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+
+	rcrtc->vblank_enable = true;
+
+	return 0;
+}
+
+static void rzg2l_du_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+
+	rcrtc->vblank_enable = false;
+}
+
+static int rzg2l_du_crtc_parse_crc_source(struct rcar_du_crtc *rcrtc,
+					  const char *source_name,
+					  enum vsp1_du_crc_source *source)
+{
+	unsigned int index;
+	int ret;
+
+	/*
+	 * Parse the source name. Supported values are "plane%u" to compute the
+	 * CRC on an input plane (%u is the plane ID), and "auto" to compute the
+	 * CRC on the composer (VSP) output.
+	 */
+
+	if (!source_name) {
+		*source = VSP1_DU_CRC_NONE;
+		return 0;
+	} else if (!strcmp(source_name, "auto")) {
+		*source = VSP1_DU_CRC_OUTPUT;
+		return 0;
+	} else if (strstarts(source_name, "plane")) {
+		unsigned int i;
+
+		*source = VSP1_DU_CRC_PLANE;
+
+		ret = kstrtouint(source_name + strlen("plane"), 10, &index);
+		if (ret < 0)
+			return ret;
+
+		for (i = 0; i < rcrtc->vsp->num_planes; ++i) {
+			if (index == rcrtc->vsp->planes[i].plane.base.id)
+				return i;
+		}
+	}
+
+	return -EINVAL;
+}
+
+static int rzg2l_du_crtc_verify_crc_source(struct drm_crtc *crtc,
+					   const char *source_name,
+					   size_t *values_cnt)
+{
+	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+	enum vsp1_du_crc_source source;
+
+	if (rzg2l_du_crtc_parse_crc_source(rcrtc, source_name, &source) < 0) {
+		DRM_DEBUG_DRIVER("unknown source %s\n", source_name);
+		return -EINVAL;
+	}
+
+	*values_cnt = 1;
+	return 0;
+}
+
+static const char *const *
+rzg2l_du_crtc_get_crc_sources(struct drm_crtc *crtc, size_t *count)
+{
+	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+
+	*count = rcrtc->sources_count;
+	return rcrtc->sources;
+}
+
+static int rzg2l_du_crtc_set_crc_source(struct drm_crtc *crtc,
+					const char *source_name)
+{
+	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_crtc_state *crtc_state;
+	struct drm_atomic_state *state;
+	enum vsp1_du_crc_source source;
+	unsigned int index;
+	int ret;
+
+	ret = rzg2l_du_crtc_parse_crc_source(rcrtc, source_name, &source);
+	if (ret < 0)
+		return ret;
+
+	index = ret;
+
+	/* Perform an atomic commit to set the CRC source. */
+	drm_modeset_acquire_init(&ctx, 0);
+
+	state = drm_atomic_state_alloc(crtc->dev);
+	if (!state) {
+		ret = -ENOMEM;
+		goto unlock;
+	}
+
+	state->acquire_ctx = &ctx;
+
+retry:
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	if (!IS_ERR(crtc_state)) {
+		struct rcar_du_crtc_state *rcrtc_state;
+
+		rcrtc_state = to_rcar_crtc_state(crtc_state);
+		rcrtc_state->crc.source = source;
+		rcrtc_state->crc.index = index;
+
+		ret = drm_atomic_commit(state);
+	} else {
+		ret = PTR_ERR(crtc_state);
+	}
+
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		drm_modeset_backoff(&ctx);
+		goto retry;
+	}
+
+	drm_atomic_state_put(state);
+
+unlock:
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+
+	return ret;
+}
+
+static const struct drm_crtc_funcs crtc_funcs_rzg2l = {
+	.reset = rzg2l_du_crtc_reset,
+	.destroy = rzg2l_du_crtc_cleanup,
+	.set_config = drm_atomic_helper_set_config,
+	.page_flip = drm_atomic_helper_page_flip,
+	.atomic_duplicate_state = rzg2l_du_crtc_atomic_duplicate_state,
+	.atomic_destroy_state = rzg2l_du_crtc_atomic_destroy_state,
+	.enable_vblank = rzg2l_du_crtc_enable_vblank,
+	.disable_vblank = rzg2l_du_crtc_disable_vblank,
+	.set_crc_source = rzg2l_du_crtc_set_crc_source,
+	.verify_crc_source = rzg2l_du_crtc_verify_crc_source,
+	.get_crc_sources = rzg2l_du_crtc_get_crc_sources,
+};
+
+/* -----------------------------------------------------------------------------
+ * Initialization
+ */
+
+int rzg2l_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
+			 unsigned int hwindex)
+{
+	struct rcar_du_device *rcdu = rgrp->dev;
+	struct rcar_du_crtc *rcrtc = &rcdu->crtcs[swindex];
+	struct drm_crtc *crtc = &rcrtc->crtc;
+	struct drm_plane *primary;
+	struct clk *clk;
+	int ret;
+
+	rcrtc->rstc = devm_reset_control_get_shared(rcdu->dev, NULL);
+	if (IS_ERR(rcrtc->rstc)) {
+		dev_err(rcdu->dev, "can't get cpg reset\n");
+		return PTR_ERR(rcrtc->rstc);
+	}
+
+	rcrtc->clock = devm_clk_get(rcdu->dev, "aclk");
+	if (IS_ERR(rcrtc->clock)) {
+		dev_err(rcdu->dev, "no DU main clock\n");
+		return PTR_ERR(rcrtc->clock);
+	}
+
+	clk = devm_clk_get(rcdu->dev, "vclk");
+	if (!IS_ERR(clk))
+		rcrtc->extclock = clk;
+	else if (PTR_ERR(clk) == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+
+	init_waitqueue_head(&rcrtc->flip_wait);
+	init_waitqueue_head(&rcrtc->vblank_wait);
+	spin_lock_init(&rcrtc->vblank_lock);
+
+	rcrtc->dev = rcdu;
+	rcrtc->group = rgrp;
+	rcrtc->index = hwindex;
+
+	primary = &rcrtc->vsp->planes[rcrtc->vsp_pipe].plane;
+
+	ret = drm_crtc_init_with_planes(&rcdu->ddev, crtc, primary, NULL,
+					&crtc_funcs_rzg2l,
+					NULL);
+	if (ret < 0)
+		return ret;
+
+	drm_crtc_helper_add(crtc, &crtc_helper_funcs);
+
+	rzg2l_du_crtc_crc_init(rcrtc);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/rcar-du/rzg2l_du_drv.c b/drivers/gpu/drm/rcar-du/rzg2l_du_drv.c
new file mode 100644
index 000000000000..bfdaea500e6f
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rzg2l_du_drv.c
@@ -0,0 +1,221 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * rzg2l_du_drv.c  --  RZ/G2L DU DRM driver
+ *
+ * Copyright (C) 2022 Renesas Electronics Corporation
+ *
+ * Based on rcar_du_drv.c
+ */
+
+#include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/io.h>
+#include <linux/mm.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/slab.h>
+#include <linux/wait.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_helper.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_probe_helper.h>
+
+#include "rcar_du_drv.h"
+#include "rcar_du_kms.h"
+
+/* -----------------------------------------------------------------------------
+ * Device Information
+ */
+
+static struct rcar_du_crtc_helper_funcs rzg2l_crtc_helper_funcs = {
+	.du_planes_init = rzg2l_du_planes_init,
+	.du_crtc_create = rzg2l_du_crtc_create,
+	.du_atomic_check_planes = rzg2l_du_atomic_check_planes,
+	.__du_plane_setup = __rzg2l_du_plane_setup,
+	.__du_plane_atomic_check = __rzg2l_du_plane_atomic_check,
+	.du_crtc_finish_page_flip = rzg2l_du_crtc_finish_page_flip,
+};
+
+static const struct rcar_du_device_info rzg2l_du_r9a07g044l_info = {
+	.gen = 3,
+	.features = RCAR_DU_FEATURE_CRTC_IRQ
+		  | RCAR_DU_FEATURE_CRTC_CLOCK
+		  | RCAR_DU_FEATURE_VSP1_SOURCE,
+	.channels_mask = BIT(0),
+	.routes = {
+		[RCAR_DU_OUTPUT_DPAD0] = {
+			.possible_crtcs = BIT(0),
+			.port = 0,
+		},
+		[RCAR_DU_OUTPUT_DSI0] = {
+			.possible_crtcs = BIT(0),
+			.port = 1,
+		},
+	},
+	.num_rpf = 2,
+	.max_width = 1920,
+	.max_height = 1080,
+	.fns = &rzg2l_crtc_helper_funcs,
+};
+
+static const struct of_device_id rzg2l_du_of_table[] = {
+	{ .compatible = "renesas,du-r9a07g044l", .data = &rzg2l_du_r9a07g044l_info },
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, rzg2l_du_of_table);
+
+/* -----------------------------------------------------------------------------
+ * DRM operations
+ */
+
+DEFINE_DRM_GEM_CMA_FOPS(rzg2l_du_fops);
+
+static const struct drm_driver rzg2l_du_driver = {
+	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
+	.dumb_create		= rcar_du_dumb_create,
+	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
+	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
+	.gem_prime_import_sg_table = rcar_du_gem_prime_import_sg_table,
+	.gem_prime_mmap		= drm_gem_prime_mmap,
+	.fops			= &rzg2l_du_fops,
+	.name			= "rzg2l-du",
+	.desc			= "Renesas RZ/G2L DU",
+	.date			= "20220305",
+	.major			= 1,
+	.minor			= 0,
+};
+
+/* -----------------------------------------------------------------------------
+ * Power management
+ */
+
+#ifdef CONFIG_PM_SLEEP
+static int rzg2l_du_pm_suspend(struct device *dev)
+{
+	struct rcar_du_device *rcdu = dev_get_drvdata(dev);
+
+	return drm_mode_config_helper_suspend(&rcdu->ddev);
+}
+
+static int rzg2l_du_pm_resume(struct device *dev)
+{
+	struct rcar_du_device *rcdu = dev_get_drvdata(dev);
+
+	return drm_mode_config_helper_resume(&rcdu->ddev);
+}
+#endif
+
+static const struct dev_pm_ops rzg2l_du_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(rzg2l_du_pm_suspend, rzg2l_du_pm_resume)
+};
+
+/* -----------------------------------------------------------------------------
+ * Platform driver
+ */
+
+static int rzg2l_du_remove(struct platform_device *pdev)
+{
+	struct rcar_du_device *rcdu = platform_get_drvdata(pdev);
+	struct drm_device *ddev = &rcdu->ddev;
+
+	drm_dev_unregister(ddev);
+	drm_atomic_helper_shutdown(ddev);
+
+	drm_kms_helper_poll_fini(ddev);
+
+	return 0;
+}
+
+static void rzg2l_du_shutdown(struct platform_device *pdev)
+{
+	struct rcar_du_device *rcdu = platform_get_drvdata(pdev);
+
+	drm_atomic_helper_shutdown(&rcdu->ddev);
+}
+
+static int rzg2l_du_probe(struct platform_device *pdev)
+{
+	struct rcar_du_device *rcdu;
+	unsigned int mask;
+	int ret;
+
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
+	/* Allocate and initialize the R-Car device structure. */
+	rcdu = devm_drm_dev_alloc(&pdev->dev, &rzg2l_du_driver,
+				  struct rcar_du_device, ddev);
+	if (IS_ERR(rcdu))
+		return PTR_ERR(rcdu);
+
+	rcdu->dev = &pdev->dev;
+	rcdu->info = of_device_get_match_data(rcdu->dev);
+
+	platform_set_drvdata(pdev, rcdu);
+
+	/* I/O resources */
+	rcdu->mmio = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(rcdu->mmio))
+		return PTR_ERR(rcdu->mmio);
+
+	/*
+	 * Set the DMA coherent mask to reflect the DU 32-bit DMA address space
+	 * limitations. When sourcing frames from a VSP the DU doesn't perform
+	 * any memory access so set the mask to 40 bits to accept all buffers.
+	 */
+	mask = rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE) ? 40 : 32;
+	ret = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(mask));
+	if (ret)
+		return ret;
+
+	/* DRM/KMS objects */
+	ret = rcar_du_modeset_init(rcdu);
+	if (ret < 0) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev,
+				"failed to initialize DRM/KMS (%d)\n", ret);
+		goto error;
+	}
+
+	/*
+	 * Register the DRM device with the core and the connectors with
+	 * sysfs.
+	 */
+	ret = drm_dev_register(&rcdu->ddev, 0);
+	if (ret)
+		goto error;
+
+	DRM_INFO("Device %s probed\n", dev_name(&pdev->dev));
+
+	drm_fbdev_generic_setup(&rcdu->ddev, 32);
+
+	return 0;
+
+error:
+	drm_kms_helper_poll_fini(&rcdu->ddev);
+	return ret;
+}
+
+static struct platform_driver rzg2l_du_platform_driver = {
+	.probe		= rzg2l_du_probe,
+	.remove		= rzg2l_du_remove,
+	.shutdown	= rzg2l_du_shutdown,
+	.driver		= {
+		.name	= "rzg2l-du",
+		.pm	= &rzg2l_du_pm_ops,
+		.of_match_table = rzg2l_du_of_table,
+	},
+};
+
+module_platform_driver(rzg2l_du_platform_driver);
+
+MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
+MODULE_DESCRIPTION("Renesas RZ/G2L LCDC DRM Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/rcar-du/rzg2l_du_plane.c b/drivers/gpu/drm/rcar-du/rzg2l_du_plane.c
new file mode 100644
index 000000000000..a736a5f2e7a5
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rzg2l_du_plane.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * rzg2l_du_plane.c  --  RZ/G2L DU Planes
+ *
+ * Copyright (C) 2022 Renesas Electronics Corporation
+ *
+ * Based on rcar_du_plane.c
+ */
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_device.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_plane_helper.h>
+
+#include "rcar_du_drv.h"
+#include "rcar_du_group.h"
+#include "rcar_du_kms.h"
+#include "rcar_du_plane.h"
+
+int rzg2l_du_atomic_check_planes(struct drm_device *dev,
+				 struct drm_atomic_state *state)
+{
+	return 0;
+}
+
+void __rzg2l_du_plane_setup(struct rcar_du_group *rgrp,
+			    const struct rcar_du_plane_state *state)
+{
+}
+
+int __rzg2l_du_plane_atomic_check(struct drm_plane *plane,
+				  struct drm_plane_state *state,
+				  const struct rcar_du_format_info **format)
+{
+	struct drm_device *dev = plane->dev;
+	struct drm_crtc_state *crtc_state;
+	int ret;
+
+	if (!state->crtc) {
+		/*
+		 * The visible field is not reset by the DRM core but only
+		 * updated by drm_plane_helper_check_state(), set it manually.
+		 */
+		state->visible = false;
+		*format = NULL;
+		return 0;
+	}
+
+	crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
+
+	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
+						  DRM_PLANE_HELPER_NO_SCALING,
+						  DRM_PLANE_HELPER_NO_SCALING,
+						  true, true);
+	if (ret < 0)
+		return ret;
+
+	if (!state->visible) {
+		*format = NULL;
+		return 0;
+	}
+
+	*format = rcar_du_format_info(state->fb->format->format);
+	if (*format == NULL) {
+		dev_dbg(dev->dev, "%s: unsupported format %08x\n", __func__,
+			state->fb->format->format);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int rzg2l_du_planes_init(struct rcar_du_group *rgrp)
+{
+	return 0;
+}
diff --git a/drivers/gpu/drm/rcar-du/rzg2l_du_regs.h b/drivers/gpu/drm/rcar-du/rzg2l_du_regs.h
new file mode 100644
index 000000000000..cc2897649cde
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rzg2l_du_regs.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * rzg2l_lcdc_regs.h  --  RZ/G2L LCDC Registers Definitions
+ *
+ * Copyright (C) 2022 Renesas Electronics Corporation
+ *
+ */
+
+#ifndef __RZG2L_DU_REGS_H__
+#define __RZG2L_DU_REGS_H__
+
+/* -----------------------------------------------------------------------------
+ * RZ/G2L Display Registers
+ */
+
+#define DU_MCR0			0x00
+#define DU_MCR0_DPI_OE		BIT(0)
+#define DU_MCR0_DI_EN		BIT(8)
+#define DU_MCR0_PB_CLR		BIT(16)
+
+#define DU_MSR0			0x04
+#define DU_MSR0_ST_DI_BSY	BIT(8)
+#define DU_MSR0_ST_PB_WFULL	BIT(16)
+#define DU_MSR0_ST_PB_WINIT	BIT(18)
+#define DU_MSR0_ST_PB_REMPTY	BIT(20)
+#define DU_MSR0_ST_PB_RUF	BIT(21)
+#define DU_MSR0_ST_PB_RINIT	BIT(22)
+
+#define DU_MSR1			0x08
+
+#define DU_IMR0			0x0C
+#define DU_MSR0_IM_PB_RUF	BIT(0)
+
+#define DU_DITR0		0x10
+#define DU_DITR0_DPI_CLKMD	BIT(0)
+#define DU_DITR0_DEMD_LOW	0x0
+#define DU_DITR0_DEMD_HIGH	(BIT(8) | BIT(9))
+#define DU_DITR0_VSPOL		BIT(16)
+#define DU_DITR0_HSPOL		BIT(17)
+
+#define DU_DITR1		0x14
+#define DU_DITR1_VSA(x)		((x) << 0)
+#define DU_DITR1_VACTIVE(x)	((x) << 16)
+
+#define DU_DITR2		0x18
+#define DU_DITR2_VBP(x)		((x) << 0)
+#define DU_DITR2_VFP(x)		((x) << 16)
+
+#define DU_DITR3		0x1C
+#define DU_DITR3_HSA(x)		((x) << 0)
+#define DU_DITR3_HACTIVE(x)	((x) << 16)
+
+#define DU_DITR4		0x20
+#define DU_DITR4_HBP(x)		((x) << 0)
+#define DU_DITR4_HFP(x)		((x) << 16)
+
+#define DU_DITR5		0x24
+#define DU_DITR5_VSFT(x)	((x) << 0)
+#define DU_DITR5_HSFT(x)	((x) << 16)
+
+#define DU_PBCR0		0x4C
+#define DU_PBCR0_PB_DEP(x)	((x) << 0)
+
+#endif /* __RZG2L_DU_REGS_H__ */
-- 
2.17.1

