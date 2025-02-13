Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6FBA3354F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 03:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF1610E9C7;
	Thu, 13 Feb 2025 02:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="clxkXRzz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B1810E9DF;
 Thu, 13 Feb 2025 02:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739412620; x=1770948620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M/gILFsKlEGFTKTwo6yRnLlDjT8uXl8QPZmzXmMaOuU=;
 b=clxkXRzz01J7MVnRzKvBQTuXJvktb/ARW/n178g+50AX2NOPNgdlilmw
 //IctP4uKXrvadYZKnvjUSShljL4GrdBr7cvnvqP6eWrWmHviBtFdLALX
 SqyR6+aKrwg0fUqQNkOzoHrEBrhoE7kdkDu8kCiwlY0ProElE1Q4eMgTn
 5Y76UUzuBI95l39SlvQsDVpli/nKEfQ+fUOSH4KQQR7HJMebqycfgx9K0
 LJZoAgQOzDxalsKAK7O09qI6NnkNF01YWxVqJ9fIKzbodbOyqm/lkI1Wr
 yVXoseJEFBECmXWDHUDClh1oF0u0HaVssv9lrZ5Ouhejlkloje2K7w+R3 Q==;
X-CSE-ConnectionGUID: ncso5zjFQ7uMGll6PGb5Sw==
X-CSE-MsgGUID: 1uZi8ZY/RhK+a1Oq1mU2lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="65456066"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="65456066"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:17 -0800
X-CSE-ConnectionGUID: sYh9cmj3ScCZX3IUePTU8g==
X-CSE-MsgGUID: msy548aQTK2ypxwHMJ6zIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117945114"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:16 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v5 27/32] drm/xe: Add SVM VRAM migration
Date: Wed, 12 Feb 2025 18:11:07 -0800
Message-Id: <20250213021112.1228481-28-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213021112.1228481-1-matthew.brost@intel.com>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
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

Migration is implemented with range granularity, with VRAM backing being
a VM private TTM BO (i.e., shares dma-resv with VM). The lifetime of the
TTM BO is limited to when the SVM range is in VRAM (i.e., when a VRAM
SVM range is migrated to SRAM, the TTM BO is destroyed).

The design choice for using TTM BO for VRAM backing store, as opposed to
direct buddy allocation, is as follows:

- DRM buddy allocations are not at page granularity, offering no
  advantage over a BO.
- Unified eviction is required (SVM VRAM and TTM BOs need to be able to
  evict each other).
- For exhaustive eviction [1], SVM VRAM allocations will almost certainly
  require a dma-resv.
- Likely allocation size is 2M which makes of size of BO (872)
  acceptable per allocation (872 / 2M == .0004158).

With this, using TTM BO for VRAM backing store seems to be an obvious
choice as it allows leveraging of the TTM eviction code.

Current migration policy is migrate any SVM range greater than or equal
to 64k once.

[1] https://patchwork.freedesktop.org/series/133643/

v2:
 - Rebase on latest GPU SVM
 - Retry page fault on get pages returning mixed allocation
 - Use drm_gpusvm_devmem
v3:
 - Use new BO flags
 - New range structure (Thomas)
 - Hide migration behind Kconfig
 - Kernel doc (Thomas)
 - Use check_pages_threshold
v4:
 - Don't evict partial unmaps in garbage collector (Thomas)
 - Use %pe to print errors (Thomas)
 - Use %p to print pointers (Thomas)
v5:
 - Use range size helper (Thomas)
 - Make BO external (Thomas)
 - Set tile to NULL for BO creation (Thomas)
 - Drop BO mirror flag (Thomas)
 - Hold BO dma-resv lock across migration (Auld, Thomas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 111 ++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_svm.h |   5 ++
 2 files changed, 112 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 0a78a838508c..2e1e0f31c1a8 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -32,6 +32,11 @@ static unsigned long xe_svm_range_end(struct xe_svm_range *range)
 	return drm_gpusvm_range_end(&range->base);
 }
 
+static unsigned long xe_svm_range_size(struct xe_svm_range *range)
+{
+	return drm_gpusvm_range_size(&range->base);
+}
+
 static void *xe_svm_devm_owner(struct xe_device *xe)
 {
 	return xe;
@@ -512,7 +517,6 @@ static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocatio
 	return 0;
 }
 
-__maybe_unused
 static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
 	.devmem_release = xe_svm_devmem_release,
 	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
@@ -592,6 +596,71 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
 	return (range->tile_present & ~range->tile_invalidated) & BIT(tile->id);
 }
 
