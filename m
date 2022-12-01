Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EACF463F6C8
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 18:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94F010E661;
	Thu,  1 Dec 2022 17:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0820A10E65F
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 17:48:51 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1p0nfz-0000lh-KO; Thu, 01 Dec 2022 18:48:47 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH 2/2] drm/etnaviv: convert user fence tracking to XArray
Date: Thu,  1 Dec 2022 18:48:46 +0100
Message-Id: <20221201174846.2732578-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221201174846.2732578-1-l.stach@pengutronix.de>
References: <20221201174846.2732578-1-l.stach@pengutronix.de>
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

This simplifies the driver code a bit, as XArray already provides
internal locking. IDRs are implemented using XArrays anyways, so
this drops one level of unneeded abstraction.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.h        |  1 +
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  9 +++++----
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c        |  7 +++----
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h        |  4 ++--
 drivers/gpu/drm/etnaviv/etnaviv_sched.c      | 13 +++++--------
 5 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
index f32f4771dada..778394e85c3d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
@@ -11,6 +11,7 @@
 #include <linux/sizes.h>
 #include <linux/time64.h>
 #include <linux/types.h>
+#include <linux/xarray.h>
 
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem.h>
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 2337b24b05b0..cc9d8b8f76f0 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -393,10 +393,11 @@ static void submit_cleanup(struct kref *kref)
 	wake_up_all(&submit->gpu->fence_event);
 
 	if (submit->out_fence) {
-		/* first remove from IDR, so fence can not be found anymore */
-		mutex_lock(&submit->gpu->idr_lock);
-		idr_remove(&submit->gpu->fence_idr, submit->out_fence_id);
-		mutex_unlock(&submit->gpu->idr_lock);
+		/*
+		 * Remove from user fence array before dropping the reference,
+		 * so fence can not be found in lookup anymore.
+		 */
+		xa_erase(&submit->gpu->user_fences, submit->out_fence_id);
 		dma_fence_put(submit->out_fence);
 	}
 	kfree(submit->pmrs);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 30d7c1d8d6c0..f7375d9e1716 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1216,7 +1216,7 @@ int etnaviv_gpu_wait_fence_interruptible(struct etnaviv_gpu *gpu,
 	 * pretends we didn't find a fence in that case.
 	 */
 	rcu_read_lock();
-	fence = idr_find(&gpu->fence_idr, id);
+	fence = xa_load(&gpu->user_fences, id);
 	if (fence)
 		fence = dma_fence_get_rcu(fence);
 	rcu_read_unlock();
@@ -1700,7 +1700,7 @@ static int etnaviv_gpu_bind(struct device *dev, struct device *master,
 
 	gpu->drm = drm;
 	gpu->fence_context = dma_fence_context_alloc(1);
-	idr_init(&gpu->fence_idr);
+	xa_init_flags(&gpu->user_fences, XA_FLAGS_ALLOC);
 	spin_lock_init(&gpu->fence_spinlock);
 
 	INIT_WORK(&gpu->sync_point_work, sync_point_worker);
@@ -1754,7 +1754,7 @@ static void etnaviv_gpu_unbind(struct device *dev, struct device *master,
 	}
 
 	gpu->drm = NULL;
-	idr_destroy(&gpu->fence_idr);
+	xa_destroy(&gpu->user_fences);
 
 	if (IS_ENABLED(CONFIG_DRM_ETNAVIV_THERMAL))
 		thermal_cooling_device_unregister(gpu->cooling);
@@ -1787,7 +1787,6 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 	gpu->dev = &pdev->dev;
 	mutex_init(&gpu->lock);
 	mutex_init(&gpu->sched_lock);
-	mutex_init(&gpu->idr_lock);
 
 	/* Map registers: */
 	gpu->mmio = devm_platform_ioremap_resource(pdev, 0);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 267d8ec97f11..9b6773051773 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -117,8 +117,8 @@ struct etnaviv_gpu {
 	u32 idle_mask;
 
 	/* Fencing support */
-	struct mutex idr_lock;
-	struct idr fence_idr;
+	struct xarray user_fences;
+	u32 next_user_fence;
 	u32 next_fence;
 	u32 completed_fence;
 	wait_queue_head_t fence_event;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 27448431a45c..39ca04cf2dd5 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -98,7 +98,7 @@ static const struct drm_sched_backend_ops etnaviv_sched_ops = {
 int etnaviv_sched_push_job(struct etnaviv_gem_submit *submit)
 {
 	struct etnaviv_gpu *gpu = submit->gpu;
-	int ret = 0;
+	int ret;
 
 	/*
 	 * Hold the sched lock across the whole operation to avoid jobs being
@@ -110,14 +110,11 @@ int etnaviv_sched_push_job(struct etnaviv_gem_submit *submit)
 	drm_sched_job_arm(&submit->sched_job);
 
 	submit->out_fence = dma_fence_get(&submit->sched_job.s_fence->finished);
-	mutex_lock(&gpu->idr_lock);
-	submit->out_fence_id = idr_alloc_cyclic(&gpu->fence_idr,
-						submit->out_fence, 0,
-						INT_MAX, GFP_KERNEL);
-	mutex_unlock(&gpu->idr_lock);
-	if (submit->out_fence_id < 0) {
+	ret = xa_alloc_cyclic(&gpu->user_fences, &submit->out_fence_id,
+			      submit->out_fence, xa_limit_32b,
+			      &gpu->next_user_fence, GFP_KERNEL);
+	if (ret < 0) {
 		drm_sched_job_cleanup(&submit->sched_job);
-		ret = -ENOMEM;
 		goto out_unlock;
 	}
 
-- 
2.30.2

