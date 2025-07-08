Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF27AFC78B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 11:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA0B10E60A;
	Tue,  8 Jul 2025 09:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="VO/5OHgf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312B510E5F3;
 Tue,  8 Jul 2025 09:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=55N7Ac7EUDE+b1x2jjVf8N52rBWuXlgp0ZS3+CaHt5o=; b=VO/5OHgf+E1ra3D//7L2GPCp1T
 zGzVL7mSve0IOlTv5qwX5gcxNpxoz3pBdisWT+aJKuXzVnjh99ZESuMyxjfsiRmYSn9k29bVlaiFa
 eHv/o0Hvyo5rXXeb6QaGNYj/i751NjHtGNf+ystGezeH5EOhH8OEsuCE/15TCSbwsgNvYFYirSOch
 g/gAEk7bd80Nzwj03jM1tr5Xw2yhGttxNz4JTPwWEQLLmYqC0y4vhn+HoJuGk55KLu29VJ5j+RiZQ
 eMosb0jlSEMKFGDrbFAvlYe5BjF1Oc2N+n7mGGYAtp5Sw9bX5IR07Io870Hn42Krj73FnbytIhA4G
 +zXd+3zg==;
Received: from [84.65.48.237] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uZ4zY-00Dx5I-F3; Tue, 08 Jul 2025 11:52:00 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v6 14/15] drm/sched: Queue all free credits in one worker
 invocation
Date: Tue,  8 Jul 2025 10:51:46 +0100
Message-ID: <20250708095147.73366-15-tvrtko.ursulin@igalia.com>
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

There is no reason to queue just a single job if scheduler can take more
and re-queue the worker to queue more. We can simply feed the hardware
with as much as it can take in one go and hopefully win some latency.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_internal.h |   2 -
 drivers/gpu/drm/scheduler/sched_main.c     | 132 ++++++++++-----------
 drivers/gpu/drm/scheduler/sched_rq.c       |  12 +-
 3 files changed, 64 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_internal.h b/drivers/gpu/drm/scheduler/sched_internal.h
index 15d78abc48df..1a5c2f255223 100644
--- a/drivers/gpu/drm/scheduler/sched_internal.h
+++ b/drivers/gpu/drm/scheduler/sched_internal.h
@@ -22,8 +22,6 @@ struct drm_sched_entity_stats {
 	u64		vruntime;
 };
 
-bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
-			 struct drm_sched_entity *entity);
 void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
 
 void drm_sched_rq_init(struct drm_gpu_scheduler *sched,
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 35025edea669..1fb3f1da4821 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -95,35 +95,6 @@ static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
 	return credits;
 }
 
