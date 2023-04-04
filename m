Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B59676D5581
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 02:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37DA210E1B8;
	Tue,  4 Apr 2023 00:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB02E10E086;
 Tue,  4 Apr 2023 00:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680567743; x=1712103743;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i//o76H+6IJY5z6VKRLFR7jKKkXZLITW7cnM9UaKkl8=;
 b=c9e6aNgBjNrft1OPiqIz5Vo0d3I8g7lZA58pNElB3leX2+WrUMpZAd1h
 8QpVKs8fSqOoqSCKH03iOT7a43e/ylJLYk4wwf6OIgSh4ILjgrQqhbWpQ
 8K3N5fI00q4DUTWknrRjkOHrNnCUAJu5igYLAEfZWkBes69s8bFQfBCaJ
 poZ6bKwUt1wUbVkSBQPLYGxOlPjYPt0XREFq1QODbYMRiWqVLzaat6ELO
 hp5sBZECuR0OkSkRMAZb1wqSPFBGViqUxjFv5DOHyXAu/Er4fi71/SN1g
 qRQqNHMQ4to82xrH7lDBqGiHAADbwh/Et5B/fVb0CQP59PDRk61RqakfD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="404810493"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="404810493"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 17:22:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="716460294"
X-IronPort-AV: E=Sophos;i="5.98,316,1673942400"; d="scan'208";a="716460294"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 17:22:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [RFC PATCH 02/10] drm/sched: Move schedule policy to scheduler /
 entity
Date: Mon,  3 Apr 2023 17:22:03 -0700
Message-Id: <20230404002211.3611376-3-matthew.brost@intel.com>
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

Rather than a global modparam for scheduling policy, move the scheduling
policy to scheduler / entity so user can control each scheduler / entity
policy.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 +
 drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  3 ++-
 drivers/gpu/drm/lima/lima_sched.c          |  3 ++-
 drivers/gpu/drm/msm/msm_ringbuffer.c       |  3 ++-
 drivers/gpu/drm/panfrost/panfrost_job.c    |  3 ++-
 drivers/gpu/drm/scheduler/sched_entity.c   | 25 ++++++++++++++++++----
 drivers/gpu/drm/scheduler/sched_main.c     | 21 +++++++++++++-----
 drivers/gpu/drm/v3d/v3d_sched.c            | 15 ++++++++-----
 include/drm/gpu_scheduler.h                | 23 ++++++++++++++------
 9 files changed, 73 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 00c9c03c8f94..4df0fca5a74c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2368,6 +2368,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
 				   ring->num_hw_submission, amdgpu_job_hang_limit,
 				   timeout, adev->reset_domain->wq,
 				   ring->sched_score, ring->name,
+				   DRM_SCHED_POLICY_DEFAULT,
 				   adev->dev);
 		if (r) {
 			DRM_ERROR("Failed to create scheduler on ring %s.\n",
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 8486a2923f1b..61204a3f8b0b 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -136,7 +136,8 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
 	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
 			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
 			     msecs_to_jiffies(500), NULL, NULL,
-			     dev_name(gpu->dev), gpu->dev);
+			     dev_name(gpu->dev), DRM_SCHED_POLICY_DEFAULT,
+			     gpu->dev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 54f53bece27c..33042ba6ae93 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -491,7 +491,8 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
 	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
 			      lima_job_hang_limit,
 			      msecs_to_jiffies(timeout), NULL,
-			      NULL, name, pipe->ldev->dev);
+			      NULL, name, DRM_SCHED_POLICY_DEFAULT,
+			      pipe->ldev->dev);
 }
 
 void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 5879fc262047..f408a9097315 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -97,7 +97,8 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 
 	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
 			num_hw_submissions, 0, sched_timeout,
-			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
+			NULL, NULL, to_msm_bo(ring->bo)->name,
+			DRM_SCHED_POLICY_DEFAULT, gpu->dev->dev);
 	if (ret) {
 		goto fail;
 	}
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index f48b07056a16..effa48b33dce 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -819,7 +819,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 				     nentries, 0,
 				     msecs_to_jiffies(JOB_TIMEOUT_MS),
 				     pfdev->reset.wq,
