Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D5A3158E7
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 22:47:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5887089C14;
	Tue,  9 Feb 2021 21:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9656E0C6
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 21:21:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.81,166,1610406000"; d="scan'208";a="492125976"
Received: from palace.lip6.fr ([132.227.105.202])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-SHA;
 09 Feb 2021 22:13:29 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] video: use getter/setter functions
Date: Tue,  9 Feb 2021 22:13:25 +0100
Message-Id: <20210209211325.1261842-1-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 09 Feb 2021 21:47:21 +0000
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel-janitors@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 linux-fbdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, linux-omap@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use getter and setter functions, for platform_device structures and a
spi_device structure.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/video/backlight/qcom-wled.c                                  |    2 +-
 drivers/video/fbdev/amifb.c                                          |    4 ++--
 drivers/video/fbdev/da8xx-fb.c                                       |    4 ++--
 drivers/video/fbdev/imxfb.c                                          |    2 +-
 drivers/video/fbdev/omap2/omapfb/displays/panel-lgphilips-lb035q02.c |    6 +++---
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c                           |    4 ++--
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c                           |    4 ++--
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c                         |    2 +-
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c                         |    2 +-
 drivers/video/fbdev/xilinxfb.c                                       |    2 +-
 10 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 3bc7800eb0a9..091f07e7c145 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -1692,7 +1692,7 @@ static int wled_probe(struct platform_device *pdev)
 
 static int wled_remove(struct platform_device *pdev)
 {
-	struct wled *wled = dev_get_drvdata(&pdev->dev);
+	struct wled *wled = platform_get_drvdata(pdev);
 
 	mutex_destroy(&wled->lock);
 	cancel_delayed_work_sync(&wled->ovp_work);
diff --git a/drivers/video/fbdev/xilinxfb.c b/drivers/video/fbdev/xilinxfb.c
index ca4ff658cad0..ffbf900648d9 100644
--- a/drivers/video/fbdev/xilinxfb.c
+++ b/drivers/video/fbdev/xilinxfb.c
@@ -472,7 +472,7 @@ static int xilinxfb_of_probe(struct platform_device *pdev)
 	if (of_find_property(pdev->dev.of_node, "rotate-display", NULL))
 		pdata.rotate_screen = 1;
 
-	dev_set_drvdata(&pdev->dev, drvdata);
+	platform_set_drvdata(pdev, drvdata);
 	return xilinxfb_assign(pdev, drvdata, &pdata);
 }
 
diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index 884b16efa7e8..7f8debd2da06 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -657,7 +657,7 @@ static int imxfb_activate_var(struct fb_var_screeninfo *var, struct fb_info *inf
 static int imxfb_init_fbinfo(struct platform_device *pdev)
 {
 	struct imx_fb_platform_data *pdata = dev_get_platdata(&pdev->dev);
-	struct fb_info *info = dev_get_drvdata(&pdev->dev);
+	struct fb_info *info = platform_get_drvdata(pdev);
 	struct imxfb_info *fbi = info->par;
 	struct device_node *np;
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
index e3d441ade241..2c03608addcd 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
@@ -713,7 +713,7 @@ static int hdmi5_bind(struct device *dev, struct device *master, void *data)
 	int irq;
 
 	hdmi.pdev = pdev;
-	dev_set_drvdata(&pdev->dev, &hdmi);
+	platform_set_drvdata(pdev, &hdmi);
 
 	mutex_init(&hdmi.lock);
 	spin_lock_init(&hdmi.audio_playing_lock);
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
index 496b43bdad21..800bd108e834 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
@@ -672,7 +672,7 @@ static int hdmi4_bind(struct device *dev, struct device *master, void *data)
 	int irq;
 
 	hdmi.pdev = pdev;
-	dev_set_drvdata(&pdev->dev, &hdmi);
+	platform_set_drvdata(pdev, &hdmi);
 
 	mutex_init(&hdmi.lock);
 	spin_lock_init(&hdmi.audio_playing_lock);
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
index 58c7aa279ab1..daa313f14335 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
@@ -399,7 +399,7 @@ module_param(dsi_perf, bool, 0644);
 
 static inline struct dsi_data *dsi_get_dsidrv_data(struct platform_device *dsidev)
 {
-	return dev_get_drvdata(&dsidev->dev);
+	return platform_get_drvdata(dsidev);
 }
 
 static inline struct platform_device *dsi_get_dsidev_from_dssdev(struct omap_dss_device *dssdev)
@@ -5266,7 +5266,7 @@ static int dsi_bind(struct device *dev, struct device *master, void *data)
 		return -ENOMEM;
 
 	dsi->pdev = dsidev;
-	dev_set_drvdata(&dsidev->dev, dsi);
+	platform_set_drvdata(dsidev, dsi);
 
 	spin_lock_init(&dsi->irq_lock);
 	spin_lock_init(&dsi->errors_lock);
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
index e2e7fe6f89ee..99ce6e955a46 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
@@ -55,7 +55,7 @@ static struct dpi_data *dpi_get_data_from_dssdev(struct omap_dss_device *dssdev)
 /* only used in non-DT mode */
 static struct dpi_data *dpi_get_data_from_pdev(struct platform_device *pdev)
 {
-	return dev_get_drvdata(&pdev->dev);
+	return platform_get_drvdata(pdev);
 }
 
 static struct dss_pll *dpi_get_pll(enum omap_channel channel)
@@ -784,7 +784,7 @@ static int dpi_bind(struct device *dev, struct device *master, void *data)
 
 	dpi->pdev = pdev;
 
-	dev_set_drvdata(&pdev->dev, dpi);
+	platform_set_drvdata(pdev, dpi);
 
 	mutex_init(&dpi->lock);
 
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-lgphilips-lb035q02.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-lgphilips-lb035q02.c
index 0f93a260e432..1bec7a4422e8 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-lgphilips-lb035q02.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-lgphilips-lb035q02.c
@@ -239,7 +239,7 @@ static struct omap_dss_driver lb035q02_ops = {
 static int lb035q02_probe_of(struct spi_device *spi)
 {
 	struct device_node *node = spi->dev.of_node;
-	struct panel_drv_data *ddata = dev_get_drvdata(&spi->dev);
+	struct panel_drv_data *ddata = spi_get_drvdata(spi);
 	struct omap_dss_device *in;
 	struct gpio_desc *gpio;
 
@@ -277,7 +277,7 @@ static int lb035q02_panel_spi_probe(struct spi_device *spi)
 	if (ddata == NULL)
 		return -ENOMEM;
 
-	dev_set_drvdata(&spi->dev, ddata);
+	spi_set_drvdata(spi, ddata);
 
 	ddata->spi = spi;
 
@@ -318,7 +318,7 @@ static int lb035q02_panel_spi_probe(struct spi_device *spi)
 
 static int lb035q02_panel_spi_remove(struct spi_device *spi)
 {
-	struct panel_drv_data *ddata = dev_get_drvdata(&spi->dev);
+	struct panel_drv_data *ddata = spi_get_drvdata(spi);
 	struct omap_dss_device *dssdev = &ddata->dssdev;
 	struct omap_dss_device *in = ddata->in;
 
diff --git a/drivers/video/fbdev/da8xx-fb.c b/drivers/video/fbdev/da8xx-fb.c
index e38c0e3f9c61..005ac3c17aa1 100644
--- a/drivers/video/fbdev/da8xx-fb.c
+++ b/drivers/video/fbdev/da8xx-fb.c
@@ -1066,7 +1066,7 @@ static void lcd_da8xx_cpufreq_deregister(struct da8xx_fb_par *par)
 
 static int fb_remove(struct platform_device *dev)
 {
-	struct fb_info *info = dev_get_drvdata(&dev->dev);
+	struct fb_info *info = platform_get_drvdata(dev);
 	struct da8xx_fb_par *par = info->par;
 	int ret;
 
@@ -1482,7 +1482,7 @@ static int fb_probe(struct platform_device *device)
 	da8xx_fb_var.activate = FB_ACTIVATE_FORCE;
 	fb_set_var(da8xx_fb_info, &da8xx_fb_var);
 
-	dev_set_drvdata(&device->dev, da8xx_fb_info);
+	platform_set_drvdata(device, da8xx_fb_info);
 
 	/* initialize the vsync wait queue */
 	init_waitqueue_head(&par->vsync_wait);
diff --git a/drivers/video/fbdev/amifb.c b/drivers/video/fbdev/amifb.c
index 226682550b4b..6e07a97bbd31 100644
--- a/drivers/video/fbdev/amifb.c
+++ b/drivers/video/fbdev/amifb.c
@@ -3736,7 +3736,7 @@ static int __init amifb_probe(struct platform_device *pdev)
 	if (err)
 		goto free_irq;
 
-	dev_set_drvdata(&pdev->dev, info);
+	platform_set_drvdata(pdev, info);
 
 	err = register_framebuffer(info);
 	if (err)
@@ -3764,7 +3764,7 @@ static int __init amifb_probe(struct platform_device *pdev)
 
 static int __exit amifb_remove(struct platform_device *pdev)
 {
-	struct fb_info *info = dev_get_drvdata(&pdev->dev);
+	struct fb_info *info = platform_get_drvdata(pdev);
 
 	unregister_framebuffer(info);
 	fb_dealloc_cmap(&info->cmap);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
