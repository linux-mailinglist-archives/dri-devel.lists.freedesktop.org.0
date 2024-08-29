Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A8F964CAE
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 19:20:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32F310E744;
	Thu, 29 Aug 2024 17:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="eQQeWTbv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 435 seconds by postgrey-1.36 at gabe;
 Thu, 29 Aug 2024 17:19:57 UTC
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08EF110E744
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 17:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1724951560;
 bh=MHwM6zZiiHOalG5B9MZ/EqSqCxscbzlSDuIOEqpvDa0=;
 h=From:To:Cc:Subject:Date:From;
 b=eQQeWTbv4GkteAOa/kNecyBkcJyiUxo6j2MkCJhcyARPE4LrNa7B6Y6PVmIkwv29o
 EnmvOdHhxfwuA78t0+YWpDO5mQBk9S81ImqcXuOgzNo15m8zUNbzj0PCMuh45M/3qh
 4cVEmZ0dIs6qUPT2MYZzW63WmNLvD/Foa2R/RuyphgEmfn4lYbFvUVMvuVzQKaxAXo
 +a8hWQN4uHvq+yGSI9dxn0HdDLuqnLH+KH/DwGis1zp8ni5FsOj4oCO3/r3ELxsMo6
 r2oRpkIS7Ynyx5fVAej+mR7vw2FdkHmMcPJjXsOVRfCo0zNH+HLGye3swm3r8BlMon
 m23ecGsv3veCQ==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7F22417E0E8E;
 Thu, 29 Aug 2024 19:12:40 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 kernel@collabora.com, Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>
Subject: [RFC PATCH] drm/sched: Fix a UAF on drm_sched_fence::sched
Date: Thu, 29 Aug 2024 19:12:38 +0200
Message-ID: <20240829171238.609481-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.46.0
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

dma_fence objects created by an entity might outlive the
drm_gpu_scheduler this entity was bound to if those fences are retained
by other other objects, like a dma_buf resv. This means that
drm_sched_fence::sched might be invalid when the resv is walked, which
in turn leads to a UAF when dma_fence_ops::get_timeline_name() is called.

This probably went unnoticed so far, because the drm_gpu_scheduler had
the lifetime of the drm_device, so, unless you were removing the device,
there were no reasons for the scheduler to be gone before its fences.

With the introduction of a new model where each entity has its own
drm_gpu_scheduler instance, this situation is likely to happen every time
a GPU context is destroyed and some of its fences remain attached to
dma_buf objects still owned by other drivers/processes.

In order to make drm_sched_fence_get_timeline_name() safe, we need to
copy the scheduler name into our own refcounted object that's only
destroyed when both the scheduler and all its fences are gone.

The fact drm_sched_fence might have a reference to the drm_gpu_scheduler
even after it's been released is worrisome though, but I'd rather
discuss that with everyone than come up with a solution that's likely
to end up being rejected.

Note that the bug was found while repeatedly reading dma_buf's debugfs
file, which, at some point, calls dma_resv_describe() on a resv that
contains signalled fences coming from a destroyed GPU context.
AFAIK, there's nothing invalid there.

Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/scheduler/sched_fence.c |  8 +++-
 drivers/gpu/drm/scheduler/sched_main.c  | 18 ++++++++-
 include/drm/gpu_scheduler.h             | 52 +++++++++++++++++++++++++
 3 files changed, 75 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 0f35f009b9d3..efa2a71d98eb 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -90,7 +90,7 @@ static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
 static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
 {
 	struct drm_sched_fence *fence = to_drm_sched_fence(f);
-	return (const char *)fence->sched->name;
+	return (const char *)fence->timeline->name;
 }
 
 static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
@@ -112,8 +112,10 @@ static void drm_sched_fence_free_rcu(struct rcu_head *rcu)
  */
 void drm_sched_fence_free(struct drm_sched_fence *fence)
 {
+	drm_sched_fence_timeline_put(fence->timeline);
+
 	/* This function should not be called if the fence has been initialized. */
-	if (!WARN_ON_ONCE(fence->sched))
+	if (!WARN_ON_ONCE(fence->timeline))
 		kmem_cache_free(sched_fence_slab, fence);
 }
 
@@ -224,6 +226,8 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
 	unsigned seq;
 
 	fence->sched = entity->rq->sched;
+	fence->timeline = fence->sched->fence_timeline;
+	drm_sched_fence_timeline_get(fence->timeline);
 	seq = atomic_inc_return(&entity->fence_seq);
 	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
 		       &fence->lock, entity->fence_context, seq);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 7e90c9f95611..1e31a9c8ce15 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1288,10 +1288,21 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 		sched->own_submit_wq = true;
 	}
 
