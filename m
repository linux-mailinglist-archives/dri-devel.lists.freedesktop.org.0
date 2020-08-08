Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDC023F954
	for <lists+dri-devel@lfdr.de>; Sun,  9 Aug 2020 00:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0F86E2A0;
	Sat,  8 Aug 2020 22:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C3A6E2A0
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Aug 2020 22:31:31 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id b30so2809497lfj.12
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Aug 2020 15:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KqlHLg00lyVSZV4p0J2JVovHWhx7IlF9wtAm1Xa4NoE=;
 b=DI0FwevVui8e4fbUa+QkqDR4VQbZjEMvbzbNhIGrsbkZ5m3soTKqP3CUqi4fovxhJz
 BmVc4Fy7RZB9b+RuB6zqDzFxD1OdsedNl+D4YY7eKXYcB9Gb6eo8UH23tiVZEpNrMyCZ
 vgFmVT0zrtVVOU0btriieG9XRpEXjBgPxVsBTUpwTUFtQqPcb4iJz7qF0BKmI+fjd3xS
 +mKmf74VEt8GW218Qwgt6P4CwnS/4VTN4ujxnDmzlvxIWHVAvYMu4RVb6Hu/oDjS4hKH
 oC0IrtuyyQKq6JxaeqOujaMHcveUwuOI22lJv4A+Ff/c3d+WwY9L7OISlA6x+i9fvAJ2
 j2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KqlHLg00lyVSZV4p0J2JVovHWhx7IlF9wtAm1Xa4NoE=;
 b=Y3s2TehlilkeQEaVIXKPpKTjxtzFwd4+XFSTze9jJBDj9wLCoLrVRmh9PEoSUnh7bp
 JJvCxo78o00YlHAugb/CBCgqwgwx5/uoEMIBBdczWPI5Q+c36KwkpQRVYV1XG63p4K8S
 LA+Hc0Iu/FsyHx/5rHiweT7zNefYJvDetViT0V6fRNTrKhuEbra4PzYNPnIOhKdtl+Zu
 LxeHV+D77J5xxK3A5pdtx1I7i3VO4bjMrevjQc5CDtgq1LCd+87Y9kAi74IQ1yN4bIBz
 0hW5erz7Q64C3R3HqnE4JnxPnFqLNvAtDjwDt0JJAVtx9qY8N12IJ3pWZ/pw+G1vYxj9
 TqOw==
X-Gm-Message-State: AOAM533YDv8jU30rafQ2D/QOQEHEFCLR/ZyM4AwV0geJ4CeD1AfoW8jc
 pL9Eq0CB1xF0yClu46Prg85waaf1foYESg==
X-Google-Smtp-Source: ABdhPJyChzop9clo9qxWl405lKmslYyL1mmTysGrifcdlJxQMuwobXepnmaRalWOYRckYNaPNJRG+g==
X-Received: by 2002:a05:6512:74b:: with SMTP id
 c11mr9339389lfs.119.1596925889362; 
 Sat, 08 Aug 2020 15:31:29 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id x4sm5803827ljd.34.2020.08.08.15.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Aug 2020 15:31:28 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH 3/4 v2] drm/mcde: Fix display pipeline restart
Date: Sun,  9 Aug 2020 00:31:21 +0200
Message-Id: <20200808223122.1492124-3-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200808223122.1492124-1-linus.walleij@linaro.org>
References: <20200808223122.1492124-1-linus.walleij@linaro.org>
MIME-Version: 1.0
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
Cc: newbytee@protonmail.com, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To make sure that the MCDE is in a reasonable state during
set-up, perform a reset by power cycling the block by dropping
the on-chip regulator reference after probe. The display
subsystem (DSS) has no dedicated reset line so dropping
the EPOD regulator is the only real way of resetting it.

We introduce code to enable and disable the regulator in
the display enable/disable callbacks.

We move the generic MCDE setup such as muxing of DPI
signals and masking of interrupts to the display
handling.

