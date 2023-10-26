Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F8D7D7B65
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 06:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A49BC10E75A;
	Thu, 26 Oct 2023 04:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B38910E74E;
 Thu, 26 Oct 2023 04:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698293531; x=1729829531;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=srZlW93CzFj1Wi67kKaAmgkGTFsgDyjZChI3EMEZRws=;
 b=V1fUc4cgdOhcmPYnNB4CxAvzmLqyoBoMj8FByxlqStftbPhWS1QII4yw
 oTRiT0kVx5gtwpIRRcs0MgV5tJGKjL7BIVyMRBZjQlfSCRumq5iWX6otG
 qdqIY3/+z6Rzx3i2bvTAT5Wz72g+Ccl9MIVkMMcpA3pXgzRp3jKi4OHgz
 2w8P5p+VBe0ur1ROnBABhbVNSUB0X0sIsNPkTkliYSxYXrrO0g/iqPyfj
 QJvCwqBHQ/7D/hsggXjm47D/ddGH6IgFKBzlYXu1+rTKBc5CQVyRHHai2
 4V2YORgxQeIJtvXwvkszdHjFF0Xl6Ej54Lm/f31Kdedkp6+awRiELDxS6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="377823023"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="377823023"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:12:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762685131"
X-IronPort-AV: E=Sophos;i="6.03,252,1694761200"; d="scan'208";a="762685131"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 21:12:09 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v7 3/6] drm/sched: Convert the GPU scheduler to variable
 number of run-queues
Date: Wed, 25 Oct 2023 21:12:33 -0700
Message-Id: <20231026041236.1273694-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026041236.1273694-1-matthew.brost@intel.com>
References: <20231026041236.1273694-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Emma Anholt <emma@anholt.net>, lina@asahilina.net, Liviu.Dudau@arm.com,
 Matthew Brost <matthew.brost@intel.com>, robdclark@chromium.org,
 lima@lists.freedesktop.org, mcanal@igalia.com, luben.tuikov@amd.com,
 dakr@redhat.com, donald.robson@imgtec.com,
 Russell King <linux+etnaviv@armlinux.org.uk>, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, etnaviv@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, nouveau@lists.freedesktop.org,
 faith.ekstrand@collabora.com, boris.brezillon@collabora.com,
 Qiang Yu <yuq825@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Luben Tuikov <luben.tuikov@amd.com>

