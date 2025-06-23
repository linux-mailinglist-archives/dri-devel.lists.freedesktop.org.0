Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30902AE4025
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 14:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6124410E39B;
	Mon, 23 Jun 2025 12:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="H+rJ1i07";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB6810E399;
 Mon, 23 Jun 2025 12:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZyYHT4oOl04j0cUpU80VU3brOdrceAS1bSeN56CxbME=; b=H+rJ1i07CiPLcRrUEH7gMyElkq
 r81wP+uRWHqMYtEYJqIEw9X1M/tCvHlYCPekS62Eul+1YoDlhHmkPrAIbNI5X0diRRU/LcD7unDvj
 HSL/WcIYvZQjBlfquNQiGSq1j6jMWjDjOqCFTYOC/RZq97oI1xPMfEFwhRwgXTgjOpDkId2uIKwrc
 9Dvd1cS7VaKDyI6w0eh5thFZ7lcBpK5sGY0ZlEvEX07OAhwKcdXJ4Jy55U+5mFRw27lmPyixb1z/F
 8wUkuEwHLqdVUGqB3R3YEPGUyy9VL9GUOJHYxCZ0p4rR0/JDH6a1mnCCAXK0Q1aQtYSE4S6B4aBKV
 6toYuzDg==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uTgHK-007U4Q-QV; Mon, 23 Jun 2025 14:28:02 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v5 14/16] drm/sched: Remove FIFO and RR and simplify to a
 single run queue
Date: Mon, 23 Jun 2025 13:27:44 +0100
Message-ID: <20250623122746.46478-15-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250623122746.46478-1-tvrtko.ursulin@igalia.com>
References: <20250623122746.46478-1-tvrtko.ursulin@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the new fair policy is at least as good as FIFO and we can afford to
remove round-robin, we can simplify the scheduler code by making the
scheduler to run queue relationship always 1:1 and remove some code.

