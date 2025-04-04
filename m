Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D06A7B9E0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 11:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D33310EB9F;
	Fri,  4 Apr 2025 09:26:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="TmBmcqJR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DE010EB9D;
 Fri,  4 Apr 2025 09:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743758798;
 bh=BU3CTLQxUyFiI6yaHwAZ1algtYs9Av0mreKFx47QP14=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TmBmcqJRPDC5RSjTt5n7guP3HYAm1AT6Z1oxsf5atZsT0p0bZw3jeNnx9UshWQcA3
 XIHkBFBUWdLmR4o2dC/hB0/jn6qq0LaBlXpn1VAbg6zTZXjh3VlNpUKm29r/IIXWwn
 Yq4a0IMczXnunb2x+tTrLHH3TxH0dfkx/aRqvwzjr1pZPhFvYikwbdQ2fNNRbsAKbj
 La/5fweDfZTe2skpKia+E5Dio59sU7EwmtWuLvf7h5URelzCow6/D77eTiIkKjgfWX
 9iR204iBCZ9rbEl2xkMtGTOKc6dzTzaBNS/69qC4mVHJ8UwvJJ4KJD+OiDyc5Zwf0y
 YK/M0hHi0ChKA==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 43F5517E1034;
 Fri,  4 Apr 2025 11:26:38 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, kernel@collabora.com
Subject: [PATCH v3 4/8] drm/panthor: Add support for alloc-on-fault buffers
Date: Fri,  4 Apr 2025 11:26:30 +0200
Message-ID: <20250404092634.2968115-5-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404092634.2968115-1-boris.brezillon@collabora.com>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
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

This lets the UMD flag buffers are alloc-on-fault (AKA lazy allocation,
AKA alloc-on-demand). The ultimate goal is to use this infrastructure
for heap objects, but commit only deals with GEM/VM bits.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c |  20 +-
 drivers/gpu/drm/panthor/panthor_gem.c |  11 +-
 drivers/gpu/drm/panthor/panthor_gem.h |   8 +-
 drivers/gpu/drm/panthor/panthor_mmu.c | 456 +++++++++++++++++++-------
 include/uapi/drm/panthor_drm.h        |  19 +-
 5 files changed, 390 insertions(+), 124 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 06fe46e32073..9d3cbae5c1d6 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -899,7 +899,8 @@ static int panthor_ioctl_vm_destroy(struct drm_device *ddev, void *data,
 	return panthor_vm_pool_destroy_vm(pfile->vms, args->id);
 }
 
-#define PANTHOR_BO_FLAGS		DRM_PANTHOR_BO_NO_MMAP
+#define PANTHOR_BO_FLAGS		(DRM_PANTHOR_BO_NO_MMAP | \
+					 DRM_PANTHOR_BO_ALLOC_ON_FAULT)
 
 static int panthor_ioctl_bo_create(struct drm_device *ddev, void *data,
 				   struct drm_file *file)
