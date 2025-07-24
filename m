Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 125B0B10D27
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 16:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F141710E996;
	Thu, 24 Jul 2025 14:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="rDT9yPeg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F230310E97F;
 Thu, 24 Jul 2025 14:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T8bqQw15QpK7l1ZLwCw8EsdYY2TLtE9LBYIF3rlCT7g=; b=rDT9yPegzFjEpTgXIdjLvkSDL6
 NEbz30RZrNB7M5R+8GUSnhayOR4q/+v5WRINY8ZAPbZQz8BJlCzZf4V2dOgKQ7LXal72vJ0MMpbgD
 2OttQ14Z+jQ9U8Hr39EHM/Edzq8idqDGnJVylfp8jDXiyMAnowkzQsH1U9z5wwdABYtx0o3ZOYZ4Y
 lw9GUlpE5x1C9/LXWiiZLQBKkZGNmwfLGYzdD9ByEXa+PQqgw+SEAGi3sQyKkWpk0rn11w+pdk7Wz
 nIdYPVsse0LiyY1NDH/+s1G8mrLkliOgq0rJ2wNoz1YyO70HyIzAd0sSnk5ncfkHU5+/uXqawiCUT
 tmLuk7jg==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uewnC-003DsZ-5T; Thu, 24 Jul 2025 16:19:30 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [RFC v7 09/12] drm/sched: Add fair scheduling policy
Date: Thu, 24 Jul 2025 15:19:18 +0100
Message-ID: <20250724141921.75583-10-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250724141921.75583-1-tvrtko.ursulin@igalia.com>
References: <20250724141921.75583-1-tvrtko.ursulin@igalia.com>
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

Fair scheduling policy is built upon the same concepts as the well known
CFS kernel scheduler - entity run queue is sorted by the virtual GPU time
consumed by entities in a way that the entity with least vruntime runs
first.

It is able to avoid total priority starvation, which is one of the
problems with FIFO, and it also eliminates the need for per priority run
queues. As it scales the actual GPU runtime by an exponential factor as
the priority decreases, therefore the virtual runtime for low priority
entities grows faster than for normal priority, pushing them further down
the runqueue order for the same real GPU time spent.

Apart from this fundamental fairness, fair policy is especially strong in
oversubscription workloads where it is able to give more GPU time to short
and bursty workloads when they are running in parallel with GPU heavy
clients submitting deep job queues.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c   |  28 ++--
 drivers/gpu/drm/scheduler/sched_internal.h |   7 +-
 drivers/gpu/drm/scheduler/sched_main.c     |  14 +-
 drivers/gpu/drm/scheduler/sched_rq.c       | 144 ++++++++++++++++++++-
 include/drm/gpu_scheduler.h                |  10 +-
 5 files changed, 183 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 75f24b9db5f2..7de4ef055166 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -108,6 +108,8 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	entity->guilty = guilty;
 	entity->num_sched_list = num_sched_list;
 	entity->priority = priority;
