Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8999F5A65
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 00:33:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DF710E881;
	Tue, 17 Dec 2024 23:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bvH5bCXh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70AF10E664;
 Tue, 17 Dec 2024 23:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734478390; x=1766014390;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eC0xwgF8cTuysAN3/1la5FmLx1y+Kf1lMXGPWzYeQ8c=;
 b=bvH5bCXhT7XzfN7/M6Ie1azo/dM0CmCifNMI2L+TycdVsfFc/q6f/Vix
 r2SsRFotLcuSLgLbC6LuBG70Ov/HYUKnkXal+xHBYE19TYrCkZ2ymvTKp
 dkYFLdTjyxvTMC9lyAtAedq577ODp8mTnXlRDxixiahgQNNp9fWhc8zyQ
 2aEfTiiH7wqguXJyjjghGFxauBT22/Cwo4uiN6najSYobI7iJBlMqR5BI
 csEK8rMAwLO0TVndvws19pknegk09bVPAwvDjja5MPx+3d1JdtY64rMBy
 DH7ANqtMIhLoojhSjcdIEsW+HE3qJ4T2WhhlxFnRiVMr54z4j5IG37izU Q==;
X-CSE-ConnectionGUID: VtPuVbcgQeOXvwzWi7Sovw==
X-CSE-MsgGUID: NsIbPOzoRyCYk/Hy3zrNOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="22517371"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="22517371"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:09 -0800
X-CSE-ConnectionGUID: xAC/efW7QaazRFsLlC7w5Q==
X-CSE-MsgGUID: VvqYQktkRve5gDJjS8a0cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102273433"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 15:33:09 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: apopple@nvidia.com, airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v3 08/30] drm/xe: Add SVM init / close / fini to faulting VMs
Date: Tue, 17 Dec 2024 15:33:26 -0800
Message-Id: <20241217233348.3519726-9-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217233348.3519726-1-matthew.brost@intel.com>
References: <20241217233348.3519726-1-matthew.brost@intel.com>
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
index 5c97ad6ed738..94d8850fdbb4 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -95,6 +95,7 @@ xe-y += xe_bb.o \
 	xe_sa.o \
 	xe_sched_job.o \
 	xe_step.o \
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
index bef0fae881ac..56ef76bd3e3f 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -34,6 +34,7 @@
 #include "xe_preempt_fence.h"
 #include "xe_pt.h"
 #include "xe_res_cursor.h"
+#include "xe_svm.h"
 #include "xe_sync.h"
 #include "xe_trace_bo.h"
 #include "xe_wa.h"
@@ -1504,6 +1505,12 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
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
 
@@ -1549,6 +1556,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	xe_vm_close(vm);
 	if (xe_vm_in_preempt_fence_mode(vm))
 		flush_work(&vm->preempt.rebind_work);
+	if (xe_vm_in_fault_mode(vm))
+		xe_svm_close(vm);
 
 	down_write(&vm->lock);
 	for_each_tile(tile, xe, id) {
@@ -1617,6 +1626,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 		xe_vma_destroy_unlocked(vma);
 	}
 
+	if (xe_vm_in_fault_mode(vm))
+		xe_svm_fini(vm);
+
 	up_write(&vm->lock);
 
 	down_write(&xe->usm.lock);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index f6855e4fb9e6..aa075d5e7a3f 100644
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

