Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C36D763F6C6
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 18:49:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A208B10E660;
	Thu,  1 Dec 2022 17:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFEE710E65E
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 17:48:50 +0000 (UTC)
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1p0nfz-0000lh-9w; Thu, 01 Dec 2022 18:48:47 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org
Subject: [PATCH 1/2] drm/etnaviv: split fence lock
Date: Thu,  1 Dec 2022 18:48:45 +0100
Message-Id: <20221201174846.2732578-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
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

The fence lock currently protects two distinct things. It protects the fence
IDR from concurrent inserts and removes and also keeps drm_sched_job_arm and
drm_sched_entity_push_job in one atomic section to guarantee the fence seqno
monotonicity. Split the lock into those two functions.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  4 ++--
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c        |  3 ++-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h        |  3 ++-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c      | 11 +++++++----
 4 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 1ac916b24891..2337b24b05b0 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -394,9 +394,9 @@ static void submit_cleanup(struct kref *kref)
 
 	if (submit->out_fence) {
 		/* first remove from IDR, so fence can not be found anymore */
-		mutex_lock(&submit->gpu->fence_lock);
+		mutex_lock(&submit->gpu->idr_lock);
 		idr_remove(&submit->gpu->fence_idr, submit->out_fence_id);
-		mutex_unlock(&submit->gpu->fence_lock);
+		mutex_unlock(&submit->gpu->idr_lock);
 		dma_fence_put(submit->out_fence);
 	}
 	kfree(submit->pmrs);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index 37018bc55810..30d7c1d8d6c0 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -1786,7 +1786,8 @@ static int etnaviv_gpu_platform_probe(struct platform_device *pdev)
 
 	gpu->dev = &pdev->dev;
 	mutex_init(&gpu->lock);
-	mutex_init(&gpu->fence_lock);
+	mutex_init(&gpu->sched_lock);
+	mutex_init(&gpu->idr_lock);
 
 	/* Map registers: */
 	gpu->mmio = devm_platform_ioremap_resource(pdev, 0);
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 85eddd492774..267d8ec97f11 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -99,6 +99,7 @@ struct etnaviv_gpu {
 	struct etnaviv_chip_identity identity;
 	enum etnaviv_sec_mode sec_mode;
 	struct workqueue_struct *wq;
+	struct mutex sched_lock;
 	struct drm_gpu_scheduler sched;
 	bool initialized;
 	bool fe_running;
@@ -116,7 +117,7 @@ struct etnaviv_gpu {
 	u32 idle_mask;
 
 	/* Fencing support */
-	struct mutex fence_lock;
+	struct mutex idr_lock;
 	struct idr fence_idr;
 	u32 next_fence;
 	u32 completed_fence;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 72e2553fbc98..27448431a45c 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -97,21 +97,24 @@ static const struct drm_sched_backend_ops etnaviv_sched_ops = {
 
 int etnaviv_sched_push_job(struct etnaviv_gem_submit *submit)
 {
+	struct etnaviv_gpu *gpu = submit->gpu;
 	int ret = 0;
 
 	/*
-	 * Hold the fence lock across the whole operation to avoid jobs being
+	 * Hold the sched lock across the whole operation to avoid jobs being
 	 * pushed out of order with regard to their sched fence seqnos as
 	 * allocated in drm_sched_job_arm.
 	 */
-	mutex_lock(&submit->gpu->fence_lock);
+	mutex_lock(&gpu->sched_lock);
 
 	drm_sched_job_arm(&submit->sched_job);
 
 	submit->out_fence = dma_fence_get(&submit->sched_job.s_fence->finished);
-	submit->out_fence_id = idr_alloc_cyclic(&submit->gpu->fence_idr,
+	mutex_lock(&gpu->idr_lock);
+	submit->out_fence_id = idr_alloc_cyclic(&gpu->fence_idr,
 						submit->out_fence, 0,
 						INT_MAX, GFP_KERNEL);
+	mutex_unlock(&gpu->idr_lock);
 	if (submit->out_fence_id < 0) {
 		drm_sched_job_cleanup(&submit->sched_job);
 		ret = -ENOMEM;
@@ -124,7 +127,7 @@ int etnaviv_sched_push_job(struct etnaviv_gem_submit *submit)
 	drm_sched_entity_push_job(&submit->sched_job);
 
 out_unlock:
-	mutex_unlock(&submit->gpu->fence_lock);
+	mutex_unlock(&gpu->sched_lock);
 
 	return ret;
 }
-- 
2.30.2

