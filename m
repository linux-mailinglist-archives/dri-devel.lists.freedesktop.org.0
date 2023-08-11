Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF0877856A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 04:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C291810E624;
	Fri, 11 Aug 2023 02:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EC910E623;
 Fri, 11 Aug 2023 02:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691721100; x=1723257100;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uDUIgAsDsBx8WowLbrWFGLyf+xrNmdA3RMmH7jL0wMU=;
 b=NGIcxvZUfG+2If3i9x14MSqY5UfE5Z3vMUq4SAfLm4Ffxm31h8RsfF1X
 2RHTAn5kTH/oYkkCZofmehuWEE9OCASAqLnYe5JmAbfsho6Vg5peOq4YY
 XB7IQVEDih07PJtQ87AdfCid6bVb+rf+OupEcNRQGEDV3+66k2m9gx1JE
 19Qe9wWYpV1Rylzh2KfU1pC83AozVmTSQ4C6FR5QeINUtLCkUY/Bn7Z8+
 8F+rZmrLcE3N4uzYmmx6vVYAOr/9Uyg6NAv6xotES41FCbeIfqiXpDtMi
 PJudNbpPejXXUfcD/akRBZx+D0Rp+R1dnMSoJqzdtLjNa8TTwEhZakkwj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="361714792"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="361714792"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 19:31:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="797838394"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="797838394"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 19:31:39 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v2 1/9] drm/sched: Convert drm scheduler to use a work queue
 rather than kthread
Date: Thu, 10 Aug 2023 19:31:29 -0700
Message-Id: <20230811023137.659037-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230811023137.659037-1-matthew.brost@intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 Matthew Brost <matthew.brost@intel.com>, sarah.walker@imgtec.com,
 ketil.johnsen@arm.com, Liviu.Dudau@arm.com, luben.tuikov@amd.com,
 lina@asahilina.net, donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
mapping between a drm_gpu_scheduler and drm_sched_entity. At first this
seems a bit odd but let us explain the reasoning below.

1. In XE the submission order from multiple drm_sched_entity is not
guaranteed to be the same completion even if targeting the same hardware
engine. This is because in XE we have a firmware scheduler, the GuC,
which allowed to reorder, timeslice, and preempt submissions. If a using
shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR falls
apart as the TDR expects submission order == completion order. Using a
dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.

2. In XE submissions are done via programming a ring buffer (circular
buffer), a drm_gpu_scheduler provides a limit on number of jobs, if the
limit of number jobs is set to RING_SIZE / MAX_SIZE_PER_JOB we get flow
control on the ring for free.

A problem with this design is currently a drm_gpu_scheduler uses a
kthread for submission / job cleanup. This doesn't scale if a large
number of drm_gpu_scheduler are used. To work around the scaling issue,
use a worker rather than kthread for submission / job cleanup.

v2:
  - (Rob Clark) Fix msm build
  - Pass in run work queue
v3:
  - (Boris) don't have loop in worker
v4:
  - (Tvrtko) break out submit ready, stop, start helpers into own patch

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   2 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c    |   2 +-
 drivers/gpu/drm/lima/lima_sched.c          |   2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c       |   2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c    |   2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c    |   2 +-
 drivers/gpu/drm/scheduler/sched_main.c     | 106 +++++++++------------
 drivers/gpu/drm/v3d/v3d_sched.c            |  10 +-
 include/drm/gpu_scheduler.h                |  12 ++-
 9 files changed, 65 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 5f5efec6c444..3ebf9882edba 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2331,7 +2331,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
 			break;
 		}
 
-		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
+		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops, NULL,
 				   ring->num_hw_submission, 0,
 				   timeout, adev->reset_domain->wq,
 				   ring->sched_score, ring->name,
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 1ae87dfd19c4..8486a2923f1b 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -133,7 +133,7 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
 {
 	int ret;
 
-	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
+	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
 			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
 			     msecs_to_jiffies(500), NULL, NULL,
 			     dev_name(gpu->dev), gpu->dev);
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index ffd91a5ee299..8d858aed0e56 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -488,7 +488,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
 
 	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
 
-	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
+	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
 			      lima_job_hang_limit,
 			      msecs_to_jiffies(timeout), NULL,
 			      NULL, name, pipe->ldev->dev);
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index b60199184409..79aa112118da 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -93,7 +93,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 	 /* currently managing hangcheck ourselves: */
 	sched_timeout = MAX_SCHEDULE_TIMEOUT;
 
