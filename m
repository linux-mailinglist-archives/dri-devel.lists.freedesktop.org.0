Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 489934EABD6
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 13:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C307610EFFA;
	Tue, 29 Mar 2022 11:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9732110EFEF
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 11:02:57 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id a8so34205574ejc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 04:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OHWQffMXEbBw1bQ03MkdBXWEQE9uVI7Og6WzjxitRx8=;
 b=Ggs0AP+3vVngQ8jwPmX/YJgTuw55ni+PndmfqKAeNIkJLzlXq8GYrnLLFbwZGKjUWT
 Dg/p5YAG4KXadXdl6PiAD8aWt4kE3EKCeHhO8ZGm8E3k5hTJggpWNtalP0WvEwOrWnsp
 j3YX5pLqwuV0BL7ux8CRPTCJ0dIQoPttAC1WAPAupL5xPyx2meR8HnxDwkKviKX6QJK7
 vKWVZ1zHk8FEviXdrKvk6fEc0MwFiw/sdCXU7RppGAsfr+ewfp+ZW1hzyJ5jvbjLDVCk
 r4x34ej76SbQEvI2o2dKBTsBkW89nEd6Vhnke5u8K5PMLhtytosI3bsuDAAWJphp7DK4
 Mhsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OHWQffMXEbBw1bQ03MkdBXWEQE9uVI7Og6WzjxitRx8=;
 b=VXItr+Qbf/lSz6TlbBNQl+j+ktD3SlBtiFydznZM1hohJw0f8dVdvdcph8TofTI5Eb
 BwQlaO8O7z4ub7zpJynG2Q4w//Ack9kWL/aAd+oM+6RU1m8tontRduxnMnjyXn7g7WQF
 EHGjYPF7u9tNu6+nmSk8IOD0mAbJPFRxHiH/WI6d2T1Prdf5a0wDrukZ0LS2vcgMeKeW
 poASFkq7HCiO5zd/mYLbxd/pXqBaYOYjAEqxiA5mZxtl/OzVx1NXOg3KSd8j3NQhknzx
 Nc5bos5SImy6ODrxWwXaGOQchRncDQ9imW0rsf/L5LFuDBaRoCaC+ma+xKBKhtDRvXMU
 YRNA==
X-Gm-Message-State: AOAM530TJyH1X9xOgGEFAbUMAf7I8KVTSfrrluhQAClvjmw7R+QGeHoI
 7jdhfuXrgDP88LzTMCbXwXA=
X-Google-Smtp-Source: ABdhPJw0UuLLdcx7SQMD3dpk6cPolgXezlA3xcQV3UEW+QKzO2LUetmBjXy4U/n6pJXzcNKbFIy7Pw==
X-Received: by 2002:a17:907:1c0a:b0:6da:7ac4:5349 with SMTP id
 nc10-20020a1709071c0a00b006da7ac45349mr33630541ejc.596.1648551776022; 
 Tue, 29 Mar 2022 04:02:56 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a1709060f5400b006d6d54b9203sm6958402ejj.38.2022.03.29.04.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 04:02:55 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bob.beckett@collabora.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 06/11] drm/ttm: rename and cleanup ttm_bo_init_reserved
Date: Tue, 29 Mar 2022 13:02:38 +0200
Message-Id: <20220329110243.6335-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220329110243.6335-1-christian.koenig@amd.com>
References: <20220329110243.6335-1-christian.koenig@amd.com>
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

Rename ttm_bo_init_reserved to ttm_bo_init_validate since that better
matches what the function is actually doing.

Remove the unused size parameter, move the function's kerneldoc to the
implementation and cleanup the whole error handling.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  2 +-
 drivers/gpu/drm/drm_gem_vram_helper.c      |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |  5 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c       |  2 +-
 drivers/gpu/drm/qxl/qxl_object.c           |  2 +-
 drivers/gpu/drm/radeon/radeon_object.c     |  2 +-
 drivers/gpu/drm/ttm/ttm_bo.c               | 92 ++++++++++++++--------
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         | 12 ++-
 include/drm/ttm/ttm_bo_api.h               | 44 +----------
 9 files changed, 75 insertions(+), 88 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index ea0cde4904f0..4cb3afbdf6b9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -587,7 +587,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 	if (!bp->destroy)
 		bp->destroy = &amdgpu_bo_destroy;
 
