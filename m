Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CBB61FBFD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 18:52:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A7210E886;
	Mon,  7 Nov 2022 17:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC2F10E885
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 17:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1667843483; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a1iA3eBj97Rvq7OWPrwJVhtvp5JKUE1pcF7E3020HnE=;
 b=C0yI4JVTIUpFCbvbJ/En9ggpLv7PJh2Calp+CdhOu4/DiNEOXY7Aupd/todjjef0wmZOee
 RS6RWewoLwaCK5zFqrr3I2ebT4be5vTwPYflm1ecpcEtb10fHbDi6UdeNVNQfF94XM3Mdg
 OCrSx2/2Wzd2ZJ3eqrrGtfrXJAy81oI=
From: Paul Cercueil <paul@crapouillou.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 10/26] drm: imx/dcss: Remove #ifdef guards for PM related
 functions
Date: Mon,  7 Nov 2022 17:50:50 +0000
Message-Id: <20221107175106.360578-11-paul@crapouillou.net>
In-Reply-To: <20221107175106.360578-1-paul@crapouillou.net>
References: <20221107175106.360578-1-paul@crapouillou.net>
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 NXP Linux Team <linux-imx@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the EXPORT_GPL_DEV_PM_OPS() and pm_ptr() macros to handle the PM
callbacks.

These macros allow the PM functions to be automatically dropped by the
compiler when CONFIG_PM is disabled, without having to use #ifdef
guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/dcss/dcss-dev.c | 17 +++++++++--------
 drivers/gpu/drm/imx/dcss/dcss-dev.h |  7 +++----
 drivers/gpu/drm/imx/dcss/dcss-drv.c |  8 +-------
 3 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
index 3f5750cc2673..66d9233ffb98 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
@@ -249,8 +249,7 @@ void dcss_dev_destroy(struct dcss_dev *dcss)
 	kfree(dcss);
 }
 
-#ifdef CONFIG_PM_SLEEP
-int dcss_dev_suspend(struct device *dev)
+static int dcss_dev_suspend(struct device *dev)
 {
 	struct dcss_dev *dcss = dcss_drv_dev_to_dcss(dev);
 	struct drm_device *ddev = dcss_drv_dev_to_drm(dev);
@@ -273,7 +272,7 @@ int dcss_dev_suspend(struct device *dev)
 	return 0;
 }
 
-int dcss_dev_resume(struct device *dev)
+static int dcss_dev_resume(struct device *dev)
 {
 	struct dcss_dev *dcss = dcss_drv_dev_to_dcss(dev);
 	struct drm_device *ddev = dcss_drv_dev_to_drm(dev);
@@ -296,10 +295,8 @@ int dcss_dev_resume(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM_SLEEP */
 
-#ifdef CONFIG_PM
-int dcss_dev_runtime_suspend(struct device *dev)
+static int dcss_dev_runtime_suspend(struct device *dev)
 {
 	struct dcss_dev *dcss = dcss_drv_dev_to_dcss(dev);
 	int ret;
@@ -313,7 +310,7 @@ int dcss_dev_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-int dcss_dev_runtime_resume(struct device *dev)
+static int dcss_dev_runtime_resume(struct device *dev)
 {
 	struct dcss_dev *dcss = dcss_drv_dev_to_dcss(dev);
 
@@ -325,4 +322,8 @@ int dcss_dev_runtime_resume(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM */
+
+EXPORT_GPL_DEV_PM_OPS(dcss_dev_pm_ops) = {
+	RUNTIME_PM_OPS(dcss_dev_runtime_suspend, dcss_dev_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(dcss_dev_suspend, dcss_dev_resume)
+};
diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.h b/drivers/gpu/drm/imx/dcss/dcss-dev.h
index 1e582270c6ea..f27b87c09599 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dev.h
+++ b/drivers/gpu/drm/imx/dcss/dcss-dev.h
@@ -9,6 +9,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_plane.h>
 #include <linux/io.h>
+#include <linux/pm.h>
 #include <video/videomode.h>
 
 #define SET			0x04
@@ -95,13 +96,11 @@ struct dcss_dev *dcss_drv_dev_to_dcss(struct device *dev);
 struct drm_device *dcss_drv_dev_to_drm(struct device *dev);
 struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output);
 void dcss_dev_destroy(struct dcss_dev *dcss);
-int dcss_dev_runtime_suspend(struct device *dev);
-int dcss_dev_runtime_resume(struct device *dev);
-int dcss_dev_suspend(struct device *dev);
-int dcss_dev_resume(struct device *dev);
 void dcss_enable_dtg_and_ss(struct dcss_dev *dcss);
 void dcss_disable_dtg_and_ss(struct dcss_dev *dcss);
 
+extern const struct dev_pm_ops dcss_dev_pm_ops;
+
 /* BLKCTL */
 int dcss_blkctl_init(struct dcss_dev *dcss, unsigned long blkctl_base);
 void dcss_blkctl_cfg(struct dcss_blkctl *blkctl);
diff --git a/drivers/gpu/drm/imx/dcss/dcss-drv.c b/drivers/gpu/drm/imx/dcss/dcss-drv.c
index 1c70f70247f6..431510bd811b 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-drv.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-drv.c
@@ -117,19 +117,13 @@ static const struct of_device_id dcss_of_match[] = {
 
 MODULE_DEVICE_TABLE(of, dcss_of_match);
 
-static const struct dev_pm_ops dcss_dev_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(dcss_dev_suspend, dcss_dev_resume)
-	SET_RUNTIME_PM_OPS(dcss_dev_runtime_suspend,
-			   dcss_dev_runtime_resume, NULL)
-};
-
 static struct platform_driver dcss_platform_driver = {
 	.probe	= dcss_drv_platform_probe,
 	.remove	= dcss_drv_platform_remove,
 	.driver	= {
 		.name = "imx-dcss",
 		.of_match_table	= dcss_of_match,
-		.pm = &dcss_dev_pm,
+		.pm = pm_ptr(&dcss_dev_pm_ops),
 	},
 };
 
-- 
2.35.1

