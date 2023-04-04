Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5DB6D557A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 02:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62FA10E08A;
	Tue,  4 Apr 2023 00:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335E810E048;
 Tue,  4 Apr 2023 00:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680567743; x=1712103743;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wwnYER675pjMy4dMA1qWSvZlWrML7EZ5g0Owafj6GsQ=;
 b=WTKeB9vlsJ+wiuAFbUMDJF3kqYRDPpQXOmwuvr5jGhGn5FBxRjN3DM1t
 1Rsoa2m01Ggyf7BP1SD2ZzfXwVKrCl7SwNXrYEXplgPM9TmBgtdXXm13h
 69ZFKXSZY7AA1Xfuo31H17sCKjXhhY8/yE8jMk5HoDLFyFi26HgyJD3la
 s1L8w1oztNE3V1+/9AcZ9v403jOGwVxqIenZkqGGk3IOEXIbmpk9SwdE+
 Pk5uh9ggisASR/1TlXn9UA1p78DfjgtO2WNSdJq+njWJ9dLXDn+MYCO9O
 ZxewPUaFmgDwcpbDMIUtLTzMejw4erjhK4syNG8eEOUBP/VrBZML4xod9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="404810485"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="404810485"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 17:22:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="716460291"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="716460291"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 17:22:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [RFC PATCH 01/10] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
Date: Mon,  3 Apr 2023 17:22:02 -0700
Message-Id: <20230404002211.3611376-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404002211.3611376-1-matthew.brost@intel.com>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com, airlied@linux.ie,
 lina@asahilina.net, boris.brezillon@collabora.com,
 Matthew Brost <matthew.brost@intel.com>, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  14 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  14 +--
 drivers/gpu/drm/etnaviv/etnaviv_sched.c     |   2 +-
 drivers/gpu/drm/lima/lima_sched.c           |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c  |   6 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c        |   2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c     |   2 +-
 drivers/gpu/drm/scheduler/sched_main.c      | 126 ++++++++++++--------
 drivers/gpu/drm/v3d/v3d_sched.c             |  10 +-
 include/drm/gpu_scheduler.h                 |  14 ++-
 10 files changed, 110 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index f60753f97ac5..9c2a10aeb0b3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1489,9 +1489,9 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
 	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
 		struct amdgpu_ring *ring = adev->rings[i];
 
-		if (!ring || !ring->sched.thread)
+		if (!ring || !ring->sched.ready)
 			continue;
-		kthread_park(ring->sched.thread);
+		drm_sched_run_wq_stop(&ring->sched);
 	}
 
 	seq_printf(m, "run ib test:\n");
@@ -1505,9 +1505,9 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
 	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
 		struct amdgpu_ring *ring = adev->rings[i];
 
-		if (!ring || !ring->sched.thread)
+		if (!ring || !ring->sched.ready)
 			continue;
-		kthread_unpark(ring->sched.thread);
+		drm_sched_run_wq_start(&ring->sched);
 	}
 
 	up_write(&adev->reset_domain->sem);
@@ -1727,7 +1727,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
 
 	ring = adev->rings[val];
 
-	if (!ring || !ring->funcs->preempt_ib || !ring->sched.thread)
+	if (!ring || !ring->funcs->preempt_ib || !ring->sched.ready)
 		return -EINVAL;
 
 	/* the last preemption failed */
@@ -1745,7 +1745,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
 		goto pro_end;
 
 	/* stop the scheduler */
-	kthread_park(ring->sched.thread);
+	drm_sched_run_wq_stop(&ring->sched);
 
 	/* preempt the IB */
 	r = amdgpu_ring_preempt_ib(ring);
@@ -1779,7 +1779,7 @@ static int amdgpu_debugfs_ib_preempt(void *data, u64 val)
 
 failure:
 	/* restart the scheduler */
-	kthread_unpark(ring->sched.thread);
+	drm_sched_run_wq_start(&ring->sched);
 
 	up_read(&adev->reset_domain->sem);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index fac9312b1695..00c9c03c8f94 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2364,7 +2364,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
 			break;
 		}
 
-		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
+		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops, NULL,
 				   ring->num_hw_submission, amdgpu_job_hang_limit,
 				   timeout, adev->reset_domain->wq,
 				   ring->sched_score, ring->name,
