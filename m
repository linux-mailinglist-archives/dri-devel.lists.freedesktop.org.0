Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5FA9FE927
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 17:53:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD0F10E52A;
	Mon, 30 Dec 2024 16:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="W7idq63+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F5610E525
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 16:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R3M9OCAhf82ocU/m6COL6/lPoef6+XQRYuzxi6y0Ddw=; b=W7idq63+p2r7Ow/Lva9+qGTIut
 Y+DULNKYDVdgEquK8Ul/IC6EfpecLhmr667Gt6PbyBQmb8blslq0X6eFb/fbr9fBpM/DMQMgUviML
 MHi3F4kwS9JIkI8LR9dnS2TVS4I4o/xOngxEzNKld8G8NDLUaHlwAo0U3KtyTMzTXrCaTjZ20/AnQ
 fl4K7JJqgurTjilmjnE+PpRlbk8p5vK9IO8bIAb79ng83XbabBkekb/lErRnQoQd27hDRehY6hHlF
 xIQO8DuIR0mq0vHcFOf5CfEgM6Hj+bMvGpxTjh164FdQNZLah9qcRewwLi0XVZxC22TV4KN1KnRQ7
 o0jp+FzQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tSJ0s-009ZvX-MF; Mon, 30 Dec 2024 17:53:06 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [RFC 04/14] drm/sched: Consolidate entity run queue management
Date: Mon, 30 Dec 2024 16:52:49 +0000
Message-ID: <20241230165259.95855-5-tursulin@igalia.com>
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

Move the code dealing with entities entering and exiting run queues to
helpers to logically separate it from jobs entering and exiting entities.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 66 ++--------------
 drivers/gpu/drm/scheduler/sched_main.c   | 98 +++++++++++++++++++-----
 include/drm/gpu_scheduler.h              | 12 +--
 3 files changed, 90 insertions(+), 86 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index cb5f596b48b7..b93da068585e 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -473,20 +473,9 @@ drm_sched_job_dependency(struct drm_sched_job *job,
 	return NULL;
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
 struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 {
-	struct drm_sched_job *sched_job, *next_job;
-	struct drm_sched_rq *rq;
+	struct drm_sched_job *sched_job;
 
 	sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
 	if (!sched_job)
@@ -516,32 +505,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 	smp_wmb();
 
 	spsc_queue_pop(&entity->job_queue);
-
-	/*
-	 * Update the entity's location in the min heap according to
-	 * the timestamp of the next job, if any.
-	 */
-	next_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
-
-	spin_lock(&entity->lock);
-	rq = entity->rq;
-	spin_lock(&rq->lock);
-
-	if (next_job) {
-		ktime_t ts;
-
-		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
-			ts = next_job->submit_ts;
-		else
-			ts = drm_sched_rq_get_rr_deadline(rq);
-
-		drm_sched_rq_update_fifo_locked(entity, rq, ts);
-	} else {
-		drm_sched_rq_remove_fifo_locked(entity, rq);
-	}
-
-	spin_unlock(&rq->lock);
-	spin_unlock(&entity->lock);
+	drm_sched_rq_pop_entity(entity->rq, entity);
 
 	/* Jobs and entities might have different lifecycles. Since we're
 	 * removing the job from the entities queue, set the jobs entity pointer
@@ -623,30 +587,10 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 	/* first job wakes up scheduler */
 	if (first) {
 		struct drm_gpu_scheduler *sched;
-		struct drm_sched_rq *rq;
 
-		/* Add the entity to the run queue */
-		spin_lock(&entity->lock);
-		if (entity->stopped) {
-			spin_unlock(&entity->lock);
-
-			DRM_ERROR("Trying to push to a killed entity\n");
-			return;
-		}
-
-		rq = entity->rq;
-		sched = rq->sched;
-
-		spin_lock(&rq->lock);
-		drm_sched_rq_add_entity(rq, entity);
-		if (drm_sched_policy == DRM_SCHED_POLICY_RR)
-			submit_ts = drm_sched_rq_get_rr_deadline(rq);
-		drm_sched_rq_update_fifo_locked(entity, rq, submit_ts);
-
-		spin_unlock(&rq->lock);
-		spin_unlock(&entity->lock);
-
-		drm_sched_wakeup(sched);
+		sched = drm_sched_rq_add_entity(entity->rq, entity, submit_ts);
+		if (sched)
+			drm_sched_wakeup(sched);
 	}
 }
 EXPORT_SYMBOL(drm_sched_entity_push_job);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index eb22b1b7de36..52c1a71d48e1 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -146,18 +146,19 @@ static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
 	return ktime_before(ent_a->oldest_job_waiting, ent_b->oldest_job_waiting);
 }
 
-void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
-				     struct drm_sched_rq *rq)
+static void __drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
+					      struct drm_sched_rq *rq)
 {
-	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
-		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
-		RB_CLEAR_NODE(&entity->rb_tree_node);
-	}
+	lockdep_assert_held(&entity->lock);
+	lockdep_assert_held(&rq->lock);
+
+	rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
+	RB_CLEAR_NODE(&entity->rb_tree_node);
 }
 
