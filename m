Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DE14E28E6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDBDE10E453;
	Mon, 21 Mar 2022 13:59:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 267D910E47A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 13:59:18 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id m30so10985688wrb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 06:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5i3nkn3lJvmnHomykwoAJWwCL9Ph5f3BP7WRF4+Oth4=;
 b=CBRBzA4AzMqCR/BSgZGhfK7ZcufmRbufBAR5KaxCYHpjsNsnVX23VFB/2iRdXR+Sc9
 oWVvjve0XecMjzhMRMtluCJPPNlU1JNPfqgqVzL+N2XmzBkL/lIF09FlAoKpHnIA9ZAX
 yAMAJ4HgptKqDlAxqcBOWjzSxTkPYUfol3YgPWqVMVAjFwgjYTM/X4Wckgf7EsfgfRJ9
 CHVDBTehgdOda3kXP916wQk0zLBU8II5OTEnkajbyAbSdHY9AODmHagz8qi4zhEvO/PU
 1AzN7JXuxma3W6k1MdMO5rqaG6Zv3oZxXE3SAwL9zcs+x5r1WW5GM6qxxz2vJFvhs4ux
 l0ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5i3nkn3lJvmnHomykwoAJWwCL9Ph5f3BP7WRF4+Oth4=;
 b=U0/YZtG3HkXj0Nvjf+nntlAAqUBX9/Xq8xRPvgYZNPqUNWrhNSOLQ7MdxjPFTtBXOV
 zqcso7JHbt2/toE3OYZarqcdhJ0OlDJb/ZIitv3FpW+Y7Gg8+pqYMJ/YI87mBQPgMTbn
 H1ZXTS8GeWtTZ8DwNamBXrn8QBbHRTYwpZ0RRps9zUR/N/NeNP2UFgYl9slVcE4fdawA
 1mHHWv8UH2KBN7eVgRwy1TPJncEBHB8P6AowOVGXFzbjqCEHDMd9GLBUS+0lWyN5U776
 NkWy6tiOL9JjNYzJtOh6Qrr9YHdeF8+zStYMfmr1d8gwxV+yp+x/st7VJg1dK4gXWKIj
 sUmA==
X-Gm-Message-State: AOAM531Zm6Jel/2EaOU4s/3QW9QuIjZAkoBo49Ps2tNJaO1lRYzzQC3p
 CsjY++cftrP3YUQfeKcRsoDRnfx+/to=
X-Google-Smtp-Source: ABdhPJzvIJfgAMspIIXAMq7V65aAxx+pleDny9QsfVfZi9b5UghDB1tY2H5cKUQxCmb19JtJbWEPuw==
X-Received: by 2002:adf:e444:0:b0:203:d6f4:3cc4 with SMTP id
 t4-20020adfe444000000b00203d6f43cc4mr18511421wrm.493.1647871156689; 
 Mon, 21 Mar 2022 06:59:16 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6243000000b001e33760776fsm13317640wrv.10.2022.03.21.06.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 06:59:16 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 19/23] dma-buf: add DMA_RESV_USAGE_KERNEL v2
Date: Mon, 21 Mar 2022 14:58:52 +0100
Message-Id: <20220321135856.1331-19-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321135856.1331-1-christian.koenig@amd.com>
References: <20220321135856.1331-1-christian.koenig@amd.com>
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

Add an usage for kernel submissions. Waiting for those
are mandatory for dynamic DMA-bufs.

v2: use "must" in documentation, fix whitespaces

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/st-dma-resv.c                |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c      |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  6 ++++--
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c  |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c         |  4 ++--
 drivers/gpu/drm/radeon/radeon_uvd.c          |  2 +-
 drivers/gpu/drm/ttm/ttm_bo.c                 |  2 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c            |  4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c           |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c     |  2 +-
 drivers/infiniband/core/umem_dmabuf.c        |  2 +-
 include/linux/dma-resv.h                     | 22 ++++++++++++++++++++
 13 files changed, 39 insertions(+), 15 deletions(-)

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
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 9085a6b1ad56..1618b6847c69 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -765,7 +765,7 @@ int amdgpu_bo_kmap(struct amdgpu_bo *bo, void **ptr)
 		return 0;
 	}
 
-	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_WRITE,
+	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_KERNEL,
 				  false, MAX_SCHEDULE_TIMEOUT);
 	if (r < 0)
 		return r;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