Also, now that the FIFO policy is gone the tree of entities is not a FIFO
tree any more so rename it to just the tree.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  23 ++--
 drivers/gpu/drm/scheduler/sched_entity.c   |  29 +----
 drivers/gpu/drm/scheduler/sched_internal.h |   9 +-
 drivers/gpu/drm/scheduler/sched_main.c     | 133 +++++----------------
 drivers/gpu/drm/scheduler/sched_rq.c       |  53 +++-----
 include/drm/gpu_scheduler.h                |  17 +--
 6 files changed, 63 insertions(+), 201 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 6b4ffa9ceb7a..c0cb8b0193f2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -462,25 +462,22 @@ drm_sched_entity_queue_pop(struct drm_sched_entity *entity)
 
 void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
 {
+	struct drm_sched_rq *rq = sched->rq;
+	struct drm_sched_entity *s_entity;
 	struct drm_sched_job *s_job;
-	struct drm_sched_entity *s_entity = NULL;
-	int i;
 
 	/* Signal all jobs not yet scheduled */
-	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
-		struct drm_sched_rq *rq = sched->sched_rq[i];
-		spin_lock(&rq->lock);
-		list_for_each_entry(s_entity, &rq->entities, list) {
-			while ((s_job = drm_sched_entity_queue_pop(s_entity))) {
-				struct drm_sched_fence *s_fence = s_job->s_fence;
+	spin_lock(&rq->lock);
+	list_for_each_entry(s_entity, &rq->entities, list) {
+		while ((s_job = drm_sched_entity_queue_pop(s_entity))) {
+			struct drm_sched_fence *s_fence = s_job->s_fence;
 
-				dma_fence_signal(&s_fence->scheduled);
-				dma_fence_set_error(&s_fence->finished, -EHWPOISON);
-				dma_fence_signal(&s_fence->finished);
-			}
+			dma_fence_signal(&s_fence->scheduled);
+			dma_fence_set_error(&s_fence->finished, -EHWPOISON);
+			dma_fence_signal(&s_fence->finished);
 		}
-		spin_unlock(&rq->lock);
 	}
+	spin_unlock(&rq->lock);
 
 	/* Signal all jobs already scheduled to HW */
 	list_for_each_entry(s_job, &sched->pending_list, list) {
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index c643ca82ad2c..3dce102e9880 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -98,8 +98,6 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	entity->guilty = guilty;
 	entity->num_sched_list = num_sched_list;
 	entity->priority = priority;
-	entity->rq_priority = drm_sched_policy == DRM_SCHED_POLICY_FAIR ?
-			      DRM_SCHED_PRIORITY_KERNEL : priority;
 	/*
 	 * It's perfectly valid to initialize an entity without having a valid
 	 * scheduler attached. It's just not valid to use the scheduler before it
@@ -109,30 +107,14 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	RCU_INIT_POINTER(entity->last_scheduled, NULL);
 	RB_CLEAR_NODE(&entity->rb_tree_node);
 
-	if (num_sched_list && !sched_list[0]->sched_rq) {
+	if (num_sched_list && !sched_list[0]->rq) {
 		/* Since every entry covered by num_sched_list
 		 * should be non-NULL and therefore we warn drivers
 		 * not to do this and to fix their DRM calling order.
 		 */
 		pr_warn("%s: called with uninitialized scheduler\n", __func__);
 	} else if (num_sched_list) {
-		enum drm_sched_priority p = entity->priority;
-
-		/*
-		 * The "priority" of an entity cannot exceed the number of
-		 * run-queues of a scheduler. Protect against num_rqs being 0,
-		 * by converting to signed. Choose the lowest priority
-		 * available.
-		 */
-		if (p >= sched_list[0]->num_user_rqs) {
-			dev_err(sched_list[0]->dev, "entity with out-of-bounds priority:%u num_user_rqs:%u\n",
-				p, sched_list[0]->num_user_rqs);
-			p = max_t(s32,
-				 (s32)sched_list[0]->num_user_rqs - 1,
-				 (s32)DRM_SCHED_PRIORITY_KERNEL);
-			entity->priority = p;
-		}
-		entity->rq = sched_list[0]->sched_rq[entity->rq_priority];
+		entity->rq = sched_list[0]->rq;
 	}
 
 	init_completion(&entity->entity_idle);
@@ -581,7 +563,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 
 	spin_lock(&entity->lock);
 	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
-	rq = sched ? sched->sched_rq[entity->rq_priority] : NULL;
+	rq = sched ? sched->rq : NULL;
 	if (rq != entity->rq) {
 		drm_sched_rq_remove_entity(entity->rq, entity);
 		entity->rq = rq;
@@ -605,7 +587,6 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 {
 	struct drm_sched_entity *entity = sched_job->entity;
 	bool first;
-	ktime_t submit_ts;
 
 	trace_drm_sched_job_queue(sched_job, entity);
 
@@ -622,16 +603,14 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 	/*
 	 * After the sched_job is pushed into the entity queue, it may be
 	 * completed and freed up at any time. We can no longer access it.
-	 * Make sure to set the submit_ts first, to avoid a race.
 	 */
-	sched_job->submit_ts = submit_ts = ktime_get();
 	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
 
 	/* first job wakes up scheduler */
 	if (first) {
 		struct drm_gpu_scheduler *sched;
 
-		sched = drm_sched_rq_add_entity(entity, submit_ts);
+		sched = drm_sched_rq_add_entity(entity);
 		if (sched)
 			drm_sched_wakeup(sched);
 	}
diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
index ae0e31c407d5..5d559e3ccd1e 100644
--- a/drivers/gpu/drm/scheduler/sched_internal.h
+++ b/drivers/gpu/drm/scheduler/sched_internal.h
@@ -15,13 +15,6 @@ struct drm_sched_entity_stats {
 	u64		vruntime;
 };
 
-/* Used to choose between FIFO and RR job-scheduling */
-extern int drm_sched_policy;
-
-#define DRM_SCHED_POLICY_RR	0
-#define DRM_SCHED_POLICY_FIFO	1
-#define DRM_SCHED_POLICY_FAIR	2
-
 bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
 			 struct drm_sched_entity *entity);
 void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
@@ -32,7 +25,7 @@ struct drm_sched_entity *
 drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
 			   struct drm_sched_rq *rq);
 struct drm_gpu_scheduler *
-drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts);
+drm_sched_rq_add_entity(struct drm_sched_entity *entity);
 void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 				struct drm_sched_entity *entity);
 void drm_sched_rq_pop_entity(struct drm_sched_entity *entity);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 705049a1685a..35025edea669 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -84,15 +84,6 @@
 #define CREATE_TRACE_POINTS
 #include "gpu_scheduler_trace.h"
 
