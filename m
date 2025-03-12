Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E99A5E608
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 22:04:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE60C10E7A2;
	Wed, 12 Mar 2025 21:04:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B8nAPLZn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B322310E6B0;
 Wed, 12 Mar 2025 21:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741813493; x=1773349493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b8sw+RJYlvAaX8wa+CTjfXhGJCJ0WAR1aw/Bcv0sSIc=;
 b=B8nAPLZntCG/4Hl8mSAmGgrx2LYscv5m4igc6hPE3rcQbMR0WfroFNr2
 /aKa6HnEuNF/VVZRZ8yTeHylfUr+PYTT+W6/YjtouQJYD6MFbERdZoeOo
 2CO1P6EBpjPs6jQhXHpTDoe4s2iQWBdPvUU40lc/ev/xiYt+PnOX5dmxV
 cQswKdbpQtZpasiEAJLCxk5+KfDlv4GGWAQ7bCtyHJh7xmgfA6Umv4+E/
 +ejCOmAAG3YIZurvQcmQEQtKzAYq6hmNggfDh2WiI2Pq6fwpfYqrCG4EA
 ev9YxS7F4BiTlZdwEbXTi9rEO0c7ApJk9edRNlFHlQfwyqH1wfzTbzOQ4 Q==;
X-CSE-ConnectionGUID: nzDmUPErQNqvlNtPbG5Ljw==
X-CSE-MsgGUID: Au98lcI6T32cAH5Qax9/BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="46562109"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="46562109"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:04:53 -0700
X-CSE-ConnectionGUID: yG+JSNd2Qn2jEMi8NMA95w==
X-CSE-MsgGUID: XmDyvIMnTnOipnjJnP5iFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="120791038"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.73])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:04:49 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [RFC PATCH 01/19] drm/xe: Introduce CONFIG_DRM_XE_GPUSVM
Date: Wed, 12 Mar 2025 22:03:58 +0100
Message-ID: <20250312210416.3120-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
References: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
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

Don't rely on CONFIG_DRM_GPUSVM because other drivers may enable it
causing us to compile in SVM support unintentionally.

Also take the opportunity to leave more code out of compilation if
!CONFIG_DRM_XE_GPUSVM and !CONFIG_DRM_XE_DEVMEM_MIRROR

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/Kconfig           | 16 ++++++-
 drivers/gpu/drm/xe/Makefile          |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h |  6 ++-
 drivers/gpu/drm/xe/xe_migrate.c      |  3 ++
 drivers/gpu/drm/xe/xe_pt.c           |  6 +++
 drivers/gpu/drm/xe/xe_query.c        |  2 +-
 drivers/gpu/drm/xe/xe_svm.c          | 15 ++++++
 drivers/gpu/drm/xe/xe_svm.h          | 72 ++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_vm.c           |  2 +-
 9 files changed, 97 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 7d7995196702..aea4240664fa 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -39,7 +39,7 @@ config DRM_XE
 	select DRM_TTM_HELPER
 	select DRM_EXEC
 	select DRM_GPUVM
-	select DRM_GPUSVM if !UML && DEVICE_PRIVATE
+	select DRM_GPUSVM if DRM_XE_GPUSVM
 	select DRM_SCHED
 	select MMU_NOTIFIER
 	select WANT_DEV_COREDUMP
@@ -74,9 +74,21 @@ config DRM_XE_DP_TUNNEL
 
 	  If in doubt say "Y".
 
+config DRM_XE_GPUSVM
+	bool "Enable CPU to GPU address mirroring"
+	depends on DRM_XE
+	depends on !UML
+	default y
+	select DEVICE_PRIVATE
+	help
+	  Enable this option if you want support for CPU to GPU address
+	  mirroring.
+
+	  If in doubut say "Y".
+
 config DRM_XE_DEVMEM_MIRROR
 	bool "Enable device memory mirror"
-	depends on DRM_XE
+	depends on DRM_XE_GPUSVM
 	select GET_FREE_REGION
 	default y
 	help
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 9699b08585f7..e4fec90bab55 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -125,7 +125,7 @@ xe-y += xe_bb.o \
 	xe_wopcm.o
 
 xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
