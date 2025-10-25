Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C0EC08FE4
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 14:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43EEE10E26F;
	Sat, 25 Oct 2025 12:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EdQv8w+L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5408010E26F;
 Sat, 25 Oct 2025 12:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761393903; x=1792929903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qXh27JTdx0e3tIbx1ceqs5c2y1/hCpl8K00yhZu9FGI=;
 b=EdQv8w+LNQ8vtsh4VDTFCSkknTBZ82iEu76NVllurXUYFqPePHAUkVUA
 fMDLzLVnv9bhFTTgHL3BokXp5iBmCYCbjRYGXUeEcWW2YXrCnV5DkaP31
 hIjbB5ilRH2jeCIx5TLAWht0OaLcbJ2XO+siirN0Gz4ZjpBg5p6MlZoH0
 2J4P4PI7QOg1F7D0WAgFyFLHZoUwA17k9v+OXP8msw8+KH4+jgl5iVvXH
 L5IZiNqxO5O4Eh6Qs9cFKvI1mqzUaiTxQEnhOSSsZD4hEJkHYKTLqoY+Z
 2/bO5hbIbdFXSsYLoPk8MOpiu6SFW/Mm3n3jOi/K0j1DximzNQMxUtlLW g==;
X-CSE-ConnectionGUID: JVM+vqCgRa2De1ASzy0Ahg==
X-CSE-MsgGUID: vBel+rcCQEGcreefuVCwGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63590383"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="63590383"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2025 05:05:03 -0700
X-CSE-ConnectionGUID: zA7S2mpWRT6BuDriNeTtEA==
X-CSE-MsgGUID: Wa8GBiUKT/eVGUKwzpMkzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="189023762"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.168])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2025 05:05:00 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH 09/15] drm/xe: Pass a drm_pagemap pointer around with the
 memory advise attributes
Date: Sat, 25 Oct 2025 14:04:06 +0200
Message-ID: <20251025120412.12262-10-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
References: <20251025120412.12262-1-thomas.hellstrom@linux.intel.com>
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

As a consequence, struct xe_vma_mem_attr() can't simply be assigned
or freed without taking the reference count of individual members
into account. Also add helpers to do that.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c        |  2 +-
 drivers/gpu/drm/xe/xe_vm.c         | 36 +++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_vm.h         |  1 +
 drivers/gpu/drm/xe/xe_vm_madvise.c |  1 +
 drivers/gpu/drm/xe/xe_vm_types.h   |  9 ++++++++
 5 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index d27e366f8e14..d27cedeaf70c 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -330,7 +330,7 @@ static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 range_start, u64
 	if (xe_vma_start(vma) == range_start && xe_vma_end(vma) == range_end) {
 		default_attr.pat_index = vma->attr.default_pat_index;
 		default_attr.default_pat_index  = vma->attr.default_pat_index;
-		vma->attr = default_attr;
+		xe_vma_mem_attr_copy(&vma->attr, &default_attr);
 	} else {
 		vm_dbg(&vm->xe->drm, "Split VMA start=0x%016llx, vma_end=0x%016llx",
 		       range_start, range_end);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 1dffcd9ab61b..3c3dc1b1ace9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -964,6 +964,27 @@ static void xe_vma_free(struct xe_vma *vma)
 		kfree(vma);
 }
 
+static void xe_vma_mem_attr_fini(struct xe_vma_mem_attr *attr)
+{
+	drm_pagemap_put(attr->preferred_loc.dpagemap);
+}
+
+/**
+ * xe_vma_mem_attr_copy() - copy an xe_vma_mem_attr structure.
+ * @to: Destination.
+ * @from: Source.
+ *
+ * Copies an xe_vma_mem_attr structure taking care to get reference
+ * counting of individual members right.
+ */
+void xe_vma_mem_attr_copy(struct xe_vma_mem_attr *to, struct xe_vma_mem_attr *from)
+{
+	xe_vma_mem_attr_fini(to);
+	*to = *from;
+	if (to->preferred_loc.dpagemap)
+		drm_pagemap_get(to->preferred_loc.dpagemap);
+}
+
 static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 				    struct xe_bo *bo,
 				    u64 bo_offset_or_userptr,
@@ -1014,8 +1035,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	if (vm->xe->info.has_atomic_enable_pte_bit)
 		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
 
