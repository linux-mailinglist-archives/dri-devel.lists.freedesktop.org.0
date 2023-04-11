Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 685E86DDA4C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 14:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0265F10E4AC;
	Tue, 11 Apr 2023 12:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2D4FC10E4AC
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 12:08:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.98,336,1673881200"; d="scan'208";a="155600376"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 11 Apr 2023 21:08:31 +0900
Received: from localhost.localdomain (unknown [10.226.93.123])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 223CC40029C6;
 Tue, 11 Apr 2023 21:08:26 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [PATCH v7 3/8] drm: rcar-du: Add RZ/G2L DU Support
Date: Tue, 11 Apr 2023 13:08:05 +0100
Message-Id: <20230411120810.368437-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230411120810.368437-1-biju.das.jz@bp.renesas.com>
References: <20230411120810.368437-1-biju.das.jz@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The LCD controller is composed of Frame Compression Processor (FCPVD),
Video Signal Processor (VSPD), and Display Unit (DU).

It has DPI/DSI interfaces and supports a maximum resolution of 1080p
along with 2 RPFs to support the blending of two picture layers and
raster operations (ROPs).

The DU module is connected to VSPD. Add support for RZ/G2L DU by
creating CRTC/DRM driver specific to RZ/G2L and link with the RCar DU
lib for the common code between both RCar and RZ/G2L.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * rebased to latest drm-tip.
v5->v6:
 * Updated commit description
 * Updated Kconfig
 * Replaced drm_fb_cma_helper->drm_gem_dma_helper
 * Updated header files.
v4->v5:
 * Started using RCar DU libs(kms, vsp and encoder)
 * Started using rcar_du_device, rcar_du_write, rcar_du_crtc,
   rcar_du_format_info and rcar_du_encoder.
v3->v4:
 * Removed rzg2l_du_group.h and struct rzg2l_du_group
 * Renamed __rzg2l_du_group_start_stop->rzg2l_du_start_stop
 * Removed rzg2l_du_group_restart
 * Updated rzg2l_du_crtc_set_display_timing
 * Removed mode_valid callback.
 * Updated rzg2l_du_crtc_create() parameters
 * Updated compatible
 * Removed RZG2L_DU_MAX_GROUPS
v3:
 * New patch after removing all the indirections and by adding
   new DRM driver.
---
 drivers/gpu/drm/rcar-du/Kconfig            |  17 +-
 drivers/gpu/drm/rcar-du/Makefile           |  13 +
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h     |  10 +
 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c    | 716 +++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.h    |  26 +
 drivers/gpu/drm/rcar-du/rzg2l_du_drv.c     | 196 ++++++
 drivers/gpu/drm/rcar-du/rzg2l_du_drv.h     |  20 +
 drivers/gpu/drm/rcar-du/rzg2l_du_encoder.c |  26 +
 drivers/gpu/drm/rcar-du/rzg2l_du_encoder.h |  19 +
 drivers/gpu/drm/rcar-du/rzg2l_du_kms.c     | 157 +++++
 drivers/gpu/drm/rcar-du/rzg2l_du_kms.h     |  17 +
 drivers/gpu/drm/rcar-du/rzg2l_du_regs.h    |  67 ++
 drivers/gpu/drm/rcar-du/rzg2l_du_vsp.c     |  82 +++
 drivers/gpu/drm/rcar-du/rzg2l_du_vsp.h     |  30 +
 14 files changed, 1394 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_crtc.h
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_drv.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_drv.h
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_encoder.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_encoder.h
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_kms.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_kms.h
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_regs.h
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_vsp.c
 create mode 100644 drivers/gpu/drm/rcar-du/rzg2l_du_vsp.h

diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
index 373568a23655..e786a2aeea9a 100644
--- a/drivers/gpu/drm/rcar-du/Kconfig
+++ b/drivers/gpu/drm/rcar-du/Kconfig
@@ -11,6 +11,18 @@ config DRM_RCAR_DU
 	  Choose this option if you have an R-Car chipset.
 	  If M is selected the module will be called rcar-du-drm.
 
