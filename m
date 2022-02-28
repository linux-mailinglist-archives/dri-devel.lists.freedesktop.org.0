Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B08E14C6038
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 01:47:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD0810E24D;
	Mon, 28 Feb 2022 00:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8119310E225
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 00:46:43 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 72E4383A45;
 Mon, 28 Feb 2022 01:46:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1646009201;
 bh=QeMjNwm07tzx3hS9Y6txbXz3qEAe15cgYi1K/MTpAMA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0Ej57pmIgzwecQYeuQZezH0qCrAuBIyouUh2IZFbEvtEifTwLZpokgiV40mOXoGJP
 fvx+eB470dliAIdTBzBcVSfATY1ucjcJL6RmgWxGO5cdpRruk03/V8QzJyDQ+vdD+e
 uXKiK1oOEXtzrp1m5I5A+mTtdHS714MjPUafYVVKGEnQV7FvVcsYocJhdtliIMmK72
 bH5Bj2dasvi8MeqcOXOvNX+0aNLl7xZx8/1i6tnQ53khjjoN9F59HnVsgGJKgXkO42
 yamhfxZI49KGzihu4SlbEr7NY+BjWECmK83kxF0L+zLF+LiU/xEEsUAOPmqnzGKSU6
 PY+C1Wxoog0CQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/9] drm: mxsfb: Simplify LCDIF clock handling
Date: Mon, 28 Feb 2022 01:45:58 +0100
Message-Id: <20220228004605.367040-2-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228004605.367040-1-marex@denx.de>
References: <20220228004605.367040-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current clock handling in the LCDIF driver is a convoluted mess.
Implement runtime PM ops which turn the clock ON and OFF and let the
pm_runtime_get_sync()/pm_runtime_put_sync() calls in .atomic_enable
and .atomic_disable callbacks turn the clock ON and OFF at the right
time.

This requires slight reordering in mxsfb_crtc_atomic_enable() and
mxsfb_crtc_atomic_disable(), since all the register accesses must
happen only with clock enabled and clock frequency configuration
must happen with clock disabled.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Robby Cai <robby.cai@nxp.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stefan Agner <stefan@agner.ch>
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 100 +++++++++++++++++-------------
 drivers/gpu/drm/mxsfb/mxsfb_kms.c |  27 +++-----
 2 files changed, 66 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 375f26d4a4172..bb15e32d8a014 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -72,18 +72,6 @@ static const struct mxsfb_devdata mxsfb_devdata[] = {
 	},
 };
 
-void mxsfb_enable_axi_clk(struct mxsfb_drm_private *mxsfb)
-{
-	if (mxsfb->clk_axi)
-		clk_prepare_enable(mxsfb->clk_axi);
-}
-
-void mxsfb_disable_axi_clk(struct mxsfb_drm_private *mxsfb)
-{
-	if (mxsfb->clk_axi)
-		clk_disable_unprepare(mxsfb->clk_axi);
-}
-
 static struct drm_framebuffer *
 mxsfb_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		const struct drm_mode_fb_cmd2 *mode_cmd)
@@ -172,13 +160,9 @@ static void mxsfb_irq_disable(struct drm_device *drm)
 {
 	struct mxsfb_drm_private *mxsfb = drm->dev_private;
 
-	mxsfb_enable_axi_clk(mxsfb);
-
 	/* Disable and clear VBLANK IRQ */
 	writel(CTRL1_CUR_FRAME_DONE_IRQ_EN, mxsfb->base + LCDC_CTRL1 + REG_CLR);
 	writel(CTRL1_CUR_FRAME_DONE_IRQ, mxsfb->base + LCDC_CTRL1 + REG_CLR);
-
-	mxsfb_disable_axi_clk(mxsfb);
 }
 
 static int mxsfb_irq_install(struct drm_device *dev, int irq)
@@ -224,33 +208,33 @@ static int mxsfb_load(struct drm_device *drm,
 	if (IS_ERR(mxsfb->clk))
 		return PTR_ERR(mxsfb->clk);
 
-	mxsfb->clk_axi = devm_clk_get(drm->dev, "axi");
+	mxsfb->clk_axi = devm_clk_get_optional(drm->dev, "axi");
 	if (IS_ERR(mxsfb->clk_axi))
-		mxsfb->clk_axi = NULL;
+		return PTR_ERR(mxsfb->clk_axi);
 
-	mxsfb->clk_disp_axi = devm_clk_get(drm->dev, "disp_axi");
+	mxsfb->clk_disp_axi = devm_clk_get_optional(drm->dev, "disp_axi");
 	if (IS_ERR(mxsfb->clk_disp_axi))
-		mxsfb->clk_disp_axi = NULL;
+		return PTR_ERR(mxsfb->clk_disp_axi);
+
+	platform_set_drvdata(pdev, drm);
 
 	ret = dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32));
 	if (ret)
 		return ret;
 
