Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA58A33532
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 03:10:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9644810E9BF;
	Thu, 13 Feb 2025 02:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e9CludLC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C127110E9BF;
 Thu, 13 Feb 2025 02:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739412617; x=1770948617;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Joj2+YH1CzhB4PYA96SlJIACeIn/A3g+T6jWkyr8Fvc=;
 b=e9CludLCVNm6DhrIvkYEPOZh4JHYw9CDCtVSX9so+sr8TIoKxcdESiYN
 U67X2kbjfcRFdQDDsHxh3aH8IzHkWhezjX4woUiWh0V8iliS/WNOVV477
 sxeIqZoFpLQqZRtvd0Bhq0B2IY1yNYKTPowa1Nwtl2WsQUYB8VOvIHSDa
 eEM1+UTj/9p9sYJZa8MLz4V2vIR4jOg3U1dhSf8KS3ABYu8uz9tqb4np3
 u/s8Gx3WobzLdhiRvIUmYdA2mIfwY0t11KxHCh63Qr648Xft0eSGdaxTq
 03QYhSNUvj2RxPc5DoUOQVk4tDa6B7v0YXD7OBX1S3bRbPfOPyi/jonbv Q==;
X-CSE-ConnectionGUID: bvkPJ1WkSLya/BS+p4qkjg==
X-CSE-MsgGUID: x5Edy6U8QQGDQ0f/jJh9Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="65455950"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="65455950"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:16 -0800
X-CSE-ConnectionGUID: Kpu788isRpihPMBFn731og==
X-CSE-MsgGUID: XdvDEe4oQhCK+JYuTi+0+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117945060"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 18:10:15 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v5 09/32] drm/xe: Add SVM init / close / fini to faulting VMs
Date: Wed, 12 Feb 2025 18:10:49 -0800
Message-Id: <20250213021112.1228481-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213021112.1228481-1-matthew.brost@intel.com>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
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

Add SVM init / close / fini to faulting VMs. Minimual implementation
acting as a placeholder for follow on patches.

v2:
 - Add close function
v3:
 - Better commit message (Thomas)
 - Kernel doc (Thomas)
 - Update chunk array to be unsigned long (Thomas)
 - Use new drm_gpusvm.h header location (Thomas)
 - Newlines between functions in xe_svm.h (Thomas)
 - Call drm_gpusvm_driver_set_lock in init (Thomas)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile      |  1 +
 drivers/gpu/drm/xe/xe_svm.c      | 73 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h      | 17 ++++++++
 drivers/gpu/drm/xe/xe_vm.c       | 12 ++++++
 drivers/gpu/drm/xe/xe_vm_types.h |  7 +++
 5 files changed, 110 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_svm.c
 create mode 100644 drivers/gpu/drm/xe/xe_svm.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 5ce65ccb3c08..724b4130b8be 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -100,6 +100,7 @@ xe-y += xe_bb.o \
 	xe_sched_job.o \
 	xe_step.o \
 	xe_survivability_mode.o \
+	xe_svm.o \
 	xe_sync.o \
 	xe_tile.o \
 	xe_tile_sysfs.o \
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
new file mode 100644
index 000000000000..79da859f02b1
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
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
+static const unsigned long fault_chunk_sizes[] = {
+	SZ_2M,
+	SZ_64K,
+	SZ_4K,
+};
+
+/**
+ * xe_svm_init() - SVM initialize
+ * @vm: The VM.
+ *
+ * Initialize SVM state which is embedded within the VM.
+ *
+ * Return: 0 on success, negative error code on error.
+ */
+int xe_svm_init(struct xe_vm *vm)
+{
+	int err;
+
+	err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
+			      current->mm, NULL, 0, vm->size,
+			      SZ_512M, &gpusvm_ops, fault_chunk_sizes,
+			      ARRAY_SIZE(fault_chunk_sizes));
+	if (err)
+		return err;
+
+	drm_gpusvm_driver_set_lock(&vm->svm.gpusvm, &vm->lock);
+
+	return 0;
+}
+
+/**
+ * xe_svm_close() - SVM close
+ * @vm: The VM.
+ *
+ * Close SVM state (i.e., stop and flush all SVM actions).
+ */
+void xe_svm_close(struct xe_vm *vm)
+{
+	xe_assert(vm->xe, xe_vm_is_closed(vm));
+}
+
+/**
+ * xe_svm_fini() - SVM finalize
+ * @vm: The VM.
+ *
+ * Finalize SVM state which is embedded within the VM.
+ */
+void xe_svm_fini(struct xe_vm *vm)
+{
+	xe_assert(vm->xe, xe_vm_is_closed(vm));
+
+	drm_gpusvm_fini(&vm->svm.gpusvm);
+}
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
new file mode 100644
index 000000000000..49cfd938aa17
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -0,0 +1,17 @@
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
+
+void xe_svm_fini(struct xe_vm *vm);
+
+void xe_svm_close(struct xe_vm *vm);
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 06d15ac8d64b..cbfe5fad1680 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -35,6 +35,7 @@
 #include "xe_pt.h"
 #include "xe_pxp.h"
 #include "xe_res_cursor.h"
+#include "xe_svm.h"
 #include "xe_sync.h"
 #include "xe_trace_bo.h"
 #include "xe_wa.h"
@@ -1525,6 +1526,12 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
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
 
@@ -1570,6 +1577,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	xe_vm_close(vm);
 	if (xe_vm_in_preempt_fence_mode(vm))
 		flush_work(&vm->preempt.rebind_work);
+	if (xe_vm_in_fault_mode(vm))
+		xe_svm_close(vm);
 
 	down_write(&vm->lock);
 	for_each_tile(tile, xe, id) {
@@ -1638,6 +1647,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 		xe_vma_destroy_unlocked(vma);
 	}
 
+	if (xe_vm_in_fault_mode(vm))
+		xe_svm_fini(vm);
+
 	up_write(&vm->lock);
 
 	down_write(&xe->usm.lock);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 9f125d07d30f..18ec9003a48a 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -6,6 +6,7 @@
 #ifndef _XE_VM_TYPES_H_
 #define _XE_VM_TYPES_H_
 
+#include <drm/drm_gpusvm.h>
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