+config DRM_RZG2L_DU
+	tristate "DRM Support for RZ/G2L Display Unit"
+	depends on DRM && OF
+	depends on ARM || ARM64
+	depends on ARCH_RZG2L || COMPILE_TEST
+	select DRM_KMS_HELPER
+	select DRM_GEM_DMA_HELPER
+	select VIDEOMODE_HELPERS
+	help
+	  Choose this option if you have an RZ/G2L chipset.
+	  If M is selected the module will be called rzg2l-du-drm.
+
 config DRM_RCAR_USE_CMM
 	bool "R-Car DU Color Management Module (CMM) Support"
 	depends on DRM_RCAR_DU
@@ -71,8 +83,9 @@ config DRM_RZG2L_MIPI_DSI
 config DRM_RCAR_VSP
 	bool "R-Car DU VSP Compositor Support" if ARM
 	default y if ARM64
-	depends on DRM_RCAR_DU
+	depends on DRM_RCAR_DU || DRM_RZG2L_DU
 	depends on VIDEO_RENESAS_VSP1=y || (VIDEO_RENESAS_VSP1 && DRM_RCAR_DU=m)
+	depends on VIDEO_RENESAS_VSP1=y || (VIDEO_RENESAS_VSP1 && DRM_RZG2L_DU=m)
 	help
 	  Enable support to expose the R-Car VSP Compositor as KMS planes.
 
@@ -84,7 +97,7 @@ config DRM_RCAR_WRITEBACK
 config DRM_RCAR_LIB
 	bool
 	default y
-	depends on DRM_RCAR_DU
+	depends on DRM_RCAR_DU || DRM_RZG2L_DU
 
 config DRM_RCAR_VSP_LIB
 	bool
diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
index 8fc924cf37a7..ca905c526469 100644
--- a/drivers/gpu/drm/rcar-du/Makefile
+++ b/drivers/gpu/drm/rcar-du/Makefile
@@ -19,4 +19,17 @@ obj-$(CONFIG_DRM_RCAR_DW_HDMI)		+= rcar_dw_hdmi.o
 obj-$(CONFIG_DRM_RCAR_LVDS)		+= rcar_lvds.o
 obj-$(CONFIG_DRM_RCAR_MIPI_DSI)		+= rcar_mipi_dsi.o
 
+rzg2l-du-drm-y := rzg2l_du_crtc.o \
+		  rzg2l_du_drv.o \
+		  rzg2l_du_encoder.o \
+		  rzg2l_du_kms.o \
+
+rzg2l-du-drm-$(CONFIG_DRM_RCAR_LIB) += rcar_du_encoder_lib.o \
+				       rcar_du_kms_lib.o
+
+rzg2l-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rzg2l_du_vsp.o
+rzg2l-du-drm-$(CONFIG_DRM_RCAR_VSP_LIB)	+= rcar_du_vsp_lib.o
+rzg2l-du-drm-$(CONFIG_DRM_RCAR_WRITEBACK) += rcar_du_writeback.o
+
+obj-$(CONFIG_DRM_RZG2L_DU)		+= rzg2l-du-drm.o
 obj-$(CONFIG_DRM_RZG2L_MIPI_DSI)	+= rzg2l_mipi_dsi.o
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index d0f38a8b3561..07104a8ce507 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -43,6 +43,8 @@ struct rcar_du_vsp;
  * @vsp: VSP feeding video to this CRTC
  * @vsp_pipe: index of the VSP pipeline feeding video to this CRTC
  * @writeback: the writeback connector
