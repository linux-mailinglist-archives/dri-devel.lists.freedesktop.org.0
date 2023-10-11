Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B767C6150
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 01:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7796610E3BD;
	Wed, 11 Oct 2023 23:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7605410E2E4;
 Wed, 11 Oct 2023 23:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697068686; x=1728604686;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zLQ+wfQYx2jugptiSESJpTRqBQYnIgVmFDwUp8vCp54=;
 b=WMJiwfyq3lmt6SYKMa62yUdEuS/TqMxWfePBQmLly4nC/eLESJUWcHXC
 m6nr5IV6Iw2aLLB9IA7eJFd2ved/AR4yorhLjhFwQ8oAHQYpYMyz1IlT8
 hEGYfKQvMAjrk9hu+pVn2bp4BBo2B0kHMXmx2cZOgSKZMwtMvPOBxVqvM
 TXSfYx/yl9IhMHfG7SAUc5j4bFjGUWhCFTIxL8brWjYjCBnnUGg1VxNwz
 u+d8vDoRkkHTGw2Sk8aJtSTRfCWMgGAyg5MGOdjSGoPAsHnCqe/2Vbkp6
 3BzqrQh+mXEbaQPZXqZ2Qr5ER8S1e1L6jout+WujLq19GsW8OBN9YAo7I A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="387637382"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="387637382"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 16:58:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="824367790"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="824367790"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 16:58:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v5 3/7] drm/sched: Move schedule policy to scheduler
Date: Wed, 11 Oct 2023 16:58:22 -0700
Message-Id: <20231011235826.585624-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011235826.585624-1-matthew.brost@intel.com>
References: <20231011235826.585624-1-matthew.brost@intel.com>
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
 Matthew Brost <matthew.brost@intel.com>, lina@asahilina.net,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, luben.tuikov@amd.com, dakr@redhat.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rather than a global modparam for scheduling policy, move the scheduling
policy to scheduler so user can control each scheduler policy.

v2:
  - s/DRM_SCHED_POLICY_MAX/DRM_SCHED_POLICY_COUNT (Luben)
  - Only include policy in scheduler (Luben)
v3:
  - use a ternary operator as opposed to an if-control (Luben)
  - s/DRM_SCHED_POLICY_DEFAULT/DRM_SCHED_POLICY_UNSET/ (Luben)
  - s/default_drm_sched_policy/drm_sched_policy_default/ (Luben)
  - Update commit message (Boris)
  - Fix v3d build (CI)
  - s/bad_policies/drm_sched_policy_mismatch/ (Luben)
  - Don't update modparam doc (Luben)
v4:
  - Fix alignment in msm_ringbuffer_new (Luben / checkpatch)

Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 +
 drivers/gpu/drm/etnaviv/etnaviv_sched.c    |  3 ++-
 drivers/gpu/drm/lima/lima_sched.c          |  3 ++-
 drivers/gpu/drm/msm/msm_ringbuffer.c       |  2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c    |  3 ++-
 drivers/gpu/drm/panfrost/panfrost_job.c    |  3 ++-
 drivers/gpu/drm/scheduler/sched_entity.c   | 24 ++++++++++++++++++----
 drivers/gpu/drm/scheduler/sched_main.c     | 19 ++++++++++++-----
 drivers/gpu/drm/v3d/v3d_sched.c            | 15 +++++++++-----
 include/drm/gpu_scheduler.h                | 20 ++++++++++++------
 10 files changed, 68 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index b54c4d771104..e4e6f91450a4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2283,6 +2283,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
 				   ring->num_hw_submission, 0,
 				   timeout, adev->reset_domain->wq,
 				   ring->sched_score, ring->name,
+				   DRM_SCHED_POLICY_UNSET,
 				   adev->dev);
 		if (r) {
 			DRM_ERROR("Failed to create scheduler on ring %s.\n",
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 618a804ddc34..15b0e2f1abe5 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -137,7 +137,8 @@ int etnaviv_sched_init(struct etnaviv_gpu *gpu)
 	ret = drm_sched_init(&gpu->sched, &etnaviv_sched_ops, NULL,
 			     etnaviv_hw_jobs_limit, etnaviv_job_hang_limit,
 			     msecs_to_jiffies(500), NULL, NULL,
-			     dev_name(gpu->dev), gpu->dev);
+			     dev_name(gpu->dev), DRM_SCHED_POLICY_UNSET,
+			     gpu->dev);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 8d858aed0e56..50c2075228aa 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -491,7 +491,8 @@ int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const char *name)
 	return drm_sched_init(&pipe->base, &lima_sched_ops, NULL, 1,
 			      lima_job_hang_limit,
 			      msecs_to_jiffies(timeout), NULL,
-			      NULL, name, pipe->ldev->dev);
+			      NULL, name, DRM_SCHED_POLICY_UNSET,
+			      pipe->ldev->dev);
 }
 
 void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 1097f8e93d6b..173ad2f17c50 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -97,7 +97,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 	ret = drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
 			     num_hw_submissions, 0, sched_timeout,
 			     NULL, NULL, to_msm_bo(ring->bo)->name,