@@ -912,8 +913,18 @@ static int panthor_ioctl_bo_create(struct drm_device *ddev, void *data,
 	if (!drm_dev_enter(ddev, &cookie))
 		return -ENODEV;
 
-	if (!args->size || args->pad ||
-	    (args->flags & ~PANTHOR_BO_FLAGS)) {
+	if (!args->size || (args->flags & ~PANTHOR_BO_FLAGS)) {
+		ret = -EINVAL;
+		goto out_dev_exit;
+	}
+
+	if (args->flags & DRM_PANTHOR_BO_ALLOC_ON_FAULT) {
+		if (args->alloc_on_faut_granularity < PAGE_SIZE ||
+		    !is_power_of_2(args->alloc_on_faut_granularity)) {
+			ret = -EINVAL;
+			goto out_dev_exit;
+		}
+	} else if (args->alloc_on_faut_granularity) {
 		ret = -EINVAL;
 		goto out_dev_exit;
 	}
@@ -927,7 +938,8 @@ static int panthor_ioctl_bo_create(struct drm_device *ddev, void *data,
 	}
 
 	ret = panthor_gem_create_with_handle(file, ddev, vm, &args->size,
-					     args->flags, &args->handle);
+					     args->flags, args->alloc_on_faut_granularity,
+					     &args->handle);
 
 	panthor_vm_put(vm);
 
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 8244a4e6c2a2..52b8d5468d53 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -18,6 +18,9 @@ static void panthor_gem_free_object(struct drm_gem_object *obj)
 	struct panthor_gem_object *bo = to_panthor_bo(obj);
 	struct drm_gem_object *vm_root_gem = bo->exclusive_vm_root_gem;
 
+	if (bo->base.sparse)
+		drm_gem_shmem_sparse_finish(&bo->base);
+
 	drm_gem_free_mmap_offset(&bo->base.base);
 	mutex_destroy(&bo->gpuva_list_lock);
 	drm_gem_shmem_free(&bo->base);
@@ -215,7 +218,9 @@ int
 panthor_gem_create_with_handle(struct drm_file *file,
 			       struct drm_device *ddev,
 			       struct panthor_vm *exclusive_vm,
-			       u64 *size, u32 flags, u32 *handle)
+			       u64 *size, u32 flags,
+			       u32 alloc_on_fault_granularity,
+			       u32 *handle)
 {
 	int ret;
 	struct drm_gem_shmem_object *shmem;
@@ -228,6 +233,10 @@ panthor_gem_create_with_handle(struct drm_file *file,
 	bo = to_panthor_bo(&shmem->base);
 	bo->flags = flags;
 
+	if (flags & DRM_PANTHOR_BO_ALLOC_ON_FAULT)
+		drm_gem_shmem_sparse_init(&bo->base, &bo->sparse,
+					  alloc_on_fault_granularity >> PAGE_SHIFT);
+
 	if (exclusive_vm) {
 		bo->exclusive_vm_root_gem = panthor_vm_root_gem(exclusive_vm);
 		drm_gem_object_get(bo->exclusive_vm_root_gem);
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 1a363bb814f4..53a85a463c1e 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -20,6 +20,9 @@ struct panthor_gem_object {
 	/** @base: Inherit from drm_gem_shmem_object. */
 	struct drm_gem_shmem_object base;
 
+	/** @sparse: Used when alloc-on-fault is requested. */
+	struct drm_gem_shmem_sparse_backing sparse;
+
 	/**
 	 * @exclusive_vm_root_gem: Root GEM of the exclusive VM this GEM object
 	 * is attached to.
@@ -89,7 +92,10 @@ int
 panthor_gem_create_with_handle(struct drm_file *file,
 			       struct drm_device *ddev,
 			       struct panthor_vm *exclusive_vm,
-			       u64 *size, u32 flags, uint32_t *handle);
+			       u64 *size, u32 flags,
+			       u32 alloc_on_fault_granularity,
+			       u32 *handle);
+
 
 static inline u64
 panthor_kernel_bo_gpuva(struct panthor_kernel_bo *bo)
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index dc173c6edde0..e05aaac10481 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -380,13 +380,20 @@ struct panthor_vm {
 	 */
 	bool unusable;
 
-	/**
-	 * @unhandled_fault: Unhandled fault happened.
-	 *
-	 * This should be reported to the scheduler, and the queue/group be
-	 * flagged as faulty as a result.
-	 */
-	bool unhandled_fault;
+	/** @fault: Fields related to VM faults. */
+	struct {
+		/** @work: Work used to defer VM fault processing. */
+		struct work_struct work;
+
+		/**
+		 * @status: Value of the FAULTSTATUS register at the time the fault was
+		 * reported.
+		 */
+		u32 status;
+
+		/** @addr: Value of the FAULTADDRESS register at the time the fault was reported. */
+		u64 addr;
+	} fault;
 };
 
 /**
@@ -456,11 +463,22 @@ static void *alloc_pt(void *cookie, size_t size, gfp_t gfp)
 	if (drm_WARN_ON(&vm->ptdev->base, size != SZ_4K))
 		return NULL;
 
+	if (!vm->op_ctx) {
+		/* No op_ctx means alloc-on-fault, in that case we just allocate with
+		 * non-blocking gfp flags.
+		 */
+		page = kmem_cache_zalloc(pt_cache, __GFP_NORETRY | __GFP_NOWARN);
+		if (!page)
+			return NULL;
+
+		kmemleak_ignore(page);
+		return page;
+	}
+
 	/* We must have some op_ctx attached to the VM and it must have at least one
 	 * free page.
 	 */
-	if (drm_WARN_ON(&vm->ptdev->base, !vm->op_ctx) ||
-	    drm_WARN_ON(&vm->ptdev->base,
+	if (drm_WARN_ON(&vm->ptdev->base,
 			vm->op_ctx->rsvd_page_tables.ptr >= vm->op_ctx->rsvd_page_tables.count))
 		return NULL;
 
@@ -666,7 +684,7 @@ static u32 panthor_mmu_as_fault_mask(struct panthor_device *ptdev, u32 as)
  */
 bool panthor_vm_has_unhandled_faults(struct panthor_vm *vm)
 {
-	return vm->unhandled_fault;
+	return vm->fault.status && !work_busy(&vm->fault.work);
 }
 
 /**
@@ -773,7 +791,8 @@ int panthor_vm_active(struct panthor_vm *vm)
 		transcfg |= AS_TRANSCFG_PTW_SH_OS;
 
 	/* If the VM is re-activated, we clear the fault. */
-	vm->unhandled_fault = false;
+	vm->fault.status = 0;
+	vm->fault.addr = 0;
 
 	/* Unhandled pagefault on this AS, clear the fault and re-enable interrupts
 	 * before enabling the AS.
@@ -907,18 +926,32 @@ int panthor_vm_flush_all(struct panthor_vm *vm)
 	return panthor_vm_flush_range(vm, vm->base.mm_start, vm->base.mm_range);
 }
 
-static int panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64 size)
+static int panthor_vm_unmap_pages(struct panthor_vm *vm, u64 iova, u64 size,
+				  u32 sparse_granularity)
 {
 	struct panthor_device *ptdev = vm->ptdev;
 	struct io_pgtable_ops *ops = vm->pgtbl_ops;
 	u64 offset = 0;
 
 	drm_dbg(&ptdev->base, "unmap: as=%d, iova=%llx, len=%llx", vm->as.id, iova, size);
+	sparse_granularity <<= PAGE_SHIFT;
 
 	while (offset < size) {
 		size_t unmapped_sz = 0, pgcount;
 		size_t pgsize = get_pgsize(iova + offset, size - offset, &pgcount);
 
+		if (sparse_granularity && !ops->iova_to_phys(ops, iova + offset)) {
+			offset += sparse_granularity;
+			continue;
+		} else if (sparse_granularity) {
+			u32 chunk_size = min_t(u32, size - offset, sparse_granularity);
+
+			pgsize = get_pgsize(iova + offset, chunk_size, &pgcount);
+			pgcount = 1;
+		} else {
+			pgsize = get_pgsize(iova + offset, size - offset, &pgcount);
+		}
+
 		unmapped_sz = ops->unmap_pages(ops, iova + offset, pgsize, pgcount, NULL);
 
 		if (drm_WARN_ON(&ptdev->base, unmapped_sz != pgsize * pgcount)) {
@@ -985,7 +1018,7 @@ panthor_vm_map_pages(struct panthor_vm *vm, u64 iova, int prot,
 				 */
 				drm_WARN_ON(&ptdev->base,
 					    panthor_vm_unmap_pages(vm, start_iova,
-								   iova - start_iova));
+								   iova - start_iova, 0));
 				return ret;
 			}
 		}