+	entity->rq_priority = drm_sched_policy == DRM_SCHED_POLICY_FAIR ?
+			      DRM_SCHED_PRIORITY_KERNEL : priority;
 	/*
 	 * It's perfectly valid to initialize an entity without having a valid
 	 * scheduler attached. It's just not valid to use the scheduler before it
@@ -124,17 +126,23 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 		 */
 		pr_warn("%s: called with uninitialized scheduler\n", __func__);
 	} else if (num_sched_list) {
-		/* The "priority" of an entity cannot exceed the number of run-queues of a
-		 * scheduler. Protect against num_rqs being 0, by converting to signed. Choose
-		 * the lowest priority available.
+		enum drm_sched_priority p = entity->priority;
+
+		/*
+		 * The "priority" of an entity cannot exceed the number of
+		 * run-queues of a scheduler. Protect against num_rqs being 0,
+		 * by converting to signed. Choose the lowest priority
+		 * available.
 		 */
-		if (entity->priority >= sched_list[0]->num_rqs) {
-			dev_err(sched_list[0]->dev, "entity has out-of-bounds priority: %u. num_rqs: %u\n",
-				entity->priority, sched_list[0]->num_rqs);
-			entity->priority = max_t(s32, (s32) sched_list[0]->num_rqs - 1,
-						 (s32) DRM_SCHED_PRIORITY_KERNEL);
+		if (p >= sched_list[0]->num_user_rqs) {
+			dev_err(sched_list[0]->dev, "entity with out-of-bounds priority:%u num_user_rqs:%u\n",
+				p, sched_list[0]->num_user_rqs);
+			p = max_t(s32,
+				 (s32)sched_list[0]->num_user_rqs - 1,
+				 (s32)DRM_SCHED_PRIORITY_KERNEL);
+			entity->priority = p;
 		}
-		entity->rq = sched_list[0]->sched_rq[entity->priority];
+		entity->rq = sched_list[0]->sched_rq[entity->rq_priority];
 	}
 
 	init_completion(&entity->entity_idle);
@@ -564,7 +572,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 
 	spin_lock(&entity->lock);
 	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
-	rq = sched ? sched->sched_rq[entity->priority] : NULL;
+	rq = sched ? sched->sched_rq[entity->rq_priority] : NULL;
 	if (rq != entity->rq) {
 		drm_sched_rq_remove_entity(entity->rq, entity);
 		entity->rq = rq;
diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
index 27c8460a3601..125aba70eda6 100644
--- a/drivers/gpu/drm/scheduler/sched_internal.h
+++ b/drivers/gpu/drm/scheduler/sched_internal.h
@@ -18,13 +18,16 @@ struct drm_sched_entity_stats {
 	struct kref	kref;
 	spinlock_t	lock;
 	ktime_t		runtime;
+	ktime_t		prev_runtime;
+	u64		vruntime;
 };
 
 /* Used to choose between FIFO and RR job-scheduling */
 extern int drm_sched_policy;
 
-#define DRM_SCHED_POLICY_RR    0
-#define DRM_SCHED_POLICY_FIFO  1
+#define DRM_SCHED_POLICY_RR	0
+#define DRM_SCHED_POLICY_FIFO	1
+#define DRM_SCHED_POLICY_FAIR	2
 
 bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
 			 struct drm_sched_entity *entity);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index bb210ef3986d..d347673d9738 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -84,13 +84,13 @@
 #define CREATE_TRACE_POINTS
 #include "gpu_scheduler_trace.h"
 
-int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
+int drm_sched_policy = DRM_SCHED_POLICY_FAIR;
 
 /**
  * DOC: sched_policy (int)
  * Used to override default entities scheduling policy in a run queue.
  */
-MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
+MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO, " __stringify(DRM_SCHED_POLICY_FAIR) " = Fair (default).");
 module_param_named(sched_policy, drm_sched_policy, int, 0444);
 
 static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
@@ -1132,11 +1132,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
 		sched->own_submit_wq = true;
 	}
 
-	sched->sched_rq = kmalloc_array(args->num_rqs, sizeof(*sched->sched_rq),
+	sched->num_user_rqs = args->num_rqs;
+	sched->num_rqs = drm_sched_policy != DRM_SCHED_POLICY_FAIR ?
+			 args->num_rqs : 1;
+	sched->sched_rq = kmalloc_array(sched->num_rqs,
+					sizeof(*sched->sched_rq),
 					GFP_KERNEL | __GFP_ZERO);
 	if (!sched->sched_rq)
 		goto Out_check_own;
-	sched->num_rqs = args->num_rqs;
+
 	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
 		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
 		if (!sched->sched_rq[i])
@@ -1262,7 +1266,7 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
 	if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
 		atomic_inc(&bad->karma);
 
-		for (i = DRM_SCHED_PRIORITY_HIGH; i < sched->num_rqs; i++) {
+		for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
 			struct drm_sched_rq *rq = sched->sched_rq[i];
 
 			spin_lock(&rq->lock);
diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
index 67804815ca0d..d16ee3ee3653 100644
--- a/drivers/gpu/drm/scheduler/sched_rq.c
+++ b/drivers/gpu/drm/scheduler/sched_rq.c
@@ -16,6 +16,23 @@ drm_sched_entity_compare_before(struct rb_node *a, const struct rb_node *b)
 	return ktime_before(ea->oldest_job_waiting, eb->oldest_job_waiting);
 }
 
+static void drm_sched_rq_update_prio(struct drm_sched_rq *rq)
+{
+	enum drm_sched_priority prio = -1;
+	struct drm_sched_entity *entity;
+	struct rb_node *rb;
+
+	lockdep_assert_held(&rq->lock);
+
+	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
+		entity = rb_entry(rb, typeof(*entity), rb_tree_node);
+
+		prio = entity->priority; /* Unlocked read */
+	}
+
+	rq->head_prio = prio;
+}
+
 static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
 					    struct drm_sched_rq *rq)
 {
@@ -25,6 +42,7 @@ static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
 	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
 		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
 		RB_CLEAR_NODE(&entity->rb_tree_node);
+		drm_sched_rq_update_prio(rq);
 	}
 }
 
