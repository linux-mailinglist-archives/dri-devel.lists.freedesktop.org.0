Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 955882C7C34
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 02:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650816E3F0;
	Mon, 30 Nov 2020 01:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D9E6E03E
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 17:16:17 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/ingenic: Add basic PM support
Date: Sat, 28 Nov 2020 17:16:06 +0000
Message-Id: <20201128171606.132830-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Nov 2020 01:02:59 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Call drm_mode_config_helper_suspend() and
drm_mode_config_helper_resume() on suspend and resume, respectively.

This makes sure that the display stack is properly disabled when the
hardware is put to sleep.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 368bfef8b340..818a0e4f5bfe 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -14,6 +14,7 @@
 #include <linux/of_device.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
 #include <linux/regmap.h>
 
 #include <drm/drm_atomic.h>
@@ -1167,6 +1168,24 @@ static int ingenic_drm_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int __maybe_unused ingenic_drm_suspend(struct device *dev)
+{
+	struct ingenic_drm *priv = dev_get_drvdata(dev);
+
+	return drm_mode_config_helper_suspend(&priv->drm);
+}
+
+static int __maybe_unused ingenic_drm_resume(struct device *dev)
+{
+	struct ingenic_drm *priv = dev_get_drvdata(dev);
+
+	drm_mode_config_helper_resume(&priv->drm);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(ingenic_drm_pm_ops, ingenic_drm_suspend, ingenic_drm_resume);
+
 static const u32 jz4740_formats[] = {
 	DRM_FORMAT_XRGB1555,
 	DRM_FORMAT_RGB565,
@@ -1246,6 +1265,7 @@ MODULE_DEVICE_TABLE(of, ingenic_drm_of_match);
 static struct platform_driver ingenic_drm_driver = {
 	.driver = {
 		.name = "ingenic-drm",
+		.pm = pm_ptr(&ingenic_drm_pm_ops),
 		.of_match_table = of_match_ptr(ingenic_drm_of_match),
 	},
 	.probe = ingenic_drm_probe,
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
