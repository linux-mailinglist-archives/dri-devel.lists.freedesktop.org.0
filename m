Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 766584F7AAD
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A181610E5B8;
	Thu,  7 Apr 2022 08:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2318510E54A;
 Thu,  7 Apr 2022 08:59:56 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id dr20so9374068ejc.6;
 Thu, 07 Apr 2022 01:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cYKyVqqfsb+TbZp3MQps4mXHo/mbt76OJJBbGylBy6Y=;
 b=ZqXgAvaogEiuE7d0PKFIbeGx3/pl37NsDc4EUBPHVQ2uC6wudibehJt5RFjLrpjtcU
 8g612aR4w5t7KVHHAptne5d+20D+1Sl9+KDMSq9mUbYBGtcybBblCwrvR1ZMOWn9ydFj
 3Z79gvCc4HGXKwvnJBBJfgVoYTXLxYgnOsW17f9GkOaCN7Fcudxuxgw7d8HH4JfwtVl+
 zUqWKnUfvk58kXv6m/GY4c2s5HnpPVhQ4L3JUKQvgHS8/jwU4XY8T8UrVS/sGamp+Hzv
 lyndD16r14SXOyHzL7WciD8IWN/zkBC/z3wPeoypSaA77RJ4zz9YTfFFgZvwxQosBHGS
 DkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cYKyVqqfsb+TbZp3MQps4mXHo/mbt76OJJBbGylBy6Y=;
 b=WcY70ATV8qp0cMNoL9Gmk7ceGsFC/iDH2BmDVgsZonKystIrDBMZsJnS/M6HJgEIh6
 2NKXOjV0Bkwa+bRYFB7G0ktZjb+pDp0dAwkGzjmJICwk5NDyBwAedHkyJ4NCXkX5kwqX
 v7v4WgNvzuH4tYirBs2dSLy8HjOSTH7xx5VCj/zmUeaAWEEpaElg37ns8RlJoCWcAzzv
 jnPjbKNF3os+LQriirC3PKbYRMAZ+6XzN/1dQsm9WsbSfcS9Y6RWGV02zM49I75WDfmB
 t6Tpm+Wfj9BKP5KZqlJnGi+C1YPzhZWrLuMVUHLIlG0D0bay3awkddul6NWe+4qYMRXv
 xJlw==
X-Gm-Message-State: AOAM530jwJoa04ej3HyjggQQoDMU13yQTGe+5GYOKkjvHKnuPACqofOE
 b/yfoYM5qlanZxvFcZ+9y3jmGSGnyJg=
X-Google-Smtp-Source: ABdhPJxf42oYr3BVVsO7y5X7wVEk6lzVD9mrAnf9yDXnszKFfZQiEpD/KsUi/+CN+KFya/glqUSJeg==
X-Received: by 2002:a17:906:174f:b0:6d0:5629:e4be with SMTP id
 d15-20020a170906174f00b006d05629e4bemr12285058eje.525.1649321994689; 
 Thu, 07 Apr 2022 01:59:54 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 h26-20020a170906111a00b006e778bd4fc8sm5186563eja.38.2022.04.07.01.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 01:59:54 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 04/15] dma-buf: add DMA_RESV_USAGE_KERNEL v3
Date: Thu,  7 Apr 2022 10:59:35 +0200
Message-Id: <20220407085946.744568-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407085946.744568-1-christian.koenig@amd.com>
References: <20220407085946.744568-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add an usage for kernel submissions. Waiting for those are mandatory for
dynamic DMA-bufs.

As a precaution this patch also changes all occurrences where fences are
added as part of memory management in TTM, VMWGFX and i915 to use the
new value because it now becomes possible for drivers to ignore fences
with the WRITE usage.