-xe-$(CONFIG_DRM_GPUSVM) += xe_svm.o
+xe-$(CONFIG_DRM_XE_GPUSVM) += xe_svm.o
 
 # graphics hardware monitoring (HWMON) support
 xe-$(CONFIG_HWMON) += xe_hwmon.o
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 72ef0b6fc425..8aa90acc2a0a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -107,6 +107,9 @@ struct xe_vram_region {
 	resource_size_t actual_physical_size;
 	/** @mapping: pointer to VRAM mappable space */
 	void __iomem *mapping;
+	/** @ttm: VRAM TTM manager */
+	struct xe_ttm_vram_mgr ttm;
+#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
 	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
 	struct dev_pagemap pagemap;
 	/**
@@ -120,8 +123,7 @@ struct xe_vram_region {
 	 * This is generated when remap device memory as ZONE_DEVICE
 	 */
 	resource_size_t hpa_base;
-	/** @ttm: VRAM TTM manager */
-	struct xe_ttm_vram_mgr ttm;
+#endif
 };
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index df4282c71bf0..d364c9f458e7 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -1544,6 +1544,7 @@ void xe_migrate_wait(struct xe_migrate *m)
 		dma_fence_wait(m->fence, false);
 }
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
 static u32 pte_update_cmd_size(u64 size)
 {
 	u32 num_dword;
@@ -1719,6 +1720,8 @@ struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
 			       XE_MIGRATE_COPY_TO_SRAM);
 }
 
+#endif
+
 #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
 #include "tests/xe_migrate.c"
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index ffaf0d02dc7d..9e719535a3bb 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1420,6 +1420,7 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 	return err;
 }
 
+#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
 static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
 {
 	struct xe_vm *vm = pt_update->vops->vm;
@@ -1453,6 +1454,7 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
 
 	return 0;
 }
