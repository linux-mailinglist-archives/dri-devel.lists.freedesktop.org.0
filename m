Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F533D850E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 03:02:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD796EC1C;
	Wed, 28 Jul 2021 01:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1DB6EC09;
 Wed, 28 Jul 2021 01:02:51 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id ca5so2589602pjb.5;
 Tue, 27 Jul 2021 18:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1lQsB6G8RxUZqymaqJyj6omNrUo1+aKI3ERZw6/dbiY=;
 b=P573IhqzWtQdkGFJDB24K0BEtclq1vbxa/XLGxWeQkoQIS3belTssscajmTFGVdegc
 ubHeHWyO4KFFdW3sZfleFOWNXNzwYu9thVGEYiQK4oSU5QvY4G2GHpCEyK4tBLCuSqES
 xiL3BtHrQwov+xHpDu8BMbyph2SOx0qxyUAKF/a8jsHNu2Npi+sz/AC7eskHZgx18dZx
 QAVkP5vNmwx5BVY8IhOSzxQ9uEVXiEBAwD9Av2a8ftsEB3/C2nBQbrvE5pQWZGvn7vCx
 HmwI/wZJA6wEIQQvd/McEN1wGVxHVL7qqG1H9qakHhNMnbSoWY9q9mmO+d8UYsdcUZ/X
 kBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1lQsB6G8RxUZqymaqJyj6omNrUo1+aKI3ERZw6/dbiY=;
 b=oXdSE1nVEakGbx/OmA3WHHKuRNLjSmSThz9hg2ReK4D4FnNUolzqWpyQpvyHk8E8QI
 tmzptoZBYjhMLCOjVxCVtEk0x63tfGtu6FCPesNxgDLuKP05R1ptZEQyJyh1fGcCuM5n
 pqjnaTshkYxYYfqzQXbjGLs47HiO4yYQSVYd7tp/hELRsCLiJ3vK+3GfeCniYKqArUoV
 +BrW0EJ0ty0hTSdHxIIRifyPjOEg80mtCGKPOZzbrCqb4Hsb6meFtF59/ctlecd0yGjk
 u9BH7qUtEI7qX1PrYToiZyaFl9hcUBtYCkOMV0e4tjEaD+2aS2XW7VrhK3/0REn3uG7w
 xuag==
X-Gm-Message-State: AOAM531GGsQINb1JNzJyTF3GvhcVV0Pk3LxNoYwKL87C481DiBjJc07y
 dbsdE2WnZ2veX7O3aTsrVPjhvcl1GP6frQ==
X-Google-Smtp-Source: ABdhPJxfcWdlrXmlTGKtdd4VXDhHUkGeZ4NlUDeHopJuZ/bGqoPhbioFwEbqZ91jl+nF2zbUrgqjeg==
X-Received: by 2002:a63:3d1:: with SMTP id 200mr26378234pgd.26.1627434170485; 
 Tue, 27 Jul 2021 18:02:50 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 b10sm4942278pfi.122.2021.07.27.18.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 18:02:49 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 07/13] drm/msm: Track "seqno" fences by idr
Date: Tue, 27 Jul 2021 18:06:12 -0700
Message-Id: <20210728010632.2633470-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728010632.2633470-1-robdclark@gmail.com>
References: <20210728010632.2633470-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Previously the (non-fd) fence returned from submit ioctl was a raw
seqno, which is scoped to the ring.  But from UABI standpoint, the
ioctls related to seqno fences all specify a submitqueue.  We can
take advantage of that to replace the seqno fences with a cyclic idr
handle.

