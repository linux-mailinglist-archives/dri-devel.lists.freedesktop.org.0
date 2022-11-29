Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1C763C7F4
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 20:18:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0257F10E225;
	Tue, 29 Nov 2022 19:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5196C10E211
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 19:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1669749472; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G8DuH3BuKovOG4Q7ExNfPyHxexqJONRgTC1VLQg6L9Q=;
 b=XeDFUB1JkUgh0wnq9Xls3sBZht0UmGP/izWeb/iRwRNzHrS979IvpylbCjC2/q+8aUq3tT
 EOXMv8WFDy5gjLgrVnvlKo9WSBkpvLWBCb0cWc69f1vAl/XjHyvw2TCphvzX22HwJnUhIf
 4WmBhw+t+MczTtU+iytYxf4ZzAVrONY=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 04/26] drm: rockchip: Define and use generic PM ops
Date: Tue, 29 Nov 2022 19:17:11 +0000
Message-Id: <20221129191733.137897-5-paul@crapouillou.net>
In-Reply-To: <20221129191733.137897-1-paul@crapouillou.net>
References: <20221129191733.137897-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, Paul Cercueil <paul@crapouillou.net>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the new DEFINE_DRM_MODE_CONFIG_HELPER_PM_OPS() macro to create a
"struct dev_pm_ops" that can be used by this driver, instead of using
custom PM callbacks with the same behaviour.

v2: Use the DEFINE_DRM_MODE_CONFIG_HELPER_PM_OPS() macro instead of an
    exported dev_pm_ops.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 25 +++------------------
 1 file changed, 3 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index 6e0788d14c10..ec117c52cb24 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -236,27 +236,6 @@ static const struct drm_driver rockchip_drm_driver = {
 	.minor	= DRIVER_MINOR,
 };
 
-#ifdef CONFIG_PM_SLEEP
-static int rockchip_drm_sys_suspend(struct device *dev)
-{
-	struct drm_device *drm = dev_get_drvdata(dev);
-
-	return drm_mode_config_helper_suspend(drm);
-}
-
-static int rockchip_drm_sys_resume(struct device *dev)
-{
-	struct drm_device *drm = dev_get_drvdata(dev);
-
-	return drm_mode_config_helper_resume(drm);
-}
-#endif
-
-static const struct dev_pm_ops rockchip_drm_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(rockchip_drm_sys_suspend,
-				rockchip_drm_sys_resume)
-};
-
 #define MAX_ROCKCHIP_SUB_DRIVERS 16
 static struct platform_driver *rockchip_sub_drivers[MAX_ROCKCHIP_SUB_DRIVERS];
 static int num_rockchip_sub_drivers;
@@ -473,6 +452,8 @@ static const struct of_device_id rockchip_drm_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, rockchip_drm_dt_ids);
 
+DEFINE_DRM_MODE_CONFIG_HELPER_PM_OPS(rockchip_pm_ops);
+
 static struct platform_driver rockchip_drm_platform_driver = {
 	.probe = rockchip_drm_platform_probe,
 	.remove = rockchip_drm_platform_remove,
@@ -480,7 +461,7 @@ static struct platform_driver rockchip_drm_platform_driver = {
 	.driver = {
 		.name = "rockchip-drm",
 		.of_match_table = rockchip_drm_dt_ids,
-		.pm = &rockchip_drm_pm_ops,
+		.pm = pm_sleep_ptr(&rockchip_pm_ops),
 	},
 };
 
-- 
2.35.1

