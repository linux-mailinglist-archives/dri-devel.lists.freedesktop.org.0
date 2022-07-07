Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4A2569FAF
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 12:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F76714AB99;
	Thu,  7 Jul 2022 10:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F32E10FE19;
 Thu,  7 Jul 2022 10:24:58 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id v16so14202051wrd.13;
 Thu, 07 Jul 2022 03:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wqvyy3gK0N709qjmBtCXf3X97JMVbiLF+3XHj9gL8VI=;
 b=nXB5W7X5kJ7tstDB3ctMvPieeUUW2bHjWEO5zzy7lvFF0H5SFx0lV8A7rMQKZO0DR6
 IP9dBA+yHVETIcRY1UgqhxH28Kbp/MQFT3EOKdUP1VgpQKqDMf2BGWf05fuw5gJHZccp
 ZYb28uPUTZIO8QKR77ruoJ5tVAE2WmkIn3an8tib3adSKJ3mw5icekBBZae/YxYW+Gd+
 cZWz4FzqVaeXN+wMPR5ffAsUBkbVHqEa0QXWDBhpIEzfrE+7g/F+/9r6g4/gGHj1q49l
 JeB0CpARU2tE4qdcphIOfWx5aUpodxmk2pGptLQzK4ZEipAb4+XaMqJrHhaSacCQS701
 Akvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wqvyy3gK0N709qjmBtCXf3X97JMVbiLF+3XHj9gL8VI=;
 b=yGrMcIuvUh7qZ8YJivbqbGQTWi4lQ6dFbygzZ1CtXtKx7b8Mgw/elJ+br9PE1djbkA
 IYm2jUq3I/Z7Tr7lGlxuly7bPNp5S7OWNLRXdxjKgzaQqeTN40hnWrtu5RC6POa4B6EV
 7I8ADWCfiBgzQiwCrv3W6dsJn8rv1kn+bDWLfoolOivgQVGYIiV/jzjp4VmVDGxtjdRj
 pddfot7KwEok4rUvQozOrbOjELxRaeIU12i7aQtEHsWoal6i7tp1QSiwP88zUUjvMN9I
 +iEc6L/Wj423T+RU2dLL8DIUuTMF0ShBj4+CGunE9qz/DfS2J44U5q8XAnL27MGgfzQp
 j1Bg==
X-Gm-Message-State: AJIora8n8MKtkRaadQdmce0KPZKn3iJ9PcOkQd6uvdFLDeThVZ3mo3gl
 9OH5vi0bNyZdS7148vz+SBkoLo+JLsY=
X-Google-Smtp-Source: AGRyM1vK3KZR1wjFSkgq2uQXTqxofFWdYeFFbGsgNuVAUVL0+vQeJVJBxTHgVUP8RuAda0hbYATdFw==
X-Received: by 2002:a05:6000:2cf:b0:21b:a920:182c with SMTP id
 o15-20020a05600002cf00b0021ba920182cmr43117851wry.317.1657189496708; 
 Thu, 07 Jul 2022 03:24:56 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a05600c4e4a00b00397402ae674sm20091950wmq.11.2022.07.07.03.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 03:24:56 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/6] drm/ttm: rename and cleanup ttm_bo_init_reserved
Date: Thu,  7 Jul 2022 12:24:48 +0200
Message-Id: <20220707102453.3633-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707102453.3633-1-christian.koenig@amd.com>
References: <20220707102453.3633-1-christian.koenig@amd.com>
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
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |   2 +-
 drivers/gpu/drm/drm_gem_vram_helper.c      |   6 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c    |   5 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c       |   6 +-
 drivers/gpu/drm/qxl/qxl_object.c           |   2 +-
 drivers/gpu/drm/radeon/radeon_object.c     |   6 +-
 drivers/gpu/drm/ttm/ttm_bo.c               | 147 +++++++++++++++------
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         |  12 +-
 include/drm/ttm/ttm_bo_api.h               |  93 ++-----------
 9 files changed, 129 insertions(+), 150 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 2c82b1d5a0d7..d9cfe259f2a9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -591,7 +591,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 	if (!bp->destroy)
 		bp->destroy = &amdgpu_bo_destroy;
 
