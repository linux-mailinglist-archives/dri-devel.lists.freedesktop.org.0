Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A15BC08FE1
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 14:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06DE510E26B;
	Sat, 25 Oct 2025 12:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GIpnX3XT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7A410E278;
 Sat, 25 Oct 2025 12:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761393900; x=1792929900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CRDMYFHSFfBxR7yOnupNnGpyQDIPLj8qNONnqjZhkMg=;
 b=GIpnX3XTfPJrHw2GOwdidA4LZFltRXf2IRA62eIjy3UmIgeQUD/oH6GQ
 ipD/JWDosNxYDIorl2zGYAvd5i45f+RK7DG4jcTGayBNW1CJKcOTHo5Cj
 43gyXc8txq0VzUx1sbDKL6TQGbJvQSgEYWJ/V394x1ymh+hmMu/9QYrok
 QhhukkG/8p3YNtCEX+mkRadBDrc/KGO53RYsO/UDQFhfBMChOI1z+TkKl
 GWXERspGpFtPgbqDjTq/k0nVQQgUdoSsc/98K/VZ4rdJcI3ruSbYzTd4C
 c4RtTIqItkvnUsBjxhPFFb/1nCjxx0uDp2DoT6EIT8GiEGetHEufSftm9 g==;
X-CSE-ConnectionGUID: 68hjrS5wSr2q1MYySaxmlw==
X-CSE-MsgGUID: 1KsRvGtsQaOd/7iNjRCbnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63590381"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="63590381"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2025 05:05:00 -0700
X-CSE-ConnectionGUID: tzogCvWfS7adRm24WrMJHQ==
X-CSE-MsgGUID: G9fNVcwDSuuq85gUYeSruw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; d="scan'208";a="189023748"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.168])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2025 05:04:57 -0700
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
Subject: [PATCH 08/15] drm/xe: Use the drm_pagemap_util helper to get a svm
 pagemap owner
Date: Sat, 25 Oct 2025 14:04:05 +0200
Message-ID: <20251025120412.12262-9-thomas.hellstrom@linux.intel.com>
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

Register a driver-wide owner list, provide a callback to identify
fast interconnects and use the drm_pagemap_util helper to allocate
or reuse a suitable owner struct. For now we consider pagemaps on
different tiles on the same device as having fast interconnect and
thus the same owner.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c      | 57 ++++++++++++++++++++++++++++----
 drivers/gpu/drm/xe/xe_svm.h      | 24 ++++++--------
 drivers/gpu/drm/xe/xe_userptr.c  |  2 +-
 drivers/gpu/drm/xe/xe_vm.c       |  2 +-
 drivers/gpu/drm/xe/xe_vm_types.h |  3 ++
 5 files changed, 66 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 8aced064c83f..d27e366f8e14 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -22,8 +22,17 @@
 #include "xe_vm_types.h"
 #include "xe_vram_types.h"
 
+/* Identifies subclasses of struct drm_pagemap_peer */
+#define XE_PEER_PAGEMAP ((void *)0ul)
+#define XE_PEER_VM ((void *)1ul)
+
 static int xe_svm_get_pagemaps(struct xe_vm *vm);
 
