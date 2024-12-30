Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 068239FE930
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 17:53:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E7A10E53C;
	Mon, 30 Dec 2024 16:53:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="APZKJGtF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC14110E527
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 16:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ww5seEkRAR8bzEkdNm61yKYPAq+nK+Ts6tqpjG72nAg=; b=APZKJGtFxM1gWjQEEH3VYlpvLV
 alHYGPKZ5XB8TfhxXskobWXXGmOD1W8bj8WZaf+p6uHGmHq46B5I+AzPhJqYYSfJBye2V/OjqJ3wK
 BzhjkGkwzeyLRsvLgQEyg3YZHA+1XtGrpXUWZRqCISE1xUKgNZi/GuwembY7R9hR83Qo3ubXgbZ3p
 xZugj75CjyHT/Kg6ZtszQIv+ej6RnC4iP3CElm5pzfJAw9/HjUCjNG/VN8K4cepSdYp1SDG3U3VL1
 t0zRrsAQXOTKHtVbCsJ1ovkgyrLh77m3PF49wmi7HxBLbQtJcpYrBVNNg0wP+KrvzAzD0vpY6vP6H
 9u8uWy+w==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tSJ0x-009ZwL-04; Mon, 30 Dec 2024 17:53:11 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [RFC 10/14] drm/sched: Queue all free credits in one worker invocation
Date: Mon, 30 Dec 2024 16:52:55 +0000
Message-ID: <20241230165259.95855-11-tursulin@igalia.com>
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

