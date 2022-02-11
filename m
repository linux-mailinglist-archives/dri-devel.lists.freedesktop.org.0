Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3788E4B2656
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 13:50:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0161A10EBDF;
	Fri, 11 Feb 2022 12:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9913310EBC3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 12:50:24 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id cf2so16259422edb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 04:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=VWDPiq6CFCBa/MmhN1ZlQq+YVF//nJGScpkrI4j5/9A=;
 b=hZMC7Q3dAfP+xtO7VvtX4H/QHLsHR4JnMGURgy8VeaIgN12Q1T1278LdEXe+M+QnPK
 6khguFbO/oFQ6dz3NqYvixUxUmkXT0oNTbNpMZihuR6JrEMxWJdaRAtFHouVwStYs6vD
 BAwZzv7JYAlNoGHETagSSUTIgDaF34MMwysubUybCq/ITJDca7Gr9lNiJMiGtEj/9PpH
 uEkNO+51Fy6AgyutUe3HzxVZN2D28tnOt4yzuJY//D+/nO5sDZQgHpW7e5bj+e1SwZqe
 VeLcBnt3qdn/xNN+qrE4ykjtDR+6y6sVVVYCEZKVkmNrFX3pdM9Su3B5fYUXlxnOUJYb
 M6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VWDPiq6CFCBa/MmhN1ZlQq+YVF//nJGScpkrI4j5/9A=;
 b=jF2IVJcvUN1scIMAJruccYY6bF2BEjTdiTLFT19FEzCrQjSwNII/3evlq5Zi7tG+co
 AwVVEMC5/qWV+bSKNuOLSzl4+1S89/ETGdqalDSkG3vFLLqxuT+qgUnmrsiuLa/CE3Ed
 6/x2AeTMy5dJH/qII53y0bY6GesEMFFFQRygBIJds5gCJyZonqkOZtS/NtxpsTizgIpd
 MBwJEW9DEqR777Lq6EKf7OhfPnPrbGU/qyyoxtZLBf90kAgZV5FdOQHfkHBkMM8XZpZC
 xUyYQdVvqCYTSHNlmltp6ee9NGcHRcbgRfhOAXd+NrI+f4rV4u+NQIMAnN6aGGbZc80h
 AuHA==
X-Gm-Message-State: AOAM532WX9V1Up3bliHZdNsVz6tKMU5xM4U0I8gSBDW4fDXy2n3AoiUs
 +0CRK1Q1tWsHtSFSP4K/lZPKKLYupKQ=
X-Google-Smtp-Source: ABdhPJyL2tl3OkPR3H8Vg5Fm/j1Dk3nZi8OLY+4HnxxHNgzIkyAmTqR5tFghrVSUwN6kxRorfD2RBg==
X-Received: by 2002:a05:6402:5243:: with SMTP id
 t3mr1740138edd.260.1644583823173; 
 Fri, 11 Feb 2022 04:50:23 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id w22sm7868604ejc.137.2022.02.11.04.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 04:50:22 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 19/23] dma-buf: add DMA_RESV_USAGE_KERNEL
Date: Fri, 11 Feb 2022 13:49:59 +0100
Message-Id: <20220211125003.918447-20-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211125003.918447-1-christian.koenig@amd.com>
References: <20220211125003.918447-1-christian.koenig@amd.com>
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

Add an usage for kernel submissions. Waiting for those
are mandatory for dynamic DMA-bufs.

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
index 7b506eb96a65..f3e6ef53c08e 100644
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
index ae0436d7e7b8..543e25d5116a 100644
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
+         * Drivers *always* need to wait for those fences before accessing the
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

