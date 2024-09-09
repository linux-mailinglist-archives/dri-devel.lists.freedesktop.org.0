Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DF2972044
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 19:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FC210E605;
	Mon,  9 Sep 2024 17:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="MnUJq8Qs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C5E10E5FA;
 Mon,  9 Sep 2024 17:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=74xG3FILrxMOop27FYAREcRZO1yaaMP//fUdVd3VxVQ=; b=MnUJq8QspAulp3u5fr1BZgQ32/
 /7gGTRlKRGghA9C9a2zRP6l3lau0rON3xQMzLUQ9JHApLy/MVvmTwTcubuo/ljXOmmxdkImKYTe39
 bCew5aO3G37AZQDD0u/QoNM4T8nmPT27DchTKCYecnz8CIfSh8MT/Yoax33J5P0JoyVIQ+jueF2eh
 zrdC914l1Qw0DYhszlBnyKk52sVlVtn/Skm+Vz6WriCeox/Jjn42jjYN5GrPOw5UwV2VooXOYWR6E
 qCMu0zeSbV1PNJXFsvGGAtn9W8ENLZOlmMpVNoCzmM9SYgRBT5QNK8ns7UVu9V32vVAQGrSMNQGQA
 wlWDNHow==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sni3G-00Bg5Y-6W; Mon, 09 Sep 2024 19:19:46 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH 7/8] drm/sched: Re-group and rename the entity run-queue lock
Date: Mon,  9 Sep 2024 18:19:36 +0100
Message-ID: <20240909171937.51550-8-tursulin@igalia.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909171937.51550-1-tursulin@igalia.com>
References: <20240909171937.51550-1-tursulin@igalia.com>
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
---
 drivers/gpu/drm/scheduler/sched_entity.c | 24 ++++++++++++------------
 drivers/gpu/drm/scheduler/sched_main.c   |  6 +++---
 include/drm/gpu_scheduler.h              | 15 ++++++++-------
 3 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 2da677681291..b4c4f9923e0b 100644
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
 
@@ -555,14 +555,14 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
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
@@ -602,9 +602,9 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 		struct drm_sched_rq *rq;
 
 		/* Add the entity to the run queue */
-		spin_lock(&entity->rq_lock);
+		spin_lock(&entity->lock);
 		if (entity->stopped) {
-			spin_unlock(&entity->rq_lock);
+			spin_unlock(&entity->lock);
 
 			DRM_ERROR("Trying to push to a killed entity\n");
 			return;
@@ -619,7 +619,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
 			drm_sched_rq_update_fifo_locked(entity, submit_ts);
 
-		spin_unlock(&entity->rq_lock);
+		spin_unlock(&entity->lock);
 
 		drm_sched_wakeup(sched, entity);
 	}
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 54c5fe7a7d1d..937e7d1cfc49 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -165,7 +165,7 @@ static inline void drm_sched_rq_remove_fifo_locked(struct drm_sched_entity *enti
 
 void drm_sched_rq_update_fifo_locked(struct drm_sched_entity *entity, ktime_t ts)
 {
-	lockdep_assert_held(&entity->rq_lock);
+	lockdep_assert_held(&entity->lock);
 
 	spin_lock(&entity->rq->lock);
 
@@ -186,9 +186,9 @@ void drm_sched_rq_update_fifo(struct drm_sched_entity *entity, ktime_t ts)
 	 * for entity from within concurrent drm_sched_entity_select_rq and the
 	 * other to update the rb tree structure.
 	 */
-	spin_lock(&entity->rq_lock);
+	spin_lock(&entity->lock);
 	drm_sched_rq_update_fifo_locked(entity, ts);
-	spin_unlock(&entity->rq_lock);
+	spin_unlock(&entity->lock);
 }
 
 /**
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index d4a3ba333568..5a1e4c803b90 100644
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

