Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B71EA53FD5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 02:26:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BFA410E8A4;
	Thu,  6 Mar 2025 01:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Di5IFv2x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3DD10E89B;
 Thu,  6 Mar 2025 01:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741224359; x=1772760359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZqhZaAXNY5bqTTt6ZXXME+z9oWTcEFBVI32iKpLS1Z8=;
 b=Di5IFv2x03qIUZL2QDD/JaO0HXFbH9w41T8yjyXeCyzjbqj+4l3HD29g
 j3cc7825q9X0m8mW1mJY2B5l5et+QcQ+ToFqB0cbvBvJTcyQRWxlRT7nd
 QV/KfI+psMjm/Oq6jTeKds7/u8GQ4ki84kSbqaiyy4BlVdd7n9uFZkLOj
 3gbQ9jrvEKcYiSK3zCtfL/JCu7UpUXWJqcBmxSPxM0XfGSq1eUA8oMBRn
 ZIvw7JrrbNcihJWsn9dRKTQxAPtds39yaogVJNZNM2E427ALoWic2kft9
 ulc7iu26AGTbZmfPHiXOf5BaHr3Z8nTK1Hm1tPMP/3hhaJl20dokjEoeM w==;
X-CSE-ConnectionGUID: 1e7mtAqOQl6vIVwr2NCxYw==
X-CSE-MsgGUID: 2jX0vrRARR2Ne5dDWPC8Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52427438"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="52427438"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:55 -0800
X-CSE-ConnectionGUID: lCcelRwkQr2DRUkc7tzMeQ==
X-CSE-MsgGUID: tIlR9FuyQRKtdahJXZ7Ubg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124063314"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:54 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v7 27/32] drm/xe: Add SVM VRAM migration
Date: Wed,  5 Mar 2025 17:26:52 -0800
Message-Id: <20250306012657.3505757-28-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306012657.3505757-1-matthew.brost@intel.com>
References: <20250306012657.3505757-1-matthew.brost@intel.com>
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
v6:
 - s/drm_info/drm_dbg (Thomas)
 - s/migrated/skip_migrate (Himal)
 - Better debug message on VRAM migration failure (Himal)
 - Drop return BO from VRAM allocation function (Thomas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 97 +++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_svm.h |  5 ++
 2 files changed, 98 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index cb3567b561be..34ecdbcb23b9 100644
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
@@ -508,7 +513,6 @@ static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocatio
 	return 0;
 }
 
-__maybe_unused
 static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
 	.devmem_release = xe_svm_devmem_release,
 	.populate_devmem_pfn = xe_svm_populate_devmem_pfn,
@@ -588,6 +592,62 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
 	return (range->tile_present & ~range->tile_invalidated) & BIT(tile->id);
 }
 
+static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
+{
+	return &tile->mem.vram;
+}
+
+static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
+			     struct xe_svm_range *range,
+			     const struct drm_gpusvm_ctx *ctx)
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
+		return -EFAULT;
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
+	err = drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm, &range->base,
+					   &bo->devmem_allocation, ctx);
+	xe_bo_unlock(bo);
+	if (err)
+		xe_bo_put(bo);	/* Creation ref */
+
+unlock:
+	mmap_read_unlock(mm);
+	mmput(mm);
+
+	return err;
+}
+
 /**
  * xe_svm_handle_pagefault() - SVM handle page fault
  * @vm: The VM.
@@ -596,7 +656,8 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
  * @fault_addr: The GPU fault address.
  * @atomic: The fault atomic access bit.
  *
- * Create GPU bindings for a SVM page fault.
+ * Create GPU bindings for a SVM page fault. Optionally migrate to device
+ * memory.
  *
  * Return: 0 on success, negative error code on error.
  */
@@ -604,7 +665,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
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
@@ -631,9 +698,31 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 	if (xe_svm_range_is_valid(range, tile))
 		return 0;
 
+	/* XXX: Add migration policy, for now migrate range once */
+	if (!range->skip_migrate && range->base.flags.migrate_devmem &&
+	    xe_svm_range_size(range) >= SZ_64K) {
+		range->skip_migrate = true;
+
+		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
+		if (err) {
+			drm_dbg(&vm->xe->drm,
+				"VRAM allocation failed, falling back to "
+				"retrying fault, asid=%u, errno=%pe\n",
+				vm->usm.asid, ERR_PTR(err));
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
+		drm_dbg(&vm->xe->drm,
+			"Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
+			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
 		goto retry;
+	}
 	if (err)
 		goto err_out;
 
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 49c35e9ec183..5d4eeb2d34ce 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -35,6 +35,11 @@ struct xe_svm_range {
 	 * range. Protected by GPU SVM notifier lock.
 	 */
 	u8 tile_invalidated;
+	/**
+	 * @skip_migrate: Skip migration to VRAM, protected by GPU fault handler
+	 * locking.
+	 */
+	u8 skip_migrate	:1;
 };
 
 #if IS_ENABLED(CONFIG_DRM_GPUSVM)
-- 
2.34.1