+void *xe_svm_private_page_owner(struct xe_vm *vm, bool force_smem)
+{
+	return force_smem ? NULL : vm->svm.peer.owner;
+}
+
 static bool xe_svm_range_in_vram(struct xe_svm_range *range)
 {
 	/*
@@ -770,6 +779,25 @@ static void xe_svm_put_pagemaps(struct xe_vm *vm)
 	}
 }
 
+static struct device *xe_peer_to_dev(struct drm_pagemap_peer *peer)
+{
+	if (peer->private == XE_PEER_PAGEMAP)
+		return container_of(peer, struct xe_pagemap, peer)->dpagemap.drm->dev;
+
+	return container_of(peer, struct xe_vm, svm.peer)->xe->drm.dev;
+}
+
+static bool xe_has_interconnect(struct drm_pagemap_peer *peer1,
+				struct drm_pagemap_peer *peer2)
+{
+	struct device *dev1 = xe_peer_to_dev(peer1);
+	struct device *dev2 = xe_peer_to_dev(peer2);
+
+	return dev1 == dev2;
+}
+
+static DRM_PAGEMAP_OWNER_LIST_DEFINE(xe_owner_list);
+
 /**
  * xe_svm_init() - SVM initialize
  * @vm: The VM.
@@ -788,10 +816,18 @@ int xe_svm_init(struct xe_vm *vm)
 		INIT_WORK(&vm->svm.garbage_collector.work,
 			  xe_svm_garbage_collector_work_func);
 
-		err = xe_svm_get_pagemaps(vm);
+		vm->svm.peer.private = XE_PEER_VM;
+		err = drm_pagemap_acquire_owner(&vm->svm.peer, &xe_owner_list,
+						xe_has_interconnect);
 		if (err)
 			return err;
 
+		err = xe_svm_get_pagemaps(vm);
+		if (err) {
+			drm_pagemap_release_owner(&vm->svm.peer);
+			return err;
+		}
+
 		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
 				      current->mm, 0, vm->size,
 				      xe_modparam.svm_notifier_size * SZ_1M,
@@ -801,6 +837,7 @@ int xe_svm_init(struct xe_vm *vm)
 
 		if (err) {
 			xe_svm_put_pagemaps(vm);
+			drm_pagemap_release_owner(&vm->svm.peer);
 			return err;
 		}
 	} else {
@@ -823,6 +860,7 @@ void xe_svm_close(struct xe_vm *vm)
 	xe_assert(vm->xe, xe_vm_is_closed(vm));
 	flush_work(&vm->svm.garbage_collector.work);
 	xe_svm_put_pagemaps(vm);
+	drm_pagemap_release_owner(&vm->svm.peer);
 }
 
 /**
@@ -957,7 +995,7 @@ static int xe_drm_pagemap_populate_mm(struct drm_pagemap *dpagemap,
 		xe_pm_runtime_get_noresume(xe);
 		err = drm_pagemap_migrate_to_devmem(&bo->devmem_allocation, mm,
 						    start, end, timeslice_ms,
-						    xe_svm_devm_owner(xe));
+						    xpagemap->pagemap.owner);
 		if (err)
 			xe_svm_devmem_release(&bo->devmem_allocation);
 		xe_bo_unlock(bo);
@@ -1072,7 +1110,6 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		.devmem_only = need_vram && devmem_possible,
 		.timeslice_ms = need_vram && devmem_possible ?
 			vm->xe->atomic_svm_timeslice_ms : 0,
-		.device_private_page_owner = xe_svm_devm_owner(vm->xe),
 	};
 	struct xe_validation_ctx vctx;
 	struct drm_exec exec;
@@ -1096,8 +1133,8 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		return err;
 
 	dpagemap = xe_vma_resolve_pagemap(vma, tile);
-	if (!dpagemap && !ctx.devmem_only)
-		ctx.device_private_page_owner = NULL;
+	ctx.device_private_page_owner =
+		xe_svm_private_page_owner(vm, !dpagemap && !ctx.devmem_only);
 	range = xe_svm_range_find_or_insert(vm, fault_addr, vma, &ctx);
 
 	if (IS_ERR(range))
@@ -1521,6 +1558,8 @@ static void xe_pagemap_destroy_work(struct work_struct *work)
 					pagemap->range.end - pagemap->range.start + 1);
 		drm_dev_exit(idx);
 	}
+
+	drm_pagemap_release_owner(&xpagemap->peer);
 	kfree(xpagemap);
 }
 
@@ -1571,6 +1610,7 @@ static struct xe_pagemap *xe_pagemap_create(struct xe_device *xe, struct xe_vram
 	dpagemap = &xpagemap->dpagemap;
 	INIT_WORK(&xpagemap->destroy_work, xe_pagemap_destroy_work);
 	xpagemap->vr = vr;
+	xpagemap->peer.private = XE_PEER_PAGEMAP;
 
 	err = drm_pagemap_init(dpagemap, pagemap, &xe->drm, &xe_drm_pagemap_ops);
 	if (err)
@@ -1583,11 +1623,16 @@ static struct xe_pagemap *xe_pagemap_create(struct xe_device *xe, struct xe_vram
 		goto out_err;
 	}
 
+	err = drm_pagemap_acquire_owner(&xpagemap->peer, &xe_owner_list,
+					xe_has_interconnect);
+	if (err)
+		goto out_err;
+
 	pagemap->type = MEMORY_DEVICE_PRIVATE;
 	pagemap->range.start = res->start;
 	pagemap->range.end = res->end;
 	pagemap->nr_range = 1;
-	pagemap->owner = xe_svm_devm_owner(xe);
+	pagemap->owner = xpagemap->peer.owner;
 	pagemap->ops = drm_pagemap_pagemap_ops_get();
 	addr = devm_memremap_pages(dev, pagemap);
 	if (IS_ERR(addr)) {
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 8a49ff17ef0c..5adce108f7eb 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -6,24 +6,11 @@
 #ifndef _XE_SVM_H_
 #define _XE_SVM_H_
 
-struct xe_device;
-
-/**
- * xe_svm_devm_owner() - Return the owner of device private memory
- * @xe: The xe device.
- *
- * Return: The owner of this device's device private memory to use in
- * hmm_range_fault()-
- */
-static inline void *xe_svm_devm_owner(struct xe_device *xe)
-{
-	return xe;
-}
-
 #if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
 
 #include <drm/drm_pagemap.h>
 #include <drm/drm_gpusvm.h>
+#include <drm/drm_pagemap_util.h>
 
 #define XE_INTERCONNECT_VRAM DRM_INTERCONNECT_DRIVER
 
@@ -65,6 +52,7 @@ struct xe_svm_range {
  * @pagemap: The struct dev_pagemap providing the struct pages.
  * @dpagemap: The drm_pagemap managing allocation and migration.
  * @destroy_work: Handles asnynchronous destruction and caching.
+ * @peer: Used for pagemap owner computation.
  * @hpa_base: The host physical address base for the managemd memory.
  * @vr: Backpointer to the xe_vram region.
  */
@@ -72,6 +60,7 @@ struct xe_pagemap {
 	struct dev_pagemap pagemap;
 	struct drm_pagemap dpagemap;
 	struct work_struct destroy_work;
+	struct drm_pagemap_peer peer;
 	resource_size_t hpa_base;
 	struct xe_vram_region *vr;
 };
@@ -131,6 +120,8 @@ u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end);
 
 struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *tile);
 
