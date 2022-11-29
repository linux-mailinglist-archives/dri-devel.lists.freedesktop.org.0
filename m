Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A823863C823
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 20:20:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C1110E32F;
	Tue, 29 Nov 2022 19:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C2810E2CE
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 19:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1669749594; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nveh5A0ZF11TSwS4JhZjKC3Y/bPmA5nmXXuqH0bCb0s=;
 b=qZiq8zwD/K3DkQxZ5GuG3/hC3aQghhrXNsAepBuOJBurYhxibjzBrwRyEbNZJZeSI4JF7o
 VST3H3lVx+lMgiYARwAByWb+BadWzUTojng6SinbWvW9ilQFFg3rxnvI4MAHKd6BzZf0/C
 NSfgpQjZ3QvRuKc8qOOukBEsEiY+tI8=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 15/26] drm: omap: Remove #ifdef guards for PM related
 functions
Date: Tue, 29 Nov 2022 19:19:31 +0000
Message-Id: <20221129191942.138244-2-paul@crapouillou.net>
In-Reply-To: <20221129191942.138244-1-paul@crapouillou.net>
References: <20221129191733.137897-1-paul@crapouillou.net>
 <20221129191942.138244-1-paul@crapouillou.net>
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
Cc: Paul Cercueil <paul@crapouillou.net>, Tomi Valkeinen <tomba@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() macros to handle
the .suspend/.resume callbacks.

These macros allow the suspend and resume functions to be automatically
dropped by the compiler when CONFIG_SUSPEND is disabled, without having
to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

The #ifdef CONFIG_PM guard around omap_gem_resume() was also removed,
and replaced by a "if (IS_ENABLED(CONFIG_PM_SLEEP))" guard in-line.
The change to CONFIG_PM_SLEEP is because it is only ever called in this
configuration.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
Cc: Tomi Valkeinen <tomba@kernel.org>
---
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c | 6 ++----
 drivers/gpu/drm/omapdrm/omap_drv.c       | 7 +++----
 drivers/gpu/drm/omapdrm/omap_gem.c       | 5 +++--
 drivers/gpu/drm/omapdrm/omap_gem.h       | 2 --
 4 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
index 61a27dd7392e..14cc4cb457d1 100644
--- a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
+++ b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
@@ -1161,7 +1161,6 @@ int tiler_map_show(struct seq_file *s, void *arg)
 }
 #endif
 
-#ifdef CONFIG_PM_SLEEP
 static int omap_dmm_resume(struct device *dev)
 {
 	struct tcm_area area;
@@ -1185,9 +1184,8 @@ static int omap_dmm_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(omap_dmm_pm_ops, NULL, omap_dmm_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(omap_dmm_pm_ops, NULL, omap_dmm_resume);
 
 #if defined(CONFIG_OF)
 static const struct dmm_platform_data dmm_omap4_platform_data = {
@@ -1218,7 +1216,7 @@ struct platform_driver omap_dmm_driver = {
 		.owner = THIS_MODULE,
 		.name = DMM_DRIVER_NAME,
 		.of_match_table = of_match_ptr(dmm_of_match),
-		.pm = &omap_dmm_pm_ops,
+		.pm = pm_sleep_ptr(&omap_dmm_pm_ops),
 	},
 };
 
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index eaf67b9e5f12..5f22e63e26c7 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -877,7 +877,6 @@ static int pdev_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int omap_drm_suspend(struct device *dev)
 {
 	struct omap_drm_private *priv = dev_get_drvdata(dev);
@@ -895,14 +894,14 @@ static int omap_drm_resume(struct device *dev)
 
 	return omap_gem_resume(drm_dev);
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(omapdrm_pm_ops, omap_drm_suspend, omap_drm_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(omapdrm_pm_ops,
+				omap_drm_suspend, omap_drm_resume);
 
 static struct platform_driver pdev = {
 	.driver = {
 		.name = "omapdrm",
-		.pm = &omapdrm_pm_ops,
+		.pm = pm_sleep_ptr(&omapdrm_pm_ops),
 	},
 	.probe = pdev_probe,
 	.remove = pdev_remove,
diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index cf571796fd26..119e829c40de 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -1104,7 +1104,6 @@ void *omap_gem_vaddr(struct drm_gem_object *obj)
  * Power Management
  */
 
-#ifdef CONFIG_PM
 /* re-pin objects in DMM in resume path: */
 int omap_gem_resume(struct drm_device *dev)
 {
@@ -1112,6 +1111,9 @@ int omap_gem_resume(struct drm_device *dev)
 	struct omap_gem_object *omap_obj;
 	int ret = 0;
 
+	if (!IS_ENABLED(CONFIG_PM_SLEEP))
+		return 0;
+
 	mutex_lock(&priv->list_lock);
 	list_for_each_entry(omap_obj, &priv->obj_list, mm_list) {
 		if (omap_obj->block) {
@@ -1133,7 +1135,6 @@ int omap_gem_resume(struct drm_device *dev)
 	mutex_unlock(&priv->list_lock);
 	return ret;
 }
-#endif
 
 /* -----------------------------------------------------------------------------
  * DebugFS
diff --git a/drivers/gpu/drm/omapdrm/omap_gem.h b/drivers/gpu/drm/omapdrm/omap_gem.h
index 4d4488939f6b..edcd92ecc2ea 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.h
+++ b/drivers/gpu/drm/omapdrm/omap_gem.h
@@ -32,9 +32,7 @@ union omap_gem_size;
 void omap_gem_init(struct drm_device *dev);
 void omap_gem_deinit(struct drm_device *dev);
 
-#ifdef CONFIG_PM
 int omap_gem_resume(struct drm_device *dev);
-#endif
 
 #ifdef CONFIG_DEBUG_FS
 void omap_gem_describe(struct drm_gem_object *obj, struct seq_file *m);
-- 
2.35.1

