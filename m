Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EAEBC3F56
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 10:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CB310E787;
	Wed,  8 Oct 2025 08:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="jHEaTGOv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85A510E783;
 Wed,  8 Oct 2025 08:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x1kYPhxTIbeuKufIajjHgH95eULMW7W0DzvRA2914Pc=; b=jHEaTGOvxBuNtTiuaCO78QWDeK
 X5SDvW8+JPbf0hkbAkkrAd9nOr6SgKzIMlATiPpAvSCE9i2Zhmw69/qUe0y66iGlLTauNtY47PFR7
 Sq8eFmZQ15LIKXmD4TItY2tSa/+U7kTmuWG9WcyKkziX/G+GZYqFzvv7xUMvcBgguqAEfm72PCDNa
 UPEe7Ug5NQ2ql6obt7Xa8mfxom/fgZXkp5mHcPUoMRwdHmzid8b9HYXo56y1VcHSQmt4UbmTa5MOD
 wiZ7QpJBZYO+Hxb08dIoRBNhOZGtujJEMrbH+TGT7wi4VpCTNMB2hb4lEXljJZVMGl81gk8FjVpx7
 /+8373kw==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1v6Pvy-006YxV-MG; Wed, 08 Oct 2025 10:54:06 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH 04/28] drm/sched: Implement RR via FIFO
Date: Wed,  8 Oct 2025 09:53:35 +0100
Message-ID: <20251008085359.52404-5-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
References: <20251008085359.52404-1-tvrtko.ursulin@igalia.com>
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

Round-robin being the non-default policy and unclear how much it is used,
we can notice that it can be implemented using the FIFO data structures if
we only invent a fake submit timestamp which is monotonically increasing
inside drm_sched_rq instances.

So instead of remembering which was the last entity the scheduler worker
picked we can simply bump the picked one to the bottom of the tree, which
ensures round-robin behaviour between all active queued jobs.

If the picked job was the last from a given entity, we remember the
assigned fake timestamp and use it to re-insert the job once it re-joins
the queue. This ensures job neither overtakes all already queued jobs,
neither it goes last. Instead it keeps the position after the currently
queued jobs and before the ones which haven't yet been queued at the point
the entity left the queue.

Advantage is that we can consolidate to a single code path and remove a
bunch of code. Downside is round-robin mode now needs to lock on the job
pop path but that should not be visible.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 51 ++++++++++------
 drivers/gpu/drm/scheduler/sched_main.c   | 76 ++----------------------
 include/drm/gpu_scheduler.h              | 16 +++--
 3 files changed, 51 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 5a4697f636f2..4852006f2308 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -456,9 +456,24 @@ drm_sched_job_dependency(struct drm_sched_job *job,
 	return NULL;
 }
 
