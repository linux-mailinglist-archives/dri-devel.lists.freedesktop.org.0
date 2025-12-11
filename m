Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C73A8CB6993
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 18:00:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2364110E868;
	Thu, 11 Dec 2025 17:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cwRn3cRI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F62110E859;
 Thu, 11 Dec 2025 17:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765472418; x=1797008418;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D5vJRNKvKQ+f0XXVABuazpI16u286MXp6JJwuZt8pLU=;
 b=cwRn3cRI8nWQ6bQ5v745QyI5uRfTQDhRzYX6CEqCIwn5rPvOWfiMvU6T
 V5Ajh9gKkHaht/N7shNU21dBOQ/Zyu3sGYIndSQqSNwls2mGfzJOHFwKZ
 gfKw2ocdlNY0c0XhsH61cA7WQOXfQK2BpXwoC3DVFwpEOc0tynHXw6UFT
 /0dKgVPi5JRlIAW440y/dz3MSBrJoAaCXC8TTUjtTvA15+8T1pyqaR4C5
 ihg3e6aW+eSt47mdh7FUu3E2+Np/nCjWrod2LV2nmY+LKRwXLaFF6dDQe
 bgaqClga+PQ53nLWT9JhqgAT0Pa+FHz8O/r/4Xz4uffgiKxnqrkkBqNdx Q==;
X-CSE-ConnectionGUID: e4goMwRVSCqvVlWW18ZXgA==
X-CSE-MsgGUID: Vd82oVAkTCCmYDml2qL65A==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71083148"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="71083148"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 09:00:17 -0800
X-CSE-ConnectionGUID: tKIatXe8Tyee6fudyf4Q8Q==
X-CSE-MsgGUID: b9RYAHUaRfyh3CB7Ibi2Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196849628"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO fedora)
 ([10.245.244.197])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 09:00:14 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PATCH v4 11/22] drm/xe: Pass a drm_pagemap pointer around with the
 memory advise attributes
Date: Thu, 11 Dec 2025 17:58:58 +0100
Message-ID: <20251211165909.219710-12-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251211165909.219710-1-thomas.hellstrom@linux.intel.com>
References: <20251211165909.219710-1-thomas.hellstrom@linux.intel.com>
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

v2:
- Move some calls to xe_vma_mem_attr_fini() to xe_vma_free(). (Matt Brost)
v3:
- Rebase.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v2
---
 drivers/gpu/drm/xe/xe_svm.c        | 12 +++++++----
 drivers/gpu/drm/xe/xe_vm.c         | 34 +++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_vm.h         |  1 +
 drivers/gpu/drm/xe/xe_vm_madvise.c |  1 +
 drivers/gpu/drm/xe/xe_vm_types.h   |  9 ++++++++
 5 files changed, 48 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 82335b942252..3b41ea1e1e73 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -301,10 +301,14 @@ static int __xe_svm_garbage_collector(struct xe_vm *vm,
 
 static void xe_vma_set_default_attributes(struct xe_vma *vma)
 {
-	vma->attr.preferred_loc.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE;
-	vma->attr.preferred_loc.migration_policy = DRM_XE_MIGRATE_ALL_PAGES;
-	vma->attr.pat_index = vma->attr.default_pat_index;
-	vma->attr.atomic_access = DRM_XE_ATOMIC_UNDEFINED;
+	struct xe_vma_mem_attr default_attr = {
+		.preferred_loc.devmem_fd = DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE,
+		.preferred_loc.migration_policy = DRM_XE_MIGRATE_ALL_PAGES,
+		.pat_index = vma->attr.default_pat_index,
+		.atomic_access = DRM_XE_ATOMIC_UNDEFINED,
+	};
+
+	xe_vma_mem_attr_copy(&vma->attr, &default_attr);
 }
 
 static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 start, u64 end)
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 743f45727252..b1e708a1b236 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -957,14 +957,37 @@ struct dma_fence *xe_vm_range_unbind(struct xe_vm *vm,
 	return fence;
 }
 
+static void xe_vma_mem_attr_fini(struct xe_vma_mem_attr *attr)
+{
+	drm_pagemap_put(attr->preferred_loc.dpagemap);
+}
+
 static void xe_vma_free(struct xe_vma *vma)
 {
+	xe_vma_mem_attr_fini(&vma->attr);
+
 	if (xe_vma_is_userptr(vma))
 		kfree(to_userptr_vma(vma));
 	else
 		kfree(vma);
 }
 
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
@@ -1015,8 +1038,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 	if (vm->xe->info.has_atomic_enable_pte_bit)
 		vma->gpuva.flags |= XE_VMA_ATOMIC_PTE_BIT;
 
-	vma->attr = *attr;
-
+	xe_vma_mem_attr_copy(&vma->attr, attr);
 	if (bo) {
 		struct drm_gpuvm_bo *vm_bo;
 
@@ -4318,7 +4340,7 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 	struct drm_gpuva_op *__op;
 	unsigned int vma_flags = 0;
 	bool remap_op = false;
-	struct xe_vma_mem_attr tmp_attr;
+	struct xe_vma_mem_attr tmp_attr = {};
 	u16 default_pat;
 	int err;
 
@@ -4413,7 +4435,7 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
 			 * VMA, so they can be assigned to newly MAP created vma.
 			 */
 			if (is_madvise)
-				tmp_attr = vma->attr;
+				xe_vma_mem_attr_copy(&tmp_attr, &vma->attr);
 
 			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
 		} else if (__op->op == DRM_GPUVA_OP_MAP) {
@@ -4423,12 +4445,13 @@ static int xe_vm_alloc_vma(struct xe_vm *vm,
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
@@ -4526,3 +4549,4 @@ int xe_vm_alloc_cpu_addr_mirror_vma(struct xe_vm *vm, uint64_t start, uint64_t r
 
 	return xe_vm_alloc_vma(vm, &map_req, false);
 }
+
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 361f10b3c453..7d11ca47d73e 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -414,4 +414,5 @@ static inline struct drm_exec *xe_vm_validation_exec(struct xe_vm *vm)
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
index 62a9e16352ba..0eaaebb42d9a 100644
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
2.51.1