There is no reason to queue just a single job if scheduler can take more
and re-queue the worker to queue more. We can simply feed the hardware
with as much as it can take in one go and hopefully win some latency.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 112 +++++++++++--------------
 drivers/gpu/drm/scheduler/sched_rq.c   |  19 ++---
 include/drm/gpu_scheduler.h            |   3 -
 3 files changed, 58 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 4ba9ed27a8a6..6f4ea8a2ca17 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -98,33 +98,6 @@ static u32 drm_sched_available_credits(struct drm_gpu_scheduler *sched)
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
-	s_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
-	if (!s_job)
-		return false;
-
-	/* If a job exceeds the credit limit, truncate it to the credit limit
-	 * itself to guarantee forward progress.
-	 */
-	if (drm_WARN(sched, s_job->credits > sched->credit_limit,
-		     "Jobs may not exceed the credit limit, truncate.\n"))
-		s_job->credits = sched->credit_limit;
-
-	return drm_sched_available_credits(sched) >= s_job->credits;
-}
-
 /**
  * drm_sched_run_job_queue - enqueue run-job work
  * @sched: scheduler instance
@@ -174,6 +147,7 @@ static void drm_sched_job_done(struct drm_sched_job *s_job, int result)
 
 	atomic_sub(s_job->credits, &sched->credit_count);
 	atomic_dec(sched->score);
+	drm_sched_run_job_queue(sched);
 
 	trace_drm_sched_process_job(s_fence);
 
@@ -941,7 +915,6 @@ static void drm_sched_free_job_work(struct work_struct *w)
 		sched->ops->free_job(job);
 
 	drm_sched_run_free_queue(sched);
-	drm_sched_run_job_queue(sched);
 }
 
 /**
@@ -953,54 +926,71 @@ static void drm_sched_run_job_work(struct work_struct *w)
 {
 	struct drm_gpu_scheduler *sched =
 		container_of(w, struct drm_gpu_scheduler, work_run_job);
+	u32 job_credits, submitted_credits = 0;
 	struct drm_sched_entity *entity;
-	struct dma_fence *fence;
-	struct drm_sched_fence *s_fence;
 	struct drm_sched_job *sched_job;
-	int r;
+	struct dma_fence *fence;
 
 	if (READ_ONCE(sched->pause_submit))
 		return;
 
-	/* Find entity with a ready job */
-	entity = drm_sched_rq_select_entity(sched, sched->rq);
-	if (IS_ERR_OR_NULL(entity))
-		return;	/* No more work */
+	for (;;) {
+		/* Find entity with a ready job */
+		entity = drm_sched_rq_select_entity(sched, sched->rq);
+		if (!entity)
+			break;	/* No more work */
 
-	sched_job = drm_sched_entity_pop_job(entity);
-	if (!sched_job) {
+		/*
+		 * If a job exceeds the credit limit truncate it to guarantee
+		 * forward progress.
+		 */
+		sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
+		job_credits = sched_job->credits;
+		if (drm_WARN_ONCE(sched, job_credits > sched->credit_limit,
+				  "Jobs may not exceed the credit limit, truncating.\n"))
+			job_credits = sched_job->credits = sched->credit_limit;
+
+		if (job_credits > drm_sched_available_credits(sched)) {
+			complete_all(&entity->entity_idle);
+			break;
+		}
+
+		sched_job = drm_sched_entity_pop_job(entity);
 		complete_all(&entity->entity_idle);
-		drm_sched_run_job_queue(sched);
-		return;
-	}
+		if (!sched_job) {
+			/* Top entity is not yet runnable after all */
+			continue;
+		}
 
-	s_fence = sched_job->s_fence;
+		drm_sched_job_begin(sched_job);
+		trace_drm_run_job(sched_job, entity);
+		submitted_credits += job_credits;
+		atomic_add(job_credits, &sched->credit_count);
 
-	atomic_add(sched_job->credits, &sched->credit_count);
-	drm_sched_job_begin(sched_job);
+		fence = sched->ops->run_job(sched_job);
+		drm_sched_fence_scheduled(sched_job->s_fence, fence);
 
-	trace_drm_run_job(sched_job, entity);
-	fence = sched->ops->run_job(sched_job);
-	complete_all(&entity->entity_idle);
-	drm_sched_fence_scheduled(s_fence, fence);
+		if (!IS_ERR_OR_NULL(fence)) {
+			int r;
 
-	if (!IS_ERR_OR_NULL(fence)) {
-		/* Drop for original kref_init of the fence */
-		dma_fence_put(fence);
+			/* Drop for original kref_init of the fence */
+			dma_fence_put(fence);
 
-		r = dma_fence_add_callback(fence, &sched_job->cb,
-					   drm_sched_job_done_cb);
-		if (r == -ENOENT)
-			drm_sched_job_done(sched_job, fence->error);
-		else if (r)
-			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
-	} else {
-		drm_sched_job_done(sched_job, IS_ERR(fence) ?
-				   PTR_ERR(fence) : 0);
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
 	}
 
-	wake_up(&sched->job_scheduled);
-	drm_sched_run_job_queue(sched);
+	if (submitted_credits)
+		wake_up(&sched->job_scheduled);
 }
 
 /**
diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/scheduler/sched_rq.c
index 0b7a2b8b48db..1a454384ab25 100644
--- a/drivers/gpu/drm/scheduler/sched_rq.c
+++ b/drivers/gpu/drm/scheduler/sched_rq.c
@@ -156,9 +156,7 @@ void drm_sched_rq_pop_entity(struct drm_sched_rq *rq,
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
@@ -170,16 +168,13 @@ drm_sched_rq_select_entity(struct drm_gpu_scheduler *sched,
 	spin_lock(&rq->lock);
 	for (rb = rb_first_cached(&rq->rb_tree_root); rb; rb = rb_next(rb)) {
 		entity = rb_entry(rb, struct drm_sched_entity, rb_tree_node);
-		if (drm_sched_entity_is_ready(entity)) {
-			if (!drm_sched_can_queue(sched, entity)) {
-				entity = ERR_PTR(-ENOSPC);
-				break;
-			}
-
-			reinit_completion(&entity->entity_idle);
-			break;
+		if (!drm_sched_entity_is_ready(entity)) {
+			entity = NULL;
+			continue;
 		}
-		entity = NULL;
+
+		reinit_completion(&entity->entity_idle);
+		break;
 	}
 	spin_unlock(&rq->lock);
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 93f6fcfe3ba0..85f3a0d5a7be 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -544,9 +544,6 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 
 void drm_sched_fini(struct drm_gpu_scheduler *sched);
 
-bool drm_sched_can_queue(struct drm_gpu_scheduler *sched,
-			 struct drm_sched_entity *entity);
-
 int drm_sched_job_init(struct drm_sched_job *job,
 		       struct drm_sched_entity *entity,
 		       u32 credits, void *owner);
-- 
2.47.1