-int drm_sched_policy = DRM_SCHED_POLICY_FAIR;
-
-/**
- * DOC: sched_policy (int)
- * Used to override default entities scheduling policy in a run queue.
- */
-MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO, " __stringify(DRM_SCHED_POLICY_FAIR) " = Fair (default).");
-module_param_named(sched_policy, drm_sched_policy, int, 0444);
-
 static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
 {
 	u32 credits;
@@ -840,34 +831,6 @@ void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
 	drm_sched_run_job_queue(sched);
 }
 
-/**
- * drm_sched_select_entity - Select next entity to process
- *
- * @sched: scheduler instance
- *
- * Return an entity to process or NULL if none are found.
- *
- * Note, that we break out of the for-loop when "entity" is non-null, which can
- * also be an error-pointer--this assures we don't process lower priority
- * run-queues. See comments in the respectively called functions.
- */
-static struct drm_sched_entity *
-drm_sched_select_entity(struct drm_gpu_scheduler *sched)
-{
-	struct drm_sched_entity *entity = NULL;
-	int i;
-
-	/* Start with the highest priority.
-	 */
-	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
-		entity = drm_sched_rq_select_entity(sched, sched->sched_rq[i]);
-		if (entity)
-			break;
-	}
-
-	return IS_ERR(entity) ? NULL : entity;
-}
-
 /**
  * drm_sched_get_finished_job - fetch the next finished job to be destroyed
  *
@@ -984,8 +947,8 @@ static void drm_sched_run_job_work(struct work_struct *w)
 	int r;
 
 	/* Find entity with a ready job */
-	entity = drm_sched_select_entity(sched);
-	if (!entity)
+	entity = drm_sched_rq_select_entity(sched, sched->rq);
+	if (IS_ERR_OR_NULL(entity))
 		return;	/* No more work */
 
 	sched_job = drm_sched_entity_pop_job(entity);