The GPU scheduler has now a variable number of run-queues, which are set up at
drm_sched_init() time. This way, each driver announces how many run-queues it
requires (supports) per each GPU scheduler it creates. Note, that run-queues
correspond to scheduler "priorities", thus if the number of run-queues is set
to 1 at drm_sched_init(), then that scheduler supports a single run-queue,
i.e. single "priority". If a driver further sets a single entity per
run-queue, then this creates a 1-to-1 correspondence between a scheduler and
a scheduled entity.

Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Qiang Yu <yuq825@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Emma Anholt <emma@anholt.net>
Cc: etnaviv@lists.freedesktop.org
Cc: lima@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  4 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  3 +-
 drivers/gpu/drm/lima/lima_sched.c          |  3 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c       |  3 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c    |  1 +
 drivers/gpu/drm/panfrost/panfrost_job.c    |  3 +-
 drivers/gpu/drm/scheduler/sched_entity.c   | 18 +++++-
 drivers/gpu/drm/scheduler/sched_main.c     | 75 ++++++++++++++++++----
 drivers/gpu/drm/v3d/v3d_sched.c            | 14 ++--
 include/drm/gpu_scheduler.h                |  9 ++-
 11 files changed, 102 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index b54c4d771104..94d073bfbd13 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2280,6 +2280,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
 		}
 
 		r = drm_sched_init(&ring->sched, &amdgpu_sched_ops, NULL,
+				   DRM_SCHED_PRIORITY_COUNT,
 				   ring->num_hw_submission, 0,
 				   timeout, adev->reset_domain->wq,
 				   ring->sched_score, ring->name,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 78476bc75b4e..1f357198533f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -325,8 +325,8 @@ void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
 	int i;
 
 	/* Signal all jobs not yet scheduled */
-	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
-		struct drm_sched_rq *rq = &sched->sched_rq[i];
+	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+		struct drm_sched_rq *rq = sched->sched_rq[i];
 		spin_lock(&rq->lock);
 		list_for_each_entry(s_entity, &rq->entities, list) {
 			while ((s_job = to_drm_sched_job(spsc_queue_pop(&s_entity->job_queue)))) {
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 618a804ddc34..396334984e4d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -134,7 +134,8 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
 {
 	int ret;
 
-	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
+	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
+			     DRM_SCHED_PRIORITY_COUNT, NULL,
 			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
 			     msecs_to_jiffies(500), NULL, NULL,
 			     dev_name(gpu->dev), gpu->dev);
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 8d858aed0e56..23a6276f1332 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -488,7 +488,8 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
 
 	INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
 
-	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
+	return drm_sched_init(&pipe->base, &lima_sched_ops,
+			      DRM_SCHED_PRIORITY_COUNT, NULL, 1,
 			      lima_job_hang_limit,
 			      msecs_to_jiffies(timeout), NULL,
 			      NULL, name, pipe->ldev->dev);
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 1097f8e93d6b..935154979fc2 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -94,7 +94,8 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 	 /* currently managing hangcheck ourselves: */
 	sched_timeout = MAX_SCHEDULE_TIMEOUT;
 
-	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
+	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
+			     DRM_SCHED_PRIORITY_COUNT, NULL,
 			     num_hw_submissions, 0, sched_timeout,
 			     NULL, NULL, to_msm_bo(ring->bo)->name,
 			     gpu->dev->dev);
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 4c959dec42b3..c4ba56b1a6dd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -436,6 +436,7 @@ int nouveau_sched_init(struct nouveau_drm *drm)
 		return -ENOMEM;
 
 	return drm_sched_init(sched, &nouveau_sched_ops, NULL,
+			      DRM_SCHED_PRIORITY_COUNT,
 			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
 			      NULL, NULL, "nouveau_sched", drm->dev->dev);
 }
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 934b7b930c76..205d62c04f96 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -852,7 +852,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 		js->queue[j].fence_context = dma_fence_context_alloc(1);
 
 		ret = drm_sched_init(&js->queue[j].sched,
-				     &panfrost_sched_ops, NULL,
+				     &panfrost_sched_ops,
+				     DRM_SCHED_PRIORITY_COUNT, NULL,
 				     nentries, 0,
 				     msecs_to_jiffies(JOB_TIMEOUT_MS),
 				     pfdev->reset.wq,
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index a42763e1429d..409e4256f6e7 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -75,8 +75,20 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	RCU_INIT_POINTER(entity->last_scheduled, NULL);
 	RB_CLEAR_NODE(&entity->rb_tree_node);
 
-	if(num_sched_list)
-		entity->rq = &sched_list[0]->sched_rq[entity->priority];
+	if (!sched_list[0]->sched_rq) {
+		/* Warn drivers not to do this and to fix their DRM
+		 * calling order.
+		 */
+		pr_warn("%s: called with uninitialized scheduler\n", __func__);
+	} else if (num_sched_list) {
+		/* The "priority" of an entity cannot exceed the number
+		 * of run-queues of a scheduler.
+		 */
+		if (entity->priority >= sched_list[0]->num_rqs)
+			entity->priority = max_t(u32, sched_list[0]->num_rqs,
+						 DRM_SCHED_PRIORITY_MIN);
+		entity->rq = sched_list[0]->sched_rq[entity->priority];
+	}
 
 	init_completion(&entity->entity_idle);
 
@@ -533,7 +545,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 
 	spin_lock(&entity->rq_lock);
 	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
-	rq = sched ? &sched->sched_rq[entity->priority] : NULL;
+	rq = sched ? sched->sched_rq[entity->priority] : NULL;
 	if (rq != entity->rq) {
 		drm_sched_rq_remove_entity(entity->rq, entity);
 		entity->rq = rq;
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 3a955b8acc4e..b22157e920d4 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -641,8 +641,14 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
 		       void *owner)
 {
-	if (!entity->rq)
+	if (!entity->rq) {
+		/* This will most likely be followed by missing frames
+		 * or worse--a blank screen--leave a trail in the
+		 * logs, so this can be debugged easier.
+		 */
+		drm_err(job->sched, "%s: entity has no rq!\n", __func__);
 		return -ENOENT;
+	}
 
 	job->entity = entity;
 	job->s_fence = drm_sched_fence_alloc(entity, owner);
@@ -680,7 +686,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 	sched = entity->rq->sched;
 
 	job->sched = sched;
-	job->s_priority = entity->rq - sched->sched_rq;
+	job->s_priority = entity->priority;
 	job->id = atomic64_inc_return(&sched->job_id_count);
 
 	drm_sched_fence_init(job->s_fence, job->entity);
@@ -897,10 +903,10 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 		return NULL;
 
 	/* Kernel run queue has higher priority than normal run queue*/
-	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
 		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
-			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
-			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
+			drm_sched_rq_select_entity_fifo(sched->sched_rq[i]) :
+			drm_sched_rq_select_entity_rr(sched->sched_rq[i]);
 		if (entity)
 			break;
 	}
@@ -1065,6 +1071,7 @@ static void drm_sched_main(struct work_struct *w)
  * @ops: backend operations for this scheduler
  * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
  *	       allocated and used
+ * @num_rqs: number of runqueues, one for each priority, up to DRM_SCHED_PRIORITY_COUNT
  * @hw_submission: number of hw submissions that can be in flight
  * @hang_limit: number of times to allow a job to hang before dropping it
  * @timeout: timeout value in jiffies for the scheduler
@@ -1079,11 +1086,12 @@ static void drm_sched_main(struct work_struct *w)
 int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
 		   struct workqueue_struct *submit_wq,
-		   unsigned hw_submission, unsigned hang_limit,
+		   u32 num_rqs, unsigned hw_submission, unsigned hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
 		   atomic_t *score, const char *name, struct device *dev)
 {
-	int i;
+	int i, ret;
+
 	sched->ops = ops;
 	sched->hw_submission_limit = hw_submission;
 	sched->name = name;
@@ -1102,8 +1110,36 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	sched->hang_limit = hang_limit;
 	sched->score = score ? score : &sched->_score;
 	sched->dev = dev;
-	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
-		drm_sched_rq_init(sched, &sched->sched_rq[i]);
+
+	if (num_rqs > DRM_SCHED_PRIORITY_COUNT) {
+		/* This is a gross violation--tell drivers what the  problem is.
+		 */
+		drm_err(sched, "%s: num_rqs cannot be greater than DRM_SCHED_PRIORITY_COUNT\n",
+			__func__);
+		return -EINVAL;
+	} else if (sched->sched_rq) {
+		/* Not an error, but warn anyway so drivers can
+		 * fine-tune their DRM calling order, and return all
+		 * is good.
+		 */
+		drm_warn(sched, "%s: scheduler already initialized!\n", __func__);
+		return 0;
+	}
+
+	sched->sched_rq = kmalloc_array(num_rqs, sizeof(*sched->sched_rq),
+					GFP_KERNEL | __GFP_ZERO);
+	if (!sched->sched_rq) {
+		drm_err(sched, "%s: out of memory for sched_rq\n", __func__);
+		return -ENOMEM;
+	}
+	sched->num_rqs = num_rqs;
+	ret = -ENOMEM;
+	for (i = DRM_SCHED_PRIORITY_MIN; i < sched->num_rqs; i++) {
+		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
+		if (!sched->sched_rq[i])
+			goto Out_unroll;
+		drm_sched_rq_init(sched, sched->sched_rq[i]);
+	}
 
 	init_waitqueue_head(&sched->job_scheduled);
 	INIT_LIST_HEAD(&sched->pending_list);
@@ -1117,6 +1153,14 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 
 	sched->ready = true;
 	return 0;
+
+Out_unroll:
+	for (--i ; i >= DRM_SCHED_PRIORITY_MIN; i--)
+		kfree(sched->sched_rq[i]);
+	kfree(sched->sched_rq);
+	sched->sched_rq = NULL;
+	drm_err(sched, "%s: Failed to setup GPU scheduler--out of memory\n", __func__);
+	return ret;
 }
 EXPORT_SYMBOL(drm_sched_init);
 
@@ -1134,8 +1178,8 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 
 	drm_sched_wqueue_stop(sched);
 
-	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
-		struct drm_sched_rq *rq = &sched->sched_rq[i];
+	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+		struct drm_sched_rq *rq = sched->sched_rq[i];
 
 		spin_lock(&rq->lock);
 		list_for_each_entry(s_entity, &rq->entities, list)
@@ -1146,7 +1190,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 			 */
 			s_entity->stopped = true;
 		spin_unlock(&rq->lock);
-
+		kfree(sched->sched_rq[i]);
 	}
 
 	/* Wakeup everyone stuck in drm_sched_entity_flush for this scheduler */