-/**
- * drm_sched_can_queue -- Can we queue more to the hardware?
- * @sched: scheduler instance
- * @entity: the scheduler entity
- *
- * Return true if we can push at least one more job from @entity, false
- * otherwise.
- */
-bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
-			 struct drm_sched_entity *entity)
-{
-	struct drm_sched_job *s_job;
-
-	s_job = drm_sched_entity_queue_peek(entity);
-	if (!s_job)
-		return false;
-
-	/* If a job exceeds the credit limit, truncate it to the credit limit
-	 * itself to guarantee forward progress.
-	 */
-	if (s_job->credits > sched->credit_limit) {
-		dev_WARN(sched->dev,
-			 "Jobs may not exceed the credit limit, truncate.\n");
-		s_job->credits = sched->credit_limit;
-	}
-
-	return drm_sched_available_credits(sched) >= s_job->credits;
-}
-
 /**
  * drm_sched_run_job_queue - enqueue run-job work
  * @sched: scheduler instance
@@ -940,54 +911,77 @@ static void drm_sched_run_job_work(struct work_struct *w)
 {
 	struct drm_gpu_scheduler *sched =
 		container_of(w, struct drm_gpu_scheduler, work_run_job);
+	u32 job_credits, submitted_credits = 0;
 	struct drm_sched_entity *entity;
-	struct dma_fence *fence;
 	struct drm_sched_fence *s_fence;
 	struct drm_sched_job *sched_job;
-	int r;
+	struct dma_fence *fence;
 
-	/* Find entity with a ready job */
-	entity = drm_sched_rq_select_entity(sched, sched->rq);
-	if (IS_ERR_OR_NULL(entity))
-		return;	/* No more work */
+	while (!READ_ONCE(sched->pause_submit)) {
+		/* Find entity with a ready job */
+		entity = drm_sched_rq_select_entity(sched, sched->rq);
+		if (!entity)
+			break;	/* No more work */
+
+		sched_job = drm_sched_entity_queue_peek(entity);
+		if (!sched_job) {
+			complete_all(&entity->entity_idle);
+			continue;
+		}
+
+		job_credits = sched_job->credits;
+		/*
+		 * If a job exceeds the credit limit truncate it to guarantee
+		 * forward progress.
+		 */
+		if (dev_WARN_ONCE(sched->dev, job_credits > sched->credit_limit,
+				  "Jobs may not exceed the credit limit, truncating.\n"))
+			job_credits = sched_job->credits = sched->credit_limit;
+
+		if (job_credits > drm_sched_available_credits(sched)) {
+			complete_all(&entity->entity_idle);
+			break;
+		}
+
+		sched_job = drm_sched_entity_pop_job(entity);
+		if (!sched_job) {
+			/* Top entity is not yet runnable after all */
+			complete_all(&entity->entity_idle);
+			continue;
+		}
+
+		s_fence = sched_job->s_fence;
+		drm_sched_job_begin(sched_job);
+		trace_drm_sched_job_run(sched_job, entity);
+		submitted_credits += job_credits;
+		atomic_add(job_credits, &sched->credit_count);
+
+		fence = sched->ops->run_job(sched_job);
+		drm_sched_fence_scheduled(s_fence, fence);
+
+		if (!IS_ERR_OR_NULL(fence)) {
+			int r;
+
+			/* Drop for original kref_init of the fence */
+			dma_fence_put(fence);
+
+			r = dma_fence_add_callback(fence, &sched_job->cb,
+						   drm_sched_job_done_cb);
+			if (r == -ENOENT)
+				drm_sched_job_done(sched_job, fence->error);
+			else if (r)
+				DRM_DEV_ERROR(sched->dev,
+					      "fence add callback failed (%d)\n", r);
+		} else {
+			drm_sched_job_done(sched_job, IS_ERR(fence) ?
+						      PTR_ERR(fence) : 0);
+		}
 
-	sched_job = drm_sched_entity_pop_job(entity);
-	if (!sched_job) {
 		complete_all(&entity->entity_idle);
-		drm_sched_run_job_queue(sched);
-		return;
 	}
 
-	s_fence = sched_job->s_fence;
-
-	atomic_add(sched_job->credits, &sched->credit_count);
-	drm_sched_job_begin(sched_job);
-
-	trace_drm_sched_job_run(sched_job, entity);
-	/*
-	 * The run_job() callback must by definition return a fence whose
-	 * refcount has been incremented for the scheduler already.
-	 */
-	fence = sched->ops->run_job(sched_job);
-	complete_all(&entity->entity_idle);
-	drm_sched_fence_scheduled(s_fence, fence);
-
-	if (!IS_ERR_OR_NULL(fence)) {
-		r = dma_fence_add_callback(fence, &sched_job->cb,
-					   drm_sched_job_done_cb);
-		if (r == -ENOENT)
-			drm_sched_job_done(sched_job, fence->error);
-		else if (r)
-			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
-
-		dma_fence_put(fence);
-	} else {
-		drm_sched_job_done(sched_job, IS_ERR(fence) ?
-				   PTR_ERR(fence) : 0);
-	}
-
-	wake_up(&sched->job_scheduled);
-	drm_sched_run_job_queue(sched);
+	if (submitted_credits)
+		wake_up(&sched->job_scheduled);
 }
 
 static struct workqueue_struct *drm_sched_alloc_wq(const char *name)
diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
index e22f9ff88822..f0afdc0bd417 100644
--- a/drivers/gpu/drm/scheduler/sched_rq.c
+++ b/drivers/gpu/drm/scheduler/sched_rq.c
@@ -197,9 +197,7 @@ void drm_sched_rq_pop_entity(struct drm_sched_entity *entity)
  *
  * Find oldest waiting ready entity.
  *
- * Return an entity if one is found; return an error-pointer (!NULL) if an
- * entity was ready, but the scheduler had insufficient credits to accommodate
- * its job; return NULL, if no ready entity was found.
+ * Return an entity if one is found or NULL if no ready entity was found.
  */
 struct drm_sched_entity *
 drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
@@ -213,14 +211,6 @@ drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
 
 		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
 		if (drm_sched_entity_is_ready(entity)) {
-			/* If we can't queue yet, preserve the current entity in
-			 * terms of fairness.
-			 */
-			if (!drm_sched_can_queue(sched, entity)) {
-				spin_unlock(&rq->lock);
-				return ERR_PTR(-ENOSPC);
-			}
-
 			reinit_completion(&entity->entity_idle);
 			break;
 		}
-- 
2.48.0

