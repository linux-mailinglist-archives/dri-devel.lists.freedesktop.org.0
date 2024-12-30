Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9EB9FE928
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 17:53:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94CC10E530;
	Mon, 30 Dec 2024 16:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="BQhjghOh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 928D010E527
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 16:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KFcaAC3/akPjjkIkXWmHXKqRMGt/8+cj1FcmVpgtEsg=; b=BQhjghOhbcv0cI7Ap8Pc8iroz+
 XeEY2UBtzK99I8Rmg9KV5w7HlOl/2KEKir7uQzYvEKYSnLRUCH3mCIhoL2k4qnp1Joyun58iztt7c
 rPsZ14FEIdJLfSjdql5jMYB1ntUfMhcXPt1q0df0/37RTJP1e/oDmFFKKpP/7njIczPGBogPVoymY
 VOHAAUuof46I3f2dNpBEsvIIZDTKdoaLL1a8e5xouhbCViLPun/22nJXGdJ9gm/HfBt9QqmPvvUmd
 EVvPS7VVhnfFezyxlwpRBFOB5vL+SnXVacb4bp1mI/XVtCMiMA43yJXq641OeNZQs4t7x86y70StP
 O0oStkoQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tSJ0u-009Zvv-R1; Mon, 30 Dec 2024 17:53:08 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [RFC 07/14] drm/sched: Resolve same scheduler dependencies earlier
Date: Mon, 30 Dec 2024 16:52:52 +0000
Message-ID: <20241230165259.95855-8-tursulin@igalia.com>
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

When a job's dependency is on a same scheduler we pipeline the two
directly to the backend by replacing the dependency with the scheduled
instead of the finished fence. Ordering is handled by the backend.

Instead of doing this fence substitution at the time of popping the job
(entity selected by the worker), we can do it earlier when preparing the
job for submission.

We add a new helper drm_sched_job_prepare_dependecies() which is ran
before pushing the job but inside the arm+push block guaranteeing the
final scheduler instance has been assigned and is fixed.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 72 +++++++-----------------
 drivers/gpu/drm/scheduler/sched_main.c   | 23 ++++++++
 include/drm/gpu_scheduler.h              |  2 +-
 3 files changed, 45 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 2c342c7b9712..608bc43ff256 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -360,31 +360,6 @@ void drm_sched_entity_destroy(struct drm_sched_entity *entity)
 }
 EXPORT_SYMBOL(drm_sched_entity_destroy);
 