-	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
+	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
 			num_hw_submissions, 0, sched_timeout,
 			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
 	if (ret) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 3424a1bf6af3..2d607de5d393 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -407,7 +407,7 @@ int nouveau_sched_init(struct nouveau_drm *drm)
 	if (!drm->sched_wq)
 		return -ENOMEM;
 
-	return drm_sched_init(sched, &nouveau_sched_ops,
+	return drm_sched_init(sched, &nouveau_sched_ops, NULL,
 			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
 			      NULL, NULL, "nouveau_sched", drm->dev->dev);
 }
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index a8b4827dc425..4efbc8aa3c2f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -831,7 +831,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 		js->queue[j].fence_context = dma_fence_context_alloc(1);
 
 		ret = drm_sched_init(&js->queue[j].sched,
-				     &panfrost_sched_ops,
+				     &panfrost_sched_ops, NULL,
 				     nentries, 0,
 				     msecs_to_jiffies(JOB_TIMEOUT_MS),
 				     pfdev->reset.wq,
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index e4fa62abca41..614e8c97a622 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -48,7 +48,6 @@
  * through the jobs entity pointer.
  */
 
-#include <linux/kthread.h>
 #include <linux/wait.h>
 #include <linux/sched.h>
 #include <linux/completion.h>
@@ -256,6 +255,16 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
 	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
 }
 
+/**
+ * drm_sched_submit_queue - scheduler queue submission
+ * @sched: scheduler instance
+ */
+static void drm_sched_submit_queue(struct drm_gpu_scheduler *sched)
+{
+	if (!READ_ONCE(sched->pause_submit))
+		queue_work(sched->submit_wq, &sched->work_submit);
+}
+
 /**
  * drm_sched_job_done - complete a job
  * @s_job: pointer to the job which is done
@@ -275,7 +284,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
 	dma_fence_get(&s_fence->finished);
 	drm_sched_fence_finished(s_fence, result);
 	dma_fence_put(&s_fence->finished);
-	wake_up_interruptible(&sched->wake_up_worker);
+	drm_sched_submit_queue(sched);
 }
 
 /**
@@ -868,7 +877,7 @@ static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
 void drm_sched_wakeup_if_can_queue(struct drm_gpu_scheduler *sched)
 {
 	if (drm_sched_can_queue(sched))
-		wake_up_interruptible(&sched->wake_up_worker);
+		drm_sched_submit_queue(sched);
 }
 
 /**
@@ -978,61 +987,42 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
 }
 EXPORT_SYMBOL(drm_sched_pick_best);
 
-/**
- * drm_sched_blocked - check if the scheduler is blocked
- *
- * @sched: scheduler instance
- *
- * Returns true if blocked, otherwise false.
- */
-static bool drm_sched_blocked(struct drm_gpu_scheduler *sched)
-{
-	if (kthread_should_park()) {
-		kthread_parkme();
-		return true;
-	}
-
-	return false;
-}
-
 /**
  * drm_sched_main - main scheduler thread
  *
  * @param: scheduler instance
- *
- * Returns 0.
  */
