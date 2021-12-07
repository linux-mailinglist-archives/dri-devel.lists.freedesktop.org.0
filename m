Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF8646BB55
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 13:35:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612DFEB069;
	Tue,  7 Dec 2021 12:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70453EB00E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 12:34:40 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso2110391wmr.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 04:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+4HXC95y/d0j7sepYGRx+5Mc5uOBoY08wOs9UrZMne0=;
 b=cRk+8Sczl131qUGv+2RcYAPOmDlgxpsGJ5WlMd008CoqkRStxnVrKwF27sgIJfmyHP
 b9+yU7T2f/pnh2sJmAvlVtp8WBtW5X2qBD9Fy6lq6/Q9zaO1/YeRVlMTbNQYg4mfjPp7
 KXwSnk63ysTCsRC/9PRpOUceDmBKjimYgGUzcl3dLu6uEyYADls098yGH/C0S4JXRf+h
 gJMEdCjeY7gI3DXB4nGmZNxTZHVQCpvfULovSFVUnLALaUvKeg7odiG63GeZXi76wvuk
 CNqc27IrdIs5DaT/k/LPccMZiNwwZwHRCXGV6eHDkTFLYFBnSqlQwKDT8l+JbotxOoS3
 ntRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+4HXC95y/d0j7sepYGRx+5Mc5uOBoY08wOs9UrZMne0=;
 b=ckboy5VVnLguy+NbMLg/0v3evv0PyAteK3Lv9YBRGAfwA8rALXMSV8nVODaK2H6J6f
 sfGqd3IN0te1d0tLIX4XpBHAVZn5KE74Z7W5Nhh+PN8zR5aCeRD3N+1rLb9phQrzxAMj
 RNJtyuGlEqwnfEVx7+T05KWHEPA4rfgRwQNXrusHTXEYPrAGLLUcxj51XX3HsY3hQLZm
 5VoBZOM5Goxc+fh3HFWAtD1jRh+k6qk9IAvO/rPRkpsr4JMjRfYmUCNmRFRvSydjMZCG
 FGHHN9YTjLGwxAuAogthx/rnnIR5LgyQe80sFrPiJYREQWPhRxIdOsFv8klS/L4BgQZN
 88Iw==
X-Gm-Message-State: AOAM531fX2ceLpCzjBzgPlItpOpLZ2XS4qioE4B9n7TUuxZVc0qniITZ
 yTBmOTciMhI/2sfs4G3ZqV4=
X-Google-Smtp-Source: ABdhPJziRGTqN+tn2ljVhaHUDiBG1+onDlzsEMetEN5GlgEDbwZg92ALeB4Ul15gdPTj+M3ZZhYyRQ==
X-Received: by 2002:a05:600c:4e8f:: with SMTP id
 f15mr6816431wmq.76.1638880478842; 
 Tue, 07 Dec 2021 04:34:38 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 04:34:38 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 20/24] dma-buf: add DMA_RESV_USAGE_KERNEL
Date: Tue,  7 Dec 2021 13:34:07 +0100
Message-Id: <20211207123411.167006-21-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207123411.167006-1-christian.koenig@amd.com>
References: <20211207123411.167006-1-christian.koenig@amd.com>
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
index eaa19154551c..a40ede9bccd0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -764,7 +764,7 @@ int amdgpu_bo_kmap(struct amdgpu_bo *bo, void **ptr)
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
index 2d77e469ef3c..a2f627af3ce2 100644
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
index e70fb65bb54f..b9281ca96ece 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_clflush.c
@@ -109,7 +109,7 @@ bool i915_gem_clflush_object(struct drm_i915_gem_object *obj,
 						i915_fence_timeout(to_i915(obj->base.dev)),
 						I915_FENCE_GFP);
 		dma_resv_add_fence(obj->base.resv, &clflush->base.dma,
-				   DMA_RESV_USAGE_WRITE);
+				   DMA_RESV_USAGE_KERNEL);
 		dma_fence_work_commit(&clflush->base);
 	} else if (obj->mm.pages) {
 		__do_clflush(obj);
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
index f52b451e26dc..ad83f42fc9ee 100644
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
index e56e16a7f886..b9cfb62c4b6e 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -504,7 +504,7 @@ static int ttm_bo_move_to_ghost(struct ttm_buffer_object *bo,
 		return ret;
 
 	dma_resv_add_fence(&ghost_obj->base._resv, fence,
-			   DMA_RESV_USAGE_WRITE);
+			   DMA_RESV_USAGE_KERNEL);
 
 	/**
 	 * If we're not moving to fixed memory, the TTM object
@@ -559,7 +559,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
 	struct ttm_resource_manager *man = ttm_manager_type(bdev, new_mem->mem_type);
 	int ret = 0;
 
-	dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_WRITE);
+	dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_KERNEL);
 	if (!evict)
 		ret = ttm_bo_move_to_ghost(bo, fence, man->use_tt);
 	else if (!from->use_tt && pipeline)
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index a77921a44a72..f871ddb62606 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -1065,7 +1065,7 @@ void vmw_bo_fence_single(struct ttm_buffer_object *bo,
 	ret = dma_resv_reserve_fences(bo->base.resv, 1);
 	if (!ret)
 		dma_resv_add_fence(bo->base.resv, &fence->base,
-				   DMA_RESV_USAGE_WRITE);
+				   DMA_RESV_USAGE_KERNEL);
 	else
 		/* Last resort fallback when we are OOM */
 		dma_fence_wait(&fence->base, false);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index 29452e150424..9e3dcbb573e7 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -1170,7 +1170,7 @@ int vmw_resources_clean(struct vmw_buffer_object *vbo, pgoff_t start,
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
index 4f3a6abf43c4..29d799991496 100644
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

