Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C601048CA37
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 18:47:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ABFA10E779;
	Wed, 12 Jan 2022 17:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id BAF1E10E7A1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 17:47:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.88,282,1635174000"; d="scan'208";a="106824748"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 13 Jan 2022 02:47:06 +0900
Received: from localhost.localdomain (unknown [10.226.92.38])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id D4E2D4005E1F;
 Thu, 13 Jan 2022 02:47:03 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [RFC 18/28] drm: rcar-du: Add RZ/G2L LCDC Support
Date: Wed, 12 Jan 2022 17:46:02 +0000
Message-Id: <20220112174612.10773-19-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
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
along with 2 rpf's to support blending of two picture layers and
raster operations (ROPs).

A feature bit for RZ/G2L SoC is introduced to support RZ/G2L with
the rest of the SoC supported by this driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 148 ++++++++++++++++++------
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h  |   2 +
 drivers/gpu/drm/rcar-du/rcar_du_drv.c   |  23 ++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.h   |   1 +
 drivers/gpu/drm/rcar-du/rcar_du_group.c |   5 +
 drivers/gpu/drm/rcar-du/rcar_du_regs.h  |  52 +++++++++
 6 files changed, 195 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 521446890d3d..aea9178f3e7d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -10,6 +10,7 @@
 #include <linux/clk.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 #include <linux/sys_soc.h>
 
 #include <drm/drm_atomic.h>
@@ -219,6 +220,42 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 	u32 dsmr;
 	u32 escr;
 
+	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_RZG2L)) {
+		u32 ditr0, ditr1, ditr2, ditr3, ditr4, ditr5, pbcr0;
+
+		clk_set_rate(rcrtc->extclock, mode_clock);
+
+		ditr0 = (DU_DITR0_DEMD_HIGH
+		| ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? DU_DITR0_VSPOL : 0)
+		| ((mode->flags & DRM_MODE_FLAG_PHSYNC) ? DU_DITR0_HSPOL : 0));
+
+		ditr1 = DU_DITR1_VSA(mode->vsync_end - mode->vsync_start)
+		      | DU_DITR1_VACTIVE(mode->vdisplay);
+
+		ditr2 = DU_DITR2_VBP(mode->vtotal - mode->vsync_end)
+		      | DU_DITR2_VFP(mode->vsync_start - mode->vdisplay);
+
+		ditr3 = DU_DITR3_HSA(mode->hsync_end - mode->hsync_start)
+		      | DU_DITR3_HACTIVE(mode->hdisplay);
+
+		ditr4 = DU_DITR4_HBP(mode->htotal - mode->hsync_end)
+		      | DU_DITR4_HFP(mode->hsync_start - mode->hdisplay);
+
+		ditr5 = DU_DITR5_VSFT(0) | DU_DITR5_HSFT(0);
+
+		pbcr0 = DU_PBCR0_PB_DEP(0x1F);
+
+		rcar_du_write(rcdu, DU_DITR0, ditr0);
+		rcar_du_write(rcdu, DU_DITR1, ditr1);
+		rcar_du_write(rcdu, DU_DITR2, ditr2);
+		rcar_du_write(rcdu, DU_DITR3, ditr3);
+		rcar_du_write(rcdu, DU_DITR4, ditr4);
+		rcar_du_write(rcdu, DU_DITR5, ditr5);
+		rcar_du_write(rcdu, DU_PBCR0, pbcr0);
+
+		return;
+	}
+
 	if (rcdu->info->dpll_mask & (1 << rcrtc->index)) {
 		unsigned long target = mode_clock;
 		struct dpll_info dpll = { 0 };
@@ -531,16 +568,23 @@ static void rcar_du_cmm_setup(struct drm_crtc *crtc)
 
 static void rcar_du_crtc_setup(struct rcar_du_crtc *rcrtc)
 {
-	/* Set display off and background to black */
-	rcar_du_crtc_write(rcrtc, DOOR, DOOR_RGB(0, 0, 0));
-	rcar_du_crtc_write(rcrtc, BPOR, BPOR_RGB(0, 0, 0));
+	struct rcar_du_device *rcdu = rcrtc->dev;
 
-	/* Configure display timings and output routing */
-	rcar_du_crtc_set_display_timing(rcrtc);
-	rcar_du_group_set_routing(rcrtc->group);
+	if (!rcar_du_has(rcdu, RCAR_DU_FEATURE_RZG2L)) {
+		/* Set display off and background to black */
+		rcar_du_crtc_write(rcrtc, DOOR, DOOR_RGB(0, 0, 0));
+		rcar_du_crtc_write(rcrtc, BPOR, BPOR_RGB(0, 0, 0));
 
-	/* Start with all planes disabled. */
-	rcar_du_group_write(rcrtc->group, rcrtc->index % 2 ? DS2PR : DS1PR, 0);
+		/* Configure display timings and output routing */
+		rcar_du_crtc_set_display_timing(rcrtc);
+		rcar_du_group_set_routing(rcrtc->group);
+
+		/* Start with all planes disabled. */
+		rcar_du_group_write(rcrtc->group, rcrtc->index % 2 ? DS2PR : DS1PR, 0);
+	} else {
+		/* Configure display timings and output routing */
+		rcar_du_crtc_set_display_timing(rcrtc);
+	}
 
 	/* Enable the VSP compositor. */
 	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
@@ -561,6 +605,12 @@ static int rcar_du_crtc_get(struct rcar_du_crtc *rcrtc)
 	if (rcrtc->initialized)
 		return 0;
 
+	if (rcrtc->rstc) {
+		ret = reset_control_deassert(rcrtc->rstc);
+		if (ret < 0)
+			goto error_reset;
+	}
+
 	ret = clk_prepare_enable(rcrtc->clock);
 	if (ret < 0)
 		return ret;
@@ -582,6 +632,9 @@ static int rcar_du_crtc_get(struct rcar_du_crtc *rcrtc)
 	clk_disable_unprepare(rcrtc->extclock);
 error_clock:
 	clk_disable_unprepare(rcrtc->clock);
+error_reset:
+	if (rcrtc->rstc)
+		reset_control_assert(rcrtc->rstc);
 	return ret;
 }
 
@@ -591,23 +644,28 @@ static void rcar_du_crtc_put(struct rcar_du_crtc *rcrtc)
 
 	clk_disable_unprepare(rcrtc->extclock);
 	clk_disable_unprepare(rcrtc->clock);
+	if (rcrtc->rstc)
+		reset_control_assert(rcrtc->rstc);
 
 	rcrtc->initialized = false;
 }
 
 static void rcar_du_crtc_start(struct rcar_du_crtc *rcrtc)
 {
+	struct rcar_du_device *rcdu = rcrtc->dev;
 	bool interlaced;
 
-	/*
-	 * Select master sync mode. This enables display operation in master
-	 * sync mode (with the HSYNC and VSYNC signals configured as outputs and
-	 * actively driven).
-	 */
-	interlaced = rcrtc->crtc.mode.flags & DRM_MODE_FLAG_INTERLACE;
-	rcar_du_crtc_dsysr_clr_set(rcrtc, DSYSR_TVM_MASK | DSYSR_SCM_MASK,
-				   (interlaced ? DSYSR_SCM_INT_VIDEO : 0) |
-				   DSYSR_TVM_MASTER);
+	if (!rcar_du_has(rcdu, RCAR_DU_FEATURE_RZG2L)) {
+		/*
+		 * Select master sync mode. This enables display operation in master
+		 * sync mode (with the HSYNC and VSYNC signals configured as outputs and
+		 * actively driven).
+		 */
+		interlaced = rcrtc->crtc.mode.flags & DRM_MODE_FLAG_INTERLACE;
+		rcar_du_crtc_dsysr_clr_set(rcrtc, DSYSR_TVM_MASK | DSYSR_SCM_MASK,
+					   (interlaced ? DSYSR_SCM_INT_VIDEO : 0) |
+					   DSYSR_TVM_MASTER);
+	}
 
 	rcar_du_group_start_stop(rcrtc->group, true);
 }
