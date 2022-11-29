Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BB463C7F8
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 20:19:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781F010E230;
	Tue, 29 Nov 2022 19:18:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F1310E22A
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 19:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1669749480; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XJfb607OEPZzj5jgkFphMZxTPqxtnHJHM51G7bS3xhg=;
 b=NHeNnfajuJj9RKYJuLwf++m+ogVpTx5mJDmSLqyL7XYR/Sv/A8mIz8XsTQlKwTWAcwC8L5
 tMJKHInbAvfNrr0xxTdaa88NpD4bqf3cgKpPG+SlGkoBYqtCAlbq9OrAHuYzYK1wmkiCp5
 mMJ22m4Cwp4riY9CkZMFeJsyHG6w47c=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 07/26] drm: mxsfb: Define and use generic PM ops
Date: Tue, 29 Nov 2022 19:17:14 +0000
Message-Id: <20221129191733.137897-8-paul@crapouillou.net>
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
Cc: Marek Vasut <marex@denx.de>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 dri-devel@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the new DEFINE_DRM_MODE_CONFIG_HELPER_PM_OPS() macro to create a
"struct dev_pm_ops" that can be used by this driver, instead of using
custom PM callbacks with the same behaviour.

v2: Use the DEFINE_DRM_MODE_CONFIG_HELPER_PM_OPS() macro instead of an
    exported dev_pm_ops.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
Cc: Marek Vasut <marex@denx.de>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 810edea0a31e..c63d2eb3b379 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -398,25 +398,7 @@ static void mxsfb_shutdown(struct platform_device *pdev)
 	drm_atomic_helper_shutdown(drm);
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int mxsfb_suspend(struct device *dev)
-{
-	struct drm_device *drm = dev_get_drvdata(dev);
-
-	return drm_mode_config_helper_suspend(drm);
-}
-
-static int mxsfb_resume(struct device *dev)
-{
-	struct drm_device *drm = dev_get_drvdata(dev);
-
-	return drm_mode_config_helper_resume(drm);
-}
-#endif
-
-static const struct dev_pm_ops mxsfb_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(mxsfb_suspend, mxsfb_resume)
-};
+DEFINE_DRM_MODE_CONFIG_HELPER_PM_OPS(mxsfb_pm_ops);
 
 static struct platform_driver mxsfb_platform_driver = {
 	.probe		= mxsfb_probe,
@@ -425,7 +407,7 @@ static struct platform_driver mxsfb_platform_driver = {
 	.driver	= {
 		.name		= "mxsfb",
 		.of_match_table	= mxsfb_dt_ids,
-		.pm		= &mxsfb_pm_ops,
+		.pm		= pm_sleep_ptr(&mxsfb_pm_ops),
 	},
 };
 
-- 
2.35.1