@@ -1104,8 +1137,12 @@ static void panthor_vm_bo_put(struct drm_gpuvm_bo *vm_bo)
 	/* If the vm_bo object was destroyed, release the pin reference that
 	 * was hold by this object.
 	 */
-	if (unpin && !bo->base.base.import_attach)
-		drm_gem_shmem_unpin(&bo->base);
+	if (unpin) {
+		if (bo->flags & DRM_PANTHOR_BO_ALLOC_ON_FAULT)
+			drm_gem_shmem_sparse_unpin(&bo->base);
+		else if (!bo->base.base.import_attach)
+			drm_gem_shmem_unpin(&bo->base);
+	}
 
 	drm_gpuvm_put(vm);
 	drm_gem_object_put(&bo->base.base);
@@ -1205,7 +1242,6 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 					 u32 flags)
 {
 	struct drm_gpuvm_bo *preallocated_vm_bo;
-	struct sg_table *sgt = NULL;
 	u64 pt_count;
 	int ret;
 
@@ -1235,29 +1271,41 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 	if (ret)
 		goto err_cleanup;
 
-	if (!bo->base.base.import_attach) {
-		/* Pre-reserve the BO pages, so the map operation doesn't have to
-		 * allocate.
+	if (bo->flags & DRM_PANTHOR_BO_ALLOC_ON_FAULT) {
+		/* For alloc-on-faut objects, we just flag the sparse
+		 * resources as pinned, but the actual allocation is
+		 * deferred (done at fault time).
 		 */
-		ret = drm_gem_shmem_pin(&bo->base);
-		if (ret)
+		drm_gem_shmem_sparse_pin(&bo->base);
+	} else {
+		struct sg_table *sgt = NULL;
+
+		if (!bo->base.base.import_attach) {
+			/* Pre-reserve the BO pages, so the map operation
+			 * doesn't have to allocate.
+			 */
+			ret = drm_gem_shmem_pin(&bo->base);
+			if (ret)
+				goto err_cleanup;
+		}
+
+		sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
+		if (IS_ERR(sgt)) {
+			if (!bo->base.base.import_attach)
+				drm_gem_shmem_unpin(&bo->base);
+
+			ret = PTR_ERR(sgt);
 			goto err_cleanup;
+		}
+
+		op_ctx->map.sgt = sgt;
 	}
 
-	sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
-	if (IS_ERR(sgt)) {
-		if (!bo->base.base.import_attach)
-			drm_gem_shmem_unpin(&bo->base);
-
-		ret = PTR_ERR(sgt);
-		goto err_cleanup;
-	}
-
-	op_ctx->map.sgt = sgt;
-
 	preallocated_vm_bo = drm_gpuvm_bo_create(&vm->base, &bo->base.base);
 	if (!preallocated_vm_bo) {
-		if (!bo->base.base.import_attach)
+		if (bo->flags & DRM_PANTHOR_BO_ALLOC_ON_FAULT)
+			drm_gem_shmem_sparse_unpin(&bo->base);
+		else if (!bo->base.base.import_attach)
 			drm_gem_shmem_unpin(&bo->base);
 
 		ret = -ENOMEM;
@@ -1282,42 +1330,47 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 	 * If our pre-allocated vm_bo is picked, it now retains the pin ref,
 	 * which will be released in panthor_vm_bo_put().
 	 */
-	if (preallocated_vm_bo != op_ctx->map.vm_bo &&
-	    !bo->base.base.import_attach)
-		drm_gem_shmem_unpin(&bo->base);
+	if (preallocated_vm_bo != op_ctx->map.vm_bo) {
+		if (bo->flags & DRM_PANTHOR_BO_ALLOC_ON_FAULT)
+			drm_gem_shmem_sparse_unpin(&bo->base);
+		else if (!bo->base.base.import_attach)
+			drm_gem_shmem_unpin(&bo->base);
+	}
 
 	op_ctx->map.bo_offset = offset;
 
-	/* L1, L2 and L3 page tables.
-	 * We could optimize L3 allocation by iterating over the sgt and merging
-	 * 2M contiguous blocks, but it's simpler to over-provision and return
-	 * the pages if they're not used.
-	 */
-	pt_count = ((ALIGN(va + size, 1ull << 39) - ALIGN_DOWN(va, 1ull << 39)) >> 39) +
-		   ((ALIGN(va + size, 1ull << 30) - ALIGN_DOWN(va, 1ull << 30)) >> 30) +
-		   ((ALIGN(va + size, 1ull << 21) - ALIGN_DOWN(va, 1ull << 21)) >> 21);
+	if (!(bo->flags & DRM_PANTHOR_BO_ALLOC_ON_FAULT)) {
+		/* L1, L2 and L3 page tables.
+		 * We could optimize L3 allocation by iterating over the sgt and merging
+		 * 2M contiguous blocks, but it's simpler to over-provision and return
+		 * the pages if they're not used.
+		 */
+		pt_count = ((ALIGN(va + size, 1ull << 39) - ALIGN_DOWN(va, 1ull << 39)) >> 39) +
+			   ((ALIGN(va + size, 1ull << 30) - ALIGN_DOWN(va, 1ull << 30)) >> 30) +
+			   ((ALIGN(va + size, 1ull << 21) - ALIGN_DOWN(va, 1ull << 21)) >> 21);
 
-	op_ctx->rsvd_page_tables.pages = kcalloc(pt_count,
-						 sizeof(*op_ctx->rsvd_page_tables.pages),
-						 GFP_KERNEL);
-	if (!op_ctx->rsvd_page_tables.pages) {
-		ret = -ENOMEM;
-		goto err_cleanup;
+		op_ctx->rsvd_page_tables.pages = kcalloc(pt_count,
+							 sizeof(*op_ctx->rsvd_page_tables.pages),
+							 GFP_KERNEL);
+		if (!op_ctx->rsvd_page_tables.pages) {
+			ret = -ENOMEM;
+			goto err_cleanup;
+		}
+
+		ret = kmem_cache_alloc_bulk(pt_cache, GFP_KERNEL, pt_count,
+					    op_ctx->rsvd_page_tables.pages);
+		op_ctx->rsvd_page_tables.count = ret;
+		if (ret != pt_count) {
+			ret = -ENOMEM;
+			goto err_cleanup;
+		}
+
+		/* Insert BO into the extobj list last, when we know nothing can fail. */
+		dma_resv_lock(panthor_vm_resv(vm), NULL);
+		drm_gpuvm_bo_extobj_add(op_ctx->map.vm_bo);
+		dma_resv_unlock(panthor_vm_resv(vm));
 	}
 
-	ret = kmem_cache_alloc_bulk(pt_cache, GFP_KERNEL, pt_count,
-				    op_ctx->rsvd_page_tables.pages);
-	op_ctx->rsvd_page_tables.count = ret;
-	if (ret != pt_count) {
-		ret = -ENOMEM;
-		goto err_cleanup;
-	}
-
-	/* Insert BO into the extobj list last, when we know nothing can fail. */
-	dma_resv_lock(panthor_vm_resv(vm), NULL);
-	drm_gpuvm_bo_extobj_add(op_ctx->map.vm_bo);
-	dma_resv_unlock(panthor_vm_resv(vm));
-
 	return 0;
 
 err_cleanup:
@@ -1665,35 +1718,94 @@ static const char *access_type_name(struct panthor_device *ptdev,
 	}
 }
 
-static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
+static int panthor_vm_map_on_demand_locked(struct panthor_vm *vm,
+					   struct panthor_vma *vma, u64 offset,
+					   u64 size, gfp_t page_gfp,
+					   gfp_t other_gfp)
 {
-	bool has_unhandled_faults = false;
+	struct panthor_gem_object *bo = to_panthor_bo(vma->base.gem.obj);
+	u64 bo_offset = vma->base.gem.offset + offset;
+	u64 iova = vma->base.va.addr + offset;
+	u32 granularity = bo->sparse.granularity << PAGE_SHIFT;
+	pgoff_t first_page = bo_offset >> PAGE_SHIFT;
+	pgoff_t last_page = (bo_offset + size) >> PAGE_SHIFT;
+	int prot = flags_to_prot(vma->flags);
+	int ret;
 
-	status = panthor_mmu_fault_mask(ptdev, status);
-	while (status) {
-		u32 as = ffs(status | (status >> 16)) - 1;
-		u32 mask = panthor_mmu_as_fault_mask(ptdev, as);
-		u32 new_int_mask;
-		u64 addr;
-		u32 fault_status;
-		u32 exception_type;
-		u32 access_type;
-		u32 source_id;
+	lockdep_assert_held(&vm->op_lock);
 
-		fault_status = gpu_read(ptdev, AS_FAULTSTATUS(as));
-		addr = gpu_read(ptdev, AS_FAULTADDRESS_LO(as));
-		addr |= (u64)gpu_read(ptdev, AS_FAULTADDRESS_HI(as)) << 32;
+	if ((size | bo_offset | iova) & (granularity - 1))
+		return -EINVAL;
 
+	if (offset + size < offset || offset + size > vma->base.va.range)
+		return -EINVAL;
+
+	ret = drm_gem_shmem_sparse_populate_range(&bo->base,
+						  bo_offset >> PAGE_SHIFT,
+						  size >> PAGE_SHIFT, page_gfp,
+						  other_gfp);
+	if (ret)
+		return ret;
+
+	for (pgoff_t p = first_page; p < last_page; ) {
+		unsigned int sgt_remaining_pages;
+		pgoff_t sgt_pgoffset;
+		struct sg_table *sgt;
+
+		sgt = drm_gem_shmem_sparse_get_sgt(&bo->base, p,
+						   &sgt_pgoffset, &sgt_remaining_pages);
+		if (IS_ERR(sgt))
+			return PTR_ERR(sgt);
+
+		ret = panthor_vm_map_pages(vm, iova, prot, sgt,
+					   (u64)sgt_pgoffset << PAGE_SHIFT,
+					   (u64)sgt_remaining_pages << PAGE_SHIFT);
+		if (ret)
+			return ret;
+
+		p += sgt_remaining_pages;
+		iova += (u64)sgt_remaining_pages << PAGE_SHIFT;
+	}
+
+	return 0;
+}
+
+static void panthor_vm_handle_fault_locked(struct panthor_vm *vm)
+{
+	struct panthor_device *ptdev = vm->ptdev;
+	struct panthor_gem_object *bo = NULL;
+	struct address_space *mapping;
+	gfp_t page_gfp, other_gfp;
+	struct drm_gpuva *gpuva;
+	struct panthor_vma *vma;
+	u64 iova;
+	int ret;
+
+	gpuva = drm_gpuva_find_first(&vm->base, vm->fault.addr, 1);
+	vma = gpuva ? container_of(gpuva, struct panthor_vma, base) : NULL;
+	if (vma && vma->base.gem.obj)
+		bo = to_panthor_bo(vma->base.gem.obj);
+
+	if (!bo || !(bo->flags & DRM_PANTHOR_BO_ALLOC_ON_FAULT)) {
+		ret = -EFAULT;
+		goto out;
+	}
+
+	iova = vm->fault.addr & ~((u64)bo->sparse.granularity - 1);
+	mapping = bo->base.base.filp->f_mapping;
+	page_gfp = mapping_gfp_constraint(mapping, ~__GFP_RECLAIM) |
+		   __GFP_NORETRY | __GFP_NOWARN;
+	other_gfp = __GFP_NORETRY | __GFP_NOWARN;
+	ret = panthor_vm_map_on_demand_locked(vm, vma, iova - vma->base.va.addr,
+					      bo->sparse.granularity, page_gfp,
+					      other_gfp);
+
+out:
+	if (ret) {
 		/* decode the fault status */
-		exception_type = fault_status & 0xFF;
-		access_type = (fault_status >> 8) & 0x3;
-		source_id = (fault_status >> 16);
-
-		mutex_lock(&ptdev->mmu->as.slots_lock);
-
-		ptdev->mmu->as.faulty_mask |= mask;
-		new_int_mask =
-			panthor_mmu_fault_mask(ptdev, ~ptdev->mmu->as.faulty_mask);
+		u32 exception_type = vm->fault.status & 0xFF;
+		u32 access_type = (vm->fault.status >> 8) & 0x3;
+		u32 source_id = vm->fault.status >> 16;
 
 		/* terminal fault, print info about the fault */
 		drm_err(&ptdev->base,
@@ -1703,38 +1815,99 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
 			"exception type 0x%X: %s\n"
 			"access type 0x%X: %s\n"
 			"source id 0x%X\n",
-			as, addr,
-			fault_status,
-			(fault_status & (1 << 10) ? "DECODER FAULT" : "SLAVE FAULT"),
+			vm->as.id, vm->fault.addr,
+			vm->fault.status,
+			(vm->fault.status & (1 << 10) ? "DECODER FAULT" : "SLAVE FAULT"),
 			exception_type, panthor_exception_name(ptdev, exception_type),
-			access_type, access_type_name(ptdev, fault_status),
+			access_type, access_type_name(ptdev, vm->fault.status),
 			source_id);
 
-		/* We don't handle VM faults at the moment, so let's just clear the
-		 * interrupt and let the writer/reader crash.
-		 * Note that COMPLETED irqs are never cleared, but this is fine
-		 * because they are always masked.
-		 */
-		gpu_write(ptdev, MMU_INT_CLEAR, mask);
+		panthor_sched_report_mmu_fault(ptdev);
+	}
 
-		/* Ignore MMU interrupts on this AS until it's been
-		 * re-enabled.
-		 */
-		ptdev->mmu->irq.mask = new_int_mask;
+	mutex_lock(&ptdev->mmu->as.slots_lock);
+	if (vm->as.id >= 0) {
+		if (ret) {
+			/* If we failed to handle the fault, disable
+			 * the AS to kill jobs.
+			 */
+			panthor_mmu_as_disable(ptdev, vm->as.id);
+		} else {
+			u32 as_fault_mask = panthor_mmu_as_fault_mask(ptdev, vm->as.id);
 
-		if (ptdev->mmu->as.slots[as].vm)
-			ptdev->mmu->as.slots[as].vm->unhandled_fault = true;
+			/* If we handled the fault, clear the interrupt and re-enable it. */
+			vm->fault.status = 0;
+			vm->fault.addr = 0;
 
-		/* Disable the MMU to kill jobs on this AS. */
-		panthor_mmu_as_disable(ptdev, as);
+			gpu_write(ptdev, MMU_INT_CLEAR, as_fault_mask);
+			ptdev->mmu->as.faulty_mask &= ~as_fault_mask;
+			ptdev->mmu->irq.mask =
+				panthor_mmu_fault_mask(ptdev, ~ptdev->mmu->as.faulty_mask);
+			gpu_write(ptdev, MMU_INT_MASK, ptdev->mmu->irq.mask);
+		}
+	}
+	mutex_unlock(&ptdev->mmu->as.slots_lock);
+}
+
+static void panthor_vm_fault_work(struct work_struct *work)
+{
+	struct panthor_vm *vm = container_of(work, struct panthor_vm, fault.work);
+
+	mutex_lock(&vm->op_lock);
+	panthor_vm_handle_fault_locked(vm);
+	mutex_unlock(&vm->op_lock);
+	panthor_vm_put(vm);
+}
+
+static void panthor_mmu_handle_fault_locked(struct panthor_device *ptdev, u32 as)
+{
+	u32 status = panthor_mmu_fault_mask(ptdev, gpu_read(ptdev, MMU_INT_RAWSTAT));
+	u32 mask = panthor_mmu_as_fault_mask(ptdev, as);
+	u32 fault_status, new_int_mask;
+	struct panthor_vm *vm;
+	u64 fault_addr;
+
+	/* Slot got recycled while we were trying to acquire the lock.
+	 * We'll try to handle the MMU fault next time the VM is bound.
+	 */
+	if (!status)
+		return;
+
+	fault_status = gpu_read(ptdev, AS_FAULTSTATUS(as));
+	fault_addr = gpu_read(ptdev, AS_FAULTADDRESS_LO(as));
+	fault_addr |= (u64)gpu_read(ptdev, AS_FAULTADDRESS_HI(as)) << 32;
+
+	ptdev->mmu->as.faulty_mask |= mask;
+
+	new_int_mask =
+		panthor_mmu_fault_mask(ptdev, ~ptdev->mmu->as.faulty_mask);
+	ptdev->mmu->irq.mask = new_int_mask;
+	vm = ptdev->mmu->as.slots[as].vm;
+
+	if (vm) {
+		vm->fault.status = fault_status;
+		vm->fault.addr = fault_addr;
+		if (queue_work(ptdev->mmu->vm.wq, &vm->fault.work))
+			panthor_vm_get(vm);
+	}
+}
+
+static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
+{
+	/* Note that COMPLETED irqs are never cleared, but this is fine because
+	 * they are always masked.
+	 */
+	status = panthor_mmu_fault_mask(ptdev, status);
+	while (status) {
+		u32 as = ffs(status | (status >> 16)) - 1;
+		u32 mask = panthor_mmu_as_fault_mask(ptdev, as);
+
+		mutex_lock(&ptdev->mmu->as.slots_lock);
+		panthor_mmu_handle_fault_locked(ptdev, as);
 		mutex_unlock(&ptdev->mmu->as.slots_lock);
 
 		status &= ~mask;
-		has_unhandled_faults = true;
 	}
-
-	if (has_unhandled_faults)
-		panthor_sched_report_mmu_fault(ptdev);
 }
 PANTHOR_IRQ_HANDLER(mmu, MMU, panthor_mmu_irq_handler);
 
@@ -2066,6 +2239,7 @@ static int panthor_gpuva_sm_step_map(struct drm_gpuva_op *op, void *priv)
 	struct panthor_vm *vm = priv;
 	struct panthor_vm_op_ctx *op_ctx = vm->op_ctx;
 	struct panthor_vma *vma = panthor_vm_op_ctx_get_vma(op_ctx);
+	struct panthor_gem_object *bo = to_panthor_bo(op->map.gem.obj);
 	int ret;
 
 	if (!vma)
@@ -2073,11 +2247,14 @@ static int panthor_gpuva_sm_step_map(struct drm_gpuva_op *op, void *priv)
 
 	panthor_vma_init(vma, op_ctx->flags & PANTHOR_VM_MAP_FLAGS);
 
-	ret = panthor_vm_map_pages(vm, op->map.va.addr, flags_to_prot(vma->flags),
-				   op_ctx->map.sgt, op->map.gem.offset,
-				   op->map.va.range);
-	if (ret)
-		return ret;
+	/* Don't map alloc-on-fault objects. This will happen at fault time. */
+	if (!(bo->flags & DRM_PANTHOR_BO_ALLOC_ON_FAULT)) {
+		ret = panthor_vm_map_pages(vm, op->map.va.addr, flags_to_prot(vma->flags),
+					   op_ctx->map.sgt, op->map.gem.offset,
+					   op->map.va.range);
+		if (ret)
+			return ret;
+	}
 
 	/* Ref owned by the mapping now, clear the obj field so we don't release the
 	 * pinning/obj ref behind GPUVA's back.
@@ -2096,10 +2273,43 @@ static int panthor_gpuva_sm_step_remap(struct drm_gpuva_op *op,
 	struct panthor_vm_op_ctx *op_ctx = vm->op_ctx;
 	struct panthor_vma *prev_vma = NULL, *next_vma = NULL;
 	u64 unmap_start, unmap_range;
+	u32 sparse_granularity = 0;
 	int ret;
 
+	if (op->remap.unmap->va->gem.obj) {
+		struct panthor_gem_object *unmapped_bo = to_panthor_bo(op->remap.prev->gem.obj);
+
+		sparse_granularity = unmapped_bo->sparse.granularity;
+	}
+
+	if (op->remap.prev && op->remap.prev->gem.obj) {
+		struct panthor_gem_object *prev_bo = to_panthor_bo(op->remap.prev->gem.obj);
+
+		if (!sparse_granularity)
+			sparse_granularity = prev_bo->sparse.granularity;
+		else
+			sparse_granularity = MIN(prev_bo->sparse.granularity, sparse_granularity);
+	}
+
+	if (op->remap.next && op->remap.next->gem.obj) {
+		struct panthor_gem_object *next_bo = to_panthor_bo(op->remap.next->gem.obj);
+
+		if (!sparse_granularity)
+			sparse_granularity = next_bo->sparse.granularity;
+		else
+			sparse_granularity = MIN(next_bo->sparse.granularity, sparse_granularity);
+	}
+
 	drm_gpuva_op_remap_to_unmap_range(&op->remap, &unmap_start, &unmap_range);
-	ret = panthor_vm_unmap_pages(vm, unmap_start, unmap_range);
+
+	if (sparse_granularity) {
+		sparse_granularity = 1 << (ffs(sparse_granularity |
+					       (unmap_start >> PAGE_SHIFT) |
+					       (unmap_range >> PAGE_SHIFT)) -
+					   1);
+	}
+
+	ret = panthor_vm_unmap_pages(vm, unmap_start, unmap_range, sparse_granularity);
 	if (ret)
 		return ret;
 
@@ -2141,10 +2351,23 @@ static int panthor_gpuva_sm_step_unmap(struct drm_gpuva_op *op,
 {
 	struct panthor_vma *unmap_vma = container_of(op->unmap.va, struct panthor_vma, base);
 	struct panthor_vm *vm = priv;
+	u32 sparse_granularity = 0;
 	int ret;
 
+	if (op->unmap.va->gem.obj) {
+		struct panthor_gem_object *unmapped_bo = to_panthor_bo(op->unmap.va->gem.obj);
+
+		sparse_granularity = unmapped_bo->sparse.granularity;
+	}
+
+	if (sparse_granularity) {
+		sparse_granularity = 1 << (ffs(sparse_granularity |
+					       (unmap_vma->base.va.addr >> PAGE_SHIFT) |
+					       (unmap_vma->base.va.range >> PAGE_SHIFT)) - 1);
+	}
+
 	ret = panthor_vm_unmap_pages(vm, unmap_vma->base.va.addr,
-				     unmap_vma->base.va.range);
+				     unmap_vma->base.va.range, sparse_granularity);
 	if (drm_WARN_ON(&vm->ptdev->base, ret))
 		return ret;
 
@@ -2338,6 +2561,7 @@ panthor_vm_create(struct panthor_device *ptdev, bool for_mcu,
 		goto err_free_vm;
 	}
 
+	INIT_WORK(&vm->fault.work, panthor_vm_fault_work);
 	mutex_init(&vm->heaps.lock);
 	vm->for_mcu = for_mcu;
 	vm->ptdev = ptdev;
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 97e2c4510e69..8071f1c438e2 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -615,6 +615,16 @@ struct drm_panthor_vm_get_state {
 enum drm_panthor_bo_flags {
 	/** @DRM_PANTHOR_BO_NO_MMAP: The buffer object will never be CPU-mapped in userspace. */
 	DRM_PANTHOR_BO_NO_MMAP = (1 << 0),
+
+	/**
+	 * @DRM_PANTHOR_BO_ALLOC_ON_FAULT: The buffer sections will be allocated on-demand.
+	 *
+	 * When alloc-on-faut is used, the user should expect job failures, because the
+	 * allocation happens in a path where waiting is not allowed, meaning the allocation
+	 * can fail and there's nothing the kernel will do to mitigate that. The group will
+	 * be unusable after such a failure.
+	 */
+	DRM_PANTHOR_BO_ALLOC_ON_FAULT = (1 << 1),
 };
 
 /**
@@ -649,8 +659,13 @@ struct drm_panthor_bo_create {
 	 */
 	__u32 handle;
 
-	/** @pad: MBZ. */
-	__u32 pad;
+	/**
+	 * @alloc_on_fault_granularity: Granularity of the alloc-on-fault behavior.
+	 *
+	 * Must be zero when DRM_PANTHOR_BO_ALLOC_ON_FAULT is not set.
+	 * Must be a power-of-two, at least a page size, and less or equal to @size.
+	 */
+	__u32 alloc_on_faut_granularity;
 };
 
 /**
-- 
2.49.0