index 33deb0df62fd..9e102080dad9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@ -1163,7 +1163,7 @@ static int amdgpu_uvd_send_msg(struct amdgpu_ring *ring, struct amdgpu_bo *bo,
 
 	if (direct) {
 		r = dma_resv_wait_timeout(bo->tbo.base.resv,
-					  DMA_RESV_USAGE_WRITE, false,
+					  DMA_RESV_USAGE_KERNEL, false,
 					  msecs_to_jiffies(10));
 		if (r == 0)
 			r = -ETIMEDOUT;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 0cc036d93afc..ab5249d55b32 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -185,9 +185,11 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
 			return ret;
 
 		if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT)
-			continue;
+			usage = DMA_RESV_USAGE_KERNEL;
+		else
+			usage = dma_resv_usage_rw(bo->flags &
+						  ETNA_SUBMIT_BO_WRITE);
 
-		usage = dma_resv_usage_rw(bo->flags & ETNA_SUBMIT_BO_WRITE);
 		ret = dma_resv_get_fences(robj, usage, &bo->nr_shared,
 					  &bo->shared);
 		if (ret)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
index 887cb6b71ae4..9a7104251cb3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
@@ -115,7 +115,7 @@ bool i915_gem_clflush_object(struct drm_i915_gem_object *obj,
 						i915_fence_timeout(i915),
 						I915_FENCE_GFP);
 		dma_resv_add_fence(obj->base.resv, &clflush->base.dma,
-				   DMA_RESV_USAGE_WRITE);
+				   DMA_RESV_USAGE_KERNEL);
 		dma_fence_work_commit(&clflush->base);
 		/*
 		 * We must have successfully populated the pages(since we are
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 05076e530e7d..13deb6c70ba6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -962,10 +962,10 @@ nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo,
 	struct dma_fence *fence;
 	int ret;
 
-	ret = dma_resv_get_singleton(bo->base.resv, DMA_RESV_USAGE_WRITE,
+	ret = dma_resv_get_singleton(bo->base.resv, DMA_RESV_USAGE_KERNEL,
 				     &fence);
 	if (ret)
-		dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_WRITE,
+		dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_KERNEL,
 				      false, MAX_SCHEDULE_TIMEOUT);
 
 	nv10_bo_put_tile_region(dev, *old_tile, fence);
diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
index 4000ad2f39ba..488e78889dd6 100644
--- a/drivers/gpu/drm/radeon/radeon_uvd.c
+++ b/drivers/gpu/drm/radeon/radeon_uvd.c
@@ -478,7 +478,7 @@ static int radeon_uvd_cs_msg(struct radeon_cs_parser *p, struct radeon_bo *bo,
 		return -EINVAL;
 	}
 
-	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_WRITE,
+	r = dma_resv_wait_timeout(bo->tbo.base.resv, DMA_RESV_USAGE_KERNEL,
 				  false, MAX_SCHEDULE_TIMEOUT);
 	if (r <= 0) {
 		DRM_ERROR("Failed waiting for UVD message (%d)!\n", r);
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 6014c363d6e6..0f0aa96fb051 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -762,7 +762,7 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
 		return ret;
 	}
 
-	dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_WRITE);
+	dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_KERNEL);
 
 	ret = dma_resv_reserve_fences(bo->base.resv, 1);
 	if (unlikely(ret)) {
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 49689c7c8078..98e1c804519e 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -509,7 +509,7 @@ static int ttm_bo_move_to_ghost(struct ttm_buffer_object *bo,
 		return ret;
 
 	dma_resv_add_fence(&ghost_obj->base._resv, fence,
-			   DMA_RESV_USAGE_WRITE);
+			   DMA_RESV_USAGE_KERNEL);
 
 	/**
 	 * If we're not moving to fixed memory, the TTM object
@@ -563,7 +563,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
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
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index 39081dbf9ac8..f999fdd927df 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -1167,7 +1167,7 @@ int vmw_resources_clean(struct vmw_buffer_object *vbo, pgoff_t start,
 			dma_fence_put(bo->moving);
 
 		return dma_resv_get_singleton(bo->base.resv,
-					      DMA_RESV_USAGE_WRITE,
+					      DMA_RESV_USAGE_KERNEL,
 					      &bo->moving);
 	}
 
diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
index f9901d273b8e..fce80a4a5147 100644
--- a/drivers/infiniband/core/umem_dmabuf.c
+++ b/drivers/infiniband/core/umem_dmabuf.c
@@ -68,7 +68,7 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
 	 * the migration.
 	 */
 	return dma_resv_wait_timeout(umem_dmabuf->attach->dmabuf->resv,
-				     DMA_RESV_USAGE_WRITE,
+				     DMA_RESV_USAGE_KERNEL,
 				     false, MAX_SCHEDULE_TIMEOUT);
 }
 EXPORT_SYMBOL(ib_umem_dmabuf_map_pages);
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index ae0436d7e7b8..8f4f406a5d02 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -54,8 +54,30 @@ struct dma_resv_list;
  *
  * This enum describes the different use cases for a dma_resv object and
  * controls which fences are returned when queried.
+ *
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