@@ -46,6 +64,7 @@ static void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
 
 	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
 		      drm_sched_entity_compare_before);
+	drm_sched_rq_update_prio(rq);
 }
 
 /**
@@ -63,6 +82,112 @@ void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
 	INIT_LIST_HEAD(&rq->entities);
 	rq->rb_tree_root = RB_ROOT_CACHED;
 	rq->sched = sched;
+	rq->head_prio = -1;
+}
+
+static ktime_t
+drm_sched_rq_get_min_vruntime(struct drm_sched_rq *rq)
+{
+	struct drm_sched_entity *entity;
+	struct rb_node *rb;
+
+	lockdep_assert_held(&rq->lock);
+
+	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
+		entity = rb_entry(rb, typeof(*entity), rb_tree_node);
+
+		return entity->stats->vruntime; /* Unlocked read */
+	}
+
+	return 0;
+}
+
+static void
+drm_sched_entity_save_vruntime(struct drm_sched_entity *entity,
+			       ktime_t min_vruntime)
+{
+	struct drm_sched_entity_stats *stats = entity->stats;
+	ktime_t vruntime;
+
+	spin_lock(&stats->lock);
+	vruntime = stats->vruntime;
+	if (min_vruntime && vruntime > min_vruntime)
+		vruntime = ktime_sub(vruntime, min_vruntime);
+	else
+		vruntime = 0;
+	stats->vruntime = vruntime;
+	spin_unlock(&stats->lock);
+}
+
+static ktime_t
+drm_sched_entity_restore_vruntime(struct drm_sched_entity *entity,
+				  ktime_t min_vruntime,
+				  enum drm_sched_priority rq_prio)
+{
+	struct drm_sched_entity_stats *stats = entity->stats;
+	enum drm_sched_priority prio = entity->priority;
+	ktime_t vruntime;
+
+	spin_lock(&stats->lock);
+	vruntime = stats->vruntime;
+
+	/*
+	 * Special handling for entities which were picked from the top of the
+	 * queue and are now re-joining the top with another one already there.
+	 */
+	if (!vruntime && min_vruntime) {
+		if (prio > rq_prio) {
+			/*
+			 * Lower priority should not overtake higher when re-
+			 * joining at the top of the queue.
+			 */
+			vruntime = us_to_ktime(prio - rq_prio);
+		} else if (prio < rq_prio) {
+			/*
+			 * Higher priority can go first.
+			 */
+			vruntime = -us_to_ktime(rq_prio - prio);
+		}
+	}
+
+	/*
+	 * Restore saved relative position in the queue.
+	 */
+	vruntime = ktime_add(min_vruntime, vruntime);
+
+	stats->vruntime = vruntime;
+	spin_unlock(&stats->lock);
+
+	return vruntime;
+}
+
+static ktime_t drm_sched_entity_update_vruntime(struct drm_sched_entity *entity)
+{
+	static const unsigned int shift[] = {
+		[DRM_SCHED_PRIORITY_KERNEL] = 1,
+		[DRM_SCHED_PRIORITY_HIGH]   = 2,
+		[DRM_SCHED_PRIORITY_NORMAL] = 4,
+		[DRM_SCHED_PRIORITY_LOW]    = 7,
+	};
+	struct drm_sched_entity_stats *stats = entity->stats;
+	ktime_t runtime, prev;
+
+	spin_lock(&stats->lock);
+	prev = stats->prev_runtime;
+	runtime = stats->runtime;
+	stats->prev_runtime = runtime;
+	runtime = ktime_add_ns(stats->vruntime,
+			       ktime_to_ns(ktime_sub(runtime, prev)) <<
+			       shift[entity->priority]);
+	stats->vruntime = runtime;
+	spin_unlock(&stats->lock);
+
+	return runtime;
+}
+
+static ktime_t drm_sched_entity_get_job_ts(struct drm_sched_entity *entity)
+{
+	return drm_sched_entity_update_vruntime(entity);
 }
 
 /**
@@ -99,8 +224,14 @@ drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts)
 		list_add_tail(&entity->list, &rq->entities);
 	}
 
-	if (drm_sched_policy == DRM_SCHED_POLICY_RR)
+	if (drm_sched_policy == DRM_SCHED_POLICY_FAIR) {
+		ts = drm_sched_rq_get_min_vruntime(rq);
+		ts = drm_sched_entity_restore_vruntime(entity, ts,
+						       rq->head_prio);
+	} else if (drm_sched_policy == DRM_SCHED_POLICY_RR) {
 		ts = entity->rr_ts;
+	}
+
 	drm_sched_rq_update_fifo_locked(entity, rq, ts);
 
 	spin_unlock(&rq->lock);
@@ -173,7 +304,9 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
 	if (next_job) {
 		ktime_t ts;
 
-		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
+		if (drm_sched_policy == DRM_SCHED_POLICY_FAIR)
+			ts = drm_sched_entity_get_job_ts(entity);
+		else if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
 			ts = next_job->submit_ts;
 		else
 			ts = drm_sched_rq_get_rr_ts(rq, entity);
@@ -181,6 +314,13 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
 		drm_sched_rq_update_fifo_locked(entity, rq, ts);
 	} else {
 		drm_sched_rq_remove_fifo_locked(entity, rq);
+
+		if (drm_sched_policy == DRM_SCHED_POLICY_FAIR) {
+			ktime_t min_vruntime;
+
+			min_vruntime = drm_sched_rq_get_min_vruntime(rq);
+			drm_sched_entity_save_vruntime(entity, min_vruntime);
+		}
 	}
 	spin_unlock(&rq->lock);
 	spin_unlock(&entity->lock);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index f33c78473867..327b75a052c7 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -150,6 +150,11 @@ struct drm_sched_entity {
 	 */
 	enum drm_sched_priority         priority;
 
