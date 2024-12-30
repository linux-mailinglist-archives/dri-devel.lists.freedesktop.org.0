Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8029FE933
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 17:53:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC22C10E541;
	Mon, 30 Dec 2024 16:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="a30GCqFP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A174510E53D
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 16:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iBD/wk4CmejBhKyFmyJET9X/tPPqndGE3JuAX26IoAE=; b=a30GCqFPCwJyHNP2wDaYQ5p7GW
 JCreQ0UsPyVdEjzJT0tHSV2yO+qiuZTWIjpNcXGEF9rGiWt2stlelfIELFHyI+9zD0vtTv4nYM1ba
 aD38Qw7yeNVtyqzCI3S61gJRY9v19sN1uZkkLktLJomd1nZAEAdB1hG6JiwQAg5EDf4336kv7KiG8
 Ni2+5tybc35irMjFsoMV//dxzIj6CLR1+IPaY4OpFgk+uvlhriI3sudVTFQ97thQfBixo0piJPh8A
 c6sP1M6RZpZ6iz+HFYW9N0zv2yYtOQtrywfXwi5KLyovqGgfG3dcps7my00uVtU6mYc+pELYWrtyC
 nu6xy5/A==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tSJ0z-009Zwu-Sp; Mon, 30 Dec 2024 17:53:13 +0100
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [RFC 14/14] drm/sched: Resolve all job dependencies in one go
Date: Mon, 30 Dec 2024 16:52:59 +0000
Message-ID: <20241230165259.95855-15-tursulin@igalia.com>
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

Instead of maintaining the dependencies in an xarray and then handling
them one by one every time the scheduler picks the same entity for
execution (requiring potentially multiple worker invocations for a job
to actually get submitted), lets maintain them in a dma_fence_array and
allow the worker to resolved them in one go.

The slightly increased cost of dma_fence_merge_unwrap() when adding
many dependencies (which is not a typical case as far as I can see) is
hopefully annulled by reduced latency on the submission path.

On the implementation side we allocate two more fence context numbers
associated with each entity. One for the job dependency array and
another for the entity cleanup path (seqnos are shared with the job).

On the entity cleanup path we create an second dma-fence-array so we
can add a single callback per job, which also handles all dependencies
at once.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 101 +++++++++++++++-------
 drivers/gpu/drm/scheduler/sched_main.c   | 104 ++++++++++++-----------
 include/drm/gpu_scheduler.h              |  14 +--
 3 files changed, 126 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index dc5105ca8381..6c7325719d75 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -21,6 +21,8 @@
  *
  */
 
+#include <linux/dma-fence.h>
+#include <linux/dma-fence-array.h>
 #include <linux/kthread.h>
 #include <linux/slab.h>
 #include <linux/completion.h>
@@ -92,7 +94,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 	spsc_queue_init(&entity->job_queue);
 
 	atomic_set(&entity->fence_seq, 0);
-	entity->fence_context = dma_fence_context_alloc(2);
+	entity->fence_context = dma_fence_context_alloc(4);
 
 	return 0;
 }
@@ -183,39 +185,78 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
 {
 	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
 						 finish_cb);
-	unsigned long index;
 
 	dma_fence_put(f);
 
