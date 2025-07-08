Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B25AFC78C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 11:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3379610E60B;
	Tue,  8 Jul 2025 09:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DbwipLsb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE74210E5F2;
 Tue,  8 Jul 2025 09:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9zPGSF+XpFP3T2aJaYZCYCcdBzApy0VDYjASQf1By08=; b=DbwipLsbMIh9bH8hEdcCbNxEIu
 MmQ1d+2yTSwSaRaGKko0Dp0X8ZF0hO9aYDVNJ+3JkS8wv8E4RUVECawxiCfN8Hq0IpFSh6QGo7tRd
 nmaFlID4NsdbipM+c9OIAedVJbEcXgCSdGWd94gECCpTIbpIOqwtlciTKca0rnWTGIa0v/I5mgbkH
 lMd3QBri2fjNfE5LVLoUzMo3Me/YNATvJZCSEb8yO/QMAeQ8Oa/U5J77bFLRdudODBoTfoR13WFGz
 o1ljnDTrANC5TeHoWhCE6dMx4EkWo9+6LXOABZxvVSd9GHqNrrslfM/FNU2kDg08061+0UxJ5lIPJ
 6oVYBjBA==;
Received: from [84.65.48.237] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uZ4zX-00Dx4r-0o; Tue, 08 Jul 2025 11:51:59 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v6 12/15] drm/sched: Add fair scheduling policy
Date: Tue,  8 Jul 2025 10:51:44 +0100
Message-ID: <20250708095147.73366-13-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250708095147.73366-1-tvrtko.ursulin@igalia.com>
References: <20250708095147.73366-1-tvrtko.ursulin@igalia.com>
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
 drivers/gpu/drm/scheduler/sched_entity.c   | 28 +++++----
 drivers/gpu/drm/scheduler/sched_internal.h | 70 +++++++++++++++++++++-
 drivers/gpu/drm/scheduler/sched_main.c     | 14 +++--
 drivers/gpu/drm/scheduler/sched_rq.c       | 35 ++++++++++-
 include/drm/gpu_scheduler.h                |  3 +
 5 files changed, 131 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 99a71fb388c3..82b824436a60 100644
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
@@ -583,7 +591,7 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 
 	spin_lock(&entity->lock);
 	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
-	rq = sched ? sched->sched_rq[entity->priority] : NULL;
+	rq = sched ? sched->sched_rq[entity->rq_priority] : NULL;
 	if (rq != entity->rq) {
 		drm_sched_rq_remove_entity(entity->rq, entity);
 		entity->rq = rq;
diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
index 27c8460a3601..6f91780c1d4e 100644
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
@@ -159,4 +162,67 @@ drm_sched_entity_stats_job_add_gpu_time(struct drm_sched_job *job)
 	spin_unlock(&stats->lock);
 }
 
+static inline void
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
+static inline ktime_t
+drm_sched_entity_restore_vruntime(struct drm_sched_entity *entity,
+				  ktime_t min_vruntime)
+{
+	struct drm_sched_entity_stats *stats = entity->stats;
+	ktime_t vruntime;
+
+	spin_lock(&stats->lock);
+	vruntime = ktime_add(min_vruntime, stats->vruntime);
+	stats->vruntime = vruntime;
+	spin_unlock(&stats->lock);
+
+	return vruntime;
+}
+
+static inline ktime_t
+drm_sched_entity_update_vruntime(struct drm_sched_entity *entity)
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
+static inline ktime_t
+drm_sched_entity_get_job_ts(struct drm_sched_entity *entity)
+{
+	return drm_sched_entity_update_vruntime(entity);
+}
+
 #endif
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 22cc0dd536db..705049a1685a 100644
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
@@ -1093,11 +1093,15 @@ int drm_sched_init(struct drm_gpu_scheduler *sched, const struct drm_sched_init_
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
@@ -1212,7 +1216,7 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
 	if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
 		atomic_inc(&bad->karma);
 
-		for (i = DRM_SCHED_PRIORITY_HIGH; i < sched->num_rqs; i++) {
+		for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
 			struct drm_sched_rq *rq = sched->sched_rq[i];
 
 			spin_lock(&rq->lock);
diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
index 9f1b4ea99cad..a891c3231c4c 100644
--- a/drivers/gpu/drm/scheduler/sched_rq.c
+++ b/drivers/gpu/drm/scheduler/sched_rq.c
@@ -75,6 +75,23 @@ drm_sched_rq_get_rr_deadline(struct drm_sched_rq *rq)
 	return rq->rr_deadline;
 }
 
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
 /**
  * drm_sched_rq_add_entity - add an entity
  *
@@ -109,8 +126,13 @@ drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts)
 		list_add_tail(&entity->list, &rq->entities);
 	}
 
-	if (drm_sched_policy == DRM_SCHED_POLICY_RR)
+	if (drm_sched_policy == DRM_SCHED_POLICY_FAIR) {
+		ts = drm_sched_rq_get_min_vruntime(rq);
+		ts = drm_sched_entity_restore_vruntime(entity, ts);
+	} else if (drm_sched_policy == DRM_SCHED_POLICY_RR) {
 		ts = drm_sched_rq_get_rr_deadline(rq);
+	}
+
 	drm_sched_rq_update_fifo_locked(entity, rq, ts);
 
 	spin_unlock(&rq->lock);
@@ -168,7 +190,9 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
 	if (next_job) {
 		ktime_t ts;
 
-		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
+		if (drm_sched_policy == DRM_SCHED_POLICY_FAIR)
+			ts = drm_sched_entity_get_job_ts(entity);
+		else if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
 			ts = next_job->submit_ts;
 		else
 			ts = drm_sched_rq_get_rr_deadline(rq);
@@ -176,6 +200,13 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
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
index bd7f7c6dd744..aef86b78a901 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -154,6 +154,8 @@ struct drm_sched_entity {
 	 */
 	struct spsc_queue		job_queue;
 
+	enum drm_sched_priority         rq_priority;
+
 	/**
 	 * @fence_seq:
 	 *
@@ -568,6 +570,7 @@ struct drm_gpu_scheduler {
 	long				timeout;
 	const char			*name;
 	u32                             num_rqs;
+	u32                             num_user_rqs;
 	struct drm_sched_rq             **sched_rq;
 	wait_queue_head_t		job_scheduled;
 	atomic64_t			job_id_count;
-- 
2.48.0