@@ -1158,6 +1202,8 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	if (sched->own_submit_wq)
 		destroy_workqueue(sched->submit_wq);
 	sched->ready = false;
+	kfree(sched->sched_rq);
+	sched->sched_rq = NULL;
 }
 EXPORT_SYMBOL(drm_sched_fini);
 
@@ -1184,9 +1230,10 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
 	if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
 		atomic_inc(&bad->karma);
 
-		for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_KERNEL;
+		for (i = DRM_SCHED_PRIORITY_MIN;
+		     i < min_t(typeof(sched->num_rqs), sched->num_rqs, DRM_SCHED_PRIORITY_KERNEL);
 		     i++) {
-			struct drm_sched_rq *rq = &sched->sched_rq[i];
+			struct drm_sched_rq *rq = sched->sched_rq[i];
 
 			spin_lock(&rq->lock);
 			list_for_each_entry_safe(entity, tmp, &rq->entities, list) {
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 38e092ea41e6..175c3e30647a 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -388,7 +388,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 	int ret;
 
 	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
-			     &v3d_bin_sched_ops, NULL,
+			     &v3d_bin_sched_ops, DRM_SCHED_PRIORITY_COUNT, NULL,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
 			     NULL, "v3d_bin", v3d->drm.dev);
@@ -396,15 +396,15 @@ v3d_sched_init(struct v3d_dev *v3d)
 		return ret;
 
 	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
-			     &v3d_render_sched_ops, NULL,
-			     hw_jobs_limit, job_hang_limit,
+			     &v3d_render_sched_ops, DRM_SCHED_PRIORITY_COUNT,
+			     NULL, hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
 			     NULL, "v3d_render", v3d->drm.dev);
 	if (ret)
 		goto fail;
 
 	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
