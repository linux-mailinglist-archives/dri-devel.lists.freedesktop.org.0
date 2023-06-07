Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B6F726054
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 15:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C114310E4F5;
	Wed,  7 Jun 2023 13:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF32710E4F4
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 13:02:28 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1q6snx-0004N0-Ep; Wed, 07 Jun 2023 15:02:25 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH 5/8] drm/etnaviv: avoid runtime PM usage in etnaviv_gpu_bind
Date: Wed,  7 Jun 2023 15:02:20 +0200
Message-Id: <20230607130223.3533464-5-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230607130223.3533464-1-l.stach@pengutronix.de>
References: <20230607130223.3533464-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nothing in this callpath actually touches the GPU, so there is no reason
to get it out of suspend state here. Only if runtime PM isn't enabled at
all we must make sure to enable the clocks, so the GPU init routine can
access the GPU later on.

This also removes the need to guard against the state where the driver
isn't fully initialized yet in the runtime PM resume handler.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 57cf77ed2fcf..fb07d0e73802 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1735,13 +1735,11 @@ static int etnaviv_gpu_bind(struct device *dev, struct device *master,
 	if (ret)
 		goto out_workqueue;
 
-	if (IS_ENABLED(CONFIG_PM))
-		ret = pm_runtime_get_sync(gpu->dev);
-	else
+	if (!IS_ENABLED(CONFIG_PM)) {
 		ret = etnaviv_gpu_clk_enable(gpu);
-	if (ret < 0)
-		goto out_sched;
-
+		if (ret < 0)
+			goto out_sched;
+	}
 
 	gpu->drm = drm;
 	gpu->fence_context = dma_fence_context_alloc(1);
@@ -1753,9 +1751,6 @@ static int etnaviv_gpu_bind(struct device *dev, struct device *master,
 
 	priv->gpu[priv->num_gpus++] = gpu;
 
-	pm_runtime_mark_last_busy(gpu->dev);
-	pm_runtime_put_autosuspend(gpu->dev);
-
 	return 0;
 
 out_sched:
@@ -1936,7 +1931,7 @@ static int etnaviv_gpu_rpm_resume(struct device *dev)
 		return ret;
 
 	/* Re-initialise the basic hardware state */
-	if (gpu->drm && gpu->initialized) {
+	if (gpu->initialized) {
 		ret = etnaviv_gpu_hw_resume(gpu);
 		if (ret) {
 			etnaviv_gpu_clk_disable(gpu);
-- 
2.39.2

