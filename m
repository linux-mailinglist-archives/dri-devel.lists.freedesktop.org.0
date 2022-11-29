Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D38E663C80B
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 20:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75AE110E316;
	Tue, 29 Nov 2022 19:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E882310E241;
 Tue, 29 Nov 2022 19:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1669749486; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GXp3V8OWFSqCNWUIleivToEKqZcIGzXiTpP98hO8E8c=;
 b=EeGei6LnJKO6mGWa8RpkBRQ03VjBEPFJ8KX5roLt5+FwPmqMgbiRHeDmknPTUtKfE0R4Gn
 atNTFJtzdna062bv1oyeN8nvEIQ8j8DBbwvBNcz0qrridF8rCq1fMWx49oJxr5vmZF4HXk
 GKoE0/QZRxvzqzIr8VpmvJQPvJnklB4=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 12/26] drm: etnaviv: Remove #ifdef guards for PM related
 functions
Date: Tue, 29 Nov 2022 19:17:19 +0000
Message-Id: <20221129191733.137897-13-paul@crapouillou.net>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the RUNTIME_PM_OPS() and pm_ptr() macros to handle the
.runtime_suspend/.runtime_resume callbacks.

These macros allow the suspend and resume functions to be automatically
dropped by the compiler when CONFIG_PM is disabled, without having
to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Some #ifdef CONFIG_PM guards were protecting simple statements, and were
also converted to "if (IS_ENABLED(CONFIG_PM))".

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 30 +++++++++++----------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 51320eeebfcf..310382812029 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1629,7 +1629,6 @@ static int etnaviv_gpu_hw_suspend(struct etnaviv_gpu *gpu)
 	return etnaviv_gpu_clk_disable(gpu);
 }
 
-#ifdef CONFIG_PM
 static int etnaviv_gpu_hw_resume(struct etnaviv_gpu *gpu)
 {
 	int ret;
@@ -1645,7 +1644,6 @@ static int etnaviv_gpu_hw_resume(struct etnaviv_gpu *gpu)
 
 	return 0;
 }
-#endif
 
 static int
 etnaviv_gpu_cooling_get_max_state(struct thermal_cooling_device *cdev,
@@ -1713,11 +1711,10 @@ static int etnaviv_gpu_bind(struct device *dev, struct device *master,
 	if (ret)
 		goto out_workqueue;
 
-#ifdef CONFIG_PM
-	ret = pm_runtime_get_sync(gpu->dev);
-#else
-	ret = etnaviv_gpu_clk_enable(gpu);
-#endif
+	if (IS_ENABLED(CONFIG_PM))
+		ret = pm_runtime_get_sync(gpu->dev);
+	else
+		ret = etnaviv_gpu_clk_enable(gpu);
 	if (ret < 0)
 		goto out_sched;
 
@@ -1761,12 +1758,12 @@ static void etnaviv_gpu_unbind(struct device *dev, struct device *master,
 
 	etnaviv_sched_fini(gpu);
 
-#ifdef CONFIG_PM
-	pm_runtime_get_sync(gpu->dev);
-	pm_runtime_put_sync_suspend(gpu->dev);
-#else
-	etnaviv_gpu_hw_suspend(gpu);
-#endif
+	if (IS_ENABLED(CONFIG_PM)) {
+		pm_runtime_get_sync(gpu->dev);
+		pm_runtime_put_sync_suspend(gpu->dev);
+	} else {
+		etnaviv_gpu_hw_suspend(gpu);
+	}
 
 	if (gpu->mmu_context)
 		etnaviv_iommu_context_put(gpu->mmu_context);
@@ -1880,7 +1877,6 @@ static int etnaviv_gpu_platform_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
 static int etnaviv_gpu_rpm_suspend(struct device *dev)
 {
 	struct etnaviv_gpu *gpu = dev_get_drvdata(dev);
@@ -1923,18 +1919,16 @@ static int etnaviv_gpu_rpm_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops etnaviv_gpu_pm_ops = {
-	SET_RUNTIME_PM_OPS(etnaviv_gpu_rpm_suspend, etnaviv_gpu_rpm_resume,
-			   NULL)
+	RUNTIME_PM_OPS(etnaviv_gpu_rpm_suspend, etnaviv_gpu_rpm_resume, NULL)
 };
 
 struct platform_driver etnaviv_gpu_driver = {
 	.driver = {
 		.name = "etnaviv-gpu",
 		.owner = THIS_MODULE,
-		.pm = &etnaviv_gpu_pm_ops,
+		.pm = pm_ptr(&etnaviv_gpu_pm_ops),
 		.of_match_table = etnaviv_gpu_match,
 	},
 	.probe = etnaviv_gpu_platform_probe,
-- 
2.35.1