-			     &v3d_tfu_sched_ops, NULL,
+			     &v3d_tfu_sched_ops, DRM_SCHED_PRIORITY_COUNT, NULL,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
 			     NULL, "v3d_tfu", v3d->drm.dev);
@@ -413,7 +413,8 @@ v3d_sched_init(struct v3d_dev *v3d)
 
 	if (v3d_has_csd(v3d)) {
 		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
-				     &v3d_csd_sched_ops, NULL,
+				     &v3d_csd_sched_ops,
+				     DRM_SCHED_PRIORITY_COUNT, NULL,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
 				     NULL, "v3d_csd", v3d->drm.dev);
@@ -421,7 +422,8 @@ v3d_sched_init(struct v3d_dev *v3d)
 			goto fail;
 
 		ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
-				     &v3d_cache_clean_sched_ops, NULL,
+				     &v3d_cache_clean_sched_ops,
+				     DRM_SCHED_PRIORITY_COUNT, NULL,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
 				     NULL, "v3d_cache_clean", v3d->drm.dev);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 211bd3cdabdc..1d52b8bbb06c 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -472,7 +472,9 @@ struct drm_sched_backend_ops {
  * @hw_submission_limit: the max size of the hardware queue.
  * @timeout: the time after which a job is removed from the scheduler.
  * @name: name of the ring for which this scheduler is being used.
- * @sched_rq: priority wise array of run queues.
+ * @num_rqs: Number of run-queues. This is at most DRM_SCHED_PRIORITY_COUNT,
+ *           as there's usually one run-queue per priority, but could be less.
+ * @sched_rq: An allocated array of run-queues of size @num_rqs;
  * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
  *                 waits on this wait queue until all the scheduled jobs are
  *                 finished.
@@ -502,7 +504,8 @@ struct drm_gpu_scheduler {
 	uint32_t			hw_submission_limit;
 	long				timeout;
 	const char			*name;
-	struct drm_sched_rq		sched_rq[DRM_SCHED_PRIORITY_COUNT];
+	u32                             num_rqs;
+	struct drm_sched_rq             **sched_rq;
 	wait_queue_head_t		job_scheduled;
 	atomic_t			hw_rq_count;
 	atomic64_t			job_id_count;
@@ -525,7 +528,7 @@ struct drm_gpu_scheduler {
 int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   const struct drm_sched_backend_ops *ops,
 		   struct workqueue_struct *submit_wq,
-		   uint32_t hw_submission, unsigned hang_limit,
+		   u32 num_rqs, uint32_t hw_submission, unsigned hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
 		   atomic_t *score, const char *name, struct device *dev);
 
-- 
2.34.1