When we drop the power to the whole display subsystem, not
only MCDE but also the DSI links lose their state. Therefore
we move the DSI block reset and hardware initialization
code to the mcde_dsi_bridge_pre_enable() callback so this
happens every time we start up the bridge, as we may have
lost the power.

We move the final disablement of the interrupts and
clocks to the mcde_dsi_bridge_post_disable() callback
rather than have it in the mcde_dsi_bridge_disable()
callback, as some control messages may still be sent
over the DSI host after the bridge has been shut down.

This (together with a patch for the corresponding
panel) makes the Samsung GT-S7710 successfully disable
and re-enable its display, cutting all power while
disabled and re-initializing the hardware when coming
back up.

Cc: newbytee@protonmail.com
Cc: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Put the EPOD regulator disable call after registering
  the subcompontents (the DSI ports) but before
  registering the master so we keep the power to the
  MCDE enabled while scanning he hardware but cut
  the power before we fire up the master.
- Increase the power toggle reset time to 50 ms.
- Move the set up of the video mode to the bridge
  pre_enable() callback as well, as we have no clock
  runing when mode_set() is called on the bridge and
  cannot write to the hardware yet.
---
 drivers/gpu/drm/mcde/mcde_display.c | 41 +++++++++++++++
 drivers/gpu/drm/mcde/mcde_drm.h     | 39 +++++++++++++++
 drivers/gpu/drm/mcde/mcde_drv.c     | 78 +++++++----------------------
 drivers/gpu/drm/mcde/mcde_dsi.c     | 57 +++++++++++++--------
 4 files changed, 133 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index cbc7c0c4955a..d608cc894e01 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -7,6 +7,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/dma-buf.h>
+#include <linux/regulator/consumer.h>
 
 #include <drm/drm_device.h>
 #include <drm/drm_fb_cma_helper.h>
@@ -879,6 +880,14 @@ static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
 	u32 formatter_frame;
 	u32 pkt_div;
 	u32 val;
+	int ret;
+
+	/* This powers up the entire MCDE block and the DSI hardware */
+	ret = regulator_enable(mcde->epod);
+	if (ret) {
+		dev_err(drm->dev, "can't re-enable EPOD regulator\n");
+		return;
+	}
 
 	dev_info(drm->dev, "enable MCDE, %d x %d format %s\n",
 		 mode->hdisplay, mode->vdisplay,
@@ -889,6 +898,26 @@ static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
 		return;
 	}
 
+	/* Set up the main control, watermark level at 7 */
+	val = 7 << MCDE_CONF0_IFIFOCTRLWTRMRKLVL_SHIFT;
+	/* 24 bits DPI: connect LSB Ch B to D[0:7] */
+	val |= 3 << MCDE_CONF0_OUTMUX0_SHIFT;
+	/* TV out: connect LSB Ch B to D[8:15] */
+	val |= 3 << MCDE_CONF0_OUTMUX1_SHIFT;
+	/* Don't care about this muxing */
+	val |= 0 << MCDE_CONF0_OUTMUX2_SHIFT;
+	/* 24 bits DPI: connect MID Ch B to D[24:31] */
+	val |= 4 << MCDE_CONF0_OUTMUX3_SHIFT;
+	/* 5: 24 bits DPI: connect MSB Ch B to D[32:39] */
+	val |= 5 << MCDE_CONF0_OUTMUX4_SHIFT;
+	/* Syncmux bits zero: DPI channel A and B on output pins A and B resp */
+	writel(val, mcde->regs + MCDE_CONF0);
+
+	/* Clear any pending interrupts */
+	mcde_display_disable_irqs(mcde);
+	writel(0, mcde->regs + MCDE_IMSCERR);
+	writel(0xFFFFFFFF, mcde->regs + MCDE_RISERR);
+
 	dev_info(drm->dev, "output in %s mode, format %dbpp\n",
 		 (mcde->mdsi->mode_flags & MIPI_DSI_MODE_VIDEO) ?
 		 "VIDEO" : "CMD",
@@ -1005,6 +1034,11 @@ static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
 		dev_dbg(mcde->dev, "started MCDE video FIFO flow\n");
 	}
 