+static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
+{
+	return &tile->mem.vram;
+}
+
+static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
+				       struct xe_svm_range *range,
+				       const struct drm_gpusvm_ctx *ctx)
+{
+	struct mm_struct *mm = vm->svm.gpusvm.mm;
+	struct xe_vram_region *vr = tile_to_vr(tile);
+	struct drm_buddy_block *block;
+	struct list_head *blocks;
+	struct xe_bo *bo;
+	ktime_t end = 0;
+	int err;
+
+	if (!mmget_not_zero(mm))
+		return ERR_PTR(-EFAULT);
+	mmap_read_lock(mm);
+
+retry:
+	bo = xe_bo_create_locked(tile_to_xe(tile), NULL, NULL,
+				 xe_svm_range_size(range),
+				 ttm_bo_type_device,
+				 XE_BO_FLAG_VRAM_IF_DGFX(tile));
+	if (IS_ERR(bo)) {
+		err = PTR_ERR(bo);
+		if (xe_vm_validate_should_retry(NULL, err, &end))
+			goto retry;
+		goto unlock;
+	}
+
+	drm_gpusvm_devmem_init(&bo->devmem_allocation,
+			       vm->xe->drm.dev, mm,
+			       &gpusvm_devmem_ops,
+			       &tile->mem.vram.dpagemap,
+			       xe_svm_range_size(range));
+
+	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
+	list_for_each_entry(block, blocks, link)
+		block->private = vr;
+
+	/*
+	 * Take ref because as soon as drm_gpusvm_migrate_to_devmem succeeds the
+	 * creation ref can be dropped upon CPU fault or unmap.
+	 */
+	xe_bo_get(bo);
+
+	err = drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm, &range->base,
+					   &bo->devmem_allocation, ctx);
+	xe_bo_unlock(bo);
+	if (err) {
+		xe_bo_put(bo);	/* Local ref */
+		xe_bo_put(bo);	/* Creation ref */
+		bo = ERR_PTR(err);
+	}
+
+unlock:
+	mmap_read_unlock(mm);
+	mmput(mm);
+
+	return bo;
+}
+
 /**
  * xe_svm_handle_pagefault() - SVM handle page fault
  * @vm: The VM.
@@ -600,7 +669,8 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
  * @fault_addr: The GPU fault address.
  * @atomic: The fault atomic access bit.
  *
- * Create GPU bindings for a SVM page fault.
+ * Create GPU bindings for a SVM page fault. Optionally migrate to device
+ * memory.
  *
  * Return: 0 on success, negative error code on error.
  */
@@ -608,11 +678,18 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			    struct xe_tile *tile, u64 fault_addr,
 			    bool atomic)
 {
-	struct drm_gpusvm_ctx ctx = { .read_only = xe_vma_read_only(vma), };
+	struct drm_gpusvm_ctx ctx = {
+		.read_only = xe_vma_read_only(vma),
+		.devmem_possible = IS_DGFX(vm->xe) &&
+			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
+		.check_pages_threshold = IS_DGFX(vm->xe) &&
+			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
+	};
 	struct xe_svm_range *range;
 	struct drm_gpusvm_range *r;
 	struct drm_exec exec;
 	struct dma_fence *fence;
+	struct xe_bo *bo = NULL;
 	ktime_t end = 0;
 	int err;
 
@@ -620,6 +697,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(vma));
 
 retry:
+	xe_bo_put(bo);
+	bo = NULL;
+
 	/* Always process UNMAPs first so view SVM ranges is current */
 	err = xe_svm_garbage_collector(vm);
 	if (err)
@@ -635,9 +715,31 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (xe_svm_range_is_valid(range, tile))
 		return 0;
 
+	/* XXX: Add migration policy, for now migrate range once */
+	if (!range->migrated && range->base.flags.migrate_devmem &&
+	    xe_svm_range_size(range) >= SZ_64K) {
+		range->migrated = true;
+
+		bo = xe_svm_alloc_vram(vm, tile, range, &ctx);
+		if (IS_ERR(bo)) {
+			drm_info(&vm->xe->drm,
+				 "VRAM allocation failed, falling back to retrying, asid=%u, errno %pe\n",
+				 vm->usm.asid, bo);
+			bo = NULL;
+			goto retry;
+		}
+	}
+
 	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
-	if (err == -EFAULT || err == -EPERM)	/* Corner where CPU mappings have changed */
+	/* Corner where CPU mappings have changed */
+	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
+		if (err == -EOPNOTSUPP)
+			drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
+		drm_info(&vm->xe->drm,
+			 "Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno %pe\n",
+			 vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
 		goto retry;
+	}
 	if (err)
 		goto err_out;
 
@@ -668,6 +770,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	dma_fence_put(fence);
 
 err_out:
+	xe_bo_put(bo);
 
 	return err;
 }
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 0fa525d34987..984a61651d9e 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -35,6 +35,11 @@ struct xe_svm_range {
 	 * range. Protected by GPU SVM notifier lock.
 	 */
 	u8 tile_invalidated;
+	/**
+	 * @migrated: Range has been migrated to device memory, protected by
+	 * GPU fault handler locking.
+	 */
+	u8 migrated	:1;
 };
 
 int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr);
-- 
2.34.1