@@ -4627,7 +4627,7 @@ bool amdgpu_device_has_job_running(struct amdgpu_device *adev)
 	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 		struct amdgpu_ring *ring = adev->rings[i];
 
-		if (!ring || !ring->sched.thread)
+		if (!ring || !ring->sched.ready)
 			continue;
 
 		spin_lock(&ring->sched.job_list_lock);
@@ -4753,7 +4753,7 @@ int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
 	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 		struct amdgpu_ring *ring = adev->rings[i];
 
-		if (!ring || !ring->sched.thread)
+		if (!ring || !ring->sched.ready)
 			continue;
 
 		/*clear job fence from fence drv to avoid force_completion
@@ -5294,7 +5294,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 			struct amdgpu_ring *ring = tmp_adev->rings[i];
 
-			if (!ring || !ring->sched.thread)
+			if (!ring || !ring->sched.ready)
 				continue;
 
 			drm_sched_stop(&ring->sched, job ? &job->base : NULL);
@@ -5369,7 +5369,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
 		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 			struct amdgpu_ring *ring = tmp_adev->rings[i];
 
-			if (!ring || !ring->sched.thread)
+			if (!ring || !ring->sched.ready)
 				continue;
 
 			drm_sched_start(&ring->sched, true);
@@ -5696,7 +5696,7 @@ pci_ers_result_t amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_sta
 		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 			struct amdgpu_ring *ring = adev->rings[i];
 
-			if (!ring || !ring->sched.thread)
+			if (!ring || !ring->sched.ready)
 				continue;
 
 			drm_sched_stop(&ring->sched, NULL);
@@ -5824,7 +5824,7 @@ void amdgpu_pci_resume(struct pci_dev *pdev)
 	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
 		struct amdgpu_ring *ring = adev->rings[i];
 
-		if (!ring || !ring->sched.thread)
+		if (!ring || !ring->sched.ready)
 			continue;
 
 		drm_sched_start(&ring->sched, true);
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
index ff003403fbbc..54f53bece27c 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -488,7 +488,7 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
 
 	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
 
-	return drm_sched_init(&pipe->base, &lima_sched_ops, 1,
+	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
 			      lima_job_hang_limit,
 			      msecs_to_jiffies(timeout), NULL,
 			      NULL, name, pipe->ldev->dev);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index c5c4c93b3689..f76ce11a5384 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -662,7 +662,8 @@ static void suspend_scheduler(struct msm_gpu *gpu)
 	 */
 	for (i = 0; i < gpu->nr_rings; i++) {
 		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
-		kthread_park(sched->thread);
+
+		drm_sched_run_wq_stop(sched);
 	}
 }
 