+	/* Enable automatic clock gating */
+	val = readl(mcde->regs + MCDE_CR);
+	val |= MCDE_CR_MCDEEN | MCDE_CR_AUTOCLKG_EN;
+	writel(val, mcde->regs + MCDE_CR);
+
 	dev_info(drm->dev, "MCDE display is enabled\n");
 }
 
@@ -1014,6 +1048,7 @@ static void mcde_display_disable(struct drm_simple_display_pipe *pipe)
 	struct drm_device *drm = crtc->dev;
 	struct mcde *mcde = to_mcde(drm);
 	struct drm_pending_vblank_event *event;
+	int ret;
 
 	drm_crtc_vblank_off(crtc);
 
@@ -1029,6 +1064,12 @@ static void mcde_display_disable(struct drm_simple_display_pipe *pipe)
 		spin_unlock_irq(&crtc->dev->event_lock);
 	}
 
+	ret = regulator_disable(mcde->epod);
+	if (ret)
+		dev_err(drm->dev, "can't disable EPOD regulator\n");
+	/* Make sure we are powered down (before we may power up again) */
+	usleep_range(50000, 70000);
+
 	dev_info(drm->dev, "MCDE display is disabled\n");
 }
 
diff --git a/drivers/gpu/drm/mcde/mcde_drm.h b/drivers/gpu/drm/mcde/mcde_drm.h
index 3e406d783465..9f197f4e9ced 100644
--- a/drivers/gpu/drm/mcde/mcde_drm.h
+++ b/drivers/gpu/drm/mcde/mcde_drm.h
@@ -9,6 +9,45 @@
 #ifndef _MCDE_DRM_H_
 #define _MCDE_DRM_H_
 