-static int drm_sched_main(void *param)
+static void drm_sched_main(struct work_struct *w)
 {
-	struct drm_gpu_scheduler *sched = (struct drm_gpu_scheduler *)param;
+	struct drm_gpu_scheduler *sched =
+		container_of(w, struct drm_gpu_scheduler, work_submit);
+	struct drm_sched_entity *entity;
+	struct drm_sched_job *cleanup_job;
 	int r;
 
-	sched_set_fifo_low(current);
+	if (READ_ONCE(sched->pause_submit))
+		return;
 
-	while (!kthread_should_stop()) {
-		struct drm_sched_entity *entity = NULL;
-		struct drm_sched_fence *s_fence;
-		struct drm_sched_job *sched_job;
-		struct dma_fence *fence;
-		struct drm_sched_job *cleanup_job = NULL;
+	cleanup_job = drm_sched_get_cleanup_job(sched);
+	entity = drm_sched_select_entity(sched);
 
-		wait_event_interruptible(sched->wake_up_worker,
-					 (cleanup_job = drm_sched_get_cleanup_job(sched)) ||
-					 (!drm_sched_blocked(sched) &&
-					  (entity = drm_sched_select_entity(sched))) ||
-					 kthread_should_stop());
+	if (!entity && !cleanup_job)
+		return;	/* No more work */
 
-		if (cleanup_job)
-			sched->ops->free_job(cleanup_job);
+	if (cleanup_job)
+		sched->ops->free_job(cleanup_job);
 
-		if (!entity)
-			continue;
+	if (entity) {
+		struct dma_fence *fence;
+		struct drm_sched_fence *s_fence;
+		struct drm_sched_job *sched_job;
 
 		sched_job = drm_sched_entity_pop_job(entity);
-
 		if (!sched_job) {
 			complete_all(&entity->entity_idle);
-			continue;
+			if (!cleanup_job)
+				return;	/* No more work */
+			goto again;
 		}
 
 		s_fence = sched_job->s_fence;
@@ -1063,7 +1053,9 @@ static int drm_sched_main(void *param)
 
 		wake_up(&sched->job_scheduled);
 	}
-	return 0;
+
+again:
+	drm_sched_submit_queue(sched);
 }
 
 /**
@@ -1071,6 +1063,7 @@ static int drm_sched_main(void *param)
  *
  * @sched: scheduler instance
  * @ops: backend operations for this scheduler
+ * @submit_wq: workqueue to use for submission. If NULL, the system_wq is used
  * @hw_submission: number of hw submissions that can be in flight
  * @hang_limit: number of times to allow a job to hang before dropping it
  * @timeout: timeout value in jiffies for the scheduler
@@ -1084,14 +1077,16 @@ static int drm_sched_main(void *param)
  */
 int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
+		   struct workqueue_struct *submit_wq,
 		   unsigned hw_submission, unsigned hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
 		   atomic_t *score, const char *name, struct device *dev)
 {
-	int i, ret;
+	int i;
 	sched->ops = ops;
 	sched->hw_submission_limit = hw_submission;
 	sched->name = name;
+	sched->submit_wq = submit_wq ? : system_wq;
 	sched->timeout = timeout;
 	sched->timeout_wq = timeout_wq ? : system_wq;
 	sched->hang_limit = hang_limit;
@@ -1100,23 +1095,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
 		drm_sched_rq_init(sched, &sched->sched_rq[i]);
 
-	init_waitqueue_head(&sched->wake_up_worker);
 	init_waitqueue_head(&sched->job_scheduled);
 	INIT_LIST_HEAD(&sched->pending_list);
 	spin_lock_init(&sched->job_list_lock);
 	atomic_set(&sched->hw_rq_count, 0);
 	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
+	INIT_WORK(&sched->work_submit, drm_sched_main);
 	atomic_set(&sched->_score, 0);
 	atomic64_set(&sched->job_id_count, 0);
-
-	/* Each scheduler will run on a seperate kernel thread */
-	sched->thread = kthread_run(drm_sched_main, sched, sched->name);
-	if (IS_ERR(sched->thread)) {
-		ret = PTR_ERR(sched->thread);
-		sched->thread = NULL;
-		DRM_DEV_ERROR(sched->dev, "Failed to create scheduler for %s.\n", name);
-		return ret;
-	}
+	sched->pause_submit = false;
 
 	sched->ready = true;
 	return 0;
@@ -1135,8 +1122,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	struct drm_sched_entity *s_entity;
 	int i;
 
-	if (sched->thread)
-		kthread_stop(sched->thread);
+	drm_sched_submit_stop(sched);
 
 	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
 		struct drm_sched_rq *rq = &sched->sched_rq[i];
@@ -1216,7 +1202,7 @@ EXPORT_SYMBOL(drm_sched_increase_karma);
  */
 bool drm_sched_submit_ready(struct drm_gpu_scheduler *sched)
 {
-	return !!sched->thread;
+	return sched->ready;
 
 }
 EXPORT_SYMBOL(drm_sched_submit_ready);
@@ -1228,7 +1214,8 @@ EXPORT_SYMBOL(drm_sched_submit_ready);
  */
 void drm_sched_submit_stop(struct drm_gpu_scheduler *sched)
 {
-	kthread_park(sched->thread);
+	WRITE_ONCE(sched->pause_submit, true);
+	cancel_work_sync(&sched->work_submit);
 }
 EXPORT_SYMBOL(drm_sched_submit_stop);
 
@@ -1239,6 +1226,7 @@ EXPORT_SYMBOL(drm_sched_submit_stop);
  */
 void drm_sched_submit_start(struct drm_gpu_scheduler *sched)
 {
-	kthread_unpark(sched->thread);
+	WRITE_ONCE(sched->pause_submit, false);
+	queue_work(sched->submit_wq, &sched->work_submit);
 }
 EXPORT_SYMBOL(drm_sched_submit_start);
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 06238e6d7f5c..38e092ea41e6 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -388,7 +388,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 	int ret;
 
 	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
-			     &v3d_bin_sched_ops,
+			     &v3d_bin_sched_ops, NULL,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
 			     NULL, "v3d_bin", v3d->drm.dev);
