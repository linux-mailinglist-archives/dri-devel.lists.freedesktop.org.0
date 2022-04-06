Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B374F56F3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 09:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29EB10F39C;
	Wed,  6 Apr 2022 07:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE1710F39C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 07:51:58 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id r10so1626114eda.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 00:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references:reply-to
 :mime-version:content-transfer-encoding;
 bh=Lj/kKwdAT4pbbODcxQvu3ufEgmPGrjJekojW70mK5lg=;
 b=KOdnKUUAxmIwkgzF2eLoR8IUJcgTPXrF7WjovZ66GA6WPagimBfeyBIkswSgEU8uDp
 HhY043ec3uDBl4iDGms7mv/w3jIksKyLTeWtkjJZ7Ls5BF5UG/tU1Q0L1iPew7e+JKlj
 FHtaOqujLllUVYm2sqR7pEtMxoA2EVyX0q3/VOfrwBT3AnSAaHmDc+fzr8M+glmSV9Bj
 RekaSh7NjPGvirahxtktitaVukxyu6Q4t2kNrNvgEQHzX8Fer1TLxq1KoCq/ceclybcJ
 tgoiGe4lzvqQ7IKnXHqUkL2GNDLEZTprC9AYEpzKeJdpfO5DISN2APho68X+7zLr0N/k
 x2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:reply-to:mime-version:content-transfer-encoding;
 bh=Lj/kKwdAT4pbbODcxQvu3ufEgmPGrjJekojW70mK5lg=;
 b=G/WEfYBbUu13QWQ90XchrlvSBCUFFklHSPdgBhXTAwvDGSTqdkYy25lfgWmsPgIxsd
 GhmLs/F8PNTYSjv+k5N86rfFusw9pt4DZ2/5YiOq5BSsTOrQc7VuW/owmt0veWjCtTw3
 PWGNNAxYRgwKsEHrpKrk6TO0UeKlGQBS9B4NqLLXWa2SXPfLoQWRR1e11CqHVdkM2wM5
 WS6N4l0rle4eDXNZbvUrpfYtdrNVtGsfHTxeTlNXN0h0GULohjB7LjPdQ6ZKlWKVvyhC
 8OP6NiBii9UYF0V/Pe3aiR90k3vQk8iHL1HMM0TCnSd0BbFNDbk2Ny3uhQjW/KW+Uo/0
 ciDA==
X-Gm-Message-State: AOAM533DjNbyHTM5+5luEMnX83fvLBR2h1toAD6ooJKnnplCVvLpj4BC
 YKUE7fSBJNivpyi7nttYBeY=
X-Google-Smtp-Source: ABdhPJz1EcQN/0SGF1fN1zK8HsHtC7uiV10uh+sXVoWWcRSfYzMU708NVmZSTspOP4/aFz/Agu0/gQ==
X-Received: by 2002:aa7:cd08:0:b0:41c:d542:2cd2 with SMTP id
 b8-20020aa7cd08000000b0041cd5422cd2mr7476411edw.248.1649231517261; 
 Wed, 06 Apr 2022 00:51:57 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 bs7-20020a056402304700b004197e5d2350sm7376386edb.54.2022.04.06.00.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 00:51:56 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 15/16] drm/ttm: remove bo->moving
Date: Wed,  6 Apr 2022 09:51:31 +0200
Message-Id: <20220406075132.3263-16-christian.koenig@amd.com>
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

This is now handled by the DMA-buf framework in the dma_resv obj.

Also remove the workaround inside VMWGFX to update the moving fence.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 13 ++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  5 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c    | 11 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   | 11 ++++--
 drivers/gpu/drm/ttm/ttm_bo.c                  | 10 ++----
 drivers/gpu/drm/ttm/ttm_bo_util.c             |  7 ----
 drivers/gpu/drm/ttm/ttm_bo_vm.c               | 34 +++++++------------
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c      |  6 ----
 include/drm/ttm/ttm_bo_api.h                  |  2 --
 9 files changed, 39 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 808e21dcb517..a4955ef76cfc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -2447,6 +2447,8 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 		struct amdgpu_bo *bo = mem->bo;
 		uint32_t domain = mem->domain;
 		struct kfd_mem_attachment *attachment;