@@ -1056,8 +1019,6 @@ static struct workqueue_struct *drm_sched_alloc_wq(const char *name)
  */
 int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_args *args)
 {
-	int i;
-
 	sched->ops = args->ops;
 	sched->credit_limit = args->credit_limit;
 	sched->name = args->name;
@@ -1067,13 +1028,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
 	sched->score = args->score ? args->score : &sched->_score;
 	sched->dev = args->dev;
 
-	if (args->num_rqs > DRM_SCHED_PRIORITY_COUNT) {
-		/* This is a gross violation--tell drivers what the  problem is.
-		 */
-		dev_err(sched->dev, "%s: num_rqs cannot be greater than DRM_SCHED_PRIORITY_COUNT\n",
-			__func__);
-		return -EINVAL;
-	} else if (sched->sched_rq) {
+	if (sched->rq) {
 		/* Not an error, but warn anyway so drivers can
 		 * fine-tune their DRM calling order, and return all
 		 * is good.
@@ -1093,21 +1048,11 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
 		sched->own_submit_wq = true;
 	}
 
-	sched->num_user_rqs = args->num_rqs;
-	sched->num_rqs = drm_sched_policy != DRM_SCHED_POLICY_FAIR ?
-			 args->num_rqs : 1;
-	sched->sched_rq = kmalloc_array(sched->num_rqs,
-					sizeof(*sched->sched_rq),
-					GFP_KERNEL | __GFP_ZERO);
-	if (!sched->sched_rq)
+	sched->rq = kmalloc(sizeof(*sched->rq), GFP_KERNEL | __GFP_ZERO);
+	if (!sched->rq)
 		goto Out_check_own;
 
-	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
-		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
-		if (!sched->sched_rq[i])
-			goto Out_unroll;
-		drm_sched_rq_init(sched, sched->sched_rq[i]);
-	}
+	drm_sched_rq_init(sched, sched->rq);
 
 	init_waitqueue_head(&sched->job_scheduled);
 	INIT_LIST_HEAD(&sched->pending_list);
@@ -1122,12 +1067,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
 
 	sched->ready = true;
 	return 0;
-Out_unroll:
-	for (--i ; i >= DRM_SCHED_PRIORITY_KERNEL; i--)
-		kfree(sched->sched_rq[i]);
 
-	kfree(sched->sched_rq);
-	sched->sched_rq = NULL;
 Out_check_own:
 	if (sched->own_submit_wq)
 		destroy_workqueue(sched->submit_wq);
@@ -1159,25 +1099,21 @@ EXPORT_SYMBOL(drm_sched_init);
  */
 void drm_sched_fini(struct drm_gpu_scheduler *sched)
 {
+
+	struct drm_sched_rq *rq = sched->rq;
 	struct drm_sched_entity *s_entity;
-	int i;
 
 	drm_sched_wqueue_stop(sched);
 
-	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
-		struct drm_sched_rq *rq = sched->sched_rq[i];
-
-		spin_lock(&rq->lock);
-		list_for_each_entry(s_entity, &rq->entities, list)
-			/*
-			 * Prevents reinsertion and marks job_queue as idle,
-			 * it will be removed from the rq in drm_sched_entity_fini()
-			 * eventually
-			 */
-			s_entity->stopped = true;
-		spin_unlock(&rq->lock);
-		kfree(sched->sched_rq[i]);
-	}
+	spin_lock(&rq->lock);
+	list_for_each_entry(s_entity, &rq->entities, list)
+		/*
+		 * Prevents reinsertion and marks job_queue as idle,
+		 * it will be removed from the rq in drm_sched_entity_fini()
+		 * eventually
+		 */
+		s_entity->stopped = true;
+	spin_unlock(&rq->lock);
 
 	/* Wakeup everyone stuck in drm_sched_entity_flush for this scheduler */
 	wake_up_all(&sched->job_scheduled);
@@ -1188,8 +1124,8 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	if (sched->own_submit_wq)
 		destroy_workqueue(sched->submit_wq);
 	sched->ready = false;
-	kfree(sched->sched_rq);
-	sched->sched_rq = NULL;
+	kfree(sched->rq);
+	sched->rq = NULL;
 }
 EXPORT_SYMBOL(drm_sched_fini);
 
@@ -1204,35 +1140,28 @@ EXPORT_SYMBOL(drm_sched_fini);
  */
 void drm_sched_increase_karma(struct drm_sched_job *bad)
 {
-	int i;
-	struct drm_sched_entity *tmp;
-	struct drm_sched_entity *entity;
 	struct drm_gpu_scheduler *sched = bad->sched;
+	struct drm_sched_entity *entity, *tmp;
+	struct drm_sched_rq *rq = sched->rq;
 
 	/* don't change @bad's karma if it's from KERNEL RQ,
 	 * because sometimes GPU hang would cause kernel jobs (like VM updating jobs)
 	 * corrupt but keep in mind that kernel jobs always considered good.
 	 */
-	if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
-		atomic_inc(&bad->karma);
+	if (bad->s_priority == DRM_SCHED_PRIORITY_KERNEL)
+		return;
 
-		for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
-			struct drm_sched_rq *rq = sched->sched_rq[i];
+	atomic_inc(&bad->karma);
 
-			spin_lock(&rq->lock);
-			list_for_each_entry_safe(entity, tmp, &rq->entities, list) {
-				if (bad->s_fence->scheduled.context ==
-				    entity->fence_context) {
-					if (entity->guilty)
-						atomic_set(entity->guilty, 1);
-					break;
-				}
-			}
-			spin_unlock(&rq->lock);
-			if (&entity->list != &rq->entities)
-				break;
+	spin_lock(&rq->lock);
+	list_for_each_entry_safe(entity, tmp, &rq->entities, list) {
+		if (bad->s_fence->scheduled.context == entity->fence_context) {
+			if (entity->guilty)
+				atomic_set(entity->guilty, 1);
+			break;
 		}
 	}
+	spin_unlock(&rq->lock);
 }
 EXPORT_SYMBOL(drm_sched_increase_karma);
 
diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
index fd1cf89911e6..69ccdbd5af6c 100644
--- a/drivers/gpu/drm/scheduler/sched_rq.c
+++ b/drivers/gpu/drm/scheduler/sched_rq.c
@@ -16,7 +16,7 @@ drm_sched_entity_compare_before(struct rb_node *a, const struct rb_node *b)
 	return ktime_before(ea->oldest_job_waiting, eb->oldest_job_waiting);
 }
 
-static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
+static void drm_sched_rq_remove_tree_locked(struct drm_sched_entity *entity,
 					    struct drm_sched_rq *rq)
 {
 	lockdep_assert_held(&entity->lock);
@@ -28,7 +28,7 @@ static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
 	}
 }
 
