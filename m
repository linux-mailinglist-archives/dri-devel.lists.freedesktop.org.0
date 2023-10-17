Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E05FF7CC716
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 17:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D71A910E30E;
	Tue, 17 Oct 2023 15:09:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5710710E301;
 Tue, 17 Oct 2023 15:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697555376; x=1729091376;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i1QyKVYZyeEa+g/xWuFwx7rT61BrGCSq1TLjWhiK5Cg=;
 b=V4/PxWMKfACzvPHTb2G9PL/9iRJENJ70H41zQN0syEeuLO2V1JDowdSW
 64NfSTOWZVTKjtY7iMyD5FiAi40sv7cuyfjLMnXK6ldAY8EBQTRcK2yCf
 mVjn/vi+w3FpdsjmKZxoX1+v4L5CxwZ9YJoerC+85Px4PMEm0ndgO59yX
 daO6L0zyYT+O+RbTVGNcQcx56uBEtawYMGGGloAZWBU5gIwvnjGlPa2RW
 oAa8RQAuqOoKBZ5JywFEaH134jKNHVwa7nsf6uMCE/shUDPBg55PfA0Xn
 Wc4+nNhLH0tGHrMTJdWS/0KJTuUWc5SoKxhlzaoDHKTJCwzxT9YDRFsU3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="388665115"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="388665115"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 08:09:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="791257576"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; d="scan'208";a="791257576"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 08:09:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v6 4/7] drm/sched: Add DRM_SCHED_POLICY_SINGLE_ENTITY
 scheduling policy
Date: Tue, 17 Oct 2023 08:09:55 -0700
Message-Id: <20231017150958.838613-5-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017150958.838613-1-matthew.brost@intel.com>
References: <20231017150958.838613-1-matthew.brost@intel.com>
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

DRM_SCHED_POLICY_SINGLE_ENTITY creates a 1 to 1 relationship between
scheduler and entity. No priorities or run queue used in this mode.
Intended for devices with firmware schedulers.

v2:
  - Drop sched / rq union (Luben)
v3:
  - Don't pick entity if stopped in drm_sched_select_entity (Danilo)
v4:
  - Rework if statement in drm_sched_entity_init (Luben)
  - Update comment for drm_sched_entity_to_scheduler (Luben)
  - Reword a few things in DOC comment (Luben)
  - Do not check sched policy in for statement (Luben)
v5:
  - Fix extra blank lines (Luben / Checkpatch)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 69 +++++++++++++++----
 drivers/gpu/drm/scheduler/sched_fence.c  |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c   | 87 ++++++++++++++++++------
 include/drm/gpu_scheduler.h              |  8 +++
 4 files changed, 130 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index cf42e2265d64..940f63dd6965 100644
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
 	RCU_INIT_POINTER(entity->last_scheduled, NULL);
 	RB_CLEAR_NODE(&entity->rb_tree_node);
 
