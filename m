Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2FB978574
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 18:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1936F10EB56;
	Fri, 13 Sep 2024 16:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="clXv4+77";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 075C710E287;
 Fri, 13 Sep 2024 16:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TZ/uLJh+Mi2B8hFJX7oqOiOIuUZwg1aIwDlsX3u2S5Q=; b=clXv4+776ZckzDvBJnAVuEJdQB
 auKfegFOTVL8bYG05SH3rpW+25jV6jNn2DHAvT+rbHuGcueiJbaVqsKFJhSdafdeeUQITZajckoWF
 Jjz85vLL9Csu/aCK2pImJ00BeyhV9KKuyI5i93jiQpWir9kHx1dp1WnBScfoAJvWtaFFcREnUlyfR
 jScHYEcXaBNz0fzrqrj0V6EPV18ykEmDXg2mix7/nPICUsthEO5cyhF5tach8JsCDlIY5y9PbFVT1
 XRmbOpqsDE9vu6kSRKe/7pWA+rJXybgiqm8EwNn8I3b5lQxCTpzwT4U7ICBIgYxd6VDGqfn2hnW8v
 AFYzfc6Q==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sp8oB-00DOfF-7t; Fri, 13 Sep 2024 18:06:07 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH 8/8] drm/sched: Further optimise drm_sched_entity_push_job
Date: Fri, 13 Sep 2024 17:05:59 +0100
Message-ID: <20240913160559.49054-9-tursulin@igalia.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240913160559.49054-1-tursulin@igalia.com>
References: <20240913160559.49054-1-tursulin@igalia.com>
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

Having removed one re-lock cycle on the entity->lock in a patch titled
"drm/sched: Optimise drm_sched_entity_push_job", with only a tiny bit
larger refactoring we can do the same optimisation on the rq->lock.
(Currently both drm_sched_rq_add_entity() and
drm_sched_rq_update_fifo_locked() take and release the same lock.)

To achieve this we rename drm_sched_rq_add_entity() to
drm_sched_rq_add_entity_locked(), making it expect the rq->lock to be
held, and also add the same expectation to
drm_sched_rq_update_fifo_locked().

Finally, to align drm_sched_rq_update_fifo_locked(),
drm_sched_rq_add_entity_locked() and
drm_sched_rq_remove_fifo_locked() function signatures, we add rq as a
parameter to the latter.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c |  8 ++++--
 drivers/gpu/drm/scheduler/sched_main.c   | 34 +++++++++++-------------
 include/drm/gpu_scheduler.h              |  7 ++---
 3 files changed, 26 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index d982cebc6bee..c48f17faef41 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -517,6 +517,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 		if (next) {
 			spin_lock(&entity->lock);
 			drm_sched_rq_update_fifo_locked(entity,
+							entity->rq,
 							next->submit_ts);
 			spin_unlock(&entity->lock);
 		}
@@ -618,11 +619,14 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 		sched = rq->sched;
 
 		atomic_inc(sched->score);
-		drm_sched_rq_add_entity(rq, entity);
+
+		spin_lock(&rq->lock);
+		drm_sched_rq_add_entity_locked(rq, entity);
 
 		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
-			drm_sched_rq_update_fifo_locked(entity, submit_ts);
+			drm_sched_rq_update_fifo_locked(entity, rq, submit_ts);
 
+		spin_unlock(&rq->lock);
 		spin_unlock(&entity->lock);
 
 		drm_sched_wakeup(sched, entity);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 18a952f73ecb..c0d3f6ac3ae3 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -153,17 +153,18 @@ static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
 	return ktime_before(ent_a->oldest_job_waiting, ent_b->oldest_job_waiting);
 }
 
-static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity)
+static void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *entity,
+					    struct drm_sched_rq *rq)
 {
-	struct drm_sched_rq *rq = entity->rq;
-
 	if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
 		rb_erase_cached(&entity->rb_tree_node, &rq->rb_tree_root);
 		RB_CLEAR_NODE(&entity->rb_tree_node);
 	}
 }
 
-void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity, ktime_t ts)
+void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
+				     struct drm_sched_rq *rq,
+				     ktime_t ts)
 {
 	/*
 	 * Both locks need to be grabbed, one to protect from entity->rq change
@@ -171,17 +172,14 @@ void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity, ktime_t ts
 	 * other to update the rb tree structure.
 	 */
 	lockdep_assert_held(&entity->lock);
+	lockdep_assert_held(&rq->lock);
 
-	spin_lock(&entity->rq->lock);
-
-	drm_sched_rq_remove_fifo_locked(entity);
+	drm_sched_rq_remove_fifo_locked(entity, rq);
 
 	entity->oldest_job_waiting = ts;
 
-	rb_add_cached(&entity->rb_tree_node, &entity->rq->rb_tree_root,
+	rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
 		      drm_sched_entity_compare_before);
-
-	spin_unlock(&entity->rq->lock);
 }
 
 /**
@@ -203,25 +201,23 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
 }
 
 /**
- * drm_sched_rq_add_entity - add an entity
+ * drm_sched_rq_add_entity_locked - add an entity
  *
  * @rq: scheduler run queue
  * @entity: scheduler entity
  *
  * Adds a scheduler entity to the run queue.
  */
-void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
-			     struct drm_sched_entity *entity)
+void drm_sched_rq_add_entity_locked(struct drm_sched_rq *rq,
+				    struct drm_sched_entity *entity)
 {
+	lockdep_assert_held(&rq->lock);
+
 	if (!list_empty(&entity->list))
 		return;
 
-	spin_lock(&rq->lock);
-
 	atomic_inc(rq->sched->score);
 	list_add_tail(&entity->list, &rq->entities);
-
-	spin_unlock(&rq->lock);
 }
 
 /**
@@ -235,6 +231,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 				struct drm_sched_entity *entity)
 {
+	lockdep_assert_held(&entity->lock);
+
 	if (list_empty(&entity->list))
 		return;
 
@@ -247,7 +245,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 		rq->current_entity = NULL;
 
 	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
-		drm_sched_rq_remove_fifo_locked(entity);
+		drm_sched_rq_remove_fifo_locked(entity, rq);
 
 	spin_unlock(&rq->lock);
 }
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 80198e6cf537..30686961a379 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -591,12 +591,13 @@ bool drm_sched_dependency_optimized(struct dma_fence* fence,
 				    struct drm_sched_entity *entity);
 void drm_sched_fault(struct drm_gpu_scheduler *sched);
 
-void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
-			     struct drm_sched_entity *entity);
+void drm_sched_rq_add_entity_locked(struct drm_sched_rq *rq,
+				    struct drm_sched_entity *entity);
 void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 				struct drm_sched_entity *entity);
 
-void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity, ktime_t ts);
+void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
+				     struct drm_sched_rq *rq, ktime_t ts);
 
 int drm_sched_entity_init(struct drm_sched_entity *entity,
 			  enum drm_sched_priority priority,
-- 
2.46.0

