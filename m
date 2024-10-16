Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF2999FF6F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 05:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F86A10E67D;
	Wed, 16 Oct 2024 03:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C22UMkW0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3165010E652;
 Wed, 16 Oct 2024 03:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729049099; x=1760585099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CW2ne7cFkhsudCG3M0bweu+9Qn2BUd5ErI6jR5c9IWc=;
 b=C22UMkW0QGhXIZksiw2DcUMHrPwmsaGo7ujRvm3Q9N+x08MILmxf3dMR
 fVSmRceTCaR8cWXNwZRS/pLkJqqw/peEHBYBuW0EkpuVxKcvh3PME0S8e
 pF+U5lOXnCW69WKa5NOxby3gXG/xjhm8RRR7kZJav+U+BU5BFhcHEMgYN
 667Nx9/yn+JtPIlhMDCQgKThUUgiFu9XjVxt+xPFB0ZQtJbpzijeomy2R
 1Fp7H0ZZamGQjByogS4arlE3WzppQPcddTIel7QO6QMyMirDCxST3+69N
 ceT24MDYEUoewIkoZwwaEHQVlMpJ7fV6/MTLBWTPCHeEZ3QP7r8ELNge/ g==;
X-CSE-ConnectionGUID: V6v0roZCTJWyJLN+6m1FeA==
X-CSE-MsgGUID: FPNdyWAORs+xPBgwL1eP2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39056367"
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="39056367"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:58 -0700
X-CSE-ConnectionGUID: we0DPZ6qQpKgIZJLvLZK5Q==
X-CSE-MsgGUID: ckWeWR6ITRyxBJcM4PMSEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="78930256"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 20:24:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v2 07/29] drm/xe: Add SVM init / close / fini to faulting VMs
Date: Tue, 15 Oct 2024 20:24:56 -0700
Message-Id: <20241016032518.539495-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016032518.539495-1-matthew.brost@intel.com>
References: <20241016032518.539495-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Add SVM init / close / fini to faulting VMs. Minimual implementation.

v2:
 - Add close function

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/Makefile      |  1 +
 drivers/gpu/drm/xe/xe_svm.c      | 46 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h      | 15 +++++++++++
 drivers/gpu/drm/xe/xe_vm.c       | 12 +++++++++
 drivers/gpu/drm/xe/xe_vm_types.h |  7 +++++
 5 files changed, 81 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_svm.c
 create mode 100644 drivers/gpu/drm/xe/xe_svm.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 8d991d4a92a5..c3e85bcfd4d1 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -96,6 +96,7 @@ xe-y += drm_gpusvm.o \
 	xe_sa.o \
 	xe_sched_job.o \
 	xe_step.o \
+	xe_svm.o \
 	xe_sync.o \
 	xe_tile.o \
 	xe_tile_sysfs.o \
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
new file mode 100644
index 000000000000..57b740367843
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include "drm_gpusvm.h"
+
+#include "xe_svm.h"
+#include "xe_vm.h"
+#include "xe_vm_types.h"
+
+static void xe_svm_invalidate(struct drm_gpusvm *gpusvm,
+			      struct drm_gpusvm_notifier *notifier,
+			      const struct mmu_notifier_range *mmu_range)
+{
+	/* TODO: Implement */
+}
+
+static const struct drm_gpusvm_ops gpusvm_ops = {
+	.invalidate = xe_svm_invalidate,
+};
+
+static const u64 fault_chunk_sizes[] = {
+	SZ_2M,
+	SZ_64K,
+	SZ_4K,
+};
+
+int xe_svm_init(struct xe_vm *vm)
+{
+	return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
+			       current->mm, NULL, 0, vm->size,
+			       SZ_512M, &gpusvm_ops, fault_chunk_sizes,
+			       ARRAY_SIZE(fault_chunk_sizes));
+}
+
+void xe_svm_close(struct xe_vm *vm)
+{
+}
+
+void xe_svm_fini(struct xe_vm *vm)
+{
+	xe_assert(vm->xe, xe_vm_is_closed(vm));
+
+	drm_gpusvm_fini(&vm->svm.gpusvm);
+}
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
new file mode 100644
index 000000000000..979f2322eeba
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _XE_SVM_H_
+#define _XE_SVM_H_
+
+struct xe_vm;
+
+int xe_svm_init(struct xe_vm *vm);
+void xe_svm_fini(struct xe_vm *vm);
+void xe_svm_close(struct xe_vm *vm);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 0d887fb9de59..b11fb0ac9520 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -35,6 +35,7 @@
 #include "xe_preempt_fence.h"
 #include "xe_pt.h"
 #include "xe_res_cursor.h"
+#include "xe_svm.h"
 #include "xe_sync.h"
 #include "xe_trace_bo.h"
 #include "xe_wa.h"
@@ -1503,6 +1504,12 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		}
 	}
 
+	if (flags & XE_VM_FLAG_FAULT_MODE) {
+		err = xe_svm_init(vm);
+		if (err)
+			goto err_close;
+	}
+
 	if (number_tiles > 1)
 		vm->composite_fence_ctx = dma_fence_context_alloc(1);
 
@@ -1548,6 +1555,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	xe_vm_close(vm);
 	if (xe_vm_in_preempt_fence_mode(vm))
 		flush_work(&vm->preempt.rebind_work);
+	if (xe_vm_in_fault_mode(vm))
+		xe_svm_close(vm);
 
 	down_write(&vm->lock);
 	for_each_tile(tile, xe, id) {
@@ -1616,6 +1625,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 		xe_vma_destroy_unlocked(vma);
 	}
 
+	if (xe_vm_in_fault_mode(vm))
+		xe_svm_fini(vm);
+
 	up_write(&vm->lock);
 
 	down_write(&xe->usm.lock);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 1764781c376b..bd1c0e368238 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -6,6 +6,7 @@
 #ifndef _XE_VM_TYPES_H_
 #define _XE_VM_TYPES_H_
 
+#include "drm_gpusvm.h"
 #include <drm/drm_gpuvm.h>
 
 #include <linux/dma-resv.h>
@@ -140,6 +141,12 @@ struct xe_vm {
 	/** @gpuvm: base GPUVM used to track VMAs */
 	struct drm_gpuvm gpuvm;
 
+	/** @svm: Shared virtual memory state */
+	struct {
+		/** @svm.gpusvm: base GPUSVM used to track fault allocations */
+		struct drm_gpusvm gpusvm;
+	} svm;
+
 	struct xe_device *xe;
 
 	/* exec queue used for (un)binding vma's */
-- 
2.34.1