-/* drm_sched_entity_clear_dep - callback to clear the entities dependency */
-static void drm_sched_entity_clear_dep(struct dma_fence *f,
-				       struct dma_fence_cb *cb)
-{
-	struct drm_sched_entity *entity =
-		container_of(cb, struct drm_sched_entity, cb);
-
-	entity->dependency = NULL;
-	dma_fence_put(f);
-}
-
-/*
- * drm_sched_entity_wakeup - callback to clear the entity's dependency and
- * wake up the scheduler
- */
-static void drm_sched_entity_wakeup(struct dma_fence *f,
-				    struct dma_fence_cb *cb)
-{
-	struct drm_sched_entity *entity =
-		container_of(cb, struct drm_sched_entity, cb);
-
-	drm_sched_entity_clear_dep(f, cb);
-	drm_sched_wakeup(entity->rq->sched);
-}
-
 /**
  * drm_sched_entity_set_priority - Sets priority of the entity
  *
@@ -402,41 +377,34 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
 }
 EXPORT_SYMBOL(drm_sched_entity_set_priority);
 
+/*
+ * drm_sched_entity_wakeup - callback to clear the entity's dependency and
+ * wake up the scheduler
+ */
+static void drm_sched_entity_wakeup(struct dma_fence *f,
+				    struct dma_fence_cb *cb)
+{
+	struct drm_sched_entity *entity =
+		container_of(cb, struct drm_sched_entity, cb);
+
+	entity->dependency = NULL;
+	dma_fence_put(f);
+	drm_sched_wakeup(entity->rq->sched);
+}
+
 /*
  * Add a callback to the current dependency of the entity to wake up the
  * scheduler when the entity becomes available.
  */
 static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *entity)
 {
-	struct drm_gpu_scheduler *sched = entity->rq->sched;
 	struct dma_fence *fence = entity->dependency;
-	struct drm_sched_fence *s_fence;
 
-	s_fence = to_drm_sched_fence(fence);
-	if (!fence->error && s_fence && s_fence->sched == sched &&
-	    !test_bit(DRM_SCHED_FENCE_DONT_PIPELINE, &fence->flags)) {
-
-		/*
-		 * Fence is from the same scheduler, only need to wait for
-		 * it to be scheduled
-		 */
-		fence = dma_fence_get(&s_fence->scheduled);
-		dma_fence_put(entity->dependency);
-		entity->dependency = fence;
-		if (!dma_fence_add_callback(fence, &entity->cb,
-					    drm_sched_entity_clear_dep))
-			return true;
-
-		/* Ignore it when it is already scheduled */
-		dma_fence_put(fence);
-		return false;
-	}
-
-	if (!dma_fence_add_callback(entity->dependency, &entity->cb,
+	if (!dma_fence_add_callback(fence, &entity->cb,
 				    drm_sched_entity_wakeup))
 		return true;
 
-	dma_fence_put(entity->dependency);
+	dma_fence_put(fence);
 	return false;
 }
 
@@ -558,19 +526,21 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
 void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
 {
 	struct drm_sched_entity *entity = sched_job->entity;
+	ktime_t submit_ts = ktime_get();
 	bool first;
-	ktime_t submit_ts;
 
 	trace_drm_sched_job(sched_job, entity);
 	atomic_inc(entity->rq->sched->score);
 	WRITE_ONCE(entity->last_user, current->group_leader);
 
+	drm_sched_job_prepare_dependecies(sched_job);
+
 	/*
 	 * After the sched_job is pushed into the entity queue, it may be
 	 * completed and freed up at any time. We can no longer access it.
 	 * Make sure to set the submit_ts first, to avoid a race.
 	 */
-	sched_job->submit_ts = submit_ts = ktime_get();
+	sched_job->submit_ts = submit_ts;
 	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
 
 	/* first job wakes up scheduler */
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 34ed22c6482e..ba9b0274b185 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -780,6 +780,29 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
 }
 EXPORT_SYMBOL(drm_sched_job_add_implicit_dependencies);
 
+void drm_sched_job_prepare_dependecies(struct drm_sched_job *job)
+{
+	struct drm_gpu_scheduler *sched = job->sched;
+	struct dma_fence *fence;
+	unsigned long index;
+
+	xa_for_each(&job->dependencies, index, fence) {
+		struct drm_sched_fence *s_fence = to_drm_sched_fence(fence);
+
+		if (fence->error || !s_fence || s_fence->sched != sched ||
+		    test_bit(DRM_SCHED_FENCE_DONT_PIPELINE, &fence->flags))
+			continue;
+
+		/*
+		 * Fence is from the same scheduler, only need to wait for
+		 * it to be scheduled.
+		 */
+		xa_store(&job->dependencies, index,
+			 dma_fence_get(&s_fence->scheduled), GFP_KERNEL);
+		dma_fence_put(fence);
+	}
+}
+
 /**
  * drm_sched_job_cleanup - clean up scheduler job resources
  * @job: scheduler job to clean up
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 45879a755f34..6fee85e45d45 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -570,7 +570,7 @@ int drm_sched_job_add_resv_dependencies(struct drm_sched_job *job,
 int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
 					    struct drm_gem_object *obj,
 					    bool write);
-
+void drm_sched_job_prepare_dependecies(struct drm_sched_job *job);
 
 void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
 				    struct drm_gpu_scheduler **sched_list,
-- 
2.47.1