+void *xe_svm_private_page_owner(struct xe_vm *vm, bool force_smem);
+
 /**
  * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
  * @range: SVM range
@@ -368,6 +359,11 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
 	return NULL;
 }
 
+static inline void *xe_svm_private_page_owner(struct xe_vm *vm, bool force_smem)
+{
+	return NULL;
+}
+
 static inline void xe_svm_flush(struct xe_vm *vm)
 {
 }
diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
index 0d9130b1958a..e120323c43bc 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -55,7 +55,7 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
 	struct xe_device *xe = vm->xe;
 	struct drm_gpusvm_ctx ctx = {
 		.read_only = xe_vma_read_only(vma),
-		.device_private_page_owner = xe_svm_devm_owner(xe),
+		.device_private_page_owner = xe_svm_private_page_owner(vm, false),
 		.allow_mixed = true,
 	};
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 10d77666a425..1dffcd9ab61b 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2886,7 +2886,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 	ctx.read_only = xe_vma_read_only(vma);
 	ctx.devmem_possible = devmem_possible;
 	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
-	ctx.device_private_page_owner = xe_svm_devm_owner(vm->xe);
+	ctx.device_private_page_owner = xe_svm_private_page_owner(vm, !tile);
 
 	/* TODO: Threading the migration */
 	xa_for_each(&op->prefetch_range.range, i, svm_range) {
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 9f0d8bf1af4f..4f9a6cdb5d02 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -8,6 +8,7 @@
 
 #include <drm/drm_gpusvm.h>
 #include <drm/drm_gpuvm.h>
+#include <drm/drm_pagemap_util.h>
 
 #include <linux/dma-resv.h>
 #include <linux/kref.h>
@@ -192,6 +193,8 @@ struct xe_vm {
 			struct work_struct work;
 		} garbage_collector;
 		struct xe_pagemap *pagemaps[XE_MAX_TILES_PER_DEVICE];
+		/** @svm.peer: Used for pagemap connectivity computations. */
+		struct drm_pagemap_peer peer;
 	} svm;
 
 	struct xe_device *xe;
-- 
2.51.0