+	sched->fence_timeline = kzalloc(sizeof(*sched->fence_timeline), GFP_KERNEL);
+	if (!sched->fence_timeline)
+		goto Out_check_own;
+
+	sched->fence_timeline->name = kasprintf(GFP_KERNEL, "%s", sched->name);
+	if (!sched->fence_timeline->name)
+		goto Out_free_fence_timeline;
+
+	kref_init(&sched->fence_timeline->kref);
+
 	sched->sched_rq = kmalloc_array(num_rqs, sizeof(*sched->sched_rq),
 					GFP_KERNEL | __GFP_ZERO);
 	if (!sched->sched_rq)
-		goto Out_check_own;
+		goto Out_free_fence_timeline;
+
 	sched->num_rqs = num_rqs;
 	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
 		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
@@ -1319,6 +1330,10 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 
 	kfree(sched->sched_rq);
 	sched->sched_rq = NULL;
+Out_free_fence_timeline:
+	if (sched->fence_timeline)
+		kfree(sched->fence_timeline->name);
+	kfree(sched->fence_timeline);
 Out_check_own:
 	if (sched->own_submit_wq)
 		destroy_workqueue(sched->submit_wq);
@@ -1367,6 +1382,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 	sched->ready = false;
 	kfree(sched->sched_rq);
 	sched->sched_rq = NULL;
+	drm_sched_fence_timeline_put(sched->fence_timeline);
 }
 EXPORT_SYMBOL(drm_sched_fini);
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 5acc64954a88..615ca89f77dc 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -261,6 +261,52 @@ struct drm_sched_rq {
 	struct rb_root_cached		rb_tree_root;
 };
 
+/**
+ * struct drm_sched_fence_timeline - Wrapped around the timeline name
+ *
+ * This is needed to cope with the fact dma_fence objects created by
+ * an entity might outlive the drm_gpu_scheduler this entity was bound
+ * to, making drm_sched_fence::sched invalid and leading to a UAF when
+ * dma_fence_ops::get_timeline_name() is called.
+ */
+struct drm_sched_fence_timeline {
+	/** @kref: Reference count of this timeline object. */
+	struct kref			kref;
+
+	/**
+	 * @name: Name of the timeline.
+	 *
+	 * This is currently a copy of drm_gpu_scheduler::name.
+	 */
+	const char			*name;
+};
+
+static inline void
+drm_sched_fence_timeline_release(struct kref *kref)
+{
+	struct drm_sched_fence_timeline *tl =
+		container_of(kref, struct drm_sched_fence_timeline, kref);
+
+	kfree(tl->name);
+	kfree(tl);
+}
+
+static inline void
+drm_sched_fence_timeline_put(struct drm_sched_fence_timeline *tl)
+{
+	if (tl)
+		kref_put(&tl->kref, drm_sched_fence_timeline_release);
+}
+
+static inline struct drm_sched_fence_timeline *
+drm_sched_fence_timeline_get(struct drm_sched_fence_timeline *tl)
+{
+	if (tl)
+		kref_get(&tl->kref);
+
+	return tl;
+}
+
 /**
  * struct drm_sched_fence - fences corresponding to the scheduling of a job.
  */
@@ -289,6 +335,9 @@ struct drm_sched_fence {
 	 */
 	ktime_t				deadline;
 
+        /** @timeline: the timeline this fence belongs to. */
+	struct drm_sched_fence_timeline	*timeline;
+
         /**
          * @parent: the fence returned by &drm_sched_backend_ops.run_job
          * when scheduling the job on hardware. We signal the
@@ -488,6 +537,8 @@ struct drm_sched_backend_ops {
  * @credit_count: the current credit count of this scheduler
  * @timeout: the time after which a job is removed from the scheduler.
  * @name: name of the ring for which this scheduler is being used.
+ * @fence_timeline: fence timeline that will be passed to fences created by
+ *                  and entity that's bound to this scheduler.
  * @num_rqs: Number of run-queues. This is at most DRM_SCHED_PRIORITY_COUNT,
  *           as there's usually one run-queue per priority, but could be less.
  * @sched_rq: An allocated array of run-queues of size @num_rqs;
@@ -521,6 +572,7 @@ struct drm_gpu_scheduler {
 	atomic_t			credit_count;
 	long				timeout;
 	const char			*name;
+	struct drm_sched_fence_timeline	*fence_timeline;
 	u32                             num_rqs;
 	struct drm_sched_rq             **sched_rq;
 	wait_queue_head_t		job_scheduled;
-- 
2.46.0

