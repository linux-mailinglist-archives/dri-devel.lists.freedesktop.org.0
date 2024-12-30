Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F6B9FE92D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 17:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B990D10E53B;
	Mon, 30 Dec 2024 16:53:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="CVvzZBEE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232E110E527
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 16:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WINuvH8rAgeJq26VtToDBST2AkkLU5OJEaD3IdTmY/w=; b=CVvzZBEEfAq0IR9y4CqdIZUvhq
 jVLYlHzgn5+IzWu2oz5Fl3pEUC7FlFwWW56Ga8j/re2aRWCCIbKuQUTMW9N9fMWPeI7Kkdox44mbH
 lqkTJ177iuB0J4sx9HGX8kr5+NzcDw19q+Qle72mDJjblUpAUFfmOls38E+/FkcJL3vkNwowTMVSB
 QjNktgIo9kPVqrQ9Ezs70Hv8e4oyy+QKPMWo+Sc6YdDOGT3IzMIB0LdsmWbot7UEIynjoFuNh2vT5
 2Rihl7syLOQgRSf0mcZZ4hWd0PSjHbAQKcJGjGB+ESkn8bZQt2LYLF1bCcg9gWB0CySzedW60Lhfr
 Ao3zsVNQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tSJ0w-009ZwC-95; Mon, 30 Dec 2024 17:53:10 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [RFC 09/14] drm/sched: Remove FIFO and RR and simplify to a single
 run queue
Date: Mon, 30 Dec 2024 16:52:54 +0000
Message-ID: <20241230165259.95855-10-tursulin@igalia.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241230165259.95855-1-tursulin@igalia.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

If the new deadline policy is at least as good as FIFO and we can afford
to remove round-robin, we can simplify the scheduler code by making the
scheduler to run queue relationship always 1:1 and remove some code.