v2: use "must" in documentation, fix whitespaces
v3: separate out some driver changes and better document why some
    changes should still be part of this patch.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-resv.c                  |  2 +-
 drivers/dma-buf/st-dma-resv.c               |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c |  2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                |  2 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c           |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c          |  2 +-
 include/linux/dma-resv.h                    | 24 ++++++++++++++++++---
 7 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 378d47e1cfea..f4860e5f2d8b 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -726,7 +726,7 @@ EXPORT_SYMBOL_GPL(dma_resv_test_signaled);
  */
 void dma_resv_describe(struct dma_resv *obj, struct seq_file *seq)
 {
-	static const char *usage[] = { "write", "read" };
+	static const char *usage[] = { "kernel", "write", "read" };
 	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 
diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
index d0f7c2bfd4f0..062b57d63fa6 100644
--- a/drivers/dma-buf/st-dma-resv.c
+++ b/drivers/dma-buf/st-dma-resv.c
@@ -296,7 +296,7 @@ int dma_resv(void)
 	int r;
 
 	spin_lock_init(&fence_lock);
-	for (usage = DMA_RESV_USAGE_WRITE; usage <= DMA_RESV_USAGE_READ;
+	for (usage = DMA_RESV_USAGE_KERNEL; usage <= DMA_RESV_USAGE_READ;
 	     ++usage) {
 		r = subtests(tests, (void *)(unsigned long)usage);
 		if (r)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
index f5f2b8b115ea..0512afdd20d8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
@@ -117,7 +117,7 @@ bool i915_gem_clflush_object(struct drm_i915_gem_object *obj,
 						i915_fence_timeout(i915),
 						I915_FENCE_GFP);
 		dma_resv_add_fence(obj->base.resv, &clflush->base.dma,
-				   DMA_RESV_USAGE_WRITE);
+				   DMA_RESV_USAGE_KERNEL);
 		dma_fence_work_commit(&clflush->base);
 		/*
 		 * We must have successfully populated the pages(since we are
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index d74f9eea855e..6bf3fb1c8045 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -739,7 +739,7 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
 		return ret;
 	}
 
-	dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_WRITE);
+	dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_KERNEL);
 
 	ret = dma_resv_reserve_fences(bo->base.resv, 1);
 	if (unlikely(ret)) {
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 7a96a1db13a7..99deb45894f4 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -508,7 +508,7 @@ static int ttm_bo_move_to_ghost(struct ttm_buffer_object *bo,
 		return ret;
 
 	dma_resv_add_fence(&ghost_obj->base._resv, fence,
-			   DMA_RESV_USAGE_WRITE);
+			   DMA_RESV_USAGE_KERNEL);
 
 	/**
 	 * If we're not moving to fixed memory, the TTM object
@@ -562,7 +562,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
 	struct ttm_resource_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
 	int ret = 0;
 
-	dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_WRITE);
+	dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_KERNEL);
 	if (!evict)
 		ret = ttm_bo_move_to_ghost(bo, fence, man->use_tt);
 	else if (!from->use_tt && pipeline)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index bec50223efe5..408ede1f967f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -759,7 +759,7 @@ void vmw_bo_fence_single(struct ttm_buffer_object *bo,
 	ret = dma_resv_reserve_fences(bo->base.resv, 1);
 	if (!ret)
 		dma_resv_add_fence(bo->base.resv, &fence->base,
-				   DMA_RESV_USAGE_WRITE);
+				   DMA_RESV_USAGE_KERNEL);
 	else
 		/* Last resort fallback when we are OOM */
 		dma_fence_wait(&fence->base, false);
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 7bb7e7edbb6f..a749f229ae91 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -55,11 +55,29 @@ struct dma_resv_list;
  * This enum describes the different use cases for a dma_resv object and
  * controls which fences are returned when queried.
  *
- * An important fact is that there is the order WRITE<READ and when the
- * dma_resv object is asked for fences for one use case the fences for the
- * lower use case are returned as well.
+ * An important fact is that there is the order KERNEL<WRITE<READ and
+ * when the dma_resv object is asked for fences for one use case the fences
+ * for the lower use case are returned as well.
+ *
+ * For example when asking for WRITE fences then the KERNEL fences are returned
+ * as well. Similar when asked for READ fences then both WRITE and KERNEL
+ * fences are returned as well.
  */
 enum dma_resv_usage {
+	/**
+	 * @DMA_RESV_USAGE_KERNEL: For in kernel memory management only.
+	 *
+	 * This should only be used for things like copying or clearing memory
+	 * with a DMA hardware engine for the purpose of kernel memory
+	 * management.
+	 *
+	 * Drivers *always* must wait for those fences before accessing the
+	 * resource protected by the dma_resv object. The only exception for
+	 * that is when the resource is known to be locked down in place by
+	 * pinning it previously.
+	 */
+	DMA_RESV_USAGE_KERNEL,
+
 	/**
 	 * @DMA_RESV_USAGE_WRITE: Implicit write synchronization.
 	 *
-- 
2.25.1