@@ -1229,6 +1287,14 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
 		name = NULL;
 	}
 
+	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_RZG2L)) {
+		rcrtc->rstc = devm_reset_control_get_shared(rcdu->dev, NULL);
+		if (IS_ERR(rcrtc->rstc)) {
+			dev_err(rcdu->dev, "can't get cpg reset\n");
+			return PTR_ERR(rcrtc->rstc);
+		}
+	}
+
 	rcrtc->clock = devm_clk_get(rcdu->dev, name);
 	if (IS_ERR(rcrtc->clock)) {
 		dev_err(rcdu->dev, "no clock for DU channel %u\n", hwindex);
@@ -1251,6 +1317,14 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
 		return ret;
 	}
 
+	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_RZG2L)) {
+		clk = devm_clk_get(rcdu->dev, "vclk");
+		if (!IS_ERR(clk))
+			rcrtc->extclock = clk;
+		else if (PTR_ERR(clk) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+	}
+
 	init_waitqueue_head(&rcrtc->flip_wait);
 	init_waitqueue_head(&rcrtc->vblank_wait);
 	spin_lock_init(&rcrtc->vblank_lock);
@@ -1287,27 +1361,29 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
 
 	drm_crtc_helper_add(crtc, &crtc_helper_funcs);
 
-	/* Register the interrupt handler. */
-	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_CRTC_IRQ)) {
-		/* The IRQ's are associated with the CRTC (sw)index. */
-		irq = platform_get_irq(pdev, swindex);
-		irqflags = 0;
-	} else {
-		irq = platform_get_irq(pdev, 0);
-		irqflags = IRQF_SHARED;
-	}
+	if (!rcar_du_has(rcdu, RCAR_DU_FEATURE_RZG2L)) {
+		/* Register the interrupt handler. */
+		if (rcar_du_has(rcdu, RCAR_DU_FEATURE_CRTC_IRQ)) {
+			/* The IRQ's are associated with the CRTC (sw)index. */
+			irq = platform_get_irq(pdev, swindex);
+			irqflags = 0;
+		} else {
+			irq = platform_get_irq(pdev, 0);
+			irqflags = IRQF_SHARED;
+		}
 
-	if (irq < 0) {
-		dev_err(rcdu->dev, "no IRQ for CRTC %u\n", swindex);
-		return irq;
-	}
+		if (irq < 0) {
+			dev_err(rcdu->dev, "no IRQ for CRTC %u\n", swindex);
+			return irq;
+		}
 
-	ret = devm_request_irq(rcdu->dev, irq, rcar_du_crtc_irq, irqflags,
-			       dev_name(rcdu->dev), rcrtc);
-	if (ret < 0) {
-		dev_err(rcdu->dev,
-			"failed to register IRQ for CRTC %u\n", swindex);
-		return ret;
+		ret = devm_request_irq(rcdu->dev, irq, rcar_du_crtc_irq, irqflags,
+				       dev_name(rcdu->dev), rcrtc);
+		if (ret < 0) {
+			dev_err(rcdu->dev,
+				"failed to register IRQ for CRTC %u\n", swindex);
+			return ret;
+		}
 	}
 
 	rcar_du_crtc_crc_init(rcrtc);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
index 66e8839db708..4ec2db46b131 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
@@ -28,6 +28,7 @@ struct rcar_du_vsp;
  * @dev: the DU device
  * @clock: the CRTC functional clock
  * @extclock: external pixel dot clock (optional)
+ * @rstc: reset controller (optional)
  * @mmio_offset: offset of the CRTC registers in the DU MMIO block
  * @index: CRTC hardware index
  * @initialized: whether the CRTC has been initialized and clocks enabled
@@ -50,6 +51,7 @@ struct rcar_du_crtc {
 	struct rcar_du_device *dev;
 	struct clk *clock;
 	struct clk *extclock;
+	struct reset_control *rstc;
 	unsigned int mmio_offset;
 	unsigned int index;
 	bool initialized;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index f92636001f10..57edc3b3154f 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -596,6 +596,28 @@ static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
 	.dsi_clk_mask =  BIT(1) | BIT(0),
 };
 
+static const struct rcar_du_device_info rcar_du_r9a07g044l_info = {
+	.gen = 3,
+	.features = RCAR_DU_FEATURE_CRTC_IRQ
+		  | RCAR_DU_FEATURE_CRTC_CLOCK
+		  | RCAR_DU_FEATURE_RZG2L
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
+};
+
 static const struct of_device_id rcar_du_of_table[] = {
 	{ .compatible = "renesas,du-r8a7742", .data = &rcar_du_r8a7790_info },
 	{ .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
@@ -621,6 +643,7 @@ static const struct of_device_id rcar_du_of_table[] = {
 	{ .compatible = "renesas,du-r8a77990", .data = &rcar_du_r8a7799x_info },
 	{ .compatible = "renesas,du-r8a77995", .data = &rcar_du_r8a7799x_info },
 	{ .compatible = "renesas,du-r8a779a0", .data = &rcar_du_r8a779a0_info },
+	{ .compatible = "renesas,du-r9a07g044l", .data = &rcar_du_r9a07g044l_info },
 	{ }
 };
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index e28c2df66f8e..47da9da71bca 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -33,6 +33,7 @@ struct rcar_du_device;
 #define RCAR_DU_FEATURE_TVM_SYNC	BIT(4)	/* Has TV switch/sync modes */
 #define RCAR_DU_FEATURE_PLANE		BIT(5)	/* HW supports DU planes */
 #define RCAR_DU_FEATURE_GROUP		BIT(6)	/* HW supports DU groups */
+#define RCAR_DU_FEATURE_RZG2L		BIT(7)	/* Use RZ/G2L registers */
 
 #define RCAR_DU_QUIRK_ALIGN_128B	BIT(0)	/* Align pitches to 128 bytes */
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index 3612bc9eab1b..632271c2881d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -224,6 +224,11 @@ static void __rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool start)
 {
 	struct rcar_du_device *rcdu = rgrp->dev;
 
+	if (!rcar_du_has(rgrp->dev, RCAR_DU_FEATURE_GROUP)) {
+		rcar_du_write(rgrp->dev, DU_MCR0, start ? DU_MCR0_DI_EN : 0);
+		return;
+	}
+
 	/*
 	 * Group start/stop is controlled by the DRES and DEN bits of DSYSR0
 	 * for the first group and DSYSR2 for the second group. On most DU
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
index 1cdaa51eb9ac..9e5c8d286bfc 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
@@ -15,6 +15,58 @@
 #define DU2_REG_OFFSET		0x40000
 #define DU3_REG_OFFSET		0x70000
 
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
 /* -----------------------------------------------------------------------------
  * Display Control Registers
  */
-- 
2.17.1