-				     NULL, "pan_js", pfdev->dev);
+				     NULL, "pan_js", DRM_SCHED_POLICY_DEFAULT,
+				     pfdev->dev);
 		if (ret) {
 			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
 			goto err_sched;
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 15d04a0ec623..f1299e51860b 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -33,6 +33,20 @@
 #define to_drm_sched_job(sched_job)		\
 		container_of((sched_job), struct drm_sched_job, queue_node)
 
+static bool bad_policies(struct drm_gpu_scheduler **sched_list,
+			 unsigned int num_sched_list)
+{
+	enum drm_sched_policy sched_policy = sched_list[0]->sched_policy;
+	unsigned int i;
+
+	/* All scdedule policies must match */
+	for (i = 1; i < num_sched_list; ++i)
+		if (sched_policy != sched_list[i]->sched_policy)
+			return true;
+
+	return false;
+}
+
 /**
  * drm_sched_entity_init - Init a context entity used by scheduler when
  * submit to HW ring.
@@ -62,7 +76,8 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 			  unsigned int num_sched_list,
 			  atomic_t *guilty)
 {
-	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])))
+	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])) ||
+	    bad_policies(sched_list, num_sched_list))
 		return -EINVAL;
 
 	memset(entity, 0, sizeof(struct drm_sched_entity));
@@ -75,8 +90,10 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	entity->last_scheduled = NULL;
 	RB_CLEAR_NODE(&entity->rb_tree_node);
 
-	if(num_sched_list)
+	if(num_sched_list) {
 		entity->rq = &sched_list[0]->sched_rq[entity->priority];
+		entity->sched_policy = sched_list[0]->sched_policy;
+	}
 
 	init_completion(&entity->entity_idle);
 
@@ -440,7 +457,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 	 * Update the entity's location in the min heap according to
 	 * the timestamp of the next job, if any.
 	 */
-	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
+	if (entity->sched_policy == DRM_SCHED_POLICY_FIFO) {
 		struct drm_sched_job *next;
 
 		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
@@ -528,7 +545,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 		drm_sched_rq_add_entity(entity->rq, entity);
 		spin_unlock(&entity->rq_lock);
 
-		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
+		if (entity->sched_policy == DRM_SCHED_POLICY_FIFO)
 			drm_sched_rq_update_fifo(entity, sched_job->submit_ts);
 
 		drm_sched_wakeup(entity->rq->sched);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 808008990721..77894976fa55 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -62,14 +62,14 @@
 #define to_drm_sched_job(sched_job)		\
 		container_of((sched_job), struct drm_sched_job, queue_node)
 
-int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
+int default_drm_sched_policy = DRM_SCHED_POLICY_FIFO;
 
 /**
  * DOC: sched_policy (int)
  * Used to override default entities scheduling policy in a run queue.
  */
 MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
-module_param_named(sched_policy, drm_sched_policy, int, 0444);
+module_param_named(sched_policy, default_drm_sched_policy, int, 0444);
 
 static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
 							    const struct rb_node *b)
@@ -173,7 +173,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 	if (rq->current_entity == entity)
 		rq->current_entity = NULL;
 
-	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
+	if (entity->sched_policy == DRM_SCHED_POLICY_FIFO)
 		drm_sched_rq_remove_fifo_locked(entity);
 
 	spin_unlock(&rq->lock);
@@ -931,7 +931,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 
 	/* Kernel run queue has higher priority than normal run queue*/
 	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
-		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
+		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
 			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
 			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
 		if (entity)
@@ -1106,6 +1106,7 @@ static void drm_sched_main(struct work_struct *w)
  *		used
  * @score: optional score atomic shared with other schedulers
  * @name: name used for debugging
+ * @sched_policy: schedule policy
  * @dev: target &struct device
  *
  * Return 0 on success, otherwise error code.
@@ -1115,9 +1116,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   struct workqueue_struct *run_wq,
 		   unsigned hw_submission, unsigned hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
-		   atomic_t *score, const char *name, struct device *dev)
+		   atomic_t *score, const char *name,
+		   enum drm_sched_policy sched_policy,
+		   struct device *dev)
 {
 	int i;
+
+	if (sched_policy >= DRM_SCHED_POLICY_MAX)
+		return -EINVAL;
+
 	sched->ops = ops;
 	sched->hw_submission_limit = hw_submission;
 	sched->name = name;
@@ -1127,6 +1134,10 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	sched->hang_limit = hang_limit;
 	sched->score = score ? score : &sched->_score;
 	sched->dev = dev;
+	if (sched_policy == DRM_SCHED_POLICY_DEFAULT)
+		sched->sched_policy = default_drm_sched_policy;
+	else
+		sched->sched_policy = sched_policy;
 	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
 		drm_sched_rq_init(sched, &sched->sched_rq[i]);
 
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 38e092ea41e6..5e3fe77fa991 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -391,7 +391,8 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_bin_sched_ops, NULL,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_bin", v3d->drm.dev);
+			     NULL, "v3d_bin", DRM_SCHED_POLICY_DEFAULT,
+			     v3d->drm.dev);
 	if (ret)
 		return ret;
 