-static void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
+static void drm_sched_rq_update_tree_locked(struct drm_sched_entity *entity,
 					    struct drm_sched_rq *rq,
 					    ktime_t ts)
 {
@@ -40,7 +40,7 @@ static void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
 	lockdep_assert_held(&entity->lock);
 	lockdep_assert_held(&rq->lock);
 
-	drm_sched_rq_remove_fifo_locked(entity, rq);
+	drm_sched_rq_remove_tree_locked(entity, rq);
 
 	entity->oldest_job_waiting = ts;
 
@@ -65,16 +65,6 @@ void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
 	rq->sched = sched;
 }
 
-static ktime_t
-drm_sched_rq_get_rr_deadline(struct drm_sched_rq *rq)
-{
-	lockdep_assert_held(&rq->lock);
-
-	rq->rr_deadline = ktime_add_ns(rq->rr_deadline, 1);
-
-	return rq->rr_deadline;
-}
-
 static ktime_t
 drm_sched_rq_get_min_vruntime(struct drm_sched_rq *rq)
 {
@@ -103,10 +93,11 @@ drm_sched_rq_get_min_vruntime(struct drm_sched_rq *rq)
  * Returns a DRM scheduler pre-selected to handle this entity.
  */
 struct drm_gpu_scheduler *
-drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts)
+drm_sched_rq_add_entity(struct drm_sched_entity *entity)
 {
 	struct drm_gpu_scheduler *sched;
 	struct drm_sched_rq *rq;
+	ktime_t ts;
 
 	/* Add the entity to the run queue */
 	spin_lock(&entity->lock);
@@ -126,14 +117,9 @@ drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts)
 		list_add_tail(&entity->list, &rq->entities);
 	}
 