-			     gpu->dev->dev);
+			     DRM_SCHED_POLICY_UNSET, gpu->dev->dev);
 	if (ret) {
 		goto fail;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 4c959dec42b3..c4e09d2e77f9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -437,7 +437,8 @@ int nouveau_sched_init(struct nouveau_drm *drm)
 
 	return drm_sched_init(sched, &nouveau_sched_ops, NULL,
 			      NOUVEAU_SCHED_HW_SUBMISSIONS, 0, job_hang_limit,
-			      NULL, NULL, "nouveau_sched", drm->dev->dev);
+			      NULL, NULL, "nouveau_sched",
+			      DRM_SCHED_POLICY_UNSET, drm->dev->dev);
 }
 
 void nouveau_sched_fini(struct nouveau_drm *drm)
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 934b7b930c76..95330ff402ba 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -856,7 +856,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
 				     nentries, 0,
 				     msecs_to_jiffies(JOB_TIMEOUT_MS),
 				     pfdev->reset.wq,
-				     NULL, "pan_js", pfdev->dev);
+				     NULL, "pan_js", DRM_SCHED_POLICY_UNSET,
+				     pfdev->dev);
 		if (ret) {
 			dev_err(pfdev->dev, "Failed to create scheduler: %d.", ret);
 			goto err_sched;
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index a42763e1429d..cf42e2265d64 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -33,6 +33,20 @@
 #define to_drm_sched_job(sched_job)		\
 		container_of((sched_job), struct drm_sched_job, queue_node)
 
+static bool drm_sched_policy_mismatch(struct drm_gpu_scheduler **sched_list,
+				      unsigned int num_sched_list)
+{
+	enum drm_sched_policy sched_policy = sched_list[0]->sched_policy;
+	unsigned int i;
+
+	/* All schedule policies must match */
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
+	    drm_sched_policy_mismatch(sched_list, num_sched_list))
 		return -EINVAL;
 
 	memset(entity, 0, sizeof(struct drm_sched_entity));
@@ -486,7 +501,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 	 * Update the entity's location in the min heap according to
 	 * the timestamp of the next job, if any.
 	 */
-	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
+	if (entity->rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO) {
 		struct drm_sched_job *next;
 
 		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
@@ -558,7 +573,8 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 {
 	struct drm_sched_entity *entity = sched_job->entity;
-	bool first;
+	bool first, fifo = entity->rq->sched->sched_policy ==
+		DRM_SCHED_POLICY_FIFO;
 	ktime_t submit_ts;
 
 	trace_drm_sched_job(sched_job, entity);
@@ -587,7 +603,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 		drm_sched_rq_add_entity(entity->rq, entity);
 		spin_unlock(&entity->rq_lock);
 
-		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
+		if (fifo)
 			drm_sched_rq_update_fifo(entity, submit_ts);
 
 		drm_sched_wakeup_if_can_queue(entity->rq->sched);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 8b1d52cff1e9..150e5330f0fa 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -66,14 +66,14 @@
 #define to_drm_sched_job(sched_job)		\
 		container_of((sched_job), struct drm_sched_job, queue_node)
 
-int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
+int drm_sched_policy_default = DRM_SCHED_POLICY_FIFO;
 
 /**
  * DOC: sched_policy (int)
  * Used to override default entities scheduling policy in a run queue.
  */
 MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
-module_param_named(sched_policy, drm_sched_policy, int, 0444);
+module_param_named(sched_policy, drm_sched_policy_default, int, 0444);
 
 static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
 							    const struct rb_node *b)
@@ -177,7 +177,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 	if (rq->current_entity == entity)
 		rq->current_entity = NULL;
 
-	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
+	if (rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO)
 		drm_sched_rq_remove_fifo_locked(entity);
 
 	spin_unlock(&rq->lock);
@@ -898,7 +898,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 
 	/* Kernel run queue has higher priority than normal run queue*/
 	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
-		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
+		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
 			drm_sched_rq_select_entity_fifo(&sched->sched_rq[i]) :
 			drm_sched_rq_select_entity_rr(&sched->sched_rq[i]);
 		if (entity)
@@ -1072,6 +1072,7 @@ static void drm_sched_main(struct work_struct *w)
  *		used
  * @score: optional score atomic shared with other schedulers
  * @name: name used for debugging
+ * @sched_policy: schedule policy
  * @dev: target &struct device
  *
  * Return 0 on success, otherwise error code.
@@ -1081,9 +1082,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   struct workqueue_struct *submit_wq,
 		   unsigned hw_submission, unsigned hang_limit,
 		   long timeout, struct workqueue_struct *timeout_wq,
-		   atomic_t *score, const char *name, struct device *dev)
+		   atomic_t *score, const char *name,
+		   enum drm_sched_policy sched_policy,
+		   struct device *dev)
 {
 	int i;
+
+	if (sched_policy >= DRM_SCHED_POLICY_COUNT)
+		return -EINVAL;
+
 	sched->ops = ops;
 	sched->hw_submission_limit = hw_submission;
 	sched->name = name;
@@ -1102,6 +1109,8 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	sched->hang_limit = hang_limit;
 	sched->score = score ? score : &sched->_score;
 	sched->dev = dev;
+	sched->sched_policy = sched_policy == DRM_SCHED_POLICY_UNSET ?
+		drm_sched_policy_default : sched_policy;
 	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
 		drm_sched_rq_init(sched, &sched->sched_rq[i]);
 
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 38e092ea41e6..dec89c5b8cb1 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -391,7 +391,8 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_bin_sched_ops, NULL,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_bin", v3d->drm.dev);
+			     NULL, "v3d_bin", DRM_SCHED_POLICY_UNSET,
+			     v3d->drm.dev);
 	if (ret)
 		return ret;
 