Also, now that the FIFO policy is gone the tree of entities is not a FIFO
tree any more so rename it to just the tree.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  23 ++--
 drivers/gpu/drm/scheduler/sched_entity.c |  30 +----
 drivers/gpu/drm/scheduler/sched_main.c   | 136 ++++++-----------------
 drivers/gpu/drm/scheduler/sched_rq.c     |  35 ++----
 include/drm/gpu_scheduler.h              |  13 +--
 5 files changed, 56 insertions(+), 181 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index b9d08bc96581..918b6d4919e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -418,25 +418,22 @@ static struct dma_fence *amdgpu_job_run(struct drm_sched_job *sched_job)
 
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
-			while ((s_job = to_drm_sched_job(spsc_queue_pop(&s_entity->job_queue)))) {
-				struct drm_sched_fence *s_fence = s_job->s_fence;
+	spin_lock(&rq->lock);
+	list_for_each_entry(s_entity, &rq->entities, list) {
+		while ((s_job = to_drm_sched_job(spsc_queue_pop(&s_entity->job_queue)))) {
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
index 6928ec19ec23..14bc3f797079 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -71,8 +71,6 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	entity->guilty = guilty;
 	entity->num_sched_list = num_sched_list;
 	entity->priority = priority;
-	entity->rq_priority = drm_sched_policy == DRM_SCHED_POLICY_DEADLINE ?
-			      DRM_SCHED_PRIORITY_KERNEL : priority;
 	/*
 	 * It's perfectly valid to initialize an entity without having a valid
 	 * scheduler attached. It's just not valid to use the scheduler before it
@@ -82,30 +80,14 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
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
-			drm_err(sched_list[0], "entity with out-of-bounds priority:%u num_user_rqs:%u\n",
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
@@ -532,7 +514,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 
 	spin_lock(&entity->lock);
 	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
-	rq = sched ? sched->sched_rq[entity->rq_priority] : NULL;
+	rq = sched ? sched->rq : NULL;
 	if (rq != entity->rq) {
 		drm_sched_rq_remove_entity(entity->rq, entity);
 		entity->rq = rq;
@@ -576,10 +558,8 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 	if (first) {
 		struct drm_gpu_scheduler *sched;
 
-		if (drm_sched_policy == DRM_SCHED_POLICY_DEADLINE)
-			submit_ts = __drm_sched_entity_get_job_deadline(entity,
-									submit_ts);
-
+		submit_ts = __drm_sched_entity_get_job_deadline(entity,
+								submit_ts);
 		sched = drm_sched_rq_add_entity(entity->rq, entity, submit_ts);
 		if (sched)
 			drm_sched_wakeup(sched);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 433bef85eeaf..4ba9ed27a8a6 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -87,15 +87,6 @@ static struct lockdep_map drm_sched_lockdep_map = {
 };
 #endif
 
-int drm_sched_policy = DRM_SCHED_POLICY_DEADLINE;
-
-/**
- * DOC: sched_policy (int)
- * Used to override default entities scheduling policy in a run queue.
- */
-MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO, " __stringify(DRM_SCHED_POLICY_DEADLINE) " = Virtual deadline (default).");
-module_param_named(sched_policy, drm_sched_policy, int, 0444);
-
 static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
 {
 	u32 credits;
@@ -850,34 +841,6 @@ void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
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
-	return IS_ERR(entity) ? NULL : entity;;
-}
-
 /**
  * drm_sched_get_finished_job - fetch the next finished job to be destroyed
  *
@@ -1000,8 +963,8 @@ static void drm_sched_run_job_work(struct work_struct *w)
 		return;
 
 	/* Find entity with a ready job */
-	entity = drm_sched_select_entity(sched);
-	if (!entity)
+	entity = drm_sched_rq_select_entity(sched, sched->rq);
+	if (IS_ERR_OR_NULL(entity))
 		return;	/* No more work */
 
 	sched_job = drm_sched_entity_pop_job(entity);
@@ -1047,7 +1010,7 @@ static void drm_sched_run_job_work(struct work_struct *w)
  * @ops: backend operations for this scheduler
  * @submit_wq: workqueue to use for submission. If NULL, an ordered wq is
  *	       allocated and used
- * @num_rqs: number of runqueues, one for each priority, up to DRM_SCHED_PRIORITY_COUNT
+ * @num_rqs: deprecated and ignored
  * @credit_limit: the number of credits this scheduler can hold from all jobs
  * @hang_limit: number of times to allow a job to hang before dropping it
  * @timeout: timeout value in jiffies for the scheduler
@@ -1066,8 +1029,6 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		   long timeout, struct workqueue_struct *timeout_wq,
 		   atomic_t *score, const char *name, struct device *dev)
 {
-	int i;
-
 	sched->ops = ops;
 	sched->credit_limit = credit_limit;
 	sched->name = name;
@@ -1077,13 +1038,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	sched->score = score ? score : &sched->_score;
 	sched->dev = dev;
 
-	if (num_rqs > DRM_SCHED_PRIORITY_COUNT) {
-		/* This is a gross violation--tell drivers what the  problem is.
-		 */
-		drm_err(sched, "%s: num_rqs cannot be greater than DRM_SCHED_PRIORITY_COUNT\n",
-			__func__);
-		return -EINVAL;
-	} else if (sched->sched_rq) {
+	if (sched->rq) {
 		/* Not an error, but warn anyway so drivers can
 		 * fine-tune their DRM calling order, and return all
 		 * is good.
@@ -1109,21 +1064,11 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		sched->own_submit_wq = true;
 	}
 
-	sched->num_user_rqs = num_rqs;
-	sched->num_rqs = drm_sched_policy != DRM_SCHED_POLICY_DEADLINE ?
-			 num_rqs : 1;
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
@@ -1135,15 +1080,9 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	atomic_set(&sched->_score, 0);
 	atomic64_set(&sched->job_id_count, 0);
 	sched->pause_submit = false;
-
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
@@ -1174,25 +1113,21 @@ EXPORT_SYMBOL(drm_sched_init);
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
@@ -1203,8 +1138,8 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	if (sched->own_submit_wq)
 		destroy_workqueue(sched->submit_wq);
 	sched->ready = false;
-	kfree(sched->sched_rq);
-	sched->sched_rq = NULL;
+	kfree(sched->rq);
+	sched->rq = NULL;
 }
 EXPORT_SYMBOL(drm_sched_fini);
 
@@ -1219,35 +1154,28 @@ EXPORT_SYMBOL(drm_sched_fini);
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
index a6bb21250350..0b7a2b8b48db 100644
--- a/drivers/gpu/drm/scheduler/sched_rq.c
+++ b/drivers/gpu/drm/scheduler/sched_rq.c
@@ -12,7 +12,7 @@ static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
 	return ktime_before(ent_a->oldest_job_waiting, ent_b->oldest_job_waiting);
 }
 
-static void __drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
+static void __drm_sched_rq_remove_tree_locked(struct drm_sched_entity *entity,
 					      struct drm_sched_rq *rq)
 {
 	lockdep_assert_held(&entity->lock);
@@ -22,7 +22,7 @@ static void __drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
 	RB_CLEAR_NODE(&entity->rb_tree_node);
 }
 
-static void __drm_sched_rq_add_fifo_locked(struct drm_sched_entity *entity,
+static void __drm_sched_rq_add_tree_locked(struct drm_sched_entity *entity,
 					   struct drm_sched_rq *rq,
 					   ktime_t ts)
 {
@@ -56,16 +56,6 @@ void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
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
 /**
  * drm_sched_rq_add_entity - add an entity
  *
@@ -97,12 +87,9 @@ drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 	if (!list_empty(&entity->list))
 		list_add_tail(&entity->list, &rq->entities);
 
-	if (drm_sched_policy == DRM_SCHED_POLICY_RR)
-		ts = drm_sched_rq_get_rr_deadline(rq);
-
 	if (!RB_EMPTY_NODE(&entity->rb_tree_node))
-		__drm_sched_rq_remove_fifo_locked(entity, rq);
-	__drm_sched_rq_add_fifo_locked(entity, rq, ts);
+		__drm_sched_rq_remove_tree_locked(entity, rq);
+	__drm_sched_rq_add_tree_locked(entity, rq, ts);
 
 	spin_unlock(&rq->lock);
 	spin_unlock(&entity->lock);
@@ -132,7 +119,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 	list_del_init(&entity->list);
 
 	if (!RB_EMPTY_NODE(&entity->rb_tree_node))
-		__drm_sched_rq_remove_fifo_locked(entity, rq);
+		__drm_sched_rq_remove_tree_locked(entity, rq);
 
 	spin_unlock(&rq->lock);
 }
@@ -147,20 +134,14 @@ void drm_sched_rq_pop_entity(struct drm_sched_rq *rq,
 	spin_lock(&entity->lock);
 	spin_lock(&rq->lock);
 
-	__drm_sched_rq_remove_fifo_locked(entity, rq);
+	__drm_sched_rq_remove_tree_locked(entity, rq);
 
 	if (next_job) {
 		ktime_t ts;
 
-		if (drm_sched_policy == DRM_SCHED_POLICY_DEADLINE)
-			ts = drm_sched_entity_get_job_deadline(entity,
-							       next_job);
-		else if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
-			ts = next_job->submit_ts;
-		else
-			ts = drm_sched_rq_get_rr_deadline(rq);
+		ts = drm_sched_entity_get_job_deadline(entity, next_job);
 
-		__drm_sched_rq_add_fifo_locked(entity, rq, ts);
+		__drm_sched_rq_add_tree_locked(entity, rq, ts);
 	}
 
 	spin_unlock(&rq->lock);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 7532071fbea8..93f6fcfe3ba0 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -71,13 +71,6 @@ enum drm_sched_priority {
 	DRM_SCHED_PRIORITY_COUNT
 };
 
-/* Used to choose between FIFO and RR job-scheduling */
-extern int drm_sched_policy;
-
-#define DRM_SCHED_POLICY_RR	  0
-#define DRM_SCHED_POLICY_FIFO	  1
-#define DRM_SCHED_POLICY_DEADLINE 2
-
 /**
  * struct drm_sched_entity - A wrapper around a job queue (typically
  * attached to the DRM file_priv).
@@ -154,8 +147,6 @@ struct drm_sched_entity {
 	 */
 	struct spsc_queue		job_queue;
 
-	enum drm_sched_priority         rq_priority;
-
 	/**
 	 * @fence_seq:
 	 *
@@ -524,9 +515,7 @@ struct drm_gpu_scheduler {
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
2.47.1