@@ -399,7 +400,8 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_render_sched_ops, NULL,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_render", v3d->drm.dev);
+			     ULL, "v3d_render", DRM_SCHED_POLICY_DEFAULT,
+			     v3d->drm.dev);
 	if (ret)
 		goto fail;
 
@@ -407,7 +409,8 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_tfu_sched_ops, NULL,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_tfu", v3d->drm.dev);
+			     NULL, "v3d_tfu", DRM_SCHED_POLICY_DEFAULT,
+			     v3d->drm.dev);
 	if (ret)
 		goto fail;
 
@@ -416,7 +419,8 @@ v3d_sched_init(struct v3d_dev *v3d)
 				     &v3d_csd_sched_ops, NULL,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
-				     NULL, "v3d_csd", v3d->drm.dev);
+				     NULL, "v3d_csd", DRM_SCHED_POLICY_DEFAULT,
+				     v3d->drm.dev);
 		if (ret)
 			goto fail;
 
@@ -424,7 +428,8 @@ v3d_sched_init(struct v3d_dev *v3d)
 				     &v3d_cache_clean_sched_ops, NULL,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
-				     NULL, "v3d_cache_clean", v3d->drm.dev);
+				     NULL, "v3d_cache_clean",
+				     DRM_SCHED_POLICY_DEFAULT, v3d->drm.dev);
 		if (ret)
 			goto fail;
 	}
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 98fb5f85eba6..39cb72b7fe5d 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -72,11 +72,15 @@ enum drm_sched_priority {
 	DRM_SCHED_PRIORITY_UNSET = -2
 };
 
-/* Used to chose between FIFO and RR jobs scheduling */
-extern int drm_sched_policy;
-
-#define DRM_SCHED_POLICY_RR    0
-#define DRM_SCHED_POLICY_FIFO  1
+/* Used to chose default scheduling policy*/
+extern int default_drm_sched_policy;
+
+enum drm_sched_policy {
+	DRM_SCHED_POLICY_DEFAULT,
+	DRM_SCHED_POLICY_RR,
+	DRM_SCHED_POLICY_FIFO,
+	DRM_SCHED_POLICY_MAX,
+};
 
 /**
  * struct drm_sched_entity - A wrapper around a job queue (typically
@@ -217,6 +221,9 @@ struct drm_sched_entity {
 	 */
 	bool 				stopped;
 
+	/** @sched_policy: Schedule policy for entity */
+	enum drm_sched_policy		sched_policy;
+
 	/**
 	 * @entity_idle:
 	 *
@@ -489,6 +496,7 @@ struct drm_sched_backend_ops {
  *              guilty and it will no longer be considered for scheduling.
  * @score: score to help loadbalancer pick a idle sched
  * @_score: score used when the driver doesn't provide one
+ * @sched_policy: Schedule policy for scheduler
  * @ready: marks if the underlying HW is ready to work
  * @free_guilty: A hit to time out handler to free the guilty job.
  * @pause_run_wq: pause queuing of @work_run on @run_wq
@@ -514,6 +522,7 @@ struct drm_gpu_scheduler {
 	int				hang_limit;
 	atomic_t                        *score;
 	atomic_t                        _score;
+	enum drm_sched_policy		sched_policy;
 	bool				ready;
 	bool				free_guilty;
 	bool				pause_run_wq;
@@ -525,7 +534,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   struct workqueue_struct *run_wq,
 		   uint32_t hw_submission, unsigned hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
-		   atomic_t *score, const char *name, struct device *dev);
+		   atomic_t *score, const char *name,
+		   enum drm_sched_policy sched_policy,
+		   struct device *dev);
 
 void drm_sched_fini(struct drm_gpu_scheduler *sched);
 int drm_sched_job_init(struct drm_sched_job *job,
-- 
2.34.1

