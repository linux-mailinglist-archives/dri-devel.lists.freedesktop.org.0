Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F3261FC37
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 18:55:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9BB10E89C;
	Mon,  7 Nov 2022 17:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3767B10E898
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 17:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1667843719; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M43DylMDkl+szcXiL4W9UuJ9KmYsm/BsQcv0v6WVc2s=;
 b=gTIgV9YrTwg5pvDdLqvG6YRsDsAreiXemU7vjadC9DexHxpNqbgNzrw3knRBsW7zuc7m6u
 95ifxjlYX000twB6DJSj4xrFHyGv8dAZN/cWwcUD2XM5ZLEEMUZ+On80sMT6zhW5is3/12
 JTpfOkAQoR6aZkcH5y97CvLVYXtWy9g=
From: Paul Cercueil <paul@crapouillou.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 25/26] drm: tidss: Remove #ifdef guards for PM related
 functions
Date: Mon,  7 Nov 2022 17:55:09 +0000
Message-Id: <20221107175510.361051-2-paul@crapouillou.net>
In-Reply-To: <20221107175510.361051-1-paul@crapouillou.net>
References: <20221107175106.360578-1-paul@crapouillou.net>
 <20221107175510.361051-1-paul@crapouillou.net>
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
 Jyri Sarha <jyri.sarha@iki.fi>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the SYSTEM_SLEEP_PM_OPS() and RUNTIME_PM_OPS() macros to handle the
PM callbacks.

These macros allow the suspend and resume functions to be automatically
dropped by the compiler when CONFIG_PM is disabled, without having
to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch. It also allows to drop the
__maybe_unused tags.

Some #ifndef CONFIG_PM guards were protecting simple statements, and
were also converted to "if (!IS_ENABLED(CONFIG_PM))".

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
Cc: Jyri Sarha <jyri.sarha@iki.fi>
Cc: Tomi Valkeinen <tomba@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_drv.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 15cd9b91b7e2..6957c86f9e85 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -48,7 +48,7 @@ void tidss_runtime_put(struct tidss_device *tidss)
 	WARN_ON(r < 0);
 }
 
-static int __maybe_unused tidss_pm_runtime_suspend(struct device *dev)
+static int tidss_pm_runtime_suspend(struct device *dev)
 {
 	struct tidss_device *tidss = dev_get_drvdata(dev);
 
@@ -57,7 +57,7 @@ static int __maybe_unused tidss_pm_runtime_suspend(struct device *dev)
 	return dispc_runtime_suspend(tidss->dispc);
 }
 
-static int __maybe_unused tidss_pm_runtime_resume(struct device *dev)
+static int tidss_pm_runtime_resume(struct device *dev)
 {
 	struct tidss_device *tidss = dev_get_drvdata(dev);
 	int r;
@@ -71,7 +71,7 @@ static int __maybe_unused tidss_pm_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused tidss_suspend(struct device *dev)
+static int tidss_suspend(struct device *dev)
 {
 	struct tidss_device *tidss = dev_get_drvdata(dev);
 
@@ -80,7 +80,7 @@ static int __maybe_unused tidss_suspend(struct device *dev)
 	return drm_mode_config_helper_suspend(&tidss->ddev);
 }
 
-static int __maybe_unused tidss_resume(struct device *dev)
+static int tidss_resume(struct device *dev)
 {
 	struct tidss_device *tidss = dev_get_drvdata(dev);
 
@@ -89,9 +89,9 @@ static int __maybe_unused tidss_resume(struct device *dev)
 	return drm_mode_config_helper_resume(&tidss->ddev);
 }
 
-static __maybe_unused const struct dev_pm_ops tidss_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(tidss_suspend, tidss_resume)
-	SET_RUNTIME_PM_OPS(tidss_pm_runtime_suspend, tidss_pm_runtime_resume, NULL)
+static const struct dev_pm_ops tidss_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(tidss_suspend, tidss_resume)
+	RUNTIME_PM_OPS(tidss_pm_runtime_suspend, tidss_pm_runtime_resume, NULL)
 };
 
 /* DRM device Information */
@@ -145,10 +145,9 @@ static int tidss_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
-#ifndef CONFIG_PM
 	/* If we don't have PM, we need to call resume manually */
-	dispc_runtime_resume(tidss->dispc);
-#endif
+	if (!IS_ENABLED(CONFIG_PM))
+		dispc_runtime_resume(tidss->dispc);
 
 	ret = tidss_modeset_init(tidss);
 	if (ret < 0) {
@@ -190,9 +189,8 @@ static int tidss_probe(struct platform_device *pdev)
 	tidss_irq_uninstall(ddev);
 
 err_runtime_suspend:
-#ifndef CONFIG_PM
-	dispc_runtime_suspend(tidss->dispc);
-#endif
+	if (!IS_ENABLED(CONFIG_PM))
+		dispc_runtime_suspend(tidss->dispc);
 	pm_runtime_disable(dev);
 
 	return ret;
@@ -212,10 +210,9 @@ static int tidss_remove(struct platform_device *pdev)
 
 	tidss_irq_uninstall(ddev);
 
-#ifndef CONFIG_PM
 	/* If we don't have PM, we need to call suspend manually */
-	dispc_runtime_suspend(tidss->dispc);
-#endif
+	if (!IS_ENABLED(CONFIG_PM))
+		dispc_runtime_suspend(tidss->dispc);
 	pm_runtime_disable(dev);
 
 	/* devm allocated dispc goes away with the dev so mark it NULL */
-- 
2.35.1

