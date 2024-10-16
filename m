Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA2F9A0939
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 14:20:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCF410E606;
	Wed, 16 Oct 2024 12:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mkxBI8u7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A265210E5BA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 12:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iOkftygLPLPVbbvsxtoHAGwq1rn6j8Q73fLTTY1s9Qo=; b=mkxBI8u7bR0/czx21cNK9A/kzt
 1xxyiN54/1fA6mMQQGYDKfPlfr/5t7kePNMUBRlAOZt0NtNcUO1wbOasRqmBByqyygGEQ5W84b7Mv
 yWYxNPOeaJAVsrse01uJJIOxSNkVNPS4z+iLScd1mLHu94aYfsWar06YtiOolhVvKEmFq5VB1HaIx
 dHnGMgqnv8vSQmK5yj5mpmanw40qapOsNz2AHCDWsRNhH+tz4AKuObHqjnq81XbFXWDwY72FfNQ1y
 kzJcnWwObZ1l0wvf2kpGjGI8uh/lHs+LHu5EDYRCXFlGxV/wT1P1se0UR6MW0CZA6WiQdSlZ8mCbd
 WloIlesQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1t130l-00Ajj0-QL; Wed, 16 Oct 2024 14:20:19 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH 5/5] drm/sched: Further optimise drm_sched_entity_push_job
Date: Wed, 16 Oct 2024 13:20:13 +0100
Message-ID: <20241016122013.7857-6-tursulin@igalia.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241016122013.7857-1-tursulin@igalia.com>
References: <20241016122013.7857-1-tursulin@igalia.com>
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

To achieve this we make drm_sched_rq_update_fifo_locked() and
drm_sched_rq_add_entity() expect the rq->lock to be held.

We also align drm_sched_rq_update_fifo_locked(),
drm_sched_rq_add_entity() and
drm_sched_rq_remove_fifo_locked() function signatures, by adding rq as a
parameter to the latter.

v2:
 * Fix after rebase of the series.
 * Avoid naming inconsistency between drm_sched_rq_add/remove. (Christian)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 11 +++++++--
 drivers/gpu/drm/scheduler/sched_main.c   | 29 ++++++++++++------------
 include/drm/gpu_scheduler.h              |  3 ++-
 3 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index c013c2b49aa5..69bcf0e99d57 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -515,9 +515,14 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 
 		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
 		if (next) {
+			struct drm_sched_rq *rq;
+
 			spin_lock(&entity->lock);
-			drm_sched_rq_update_fifo_locked(entity,
+			rq = entity->rq;
+			spin_lock(&rq->lock);
+			drm_sched_rq_update_fifo_locked(entity, rq,
 							next->submit_ts);
+			spin_unlock(&rq->lock);
 			spin_unlock(&entity->lock);
 		}
 	}
@@ -616,11 +621,13 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 		rq = entity->rq;
 		sched = rq->sched;
 
+		spin_lock(&rq->lock);
 		drm_sched_rq_add_entity(rq, entity);
 
 		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
-			drm_sched_rq_update_fifo_locked(entity, submit_ts);
+			drm_sched_rq_update_fifo_locked(entity, rq, submit_ts);
 
+		spin_unlock(&rq->lock);
 		spin_unlock(&entity->lock);
 
 		drm_sched_wakeup(sched);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 2670bf9f34b2..6e4d004d09ce 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -159,17 +159,18 @@ static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
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
@@ -177,17 +178,14 @@ void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity, ktime_t ts
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
@@ -219,15 +217,14 @@ static void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
 void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 			     struct drm_sched_entity *entity)
 {
+	lockdep_assert_held(&entity->lock);
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
@@ -241,6 +238,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 				struct drm_sched_entity *entity)
 {
+	lockdep_assert_held(&entity->lock);
+
 	if (list_empty(&entity->list))
 		return;
 
@@ -253,7 +252,7 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 		rq->current_entity = NULL;
 
 	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
-		drm_sched_rq_remove_fifo_locked(entity);
+		drm_sched_rq_remove_fifo_locked(entity, rq);
 
 	spin_unlock(&rq->lock);
 }
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 8ef33765b3b8..e29960c724eb 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -596,7 +596,8 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 				struct drm_sched_entity *entity);
 
-void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity, ktime_t ts);
+void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity,
+				     struct drm_sched_rq *rq, ktime_t ts);
 
 int drm_sched_entity_init(struct drm_sched_entity *entity,
 			  enum drm_sched_priority priority,
-- 
2.46.0