+/* Shared basic registers */
+#define MCDE_CR 0x00000000
+#define MCDE_CR_IFIFOEMPTYLINECOUNT_V422_SHIFT 0
+#define MCDE_CR_IFIFOEMPTYLINECOUNT_V422_MASK 0x0000003F
+#define MCDE_CR_IFIFOCTRLEN BIT(15)
+#define MCDE_CR_UFRECOVERY_MODE_V422 BIT(16)
+#define MCDE_CR_WRAP_MODE_V422_SHIFT BIT(17)
+#define MCDE_CR_AUTOCLKG_EN BIT(30)
+#define MCDE_CR_MCDEEN BIT(31)
+
+#define MCDE_CONF0 0x00000004
+#define MCDE_CONF0_SYNCMUX0 BIT(0)
+#define MCDE_CONF0_SYNCMUX1 BIT(1)
+#define MCDE_CONF0_SYNCMUX2 BIT(2)
+#define MCDE_CONF0_SYNCMUX3 BIT(3)
+#define MCDE_CONF0_SYNCMUX4 BIT(4)
+#define MCDE_CONF0_SYNCMUX5 BIT(5)
+#define MCDE_CONF0_SYNCMUX6 BIT(6)
+#define MCDE_CONF0_SYNCMUX7 BIT(7)
+#define MCDE_CONF0_IFIFOCTRLWTRMRKLVL_SHIFT 12
+#define MCDE_CONF0_IFIFOCTRLWTRMRKLVL_MASK 0x00007000
+#define MCDE_CONF0_OUTMUX0_SHIFT 16
+#define MCDE_CONF0_OUTMUX0_MASK 0x00070000
+#define MCDE_CONF0_OUTMUX1_SHIFT 19
+#define MCDE_CONF0_OUTMUX1_MASK 0x00380000
+#define MCDE_CONF0_OUTMUX2_SHIFT 22
+#define MCDE_CONF0_OUTMUX2_MASK 0x01C00000
+#define MCDE_CONF0_OUTMUX3_SHIFT 25
+#define MCDE_CONF0_OUTMUX3_MASK 0x0E000000
+#define MCDE_CONF0_OUTMUX4_SHIFT 28
+#define MCDE_CONF0_OUTMUX4_MASK 0x70000000
+
+#define MCDE_SSP 0x00000008
+#define MCDE_AIS 0x00000100
+#define MCDE_IMSCERR 0x00000110
+#define MCDE_RISERR 0x00000120
+#define MCDE_MISERR 0x00000130
+#define MCDE_SISERR 0x00000140
+
 enum mcde_flow_mode {
 	/* One-shot mode: flow stops after one frame */
 	MCDE_COMMAND_ONESHOT_FLOW,
diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 1671af101cf2..5be558d33553 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -63,6 +63,7 @@
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
+#include <linux/delay.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
@@ -82,44 +83,6 @@
 
 #define DRIVER_DESC	"DRM module for MCDE"
 
-#define MCDE_CR 0x00000000
-#define MCDE_CR_IFIFOEMPTYLINECOUNT_V422_SHIFT 0
-#define MCDE_CR_IFIFOEMPTYLINECOUNT_V422_MASK 0x0000003F
-#define MCDE_CR_IFIFOCTRLEN BIT(15)
-#define MCDE_CR_UFRECOVERY_MODE_V422 BIT(16)
-#define MCDE_CR_WRAP_MODE_V422_SHIFT BIT(17)
-#define MCDE_CR_AUTOCLKG_EN BIT(30)
-#define MCDE_CR_MCDEEN BIT(31)
-
-#define MCDE_CONF0 0x00000004
-#define MCDE_CONF0_SYNCMUX0 BIT(0)
-#define MCDE_CONF0_SYNCMUX1 BIT(1)
-#define MCDE_CONF0_SYNCMUX2 BIT(2)
-#define MCDE_CONF0_SYNCMUX3 BIT(3)
-#define MCDE_CONF0_SYNCMUX4 BIT(4)
-#define MCDE_CONF0_SYNCMUX5 BIT(5)
-#define MCDE_CONF0_SYNCMUX6 BIT(6)
-#define MCDE_CONF0_SYNCMUX7 BIT(7)
-#define MCDE_CONF0_IFIFOCTRLWTRMRKLVL_SHIFT 12
-#define MCDE_CONF0_IFIFOCTRLWTRMRKLVL_MASK 0x00007000
-#define MCDE_CONF0_OUTMUX0_SHIFT 16
-#define MCDE_CONF0_OUTMUX0_MASK 0x00070000
-#define MCDE_CONF0_OUTMUX1_SHIFT 19
-#define MCDE_CONF0_OUTMUX1_MASK 0x00380000
-#define MCDE_CONF0_OUTMUX2_SHIFT 22
-#define MCDE_CONF0_OUTMUX2_MASK 0x01C00000
-#define MCDE_CONF0_OUTMUX3_SHIFT 25
-#define MCDE_CONF0_OUTMUX3_MASK 0x0E000000
-#define MCDE_CONF0_OUTMUX4_SHIFT 28
-#define MCDE_CONF0_OUTMUX4_MASK 0x70000000
-
-#define MCDE_SSP 0x00000008
-#define MCDE_AIS 0x00000100
-#define MCDE_IMSCERR 0x00000110
-#define MCDE_RISERR 0x00000120
-#define MCDE_MISERR 0x00000130
-#define MCDE_SISERR 0x00000140
-
 #define MCDE_PID 0x000001FC
 #define MCDE_PID_METALFIX_VERSION_SHIFT 0
 #define MCDE_PID_METALFIX_VERSION_MASK 0x000000FF
@@ -303,7 +266,6 @@ static int mcde_probe(struct platform_device *pdev)
 	struct component_match *match = NULL;
 	struct resource *res;
 	u32 pid;
-	u32 val;
 	int irq;
 	int ret;
 	int i;
@@ -412,27 +374,7 @@ static int mcde_probe(struct platform_device *pdev)
 		goto clk_disable;
 	}
 
