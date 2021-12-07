Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D58E46BB5A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 13:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2023BEB026;
	Tue,  7 Dec 2021 12:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92DBEB05D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 12:34:45 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id i5so29206502wrb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 04:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8xnPj441s3TV1aGalpjXjgvASD5TAa8diNN8hPlUdR0=;
 b=NBTbgcXKEvJnvBHC86NYlS1DbKBh/zQdCG8wVjZ/vGNbPIMvL2PNtvcRZZcVm7dFve
 3DgV6rIK+O3aeo84+PZdGBsUQ6wzZ4j6ArffrMDekQArRYG9lKnRlQs4F0r6WbK1GrnD
 J1zM/TGUSg0xnxMUS0y0PfHK7NqlHSEfEPa8skvvXM2uHFumZsiOYFXz4+JGvpIZpMwI
 V4E4MclDTk1kMGFSrmUVuU7yb2GXk28WqMD/oiFMecVmt0OYPUlmbE+EqxJ8iQW7wFgE
 XihbY6Y6YCm59Sutsm2rF5njU7yNKKZ6ajdg0TjfiAtRfcOmK3EvknYbPG/KoXuFUjnI
 aGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8xnPj441s3TV1aGalpjXjgvASD5TAa8diNN8hPlUdR0=;
 b=0NJbDlurv1jG9A6vUYVUCzOsYor4NLvaTsagJ+T3C6ifMFW22PWwTJ7lzMLi2s2QcH
 WXlIFogx4EINW2O+6qQutNsh2gsCe7QE4Fuljv/5Oy4A4aaM2NaHrzZKPZMrhvi+JNYU
 KMTvlP25c676QSpbfYXWejjnFdKe0OlUHDEsMdJrDX29q7RwAsRjiqxjGuzNvQrw2CJm
 e/xmA3BgW2LxXi90jS0Gw1wGh0ZMC1t4NZ611wFOJxXr4OYF+V6m+nYSrTuINCxMrMe3
 QST5kqO45lUcR6aBai1LRouBzyrN6Lya48CCFE/efu5pPqWDZCchwOrf+jGn0nzEuvzl
 VkPQ==
X-Gm-Message-State: AOAM533R61wgtNnVyfBaCf1BiVqUtb7R/BDjP4RT2ejb80LzozgsXDEY
 E9T418aZUMnvSP+Lt0n5oCQ=
X-Google-Smtp-Source: ABdhPJwT0cWGy8UJdvpQukeww3M4QQk96uDi979XvpVbo+KKagNzSQ3OHtSCWMEidpPk5SEoB/73Gg==
X-Received: by 2002:adf:cc91:: with SMTP id p17mr51128860wrj.589.1638880484367; 
 Tue, 07 Dec 2021 04:34:44 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 04:34:44 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 24/24] drm/ttm: remove bo->moving
Date: Tue,  7 Dec 2021 13:34:11 +0100
Message-Id: <20211207123411.167006-25-christian.koenig@amd.com>
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

This is now handled by the DMA-buf framework in the dma_resv obj.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 13 ++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  7 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c    | 11 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   | 11 ++++--
 drivers/gpu/drm/ttm/ttm_bo.c                  | 10 ++----
 drivers/gpu/drm/ttm/ttm_bo_util.c             |  7 ----
 drivers/gpu/drm/ttm/ttm_bo_vm.c               | 34 +++++++------------
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c      |  6 ----
 include/drm/ttm/ttm_bo_api.h                  |  2 --
 9 files changed, 40 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index bbfd7a1e42e8..7bd39e5d36dd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -2330,6 +2330,8 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 		struct amdgpu_bo *bo = mem->bo;
 		uint32_t domain = mem->domain;
 		struct kfd_mem_attachment *attachment;
+		struct dma_resv_iter cursor;
+		struct dma_fence *fence;
 
 		total_size += amdgpu_bo_size(bo);
 
@@ -2344,10 +2346,13 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 				goto validate_map_fail;
 			}
 		}