-	if(num_sched_list)
-		entity->rq = &sched_list[0]->sched_rq[entity->priority];
+	if (num_sched_list) {
+		if (sched_list[0]->sched_policy !=
+		    DRM_SCHED_POLICY_SINGLE_ENTITY) {
+			entity->rq = &sched_list[0]->sched_rq[entity->priority];
+		} else if (num_sched_list == 1 && !sched_list[0]->single_entity) {
+			sched_list[0]->single_entity = entity;
+			entity->single_sched = sched_list[0];
+		} else {
+			return -EINVAL;
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
@@ -231,13 +242,15 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
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
@@ -259,6 +272,20 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
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
@@ -276,11 +303,12 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
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
@@ -373,7 +401,7 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
 		container_of(cb, struct drm_sched_entity, cb);
 
 	drm_sched_entity_clear_dep(f, cb);
-	drm_sched_wakeup_if_can_queue(entity->rq->sched);
+	drm_sched_wakeup_if_can_queue(drm_sched_entity_to_scheduler(entity));
 }
 
 /**
@@ -387,6 +415,8 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
 void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
 				   enum drm_sched_priority priority)
 {
+	WARN_ON(!!entity->single_sched);
+
 	spin_lock(&entity->rq_lock);
 	entity->priority = priority;
 	spin_unlock(&entity->rq_lock);
@@ -399,7 +429,7 @@ EXPORT_SYMBOL(drm_sched_entity_set_priority);
  */
 static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
 {
-	struct drm_gpu_scheduler *sched = entity->rq->sched;
+	struct drm_gpu_scheduler *sched = drm_sched_entity_to_scheduler(entity);
 	struct dma_fence *fence = entity->dependency;
 	struct drm_sched_fence *s_fence;
 
@@ -501,7 +531,8 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 	 * Update the entity's location in the min heap according to
 	 * the timestamp of the next job, if any.
 	 */
-	if (entity->rq->sched->sched_policy == DRM_SCHED_POLICY_FIFO) {
+	if (drm_sched_entity_to_scheduler(entity)->sched_policy ==
+	    DRM_SCHED_POLICY_FIFO) {
 		struct drm_sched_job *next;
 
 		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
@@ -524,6 +555,8 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 	struct drm_gpu_scheduler *sched;
 	struct drm_sched_rq *rq;
 
+	WARN_ON(!!entity->single_sched);
+
 	/* single possible engine and already selected */
 	if (!entity->sched_list)
 		return;
@@ -573,12 +606,13 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 {
 	struct drm_sched_entity *entity = sched_job->entity;
-	bool first, fifo = entity->rq->sched->sched_policy ==
-		DRM_SCHED_POLICY_FIFO;
+	bool single_entity = !!entity->single_sched;
+	bool first;
 	ktime_t submit_ts;
 
 	trace_drm_sched_job(sched_job, entity);
-	atomic_inc(entity->rq->sched->score);
+	if (!single_entity)
+		atomic_inc(entity->rq->sched->score);
 	WRITE_ONCE(entity->last_user, current->group_leader);
 
 	/*
@@ -591,6 +625,10 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 
 	/* first job wakes up scheduler */
 	if (first) {
+		struct drm_gpu_scheduler *sched =
+			drm_sched_entity_to_scheduler(entity);
+		bool fifo = sched->sched_policy == DRM_SCHED_POLICY_FIFO;
+
 		/* Add the entity to the run queue */
 		spin_lock(&entity->rq_lock);
 		if (entity->stopped) {
@@ -600,13 +638,14 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 			return;
 		}
 
-		drm_sched_rq_add_entity(entity->rq, entity);
+		if (!single_entity)
+			drm_sched_rq_add_entity(entity->rq, entity);
 		spin_unlock(&entity->rq_lock);
 
 		if (fifo)
 			drm_sched_rq_update_fifo(entity, submit_ts);
 
-		drm_sched_wakeup_if_can_queue(entity->rq->sched);
+		drm_sched_wakeup_if_can_queue(sched);
 	}
 }
 EXPORT_SYMBOL(drm_sched_entity_push_job);
diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 06cedfe4b486..f6b926f5e188 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -225,7 +225,7 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
 {
 	unsigned seq;
 
-	fence->sched = entity->rq->sched;
+	fence->sched = drm_sched_entity_to_scheduler(entity);
 	seq = atomic_inc_return(&entity->fence_seq);
 	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
 		       &fence->lock, entity->fence_context, seq);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 150e5330f0fa..273e0fbc4eab 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -32,7 +32,8 @@
  * backend operations to the scheduler like submitting a job to hardware run queue,
  * returning the dependencies of a job etc.
  *
- * The organisation of the scheduler is the following:
+ * For scheduling policies DRM_SCHED_POLICY_RR and DRM_SCHED_POLICY_FIFO, the
+ * scheduler organization is:
  *
  * 1. Each hw run queue has one scheduler
  * 2. Each scheduler has multiple run queues with different priorities
@@ -43,7 +44,24 @@
  *
  * The jobs in a entity are always scheduled in the order that they were pushed.
  *
- * Note that once a job was taken from the entities queue and pushed to the
+ * For DRM_SCHED_POLICY_SINGLE_ENTITY, the organization of the scheduler is:
+ *
+ * 1. One to one relationship between scheduler and entity
+ * 2. No priorities implemented per scheduler (single job queue)
+ * 3. No run queues in scheduler rather jobs are directly dequeued from entity
+ * 4. The entity maintains a queue of jobs that will be scheduled to the
+ * hardware
+ *
+ * The jobs in a entity are always scheduled in the order that they were pushed
+ * regardless of scheduling policy. Single-entity scheduling is essentially a
+ * FIFO for jobs.
+ *
+ * A policy of DRM_SCHED_POLICY_RR or DRM_SCHED_POLICY_FIFO is expected to be
+ * used when the kernel-mode driver is scheduling directly to the hardware while
+ * a scheduling policy of DRM_SCHED_POLICY_SINGLE_ENTITY is expected to be used
+ * when there is a firmware scheduler.
+ *
+ * Note that once a job is taken from the entities queue and pushed to the
  * hardware, i.e. the pending queue, the entity must not be referenced anymore
  * through the jobs entity pointer.
  */
@@ -96,6 +114,8 @@ static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *enti
 
 void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
 {
+	WARN_ON(!!entity->single_sched);
+
 	/*
 	 * Both locks need to be grabbed, one to protect from entity->rq change
 	 * for entity from within concurrent drm_sched_entity_select_rq and the
@@ -126,6 +146,8 @@ void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
 static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
 			      struct drm_sched_rq *rq)
 {
+	WARN_ON(sched->sched_policy == DRM_SCHED_POLICY_SINGLE_ENTITY);
+
 	spin_lock_init(&rq->lock);
 	INIT_LIST_HEAD(&rq->entities);
 	rq->rb_tree_root = RB_ROOT_CACHED;
@@ -144,6 +166,8 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
 void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 			     struct drm_sched_entity *entity)
 {
+	WARN_ON(!!entity->single_sched);
+
 	if (!list_empty(&entity->list))
 		return;
 
@@ -166,6 +190,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 				struct drm_sched_entity *entity)
 {
+	WARN_ON(!!entity->single_sched);
+
 	if (list_empty(&entity->list))
 		return;
 
@@ -641,7 +667,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
 		       void *owner)
 {
-	if (!entity->rq)
+	if (!entity->rq && !entity->single_sched)
 		return -ENOENT;
 
 	job->entity = entity;
@@ -674,13 +700,16 @@ void drm_sched_job_arm(struct drm_sched_job *job)
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
@@ -896,6 +925,14 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 	if (!drm_sched_can_queue(sched))
 		return NULL;
 
+	if (sched->single_entity) {
+		if (!READ_ONCE(sched->single_entity->stopped) &&
+		    drm_sched_entity_is_ready(sched->single_entity))
+			return sched->single_entity;
+
+		return NULL;
+	}
+
 	/* Kernel run queue has higher priority than normal run queue*/
 	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
 		entity = sched->sched_policy == DRM_SCHED_POLICY_FIFO ?
@@ -1092,6 +1129,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		return -EINVAL;
 
 	sched->ops = ops;
+	sched->single_entity = NULL;
 	sched->hw_submission_limit = hw_submission;
 	sched->name = name;
 	if (submit_wq) {
@@ -1111,8 +1149,10 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	sched->dev = dev;
 	sched->sched_policy = sched_policy == DRM_SCHED_POLICY_UNSET ?
 		drm_sched_policy_default : sched_policy;
-	for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
-		drm_sched_rq_init(sched, &sched->sched_rq[i]);
+	if (sched_policy != DRM_SCHED_POLICY_SINGLE_ENTITY) {
+		for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_COUNT; i++)
+			drm_sched_rq_init(sched, &sched->sched_rq[i]);
+	}
 
 	init_waitqueue_head(&sched->job_scheduled);
 	INIT_LIST_HEAD(&sched->pending_list);
@@ -1143,19 +1183,24 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 
 	drm_sched_wqueue_stop(sched);
 
-	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
-		struct drm_sched_rq *rq = &sched->sched_rq[i];
-
-		spin_lock(&rq->lock);
-		list_for_each_entry(s_entity, &rq->entities, list)
-			/*
-			 * Prevents reinsertion and marks job_queue as idle,
-			 * it will removed from rq in drm_sched_entity_fini
-			 * eventually
-			 */
-			s_entity->stopped = true;
-		spin_unlock(&rq->lock);
+	if (sched->single_entity) {
+		spin_lock(&sched->single_entity->rq_lock);
+		sched->single_entity->stopped = true;
+		spin_unlock(&sched->single_entity->rq_lock);
+	} else if (sched->sched_policy != DRM_SCHED_POLICY_SINGLE_ENTITY) {
+		for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+			struct drm_sched_rq *rq = &sched->sched_rq[i];
 
+			spin_lock(&rq->lock);
+			list_for_each_entry(s_entity, &rq->entities, list)
+				/*
+				 * Prevents reinsertion and marks job_queue as idle,
+				 * it will removed from rq in drm_sched_entity_fini
+				 * eventually
+				 */
+				s_entity->stopped = true;
+			spin_unlock(&rq->lock);
+		}
 	}
 
 	/* Wakeup everyone stuck in drm_sched_entity_flush for this scheduler */
@@ -1186,6 +1231,8 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
 	struct drm_sched_entity *entity;
 	struct drm_gpu_scheduler *sched = bad->sched;
 
+	WARN_ON(sched->sched_policy == DRM_SCHED_POLICY_SINGLE_ENTITY);
+
 	/* don't change @bad's karma if it's from KERNEL RQ,
 	 * because sometimes GPU hang would cause kernel jobs (like VM updating jobs)
 	 * corrupt but keep in mind that kernel jobs always considered good.
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 320f0a720486..e67b53c3546b 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -79,6 +79,7 @@ enum drm_sched_policy {
 	DRM_SCHED_POLICY_UNSET,
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
@@ -504,6 +509,7 @@ struct drm_sched_backend_ops {
  */
 struct drm_gpu_scheduler {
 	const struct drm_sched_backend_ops	*ops;
+	struct drm_sched_entity		*single_entity;
 	uint32_t			hw_submission_limit;
 	long				timeout;
 	const char			*name;
@@ -587,6 +593,8 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
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

