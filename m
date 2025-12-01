Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9316C96BD1
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 11:51:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D1410E397;
	Mon,  1 Dec 2025 10:51:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DU6NroHJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0346610E392;
 Mon,  1 Dec 2025 10:51:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DFA1743CCD;
 Mon,  1 Dec 2025 10:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE25C4CEF1;
 Mon,  1 Dec 2025 10:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764586273;
 bh=mj9yMjkJYnq6gG3lH605LhmJYpglfLnEKicH3/+ivuE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DU6NroHJll/euhP3rvFLbh4NSOf5U8rJJz3hOoQYb4qeBnETbcZs6C0qbiKr4Adyp
 PSB0UMovD7mRiU5pk9HmDmCMV7Co/inKdC1vzlOr+iqm17MXNje7ZOMn02KwBOKHzv
 9AGvrL7EAa9MFaPQQdJRrexqOD2mHNK57M4ED+4FKHSW8y0mWIRcyRJI7ufzJuLqEE
 CUPuQFI5s3XOuXEg1JAItdeD85228dnhKp/Uj71pygEXhVcn2ouXqF7+BWqaJ6Am4s
 O9jtI3z3AHSjNDsNIwkBBtlukpKGqTcfM9leHHbTO/81aoLJgVP2rmnolE/PdLH/8a
 /U/GtbReIIYIA==
From: Philipp Stanner <phasta@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v2 8/8] drm/xe: Use dma_fence_test_signaled_flag()
Date: Mon,  1 Dec 2025 11:50:12 +0100
Message-ID: <20251201105011.19386-10-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251201105011.19386-2-phasta@kernel.org>
References: <20251201105011.19386-2-phasta@kernel.org>
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

There is a new dma_fence helper which simplifies testing for a fence's
signaled_flag. Use it in xe.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 9 +++------
 drivers/gpu/drm/xe/xe_pt.c         | 3 +--
 drivers/gpu/drm/xe/xe_sched_job.c  | 2 +-
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index cb5f204c08ed..06736f52fbaa 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -1037,8 +1037,7 @@ struct dma_fence *xe_exec_queue_last_fence_get(struct xe_exec_queue *q,
 
 	xe_exec_queue_last_fence_lockdep_assert(q, vm);
 
-	if (q->last_fence &&
-	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fence->flags))
+	if (q->last_fence && dma_fence_test_signaled_flag(q->last_fence))
 		xe_exec_queue_last_fence_put(q, vm);
 
 	fence = q->last_fence ? q->last_fence : dma_fence_get_stub();
@@ -1064,8 +1063,7 @@ struct dma_fence *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *
 
 	lockdep_assert_held_write(&q->hwe->hw_engine_group->mode_sem);
 
-	if (q->last_fence &&
-	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &q->last_fence->flags))
+	if (q->last_fence && dma_fence_test_signaled_flag(q->last_fence))
 		xe_exec_queue_last_fence_put_unlocked(q);
 
 	fence = q->last_fence ? q->last_fence : dma_fence_get_stub();
@@ -1106,8 +1104,7 @@ int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q, struct xe_vm *vm)
 
 	fence = xe_exec_queue_last_fence_get(q, vm);
 	if (fence) {
-		err = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) ?
-			0 : -ETIME;
+		err = dma_fence_test_signaled_flag(fence) ? 0 : -ETIME;
 		dma_fence_put(fence);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 07f96bda638a..1ca2dec18e51 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1208,8 +1208,7 @@ static bool no_in_syncs(struct xe_sync_entry *syncs, u32 num_syncs)
 	for (i = 0; i < num_syncs; i++) {
 		struct dma_fence *fence = syncs[i].fence;
 
-		if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
-				       &fence->flags))
+		if (fence && !dma_fence_test_signaled_flag(fence))
 			return false;
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_sched_job.c b/drivers/gpu/drm/xe/xe_sched_job.c
index d21bf8f26964..1c9ba49a325b 100644
--- a/drivers/gpu/drm/xe/xe_sched_job.c
+++ b/drivers/gpu/drm/xe/xe_sched_job.c
@@ -188,7 +188,7 @@ static bool xe_fence_set_error(struct dma_fence *fence, int error)
 	bool signaled;
 
 	spin_lock_irqsave(fence->lock, irq_flags);
-	signaled = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
+	signaled = dma_fence_test_signaled_flag(fence);
 	if (!signaled)
 		dma_fence_set_error(fence, error);
 	spin_unlock_irqrestore(fence->lock, irq_flags);
-- 
2.49.0

