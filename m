Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB5C984385
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 12:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2AFB10E6CC;
	Tue, 24 Sep 2024 10:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Q32mc3m7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A8D10E6B8;
 Tue, 24 Sep 2024 10:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3lo6c/SaW7HVua7qjI5VULymGPvnjwEd2mLW6Aaj3Cg=; b=Q32mc3m73bv2eK94zIcvhc06vN
 SUsLIiSDkt9REym/mO5dEXms5r9NZf5/ZA9qCUTE6PoXN2dUHsXG++B0aijUeJBRHvVYgTF6bNlM3
 vU1UcEF6tu9RmmHnz0vahJGXwWjjOegHe0x94v8v7U62q6cYnHTU1Tdxhn8vc5V5rnCIQg62sU0k7
 1/HUtUPR9a3P7d+E1UUN7w3OQEmINdpau6VEZ+4e09SrGVbzaboX/u6bSZaKPml9YkvnENYJvR9Oe
 EJo/iYDKCemcDgBCFIwH/uhVtzuvdqIfEmAoMcr7Pv0qSxvq4JgOGAGaETgoJSWJGNgp5MMhIow4s
 CApjsO7w==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1st2dg-000L2s-8J; Tue, 24 Sep 2024 12:19:24 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH 7/8] drm/sched: Re-group and rename the entity run-queue lock
Date: Tue, 24 Sep 2024 11:19:13 +0100
Message-ID: <20240924101914.2713-8-tursulin@igalia.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240924101914.2713-1-tursulin@igalia.com>
References: <20240924101914.2713-1-tursulin@igalia.com>
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

Christian suggested to rename the lock and improve the documentation of
what it protects. And to also re-order the structure members so all
protected by the lock are together in a block.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 28 ++++++++++++------------
 drivers/gpu/drm/scheduler/sched_main.c   |  2 +-
 include/drm/gpu_scheduler.h              | 15 +++++++------
 3 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 59f710afe992..5ebbba77e77d 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -105,7 +105,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	/* We start in an idle state. */
 	complete_all(&entity->entity_idle);
 
-	spin_lock_init(&entity->rq_lock);
+	spin_lock_init(&entity->lock);
 	spsc_queue_init(&entity->job_queue);
 
 	atomic_set(&entity->fence_seq, 0);
@@ -133,10 +133,10 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 {
 	WARN_ON(!num_sched_list || !sched_list);
 
-	spin_lock(&entity->rq_lock);
+	spin_lock(&entity->lock);
 	entity->sched_list = sched_list;
 	entity->num_sched_list = num_sched_list;
-	spin_unlock(&entity->rq_lock);
+	spin_unlock(&entity->lock);
 }
 EXPORT_SYMBOL(drm_sched_entity_modify_sched);
 
@@ -244,10 +244,10 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
 	if (!entity->rq)
 		return;
 
-	spin_lock(&entity->rq_lock);
+	spin_lock(&entity->lock);
 	entity->stopped = true;
 	drm_sched_rq_remove_entity(entity->rq, entity);
-	spin_unlock(&entity->rq_lock);
+	spin_unlock(&entity->lock);
 
 	/* Make sure this entity is not used by the scheduler at the moment */
 	wait_for_completion(&entity->entity_idle);
@@ -396,9 +396,9 @@ static void drm_sched_entity_wakeup(struct dma_fence *f,
 void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
 				   enum drm_sched_priority priority)
 {
-	spin_lock(&entity->rq_lock);
+	spin_lock(&entity->lock);
 	entity->priority = priority;
-	spin_unlock(&entity->rq_lock);
+	spin_unlock(&entity->lock);
 }
 EXPORT_SYMBOL(drm_sched_entity_set_priority);
 
@@ -515,10 +515,10 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
 
 		next = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
 		if (next) {
-			spin_lock(&entity->rq_lock);
+			spin_lock(&entity->lock);
 			drm_sched_rq_update_fifo_locked(entity,
 							next->submit_ts);
-			spin_unlock(&entity->rq_lock);
+			spin_unlock(&entity->lock);
 		}
 	}
 
@@ -559,14 +559,14 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 	if (fence && !dma_fence_is_signaled(fence))
 		return;
 
-	spin_lock(&entity->rq_lock);
+	spin_lock(&entity->lock);
 	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
 	rq = sched ? sched->sched_rq[entity->priority] : NULL;
 	if (rq != entity->rq) {
 		drm_sched_rq_remove_entity(entity->rq, entity);
 		entity->rq = rq;
 	}
-	spin_unlock(&entity->rq_lock);
+	spin_unlock(&entity->lock);
 
 	if (entity->num_sched_list == 1)
 		entity->sched_list = NULL;
@@ -606,9 +606,9 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 		struct drm_sched_rq *rq;
 
 		/* Add the entity to the run queue */
-		spin_lock(&entity->rq_lock);
+		spin_lock(&entity->lock);
 		if (entity->stopped) {
-			spin_unlock(&entity->rq_lock);
+			spin_unlock(&entity->lock);
 
 			DRM_ERROR("Trying to push to a killed entity\n");
 			return;
@@ -623,7 +623,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
 			drm_sched_rq_update_fifo_locked(entity, submit_ts);
 
-		spin_unlock(&entity->rq_lock);
+		spin_unlock(&entity->lock);
 
 		drm_sched_wakeup(sched);
 	}
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 130b53f02bbf..5628a4c78242 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -170,7 +170,7 @@ void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity, ktime_t ts
 	 * for entity from within concurrent drm_sched_entity_select_rq and the
 	 * other to update the rb tree structure.
 	 */
-	lockdep_assert_held(&entity->rq_lock);
+	lockdep_assert_held(&entity->lock);
 
 	spin_lock(&entity->rq->lock);
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 33c60889e0a3..6db30fcb18dc 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -96,6 +96,14 @@ struct drm_sched_entity {
 	 */
 	struct list_head		list;
 
+	/**
+	 * @lock:
+	 *
+	 * Lock protecting the run-queue (@rq) to which this entity belongs,
+	 * @priority and the list of schedulers (@sched_list, @num_sched_list).
+	 */
+	spinlock_t			lock;
+
 	/**
 	 * @rq:
 	 *
@@ -140,13 +148,6 @@ struct drm_sched_entity {
 	 */
 	enum drm_sched_priority         priority;
 
-	/**
-	 * @rq_lock:
-	 *
-	 * Lock to modify the runqueue to which this entity belongs.
-	 */
-	spinlock_t			rq_lock;
-
 	/**
 	 * @job_queue: the list of jobs of this entity.
 	 */
-- 
2.46.0

