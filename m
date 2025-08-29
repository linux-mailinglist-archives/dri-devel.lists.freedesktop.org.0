Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D92B3C26D
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 20:31:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95CDF10EC2E;
	Fri, 29 Aug 2025 18:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NFz8NKrL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A4010EC29;
 Fri, 29 Aug 2025 18:31:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2747E60142;
 Fri, 29 Aug 2025 18:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392BBC4CEF0;
 Fri, 29 Aug 2025 18:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756492271;
 bh=tyqs0cYFzl3/uScjz+bnC/nHz4Zbr0XXBB0zC5nt9u4=;
 h=From:To:Cc:Subject:Date:From;
 b=NFz8NKrLoGKO+m/Wnx15S7oUV4+2JAuYFq/dkK3nLmZtSeosEpofGuplxKQqva8+l
 tbvezIO3iBqnQTfc82c1u7x1SvuIawu0nN5fuC3Fkqy53O+yVLJHVWE32bjjOHYcZR
 2rKMZqn1/h2ghLcmAmEPRAmAdPsZkMhkEeO+etKBH4y/Nwmr2zm2afBecxCPRsVzsf
 e3wdLlI33euqwrDyWC2ULlK/GoYBf9XtaGdxNVV/vhIHTwzvGE9IgN2m/Adn1QIp75
 mx8vvyZOOoKYMCdde6nEk+l5b+OrX8Va5U++d+iM96ZJt2W+IimKgv8mbKNn6WiQM/
 k67RFi4uuON1A==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Philipp Stanner <phasta@kernel.org>
Subject: [PATCH] Revert "drm/nouveau: Remove waitque for sched teardown"
Date: Fri, 29 Aug 2025 20:30:45 +0200
Message-ID: <20250829183044.213380-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
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

This reverts:

commit bead88002227 ("drm/nouveau: Remove waitque for sched teardown")
commit 5f46f5c7af8c ("drm/nouveau: Add new callback for scheduler teardown")
commit 89b2675198ab ("drm/nouveau: Make fence container helper usable driver-wide")

from the drm/sched teardown leak fix series:

https://lore.kernel.org/dri-devel/20250710125412.128476-2-phasta@kernel.org/

The aforementioned series removed a blocking waitqueue from
nouveau_sched_fini(). It was mistakenly assumed that this waitqueue only
prevents jobs from leaking, which the series fixed.

The waitqueue, however, also guarantees that all VM_BIND related jobs
are finished in order, cleaning up mappings in the GPU's MMU. These jobs
must be executed sequentially. Without the waitqueue, this is no longer
guaranteed, because entity and scheduler teardown can race with each
other.

Revert all patches related to the waitqueue removal.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 20 +++++++++++++-------
 drivers/gpu/drm/nouveau/nouveau_fence.h |  6 ------
 drivers/gpu/drm/nouveau/nouveau_sched.c | 20 +++++++++++++-------
 drivers/gpu/drm/nouveau/nouveau_sched.h |  9 ++++++---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c  |  8 ++++----
 5 files changed, 36 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 9f345a008717..e4b8ddbb2b92 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -38,6 +38,12 @@
 static const struct dma_fence_ops nouveau_fence_ops_uevent;
 static const struct dma_fence_ops nouveau_fence_ops_legacy;
 
+static inline struct nouveau_fence *
+from_fence(struct dma_fence *fence)
+{
+	return container_of(fence, struct nouveau_fence, base);
+}
+
 static inline struct nouveau_fence_chan *
 nouveau_fctx(struct nouveau_fence *fence)
 {
@@ -71,7 +77,7 @@ nouveau_local_fence(struct dma_fence *fence, struct nouveau_drm *drm)
 	    fence->ops != &nouveau_fence_ops_uevent)
 		return NULL;
 
-	return to_nouveau_fence(fence);
+	return from_fence(fence);
 }
 
 void