@@ -396,7 +396,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 		return ret;
 
 	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
-			     &v3d_render_sched_ops,
+			     &v3d_render_sched_ops, NULL,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
 			     NULL, "v3d_render", v3d->drm.dev);
@@ -404,7 +404,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 		goto fail;
 
 	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
-			     &v3d_tfu_sched_ops,
+			     &v3d_tfu_sched_ops, NULL,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
 			     NULL, "v3d_tfu", v3d->drm.dev);
@@ -413,7 +413,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 
 	if (v3d_has_csd(v3d)) {
 		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
-				     &v3d_csd_sched_ops,
+				     &v3d_csd_sched_ops, NULL,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
 				     NULL, "v3d_csd", v3d->drm.dev);
@@ -421,7 +421,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 			goto fail;
 
 		ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
-				     &v3d_cache_clean_sched_ops,
+				     &v3d_cache_clean_sched_ops, NULL,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
 				     NULL, "v3d_cache_clean", v3d->drm.dev);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index f12c5aea5294..278106e358a8 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -473,17 +473,16 @@ struct drm_sched_backend_ops {
  * @timeout: the time after which a job is removed from the scheduler.
  * @name: name of the ring for which this scheduler is being used.
  * @sched_rq: priority wise array of run queues.
- * @wake_up_worker: the wait queue on which the scheduler sleeps until a job
- *                  is ready to be scheduled.
  * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
  *                 waits on this wait queue until all the scheduled jobs are
  *                 finished.
  * @hw_rq_count: the number of jobs currently in the hardware queue.
  * @job_id_count: used to assign unique id to the each job.
+ * @submit_wq: workqueue used to queue @work_submit
  * @timeout_wq: workqueue used to queue @work_tdr
+ * @work_submit: schedules jobs and cleans up entities
  * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
  *            timeout interval is over.
- * @thread: the kthread on which the scheduler which run.
  * @pending_list: the list of jobs which are currently in the job queue.
  * @job_list_lock: lock to protect the pending_list.
  * @hang_limit: once the hangs by a job crosses this limit then it is marked
@@ -492,6 +491,7 @@ struct drm_sched_backend_ops {
  * @_score: score used when the driver doesn't provide one
  * @ready: marks if the underlying HW is ready to work
  * @free_guilty: A hit to time out handler to free the guilty job.
+ * @pause_submit: pause queuing of @work_submit on @submit_wq
  * @dev: system &struct device
  *
  * One scheduler is implemented for each hardware ring.
@@ -502,13 +502,13 @@ struct drm_gpu_scheduler {
 	long				timeout;
 	const char			*name;
 	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_COUNT];
-	wait_queue_head_t		wake_up_worker;
 	wait_queue_head_t		job_scheduled;
 	atomic_t			hw_rq_count;
 	atomic64_t			job_id_count;
+	struct workqueue_struct		*submit_wq;
 	struct workqueue_struct		*timeout_wq;
+	struct work_struct		work_submit;
 	struct delayed_work		work_tdr;
-	struct task_struct		*thread;
 	struct list_head		pending_list;
 	spinlock_t			job_list_lock;
 	int				hang_limit;
@@ -516,11 +516,13 @@ struct drm_gpu_scheduler {
 	atomic_t                        _score;
 	bool				ready;
 	bool				free_guilty;
+	bool				pause_submit;
 	struct device			*dev;
 };
 
 int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
+		   struct workqueue_struct *submit_wq,
 		   uint32_t hw_submission, unsigned hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
 		   atomic_t *score, const char *name, struct device *dev);
-- 
2.34.1

