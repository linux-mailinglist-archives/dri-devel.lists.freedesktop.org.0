Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 615AA23CB92
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 16:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E756E7F1;
	Wed,  5 Aug 2020 14:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E6A6E7F1
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 14:46:36 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id h19so47998306ljg.13
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Aug 2020 07:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H8wYoeIxbaP2nC4X2lYPZc4xVuqW+aZvBABnloT7ihE=;
 b=VtaZkGt7/kTjJ+OBRhORr/Gwpwuq2mL3sGT8xeJ0mLQCISlFKPeExotacBkhQybcpv
 +S9SctgWNPbaXpnSw6E36G2Kaq8n6OvtZ5p1Gi6qWCjfPy9z74dTbep9o1R1lzg3HpQA
 qs+nmFFac/ZeTE6Pm9rv/cMaLSEd0vJx0joNZYAf+Qj2O3Na3EJyhtYTvSrbgb0+i8Ed
 e1cVNdCJUHqcDxaU7tLwnny7dHLfGSOedpT8bqkZo6cjq/yHaCDCpVc60lSPmDbs2THt
 0C8HRn7ukTXHXvtFBIdft6pP42ddralhm2Vvhce1cR8ORUTkxjviImPX46Hk2VqMh0FP
 eMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H8wYoeIxbaP2nC4X2lYPZc4xVuqW+aZvBABnloT7ihE=;
 b=GE1W/UoudeU02h6Vgcd0RmfUTdeDWE7F6i6FwZony8Jwg7aOBvygDrfPCvVieqAwJF
 1KpZMTLgkB6nk0zBqsHMDHd3QKDC32nXZx76q51Mzm6Oh4AuRnla8c8yIbfHoK4ChJTN
 waKpgOxdALIvIVabfYS9qx+Ft/WSMArni92G1ueUmDx7U/UJ/n8ilKO2pwu3rPoO9rEh
 YGt93DI0WKRwKSc4rs7nTRHriIzt9yvCyJQvjUwf1wqnGVrRrYF3/MdVlSVrvYIZXnA9
 6eaGTQqHIF8DtcYhzoNjQEj+f35cIGiFzKtnlezK5Qyjd+ZSy7Wb6vi/lXTVwnLsfTFJ
 8svw==
X-Gm-Message-State: AOAM533OsodmbpbKP0g7fIEakPrrPX5QZo00OeA87s+U4Q8YUeP+gmzL
 2SO3MVpf5+GEeslL75Kd52ok/gV8zls9tQ==
X-Google-Smtp-Source: ABdhPJyhCuS7RoAOxgLF0wPSver3mzhJvKlkiwM8ehxgvRXcmKiK1WCvq5iJwl4jW52YcQKK5U8OPw==
X-Received: by 2002:a2e:b4e5:: with SMTP id s5mr1549069ljm.153.1596638794863; 
 Wed, 05 Aug 2020 07:46:34 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id n29sm1298855lfi.9.2020.08.05.07.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 07:46:34 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/mcde: Fix display pipeline restart
Date: Wed,  5 Aug 2020 16:46:28 +0200
Message-Id: <20200805144628.672286-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
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
Cc: Stephan Gerhold <stephan@gerhold.net>, linux-arm-kernel@lists.infradead.org
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

Cc: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpu/drm/mcde/mcde_display.c | 16 ++++++++++
 drivers/gpu/drm/mcde/mcde_drv.c     | 14 +++++++++
 drivers/gpu/drm/mcde/mcde_dsi.c     | 48 +++++++++++++++++------------
 3 files changed, 59 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index 897d29e318d3..99d33fde3293 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -7,6 +7,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/dma-buf.h>
+#include <linux/regulator/consumer.h>
 
 #include <drm/drm_device.h>
 #include <drm/drm_fb_cma_helper.h>
@@ -873,6 +874,14 @@ static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
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
@@ -1008,6 +1017,7 @@ static void mcde_display_disable(struct drm_simple_display_pipe *pipe)
 	struct drm_device *drm = crtc->dev;
 	struct mcde *mcde = to_mcde(drm);
 	struct drm_pending_vblank_event *event;
+	int ret;
 
 	drm_crtc_vblank_off(crtc);
 
@@ -1023,6 +1033,12 @@ static void mcde_display_disable(struct drm_simple_display_pipe *pipe)
 		spin_unlock_irq(&crtc->dev->event_lock);
 	}
 
+	ret = regulator_disable(mcde->epod);
+	if (ret)
+		dev_err(drm->dev, "can't disable EPOD regulator\n");
+	/* Make sure we are powered down (before we may power up again) */
+	usleep_range(1000, 1500);
+
 	dev_info(drm->dev, "MCDE display is disabled\n");
 }
 
diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 1671af101cf2..ad90a2c2467f 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -63,6 +63,7 @@
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
+#include <linux/delay.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
@@ -468,6 +469,19 @@ static int mcde_probe(struct platform_device *pdev)
 		dev_err(dev, "failed to add component master\n");
 		goto clk_disable;
 	}
+
+	/*
+	 * Perform an invasive reset of the MCDE and all blocks by
+	 * cutting the power to the subsystem, then bring it back up
+	 * later when we enable the display.
+	 */
+	ret = regulator_disable(mcde->epod);
+	if (ret) {
+		dev_err(dev, "can't disable EPOD regulator\n");
+		return ret;
+	}
+	usleep_range(1000, 1500);
+
 	return 0;
 
 clk_disable:
diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 9063a5f5e8bf..92b1d037ed1c 100644
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -902,6 +902,21 @@ static void mcde_dsi_bridge_pre_enable(struct drm_bridge *bridge)
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
 		/* Put IF1 into video mode */
 		val = readl(d->regs + DSI_MCTL_MAIN_DATA_CTL);
@@ -998,9 +1013,6 @@ static void mcde_dsi_bridge_disable(struct drm_bridge *bridge)
 	struct mcde_dsi *d = bridge_to_mcde_dsi(bridge);
 	u32 val;
 
-	/* Disable all error interrupts */
-	writel(0, d->regs + DSI_VID_MODE_STS_CTL);
-
 	if (d->mdsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
 		/* Stop video mode */
 		val = readl(d->regs + DSI_MCTL_MAIN_DATA_CTL);
@@ -1011,8 +1023,20 @@ static void mcde_dsi_bridge_disable(struct drm_bridge *bridge)
 		/* Stop command mode */
 		mcde_dsi_wait_for_command_mode_stop(d);
 	}
+}
+
+static void mcde_dsi_bridge_post_disable(struct drm_bridge *bridge)
+{
+	struct mcde_dsi *d = bridge_to_mcde_dsi(bridge);
+
+	/*
+	 * Stop clocks and terminate any DSI traffic here so the panel can
+	 * send commands to shut down the display using DSI direct write until
+	 * this point.
+	 */
 
-	/* Stop clocks */
+	/* Disable all error interrupts */
+	writel(0, d->regs + DSI_VID_MODE_STS_CTL);
 	clk_disable_unprepare(d->hs_clk);
 	clk_disable_unprepare(d->lp_clk);
 }
@@ -1045,6 +1069,7 @@ static const struct drm_bridge_funcs mcde_dsi_bridge_funcs = {
 	.disable = mcde_dsi_bridge_disable,
 	.enable = mcde_dsi_bridge_enable,
 	.pre_enable = mcde_dsi_bridge_pre_enable,
+	.post_disable = mcde_dsi_bridge_post_disable,
 };
 
 static int mcde_dsi_bind(struct device *dev, struct device *master,
@@ -1080,21 +1105,6 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
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
