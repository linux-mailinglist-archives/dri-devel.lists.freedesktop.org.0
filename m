Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4C14F56EC
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 09:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C7010F2E2;
	Wed,  6 Apr 2022 07:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297F210F265
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 07:51:46 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id w18so1555172edi.13
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 00:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding;
 bh=3w3VmJ2XAYTQ6q+lZRJmyV+F0S+wot7trFdlMbKNekM=;
 b=bA/tTtzqxldtZGWe26vY+pDMynDNinWca7gih/ywmMDybkubxSKH6ccuVRgXwSmYSX
 cXTtHhncIfQtLAAL/EswmY/qYZ9k3WJzAupgy3jRcOONozN3ttQXuyqWEPaAzO6RZtCi
 hMFzUhesqrnHCEYvFHCdz4+lYSp4siJ8GFwXDuc2NK+SjRku3Xr3C9jpOlun2Zdfhtbo
 qZdwJ5nUsFzRgRgaGT4k4+p7QCRhBJPW1H/ZzymJehlJlVsnuNHJzK9fKuN+9l0/bw6U
 er5qVg1KsO9o4HQfc/zl0IiyHw1pMTf/hVEu4d6mR+NyidN9ZvCZGMYKHq246RL4gLEO
 AU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:reply-to:mime-version:content-transfer-encoding;
 bh=3w3VmJ2XAYTQ6q+lZRJmyV+F0S+wot7trFdlMbKNekM=;
 b=Tf0SvCNYWAw/lSka39VbYwU7GmpM7acgJbHQXA1+IB3J6OQhxCMay7jYBhh6PHQWdN
 5Q0ic9LhSGVX3C4VcWtG93du+c+wa+VVYPagl/rDw510iMa98Yxite4mw31U0TuQSjpb
 144vuCsnXNRemMRBWKDlvEVAfTApuVzjpMtLCvnUBWrvc8MBR43XSAHQ5rc1QYAdm4Mh
 6XUMS3agZoOU91D36MDl0JU7IjSlXYGCM5UENDTT5JeU8rkdqhsaIbIEc+DS4w512o7F
 UGzZVUwcO/wQFRY9/FDBr2RxqXzTGwukNlbd10jdYAraWKOORplK0wm5wv2jJkr5df+P
 EzBw==
X-Gm-Message-State: AOAM531j40BnYELX47I8+8EMox55FszyYggH52gJlpKWuDx0Xkfub6KG
 /GPTUci+47Io8I1EUqWWUwQ=
X-Google-Smtp-Source: ABdhPJzeZt3oyRf1fONm/rDD4wMgwjoCd2XXo7vIMovphxAYZOHaaDSk8P81JEflMM3U39FiJpCfGw==
X-Received: by 2002:a05:6402:3044:b0:41c:d4d4:8664 with SMTP id
 bs4-20020a056402304400b0041cd4d48664mr7404642edb.239.1649231504647; 
 Wed, 06 Apr 2022 00:51:44 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 bs7-20020a056402304700b004197e5d2350sm7376386edb.54.2022.04.06.00.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 00:51:44 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 05/16] dma-buf: add DMA_RESV_USAGE_KERNEL v3
Date: Wed,  6 Apr 2022 09:51:21 +0200
Message-Id: <20220406075132.3263-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220406075132.3263-1-christian.koenig@amd.com>
References: <20220406075132.3263-1-christian.koenig@amd.com>
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
Reply-To: DMA-resv@freedesktop.org
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