-	if (drm_sched_policy == DRM_SCHED_POLICY_FAIR) {
-		ts = drm_sched_rq_get_min_vruntime(rq);
-		ts = drm_sched_entity_restore_vruntime(entity, ts);
-	} else if (drm_sched_policy == DRM_SCHED_POLICY_RR) {
-		ts = drm_sched_rq_get_rr_deadline(rq);
-	}
-
-	drm_sched_rq_update_fifo_locked(entity, rq, ts);
+	ts = drm_sched_rq_get_min_vruntime(rq);
+	ts = drm_sched_entity_restore_vruntime(entity, ts);
+	drm_sched_rq_update_tree_locked(entity, rq, ts);
 
 	spin_unlock(&rq->lock);
 	spin_unlock(&entity->lock);
@@ -162,7 +148,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 	atomic_dec(rq->sched->score);
 	list_del_init(&entity->list);
 
-	drm_sched_rq_remove_fifo_locked(entity, rq);
+	drm_sched_rq_remove_tree_locked(entity, rq);
 
 	spin_unlock(&rq->lock);
 }
@@ -183,23 +169,14 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
 	if (next_job) {
 		ktime_t ts;
 
-		if (drm_sched_policy == DRM_SCHED_POLICY_FAIR)
-			ts = drm_sched_entity_get_job_ts(entity);
-		else if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
-			ts = next_job->submit_ts;
-		else
-			ts = drm_sched_rq_get_rr_deadline(rq);
-
-		drm_sched_rq_update_fifo_locked(entity, rq, ts);
+		ts = drm_sched_entity_get_job_ts(entity);
+		drm_sched_rq_update_tree_locked(entity, rq, ts);
 	} else {
-		drm_sched_rq_remove_fifo_locked(entity, rq);
+		ktime_t min_vruntime;
 
-		if (drm_sched_policy == DRM_SCHED_POLICY_FAIR) {
-			ktime_t min_vruntime;
-
-			min_vruntime = drm_sched_rq_get_min_vruntime(rq);
-			drm_sched_entity_save_vruntime(entity, min_vruntime);
-		}
+		drm_sched_rq_remove_tree_locked(entity, rq);
+		min_vruntime = drm_sched_rq_get_min_vruntime(rq);
+		drm_sched_entity_save_vruntime(entity, min_vruntime);
 	}
 	spin_unlock(&rq->lock);
 	spin_unlock(&entity->lock);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 28967deb589a..ba3b1bdb8f22 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -151,8 +151,6 @@ struct drm_sched_entity {
 	 */
 	struct spsc_queue		job_queue;
 
-	enum drm_sched_priority         rq_priority;
-
 	/**
 	 * @fence_seq:
 	 *
@@ -343,13 +341,6 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
  * to schedule the job.
  */
 struct drm_sched_job {
-	/**
-	 * @submit_ts:
-	 *
-	 * When the job was pushed into the entity queue.
-	 */
-	ktime_t                         submit_ts;
-
 	/**
 	 * @sched:
 	 *
@@ -528,9 +519,7 @@ struct drm_sched_backend_ops {
  * @credit_count: the current credit count of this scheduler
  * @timeout: the time after which a job is removed from the scheduler.
  * @name: name of the ring for which this scheduler is being used.
- * @num_rqs: Number of run-queues. This is at most DRM_SCHED_PRIORITY_COUNT,
- *           as there's usually one run-queue per priority, but could be less.
- * @sched_rq: An allocated array of run-queues of size @num_rqs;
+ * @rq: Scheduler's run queue.
  * @job_scheduled: once @drm_sched_entity_do_release is called the scheduler
  *                 waits on this wait queue until all the scheduled jobs are
  *                 finished.
@@ -561,9 +550,7 @@ struct drm_gpu_scheduler {
 	atomic_t			credit_count;
 	long				timeout;
 	const char			*name;
-	u32                             num_rqs;
-	u32                             num_user_rqs;
-	struct drm_sched_rq             **sched_rq;
+	struct drm_sched_rq             *rq;
 	wait_queue_head_t		job_scheduled;
 	atomic64_t			job_id_count;
 	struct workqueue_struct		*submit_wq;
-- 
2.48.0