+#endif
 
 struct invalidation_fence {
 	struct xe_gt_tlb_invalidation_fence base;
@@ -2257,11 +2259,15 @@ static const struct xe_migrate_pt_update_ops userptr_migrate_ops = {
 	.pre_commit = xe_pt_userptr_pre_commit,
 };
 
+#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
 static const struct xe_migrate_pt_update_ops svm_migrate_ops = {
 	.populate = xe_vm_populate_pgtable,
 	.clear = xe_migrate_clear_pgtable_callback,
 	.pre_commit = xe_pt_svm_pre_commit,
 };
+#else
+static const struct xe_migrate_pt_update_ops svm_migrate_ops;
+#endif
 
 /**
  * xe_pt_update_ops_run() - Run PT update operations
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 5e65830dad25..2dbf4066d86f 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -340,7 +340,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
-	if (xe->info.has_usm && IS_ENABLED(CONFIG_DRM_GPUSVM))
+	if (xe->info.has_usm && IS_ENABLED(CONFIG_DRM_XE_GPUSVM))
 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR;
 	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 516898e99b26..c305d4c351d7 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -339,6 +339,8 @@ static void xe_svm_garbage_collector_work_func(struct work_struct *w)
 	up_write(&vm->lock);
 }
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
+
 static struct xe_vram_region *page_to_vr(struct page *page)
 {
 	return container_of(page->pgmap, struct xe_vram_region, pagemap);
@@ -577,6 +579,8 @@ static const struct drm_gpusvm_devmem_ops gpusvm_devmem_ops = {
 	.copy_to_ram = xe_svm_copy_to_ram,
 };
 
+#endif
+
 static const struct drm_gpusvm_ops gpusvm_ops = {
 	.range_alloc = xe_svm_range_alloc,
 	.range_free = xe_svm_range_free,
@@ -650,6 +654,7 @@ static bool xe_svm_range_is_valid(struct xe_svm_range *range,
 	return (range->tile_present & ~range->tile_invalidated) & BIT(tile->id);
 }
 
+#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
 static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
 {
 	return &tile->mem.vram;
@@ -708,6 +713,15 @@ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 
 	return err;
 }
+#else
+static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
+			     struct xe_svm_range *range,
+			     const struct drm_gpusvm_ctx *ctx)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
 
 /**
  * xe_svm_handle_pagefault() - SVM handle page fault
@@ -863,6 +877,7 @@ int xe_svm_bo_evict(struct xe_bo *bo)
 }
 
 #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
+
 static struct drm_pagemap_device_addr
 xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
 			  struct device *dev,
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index e059590e5076..c32b6d46ecf1 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -6,6 +6,8 @@
 #ifndef _XE_SVM_H_
 #define _XE_SVM_H_
 
+#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
+
 #include <drm/drm_pagemap.h>
 #include <drm/drm_gpusvm.h>
 
@@ -43,7 +45,6 @@ struct xe_svm_range {
 	u8 skip_migrate	:1;
 };
 
-#if IS_ENABLED(CONFIG_DRM_GPUSVM)
 /**
  * xe_svm_range_pages_valid() - SVM range pages valid
  * @range: SVM range
@@ -72,7 +73,49 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end);
 int xe_svm_bo_evict(struct xe_bo *bo);
 
 void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
+
+/**
+ * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
+ * @range: SVM range
+ *
+ * Return: True if SVM range has a DMA mapping, False otherwise
+ */
+static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
+{
+	lockdep_assert_held(&range->base.gpusvm->notifier_lock);
+	return range->base.flags.has_dma_mapping;
+}
+
+#define xe_svm_assert_in_notifier(vm__) \
+	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
+
+#define xe_svm_notifier_lock(vm__)	\
+	drm_gpusvm_notifier_lock(&(vm__)->svm.gpusvm)
+
+#define xe_svm_notifier_unlock(vm__)	\
+	drm_gpusvm_notifier_unlock(&(vm__)->svm.gpusvm)
+
 #else
+#include <linux/interval_tree.h>
+
+struct drm_pagemap_device_addr;
+struct xe_bo;
+struct xe_vm;
+struct xe_vma;
+struct xe_tile;
+struct xe_vram_region;
+
+#define XE_INTERCONNECT_VRAM 1
+
+struct xe_svm_range {
+	struct {
+		struct interval_tree_node itree;
+		const struct drm_pagemap_device_addr *dma_addr;
+	} base;
+	u32 tile_present;
+	u32 tile_invalidated;
+};
+
 static inline bool xe_svm_range_pages_valid(struct xe_svm_range *range)
 {
 	return false;
@@ -124,27 +167,16 @@ static inline
 void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
 {
 }
-#endif
 
-/**
- * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
- * @range: SVM range
- *
- * Return: True if SVM range has a DMA mapping, False otherwise
- */
-static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
+#define xe_svm_assert_in_notifier(...) do {} while (0)
+#define xe_svm_range_has_dma_mapping(...) false
+
+static inline void xe_svm_notifier_lock(struct xe_vm *vm)
 {
-	lockdep_assert_held(&range->base.gpusvm->notifier_lock);
-	return range->base.flags.has_dma_mapping;
 }
 
-#define xe_svm_assert_in_notifier(vm__) \
-	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
-
-#define xe_svm_notifier_lock(vm__)	\
-	drm_gpusvm_notifier_lock(&(vm__)->svm.gpusvm)
-
-#define xe_svm_notifier_unlock(vm__)	\
-	drm_gpusvm_notifier_unlock(&(vm__)->svm.gpusvm)
-
+static inline void xe_svm_notifier_unlock(struct xe_vm *vm)
+{
+}
+#endif
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 60303998bd61..07c4992fb3d7 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3109,7 +3109,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 
 		if (XE_IOCTL_DBG(xe, is_cpu_addr_mirror &&
 				 (!xe_vm_in_fault_mode(vm) ||
-				 !IS_ENABLED(CONFIG_DRM_GPUSVM)))) {
+				 !IS_ENABLED(CONFIG_DRM_XE_GPUSVM)))) {
 			err = -EINVAL;
 			goto free_bind_ops;
 		}
-- 
2.48.1