@@ -277,7 +283,7 @@ nouveau_fence_done(struct nouveau_fence *fence)
 static long
 nouveau_fence_wait_legacy(struct dma_fence *f, bool intr, long wait)
 {
-	struct nouveau_fence *fence = to_nouveau_fence(f);
+	struct nouveau_fence *fence = from_fence(f);
 	unsigned long sleep_time = NSEC_PER_MSEC / 1000;
 	unsigned long t = jiffies, timeout = t + wait;
 
@@ -457,7 +463,7 @@ static const char *nouveau_fence_get_get_driver_name(struct dma_fence *fence)
 
 static const char *nouveau_fence_get_timeline_name(struct dma_fence *f)
 {
-	struct nouveau_fence *fence = to_nouveau_fence(f);
+	struct nouveau_fence *fence = from_fence(f);
 	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
 
 	return !fctx->dead ? fctx->name : "dead channel";
@@ -471,7 +477,7 @@ static const char *nouveau_fence_get_timeline_name(struct dma_fence *f)
  */
 static bool nouveau_fence_is_signaled(struct dma_fence *f)
 {
-	struct nouveau_fence *fence = to_nouveau_fence(f);
+	struct nouveau_fence *fence = from_fence(f);
 	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
 	struct nouveau_channel *chan;
 	bool ret = false;
@@ -487,7 +493,7 @@ static bool nouveau_fence_is_signaled(struct dma_fence *f)
 
 static bool nouveau_fence_no_signaling(struct dma_fence *f)
 {
-	struct nouveau_fence *fence = to_nouveau_fence(f);
+	struct nouveau_fence *fence = from_fence(f);
 
 	/*
 	 * caller should have a reference on the fence,
@@ -512,7 +518,7 @@ static bool nouveau_fence_no_signaling(struct dma_fence *f)
 
 static void nouveau_fence_release(struct dma_fence *f)
 {
-	struct nouveau_fence *fence = to_nouveau_fence(f);
+	struct nouveau_fence *fence = from_fence(f);
 	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
 
 	kref_put(&fctx->fence_ref, nouveau_fence_context_put);
@@ -530,7 +536,7 @@ static const struct dma_fence_ops nouveau_fence_ops_legacy = {
 
 static bool nouveau_fence_enable_signaling(struct dma_fence *f)
 {
-	struct nouveau_fence *fence = to_nouveau_fence(f);
+	struct nouveau_fence *fence = from_fence(f);
 	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
 	bool ret;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
index 9957a919bd38..51bb0d9032a4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -17,12 +17,6 @@ struct nouveau_fence {
 	unsigned long timeout;
 };
 
-static inline struct nouveau_fence *
-to_nouveau_fence(struct dma_fence *fence)
-{
-	return container_of(fence, struct nouveau_fence, base);
-}
-
 int  nouveau_fence_create(struct nouveau_fence **, struct nouveau_channel *);
 int  nouveau_fence_new(struct nouveau_fence **, struct nouveau_channel *);
 void nouveau_fence_unref(struct nouveau_fence **);
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 0cc0bc9f9952..387579b17181 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -122,9 +122,11 @@ nouveau_job_done(struct nouveau_job *job)
 {
 	struct nouveau_sched *sched = job->sched;
 
-	spin_lock(&sched->job_list.lock);
+	spin_lock(&sched->job.list.lock);
 	list_del(&job->entry);
-	spin_unlock(&sched->job_list.lock);
+	spin_unlock(&sched->job.list.lock);
+
+	wake_up(&sched->job.wq);
 }
 
 void
@@ -305,9 +307,9 @@ nouveau_job_submit(struct nouveau_job *job)
 	}
 
 	/* Submit was successful; add the job to the schedulers job list. */
-	spin_lock(&sched->job_list.lock);
-	list_add(&job->entry, &sched->job_list.head);
-	spin_unlock(&sched->job_list.lock);
+	spin_lock(&sched->job.list.lock);
+	list_add(&job->entry, &sched->job.list.head);
+	spin_unlock(&sched->job.list.lock);
 
 	drm_sched_job_arm(&job->base);
 	job->done_fence = dma_fence_get(&job->base.s_fence->finished);
@@ -458,8 +460,9 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 		goto fail_sched;
 
 	mutex_init(&sched->mutex);
-	spin_lock_init(&sched->job_list.lock);
-	INIT_LIST_HEAD(&sched->job_list.head);
+	spin_lock_init(&sched->job.list.lock);
+	INIT_LIST_HEAD(&sched->job.list.head);
+	init_waitqueue_head(&sched->job.wq);
 
 	return 0;
 
@@ -499,6 +502,9 @@ nouveau_sched_fini(struct nouveau_sched *sched)
 	struct drm_gpu_scheduler *drm_sched = &sched->base;
 	struct drm_sched_entity *entity = &sched->entity;
 
+	rmb(); /* for list_empty to work without lock */
+	wait_event(sched->job.wq, list_empty(&sched->job.list.head));
+
 	drm_sched_entity_fini(entity);
 	drm_sched_fini(drm_sched);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h b/drivers/gpu/drm/nouveau/nouveau_sched.h
index b98c3f0bef30..20cd1da8db73 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.h
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
@@ -103,9 +103,12 @@ struct nouveau_sched {
 	struct mutex mutex;
 
 	struct {
-		struct list_head head;
-		spinlock_t lock;
-	} job_list;
+		struct {
+			struct list_head head;
+			spinlock_t lock;
+		} list;
+		struct wait_queue_head wq;
+	} job;
 };
 
 int nouveau_sched_create(struct nouveau_sched **psched, struct nouveau_drm *drm,
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index d94a85509176..79eefdfd08a2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1019,8 +1019,8 @@ bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
 	u64 end = addr + range;
 
 again:
-	spin_lock(&sched->job_list.lock);
-	list_for_each_entry(__job, &sched->job_list.head, entry) {
+	spin_lock(&sched->job.list.lock);
+	list_for_each_entry(__job, &sched->job.list.head, entry) {
 		struct nouveau_uvmm_bind_job *bind_job = to_uvmm_bind_job(__job);
 
 		list_for_each_op(op, &bind_job->ops) {
@@ -1030,7 +1030,7 @@ bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
 
 				if (!(end <= op_addr || addr >= op_end)) {
 					nouveau_uvmm_bind_job_get(bind_job);
-					spin_unlock(&sched->job_list.lock);
+					spin_unlock(&sched->job.list.lock);
 					wait_for_completion(&bind_job->complete);
 					nouveau_uvmm_bind_job_put(bind_job);
 					goto again;
@@ -1038,7 +1038,7 @@ bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
 			}
 		}
 	}
-	spin_unlock(&sched->job_list.lock);
+	spin_unlock(&sched->job.list.lock);
 }
 
 static int
-- 
2.49.0