-	pm_runtime_enable(drm->dev);
-
 	/* Modeset init */
 	drm_mode_config_init(drm);
 
 	ret = mxsfb_kms_init(mxsfb);
 	if (ret < 0) {
 		dev_err(drm->dev, "Failed to initialize KMS pipeline\n");
-		goto err_vblank;
+		return ret;
 	}
 
 	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
 	if (ret < 0) {
 		dev_err(drm->dev, "Failed to initialise vblank\n");
-		goto err_vblank;
+		return ret;
 	}
 
 	/* Start with vertical blanking interrupt reporting disabled. */
@@ -260,7 +244,7 @@ static int mxsfb_load(struct drm_device *drm,
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
 			dev_err(drm->dev, "Cannot connect bridge: %d\n", ret);
-		goto err_vblank;
+		return ret;
 	}
 
 	drm->mode_config.min_width	= MXSFB_MIN_XRES;
@@ -274,44 +258,37 @@ static int mxsfb_load(struct drm_device *drm,
 
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-		goto err_vblank;
+		return ret;
 	mxsfb->irq = ret;
 
-	pm_runtime_get_sync(drm->dev);
 	ret = mxsfb_irq_install(drm, mxsfb->irq);
-	pm_runtime_put_sync(drm->dev);
-
 	if (ret < 0) {
 		dev_err(drm->dev, "Failed to install IRQ handler\n");
-		goto err_vblank;
+		return ret;
 	}
 
 	drm_kms_helper_poll_init(drm);
 
-	platform_set_drvdata(pdev, drm);
-
 	drm_helper_hpd_irq_event(drm);
 
-	return 0;
-
-err_vblank:
-	pm_runtime_disable(drm->dev);
+	pm_runtime_enable(drm->dev);
 
-	return ret;
+	return 0;
 }
 
 static void mxsfb_unload(struct drm_device *drm)
 {
+	pm_runtime_get_sync(drm->dev);
+
 	drm_kms_helper_poll_fini(drm);
 	drm_mode_config_cleanup(drm);
 
-	pm_runtime_get_sync(drm->dev);
 	mxsfb_irq_uninstall(drm);
+
 	pm_runtime_put_sync(drm->dev);
+	pm_runtime_disable(drm->dev);
 
 	drm->dev_private = NULL;
-
-	pm_runtime_disable(drm->dev);
 }
 
 DEFINE_DRM_GEM_CMA_FOPS(fops);
@@ -388,23 +365,60 @@ static void mxsfb_shutdown(struct platform_device *pdev)
 	drm_atomic_helper_shutdown(drm);
 }
 
-#ifdef CONFIG_PM_SLEEP
+static int mxsfb_rpm_suspend(struct device *dev)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+	struct mxsfb_drm_private *mxsfb = drm->dev_private;
+
+	/* These clock supply the DISPLAY CLOCK Domain */
+	clk_disable_unprepare(mxsfb->clk);
+	/* These clock supply the System Bus, AXI, Write Path, LFIFO */
+	clk_disable_unprepare(mxsfb->clk_disp_axi);
+	/* These clock supply the Control Bus, APB, APBH Ctrl Registers */
+	clk_disable_unprepare(mxsfb->clk_axi);
+
+	return 0;
+}
+
+static int mxsfb_rpm_resume(struct device *dev)
+{
+	struct drm_device *drm = dev_get_drvdata(dev);
+	struct mxsfb_drm_private *mxsfb = drm->dev_private;
+
+	/* These clock supply the Control Bus, APB, APBH Ctrl Registers */
+	clk_prepare_enable(mxsfb->clk_axi);
+	/* These clock supply the System Bus, AXI, Write Path, LFIFO */
+	clk_prepare_enable(mxsfb->clk_disp_axi);
+	/* These clock supply the DISPLAY CLOCK Domain */
+	clk_prepare_enable(mxsfb->clk);
+
+	return 0;
+}
+
 static int mxsfb_suspend(struct device *dev)
 {
 	struct drm_device *drm = dev_get_drvdata(dev);
+	int ret;
 
-	return drm_mode_config_helper_suspend(drm);
+	ret = drm_mode_config_helper_suspend(drm);
+	if (ret)
+		return ret;
+
+	return mxsfb_rpm_suspend(dev);
 }
 
 static int mxsfb_resume(struct device *dev)
 {
 	struct drm_device *drm = dev_get_drvdata(dev);
 
+	mxsfb_rpm_resume(dev);
+
 	return drm_mode_config_helper_resume(drm);
 }