-	/* Set up the main control, watermark level at 7 */
-	val = 7 << MCDE_CONF0_IFIFOCTRLWTRMRKLVL_SHIFT;
-	/* 24 bits DPI: connect LSB Ch B to D[0:7] */
-	val |= 3 << MCDE_CONF0_OUTMUX0_SHIFT;
-	/* TV out: connect LSB Ch B to D[8:15] */
-	val |= 3 << MCDE_CONF0_OUTMUX1_SHIFT;
-	/* Don't care about this muxing */
-	val |= 0 << MCDE_CONF0_OUTMUX2_SHIFT;
-	/* 24 bits DPI: connect MID Ch B to D[24:31] */
-	val |= 4 << MCDE_CONF0_OUTMUX3_SHIFT;
-	/* 5: 24 bits DPI: connect MSB Ch B to D[32:39] */
-	val |= 5 << MCDE_CONF0_OUTMUX4_SHIFT;
-	/* Syncmux bits zero: DPI channel A and B on output pins A and B resp */
-	writel(val, mcde->regs + MCDE_CONF0);
-
-	/* Enable automatic clock gating */
-	val = readl(mcde->regs + MCDE_CR);
-	val |= MCDE_CR_MCDEEN | MCDE_CR_AUTOCLKG_EN;
-	writel(val, mcde->regs + MCDE_CR);
-
-	/* Clear any pending interrupts */
+	/* Disable and clear any pending interrupts */
 	mcde_display_disable_irqs(mcde);
 	writel(0, mcde->regs + MCDE_IMSCERR);
 	writel(0xFFFFFFFF, mcde->regs + MCDE_RISERR);
@@ -462,12 +404,28 @@ static int mcde_probe(struct platform_device *pdev)
 		ret = PTR_ERR(match);
 		goto clk_disable;
 	}
+
+	/*
+	 * Perform an invasive reset of the MCDE and all blocks by
+	 * cutting the power to the subsystem, then bring it back up
+	 * later when we enable the display as a result of
+	 * component_master_add_with_match().
+	 */
+	ret = regulator_disable(mcde->epod);
+	if (ret) {
+		dev_err(dev, "can't disable EPOD regulator\n");
+		return ret;
+	}
+	/* Wait 50 ms so we are sure we cut the power */
+	usleep_range(50000, 70000);
+
 	ret = component_master_add_with_match(&pdev->dev, &mcde_drm_comp_ops,
 					      match);
 	if (ret) {
 		dev_err(dev, "failed to add component master\n");
 		goto clk_disable;
 	}
+
 	return 0;
 
 clk_disable:
diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index e335041e6e90..0d7ebb59b727 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -43,6 +43,7 @@ struct mcde_dsi {
 	struct drm_bridge *bridge_out;
 	struct mipi_dsi_host dsi_host;
 	struct mipi_dsi_device *mdsi;
+	const struct drm_display_mode *mode;
 	struct clk *hs_clk;
 	struct clk *lp_clk;
 	unsigned long hs_freq;
@@ -903,7 +904,25 @@ static void mcde_dsi_bridge_pre_enable(struct drm_bridge *bridge)
 		dev_info(d->dev, "DSI HS clock rate %lu Hz\n",
 			 d->hs_freq);
 
+	/* Assert RESET through the PRCMU, active low */
+	/* FIXME: which DSI block? */
+	regmap_update_bits(d->prcmu, PRCM_DSI_SW_RESET,
+			   PRCM_DSI_SW_RESET_DSI0_SW_RESETN, 0);
+
+	usleep_range(100, 200);
+
+	/* De-assert RESET again */
+	regmap_update_bits(d->prcmu, PRCM_DSI_SW_RESET,
+			   PRCM_DSI_SW_RESET_DSI0_SW_RESETN,
+			   PRCM_DSI_SW_RESET_DSI0_SW_RESETN);
+
+	/* Start up the hardware */
+	mcde_dsi_start(d);
+
 	if (d->mdsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
+		/* Set up the video mode from the DRM mode */
+		mcde_dsi_setup_video_mode(d, d->mode);
+
 		/* Put IF1 into video mode */
 		val = readl(d->regs + DSI_MCTL_MAIN_DATA_CTL);
 		val |= DSI_MCTL_MAIN_DATA_CTL_IF1_MODE;
@@ -944,13 +963,12 @@ static void mcde_dsi_bridge_mode_set(struct drm_bridge *bridge,
 		return;
 	}
 
+	d->mode = mode;
+
 	dev_info(d->dev, "set DSI master to %dx%d %u Hz %s mode\n",
 		 mode->hdisplay, mode->vdisplay, mode->clock * 1000,
 		 (d->mdsi->mode_flags & MIPI_DSI_MODE_VIDEO) ? "VIDEO" : "CMD"
 		);
-
-	if (d->mdsi->mode_flags & MIPI_DSI_MODE_VIDEO)
-		mcde_dsi_setup_video_mode(d, mode);
 }
 
 static void mcde_dsi_wait_for_command_mode_stop(struct mcde_dsi *d)
@@ -999,9 +1017,6 @@ static void mcde_dsi_bridge_disable(struct drm_bridge *bridge)
 	struct mcde_dsi *d = bridge_to_mcde_dsi(bridge);
 	u32 val;
 
-	/* Disable all error interrupts */
-	writel(0, d->regs + DSI_VID_MODE_STS_CTL);
-
 	if (d->mdsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
 		/* Stop video mode */
 		val = readl(d->regs + DSI_MCTL_MAIN_DATA_CTL);
@@ -1012,8 +1027,20 @@ static void mcde_dsi_bridge_disable(struct drm_bridge *bridge)
 		/* Stop command mode */
 		mcde_dsi_wait_for_command_mode_stop(d);
 	}
+}
 
-	/* Stop clocks */
+static void mcde_dsi_bridge_post_disable(struct drm_bridge *bridge)
+{
+	struct mcde_dsi *d = bridge_to_mcde_dsi(bridge);
+
+	/*
+	 * Stop clocks and terminate any DSI traffic here so the panel can
+	 * send commands to shut down the display using DSI direct write until
+	 * this point.
+	 */
+
+	/* Disable all error interrupts */
+	writel(0, d->regs + DSI_VID_MODE_STS_CTL);
 	clk_disable_unprepare(d->hs_clk);
 	clk_disable_unprepare(d->lp_clk);
 }
@@ -1046,6 +1073,7 @@ static const struct drm_bridge_funcs mcde_dsi_bridge_funcs = {
 	.disable = mcde_dsi_bridge_disable,
 	.enable = mcde_dsi_bridge_enable,
 	.pre_enable = mcde_dsi_bridge_pre_enable,
+	.post_disable = mcde_dsi_bridge_post_disable,
 };
 
 static int mcde_dsi_bind(struct device *dev, struct device *master,
@@ -1081,21 +1109,6 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 		return PTR_ERR(d->lp_clk);
 	}
 
-	/* Assert RESET through the PRCMU, active low */
-	/* FIXME: which DSI block? */
-	regmap_update_bits(d->prcmu, PRCM_DSI_SW_RESET,
-			   PRCM_DSI_SW_RESET_DSI0_SW_RESETN, 0);
-
-	usleep_range(100, 200);
-
-	/* De-assert RESET again */
-	regmap_update_bits(d->prcmu, PRCM_DSI_SW_RESET,
-			   PRCM_DSI_SW_RESET_DSI0_SW_RESETN,
-			   PRCM_DSI_SW_RESET_DSI0_SW_RESETN);
-
-	/* Start up the hardware */
-	mcde_dsi_start(d);
-
 	/* Look for a panel as a child to this node */
 	for_each_available_child_of_node(dev->of_node, child) {
 		panel = of_drm_find_panel(child);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