-	/* Wait for all dependencies to avoid data corruptions */
-	xa_for_each(&job->dependencies, index, f) {
-		struct drm_sched_fence *s_fence = to_drm_sched_fence(f);
-
-		if (s_fence && f == &s_fence->scheduled) {
-			/* The dependencies array had a reference on the scheduled
-			 * fence, and the finished fence refcount might have
-			 * dropped to zero. Use dma_fence_get_rcu() so we get
-			 * a NULL fence in that case.
+	/* Wait for all dependencies to avoid data corruption */
+	if (!dma_fence_add_callback(job->deps_finished, &job->finish_cb,
+				    drm_sched_entity_kill_jobs_cb))
+		return;
+
+	INIT_WORK(&job->work, drm_sched_entity_kill_jobs_work);
+	schedule_work(&job->work);
+}
+
+static struct dma_fence *job_deps_finished(struct drm_sched_job *job)
+{
+	struct dma_fence_array *array;
+	unsigned int i, j, num_fences;
+	struct dma_fence **fences;
+
+	if (job->deps) {
+		array = to_dma_fence_array(job->deps);
+
+		if (array)
+			num_fences = array->num_fences;
+		else
+			num_fences = 1;
+	} else {
+			num_fences = 0;
+	}
+
+	if (!num_fences)
+		return dma_fence_get_stub();
+
+	fences = kmalloc_array(num_fences, sizeof(*fences), GFP_KERNEL);
+	if (!fences)
+		return NULL;
+
+	if (num_fences == 1)
+		fences[0] = job->deps;
+	else
+		memcpy(fences, array->fences, num_fences * sizeof(*fences));
+
+	for (i = 0, j = 0; i < num_fences; i++) {
+		struct dma_fence *fence = dma_fence_get(fences[i]);
+		struct drm_sched_fence *s_fence;
+
+		s_fence = to_drm_sched_fence(fence);
+		if (s_fence && fence == &s_fence->scheduled) {
+			/*
+			 * The dependencies array had a reference on the
+			 * scheduled fence, and the finished fence refcount
+			 * might have dropped to zero. Use dma_fence_get_rcu()
+			 * so we get a NULL fence in that case.
 			 */
-			f = dma_fence_get_rcu(&s_fence->finished);
+			fence = dma_fence_get_rcu(&s_fence->finished);
 
-			/* Now that we have a reference on the finished fence,
+			/*
+			 * Now that we have a reference on the finished fence,
 			 * we can release the reference the dependencies array
 			 * had on the scheduled fence.
 			 */
 			dma_fence_put(&s_fence->scheduled);
 		}
 
-		xa_erase(&job->dependencies, index);
-		if (f && !dma_fence_add_callback(f, &job->finish_cb,
-						 drm_sched_entity_kill_jobs_cb))
-			return;
-
-		dma_fence_put(f);
+		if (fence)
+			fences[j++] = fence;
 	}
 
-	INIT_WORK(&job->work, drm_sched_entity_kill_jobs_work);
-	schedule_work(&job->work);
+	array = dma_fence_array_create(j, fences,
+				       job->entity->fence_context + 3, 1,
+				       false);
+
+	return array ? &array->base : NULL;
 }
 
 /* Remove the entity from the scheduler and kill all pending jobs */
@@ -242,6 +283,11 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
 		struct drm_sched_fence *s_fence = job->s_fence;
 
 		dma_fence_get(&s_fence->finished);
+
+		job->deps_finished = job_deps_finished(job);
+		if (WARN_ON_ONCE(!job->deps_finished))
+			continue;
+
 		if (!prev || dma_fence_add_callback(prev, &job->finish_cb,
 					   drm_sched_entity_kill_jobs_cb))
 			drm_sched_entity_kill_jobs_cb(NULL, &job->finish_cb);
@@ -435,17 +481,8 @@ static struct dma_fence *
 drm_sched_job_dependency(struct drm_sched_job *job,
 			 struct drm_sched_entity *entity)
 {
-	struct dma_fence *f;
-
-	/* We keep the fence around, so we can iterate over all dependencies
-	 * in drm_sched_entity_kill_jobs_cb() to ensure all deps are signaled
-	 * before killing the job.
-	 */
-	f = xa_load(&job->dependencies, job->last_dependency);
-	if (f) {
-		job->last_dependency++;
-		return dma_fence_get(f);
-	}
+	if (job->deps && !dma_fence_is_signaled(job->deps))
+		return dma_fence_get(job->deps);
 
 	if (job->sched->ops->prepare_job)
 		return job->sched->ops->prepare_job(job, entity);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 67bf0bec3309..869d831e94aa 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -69,6 +69,8 @@
 #include <linux/wait.h>
 #include <linux/sched.h>
 #include <linux/completion.h>
+#include <linux/dma-fence-array.h>
+#include <linux/dma-fence-unwrap.h>
 #include <linux/dma-resv.h>
 #include <uapi/linux/sched/types.h>
 
@@ -564,8 +566,6 @@ int drm_sched_job_init(struct drm_sched_job *job,
 
 	INIT_LIST_HEAD(&job->list);
 
-	xa_init_flags(&job->dependencies, XA_FLAGS_ALLOC);
-
 	return 0;
 }
 EXPORT_SYMBOL(drm_sched_job_init);
@@ -614,46 +614,34 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
 				 struct dma_fence *fence)
 {
 	struct drm_sched_entity *entity = job->entity;
-	struct dma_fence *entry;
-	unsigned long index;
-	u32 id = 0;
-	int ret;
+	struct dma_fence *deps;
+	int ret = 0;
 
 	if (!fence)
 		return 0;
 
-	if (fence->context == entity->fence_context ||
-	    fence->context == entity->fence_context + 1) {
+	if (fence->context >= entity->fence_context &&
+	    fence->context <= entity->fence_context + 3) {
 		/*
 		 * Fence is a scheduled/finished fence from a job
 		 * which belongs to the same entity, we can ignore
 		 * fences from ourself
 		 */
-		dma_fence_put(fence);
-		return 0;
+		goto out_put;
 	}
 
-	/* Deduplicate if we already depend on a fence from the same context.
-	 * This lets the size of the array of deps scale with the number of
-	 * engines involved, rather than the number of BOs.
-	 */
-	xa_for_each(&job->dependencies, index, entry) {
-		if (entry->context != fence->context)
-			continue;
-
-		if (dma_fence_is_later(fence, entry)) {
-			dma_fence_put(entry);
-			xa_store(&job->dependencies, index, fence, GFP_KERNEL);
-		} else {
-			dma_fence_put(fence);
-		}
-		return 0;
+	deps = dma_fence_unwrap_merge_context(entity->fence_context + 2,
+					      job->deps, fence);
+	if (!deps) {
+		ret = -ENOMEM;
+		goto out_put;
 	}
 
-	ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, GFP_KERNEL);
-	if (ret != 0)
-		dma_fence_put(fence);
+	dma_fence_put(job->deps);
+	job->deps = deps;
 
+out_put:
+	dma_fence_put(fence);
 	return ret;
 }
 EXPORT_SYMBOL(drm_sched_job_add_dependency);
@@ -745,26 +733,49 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
 }
 EXPORT_SYMBOL(drm_sched_job_add_implicit_dependencies);
 
+static bool
+can_replace_fence(struct drm_gpu_scheduler *sched,
+		  struct drm_sched_fence *s_fence,
+		  struct dma_fence *fence)
+{
+	if (fence->error || !s_fence || s_fence->sched != sched ||
+	    test_bit(DRM_SCHED_FENCE_DONT_PIPELINE, &fence->flags))
+		return false;
+
+	return true;
+}
+
 void drm_sched_job_prepare_dependecies(struct drm_sched_job *job)
 {
 	struct drm_gpu_scheduler *sched = job->sched;
+	struct drm_sched_fence *s_fence;
+	struct dma_fence_array *array;
 	struct dma_fence *fence;
-	unsigned long index;
 
-	xa_for_each(&job->dependencies, index, fence) {
-		struct drm_sched_fence *s_fence = to_drm_sched_fence(fence);
+	if (!job->deps)
+		return;
 
-		if (fence->error || !s_fence || s_fence->sched != sched ||
-		    test_bit(DRM_SCHED_FENCE_DONT_PIPELINE, &fence->flags))
-			continue;
+	array = to_dma_fence_array(job->deps);
+	if (!array) {
+		fence = job->deps;
+		s_fence = to_drm_sched_fence(fence);
+		if (can_replace_fence(sched, s_fence, fence)) {
+			job->deps = dma_fence_get(&s_fence->scheduled);
+			dma_fence_put(fence);
+		}
+	} else {
+		unsigned i;
 
-		/*
-		 * Fence is from the same scheduler, only need to wait for
-		 * it to be scheduled.
-		 */
-		xa_store(&job->dependencies, index,
-			 dma_fence_get(&s_fence->scheduled), GFP_KERNEL);
-		dma_fence_put(fence);
+		for (i = 0; i < array->num_fences; i++) {
+			fence = array->fences[i];
+			s_fence = to_drm_sched_fence(fence);
+			if (can_replace_fence(sched, s_fence, fence)) {
+				array->fences[i] =
+					dma_fence_get(&s_fence->scheduled);
+				dma_fence_put(fence);
+			}
+		}
+		array->base.seqno = job->s_fence->scheduled.seqno;
 	}
 }
 
@@ -783,24 +794,17 @@ void drm_sched_job_prepare_dependecies(struct drm_sched_job *job)
  */
 void drm_sched_job_cleanup(struct drm_sched_job *job)
 {
-	struct dma_fence *fence;
-	unsigned long index;
-
 	if (kref_read(&job->s_fence->finished.refcount)) {
 		/* drm_sched_job_arm() has been called */
 		dma_fence_put(&job->s_fence->finished);
+		dma_fence_put(job->deps);
+		dma_fence_put(job->deps_finished);
 	} else {
 		/* aborted job before committing to run it */
 		drm_sched_fence_free(job->s_fence);
 	}
 
 	job->s_fence = NULL;
-
-	xa_for_each(&job->dependencies, index, fence) {
-		dma_fence_put(fence);
-	}
-	xa_destroy(&job->dependencies);
-
 }
 EXPORT_SYMBOL(drm_sched_job_cleanup);
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 7b29f45aa1da..525f1c1dd9c9 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -27,7 +27,6 @@
 #include <drm/spsc_queue.h>
 #include <linux/dma-fence.h>
 #include <linux/completion.h>
-#include <linux/xarray.h>
 #include <linux/workqueue.h>
 
 #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
@@ -360,17 +359,10 @@ struct drm_sched_job {
 	enum drm_sched_priority		s_priority;
 	struct drm_sched_entity         *entity;
 	struct dma_fence_cb		cb;
-	/**
-	 * @dependencies:
-	 *
-	 * Contains the dependencies as struct dma_fence for this job, see
-	 * drm_sched_job_add_dependency() and
-	 * drm_sched_job_add_implicit_dependencies().
-	 */
-	struct xarray			dependencies;
 
-	/** @last_dependency: tracks @dependencies as they signal */
-	unsigned long			last_dependency;
+	struct dma_fence                stub_fence;
+	struct dma_fence                *deps;
+	struct dma_fence                *deps_finished;
 
 	/**
 	 * @submit_ts:
-- 
2.47.1

