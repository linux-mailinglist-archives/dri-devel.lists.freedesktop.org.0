Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E05E961C5D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 04:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4915210E487;
	Wed, 28 Aug 2024 02:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="atw40QJj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F080B10E44B;
 Wed, 28 Aug 2024 02:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724813291; x=1756349291;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gypVPkmhZXEdTDatyyfXN3j/p9WiXV7EnFZRvn9huV4=;
 b=atw40QJjTg/u++A7JtADK6AsdrQc7K9r7+06BJC7e+/KPLy/FqdPHHcB
 SIuVHGcF/DWFcZVn3SGP4b5EcVS3fs7TD+hD7ZuU4n+VfMNOeA9ZnomvV
 vIjkYUp4Qzt7vcErihdxSqEC34TtfKoYXPYcPqFp9Vezg3TWLskJWngl7
 WZdEweOCXnkBQrXOjX/XhdlNf4UGdI5hur0mVbYRqRva5uvchbGySUZcp
 Q6JByBZbPh57MXOgAVqNSdXIhJchJxqaOq+HttdNtjpg0Y5onaTm34NsL
 yfVqBM8KeyrJIM3nVjW1hgVGL0xar8Cr0jJnANcnXOFqCUBt4W1WVX3Kp w==;
X-CSE-ConnectionGUID: hIKASkQ5R4GbId2yW9/TQw==
X-CSE-MsgGUID: e4DcgTmcS3Gboc3GRVVQ8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13251942"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="13251942"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:11 -0700
X-CSE-ConnectionGUID: PDJKy8m2QPCaXFtLJjJP3w==
X-CSE-MsgGUID: 6LbZLG4qQVWMeAiN5H/R6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67224661"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: [RFC PATCH 23/28] drm/xe: Add SVM VRAM migration
Date: Tue, 27 Aug 2024 19:48:56 -0700
Message-Id: <20240828024901.2582335-24-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828024901.2582335-1-matthew.brost@intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
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
- DRM buddy allocations do not solve locking inversion problems between
  mmap lock and dma-resv locks.
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

Signed-off-by: Matthew Brost matthew.brost@intel.com
---
 drivers/gpu/drm/xe/xe_svm.c | 81 ++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_svm.h |  1 +
 2 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 4372c02a341f..fd8987e0a506 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -217,8 +217,13 @@ static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
 static int __xe_svm_garbage_collector(struct xe_vm *vm,
 				      struct xe_svm_range *range)
 {
+	struct drm_gpusvm_ctx ctx = {};
 	struct dma_fence *fence;
 
+	/* Evict any pages holding references to vram allocation */
+	if (range->base.flags.partial_unmap && IS_DGFX(vm->xe))
+		drm_gpusvm_migrate_to_sram(&vm->svm.gpusvm, &range->base, &ctx);
+
 	xe_vm_lock(vm, false);
 	fence = xe_vm_range_unbind(vm, range);
 	xe_vm_unlock(vm);
@@ -504,21 +509,77 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
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
+	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
+	list_for_each_entry(block, blocks, link)
+		block->private = mr;
+
+	/*
+	 * Take ref because as soon as drm_gpusvm_migrate_to_vram succeeds the
+	 * creation ref can be dropped upon CPU fault or unmap.
+	 */
+	xe_bo_get(bo);
+
+	err = drm_gpusvm_migrate_to_vram(&vm->svm.gpusvm, &range->base,
+					 bo, ctx);
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
+		.vram_possible = IS_DGFX(vm->xe), };
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
@@ -534,6 +595,22 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (xe_svm_range_is_valid(range, tile))
 		return 0;
 
+	/* XXX: Add migration policy, for now migrate range once */
+	if (IS_DGFX(vm->xe) && !range->migrated &&
+	    range->base.flags.migrate_vram &&
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
 	       goto retry;
@@ -567,6 +644,8 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	dma_fence_put(fence);
 
 err_out:
+	xe_bo_put(bo);
+
 	return err;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 8b72e91cc37d..3f432483a230 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -18,6 +18,7 @@ struct xe_svm_range {
 	struct list_head garbage_collector_link;
 	u8 tile_present;
 	u8 tile_invalidated;
+	u8 migrated	:1;
 };
 
 int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr);
-- 
2.34.1