-void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
-				     struct drm_sched_rq *rq,
-				     ktime_t ts)
+static void __drm_sched_rq_add_fifo_locked(struct drm_sched_entity *entity,
+					   struct drm_sched_rq *rq,
+					   ktime_t ts)
 {
 	/*
 	 * Both locks need to be grabbed, one to protect from entity->rq change
@@ -167,8 +168,6 @@ void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
 	lockdep_assert_held(&entity->lock);
 	lockdep_assert_held(&rq->lock);
 
-	drm_sched_rq_remove_fifo_locked(entity, rq);
-
 	entity->oldest_job_waiting = ts;
 
 	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
@@ -192,6 +191,16 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
 	rq->sched = sched;
 }
 
+static ktime_t
+drm_sched_rq_get_rr_deadline(struct drm_sched_rq *rq)
+{
+	lockdep_assert_held(&rq->lock);
+
+	rq->rr_deadline = ktime_add_ns(rq->rr_deadline, 1);
+
+	return rq->rr_deadline;
+}
+
 /**
  * drm_sched_rq_add_entity - add an entity
  *
@@ -199,18 +208,41 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
  * @entity: scheduler entity
  *
  * Adds a scheduler entity to the run queue.
+ *
+ * Returns a DRM scheduler pre-selected to handle this entity.
  */
-void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
-			     struct drm_sched_entity *entity)
+struct drm_gpu_scheduler *
+drm_sched_rq_add_entity(struct drm_sched_rq *rq,
+			struct drm_sched_entity *entity,
+			ktime_t ts)
 {
-	lockdep_assert_held(&entity->lock);
-	lockdep_assert_held(&rq->lock);
+	struct drm_gpu_scheduler *sched;
+
+	if (entity->stopped) {
+		DRM_ERROR("Trying to push to a killed entity\n");
+		return NULL;
+	}
+
+	spin_lock(&entity->lock);
+	spin_lock(&rq->lock);
+
+	sched = rq->sched;
+	atomic_inc(sched->score);
 
 	if (!list_empty(&entity->list))
-		return;
+		list_add_tail(&entity->list, &rq->entities);
 
-	atomic_inc(rq->sched->score);
-	list_add_tail(&entity->list, &rq->entities);
+	if (drm_sched_policy == DRM_SCHED_POLICY_RR)
+		ts = drm_sched_rq_get_rr_deadline(rq);
+
+	if (!RB_EMPTY_NODE(&entity->rb_tree_node))
+		__drm_sched_rq_remove_fifo_locked(entity, rq);
+	__drm_sched_rq_add_fifo_locked(entity, rq, ts);
+
+	spin_unlock(&rq->lock);
+	spin_unlock(&entity->lock);
+
+	return sched;
 }
 
 /**
@@ -234,11 +266,39 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 	atomic_dec(rq->sched->score);
 	list_del_init(&entity->list);
 
-	drm_sched_rq_remove_fifo_locked(entity, rq);
+	if (!RB_EMPTY_NODE(&entity->rb_tree_node))
+		__drm_sched_rq_remove_fifo_locked(entity, rq);
 
 	spin_unlock(&rq->lock);
 }
 
+void drm_sched_rq_pop_entity(struct drm_sched_rq *rq,
+			     struct drm_sched_entity *entity)
+{
+	struct drm_sched_job *next_job;
+
+	next_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
+
+	spin_lock(&entity->lock);
+	spin_lock(&rq->lock);
+
+	__drm_sched_rq_remove_fifo_locked(entity, rq);
+
+	if (next_job) {
+		ktime_t ts;
+
+		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
+			ts = next_job->submit_ts;
+		else
+			ts = drm_sched_rq_get_rr_deadline(rq);
+
+		__drm_sched_rq_add_fifo_locked(entity, rq, ts);
+	}
+
+	spin_unlock(&rq->lock);
+	spin_unlock(&entity->lock);
+}
+
 /**
  * drm_sched_rq_select_entity - Select an entity which provides a job to run
  *
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index db65600732b9..23d5b1b0b048 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -585,15 +585,15 @@ bool drm_sched_dependency_optimized(struct dma_fence* fence,
 				    struct drm_sched_entity *entity);
 void drm_sched_fault(struct drm_gpu_scheduler *sched);
 
-void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
-			     struct drm_sched_entity *entity);
+struct drm_gpu_scheduler *
+drm_sched_rq_add_entity(struct drm_sched_rq *rq,
+			struct drm_sched_entity *entity,
+			ktime_t ts);
 void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 				struct drm_sched_entity *entity);
 
-void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
-				     struct drm_sched_rq *rq);
-void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
-				     struct drm_sched_rq *rq, ktime_t ts);
+void drm_sched_rq_pop_entity(struct drm_sched_rq *rq,
+			     struct drm_sched_entity *entity);
 
 int drm_sched_entity_init(struct drm_sched_entity *entity,
 			  enum drm_sched_priority priority,
-- 
2.47.1

