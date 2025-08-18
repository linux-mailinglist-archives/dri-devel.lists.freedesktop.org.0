Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E99B2B36D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 23:31:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E174B10E4EC;
	Mon, 18 Aug 2025 21:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P7B6oB/f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4819210E4DB;
 Mon, 18 Aug 2025 21:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755552679; x=1787088679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9RFN2DDxKokjNY1ZAHjLUnEW9z5kxKOBnpNhZL9Fiig=;
 b=P7B6oB/fMVSGZ3XIkVXU9BtaaicSHX5hiXdrocf07yVi0mNLYODVScSB
 NJ0OcHIUP63VUqJNcesyZACdHkcmUfTUGIZs/azEDdCTis56pZfQcbaqH
 yhGaO+8kcNE0GpzpK/eyLU7eT9RStKcxt7Iqyzs1712hB65fNng+U9xkY
 Bpe37Bh7mjWgpbpJiQPpUYlR6JdZ2isNNCXhG3GiSLV4qGpEDF2YIk4pS
 YwZNbcizrpzeLWk2KzqzktXmMeLIZHcWloOpoarYkVghaJPkTtiD7Uo7p
 MixZUct9bCGlVo0K21wgJ1dtBp2DgyYHJWlqHliSjC4Xeyp1Q2Azg/PqM w==;
X-CSE-ConnectionGUID: oSOkCjR+Tzi9Qe9alWySMA==
X-CSE-MsgGUID: LXY6LuJ7SgSImqb+YebWzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="56815254"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="56815254"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 14:31:12 -0700
X-CSE-ConnectionGUID: 4NNPa8SzQKOiZJq4W57nkw==
X-CSE-MsgGUID: U1fQ833pTVudmuSuQ4tMdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="167186328"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by fmviesa007.fm.intel.com with ESMTP; 18 Aug 2025 14:31:10 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v8 17/24] drm/xe/svm: Consult madvise preferred location in
 prefetch
Date: Tue, 19 Aug 2025 03:27:46 +0530
Message-Id: <20250818215753.2762426-18-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250818215753.2762426-1-himal.prasad.ghimiray@intel.com>
References: <20250818215753.2762426-1-himal.prasad.ghimiray@intel.com>
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

When prefetch region is DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC, prefetch svm
ranges to preferred location provided by madvise.

v2 (Matthew Brost)
- Fix region, devmem_fd usages
- consult madvise is applicable for other vma's too.

v3
- Fix atomic handling

v4
- Fix xe_svm_range_validate to check for
  DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC too.

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 47 ++++++++++++++++++++------------
 drivers/gpu/drm/xe/xe_vm_types.h |  7 +++--
 2 files changed, 35 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8a93c09e87ca..9974734e8806 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -38,6 +38,7 @@
 #include "xe_res_cursor.h"
 #include "xe_svm.h"
 #include "xe_sync.h"
+#include "xe_tile.h"
 #include "xe_trace_bo.h"
 #include "xe_wa.h"
 #include "xe_hmm.h"
@@ -2396,9 +2397,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 				__xe_vm_needs_clear_scratch_pages(vm, flags);
 		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
 			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
+			struct xe_tile *tile;
 			struct xe_svm_range *svm_range;
 			struct drm_gpusvm_ctx ctx = {};
-			struct xe_tile *tile;
+			struct drm_pagemap *dpagemap;
 			u8 id, tile_mask = 0;
 			u32 i;
 
@@ -2415,8 +2417,24 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 				tile_mask |= 0x1 << id;
 
 			xa_init_flags(&op->prefetch_range.range, XA_FLAGS_ALLOC);
-			op->prefetch_range.region = prefetch_region;
 			op->prefetch_range.ranges_count = 0;
+			tile = NULL;
+
+			if (prefetch_region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC) {
+				dpagemap = xe_vma_resolve_pagemap(vma,
+								  xe_device_get_root_tile(vm->xe));
+				/*
+				 * TODO: Once multigpu support is enabled will need
+				 * something to dereference tile from dpagemap.
+				 */
+				if (dpagemap)
+					tile = xe_device_get_root_tile(vm->xe);
+			} else if (prefetch_region) {
+				tile = &vm->xe->tiles[region_to_mem_type[prefetch_region] -
+						      XE_PL_VRAM0];
+			}
+
+			op->prefetch_range.tile = tile;
 alloc_next_range:
 			svm_range = xe_svm_range_find_or_insert(vm, addr, vma, &ctx);
 
@@ -2435,7 +2453,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 				goto unwind_prefetch_ops;
 			}
 
-			if (xe_svm_range_validate(vm, svm_range, tile_mask, !!prefetch_region)) {
+			if (xe_svm_range_validate(vm, svm_range, tile_mask, !!tile)) {
 				xe_svm_range_debug(svm_range, "PREFETCH - RANGE IS VALID");
 				goto check_next_range;
 			}
@@ -2931,30 +2949,26 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 {
 	bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_PAGEMAP);
 	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
+	struct xe_tile *tile = op->prefetch_range.tile;
 	int err = 0;
 
 	struct xe_svm_range *svm_range;
 	struct drm_gpusvm_ctx ctx = {};
-	struct xe_tile *tile;
 	unsigned long i;
-	u32 region;
 
 	if (!xe_vma_is_cpu_addr_mirror(vma))
 		return 0;
 
-	region = op->prefetch_range.region;
-
 	ctx.read_only = xe_vma_read_only(vma);
 	ctx.devmem_possible = devmem_possible;
 	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
 
 	/* TODO: Threading the migration */
 	xa_for_each(&op->prefetch_range.range, i, svm_range) {
-		if (!region)
+		if (!tile)
 			xe_svm_range_migrate_to_smem(vm, svm_range);
 
-		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
-			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
+		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, !!tile)) {
 			err = xe_svm_alloc_vram(tile, svm_range, &ctx);
 			if (err) {
 				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
@@ -3017,12 +3031,11 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
 		u32 region;
 
-		if (xe_vma_is_cpu_addr_mirror(vma))
-			region = op->prefetch_range.region;
-		else
+		if (!xe_vma_is_cpu_addr_mirror(vma)) {
 			region = op->prefetch.region;
-
-		xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
+			xe_assert(vm->xe, region == DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC ||
+				  region <= ARRAY_SIZE(region_to_mem_type));
+		}
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op->base.prefetch.va),
@@ -3440,8 +3453,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 				 op == DRM_XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, prefetch_region &&
 				 op != DRM_XE_VM_BIND_OP_PREFETCH) ||
-		    XE_IOCTL_DBG(xe, !(BIT(prefetch_region) &
-				       xe->info.mem_region_mask)) ||
+		    XE_IOCTL_DBG(xe,  (prefetch_region != DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC &&
+				       !(BIT(prefetch_region) & xe->info.mem_region_mask))) ||
 		    XE_IOCTL_DBG(xe, obj &&
 				 op == DRM_XE_VM_BIND_OP_UNMAP)) {
 			err = -EINVAL;
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index dde7218ceba6..5704f379c225 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -428,8 +428,11 @@ struct xe_vma_op_prefetch_range {
 	struct xarray range;
 	/** @ranges_count: number of svm ranges to map */
 	u32 ranges_count;
-	/** @region: memory region to prefetch to */
-	u32 region;
+	/**
+	 * @tile: Pointer to the tile structure containing memory to prefetch.
+	 *        NULL if prefetch requested region is smem
+	 */
+	struct xe_tile *tile;
 };
 
 /** enum xe_vma_op_flags - flags for VMA operation */
-- 
2.34.1

