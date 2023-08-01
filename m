Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8795476BEC0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 22:51:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8FB10E41D;
	Tue,  1 Aug 2023 20:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E0410E1E1;
 Tue,  1 Aug 2023 20:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690923071; x=1722459071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i4fpXtQfDe2gCzmpBaZ8MhTsieWyAwr+ioyL0iejNDU=;
 b=Hku+kbuXSE4IEpJGVcrkDNwCSiYZ0xLafrzZXuZPFuOveqaBGPAM0tt7
 MQCePIlO4q/Nts2fvvnkp09kGB1816txQMFCOVIWm0Kp225LmM/M29rij
 56dZRyItg3Dkl6oUmtvKOB6uap3vGO1KIelmlqkMtdo1G94vlHewYXVVB
 j9zZIalQLAP0H79IKwX9L/9cK83M0CfLHy1lMaVZyrwnohEjyfut2c9u2
 Y+iW0yDNhCIAyByd42LBARwUfOQVEAaIB5QDBDnLDGS8J1q/VrWG0Yn7t
 VDYiUjSgWBIIQnxB+00oqkILernRdY5cBxVguS8XS7Dcfd9yKNvqnwoLD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="373051723"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; d="scan'208";a="373051723"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 13:51:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="872215404"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 13:51:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 3/8] drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY scheduling
 policy
Date: Tue,  1 Aug 2023 13:50:58 -0700
Message-Id: <20230801205103.627779-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230801205103.627779-1-matthew.brost@intel.com>
References: <20230801205103.627779-1-matthew.brost@intel.com>
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

DRM_SCHED_POLICY_SINGLE_ENTITY creates a 1 to 1 relationship between
scheduler and entity. No priorities or run queue used in this mode.
Intended for devices with firmware schedulers.

v2:
  - Drop sched / rq union (Luben)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 69 ++++++++++++++++++------
 drivers/gpu/drm/scheduler/sched_fence.c  |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c   | 62 ++++++++++++++++++---
 include/drm/gpu_scheduler.h              |  8 +++
 4 files changed, 118 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 941ea8edead2..59c1ca578256 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -83,6 +83,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	memset(entity, 0, sizeof(struct drm_sched_entity));
 	INIT_LIST_HEAD(&entity->list);
 	entity->rq = NULL;
+	entity->single_sched = NULL;
 	entity->guilty = guilty;
 	entity->num_sched_list = num_sched_list;
 	entity->priority = priority;
@@ -90,8 +91,17 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	entity->last_scheduled = NULL;
 	RB_CLEAR_NODE(&entity->rb_tree_node);
 
-	if(num_sched_list)
-		entity->rq = &sched_list[0]->sched_rq[entity->priority];
+	if (num_sched_list) {
+		if (sched_list[0]->sched_policy !=
+		    DRM_SCHED_POLICY_SINGLE_ENTITY) {
+			entity->rq = &sched_list[0]->sched_rq[entity->priority];
+		} else {
+			if (num_sched_list != 1 || sched_list[0]->single_entity)
+				return -EINVAL;
+			sched_list[0]->single_entity = entity;
+			entity->single_sched = sched_list[0];
+		}
+	}
 
 	init_completion(&entity->entity_idle);
 