@@ -399,7 +400,8 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_render_sched_ops, NULL,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_render", v3d->drm.dev);
+			     NULL, "v3d_render", DRM_SCHED_POLICY_UNSET,
+			     v3d->drm.dev);
 	if (ret)
 		goto fail;
 
@@ -407,7 +409,8 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     &v3d_tfu_sched_ops, NULL,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
-			     NULL, "v3d_tfu", v3d->drm.dev);
+			     NULL, "v3d_tfu", DRM_SCHED_POLICY_UNSET,
+			     v3d->drm.dev);
 	if (ret)
 		goto fail;
 
@@ -416,7 +419,8 @@ v3d_sched_init(struct v3d_dev *v3d)
 				     &v3d_csd_sched_ops, NULL,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
-				     NULL, "v3d_csd", v3d->drm.dev);
+				     NULL, "v3d_csd", DRM_SCHED_POLICY_UNSET,
+				     v3d->drm.dev);
 		if (ret)
 			goto fail;
 
@@ -424,7 +428,8 @@ v3d_sched_init(struct v3d_dev *v3d)
 				     &v3d_cache_clean_sched_ops, NULL,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
-				     NULL, "v3d_cache_clean", v3d->drm.dev);
+				     NULL, "v3d_cache_clean",
+				     DRM_SCHED_POLICY_UNSET, v3d->drm.dev);
 		if (ret)
 			goto fail;
 	}
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 211bd3cdabdc..320f0a720486 100644
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
+	DRM_SCHED_POLICY_UNSET,
+	DRM_SCHED_POLICY_RR,
+	DRM_SCHED_POLICY_FIFO,
+	DRM_SCHED_POLICY_COUNT,
+};
 
 /**
  * struct drm_sched_entity - A wrapper around a job queue (typically
@@ -489,6 +493,7 @@ struct drm_sched_backend_ops {
  *              guilty and it will no longer be considered for scheduling.
  * @score: score to help loadbalancer pick a idle sched
  * @_score: score used when the driver doesn't provide one
+ * @sched_policy: Schedule policy for scheduler
  * @ready: marks if the underlying HW is ready to work
  * @free_guilty: A hit to time out handler to free the guilty job.
  * @pause_submit: pause queuing of @work_submit on @submit_wq
@@ -515,6 +520,7 @@ struct drm_gpu_scheduler {
 	int				hang_limit;
 	atomic_t                        *score;
 	atomic_t                        _score;
+	enum drm_sched_policy		sched_policy;
 	bool				ready;
 	bool				free_guilty;
 	bool				pause_submit;
@@ -527,7 +533,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   struct workqueue_struct *submit_wq,
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

