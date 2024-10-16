Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 567AC99FF74
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 05:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C1610E672;
	Wed, 16 Oct 2024 03:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K3esyYah";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A7410E65F;
 Wed, 16 Oct 2024 03:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729049101; x=1760585101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OmKm1rIYPx6cH8sksmwKHXd56ZFDdLhMc2/59Iq79lM=;
 b=K3esyYahdS/yVFCvi15waOnmqTanaTeaVlx4OMBl7WMnRY+iJcUbTNgX
 Nsv9tBe322zFOZPM+gf7yq6uBhbkfL3tnil+CwjWxSwTAHVZTk1lcvkB3
 VAc0OtSAtFlqJrqGKWQsdsVQ1kvyExEmyeJbARzosqEMphG7BPPFsysPh
 RXtdIUhnri67NbZZ46TXc656z1oMk/Bmf7Xg5eLQ8UwxzwlXE5UtV80Ty
 oRh6kT9u+Q6iPKi6Trkm4J4B82K+NF1SVxu33g4r1m5gExHZiDgMmfL8i
 IqzggsHEOimuJz3YlFPLGUApWcTJ/JVyQzZstQvwjgUiXXm55AoaAVxe+ g==;
X-CSE-ConnectionGUID: DO25Jf5DQUa5xHmbjG629g==
X-CSE-MsgGUID: 2sjKIMLIQHyA/FYVAzVOEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39056472"
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="39056472"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:59 -0700
X-CSE-ConnectionGUID: 9RXg6THqRIu+vK0LHSB3qA==
X-CSE-MsgGUID: G8EuJkoXRniktb6R2GSfWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="78930276"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v2 24/29] drm/xe: Add SVM VRAM migration
Date: Tue, 15 Oct 2024 20:25:13 -0700
Message-Id: <20241016032518.539495-25-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016032518.539495-1-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost matthew.brost@intel.com
---
 drivers/gpu/drm/xe/xe_svm.c | 96 +++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_svm.h |  1 +
 2 files changed, 94 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 976b4ce15db4..31b80cde15c4 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -218,6 +218,9 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
 {
 	struct dma_fence *fence;
 
+	if (IS_DGFX(vm->xe) && range->base.flags.partial_unmap)
+		drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
+
 	xe_vm_lock(vm, false);
 	fence = xe_vm_range_unbind(vm, range);
 	xe_vm_unlock(vm);
@@ -458,7 +461,6 @@ static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocatio
 	return 0;
 }
 
-__maybe_unused
 static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
 	.devmem_release = xe_svm_devmem_release,
 	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
@@ -542,21 +544,84 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
 	return (range->tile_present & ~range->tile_invalidated) & BIT(tile->id);
 }
 
+static struct xe_mem_region *tile_to_mr(struct xe_tile *tile)
+{
+	return &tile->mem.vram;
+}
+
+static struct xe_bo *xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
+				       struct xe_svm_range *range,
+				       const struct drm_gpusvm_ctx *ctx)
+{
+	struct xe_mem_region *mr = tile_to_mr(tile);
+	struct drm_buddy_block *block;
+	struct list_head *blocks;
+	struct xe_bo *bo;
+	ktime_t end = 0;
+	int err;
+
+retry:
+	xe_vm_lock(vm, false);
+	bo = xe_bo_create(tile_to_xe(tile), tile, vm, range->base.va.end -
+			  range->base.va.start, ttm_bo_type_device,
+			  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
+			  XE_BO_FLAG_SYSTEM_ALLOC | XE_BO_FLAG_SKIP_CLEAR);
+	xe_vm_unlock(vm);
+	if (IS_ERR(bo)) {
+		err = PTR_ERR(bo);
+		if (xe_vm_validate_should_retry(NULL, err, &end))
+			goto retry;
+		return bo;
+	}
+
+	drm_gpusvm_devmem_init(&bo->devmem_allocation,
+			       vm->xe->drm.dev, vm->svm.gpusvm.mm,
+			       &gpusvm_devmem_ops,
+			       &tile->mem.vram.dpagemap,
+			       range->base.va.end -
+			       range->base.va.start);
+
+	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
+	list_for_each_entry(block, blocks, link)
+		block->private = mr;
+
+	/*
+	 * Take ref because as soon as drm_gpusvm_migrate_to_devmem succeeds the
+	 * creation ref can be dropped upon CPU fault or unmap.
+	 */
+	xe_bo_get(bo);
+
+	err = drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm, &range->base,
+					   &bo->devmem_allocation, ctx);
+	if (err) {
+		xe_bo_put(bo);	/* Local ref */
+		xe_bo_put(bo);	/* Creation ref */
+		return ERR_PTR(err);
+	}
+
+	return bo;
+}
+
 int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 			    struct xe_tile *tile, u64 fault_addr,
 			    bool atomic)
 {
-	struct drm_gpusvm_ctx ctx = { .read_only = xe_vma_read_only(vma), };
+	struct drm_gpusvm_ctx ctx = { .read_only = xe_vma_read_only(vma),
+		.devmem_possible = IS_DGFX(vm->xe), .check_pages = true, };
 	struct xe_svm_range *range;
 	struct drm_gpusvm_range *r;
 	struct drm_exec exec;
 	struct dma_fence *fence;
+	struct xe_bo *bo = NULL;
 	ktime_t end = 0;
 	int err;
 
 	lockdep_assert_held_write(&vm->lock);
 
 retry:
+	xe_bo_put(bo);
+	bo = NULL;
+
 	/* Always process UNMAPs first so view SVM ranges is current */
 	err = xe_svm_garbage_collector(vm);
 	if (err)
@@ -572,9 +637,32 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (xe_svm_range_is_valid(range, tile))
 		return 0;
 
+	/* XXX: Add migration policy, for now migrate range once */
+	if (IS_DGFX(vm->xe) && !range->migrated &&
+	    range->base.flags.migrate_devmem &&
+	    (range->base.va.end - range->base.va.start) >= SZ_64K) {
+		range->migrated = true;
+
+		bo = xe_svm_alloc_vram(vm, tile, range, &ctx);
+		if (IS_ERR(bo)) {
+			drm_info(&vm->xe->drm,
+				 "VRAM allocation failed, falling back to retrying, asid=%u, errno %ld\n",
+				 vm->usm.asid, PTR_ERR(bo));
+			bo = NULL;
+			goto retry;
+		}
+	}
+
 	err = drm_gpusvm_range_get_pages(&vm->svm.gpusvm, r, &ctx);
 	if (err == -EFAULT || err == -EPERM)	/* Corner where CPU mappings have change */
-	       goto retry;
+	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {	/* Corner where CPU mappings have change */
+		if (err == -EOPNOTSUPP)
+			drm_gpusvm_range_evict(&vm->svm.gpusvm, &range->base);
+		drm_info(&vm->xe->drm,
+			 "Get pages failed, falling back to retrying, asid=%u, gpusvm=0x%016llx, errno %d\n",
+			 vm->usm.asid, (u64)&vm->svm.gpusvm, err);
+		goto retry;
+	}
 	if (err)
 		goto err_out;
 
@@ -605,6 +693,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	dma_fence_put(fence);
 
 err_out:
+	xe_bo_put(bo);
+
 	return err;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 760d22cefb1e..6893664dae70 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -21,6 +21,7 @@ struct xe_svm_range {
 	struct list_head garbage_collector_link;
 	u8 tile_present;
 	u8 tile_invalidated;
+	u8 migrated	:1;
 };
 
 int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr);
-- 
2.34.1