+		struct dma_resv_iter cursor;
+		struct dma_fence *fence;
 
 		total_size += amdgpu_bo_size(bo);
 
@@ -2461,10 +2463,13 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
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
index 5832c05ab10d..ef93abec13b9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -612,9 +612,8 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
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
index 9485b541947e..9cd6f41896c0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -205,14 +205,19 @@ static int amdgpu_vm_sdma_update(struct amdgpu_vm_update_params *p,
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
index 360f980c7e10..015a94f766de 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -418,7 +418,6 @@ static void ttm_bo_release(struct kref *kref)
 	dma_resv_unlock(bo->base.resv);
 
 	atomic_dec(&ttm_glob.bo_count);
-	dma_fence_put(bo->moving);
 	bo->destroy(bo);
 }
 
@@ -714,9 +713,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo)
 EXPORT_SYMBOL(ttm_bo_unpin);
 
 /*
- * Add the last move fence to the BO and reserve a new shared slot. We only use
- * a shared slot to avoid unecessary sync and rely on the subsequent bo move to
- * either stall or use an exclusive fence respectively set bo->moving.
+ * Add the last move fence to the BO as kernel dependency and reserve a new
+ * fence slot.
  */
 static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
 				 struct ttm_resource_manager *man,
@@ -746,9 +744,6 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
 		dma_fence_put(fence);
 		return ret;
 	}
-
-	dma_fence_put(bo->moving);
-	bo->moving = fence;
 	return 0;
 }
 
@@ -951,7 +946,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
 	bo->bdev = bdev;
 	bo->type = type;
 	bo->page_alignment = page_alignment;
-	bo->moving = NULL;
 	bo->pin_count = 0;
 	bo->sg = sg;
 	bo->bulk_move = NULL;
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 99deb45894f4..bc5190340b9c 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -228,7 +228,6 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 
 	atomic_inc(&ttm_glob.bo_count);
 	INIT_LIST_HEAD(&fbo->base.ddestroy);
-	fbo->base.moving = NULL;
 	drm_vma_node_reset(&fbo->base.base.vma_node);
 
 	kref_init(&fbo->base.kref);
@@ -500,9 +499,6 @@ static int ttm_bo_move_to_ghost(struct ttm_buffer_object *bo,
 	 * operation has completed.
 	 */
 
-	dma_fence_put(bo->moving);
-	bo->moving = dma_fence_get(fence);
-
 	ret = ttm_buffer_object_transfer(bo, &ghost_obj);
 	if (ret)
 		return ret;
@@ -546,9 +542,6 @@ static void ttm_bo_move_pipeline_evict(struct ttm_buffer_object *bo,
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
index a84d1d5628d0..a7d62a4eb47b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -1161,12 +1161,6 @@ int vmw_resources_clean(struct vmw_buffer_object *vbo, pgoff_t start,
 		*num_prefault = __KERNEL_DIV_ROUND_UP(last_cleaned - res_start,
 						      PAGE_SIZE);
 		vmw_bo_fence_single(bo, NULL);
-		if (bo->moving)
-			dma_fence_put(bo->moving);
-
-		return dma_resv_get_singleton(bo->base.resv,
-					      DMA_RESV_USAGE_WRITE,
-					      &bo->moving);
 	}
 
 	return 0;
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index c76932b68a33..2d524f8b0802 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -94,7 +94,6 @@ struct ttm_tt;
  * @deleted: True if the object is only a zombie and already deleted.
  * @ddestroy: List head for the delayed destroy list.
  * @swap: List head for swap LRU list.
- * @moving: Fence set when BO is moving
  * @offset: The current GPU offset, which can have different meanings
  * depending on the memory type. For SYSTEM type memory, it should be 0.
  * @cur_placement: Hint of current placement.
@@ -147,7 +146,6 @@ struct ttm_buffer_object {
 	 * Members protected by a bo reservation.
 	 */
 
-	struct dma_fence *moving;
 	unsigned priority;
 	unsigned pin_count;
 
-- 
2.25.1

