Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F0BA9C526
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 12:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABA310E91B;
	Fri, 25 Apr 2025 10:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fuwZk7gf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0022910E913;
 Fri, 25 Apr 2025 10:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eGFktW14eDA/4ScKaJOiqdHxlBWPMUR03vI1+F3NjMw=; b=fuwZk7gfjEolXA5mdFlBMkjE5C
 JWmDMosQqj6xS0KQY8hS2ARCkyLqUaKWGK/UtYoIO1hwIx+CXgmpKaYC6ESi/UnJNomeOntAm72iH
 JpnRmNQXqZIQ6qOcjpuu5bm025y6CVNWglNUxAWlxGnzTvGV4UwE0KnR0yNRdQVXaqZAvFfxGhcOd
 BI+6kFwQBlwprAFSDxiucnKLHM8ECxhs4GpQhnwxJC2+OIYQWBOlB6Eh8UaztG2PLVB3ri6A1ibe0
 iQXjHjigiwDxh4GNSZibBmpfvvyZaAY2s8PQsMcjvgijLuZeJCVIrucDFmmAa8YIggy52PWRQy1NO
 zzDDFO3g==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u8GAp-008GsF-82; Fri, 25 Apr 2025 12:20:47 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [RFC v4 08/16] drm/sched: Consolidate entity run queue management
Date: Fri, 25 Apr 2025 11:20:26 +0100
Message-ID: <20250425102034.85133-9-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250425102034.85133-1-tvrtko.ursulin@igalia.com>
References: <20250425102034.85133-1-tvrtko.ursulin@igalia.com>
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

Move the code dealing with entities entering and exiting run queues to
helpers to logically separate it from jobs entering and exiting entities.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c   | 60 ++-------------
 drivers/gpu/drm/scheduler/sched_internal.h |  8 +-
 drivers/gpu/drm/scheduler/sched_main.c     | 87 +++++++++++++++++++---
 3 files changed, 83 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index bbb7f3d3e3e8..8362184fe431 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -469,19 +469,9 @@ drm_sched_job_dependency(struct drm_sched_job *job,
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
+	struct drm_sched_job *sched_job;
 
 	sched_job = drm_sched_entity_queue_peek(entity);
 	if (!sched_job)
@@ -512,27 +502,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 
 	spsc_queue_pop(&entity->job_queue);
 
-	/*
-	 * Update the entity's location in the min heap according to
-	 * the timestamp of the next job, if any.
-	 */
-	next_job = drm_sched_entity_queue_peek(entity);
-	if (next_job) {
-		struct drm_sched_rq *rq;
-		ktime_t ts;
-
-		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
-			ts = next_job->submit_ts;
-		else
-			ts = drm_sched_rq_get_rr_deadline(rq);
-
-		spin_lock(&entity->lock);
-		rq = entity->rq;
-		spin_lock(&rq->lock);
-		drm_sched_rq_update_fifo_locked(entity, rq, ts);
-		spin_unlock(&rq->lock);
-		spin_unlock(&entity->lock);
-	}
+	drm_sched_rq_pop_entity(entity);
 
 	/* Jobs and entities might have different lifecycles. Since we're
 	 * removing the job from the entities queue, set the jobs entity pointer
@@ -614,30 +584,10 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
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
+		sched = drm_sched_rq_add_entity(entity, submit_ts);
+		if (sched)
+			drm_sched_wakeup(sched);
 	}
 }
 EXPORT_SYMBOL(drm_sched_entity_push_job);
diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
index 599cf6e1bb74..8e7e477bace3 100644
--- a/drivers/gpu/drm/scheduler/sched_internal.h
+++ b/drivers/gpu/drm/scheduler/sched_internal.h
@@ -12,13 +12,11 @@ extern int drm_sched_policy;
 
 void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
 
-void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
-			     struct drm_sched_entity *entity);
+struct drm_gpu_scheduler *
+drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts);
 void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 				struct drm_sched_entity *entity);
-
-void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
-				     struct drm_sched_rq *rq, ktime_t ts);
+void drm_sched_rq_pop_entity(struct drm_sched_entity *entity);
 
 void drm_sched_entity_select_rq(struct drm_sched_entity *entity);
 struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 2bac478a50bf..d3e16e5d2e38 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -144,15 +144,18 @@ static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
 static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
 					    struct drm_sched_rq *rq)
 {
+	lockdep_assert_held(&entity->lock);
+	lockdep_assert_held(&rq->lock);
+
 	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
 		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
 		RB_CLEAR_NODE(&entity->rb_tree_node);
 	}
 }
 
-void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
-				     struct drm_sched_rq *rq,
-				     ktime_t ts)
+static void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
+					    struct drm_sched_rq *rq,
+					    ktime_t ts)
 {
 	/*
 	 * Both locks need to be grabbed, one to protect from entity->rq change
@@ -187,25 +190,58 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
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
- * @rq: scheduler run queue
  * @entity: scheduler entity
+ * @ts: submission timestamp
  *
  * Adds a scheduler entity to the run queue.
+ *
+ * Returns a DRM scheduler pre-selected to handle this entity.
  */
-void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
-			     struct drm_sched_entity *entity)
+struct drm_gpu_scheduler *
+drm_sched_rq_add_entity(struct drm_sched_entity *entity, ktime_t ts)
 {
-	lockdep_assert_held(&entity->lock);
-	lockdep_assert_held(&rq->lock);
+	struct drm_gpu_scheduler *sched;
+	struct drm_sched_rq *rq;
 
-	if (!list_empty(&entity->list))
-		return;
+	/* Add the entity to the run queue */
+	spin_lock(&entity->lock);
+	if (entity->stopped) {
+		spin_unlock(&entity->lock);
 
-	atomic_inc(rq->sched->score);
-	list_add_tail(&entity->list, &rq->entities);
+		DRM_ERROR("Trying to push to a killed entity\n");
+		return NULL;
+	}
+
+	rq = entity->rq;
+	spin_lock(&rq->lock);
+	sched = rq->sched;
+
+	if (list_empty(&entity->list)) {
+		atomic_inc(sched->score);
+		list_add_tail(&entity->list, &rq->entities);
+	}
+
+	if (drm_sched_policy == DRM_SCHED_POLICY_RR)
+		ts = drm_sched_rq_get_rr_deadline(rq);
+	drm_sched_rq_update_fifo_locked(entity, rq, ts);
+
+	spin_unlock(&rq->lock);
+	spin_unlock(&entity->lock);
+
+	return sched;
 }
 
 /**
@@ -234,6 +270,33 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 	spin_unlock(&rq->lock);
 }
 
+void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
+{
+	struct drm_sched_job *next_job;
+	struct drm_sched_rq *rq;
+	ktime_t ts;
+
+	/*
+	 * Update the entity's location in the min heap according to
+	 * the timestamp of the next job, if any.
+	 */
+	next_job = drm_sched_entity_queue_peek(entity);
+	if (!next_job)
+		return;
+
+	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
+		ts = next_job->submit_ts;
+	else
+		ts = drm_sched_rq_get_rr_deadline(rq);
+
+	spin_lock(&entity->lock);
+	rq = entity->rq;
+	spin_lock(&rq->lock);
+	drm_sched_rq_update_fifo_locked(entity, rq, ts);
+	spin_unlock(&rq->lock);
+	spin_unlock(&entity->lock);
+}
+
 /**
  * drm_sched_rq_select_entity - Select an entity which provides a job to run
  *
-- 
2.48.0

