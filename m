Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEB763C7F3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 20:18:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE5910E211;
	Tue, 29 Nov 2022 19:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF7A10E211
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 19:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1669749471; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bRwIBP3Bd5yyj8tKvu5xEITLhoIAEXi+VXTuD8Wv1kk=;
 b=LIYDR5EdYELj9tAH4IuzuOM34Lt9KwUFjWmnyL2ak9lFDTvcYqbLtlj8VsqXP1bXZfRWeD
 rns4LoHYtbq2AR5UPz7tQDJBGBgx93ELO4GKjErLZHroxhGXxC851HhhBoI1A5RYzrpBlP
 Mdv1vzV1x+ZlR21rdec8icpTZR6gL6s=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 03/26] drm: imx: Define and use generic PM ops
Date: Tue, 29 Nov 2022 19:17:10 +0000
Message-Id: <20221129191733.137897-4-paul@crapouillou.net>
In-Reply-To: <20221129191733.137897-1-paul@crapouillou.net>
References: <20221129191733.137897-1-paul@crapouillou.net>
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
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the new DEFINE_DRM_MODE_CONFIG_HELPER_PM_OPS() macro to create a
"struct dev_pm_ops" that can be used by this driver, instead of using
custom PM callbacks with the same behaviour.

v2: Use the DEFINE_DRM_MODE_CONFIG_HELPER_PM_OPS() macro instead of an
    exported dev_pm_ops.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/imx-drm-core.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
index e060fa6cbcb9..1992934034e0 100644
--- a/drivers/gpu/drm/imx/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/imx-drm-core.c
@@ -10,6 +10,7 @@
 #include <linux/dma-buf.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
 
 #include <video/imx-ipu-v3.h>
 
@@ -298,36 +299,20 @@ static int imx_drm_platform_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int imx_drm_suspend(struct device *dev)
-{
-	struct drm_device *drm_dev = dev_get_drvdata(dev);
-
-	return drm_mode_config_helper_suspend(drm_dev);
-}
-
-static int imx_drm_resume(struct device *dev)
-{
-	struct drm_device *drm_dev = dev_get_drvdata(dev);
-
-	return drm_mode_config_helper_resume(drm_dev);
-}
-#endif
-
-static SIMPLE_DEV_PM_OPS(imx_drm_pm_ops, imx_drm_suspend, imx_drm_resume);
-
 static const struct of_device_id imx_drm_dt_ids[] = {
 	{ .compatible = "fsl,imx-display-subsystem", },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, imx_drm_dt_ids);
 
+DEFINE_DRM_MODE_CONFIG_HELPER_PM_OPS(imx_pm_ops);
+
 static struct platform_driver imx_drm_pdrv = {
 	.probe		= imx_drm_platform_probe,
 	.remove		= imx_drm_platform_remove,
 	.driver		= {
 		.name	= "imx-drm",
-		.pm	= &imx_drm_pm_ops,
+		.pm	= pm_sleep_ptr(&imx_pm_ops),
 		.of_match_table = imx_drm_dt_ids,
 	},
 };
-- 
2.35.1