This is in preperation for moving to drm scheduler, at which point
the submit ioctl will return after queuing the submit job to the
scheduler, but before the submit is written into the ring (and
therefore before a ring seqno has been assigned).  Which means we
need to replace the dma_fence that userspace may need to wait on
with a scheduler fence.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_drv.c         | 30 +++++++++++++++++--
 drivers/gpu/drm/msm/msm_fence.c       | 42 ---------------------------
 drivers/gpu/drm/msm/msm_fence.h       |  3 --
 drivers/gpu/drm/msm/msm_gem.h         |  1 +
 drivers/gpu/drm/msm/msm_gem_submit.c  | 23 ++++++++++++++-
 drivers/gpu/drm/msm/msm_gpu.h         |  5 ++++
 drivers/gpu/drm/msm/msm_submitqueue.c |  5 ++++
 7 files changed, 61 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9b8fa2ad0d84..1594ae39d54f 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -911,6 +911,7 @@ static int msm_ioctl_wait_fence(struct drm_device *dev, void *data,
 	ktime_t timeout = to_ktime(args->timeout);
 	struct msm_gpu_submitqueue *queue;
 	struct msm_gpu *gpu = priv->gpu;
+	struct dma_fence *fence;
 	int ret;
 
 	if (args->pad) {
@@ -925,10 +926,35 @@ static int msm_ioctl_wait_fence(struct drm_device *dev, void *data,
 	if (!queue)
 		return -ENOENT;
 
-	ret = msm_wait_fence(gpu->rb[queue->prio]->fctx, args->fence, &timeout,
-		true);
+	/*
+	 * Map submitqueue scoped "seqno" (which is actually an idr key)
+	 * back to underlying dma-fence
+	 *
+	 * The fence is removed from the fence_idr when the submit is
+	 * retired, so if the fence is not found it means there is nothing
+	 * to wait for
+	 */
+	ret = mutex_lock_interruptible(&queue->lock);
+	if (ret)
+		return ret;
+	fence = idr_find(&queue->fence_idr, args->fence);
+	if (fence)
+		fence = dma_fence_get_rcu(fence);
+	mutex_unlock(&queue->lock);
+
+	if (!fence)
+		return 0;
 
+	ret = dma_fence_wait_timeout(fence, true, timeout_to_jiffies(&timeout));
+	if (ret == 0) {
+		ret = -ETIMEDOUT;
+	} else if (ret != -ERESTARTSYS) {
+		ret = 0;
+	}
+
+	dma_fence_put(fence);
 	msm_submitqueue_put(queue);
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
index b92a9091a1e2..f2cece542c3f 100644
--- a/drivers/gpu/drm/msm/msm_fence.c
+++ b/drivers/gpu/drm/msm/msm_fence.c
@@ -24,7 +24,6 @@ msm_fence_context_alloc(struct drm_device *dev, volatile uint32_t *fenceptr,
 	strncpy(fctx->name, name, sizeof(fctx->name));
 	fctx->context = dma_fence_context_alloc(1);
 	fctx->fenceptr = fenceptr;
-	init_waitqueue_head(&fctx->event);
 	spin_lock_init(&fctx->spinlock);
 
 	return fctx;
@@ -45,53 +44,12 @@ static inline bool fence_completed(struct msm_fence_context *fctx, uint32_t fenc
 		(int32_t)(*fctx->fenceptr - fence) >= 0;
 }
 
-/* legacy path for WAIT_FENCE ioctl: */
-int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
-		ktime_t *timeout, bool interruptible)
-{
-	int ret;
-
-	if (fence > fctx->last_fence) {
-		DRM_ERROR_RATELIMITED("%s: waiting on invalid fence: %u (of %u)\n",
-				fctx->name, fence, fctx->last_fence);
-		return -EINVAL;
-	}
-
-	if (!timeout) {
-		/* no-wait: */
-		ret = fence_completed(fctx, fence) ? 0 : -EBUSY;
-	} else {
-		unsigned long remaining_jiffies = timeout_to_jiffies(timeout);
-
-		if (interruptible)
-			ret = wait_event_interruptible_timeout(fctx->event,
-				fence_completed(fctx, fence),
-				remaining_jiffies);
-		else
-			ret = wait_event_timeout(fctx->event,
-				fence_completed(fctx, fence),
-				remaining_jiffies);
-
-		if (ret == 0) {
-			DBG("timeout waiting for fence: %u (completed: %u)",
-					fence, fctx->completed_fence);
-			ret = -ETIMEDOUT;
-		} else if (ret != -ERESTARTSYS) {
-			ret = 0;
-		}
-	}
-
-	return ret;
-}
-
 /* called from workqueue */
 void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence)
 {
 	spin_lock(&fctx->spinlock);
 	fctx->completed_fence = max(fence, fctx->completed_fence);
 	spin_unlock(&fctx->spinlock);
-
-	wake_up_all(&fctx->event);
 }
 
 struct msm_fence {
diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_fence.h
index 6ab97062ff1a..4783db528bcc 100644
--- a/drivers/gpu/drm/msm/msm_fence.h
+++ b/drivers/gpu/drm/msm/msm_fence.h
@@ -49,7 +49,6 @@ struct msm_fence_context {
 	 */
 	volatile uint32_t *fenceptr;
 
-	wait_queue_head_t event;
 	spinlock_t spinlock;
 };
 
@@ -57,8 +56,6 @@ struct msm_fence_context * msm_fence_context_alloc(struct drm_device *dev,
 		volatile uint32_t *fenceptr, const char *name);
 void msm_fence_context_free(struct msm_fence_context *fctx);
 
-int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
-		ktime_t *timeout, bool interruptible);
 void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence);
 
 struct dma_fence * msm_fence_alloc(struct msm_fence_context *fctx);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index da3af702a6c8..e0579abda5b9 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -320,6 +320,7 @@ struct msm_gem_submit {
 	struct ww_acquire_ctx ticket;
 	uint32_t seqno;		/* Sequence number of the submit on the ring */
 	struct dma_fence *fence;
+	int fence_id;       /* key into queue->fence_idr */
 	struct msm_gpu_submitqueue *queue;
 	struct pid *pid;    /* submitting process */
 	bool fault_dumped;  /* Limit devcoredump dumping to one per submit */
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 4f02fa3c78f9..f6f595aae2c5 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -68,7 +68,14 @@ void __msm_gem_submit_destroy(struct kref *kref)
 			container_of(kref, struct msm_gem_submit, ref);
 	unsigned i;
 
+	if (submit->fence_id) {
+		mutex_lock(&submit->queue->lock);
+		idr_remove(&submit->queue->fence_idr, submit->fence_id);
+		mutex_unlock(&submit->queue->lock);
+	}
+
 	dma_fence_put(submit->fence);
+
 	put_pid(submit->pid);
 	msm_submitqueue_put(submit->queue);
 
@@ -872,6 +879,20 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		goto out;
 	}
 
+	/*
+	 * Allocate an id which can be used by WAIT_FENCE ioctl to map back
+	 * to the underlying fence.
+	 */
+	mutex_lock(&queue->lock);
+	submit->fence_id = idr_alloc_cyclic(&queue->fence_idr,
+			submit->fence, 0, INT_MAX, GFP_KERNEL);
+	mutex_unlock(&queue->lock);
+	if (submit->fence_id < 0) {
+		ret = submit->fence_id = 0;
+		submit->fence_id = 0;
+		goto out;
+	}
+
 	if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
 		struct sync_file *sync_file = sync_file_create(submit->fence);
 		if (!sync_file) {
@@ -886,7 +907,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	msm_gpu_submit(gpu, submit);
 
-	args->fence = submit->fence->seqno;
+	args->fence = submit->fence_id;
 
 	msm_reset_syncobjs(syncobjs_to_reset, args->nr_in_syncobjs);
 	msm_process_post_deps(post_deps, args->nr_out_syncobjs,
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 96efcb31e502..579627252540 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -263,6 +263,9 @@ struct msm_gpu_perfcntr {
  *             which set of pgtables do submits jobs associated with the
  *             submitqueue use)
  * @node:      node in the context's list of submitqueues
+ * @fence_idr: maps fence-id to dma_fence for userspace visible fence
+ *             seqno, protected by submitqueue lock
+ * @lock:      submitqueue lock
  * @ref:       reference count
  */
 struct msm_gpu_submitqueue {
@@ -272,6 +275,8 @@ struct msm_gpu_submitqueue {
 	int faults;
 	struct msm_file_private *ctx;
 	struct list_head node;
+	struct idr fence_idr;
+	struct mutex lock;
 	struct kref ref;
 };
 
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 9e9fec61d629..66f8d0fb38b0 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -12,6 +12,8 @@ void msm_submitqueue_destroy(struct kref *kref)
 	struct msm_gpu_submitqueue *queue = container_of(kref,
 		struct msm_gpu_submitqueue, ref);
 
+	idr_destroy(&queue->fence_idr);
+
 	msm_file_private_put(queue->ctx);
 
 	kfree(queue);
@@ -89,6 +91,9 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 	if (id)
 		*id = queue->id;
 
+	idr_init(&queue->fence_idr);
+	mutex_init(&queue->lock);
+
 	list_add_tail(&queue->node, &ctx->submitqueues);
 
 	write_unlock(&ctx->queuelock);
-- 
2.31.1