-		ret = amdgpu_sync_fence(&sync_obj, bo->tbo.moving);
-		if (ret) {
-			pr_debug("Memory eviction: Sync BO fence failed. Try again\n");
-			goto validate_map_fail;
+		dma_resv_for_each_fence(&cursor, bo->tbo.base.resv,
+					DMA_RESV_USAGE_KERNEL, fence) {
+			ret = amdgpu_sync_fence(&sync_obj, fence);
+			if (ret) {
+				pr_debug("Memory eviction: Sync BO fence failed. Try again\n");
+				goto validate_map_fail;
+			}
 		}
 		list_for_each_entry(attachment, &mem->attachments, list) {
 			if (!attachment->is_mapped)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index a40ede9bccd0..3881a503a7bf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -608,9 +608,8 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
 		if (unlikely(r))
 			goto fail_unreserve;
 
-		amdgpu_bo_fence(bo, fence, false);
-		dma_fence_put(bo->tbo.moving);
-		bo->tbo.moving = dma_fence_get(fence);
+		dma_resv_add_fence(bo->tbo.base.resv, fence,
+				   DMA_RESV_USAGE_KERNEL);
 		dma_fence_put(fence);
 	}
 	if (!bp->resv)
@@ -1290,7 +1289,7 @@ void amdgpu_bo_release_notify(struct ttm_buffer_object *bo)
 
 	r = amdgpu_fill_buffer(abo, AMDGPU_POISON, bo->base.resv, &fence);
 	if (!WARN_ON(r)) {
-		amdgpu_bo_fence(abo, fence, false);
+		dma_resv_add_fence(bo->base.resv, fence, DMA_RESV_USAGE_KERNEL);
 		dma_fence_put(fence);
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
index e3fbf0f10add..31913ae86de6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
@@ -74,13 +74,12 @@ static int amdgpu_vm_cpu_update(struct amdgpu_vm_update_params *p,
 {
 	unsigned int i;
 	uint64_t value;
-	int r;
+	long r;
 
-	if (vmbo->bo.tbo.moving) {
-		r = dma_fence_wait(vmbo->bo.tbo.moving, true);
-		if (r)
-			return r;
-	}
+	r = dma_resv_wait_timeout(vmbo->bo.tbo.base.resv, DMA_RESV_USAGE_KERNEL,
+				  true, MAX_SCHEDULE_TIMEOUT);
+	if (r < 0)
+		return r;
 
 	pe += (unsigned long)amdgpu_bo_kptr(&vmbo->bo);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
index dbb551762805..bdb44cee19d3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -204,14 +204,19 @@ static int amdgpu_vm_sdma_update(struct amdgpu_vm_update_params *p,
 	struct amdgpu_bo *bo = &vmbo->bo;
 	enum amdgpu_ib_pool_type pool = p->immediate ? AMDGPU_IB_POOL_IMMEDIATE
 		: AMDGPU_IB_POOL_DELAYED;
+	struct dma_resv_iter cursor;
 	unsigned int i, ndw, nptes;
+	struct dma_fence *fence;
 	uint64_t *pte;
 	int r;
 
 	/* Wait for PD/PT moves to be completed */
-	r = amdgpu_sync_fence(&p->job->sync, bo->tbo.moving);
-	if (r)
-		return r;
+	dma_resv_for_each_fence(&cursor, bo->tbo.base.resv,
+				DMA_RESV_USAGE_KERNEL, fence) {
+		r = amdgpu_sync_fence(&p->job->sync, fence);
+		if (r)
+			return r;
+	}
 
 	do {
 		ndw = p->num_dw_left;
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index d3527d3f7b18..7b9e0f46f121 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -468,7 +468,6 @@ static void ttm_bo_release(struct kref *kref)
 	dma_resv_unlock(bo->base.resv);
 
 	atomic_dec(&ttm_glob.bo_count);
-	dma_fence_put(bo->moving);
 	bo->destroy(bo);
 }
 
@@ -737,9 +736,8 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 }
 
 /*
- * Add the last move fence to the BO and reserve a new shared slot. We only use
- * a shared slot to avoid unecessary sync and rely on the subsequent bo move to
- * either stall or use an exclusive fence respectively set bo->moving.
+ * Add the last move fence to the BO as kernel dependency and reserve a new
+ * fence slot.
  */
 static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
 				 struct ttm_resource_manager *man,
@@ -769,9 +767,6 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
 		dma_fence_put(fence);
 		return ret;
 	}
-
-	dma_fence_put(bo->moving);
-	bo->moving = fence;
 	return 0;
 }
 
@@ -978,7 +973,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
 	bo->bdev = bdev;
 	bo->type = type;
 	bo->page_alignment = page_alignment;
-	bo->moving = NULL;
 	bo->pin_count = 0;
 	bo->sg = sg;
 	if (resv) {
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index b9cfb62c4b6e..95de2691ee7c 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -229,7 +229,6 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 	atomic_inc(&ttm_glob.bo_count);
 	INIT_LIST_HEAD(&fbo->base.ddestroy);
 	INIT_LIST_HEAD(&fbo->base.lru);
-	fbo->base.moving = NULL;
 	drm_vma_node_reset(&fbo->base.base.vma_node);
 
 	kref_init(&fbo->base.kref);
@@ -496,9 +495,6 @@ static int ttm_bo_move_to_ghost(struct ttm_buffer_object *bo,
 	 * operation has completed.
 	 */
 
-	dma_fence_put(bo->moving);
-	bo->moving = dma_fence_get(fence);
-
 	ret = ttm_buffer_object_transfer(bo, &ghost_obj);
 	if (ret)
 		return ret;
@@ -543,9 +539,6 @@ static void ttm_bo_move_pipeline_evict(struct ttm_buffer_object *bo,
 	spin_unlock(&from->move_lock);
 
 	ttm_resource_free(bo, &bo->resource);
-
-	dma_fence_put(bo->moving);
-	bo->moving = dma_fence_get(fence);
 }
 
 int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 08ba083a80d2..5b324f245265 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -46,17 +46,13 @@
 static vm_fault_t ttm_bo_vm_fault_idle(struct ttm_buffer_object *bo,
 				struct vm_fault *vmf)
 {
-	vm_fault_t ret = 0;
-	int err = 0;
-
-	if (likely(!bo->moving))
-		goto out_unlock;
+	long err = 0;
 
 	/*
 	 * Quick non-stalling check for idle.
 	 */
-	if (dma_fence_is_signaled(bo->moving))
-		goto out_clear;
+	if (dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_KERNEL))
+		return 0;
 
 	/*
 	 * If possible, avoid waiting for GPU with mmap_lock
@@ -64,34 +60,30 @@ static vm_fault_t ttm_bo_vm_fault_idle(struct ttm_buffer_object *bo,
 	 * is the first attempt.
 	 */
 	if (fault_flag_allow_retry_first(vmf->flags)) {
-		ret = VM_FAULT_RETRY;
 		if (vmf->flags & FAULT_FLAG_RETRY_NOWAIT)
-			goto out_unlock;
+			return VM_FAULT_RETRY;
 
 		ttm_bo_get(bo);
 		mmap_read_unlock(vmf->vma->vm_mm);
-		(void) dma_fence_wait(bo->moving, true);
+		(void)dma_resv_wait_timeout(bo->base.resv,
+					    DMA_RESV_USAGE_KERNEL, true,
+					    MAX_SCHEDULE_TIMEOUT);
 		dma_resv_unlock(bo->base.resv);
 		ttm_bo_put(bo);
-		goto out_unlock;
+		return VM_FAULT_RETRY;
 	}
 
 	/*
 	 * Ordinary wait.
 	 */
-	err = dma_fence_wait(bo->moving, true);
-	if (unlikely(err != 0)) {
-		ret = (err != -ERESTARTSYS) ? VM_FAULT_SIGBUS :
+	err = dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_KERNEL, true,
+				    MAX_SCHEDULE_TIMEOUT);
+	if (unlikely(err < 0)) {
+		return (err != -ERESTARTSYS) ? VM_FAULT_SIGBUS :
 			VM_FAULT_NOPAGE;
-		goto out_unlock;
 	}
 
-out_clear:
-	dma_fence_put(bo->moving);
-	bo->moving = NULL;
-
-out_unlock:
-	return ret;
+	return 0;
 }
 
 static unsigned long ttm_bo_io_mem_pfn(struct ttm_buffer_object *bo,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index 9e3dcbb573e7..40cc2c13e963 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -1166,12 +1166,6 @@ int vmw_resources_clean(struct vmw_buffer_object *vbo, pgoff_t start,
 		*num_prefault = __KERNEL_DIV_ROUND_UP(last_cleaned - res_start,
 						      PAGE_SIZE);
 		vmw_bo_fence_single(bo, NULL);
-		if (bo->moving)
-			dma_fence_put(bo->moving);
-
-		return dma_resv_get_singleton(bo->base.resv,
-					      DMA_RESV_USAGE_KERNEL,
-					      &bo->moving);
 	}
 
 	return 0;
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index c17b2df9178b..4c7134550262 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -97,7 +97,6 @@ struct ttm_tt;
  * @lru: List head for the lru list.
  * @ddestroy: List head for the delayed destroy list.
  * @swap: List head for swap LRU list.
- * @moving: Fence set when BO is moving
  * @offset: The current GPU offset, which can have different meanings
  * depending on the memory type. For SYSTEM type memory, it should be 0.
  * @cur_placement: Hint of current placement.
@@ -150,7 +149,6 @@ struct ttm_buffer_object {
 	 * Members protected by a bo reservation.
 	 */
 
-	struct dma_fence *moving;
 	unsigned priority;
 	unsigned pin_count;
 
-- 
2.25.1