+	/**
+	 * @rq_priority: Run-queue priority
+	 */
+	enum drm_sched_priority         rq_priority;
+
 	/**
 	 * @rr_ts:
 	 *
@@ -254,10 +259,11 @@ struct drm_sched_entity {
  * struct drm_sched_rq - queue of entities to be scheduled.
  *
  * @sched: the scheduler to which this rq belongs to.
- * @lock: protects @entities, @rb_tree_root and @rr_ts.
+ * @lock: protects @entities, @rb_tree_root, @rr_ts and @head_prio.
  * @rr_ts: monotonically incrementing fake timestamp for RR mode
  * @entities: list of the entities to be scheduled.
  * @rb_tree_root: root of time based priority queue of entities for FIFO scheduling
+ * @head_prio: priority of the top tree element
  *
  * Run queue is a set of entities scheduling command submissions for
  * one specific ring. It implements the scheduling policy that selects
@@ -271,6 +277,7 @@ struct drm_sched_rq {
 	ktime_t				rr_ts;
 	struct list_head		entities;
 	struct rb_root_cached		rb_tree_root;
+	enum drm_sched_priority		head_prio;
 };
 
 /**
@@ -597,6 +604,7 @@ struct drm_gpu_scheduler {
 	long				timeout;
 	const char			*name;
 	u32                             num_rqs;
+	u32                             num_user_rqs;
 	struct drm_sched_rq             **sched_rq;
 	wait_queue_head_t		job_scheduled;
 	atomic64_t			job_id_count;
-- 
2.48.0