@@ -124,7 +134,8 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				    struct drm_gpu_scheduler **sched_list,
 				    unsigned int num_sched_list)
 {
-	WARN_ON(!num_sched_list || !sched_list);
+	WARN_ON(!num_sched_list || !sched_list ||
+		!!entity->single_sched);
 
 	entity->sched_list = sched_list;
 	entity->num_sched_list = num_sched_list;
@@ -194,13 +205,15 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
 {
 	struct drm_sched_job *job;
 	struct dma_fence *prev;
+	bool single_entity = !!entity->single_sched;
 
-	if (!entity->rq)
+	if (!entity->rq && !single_entity)
 		return;
 
 	spin_lock(&entity->rq_lock);
 	entity->stopped = true;
-	drm_sched_rq_remove_entity(entity->rq, entity);
+	if (!single_entity)
+		drm_sched_rq_remove_entity(entity->rq, entity);
 	spin_unlock(&entity->rq_lock);
 
 	/* Make sure this entity is not used by the scheduler at the moment */
@@ -222,6 +235,20 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
 	dma_fence_put(prev);
 }
 
+/**
+ * drm_sched_entity_to_scheduler - Schedule entity to GPU scheduler
+ * @entity: scheduler entity
+ *
+ * Returns GPU scheduler for the entity
+ */
+struct drm_gpu_scheduler *
+drm_sched_entity_to_scheduler(struct drm_sched_entity *entity)
+{
+	bool single_entity = !!entity->single_sched;
+
+	return single_entity ? entity->single_sched : entity->rq->sched;
+}
+
 /**
  * drm_sched_entity_flush - Flush a context entity
  *
@@ -239,11 +266,12 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
 	struct drm_gpu_scheduler *sched;
 	struct task_struct *last_user;
 	long ret = timeout;
+	bool single_entity = !!entity->single_sched;
 
-	if (!entity->rq)
+	if (!entity->rq && !single_entity)
 		return 0;
 
-	sched = entity->rq->sched;
+	sched = drm_sched_entity_to_scheduler(entity);
 	/**
 	 * The client will not queue more IBs during this fini, consume existing
 	 * queued IBs or discard them on SIGKILL
@@ -336,7 +364,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
 		container_of(cb, struct drm_sched_entity, cb);
 
 	drm_sched_entity_clear_dep(f, cb);
-	drm_sched_wakeup(entity->rq->sched);
+	drm_sched_wakeup(drm_sched_entity_to_scheduler(entity));
 }
 
 /**
@@ -350,6 +378,8 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
 void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
 				   enum drm_sched_priority priority)
 {
+	WARN_ON(!!entity->single_sched);
+
 	spin_lock(&entity->rq_lock);
 	entity->priority = priority;
 	spin_unlock(&entity->rq_lock);
@@ -362,7 +392,7 @@ EXPORT_SYMBOL(drm_sched_entity_set_priority);
  */
 static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
 {
-	struct drm_gpu_scheduler *sched = entity->rq->sched;
+	struct drm_gpu_scheduler *sched = drm_sched_entity_to_scheduler(entity);
 	struct dma_fence *fence = entity->dependency;
 	struct drm_sched_fence *s_fence;
 
@@ -455,7 +485,8 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 	 * Update the entity's location in the min heap according to
 	 * the timestamp of the next job, if any.
 	 */
-	if (entity->rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO) {
+	if (drm_sched_entity_to_scheduler(entity)->sched_policy ==
+	    DRM_SCHED_POLICY_FIFO) {
 		struct drm_sched_job *next;
 
 		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
@@ -472,6 +503,8 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 	struct drm_gpu_scheduler *sched;
 	struct drm_sched_rq *rq;
 
+	WARN_ON(!!entity->single_sched);
+
 	/* single possible engine and already selected */
 	if (!entity->sched_list)
 		return;
@@ -521,17 +554,22 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 {
 	struct drm_sched_entity *entity = sched_job->entity;
-	bool first, fifo = entity->rq->sched->sched_policy ==
-		DRM_SCHED_POLICY_FIFO;
+	bool single_entity = !!entity->single_sched;
+	bool first;
 
 	trace_drm_sched_job(sched_job, entity);
-	atomic_inc(entity->rq->sched->score);
+	if (!single_entity)
+		atomic_inc(entity->rq->sched->score);
 	WRITE_ONCE(entity->last_user, current->group_leader);
 	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
 	sched_job->submit_ts = ktime_get();
 
 	/* first job wakes up scheduler */
 	if (first) {
+		struct drm_gpu_scheduler *sched =
+			drm_sched_entity_to_scheduler(entity);
+		bool fifo = sched->sched_policy == DRM_SCHED_POLICY_FIFO;
+
 		/* Add the entity to the run queue */
 		spin_lock(&entity->rq_lock);
 		if (entity->stopped) {
@@ -541,13 +579,14 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 			return;
 		}
 
-		drm_sched_rq_add_entity(entity->rq, entity);
+		if (!single_entity)
+			drm_sched_rq_add_entity(entity->rq, entity);
 		spin_unlock(&entity->rq_lock);
 
 		if (fifo)
 			drm_sched_rq_update_fifo(entity, sched_job->submit_ts);
 
-		drm_sched_wakeup(entity->rq->sched);
+		drm_sched_wakeup(sched);
 	}
 }
 EXPORT_SYMBOL(drm_sched_entity_push_job);
diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index fe9c6468e440..d7cfc0441885 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -213,7 +213,7 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
 {
 	unsigned seq;
 
-	fence->sched = entity->rq->sched;
+	fence->sched = drm_sched_entity_to_scheduler(entity);
 	seq = atomic_inc_return(&entity->fence_seq);
 	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
 		       &fence->lock, entity->fence_context, seq);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 27989345889d..2597fb298733 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -32,7 +32,8 @@
  * backend operations to the scheduler like submitting a job to hardware run queue,
  * returning the dependencies of a job etc.
  *
- * The organisation of the scheduler is the following:
+ * The organisation of the scheduler is the following for scheduling policies
+ * DRM_SCHED_POLICY_RR and DRM_SCHED_POLICY_FIFO:
  *
  * 1. Each hw run queue has one scheduler
  * 2. Each scheduler has multiple run queues with different priorities
@@ -42,6 +43,22 @@
  *    the hardware.
  *
  * The jobs in a entity are always scheduled in the order that they were pushed.
+ * The organisation of the scheduler is the following for scheduling policy
+ * DRM_SCHED_POLICY_SINGLE_ENTITY:
+ *
+ * 1. One to one relationship between scheduler and entity
+ * 2. No priorities implemented per scheduler (single job queue)
+ * 3. No run queues in scheduler rather jobs are directly dequeued from entity
+ * 4. The entity maintains a queue of jobs that will be scheduled on the
+ * hardware
+ *
+ * The jobs in a entity are always scheduled in the order that they were pushed
+ * regardless of scheduling policy.
+ *
+ * A policy of DRM_SCHED_POLICY_RR or DRM_SCHED_POLICY_FIFO is expected to used
+ * when the KMD is scheduling directly on the hardware while a scheduling policy
+ * of DRM_SCHED_POLICY_SINGLE_ENTITY is expected to be used when there is a
+ * firmware scheduler.
  */
 
 #include <linux/wait.h>
@@ -92,6 +109,8 @@ static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *enti
 
 void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
 {
+	WARN_ON(!!entity->single_sched);
+
 	/*
 	 * Both locks need to be grabbed, one to protect from entity->rq change
 	 * for entity from within concurrent drm_sched_entity_select_rq and the
@@ -122,6 +141,8 @@ void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
 static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
 			      struct drm_sched_rq *rq)
 {
+	WARN_ON(sched->sched_policy == DRM_SCHED_POLICY_SINGLE_ENTITY);
+
 	spin_lock_init(&rq->lock);
 	INIT_LIST_HEAD(&rq->entities);
 	rq->rb_tree_root = RB_ROOT_CACHED;
@@ -140,6 +161,8 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
 void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 			     struct drm_sched_entity *entity)
 {
+	WARN_ON(!!entity->single_sched);
+
 	if (!list_empty(&entity->list))
 		return;
 
@@ -162,6 +185,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 				struct drm_sched_entity *entity)
 {
+	WARN_ON(!!entity->single_sched);
+
 	if (list_empty(&entity->list))
 		return;
 
@@ -667,7 +692,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
 		       void *owner)
 {
-	if (!entity->rq)
+	if (!entity->rq && !entity->single_sched)
 		return -ENOENT;
 
 	job->entity = entity;
@@ -700,13 +725,16 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 {
 	struct drm_gpu_scheduler *sched;
 	struct drm_sched_entity *entity = job->entity;
+	bool single_entity = !!entity->single_sched;
 
 	BUG_ON(!entity);
-	drm_sched_entity_select_rq(entity);
-	sched = entity->rq->sched;
+	if (!single_entity)
+		drm_sched_entity_select_rq(entity);
+	sched = drm_sched_entity_to_scheduler(entity);
 
 	job->sched = sched;
-	job->s_priority = entity->rq - sched->sched_rq;
+	if (!single_entity)
+		job->s_priority = entity->rq - sched->sched_rq;
 	job->id = atomic64_inc_return(&sched->job_id_count);
 
 	drm_sched_fence_init(job->s_fence, job->entity);
@@ -923,6 +951,13 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 	if (!drm_sched_ready(sched))
 		return NULL;
 
+	if (sched->single_entity) {
+		if (drm_sched_entity_is_ready(sched->single_entity))
+			return sched->single_entity;
+
+		return NULL;
+	}
+
 	/* Kernel run queue has higher priority than normal run queue*/
 	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
 		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
@@ -1122,6 +1157,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		return -EINVAL;
 
 	sched->ops = ops;
+	sched->single_entity = NULL;
 	sched->hw_submission_limit = hw_submission;
 	sched->name = name;
 	sched->run_wq = run_wq ? : system_wq;
@@ -1134,7 +1170,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		sched->sched_policy = default_drm_sched_policy;
 	else
 		sched->sched_policy = sched_policy;
-	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
+	for (i = DRM_SCHED_PRIORITY_MIN; sched_policy !=
+	     DRM_SCHED_POLICY_SINGLE_ENTITY && i < DRM_SCHED_PRIORITY_COUNT;
+	     i++)
 		drm_sched_rq_init(sched, &sched->sched_rq[i]);
 
 	init_waitqueue_head(&sched->job_scheduled);
@@ -1166,7 +1204,15 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 
 	drm_sched_run_wq_stop(sched);
 
-	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+	if (sched->single_entity) {
+		spin_lock(&sched->single_entity->rq_lock);
+		sched->single_entity->stopped = true;
+		spin_unlock(&sched->single_entity->rq_lock);
+	}
+
+	for (i = DRM_SCHED_PRIORITY_COUNT - 1; sched->sched_policy !=
+	     DRM_SCHED_POLICY_SINGLE_ENTITY && i >= DRM_SCHED_PRIORITY_MIN;
+	     i--) {
 		struct drm_sched_rq *rq = &sched->sched_rq[i];
 
 		if (!rq)
@@ -1210,6 +1256,8 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
 	struct drm_sched_entity *entity;
 	struct drm_gpu_scheduler *sched = bad->sched;
 
+	WARN_ON(sched->sched_policy == DRM_SCHED_POLICY_SINGLE_ENTITY);
+
 	/* don't change @bad's karma if it's from KERNEL RQ,
 	 * because sometimes GPU hang would cause kernel jobs (like VM updating jobs)
 	 * corrupt but keep in mind that kernel jobs always considered good.
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 7474142daca6..df1993dd44ae 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -79,6 +79,7 @@ enum drm_sched_policy {
 	DRM_SCHED_POLICY_DEFAULT,
 	DRM_SCHED_POLICY_RR,
 	DRM_SCHED_POLICY_FIFO,
+	DRM_SCHED_POLICY_SINGLE_ENTITY,
 	DRM_SCHED_POLICY_COUNT,
 };
 
@@ -112,6 +113,9 @@ struct drm_sched_entity {
 	 */
 	struct drm_sched_rq		*rq;
 
+	/** @single_sched: Single scheduler */
+	struct drm_gpu_scheduler	*single_sched;
+
 	/**
 	 * @sched_list:
 	 *
@@ -473,6 +477,7 @@ struct drm_sched_backend_ops {
  * struct drm_gpu_scheduler - scheduler instance-specific data
  *
  * @ops: backend operations provided by the driver.
+ * @single_entity: Single entity for the scheduler
  * @hw_submission_limit: the max size of the hardware queue.
  * @timeout: the time after which a job is removed from the scheduler.
  * @name: name of the ring for which this scheduler is being used.
@@ -503,6 +508,7 @@ struct drm_sched_backend_ops {
  */
 struct drm_gpu_scheduler {
 	const struct drm_sched_backend_ops	*ops;
+	struct drm_sched_entity		*single_entity;
 	uint32_t			hw_submission_limit;
 	long				timeout;
 	const char			*name;
@@ -584,6 +590,8 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 			  struct drm_gpu_scheduler **sched_list,
 			  unsigned int num_sched_list,
 			  atomic_t *guilty);
+struct drm_gpu_scheduler *
+drm_sched_entity_to_scheduler(struct drm_sched_entity *entity);
 long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout);
 void drm_sched_entity_fini(struct drm_sched_entity *entity);
 void drm_sched_entity_destroy(struct drm_sched_entity *entity);
-- 
2.34.1

