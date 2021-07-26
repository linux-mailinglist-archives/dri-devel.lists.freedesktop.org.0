Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E972D3D5C6F
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 16:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4556FD0B;
	Mon, 26 Jul 2021 14:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF4F6FA99;
 Mon, 26 Jul 2021 14:56:51 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id e5so9959120pld.6;
 Mon, 26 Jul 2021 07:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DealqZ52rle5Sxs0OYfG57W/B0C5w2BihQ08hiiaTrI=;
 b=DyASpC+YLT9N7O0Uq7lGf/OwlGbIdLNvnykMSAbmllJutFM5tA0suXGsgAoOa1pIdT
 RfHcHVSzlj7Rg3vHzQfBBjuPaAVhVDH4hSluMvcHihyTwtI+VXICKf6ziqh3Ahfkkcfy
 VOGL5MlFrXhhObnWih1RwSvX6YKCQgFqwmWWLp0PVo1PPdeP7JMzHacIA467ITdnH3Xg
 oxb4G0aOTNDcfOOsCUVLmCFjA+ASmtVS1t9HlUmcLhFWDIg4bGj4CITnyrJwR3l08QyP
 Vm9VZU5WKPVo2Vzhcb9a5mwYu1OT0RaEgPcP/gnzv0y2NuektehWZ6P+DinXPYJ9ylrx
 ljIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DealqZ52rle5Sxs0OYfG57W/B0C5w2BihQ08hiiaTrI=;
 b=PfOSmnPI95xoM3aaYqPSmUzliKmKcM9FA8rrFvsuRDga9BNdEjbrpjlaHnsb+yJYLa
 LMuVxmlWqudp6E9axIt0KJUTL4Q0o/hqniALjy4G7/5+2rQaXwV/Zvcz06gLXkI5v9Ka
 Zjvz0oKQ2xQ0CPBXsBPzVsJqoabzNtTtRiYmeqUwpAdgp45nBZivdaTWdhavWiNV2qpB
 bvHOVmxcHTKFAAN3Y58pINMl0fTPbvLN/peq1kSjuokw8lcLaVBTVqSzCsYJnGBE4Quo
 RO50O34wYuh8b06geqIu9eLMb/XH1qt72nm23Lsli7qUnGZlybIErnIR2ZnYMIXDfklQ
 ot8g==
X-Gm-Message-State: AOAM533PW9rAiY9Hk7jiaG9gmuLQvaE62b1S2KSPmr3y38xmXbX+ZE1g
 njQrwOrMTGGYSAUVz+/O1e0KSGIG+t1B2Q==
X-Google-Smtp-Source: ABdhPJz2H5ichqwatlBbq8PZI6dR64xARsn0yQ0bJq3Rpn8p7rOz0FD3+AGQKz6pEJEfDn/u0HgCxg==
X-Received: by 2002:a17:90b:2112:: with SMTP id
 kz18mr26733930pjb.137.1627311410773; 
 Mon, 26 Jul 2021 07:56:50 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id g12sm243940pfv.167.2021.07.26.07.56.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:56:49 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 07/12] drm/msm: Track "seqno" fences by idr
Date: Mon, 26 Jul 2021 08:00:21 -0700
Message-Id: <20210726150038.2187631-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726150038.2187631-1-robdclark@gmail.com>
References: <20210726150038.2187631-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
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
 drivers/gpu/drm/msm/msm_drv.c         | 30 +++++++++++++++++++--
 drivers/gpu/drm/msm/msm_fence.c       | 39 ---------------------------
 drivers/gpu/drm/msm/msm_fence.h       |  2 --
 drivers/gpu/drm/msm/msm_gem.h         |  1 +
 drivers/gpu/drm/msm/msm_gem_submit.c  | 23 +++++++++++++++-
 drivers/gpu/drm/msm/msm_gpu.h         |  5 ++++
 drivers/gpu/drm/msm/msm_submitqueue.c |  5 ++++
 7 files changed, 61 insertions(+), 44 deletions(-)

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
index b92a9091a1e2..d8228029708e 100644
--- a/drivers/gpu/drm/msm/msm_fence.c
+++ b/drivers/gpu/drm/msm/msm_fence.c
@@ -45,45 +45,6 @@ static inline bool fence_completed(struct msm_fence_context *fctx, uint32_t fenc
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
diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_fence.h
index 6ab97062ff1a..6de97d0f5153 100644
--- a/drivers/gpu/drm/msm/msm_fence.h
+++ b/drivers/gpu/drm/msm/msm_fence.h
@@ -57,8 +57,6 @@ struct msm_fence_context * msm_fence_context_alloc(struct drm_device *dev,
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

