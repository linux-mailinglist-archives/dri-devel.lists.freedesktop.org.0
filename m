Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 227C7B00299
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 14:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C0E210E8CD;
	Thu, 10 Jul 2025 12:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oBA2Wetp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B1310E8CC;
 Thu, 10 Jul 2025 12:55:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 986BDA54A72;
 Thu, 10 Jul 2025 12:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57207C4CEF5;
 Thu, 10 Jul 2025 12:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752152103;
 bh=jwQeQF43fuuFdeU+odOP0p6i6/kacIOeRK9joESZCeg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oBA2Wetpr16+LDKFoLQXJiVDzLOAX/z0FAw5a/wuBXi8RuvUdkfII8EyQ0mwGc6Us
 APtUUBTrM+CX0DxLjMUP1ZTcgXWc6ToHsHPHTf8LMwbwJ5Rzpbc5JyhvTn96i+i91H
 Dknn19XfFYBlOr4z2GSXBQ6WcmjBZD61RMVXF8QH7YjkWOYFB4xdL7w4IAip5vQWjL
 X5vfpOMvuF9lBdJVZoAOdr5ejeLhg9DmYK9wbxhWYgLW1iGE2iC7dofq3JYNy4+5Xh
 2iqqOwsxWsBKJ4/cw34xpIQ6K84wiAxHx5r/nlSuj/IIEf3zA7WuoB7N2luy3ebnUl
 9vIpwoQHvKSYQ==
From: Philipp Stanner <phasta@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 8/8] drm/nouveau: Remove waitque for sched teardown
Date: Thu, 10 Jul 2025 14:54:12 +0200
Message-ID: <20250710125412.128476-10-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250710125412.128476-2-phasta@kernel.org>
References: <20250710125412.128476-2-phasta@kernel.org>
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

struct nouveau_sched contains a waitque needed to prevent
drm_sched_fini() from being called while there are still jobs pending.
Doing so so far would have caused memory leaks.

With the new memleak-free mode of operation switched on in
drm_sched_fini() by providing the callback nouveau_sched_cancel_job()
the waitque is not necessary anymore.

Remove the waitque.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
Acked-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_sched.c | 20 +++++++-------------
 drivers/gpu/drm/nouveau/nouveau_sched.h |  9 +++------
 drivers/gpu/drm/nouveau/nouveau_uvmm.c  |  8 ++++----
 3 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 2ec62059c351..7d9c3418e76b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -122,11 +122,9 @@ nouveau_job_done(struct nouveau_job *job)
 {
 	struct nouveau_sched *sched = job->sched;
 
-	spin_lock(&sched->job.list.lock);
+	spin_lock(&sched->job_list.lock);
 	list_del(&job->entry);
-	spin_unlock(&sched->job.list.lock);
-
-	wake_up(&sched->job.wq);
+	spin_unlock(&sched->job_list.lock);
 }
 
 void
@@ -307,9 +305,9 @@ nouveau_job_submit(struct nouveau_job *job)
 	}
 
 	/* Submit was successful; add the job to the schedulers job list. */
-	spin_lock(&sched->job.list.lock);
-	list_add(&job->entry, &sched->job.list.head);
-	spin_unlock(&sched->job.list.lock);
+	spin_lock(&sched->job_list.lock);
+	list_add(&job->entry, &sched->job_list.head);
+	spin_unlock(&sched->job_list.lock);
 
 	drm_sched_job_arm(&job->base);
 	job->done_fence = dma_fence_get(&job->base.s_fence->finished);
@@ -460,9 +458,8 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 		goto fail_sched;
 
 	mutex_init(&sched->mutex);
-	spin_lock_init(&sched->job.list.lock);
-	INIT_LIST_HEAD(&sched->job.list.head);
-	init_waitqueue_head(&sched->job.wq);
+	spin_lock_init(&sched->job_list.lock);
+	INIT_LIST_HEAD(&sched->job_list.head);
 
 	return 0;
 
@@ -502,9 +499,6 @@ nouveau_sched_fini(struct nouveau_sched *sched)
 	struct drm_gpu_scheduler *drm_sched = &sched->base;
 	struct drm_sched_entity *entity = &sched->entity;
 
-	rmb(); /* for list_empty to work without lock */
-	wait_event(sched->job.wq, list_empty(&sched->job.list.head));
-
 	drm_sched_entity_fini(entity);
 	drm_sched_fini(drm_sched);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h b/drivers/gpu/drm/nouveau/nouveau_sched.h
index 20cd1da8db73..b98c3f0bef30 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.h
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
@@ -103,12 +103,9 @@ struct nouveau_sched {
 	struct mutex mutex;
 
 	struct {
-		struct {
-			struct list_head head;
-			spinlock_t lock;
-		} list;
-		struct wait_queue_head wq;
-	} job;
+		struct list_head head;
+		spinlock_t lock;
+	} job_list;
 };
 
 int nouveau_sched_create(struct nouveau_sched **psched, struct nouveau_drm *drm,
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 48f105239f42..ddfc46bc1b3e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1019,8 +1019,8 @@ bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
 	u64 end = addr + range;
 
 again:
-	spin_lock(&sched->job.list.lock);
-	list_for_each_entry(__job, &sched->job.list.head, entry) {
+	spin_lock(&sched->job_list.lock);
+	list_for_each_entry(__job, &sched->job_list.head, entry) {
 		struct nouveau_uvmm_bind_job *bind_job = to_uvmm_bind_job(__job);
 
 		list_for_each_op(op, &bind_job->ops) {
@@ -1030,7 +1030,7 @@ bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
 
 				if (!(end <= op_addr || addr >= op_end)) {
 					nouveau_uvmm_bind_job_get(bind_job);
-					spin_unlock(&sched->job.list.lock);
+					spin_unlock(&sched->job_list.lock);
 					wait_for_completion(&bind_job->complete);
 					nouveau_uvmm_bind_job_put(bind_job);
 					goto again;
@@ -1038,7 +1038,7 @@ bind_validate_map_sparse(struct nouveau_job *job, u64 addr, u64 range)
 			}
 		}
 	}
-	spin_unlock(&sched->job.list.lock);
+	spin_unlock(&sched->job_list.lock);
 }
 
 static int
-- 
2.49.0