-	r = ttm_bo_init_reserved(&adev->mman.bdev, &bo->tbo, size, bp->type,
+	r = ttm_bo_init_validate(&adev->mman.bdev, &bo->tbo, bp->type,
 				 &bo->placement, page_align, &ctx,  NULL,
 				 bp->resv, bp->destroy);
 	if (unlikely(r != 0))
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 0bd46a138ded..3e678d49265c 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -226,7 +226,7 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 	 * A failing ttm_bo_init will call ttm_buffer_object_destroy
 	 * to release gbo->bo.base and kfree gbo.
 	 */
-	ret = ttm_bo_init_reserved(bdev, &gbo->bo, size, ttm_bo_type_device,
+	ret = ttm_bo_init_validate(bdev, &gbo->bo, ttm_bo_type_device,
 				   &gbo->placement, pg_align, &ctx, NULL, NULL,
 				   ttm_buffer_object_destroy);
         if (ret)
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 6fc192082d8c..10d89bde7dd3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -1075,9 +1075,8 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	 * Similarly, in delayed_destroy, we can't call ttm_bo_put()
 	 * until successful initialization.
 	 */
-	ret = ttm_bo_init_reserved(&i915->bdev, i915_gem_to_ttm(obj), size,
-				   bo_type, &i915_sys_placement,
-				   page_size >> PAGE_SHIFT,
+	ret = ttm_bo_init_validate(&i915->bdev, i915_gem_to_ttm(obj), bo_type,
+				   &i915_sys_placement, page_size >> PAGE_SHIFT,
 				   &ctx, NULL, NULL, i915_ttm_bo_destroy);
 	if (ret)
 		return i915_ttm_err_to_gem(ret);
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index ceac591a7c01..43c862bbbbfb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -308,7 +308,7 @@ nouveau_bo_init(struct nouveau_bo *nvbo, u64 size, int align, u32 domain,
 	nouveau_bo_placement_set(nvbo, domain, 0);
 	INIT_LIST_HEAD(&nvbo->io_reserve_lru);
 
-	ret = ttm_bo_init_reserved(nvbo->bo.bdev, &nvbo->bo, size, type,
+	ret = ttm_bo_init_validate(nvbo->bo.bdev, &nvbo->bo, type,
 				   &nvbo->placement, align >> PAGE_SHIFT, &ctx,
 				   sg, robj, nouveau_bo_del_ttm);
 	if (ret) {
diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index fbb36e3e8564..e4dbce4afdd0 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -141,7 +141,7 @@ int qxl_bo_create(struct qxl_device *qdev, unsigned long size,
 	qxl_ttm_placement_from_domain(bo, domain);
 
 	bo->tbo.priority = priority;
-	r = ttm_bo_init_reserved(&qdev->mman.bdev, &bo->tbo, size, type,
+	r = ttm_bo_init_validate(&qdev->mman.bdev, &bo->tbo, type,
 				 &bo->placement, 0, &ctx, NULL, NULL,
 				 &qxl_ttm_bo_destroy);
 	if (unlikely(r != 0)) {
diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index 7afafbbc4ea0..9d255170b771 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -204,7 +204,7 @@ int radeon_bo_create(struct radeon_device *rdev,
 
 	radeon_ttm_placement_from_domain(bo, domain);
 	down_read(&rdev->pm.mclk_lock);
-	r = ttm_bo_init_reserved(&rdev->mman.bdev, &bo->tbo, size, type,
+	r = ttm_bo_init_validate(&rdev->mman.bdev, &bo->tbo, type,
 				 &bo->placement, page_align, &ctx, sg, resv,
 				 &radeon_ttm_bo_destroy);
         if (!r)
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 37f68e710247..b7e259245f82 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -917,37 +917,62 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 }
 EXPORT_SYMBOL(ttm_bo_validate);
 
-int ttm_bo_init_reserved(struct ttm_device *bdev,
-			 struct ttm_buffer_object *bo,
-			 size_t size,
-			 enum ttm_bo_type type,
-			 struct ttm_placement *placement,
-			 uint32_t page_alignment,
-			 struct ttm_operation_ctx *ctx,
-			 struct sg_table *sg,
-			 struct dma_resv *resv,
+/**
+ * ttm_bo_init_validate
+ *
+ * @bdev: Pointer to a ttm_device struct.
+ * @bo: Pointer to a ttm_buffer_object to be initialized.
+ * @type: Requested type of buffer object.
+ * @placement: Initial placement for buffer object.
+ * @alignment: Data alignment in pages.
+ * @ctx: TTM operation context for memory allocation.
+ * @sg: Scatter-gather table.
+ * @resv: Pointer to a dma_resv, or NULL to let ttm allocate one.
+ * @destroy: Destroy function. Use NULL for kfree().
+ *
+ * This function initializes a pre-allocated struct ttm_buffer_object.
+ * As this object may be part of a larger structure, this function,
+ * together with the @destroy function, enables driver-specific objects
+ * derived from a ttm_buffer_object.
+ *
+ * On successful return, the caller owns an object kref to @bo. The kref and
+ * list_kref are usually set to 1, but note that in some situations, other
+ * tasks may already be holding references to @bo as well.
+ * Furthermore, if resv == NULL, the buffer's reservation lock will be held,
+ * and it is the caller's responsibility to call ttm_bo_unreserve.
+ *
+ * If a failure occurs, the function will call the @destroy function. Thus,
+ * after a failure, dereferencing @bo is illegal and will likely cause memory
+ * corruption.
+ *
+ * Returns
+ * -ENOMEM: Out of memory.
+ * -EINVAL: Invalid placement flags.
+ * -ERESTARTSYS: Interrupted by signal while sleeping waiting for resources.
+ */
+int ttm_bo_init_validate(struct ttm_device *bdev, struct ttm_buffer_object *bo,
+			 enum ttm_bo_type type, struct ttm_placement *placement,
+			 uint32_t alignment, struct ttm_operation_ctx *ctx,
+			 struct sg_table *sg, struct dma_resv *resv,
 			 void (*destroy) (struct ttm_buffer_object *))
 {
 	static const struct ttm_place sys_mem = { .mem_type = TTM_PL_SYSTEM };
-	bool locked;
 	int ret;
 
-	bo->destroy = destroy;
 	kref_init(&bo->kref);
 	INIT_LIST_HEAD(&bo->ddestroy);
 	bo->bdev = bdev;
 	bo->type = type;
-	bo->page_alignment = page_alignment;
+	bo->page_alignment = alignment;
+	bo->destroy = destroy;
 	bo->moving = NULL;
 	bo->pin_count = 0;
 	bo->sg = sg;
 	bo->bulk_move = NULL;
-	if (resv) {
+	if (resv)
 		bo->base.resv = resv;
-		dma_resv_assert_held(bo->base.resv);
-	} else {
+	else
 		bo->base.resv = &bo->base._resv;
-	}
 	atomic_inc(&ttm_glob.bo_count);
 
 	ret = ttm_resource_alloc(bo, &sys_mem, &bo->resource);
@@ -960,33 +985,36 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
 	 * For ttm_bo_type_device buffers, allocate
 	 * address space from the device.
 	 */
-	if (bo->type == ttm_bo_type_device ||
-	    bo->type == ttm_bo_type_sg)
+	if (bo->type == ttm_bo_type_device || bo->type == ttm_bo_type_sg) {
 		ret = drm_vma_offset_add(bdev->vma_manager, &bo->base.vma_node,
-					 bo->resource->num_pages);
+					 PFN_UP(bo->base.size));
+		if (ret)
+			goto err_put;
+	}
 
 	/* passed reservation objects should already be locked,
 	 * since otherwise lockdep will be angered in radeon.
 	 */
-	if (!resv) {
-		locked = dma_resv_trylock(bo->base.resv);
-		WARN_ON(!locked);
-	}
+	if (!resv)
+		WARN_ON(!dma_resv_trylock(bo->base.resv));
+	else
+		dma_resv_assert_held(resv);
 
-	if (likely(!ret))
-		ret = ttm_bo_validate(bo, placement, ctx);
+	ret = ttm_bo_validate(bo, placement, ctx);
+	if (unlikely(ret))
+		goto err_unlock;
 
-	if (unlikely(ret)) {
-		if (!resv)
-			ttm_bo_unreserve(bo);
+	return 0;
 
-		ttm_bo_put(bo);
-		return ret;
-	}
+err_unlock:
+	if (!resv)
+		dma_resv_unlock(bo->base.resv);
 
+err_put:
+	ttm_bo_put(bo);
 	return ret;
 }
-EXPORT_SYMBOL(ttm_bo_init_reserved);
+EXPORT_SYMBOL(ttm_bo_init_validate);
 
 /*
  * buffer object vm functions.
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 60dcc6a75248..052a68408b85 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -414,9 +414,9 @@ int vmw_bo_create_kernel(struct vmw_private *dev_priv, unsigned long size,
 
 	drm_gem_private_object_init(vdev, &bo->base, size);
 
-	ret = ttm_bo_init_reserved(&dev_priv->bdev, bo, size,
-				   ttm_bo_type_kernel, placement, 0,
-				   &ctx, NULL, NULL, vmw_bo_default_destroy);
+	ret = ttm_bo_init_validate(&dev_priv->bdev, bo, ttm_bo_type_kernel,
+				   placement, 0, &ctx, NULL, NULL,
+				   vmw_bo_default_destroy);
 	if (unlikely(ret))
 		goto error_free;
 
@@ -498,10 +498,8 @@ int vmw_bo_init(struct vmw_private *dev_priv,
 	size = ALIGN(size, PAGE_SIZE);
 	drm_gem_private_object_init(vdev, &vmw_bo->base.base, size);
 
-	ret = ttm_bo_init_reserved(bdev, &vmw_bo->base, size,
-				   ttm_bo_type_device,
-				   placement,
-				   0, &ctx, NULL, NULL, bo_free);
+	ret = ttm_bo_init_validate(bdev, &vmw_bo->base, ttm_bo_type_device,
+				   placement, 0, &ctx, NULL, NULL, bo_free);
 	if (unlikely(ret)) {
 		return ret;
 	}
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 51fbbd035c11..4b3bb6cfca39 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -319,47 +319,9 @@ void ttm_bo_unlock_delayed_workqueue(struct ttm_device *bdev, int resched);
 bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
 			      const struct ttm_place *place);
 
-/**
- * ttm_bo_init_reserved
- *
- * @bdev: Pointer to a ttm_device struct.
- * @bo: Pointer to a ttm_buffer_object to be initialized.
- * @size: Requested size of buffer object.
- * @type: Requested type of buffer object.
- * @placement: Initial placement for buffer object.
- * @page_alignment: Data alignment in pages.
- * @ctx: TTM operation context for memory allocation.
- * @sg: Scatter-gather table.
- * @resv: Pointer to a dma_resv, or NULL to let ttm allocate one.
- * @destroy: Destroy function. Use NULL for kfree().
- *
- * This function initializes a pre-allocated struct ttm_buffer_object.
- * As this object may be part of a larger structure, this function,
- * together with the @destroy function,
- * enables driver-specific objects derived from a ttm_buffer_object.
- *
- * On successful return, the caller owns an object kref to @bo. The kref and
- * list_kref are usually set to 1, but note that in some situations, other
- * tasks may already be holding references to @bo as well.
- * Furthermore, if resv == NULL, the buffer's reservation lock will be held,
- * and it is the caller's responsibility to call ttm_bo_unreserve.
- *
- * If a failure occurs, the function will call the @destroy function, or
- * kfree() if @destroy is NULL. Thus, after a failure, dereferencing @bo is
- * illegal and will likely cause memory corruption.
- *
- * Returns
- * -ENOMEM: Out of memory.
- * -EINVAL: Invalid placement flags.
- * -ERESTARTSYS: Interrupted by signal while sleeping waiting for resources.
- */
-
-int ttm_bo_init_reserved(struct ttm_device *bdev,
-			 struct ttm_buffer_object *bo,
-			 size_t size, enum ttm_bo_type type,
-			 struct ttm_placement *placement,
-			 uint32_t page_alignment,
-			 struct ttm_operation_ctx *ctx,
+int ttm_bo_init_validate(struct ttm_device *bdev, struct ttm_buffer_object *bo,
+			 enum ttm_bo_type type, struct ttm_placement *placement,
+			 uint32_t alignment, struct ttm_operation_ctx *ctx,
 			 struct sg_table *sg, struct dma_resv *resv,
 			 void (*destroy) (struct ttm_buffer_object *));
 
-- 
2.25.1