+static ktime_t
+drm_sched_rq_get_rr_ts(struct drm_sched_rq *rq, struct drm_sched_entity *entity)
+{
+	ktime_t ts;
+
+	lockdep_assert_held(&entity->lock);
+	lockdep_assert_held(&rq->lock);
+
+	ts = ktime_add_ns(rq->rr_ts, 1);
+	entity->rr_ts = ts;
+	rq->rr_ts = ts;
+
+	return ts;
+}
+
 struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 {
-	struct drm_sched_job *sched_job;
+	struct drm_sched_job *sched_job, *next_job;
 
 	sched_job = drm_sched_entity_queue_peek(entity);
 	if (!sched_job)
@@ -491,21 +506,21 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 	 * Update the entity's location in the min heap according to
 	 * the timestamp of the next job, if any.
 	 */
-	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
-		struct drm_sched_job *next;
+	next_job = drm_sched_entity_queue_peek(entity);
+	if (next_job) {
+		struct drm_sched_rq *rq;
+		ktime_t ts;
 
-		next = drm_sched_entity_queue_peek(entity);
-		if (next) {
-			struct drm_sched_rq *rq;
-
-			spin_lock(&entity->lock);
-			rq = entity->rq;
-			spin_lock(&rq->lock);
-			drm_sched_rq_update_fifo_locked(entity, rq,
-							next->submit_ts);
-			spin_unlock(&rq->lock);
-			spin_unlock(&entity->lock);
-		}
+		spin_lock(&entity->lock);
+		rq = entity->rq;
+		spin_lock(&rq->lock);
+		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
+			ts = next_job->submit_ts;
+		else
+			ts = drm_sched_rq_get_rr_ts(rq, entity);
+		drm_sched_rq_update_fifo_locked(entity, rq, ts);
+		spin_unlock(&rq->lock);
+		spin_unlock(&entity->lock);
 	}
 
 	/* Jobs and entities might have different lifecycles. Since we're
@@ -612,9 +627,9 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 
 		spin_lock(&rq->lock);
 		drm_sched_rq_add_entity(rq, entity);
-
-		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
-			drm_sched_rq_update_fifo_locked(entity, rq, submit_ts);
+		if (drm_sched_policy == DRM_SCHED_POLICY_RR)
+			submit_ts = entity->rr_ts;
+		drm_sched_rq_update_fifo_locked(entity, rq, submit_ts);
 
 		spin_unlock(&rq->lock);
 		spin_unlock(&entity->lock);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 8b8c55b25762..8e62541b439a 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -185,7 +185,6 @@ static void drm_sched_rq_init(struct drm_sched_rq *rq,
 	spin_lock_init(&rq->lock);
 	INIT_LIST_HEAD(&rq->entities);
 	rq->rb_tree_root = RB_ROOT_CACHED;
-	rq->current_entity = NULL;
 	rq->sched = sched;
 }
 
@@ -231,74 +230,13 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 	atomic_dec(rq->sched->score);
 	list_del_init(&entity->list);
 
-	if (rq->current_entity == entity)
-		rq->current_entity = NULL;
-
-	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
-		drm_sched_rq_remove_fifo_locked(entity, rq);
+	drm_sched_rq_remove_fifo_locked(entity, rq);
 
 	spin_unlock(&rq->lock);
 }
 
 /**
- * drm_sched_rq_select_entity_rr - Select an entity which could provide a job to run
- *
- * @sched: the gpu scheduler
- * @rq: scheduler run queue to check.
- *
- * Try to find the next ready entity.
- *
- * Return an entity if one is found; return an error-pointer (!NULL) if an
- * entity was ready, but the scheduler had insufficient credits to accommodate
- * its job; return NULL, if no ready entity was found.
- */
-static struct drm_sched_entity *
-drm_sched_rq_select_entity_rr(struct drm_gpu_scheduler *sched,
-			      struct drm_sched_rq *rq)
-{
-	struct drm_sched_entity *entity;
-
-	spin_lock(&rq->lock);
-
-	entity = rq->current_entity;
-	if (entity) {
-		list_for_each_entry_continue(entity, &rq->entities, list) {
-			if (drm_sched_entity_is_ready(entity))
-				goto found;
-		}
-	}
-
-	list_for_each_entry(entity, &rq->entities, list) {
-		if (drm_sched_entity_is_ready(entity))
-			goto found;
-
-		if (entity == rq->current_entity)
-			break;
-	}
-
-	spin_unlock(&rq->lock);
-
-	return NULL;
-
-found:
-	if (!drm_sched_can_queue(sched, entity)) {
-		/*
-		 * If scheduler cannot take more jobs signal the caller to not
-		 * consider lower priority queues.
-		 */
-		entity = ERR_PTR(-ENOSPC);
-	} else {
-		rq->current_entity = entity;
-		reinit_completion(&entity->entity_idle);
-	}
-
-	spin_unlock(&rq->lock);
-
-	return entity;
-}
-
-/**
- * drm_sched_rq_select_entity_fifo - Select an entity which provides a job to run
+ * drm_sched_rq_select_entity - Select an entity which provides a job to run
  *
  * @sched: the gpu scheduler
  * @rq: scheduler run queue to check.
@@ -310,8 +248,8 @@ drm_sched_rq_select_entity_rr(struct drm_gpu_scheduler *sched,
  * its job; return NULL, if no ready entity was found.
  */
 static struct drm_sched_entity *
-drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
-				struct drm_sched_rq *rq)
+drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
+			   struct drm_sched_rq *rq)
 {
 	struct rb_node *rb;
 
@@ -1093,15 +1031,13 @@ void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
 static struct drm_sched_entity *
 drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 {
-	struct drm_sched_entity *entity;
+	struct drm_sched_entity *entity = NULL;
 	int i;
 
 	/* Start with the highest priority.
 	 */
 	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
-		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
-			drm_sched_rq_select_entity_fifo(sched, sched->sched_rq[i]) :
-			drm_sched_rq_select_entity_rr(sched, sched->sched_rq[i]);
+		entity = drm_sched_rq_select_entity(sched, sched->sched_rq[i]);
 		if (entity)
 			break;
 	}
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index fb88301b3c45..8992393ed200 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -94,7 +94,8 @@ struct drm_sched_entity {
 	 * @lock:
 	 *
 	 * Lock protecting the run-queue (@rq) to which this entity belongs,
-	 * @priority and the list of schedulers (@sched_list, @num_sched_list).
+	 * @priority, the list of schedulers (@sched_list, @num_sched_list) and
+	 * the @rr_ts field.
 	 */
 	spinlock_t			lock;
 
@@ -142,6 +143,13 @@ struct drm_sched_entity {
 	 */
 	enum drm_sched_priority         priority;
 
+	/**
+	 * @rr_ts:
+	 *
+	 * Fake timestamp of the last popped job from the entity.
+	 */
+	ktime_t				rr_ts;
+
 	/**
 	 * @job_queue: the list of jobs of this entity.
 	 */
@@ -239,8 +247,8 @@ struct drm_sched_entity {
  * struct drm_sched_rq - queue of entities to be scheduled.
  *
  * @sched: the scheduler to which this rq belongs to.
- * @lock: protects @entities, @rb_tree_root and @current_entity.
- * @current_entity: the entity which is to be scheduled.
+ * @lock: protects @entities, @rb_tree_root and @rr_ts.
+ * @rr_ts: monotonically incrementing fake timestamp for RR mode
  * @entities: list of the entities to be scheduled.
  * @rb_tree_root: root of time based priority queue of entities for FIFO scheduling
  *
@@ -253,7 +261,7 @@ struct drm_sched_rq {
 
 	spinlock_t			lock;
 	/* Following members are protected by the @lock: */
-	struct drm_sched_entity		*current_entity;
+	ktime_t				rr_ts;
 	struct list_head		entities;
 	struct rb_root_cached		rb_tree_root;
 };
-- 
2.48.0

