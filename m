Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D23D726059
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 15:02:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F8A10E4FD;
	Wed,  7 Jun 2023 13:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829CC10E4F6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 13:02:29 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1q6snx-0004N0-Py; Wed, 07 Jun 2023 15:02:25 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH 6/8] drm/etnaviv: better track GPU state
Date: Wed,  7 Jun 2023 15:02:21 +0200
Message-Id: <20230607130223.3533464-6-l.stach@pengutronix.de>
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

Instead of only tracking if the FE is running, use a enum to better
describe the various states the GPU can be in. This allows some
additional validation to make sure that functions that expect a
certain GPU state are only called when the GPU is actually in that
state.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 25 ++++++++++++++++++-------
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h | 10 +++++++++-
 2 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index fb07d0e73802..96cbb290b869 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -576,7 +576,7 @@ static int etnaviv_hw_reset(struct etnaviv_gpu *gpu)
 	/* We rely on the GPU running, so program the clock */
 	etnaviv_gpu_update_clock(gpu);
 
-	gpu->fe_running = false;
+	gpu->state = ETNA_GPU_STATE_RESET;
 	gpu->exec_state = -1;
 	if (gpu->mmu_context)
 		etnaviv_iommu_context_put(gpu->mmu_context);
@@ -651,8 +651,6 @@ void etnaviv_gpu_start_fe(struct etnaviv_gpu *gpu, u32 address, u16 prefetch)
 			  VIVS_MMUv2_SEC_COMMAND_CONTROL_ENABLE |
 			  VIVS_MMUv2_SEC_COMMAND_CONTROL_PREFETCH(prefetch));
 	}
-
-	gpu->fe_running = true;
 }
 
 static void etnaviv_gpu_start_fe_idleloop(struct etnaviv_gpu *gpu,
@@ -661,6 +659,8 @@ static void etnaviv_gpu_start_fe_idleloop(struct etnaviv_gpu *gpu,
 	u16 prefetch;
 	u32 address;
 
+	WARN_ON(gpu->state != ETNA_GPU_STATE_INITIALIZED);
+
 	/* setup the MMU */
 	etnaviv_iommu_restore(gpu, context);
 
@@ -670,6 +670,8 @@ static void etnaviv_gpu_start_fe_idleloop(struct etnaviv_gpu *gpu,
 					&gpu->mmu_context->cmdbuf_mapping);
 
 	etnaviv_gpu_start_fe(gpu, address, prefetch);
+
+	gpu->state = ETNA_GPU_STATE_RUNNING;
 }
 
 static void etnaviv_gpu_setup_pulse_eater(struct etnaviv_gpu *gpu)
@@ -705,6 +707,9 @@ static void etnaviv_gpu_setup_pulse_eater(struct etnaviv_gpu *gpu)
 
 static void etnaviv_gpu_hw_init(struct etnaviv_gpu *gpu)
 {
+	WARN_ON(!(gpu->state == ETNA_GPU_STATE_IDENTIFIED ||
+		  gpu->state == ETNA_GPU_STATE_RESET));
+
 	if ((etnaviv_is_model_rev(gpu, GC320, 0x5007) ||
 	     etnaviv_is_model_rev(gpu, GC320, 0x5220)) &&
 	    gpu_read(gpu, VIVS_HI_CHIP_TIME) != 0x2062400) {
@@ -751,6 +756,8 @@ static void etnaviv_gpu_hw_init(struct etnaviv_gpu *gpu)
 	etnaviv_gpu_setup_pulse_eater(gpu);
 
 	gpu_write(gpu, VIVS_HI_INTR_ENBL, ~0U);
+
+	gpu->state = ETNA_GPU_STATE_INITIALIZED;
 }
 
 int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
@@ -793,6 +800,8 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 	    (gpu->identity.minor_features10 & chipMinorFeatures10_SECURITY_AHB))
 		gpu->sec_mode = ETNA_SEC_KERNEL;
 
+	gpu->state = ETNA_GPU_STATE_IDENTIFIED;
+
 	ret = etnaviv_hw_reset(gpu);
 	if (ret) {
 		dev_err(gpu->dev, "GPU reset failed\n");
@@ -1368,7 +1377,7 @@ struct dma_fence *etnaviv_gpu_submit(struct etnaviv_gem_submit *submit)
 		goto out_unlock;
 	}
 
-	if (!gpu->fe_running)
+	if (gpu->state == ETNA_GPU_STATE_INITIALIZED)
 		etnaviv_gpu_start_fe_idleloop(gpu, submit->mmu_context);
 
 	if (submit->prev_mmu_context)
@@ -1634,7 +1643,7 @@ int etnaviv_gpu_wait_idle(struct etnaviv_gpu *gpu, unsigned int timeout_ms)
 
 static void etnaviv_gpu_hw_suspend(struct etnaviv_gpu *gpu)
 {
-	if (gpu->initialized && gpu->fe_running) {
+	if (gpu->state == ETNA_GPU_STATE_RUNNING) {
 		/* Replace the last WAIT with END */
 		mutex_lock(&gpu->lock);
 		etnaviv_buffer_end(gpu);
@@ -1647,7 +1656,7 @@ static void etnaviv_gpu_hw_suspend(struct etnaviv_gpu *gpu)
 		 */
 		etnaviv_gpu_wait_idle(gpu, 100);
 
-		gpu->fe_running = false;
+		gpu->state = ETNA_GPU_STATE_INITIALIZED;
 	}
 
 	gpu->exec_state = -1;
@@ -1918,6 +1927,8 @@ static int etnaviv_gpu_rpm_suspend(struct device *dev)
 
 	etnaviv_gpu_hw_suspend(gpu);
 
+	gpu->state = ETNA_GPU_STATE_IDENTIFIED;
+
 	return etnaviv_gpu_clk_disable(gpu);
 }
 
@@ -1931,7 +1942,7 @@ static int etnaviv_gpu_rpm_resume(struct device *dev)
 		return ret;
 
 	/* Re-initialise the basic hardware state */
-	if (gpu->initialized) {
+	if (gpu->state == ETNA_GPU_STATE_IDENTIFIED) {
 		ret = etnaviv_gpu_hw_resume(gpu);
 		if (ret) {
 			etnaviv_gpu_clk_disable(gpu);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 98c6f9c320fc..33ecc1bf84b1 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -95,6 +95,14 @@ struct clk;
 
 #define ETNA_NR_EVENTS 30
 
+enum etnaviv_gpu_state {
+	ETNA_GPU_STATE_UNKNOWN = 0,
+	ETNA_GPU_STATE_IDENTIFIED,
+	ETNA_GPU_STATE_RESET,
+	ETNA_GPU_STATE_INITIALIZED,
+	ETNA_GPU_STATE_RUNNING,
+};
+
 struct etnaviv_gpu {
 	struct drm_device *drm;
 	struct thermal_cooling_device *cooling;
@@ -105,8 +113,8 @@ struct etnaviv_gpu {
 	struct workqueue_struct *wq;
 	struct mutex sched_lock;
 	struct drm_gpu_scheduler sched;
+	enum etnaviv_gpu_state state;
 	bool initialized;
-	bool fe_running;
 
 	/* 'ring'-buffer: */
 	struct etnaviv_cmdbuf buffer;
-- 
2.39.2

