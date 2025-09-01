Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 398A3B3DC62
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 10:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC1B10E3A0;
	Mon,  1 Sep 2025 08:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k1nAkyNn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC38810E3A0;
 Mon,  1 Sep 2025 08:31:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A9DC1601D9;
 Mon,  1 Sep 2025 08:31:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D33C4C4CEF0;
 Mon,  1 Sep 2025 08:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756715487;
 bh=KH7Bi0satXiuEt+iUfxg2rFDS/DtKwZ5mSXucRghtVI=;
 h=From:To:Cc:Subject:Date:From;
 b=k1nAkyNnpNEhA8zBalU7njJx6iDL5Q1PvtolTvWHg5EhOZ5QutpNkJAkFwpGPKgGV
 8DHY5gDYTh304lSkrjAHS233RPb+QimDLsV98/1DmA/LH4IYIEJ7OrcHMzMIdXvHjG
 ecnT0/jUVyi2qpIyP+1aJB5dbt7yWCV/0jdHR4dbtQNgYcIjnqWj9gvha0JbpPXOG1
 ZbvD0aefVJnhOQlvZV5dYDLLGsRCpx22tFnN9oRZIQEuiQFZ8lLTtRNOPWmBzBjjI7
 cdQxyFfPP6L7Ryl79Szpg3kus3P7+FlOJmXXlC/BXOr/naGKSDahDCKhFX0F485Wl8
 6N4fNCNip8bpw==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v2] Revert "drm/nouveau: Remove waitque for sched teardown"
Date: Mon,  1 Sep 2025 10:31:08 +0200
Message-ID: <20250901083107.10206-2-phasta@kernel.org>
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

Fixes: bead88002227 ("drm/nouveau: Remove waitque for sched teardown")
Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
Changes in v2:
  - Don't revert commit 89b2675198ab ("drm/nouveau: Make fence container helper usable driver-wide")
  - Add Fixes-tag
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 15 -----------
 drivers/gpu/drm/nouveau/nouveau_fence.h |  1 -
 drivers/gpu/drm/nouveau/nouveau_sched.c | 35 ++++++++++---------------
 drivers/gpu/drm/nouveau/nouveau_sched.h |  9 ++++---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c  |  8 +++---
 5 files changed, 24 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 9f345a008717..869d4335c0f4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -240,21 +240,6 @@ nouveau_fence_emit(struct nouveau_fence *fence)
 	return ret;
 }
 
-void
-nouveau_fence_cancel(struct nouveau_fence *fence)
-{
-	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
-	unsigned long flags;
-
-	spin_lock_irqsave(&fctx->lock, flags);
-	if (!dma_fence_is_signaled_locked(&fence->base)) {
-		dma_fence_set_error(&fence->base, -ECANCELED);
-		if (nouveau_fence_signal(fence))
-			nvif_event_block(&fctx->event);
-	}
-	spin_unlock_irqrestore(&fctx->lock, flags);
-}
-
 bool
 nouveau_fence_done(struct nouveau_fence *fence)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
index 9957a919bd38..183dd43ecfff 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -29,7 +29,6 @@ void nouveau_fence_unref(struct nouveau_fence **);
 
 int  nouveau_fence_emit(struct nouveau_fence *);
 bool nouveau_fence_done(struct nouveau_fence *);
-void nouveau_fence_cancel(struct nouveau_fence *fence);
 int  nouveau_fence_wait(struct nouveau_fence *, bool lazy, bool intr);
 int  nouveau_fence_sync(struct nouveau_bo *, struct nouveau_channel *, bool exclusive, bool intr);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 0cc0bc9f9952..e60f7892f5ce 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -11,7 +11,6 @@
 #include "nouveau_exec.h"
 #include "nouveau_abi16.h"
 #include "nouveau_sched.h"
-#include "nouveau_chan.h"
 
 #define NOUVEAU_SCHED_JOB_TIMEOUT_MS		10000
 
@@ -122,9 +121,11 @@ nouveau_job_done(struct nouveau_job *job)
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
@@ -305,9 +306,9 @@ nouveau_job_submit(struct nouveau_job *job)
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
@@ -392,23 +393,10 @@ nouveau_sched_free_job(struct drm_sched_job *sched_job)
 	nouveau_job_fini(job);
 }
 
-static void
-nouveau_sched_cancel_job(struct drm_sched_job *sched_job)
-{
-	struct nouveau_fence *fence;
-	struct nouveau_job *job;
-
-	job = to_nouveau_job(sched_job);
-	fence = to_nouveau_fence(job->done_fence);
-
-	nouveau_fence_cancel(fence);
-}
-
 static const struct drm_sched_backend_ops nouveau_sched_ops = {
 	.run_job = nouveau_sched_run_job,
 	.timedout_job = nouveau_sched_timedout_job,
 	.free_job = nouveau_sched_free_job,
-	.cancel_job = nouveau_sched_cancel_job,
 };
 
 static int
@@ -458,8 +446,9 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 		goto fail_sched;
 
 	mutex_init(&sched->mutex);
-	spin_lock_init(&sched->job_list.lock);
-	INIT_LIST_HEAD(&sched->job_list.head);
+	spin_lock_init(&sched->job.list.lock);
+	INIT_LIST_HEAD(&sched->job.list.head);
+	init_waitqueue_head(&sched->job.wq);
 
 	return 0;
 
@@ -493,12 +482,16 @@ nouveau_sched_create(struct nouveau_sched **psched, struct nouveau_drm *drm,
 	return 0;
 }
 
+
 static void
 nouveau_sched_fini(struct nouveau_sched *sched)
 {
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