-	vma->attr = *attr;
-
+	xe_vma_mem_attr_copy(&vma->attr, attr);
 	if (bo) {
 		struct drm_gpuvm_bo *vm_bo;
 
@@ -1023,6 +1043,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 
 		vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo->ttm.base);
 		if (IS_ERR(vm_bo)) {
+			xe_vma_mem_attr_fini(&vma->attr);
 			xe_vma_free(vma);
 			return ERR_CAST(vm_bo);
 		}
@@ -1042,6 +1063,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 
 			err = xe_userptr_setup(uvma, xe_vma_userptr(vma), size);
 			if (err) {
+				xe_vma_mem_attr_fini(&vma->attr);
 				xe_vma_free(vma);
 				return ERR_PTR(err);
 			}
@@ -1057,6 +1079,8 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 {
 	struct xe_vm *vm = xe_vma_vm(vma);
 
+	xe_vma_mem_attr_fini(&vma->attr);
+
 	if (vma->ufence) {
 		xe_sync_ufence_put(vma->ufence);
 		vma->ufence = NULL;
@@ -4221,7 +4245,7 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 	struct drm_gpuva_op *__op;
 	unsigned int vma_flags = 0;
 	bool remap_op = false;
-	struct xe_vma_mem_attr tmp_attr;
+	struct xe_vma_mem_attr tmp_attr = {};
 	u16 default_pat;
 	int err;
 
@@ -4314,7 +4338,7 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 			 * VMA, so they can be assigned to newly MAP created vma.
 			 */
 			if (is_madvise)
-				tmp_attr = vma->attr;
+				xe_vma_mem_attr_copy(&tmp_attr, &vma->attr);
 
 			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
 		} else if (__op->op == DRM_GPUVA_OP_MAP) {
@@ -4324,12 +4348,13 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 			 * copy them to new vma.
 			 */
 			if (is_madvise)
-				vma->attr = tmp_attr;
+				xe_vma_mem_attr_copy(&vma->attr, &tmp_attr);
 		}
 	}
 
 	xe_vm_unlock(vm);
 	drm_gpuva_ops_free(&vm->gpuvm, ops);
+	xe_vma_mem_attr_fini(&tmp_attr);
 	return 0;
 
 unwind_ops:
@@ -4387,3 +4412,4 @@ int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t start, uint64_t r
 
 	return xe_vm_alloc_vma(vm, &map_req, false);
 }
+
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index ef8a5019574e..d328d31afe8e 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -411,4 +411,5 @@ static inline struct drm_exec *xe_vm_validation_exec(struct xe_vm *vm)
 #define xe_vm_has_valid_gpu_mapping(tile, tile_present, tile_invalidated)	\
 	((READ_ONCE(tile_present) & ~READ_ONCE(tile_invalidated)) & BIT((tile)->id))
 
+void xe_vma_mem_attr_copy(struct xe_vma_mem_attr *to, struct xe_vma_mem_attr *from);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index cad3cf627c3f..9553008409d1 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -95,6 +95,7 @@ static void madvise_preferred_mem_loc(struct xe_device *xe, struct xe_vm *vm,
 			 */
 			vmas[i]->attr.preferred_loc.migration_policy =
 						op->preferred_mem_loc.migration_policy;
+			vmas[i]->attr.preferred_loc.dpagemap = NULL;
 		}
 	}
 }
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 4f9a6cdb5d02..70856d536047 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -20,6 +20,8 @@
 #include "xe_range_fence.h"
 #include "xe_userptr.h"
 
+struct drm_pagemap;
+
 struct xe_bo;
 struct xe_svm_range;
 struct xe_sync_entry;
@@ -65,6 +67,13 @@ struct xe_vma_mem_attr {
 		 * closest device memory respectively.
 		 */
 		u32 devmem_fd;
+		/**
+		 * @preferred_loc.dpagemap: Reference-counted pointer to the drm_pagemap preferred
+		 * for migration on a SVM page-fault. The pointer is protected by the
+		 * vm lock, and is %NULL if @devmem_fd should be consulted for special
+		 * values.
+		 */
+		struct drm_pagemap *dpagemap;
 	} preferred_loc;
 
 	/**
-- 
2.51.0