+ * @rstc: reset controller
+ * @rzg2l_clocks: the bus, main and video clock
  */
 struct rcar_du_crtc {
 	struct drm_crtc crtc;
@@ -73,6 +75,14 @@ struct rcar_du_crtc {
 	unsigned int sources_count;
 
 	struct drm_writeback_connector writeback;
+
+	/* RZ/G2L specific */
+	struct reset_control *rstc;
+	struct {
+		struct clk *aclk;
+		struct clk *pclk;
+		struct clk *dclk;
+	} rzg2l_clocks;
 };
 
 #define to_rcar_crtc(c)		container_of(c, struct rcar_du_crtc, crtc)
diff --git a/drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c b/drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c
new file mode 100644
index 000000000000..398e8ce9aa7e
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rzg2l_du_crtc.c
@@ -0,0 +1,716 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * RZ/G2L DU CRTCs
+ *
+ * Copyright (C) 2023 Renesas Electronics Corporation
+ *
+ * Based on rcar_du_crtc.c
+ */
+
+#include <linux/clk.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_device.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_vblank.h>
+
+#include "rzg2l_du_crtc.h"
+#include "rzg2l_du_drv.h"
+#include "rzg2l_du_encoder.h"
+#include "rzg2l_du_kms.h"
+#include "rzg2l_du_vsp.h"
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
+	struct clk *parent_clk;
+
+	parent_clk = clk_get_parent(rcrtc->rzg2l_clocks.dclk);
+	clk_set_rate(parent_clk, mode_clock);
+
+	clk_prepare_enable(rcrtc->rzg2l_clocks.dclk);
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
+	pbcr0 = DU_PBCR0_PB_DEP(0x1f);
+
+	rcar_du_write(rcdu, DU_DITR0, ditr0);
+	rcar_du_write(rcdu, DU_DITR1, ditr1);
+	rcar_du_write(rcdu, DU_DITR2, ditr2);
+	rcar_du_write(rcdu, DU_DITR3, ditr3);
+	rcar_du_write(rcdu, DU_DITR4, ditr4);
+	rcar_du_write(rcdu, DU_DITR5, ditr5);
+	rcar_du_write(rcdu, DU_PBCR0, pbcr0);
+
+	/* Enable auto resume when underrun */
+	rcar_du_write(rcdu, DU_MCR1, DU_MCR1_PB_AUTOCLR);
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
+	pending = rcrtc->event != NULL;
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
+	rzg2l_du_vsp_enable(rcrtc);
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
+	ret = clk_prepare_enable(rcrtc->rzg2l_clocks.aclk);
+	if (ret < 0)
+		return ret;
+
+	ret = clk_prepare_enable(rcrtc->rzg2l_clocks.pclk);
+	if (ret < 0)
+		goto error_clock;
+
+	ret = reset_control_deassert(rcrtc->rstc);
+	if (ret < 0)
+		goto error_reset;
+
+	rzg2l_du_crtc_setup(rcrtc);
+	rcrtc->initialized = true;
+
+	return 0;
+
+error_reset:
+	reset_control_assert(rcrtc->rstc);
+	clk_disable_unprepare(rcrtc->rzg2l_clocks.pclk);
+error_clock:
+	clk_disable_unprepare(rcrtc->rzg2l_clocks.aclk);
+	return ret;
+}
+
+static void rzg2l_du_crtc_put(struct rcar_du_crtc *rcrtc)
+{
+	clk_disable_unprepare(rcrtc->rzg2l_clocks.dclk);
+	reset_control_assert(rcrtc->rstc);
+	clk_disable_unprepare(rcrtc->rzg2l_clocks.pclk);
+	clk_disable_unprepare(rcrtc->rzg2l_clocks.aclk);
+
+	rcrtc->initialized = false;
+}
+
+static void rzg2l_du_start_stop(struct rcar_du_crtc *rcrtc, bool start)
+{
+	struct rcar_du_device *rcdu = rcrtc->dev;
+
+	rcar_du_write(rcdu, DU_MCR0, start ? DU_MCR0_DI_EN : 0);
+}
+
+static void rzg2l_du_crtc_start(struct rcar_du_crtc *rcrtc)
+{
+	rzg2l_du_start_stop(rcrtc, true);
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
+	rzg2l_du_start_stop(rcrtc, false);
+}
+
+/* -----------------------------------------------------------------------------
+ * CRTC Functions
+ */
+
+int __rzg2l_du_crtc_plane_atomic_check(struct drm_plane *plane,
+				       struct drm_plane_state *state,
+				       const struct rcar_du_format_info **format)
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
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
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
+static void rzg2l_du_crtc_atomic_flush(struct drm_crtc *crtc,
+				       struct drm_atomic_state *state)
+{
+	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+	struct drm_device *dev = rcrtc->crtc.dev;
+	unsigned long flags;
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
+static const struct drm_crtc_helper_funcs crtc_helper_funcs = {
+	.atomic_check = rzg2l_du_crtc_atomic_check,
+	.atomic_begin = rzg2l_du_crtc_atomic_begin,
+	.atomic_flush = rzg2l_du_crtc_atomic_flush,
+	.atomic_enable = rzg2l_du_crtc_atomic_enable,
+	.atomic_disable = rzg2l_du_crtc_atomic_disable,
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
+int rzg2l_du_crtc_create(struct rcar_du_device *rcdu)
+{
+	struct rcar_du_crtc *rcrtc = &rcdu->crtcs[0];
+	struct drm_crtc *crtc = &rcrtc->crtc;
+	struct drm_plane *primary;
+	int ret;
+
+	rcrtc->rstc = devm_reset_control_get_shared(rcdu->dev, NULL);
+	if (IS_ERR(rcrtc->rstc)) {
+		dev_err(rcdu->dev, "can't get cpg reset\n");
+		return PTR_ERR(rcrtc->rstc);
+	}
+
+	rcrtc->rzg2l_clocks.aclk = devm_clk_get(rcdu->dev, "aclk");
+	if (IS_ERR(rcrtc->rzg2l_clocks.aclk)) {
+		dev_err(rcdu->dev, "no axi clock for DU\n");
+		return PTR_ERR(rcrtc->rzg2l_clocks.aclk);
+	}
+
+	rcrtc->rzg2l_clocks.pclk = devm_clk_get(rcdu->dev, "pclk");
+	if (IS_ERR(rcrtc->rzg2l_clocks.pclk)) {
+		dev_err(rcdu->dev, "no peripheral clock for DU\n");
+		return PTR_ERR(rcrtc->rzg2l_clocks.pclk);
+	}
+
+	rcrtc->rzg2l_clocks.dclk = devm_clk_get(rcdu->dev, "vclk");
+	if (IS_ERR(rcrtc->rzg2l_clocks.dclk)) {
+		dev_err(rcdu->dev, "no video clock for DU\n");
+		return PTR_ERR(rcrtc->rzg2l_clocks.dclk);
+	}
+
+	init_waitqueue_head(&rcrtc->flip_wait);
+	init_waitqueue_head(&rcrtc->vblank_wait);
+	spin_lock_init(&rcrtc->vblank_lock);
+
+	rcrtc->dev = rcdu;
+	rcrtc->index = 0;
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
diff --git a/drivers/gpu/drm/rcar-du/rzg2l_du_crtc.h b/drivers/gpu/drm/rcar-du/rzg2l_du_crtc.h
new file mode 100644
index 000000000000..89c455e5340d
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rzg2l_du_crtc.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * RZ/G2L Display Unit CRTCs
+ *
+ * Copyright (C) 2023 Renesas Electronics Corporation
+ *
+ * Based on rcar_du_crtc.h
+ */
+
+#ifndef __RZG2L_DU_CRTC_H__
+#define __RZG2L_DU_CRTC_H__
+
+#include "rcar_du_crtc.h"
+
+struct rcar_du_format_info;
+struct reset_control;
+
+int rzg2l_du_crtc_create(struct rcar_du_device *rcdu);
+
+void rzg2l_du_crtc_finish_page_flip(struct rcar_du_crtc *rcrtc);
+
+int __rzg2l_du_crtc_plane_atomic_check(struct drm_plane *plane,
+				       struct drm_plane_state *state,
+				       const struct rcar_du_format_info **format);
+
+#endif /* __RZG2L_DU_CRTC_H__ */
diff --git a/drivers/gpu/drm/rcar-du/rzg2l_du_drv.c b/drivers/gpu/drm/rcar-du/rzg2l_du_drv.c
new file mode 100644
index 000000000000..be9aeccbfdc7
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rzg2l_du_drv.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * RZ/G2L DU DRM driver
+ *
+ * Copyright (C) 2023 Renesas Electronics Corporation
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
+#include <drm/drm_fbdev_generic.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_probe_helper.h>
+
+#include "rzg2l_du_drv.h"
+#include "rzg2l_du_kms.h"
+
+/* -----------------------------------------------------------------------------
+ * Device Information
+ */
+
+static const struct rcar_du_device_info rzg2l_du_r9a07g044_info = {
+	.gen = 3,
+	.features = RCAR_DU_FEATURE_CRTC_IRQ
+		  | RCAR_DU_FEATURE_CRTC_CLOCK
+		  | RCAR_DU_FEATURE_VSP1_SOURCE,
+	.channels_mask = BIT(0),
+	.routes = {
+		[RCAR_DU_OUTPUT_DSI0] = {
+			.possible_crtcs = BIT(0),
+			.port = 0,
+		},
+		[RCAR_DU_OUTPUT_DPAD0] = {
+			.possible_crtcs = BIT(0),
+			.port = 1,
+		}
+	},
+	.num_rpf = 2,
+};
+
+static const struct of_device_id rzg2l_du_of_table[] = {
+	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
+	{ /* sentinel */ }
+};
+
+MODULE_DEVICE_TABLE(of, rzg2l_du_of_table);
+
+const char *rzg2l_du_output_name(enum rcar_du_output output)
+{
+	static const char * const names[] = {
+		[RCAR_DU_OUTPUT_DSI0] = "DSI0",
+		[RCAR_DU_OUTPUT_DPAD0] = "DPAD0"
+	};
+
+	if (output != RCAR_DU_OUTPUT_DPAD0 && output != RCAR_DU_OUTPUT_DSI0)
+		return "NOT SUPPORTED";
+
+	if (output >= ARRAY_SIZE(names) || !names[output])
+		return "UNKNOWN";
+
+	return names[output];
+}
+
+/* -----------------------------------------------------------------------------
+ * DRM operations
+ */
+
+DEFINE_DRM_GEM_DMA_FOPS(rzg2l_du_fops);
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
+	.date			= "20230410",
+	.major			= 1,
+	.minor			= 0,
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
+	int ret;
+
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
+	/* Allocate and initialize the RZ/G2L device structure. */
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
+	 * When sourcing frames from a VSP the DU doesn't perform any memory
+	 * access so set the DMA coherent mask to 40 bits to accept all buffers.
+	 */
+	ret = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(40));
+	if (ret)
+		return ret;
+
+	/* DRM/KMS objects */
+	ret = rzg2l_du_modeset_init(rcdu);
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
+		.of_match_table = rzg2l_du_of_table,
+	},
+};
+
+module_platform_driver(rzg2l_du_platform_driver);
+
+MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
+MODULE_DESCRIPTION("Renesas RZ/G2L DU DRM Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/rcar-du/rzg2l_du_drv.h b/drivers/gpu/drm/rcar-du/rzg2l_du_drv.h
new file mode 100644
index 000000000000..414f38a4dad3
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rzg2l_du_drv.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * RZ/G2L Display Unit DRM driver
+ *
+ * Copyright (C) 2023 Renesas Electronics Corporation
+ *
+ * Based on rcar_du_drv.h
+ */
+
+#ifndef __RZG2L_DU_DRV_H__
+#define __RZG2L_DU_DRV_H__
+
+#include "rcar_du_drv.h"
+
+#include "rzg2l_du_crtc.h"
+#include "rzg2l_du_vsp.h"
+
+const char *rzg2l_du_output_name(enum rcar_du_output output);
+
+#endif /* __RZG2L_DU_DRV_H__ */
diff --git a/drivers/gpu/drm/rcar-du/rzg2l_du_encoder.c b/drivers/gpu/drm/rcar-du/rzg2l_du_encoder.c
new file mode 100644
index 000000000000..bebbb362f60d
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rzg2l_du_encoder.c
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * RZ/G2L Display Unit Encoder
+ *
+ * Copyright (C) 2023 Renesas Electronics Corporation
+ *
+ * Based on rcar_du_encoder.c
+ */
+
+#include <linux/export.h>
+#include <linux/of.h>
+
+#include "rzg2l_du_drv.h"
+#include "rzg2l_du_encoder.h"
+
+/* -----------------------------------------------------------------------------
+ * Encoder
+ */
+
+int rzg2l_du_encoder_init(struct rcar_du_device *rcdu,
+			  enum rcar_du_output output,
+			  struct device_node *enc_node)
+{
+	return rcar_du_lib_encoder_init(rcdu, output, enc_node,
+					rzg2l_du_output_name(output));
+}
diff --git a/drivers/gpu/drm/rcar-du/rzg2l_du_encoder.h b/drivers/gpu/drm/rcar-du/rzg2l_du_encoder.h
new file mode 100644
index 000000000000..fc4a2cb6e347
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rzg2l_du_encoder.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * RZ/G2L Display Unit Encoder
+ *
+ * Copyright (C) 2023 Renesas Electronics Corporation
+ *
+ * Based on rcar_du_encoder.h
+ */
+
+#ifndef __RZG2L_DU_ENCODER_H__
+#define __RZG2L_DU_ENCODER_H__
+
+#include "rcar_du_encoder_lib.h"
+
+int rzg2l_du_encoder_init(struct rcar_du_device *rcdu,
+			  enum rcar_du_output output,
+			  struct device_node *enc_node);
+
+#endif /* __RZG2L_DU_ENCODER_H__ */
diff --git a/drivers/gpu/drm/rcar-du/rzg2l_du_kms.c b/drivers/gpu/drm/rcar-du/rzg2l_du_kms.c
new file mode 100644
index 000000000000..0ea7c5b37dd1
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rzg2l_du_kms.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * RZ/G2L Display Unit Mode Setting
+ *
+ * Copyright (C) 2023 Renesas Electronics Corporation
+ *
+ * Based on rcar_du_kms.c
+ */
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_device.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
+
+#include <linux/device.h>
+#include <linux/dma-buf.h>
+#include <linux/of_graph.h>
+#include <linux/of_platform.h>
+#include <linux/wait.h>
+
+#include "rzg2l_du_crtc.h"
+#include "rzg2l_du_drv.h"
+#include "rzg2l_du_encoder.h"
+#include "rzg2l_du_kms.h"
+#include "rzg2l_du_vsp.h"
+#include "rcar_du_writeback.h"
+
+/* -----------------------------------------------------------------------------
+ * Frame buffer
+ */
+
+static struct drm_framebuffer *
+rzg2l_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
+		   const struct drm_mode_fb_cmd2 *mode_cmd)
+{
+	return rcar_du_lib_fb_create(dev, file_priv, mode_cmd);
+}
+
+/* -----------------------------------------------------------------------------
+ * Initialization
+ */
+
+static const struct drm_mode_config_funcs rzg2l_du_mode_config_funcs = {
+	.fb_create = rzg2l_du_fb_create,
+	.atomic_check = drm_atomic_helper_check,
+	.atomic_commit = drm_atomic_helper_commit,
+};
+
+int rzg2l_du_modeset_init(struct rcar_du_device *rcdu)
+{
+	struct drm_device *dev = &rcdu->ddev;
+	struct drm_encoder *encoder;
+	unsigned int dpad0_sources;
+	unsigned int num_encoders;
+	unsigned int i;
+	int ret;
+
+	ret = drmm_mode_config_init(dev);
+	if (ret)
+		return ret;
+
+	dev->mode_config.min_width = 0;
+	dev->mode_config.min_height = 0;
+	dev->mode_config.normalize_zpos = true;
+	dev->mode_config.funcs = &rzg2l_du_mode_config_funcs;
+	dev->mode_config.helper_private = rcar_du_lib_mode_cfg_helper_get();
+
+	/*
+	 * The RZ/G2L DU uses the VSP1 for memory access, and is limited
+	 * to frame sizes of 1920x1080.
+	 */
+	dev->mode_config.max_width = 1920;
+	dev->mode_config.max_height = 1080;
+
+	rcdu->num_crtcs = hweight8(rcdu->info->channels_mask);
+
+	ret = rcar_du_properties_init(rcdu);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * Initialize vertical blanking interrupts handling. Start with vblank
+	 * disabled for all CRTCs.
+	 */
+	ret = drm_vblank_init(dev, rcdu->num_crtcs);
+	if (ret < 0)
+		return ret;
+
+	/* Initialize the compositors. */
+	ret = rcar_du_lib_vsps_init(rcdu, rzg2l_du_vsp_init);
+	if (ret < 0)
+		return ret;
+
+	/* Create the CRTCs. */
+	ret = rzg2l_du_crtc_create(rcdu);
+	if (ret < 0)
+		return ret;
+
+	/* Initialize the encoders. */
+	ret = rcar_du_encoders_init(rcdu, rzg2l_du_output_name,
+				    rzg2l_du_encoder_init);
+	if (ret < 0)
+		return ret;
+
+	if (ret == 0) {
+		dev_err(rcdu->dev, "error: no encoder could be initialized\n");
+		return -EINVAL;
+	}
+
+	num_encoders = ret;
+
+	/*
+	 * Set the possible CRTCs and possible clones. There's always at least
+	 * one way for all encoders to clone each other, set all bits in the
+	 * possible clones field.
+	 */
+	list_for_each_entry(encoder, &dev->mode_config.encoder_list, head) {
+		struct rcar_du_encoder *renc = to_rcar_encoder(encoder);
+		const struct rcar_du_output_routing *route =
+			&rcdu->info->routes[renc->output];
+
+		encoder->possible_crtcs = route->possible_crtcs;
+		encoder->possible_clones = (1 << num_encoders) - 1;
+	}
+
+	/* Create the writeback connectors. */
+	for (i = 0; i < rcdu->num_crtcs; ++i) {
+		struct rcar_du_crtc *rcrtc = &rcdu->crtcs[i];
+
+		ret = rcar_du_writeback_init(rcdu, rcrtc);
+		if (ret < 0)
+			return ret;
+	}
+
+	/*
+	 * Initialize the default DPAD0 source to the index of the first DU
+	 * channel that can be connected to DPAD0. The exact value doesn't
+	 * matter as it should be overwritten by mode setting for the RGB
+	 * output, but it is nonetheless required to ensure a valid initial
+	 * hardware configuration on Gen3 where DU0 can't always be connected to
+	 * DPAD0.
+	 */
+	dpad0_sources = rcdu->info->routes[RCAR_DU_OUTPUT_DPAD0].possible_crtcs;
+	rcdu->dpad0_source = ffs(dpad0_sources) - 1;
+
+	drm_mode_config_reset(dev);
+
+	drm_kms_helper_poll_init(dev);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/rcar-du/rzg2l_du_kms.h b/drivers/gpu/drm/rcar-du/rzg2l_du_kms.h
new file mode 100644
index 000000000000..ab073f3fc5ed
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rzg2l_du_kms.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * RZ/G2L Display Unit Mode Setting
+ *
+ * Copyright (C) 2023 Renesas Electronics Corporation
+ *
+ * Based on rcar_du_kms.h
+ */
+
+#ifndef __RZG2L_DU_KMS_H__
+#define __RZG2L_DU_KMS_H__
+
+#include "rcar_du_kms_lib.h"
+
+int rzg2l_du_modeset_init(struct rcar_du_device *rcdu);
+
+#endif /* __RZG2L_DU_KMS_H__ */
diff --git a/drivers/gpu/drm/rcar-du/rzg2l_du_regs.h b/drivers/gpu/drm/rcar-du/rzg2l_du_regs.h
new file mode 100644
index 000000000000..a32d24884f50
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rzg2l_du_regs.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * RZ/G2L LCDC Registers Definitions
+ *
+ * Copyright (C) 2023 Renesas Electronics Corporation
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
+#define DU_IMR0			0x0c
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
+#define DU_DITR3		0x1c
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
+#define DU_MCR1			0x40
+#define DU_MCR1_PB_AUTOCLR	BIT(16)
+
+#define DU_PBCR0		0x4c
+#define DU_PBCR0_PB_DEP(x)	((x) << 0)
+
+#endif /* __RZG2L_DU_REGS_H__ */
diff --git a/drivers/gpu/drm/rcar-du/rzg2l_du_vsp.c b/drivers/gpu/drm/rcar-du/rzg2l_du_vsp.c
new file mode 100644
index 000000000000..22a8127b4954
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rzg2l_du_vsp.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * RZ/G2L Display Unit VSP-Based Compositor
+ *
+ * Copyright (C) 2023 Renesas Electronics Corporation
+ *
+ * Based on rcar_du_vsp.c
+ */
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_managed.h>
+#include <drm/drm_plane_helper.h>
+#include <drm/drm_vblank.h>
+
+#include <linux/bitops.h>
+#include <linux/of_platform.h>
+#include <linux/scatterlist.h>
+
+#include <media/vsp1.h>
+
+#include "rzg2l_du_drv.h"
+#include "rzg2l_du_kms.h"
+#include "rzg2l_du_vsp.h"
+#include "rcar_du_writeback.h"
+
+static void rzg2l_du_vsp_complete(void *private, unsigned int status, u32 crc)
+{
+	struct rcar_du_crtc *crtc = private;
+
+	if (crtc->vblank_enable)
+		drm_crtc_handle_vblank(&crtc->crtc);
+
+	if (status & VSP1_DU_STATUS_COMPLETE)
+		rzg2l_du_crtc_finish_page_flip(crtc);
+	if (status & VSP1_DU_STATUS_WRITEBACK)
+		rcar_du_writeback_complete(crtc);
+
+	drm_crtc_add_crc_entry(&crtc->crtc, false, 0, &crc);
+}
+
+void rzg2l_du_vsp_enable(struct rcar_du_crtc *crtc)
+{
+	const struct drm_display_mode *mode = &crtc->crtc.state->adjusted_mode;
+	struct vsp1_du_lif_config cfg = {
+		.width = mode->hdisplay,
+		.height = mode->vdisplay,
+		.interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE,
+		.callback = rzg2l_du_vsp_complete,
+		.callback_data = crtc,
+	};
+
+	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
+}
+
+static int rzg2l_du_vsp_plane_atomic_check(struct drm_plane *plane,
+					   struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
+	struct rcar_du_vsp_plane_state *rstate = to_rcar_vsp_plane_state(new_plane_state);
+
+	return __rzg2l_du_crtc_plane_atomic_check(plane, new_plane_state, &rstate->format);
+}
+
+static const struct drm_plane_helper_funcs rzg2l_du_vsp_plane_helper_funcs = {
+	.prepare_fb = rcar_du_vsp_plane_prepare_fb,
+	.cleanup_fb = rcar_du_vsp_plane_cleanup_fb,
+	.atomic_check = rzg2l_du_vsp_plane_atomic_check,
+	.atomic_update = rcar_du_vsp_plane_atomic_update,
+};
+
+int rzg2l_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
+		      unsigned int crtcs)
+{
+	return rcar_du_lib_vsp_init(vsp, np, crtcs,
+				    &rzg2l_du_vsp_plane_helper_funcs);
+}
diff --git a/drivers/gpu/drm/rcar-du/rzg2l_du_vsp.h b/drivers/gpu/drm/rcar-du/rzg2l_du_vsp.h
new file mode 100644
index 000000000000..f768de24dc42
--- /dev/null
+++ b/drivers/gpu/drm/rcar-du/rzg2l_du_vsp.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * RZ/G2L Display Unit VSP-Based Compositor
+ *
+ * Copyright (C) 2023 Renesas Electronics Corporation
+ *
+ * Based on rcar_du_vsp.h
+ */
+
+#ifndef __RZG2L_DU_VSP_H__
+#define __RZG2L_DU_VSP_H__
+
+#include "rcar_du_vsp_lib.h"
+
+#ifdef CONFIG_DRM_RCAR_VSP
+int rzg2l_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
+		      unsigned int crtcs);
+void rzg2l_du_vsp_enable(struct rcar_du_crtc *crtc);
+#else
+static inline int rzg2l_du_vsp_init(struct rcar_du_vsp *vsp,
+				    struct device_node *np,
+				    unsigned int crtcs)
+{
+	return -ENXIO;
+}
+
+static inline void rzg2l_du_vsp_enable(struct rcar_du_crtc *crtc) { };
+#endif
+
+#endif /* __RZG2L_DU_VSP_H__ */
-- 
2.25.1