-#endif
 
 static const struct dev_pm_ops mxsfb_pm_ops = {
+	.runtime_suspend = mxsfb_rpm_suspend,
+	.runtime_resume = mxsfb_rpm_resume,
 	SET_SYSTEM_SLEEP_PM_OPS(mxsfb_suspend, mxsfb_resume)
 };
 
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 4cfb6c0016799..657b6afbbf1f9 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -100,10 +100,6 @@ static void mxsfb_enable_controller(struct mxsfb_drm_private *mxsfb)
 {
 	u32 reg;
 
-	if (mxsfb->clk_disp_axi)
-		clk_prepare_enable(mxsfb->clk_disp_axi);
-	clk_prepare_enable(mxsfb->clk);
-
 	/* Increase number of outstanding requests on all supported IPs */
 	if (mxsfb->devdata->has_ctrl2) {
 		reg = readl(mxsfb->base + LCDC_V4_CTRL2);
@@ -168,10 +164,6 @@ static void mxsfb_disable_controller(struct mxsfb_drm_private *mxsfb)
 	reg = readl(mxsfb->base + LCDC_VDCTRL4);
 	reg &= ~VDCTRL4_SYNC_SIGNALS_ON;
 	writel(reg, mxsfb->base + LCDC_VDCTRL4);
-
-	clk_disable_unprepare(mxsfb->clk);
-	if (mxsfb->clk_disp_axi)
-		clk_disable_unprepare(mxsfb->clk_disp_axi);
 }
 
 /*
@@ -250,8 +242,6 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
 
 	mxsfb_set_formats(mxsfb, bus_format);
 
-	clk_set_rate(mxsfb->clk, m->crtc_clock * 1000);
-
 	if (mxsfb->bridge && mxsfb->bridge->timings)
 		bus_flags = mxsfb->bridge->timings->input_bus_flags;
 
@@ -346,16 +336,12 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 				     struct drm_atomic_state *state)
 {
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
+	struct drm_display_mode *m = &mxsfb->crtc.state->adjusted_mode;
 	struct drm_bridge_state *bridge_state;
 	struct drm_device *drm = mxsfb->drm;
 	u32 bus_format = 0;
 	dma_addr_t paddr;
 
-	pm_runtime_get_sync(drm->dev);
-	mxsfb_enable_axi_clk(mxsfb);
-
-	drm_crtc_vblank_on(crtc);
-
 	/* If there is a bridge attached to the LCDIF, use its bus format */
 	if (mxsfb->bridge) {
 		bridge_state =
@@ -382,6 +368,10 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 	if (!bus_format)
 		bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 
+	clk_set_rate(mxsfb->clk, m->crtc_clock * 1000);
+
+	pm_runtime_get_sync(drm->dev);
+
 	mxsfb_crtc_mode_set_nofb(mxsfb, bus_format);
 
 	/* Write cur_buf as well to avoid an initial corrupt frame */
@@ -392,6 +382,8 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 	}
 
 	mxsfb_enable_controller(mxsfb);
+
+	drm_crtc_vblank_on(crtc);
 }
 
 static void mxsfb_crtc_atomic_disable(struct drm_crtc *crtc,
@@ -401,6 +393,8 @@ static void mxsfb_crtc_atomic_disable(struct drm_crtc *crtc,
 	struct drm_device *drm = mxsfb->drm;
 	struct drm_pending_vblank_event *event;
 
+	drm_crtc_vblank_off(crtc);
+
 	mxsfb_disable_controller(mxsfb);
 
 	spin_lock_irq(&drm->event_lock);
@@ -411,9 +405,6 @@ static void mxsfb_crtc_atomic_disable(struct drm_crtc *crtc,
 	}
 	spin_unlock_irq(&drm->event_lock);
 
-	drm_crtc_vblank_off(crtc);
-
-	mxsfb_disable_axi_clk(mxsfb);
 	pm_runtime_put_sync(drm->dev);
 }
 
-- 
2.34.1