-	r = ttm_bo_init_reserved(&adev->mman.bdev, &bo->tbo, size, bp->type,
+	r = ttm_bo_init_reserved(&adev->mman.bdev, &bo->tbo, bp->type,
 				 &bo->placement, page_align, &ctx,  NULL,
 				 bp->resv, bp->destroy);
 	if (unlikely(r != 0))
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index d607043716d3..125160b534be 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -226,9 +226,9 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
 	 * A failing ttm_bo_init will call ttm_buffer_object_destroy
 	 * to release gbo->bo.base and kfree gbo.
 	 */
-	ret = ttm_bo_init(bdev, &gbo->bo, size, ttm_bo_type_device,
-			  &gbo->placement, pg_align, false, NULL, NULL,
-			  ttm_buffer_object_destroy);
+	ret = ttm_bo_init_validate(bdev, &gbo->bo, ttm_bo_type_device,
+				   &gbo->placement, pg_align, false, NULL, NULL,
+				   ttm_buffer_object_destroy);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 4c25d9b2f138..70e2ed4e99df 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -1229,9 +1229,8 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	 * Similarly, in delayed_destroy, we can't call ttm_bo_put()
 	 * until successful initialization.
 	 */
-	ret = ttm_bo_init_reserved(&i915->bdev, i915_gem_to_ttm(obj), size,
-				   bo_type, &i915_sys_placement,
-				   page_size >> PAGE_SHIFT,
+	ret = ttm_bo_init_reserved(&i915->bdev, i915_gem_to_ttm(obj), bo_type,
+				   &i915_sys_placement, page_size >> PAGE_SHIFT,
 				   &ctx, NULL, NULL, i915_ttm_bo_destroy);
 	if (ret)
 		return i915_ttm_err_to_gem(ret);
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 05076e530e7d..92cd19021084 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -307,9 +307,9 @@ nouveau_bo_init(struct nouveau_bo *nvbo, u64 size, int align, u32 domain,
 	nouveau_bo_placement_set(nvbo, domain, 0);
 	INIT_LIST_HEAD(&nvbo->io_reserve_lru);
 
-	ret = ttm_bo_init(nvbo->bo.bdev, &nvbo->bo, size, type,
-			  &nvbo->placement, align >> PAGE_SHIFT, false, sg,
-			  robj, nouveau_bo_del_ttm);
+	ret = ttm_bo_init_validate(nvbo->bo.bdev, &nvbo->bo, type,
+				   &nvbo->placement, align >> PAGE_SHIFT, false,
+				   sg, robj, nouveau_bo_del_ttm);
 	if (ret) {
 		/* ttm will call nouveau_bo_del_ttm if it fails.. */
 		return ret;
diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index b42a657e4c2f..695d9308d1f0 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -141,7 +141,7 @@ int qxl_bo_create(struct qxl_device *qdev, unsigned long size,
 	qxl_ttm_placement_from_domain(bo, domain);
 
 	bo->tbo.priority = priority;
-	r = ttm_bo_init_reserved(&qdev->mman.bdev, &bo->tbo, size, type,
+	r = ttm_bo_init_reserved(&qdev->mman.bdev, &bo->tbo, type,
 				 &bo->placement, 0, &ctx, NULL, NULL,
 				 &qxl_ttm_bo_destroy);
 	if (unlikely(r != 0)) {
diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index 6c4a6802ca96..00c33b24d5d3 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -202,9 +202,9 @@ int radeon_bo_create(struct radeon_device *rdev,
 	radeon_ttm_placement_from_domain(bo, domain);
 	/* Kernel allocation are uninterruptible */
 	down_read(&rdev->pm.mclk_lock);
-	r = ttm_bo_init(&rdev->mman.bdev, &bo->tbo, size, type,
-			&bo->placement, page_align, !kernel, sg, resv,
-			&radeon_ttm_bo_destroy);
+	r = ttm_bo_init_validate(&rdev->mman.bdev, &bo->tbo, type,
+				 &bo->placement, page_align, !kernel, sg, resv,
+				 &radeon_ttm_bo_destroy);
 	up_read(&rdev->pm.mclk_lock);
 	if (unlikely(r != 0)) {
 		return r;
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 0e210df65c30..984535d6a2d0 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -921,36 +921,61 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
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
+int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
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
@@ -963,50 +988,84 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
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
 EXPORT_SYMBOL(ttm_bo_init_reserved);
 
-int ttm_bo_init(struct ttm_device *bdev,
-		struct ttm_buffer_object *bo,
-		size_t size,
-		enum ttm_bo_type type,
-		struct ttm_placement *placement,
-		uint32_t page_alignment,
-		bool interruptible,
-		struct sg_table *sg,
-		struct dma_resv *resv,
-		void (*destroy) (struct ttm_buffer_object *))
+/**
+ * ttm_bo_init_validate
+ *
+ * @bdev: Pointer to a ttm_device struct.
+ * @bo: Pointer to a ttm_buffer_object to be initialized.
+ * @type: Requested type of buffer object.
+ * @placement: Initial placement for buffer object.
+ * @alignment: Data alignment in pages.
+ * @interruptible: If needing to sleep to wait for GPU resources,
+ * sleep interruptible.
+ * pinned in physical memory. If this behaviour is not desired, this member
+ * holds a pointer to a persistent shmem object. Typically, this would
+ * point to the shmem object backing a GEM object if TTM is used to back a
+ * GEM user interface.
+ * @sg: Scatter-gather table.
+ * @resv: Pointer to a dma_resv, or NULL to let ttm allocate one.
+ * @destroy: Destroy function. Use NULL for kfree().
+ *
+ * This function initializes a pre-allocated struct ttm_buffer_object.
+ * As this object may be part of a larger structure, this function,
+ * together with the @destroy function,
+ * enables driver-specific objects derived from a ttm_buffer_object.
+ *
+ * On successful return, the caller owns an object kref to @bo. The kref and
+ * list_kref are usually set to 1, but note that in some situations, other
+ * tasks may already be holding references to @bo as well.
+ *
+ * If a failure occurs, the function will call the @destroy function, Thus,
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
+			 uint32_t alignment, bool interruptible,
+			 struct sg_table *sg, struct dma_resv *resv,
+			 void (*destroy) (struct ttm_buffer_object *))
 {
 	struct ttm_operation_ctx ctx = { interruptible, false };
 	int ret;
 
-	ret = ttm_bo_init_reserved(bdev, bo, size, type, placement,
-				   page_alignment, &ctx, sg, resv, destroy);
+	ret = ttm_bo_init_reserved(bdev, bo, type, placement, alignment, &ctx,
+				   sg, resv, destroy);
 	if (ret)
 		return ret;
 
@@ -1015,7 +1074,7 @@ int ttm_bo_init(struct ttm_device *bdev,
 
 	return 0;
 }
-EXPORT_SYMBOL(ttm_bo_init);
+EXPORT_SYMBOL(ttm_bo_init_validate);
 
 /*
  * buffer object vm functions.
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 85a66014c2b6..eb2fd7694cd1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -429,9 +429,9 @@ int vmw_bo_create_kernel(struct vmw_private *dev_priv, unsigned long size,
 
 	drm_gem_private_object_init(vdev, &bo->base, size);
 
-	ret = ttm_bo_init_reserved(&dev_priv->bdev, bo, size,
-				   ttm_bo_type_kernel, placement, 0,
-				   &ctx, NULL, NULL, vmw_bo_default_destroy);
+	ret = ttm_bo_init_reserved(&dev_priv->bdev, bo, ttm_bo_type_kernel,
+				   placement, 0, &ctx, NULL, NULL,
+				   vmw_bo_default_destroy);
 	if (unlikely(ret))
 		goto error_free;
 
@@ -512,10 +512,8 @@ int vmw_bo_init(struct vmw_private *dev_priv,
 	size = ALIGN(size, PAGE_SIZE);
 	drm_gem_private_object_init(vdev, &vmw_bo->base.base, size);
 
-	ret = ttm_bo_init_reserved(bdev, &vmw_bo->base, size,
-				   ttm_bo_type_device,
-				   placement,
-				   0, &ctx, NULL, NULL, bo_free);
+	ret = ttm_bo_init_reserved(bdev, &vmw_bo->base, ttm_bo_type_device,
+				   placement, 0, &ctx, NULL, NULL, bo_free);
 	if (unlikely(ret)) {
 		return ret;
 	}
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 2d524f8b0802..44a538ee5e2a 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -317,93 +317,16 @@ void ttm_bo_unlock_delayed_workqueue(struct ttm_device *bdev, int resched);
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
+int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
+			 enum ttm_bo_type type, struct ttm_placement *placement,
+			 uint32_t alignment, struct ttm_operation_ctx *ctx,
+			 struct sg_table *sg, struct dma_resv *resv,
+			 void (*destroy) (struct ttm_buffer_object *));
+int ttm_bo_init_validate(struct ttm_device *bdev, struct ttm_buffer_object *bo,
+			 enum ttm_bo_type type, struct ttm_placement *placement,
+			 uint32_t alignment, bool interruptible,
 			 struct sg_table *sg, struct dma_resv *resv,
 			 void (*destroy) (struct ttm_buffer_object *));
-
-/**
- * ttm_bo_init
- *
- * @bdev: Pointer to a ttm_device struct.
- * @bo: Pointer to a ttm_buffer_object to be initialized.
- * @size: Requested size of buffer object.
- * @type: Requested type of buffer object.
- * @placement: Initial placement for buffer object.
- * @page_alignment: Data alignment in pages.
- * @interruptible: If needing to sleep to wait for GPU resources,
- * sleep interruptible.
- * pinned in physical memory. If this behaviour is not desired, this member
- * holds a pointer to a persistent shmem object. Typically, this would
- * point to the shmem object backing a GEM object if TTM is used to back a
- * GEM user interface.
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
-int ttm_bo_init(struct ttm_device *bdev, struct ttm_buffer_object *bo,
-		size_t size, enum ttm_bo_type type,
-		struct ttm_placement *placement,
-		uint32_t page_alignment, bool interrubtible,
-		struct sg_table *sg, struct dma_resv *resv,
-		void (*destroy) (struct ttm_buffer_object *));
 
 /**
  * ttm_kmap_obj_virtual
-- 
2.25.1