@@ -672,7 +673,8 @@ static void resume_scheduler(struct msm_gpu *gpu)
 
 	for (i = 0; i < gpu->nr_rings; i++) {
 		struct drm_gpu_scheduler *sched = &gpu->rb[i]->sched;
-		kthread_unpark(sched->thread);
+
+		drm_sched_run_wq_start(sched);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 57a8e9564540..5879fc262047 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -95,7 +95,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 	 /* currently managing hangcheck ourselves: */
 	sched_timeout = MAX_SCHEDULE_TIMEOUT;
 
-	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
+	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
 			num_hw_submissions, 0, sched_timeout,
 			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
 	if (ret) {
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index dbc597ab46fb..f48b07056a16 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -815,7 +815,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 		js->queue[j].fence_context = dma_fence_context_alloc(1);
 
 		ret = drm_sched_init(&js->queue[j].sched,
-				     &panfrost_sched_ops,
+				     &panfrost_sched_ops, NULL,
 				     nentries, 0,
 				     msecs_to_jiffies(JOB_TIMEOUT_MS),
 				     pfdev->reset.wq,
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index a18c8f5e8cc0..808008990721 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -44,7 +44,6 @@
  * The jobs in a entity are always scheduled in the order that they were pushed.
  */
 
-#include <linux/kthread.h>
 #include <linux/wait.h>
 #include <linux/sched.h>
 #include <linux/completion.h>
@@ -252,6 +251,53 @@ drm_sched_rq_select_entity_fifo(struct drm_sched_rq *rq)
 	return rb ? rb_entry(rb, struct drm_sched_entity, rb_tree_node) : NULL;
 }
 
+/**
+ * drm_sched_run_wq_stop - stop scheduler run worker
+ *
+ * @sched: scheduler instance to stop run worker
+ */
+void drm_sched_run_wq_stop(struct drm_gpu_scheduler *sched)
+{
+	sched->pause_run_wq = true;
+	smp_wmb();
+
+	cancel_work_sync(&sched->work_run);
+}
+EXPORT_SYMBOL(drm_sched_run_wq_stop);
+
+/**
+ * drm_sched_run_wq_start - start scheduler run worker
+ *
+ * @sched: scheduler instance to start run worker
+ */
+void drm_sched_run_wq_start(struct drm_gpu_scheduler *sched)
+{
+	sched->pause_run_wq = false;
+	smp_wmb();
+
+	queue_work(sched->run_wq, &sched->work_run);
+}
+EXPORT_SYMBOL(drm_sched_run_wq_start);
+
+/**
+ * drm_sched_run_wq_queue - queue scheduler run worker
+ *
+ * @sched: scheduler instance to queue run worker
+ */
+static void drm_sched_run_wq_queue(struct drm_gpu_scheduler *sched)
+{
+	smp_rmb();
+
+	/*
+	 * Try not to schedule work if pause_run_wq set but not the end of world
+	 * if we do as either it will be cancelled by the above
+	 * cancel_work_sync, or drm_sched_main turns into a NOP while
+	 * pause_run_wq is set.
+	 */
+	if (!sched->pause_run_wq)
+		queue_work(sched->run_wq, &sched->work_run);
+}
+
 /**
  * drm_sched_job_done - complete a job
  * @s_job: pointer to the job which is done
@@ -271,7 +317,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job)
 	dma_fence_get(&s_fence->finished);
 	drm_sched_fence_finished(s_fence);
 	dma_fence_put(&s_fence->finished);
-	wake_up_interruptible(&sched->wake_up_worker);
+	drm_sched_run_wq_queue(sched);
 }
 
 /**
@@ -434,7 +480,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 {
 	struct drm_sched_job *s_job, *tmp;
 
-	kthread_park(sched->thread);
+	drm_sched_run_wq_stop(sched);
 
 	/*
 	 * Reinsert back the bad job here - now it's safe as
@@ -547,7 +593,7 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
 		spin_unlock(&sched->job_list_lock);
 	}
 
-	kthread_unpark(sched->thread);
+	drm_sched_run_wq_start(sched);
 }
 EXPORT_SYMBOL(drm_sched_start);
 
@@ -864,7 +910,7 @@ static bool drm_sched_ready(struct drm_gpu_scheduler *sched)
 void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
 {
 	if (drm_sched_ready(sched))
-		wake_up_interruptible(&sched->wake_up_worker);
+		drm_sched_run_wq_queue(sched);
 }
 
 /**
@@ -974,60 +1020,42 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
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
+		container_of(w, struct drm_gpu_scheduler, work_run);
 	int r;
 
-	sched_set_fifo_low(current);
-
-	while (!kthread_should_stop()) {
-		struct drm_sched_entity *entity = NULL;
+	while (!READ_ONCE(sched->pause_run_wq)) {
+		struct drm_sched_entity *entity;
 		struct drm_sched_fence *s_fence;
 		struct drm_sched_job *sched_job;
 		struct dma_fence *fence;
-		struct drm_sched_job *cleanup_job = NULL;
+		struct drm_sched_job *cleanup_job;
 
-		wait_event_interruptible(sched->wake_up_worker,
-					 (cleanup_job = drm_sched_get_cleanup_job(sched)) ||
-					 (!drm_sched_blocked(sched) &&
-					  (entity = drm_sched_select_entity(sched))) ||
-					 kthread_should_stop());
+		cleanup_job = drm_sched_get_cleanup_job(sched);
+		entity = drm_sched_select_entity(sched);
 
 		if (cleanup_job)
 			sched->ops->free_job(cleanup_job);
 
-		if (!entity)
+		if (!entity) {
+			if (!cleanup_job)
+				break;
 			continue;
+		}
 
 		sched_job = drm_sched_entity_pop_job(entity);
 
 		if (!sched_job) {
 			complete_all(&entity->entity_idle);
+			if (!cleanup_job)
+				break;
 			continue;
 		}
 
@@ -1055,14 +1083,14 @@ static int drm_sched_main(void *param)
 					  r);
 		} else {
 			if (IS_ERR(fence))
-				dma_fence_set_error(&s_fence->finished, PTR_ERR(fence));
+				dma_fence_set_error(&s_fence->finished,
+						    PTR_ERR(fence));
 
 			drm_sched_job_done(sched_job);
 		}
 
 		wake_up(&sched->job_scheduled);
 	}
-	return 0;
 }
 
 /**
@@ -1070,6 +1098,7 @@ static int drm_sched_main(void *param)
  *
  * @sched: scheduler instance
  * @ops: backend operations for this scheduler
+ * @run_wq: workqueue to use for run work. If NULL, the system_wq is used
  * @hw_submission: number of hw submissions that can be in flight
  * @hang_limit: number of times to allow a job to hang before dropping it
  * @timeout: timeout value in jiffies for the scheduler
@@ -1083,14 +1112,16 @@ static int drm_sched_main(void *param)
  */
 int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
+		   struct workqueue_struct *run_wq,
 		   unsigned hw_submission, unsigned hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
 		   atomic_t *score, const char *name, struct device *dev)
 {
-	int i, ret;
+	int i;
 	sched->ops = ops;
 	sched->hw_submission_limit = hw_submission;
 	sched->name = name;
+	sched->run_wq = run_wq ? : system_wq;
 	sched->timeout = timeout;
 	sched->timeout_wq = timeout_wq ? : system_wq;
 	sched->hang_limit = hang_limit;
@@ -1099,23 +1130,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
 		drm_sched_rq_init(sched, &sched->sched_rq[i]);
 
-	init_waitqueue_head(&sched->wake_up_worker);
 	init_waitqueue_head(&sched->job_scheduled);
 	INIT_LIST_HEAD(&sched->pending_list);
 	spin_lock_init(&sched->job_list_lock);
 	atomic_set(&sched->hw_rq_count, 0);
 	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
+	INIT_WORK(&sched->work_run, drm_sched_main);
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
+	sched->pause_run_wq = false;
 
 	sched->ready = true;
 	return 0;
@@ -1134,8 +1157,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	struct drm_sched_entity *s_entity;
 	int i;
 
-	if (sched->thread)
-		kthread_stop(sched->thread);
+	drm_sched_run_wq_stop(sched);
 
 	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
 		struct drm_sched_rq *rq = &sched->sched_rq[i];
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
index c0586d832260..98fb5f85eba6 100644
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
+ * @run_wq: workqueue used to queue @work_run
  * @timeout_wq: workqueue used to queue @work_tdr
+ * @work_run: schedules jobs and cleans up entities
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
+ * @pause_run_wq: pause queuing of @work_run on @run_wq
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
+	struct workqueue_struct		*run_wq;
 	struct workqueue_struct		*timeout_wq;
+	struct work_struct		work_run;
 	struct delayed_work		work_tdr;
-	struct task_struct		*thread;
 	struct list_head		pending_list;
 	spinlock_t			job_list_lock;
 	int				hang_limit;
@@ -516,11 +516,13 @@ struct drm_gpu_scheduler {
 	atomic_t                        _score;
 	bool				ready;
 	bool				free_guilty;
+	bool				pause_run_wq;
 	struct device			*dev;
 };
 
 int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
+		   struct workqueue_struct *run_wq,
 		   uint32_t hw_submission, unsigned hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
 		   atomic_t *score, const char *name, struct device *dev);
@@ -550,6 +552,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 
 void drm_sched_job_cleanup(struct drm_sched_job *job);
 void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
+void drm_sched_run_wq_stop(struct drm_gpu_scheduler *sched);
+void drm_sched_run_wq_start(struct drm_gpu_scheduler *sched);
 void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
 void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
 void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
-- 
2.34.1

