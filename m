Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB3FA53FD3
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 02:26:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8BC10E89E;
	Thu,  6 Mar 2025 01:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J9YQu8Al";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4275E10E88F;
 Thu,  6 Mar 2025 01:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741224359; x=1772760359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OwHHPFrHgjdT+8gwr/zuys5+/NGsbXzkMTqXwAz7aaw=;
 b=J9YQu8AlNLW9iJb9ygHouizdATXfRfbmxqnAGNbVdDfW9l47B2OETkCe
 MjaeLNeatYeRnRS4h8rz39GaSxxN6p8WVVVCe20oOYTBeF3F43fYoXgn9
 QosfoyYrDPXgTJR9lLWOdSDDsbJthU4TQ8ZditEmGM3L0EVtrJu6aEuSf
 H9DMBBf5IbXuw7r7CqMhrmljhQxEC4EXStuVdTBplTzr31UITzxYMMQuz
 kwNfhP4PJ3Yp70uQZl12c4n/nwZImKmPAmOctWC2pNpE2NjY5vaV/bB8t
 F+Mx62cllRb44sIVGt38a7zjbWT7+g7soQGq+bcL0edYumE/euqjKbno8 A==;
X-CSE-ConnectionGUID: S979BZy/RQGYwRXshSaWjw==
X-CSE-MsgGUID: Z9bXsGsfT/W/QDtn86766A==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52427313"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="52427313"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:54 -0800
X-CSE-ConnectionGUID: SCrDZPFWQzum3TE7cQMQeQ==
X-CSE-MsgGUID: BJBQXT8oQveCREmvwqU5Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124063260"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 17:25:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
Subject: [PATCH v7 09/32] drm/xe: Add SVM init / close / fini to faulting VMs
Date: Wed,  5 Mar 2025 17:26:34 -0800
Message-Id: <20250306012657.3505757-10-matthew.brost@intel.com>
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
v6:
 - Only compile if CONFIG_DRM_GPUSVM selected (CI, Lucas)
v7:
 - Only select CONFIG_DRM_GPUSVM if DEVICE_PRIVATE (CI)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/Makefile      |  1 +
 drivers/gpu/drm/xe/xe_svm.c      | 73 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h      | 35 +++++++++++++++
 drivers/gpu/drm/xe/xe_vm.c       | 12 ++++++
 drivers/gpu/drm/xe/xe_vm_types.h |  7 +++
 5 files changed, 128 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_svm.c
 create mode 100644 drivers/gpu/drm/xe/xe_svm.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 1d52224355f1..9699b08585f7 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -125,6 +125,7 @@ xe-y += xe_bb.o \
 	xe_wopcm.o
 
 xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
+xe-$(CONFIG_DRM_GPUSVM) += xe_svm.o
 
 # graphics hardware monitoring (HWMON) support
 xe-$(CONFIG_HWMON) += xe_hwmon.o
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
index 000000000000..ac79b208304d
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -0,0 +1,35 @@
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
+#if IS_ENABLED(CONFIG_DRM_GPUSVM)
+int xe_svm_init(struct xe_vm *vm);
+
+void xe_svm_fini(struct xe_vm *vm);
+
+void xe_svm_close(struct xe_vm *vm);
+#else
+static inline
+int xe_svm_init(struct xe_vm *vm)
+{
+	return 0;
+}
+
+static inline
+void xe_svm_fini(struct xe_vm *vm)
+{
+}
+
+static inline
+void xe_svm_close(struct xe_vm *vm)
+{
+}
+#endif
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5e9f5bb82bc7..178d38d447e1 100644
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
@@ -1581,6 +1582,12 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
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
 
@@ -1626,6 +1633,8 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	xe_vm_close(vm);
 	if (xe_vm_in_preempt_fence_mode(vm))
 		flush_work(&vm->preempt.rebind_work);
+	if (xe_vm_in_fault_mode(vm))
+		xe_svm_close(vm);
 
 	down_write(&vm->lock);
 	for_each_tile(tile, xe, id) {
@@ -1694,6 +1703,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 		xe_vma_destroy_unlocked(vma);
 	}
 
+	if (xe_vm_in_fault_mode(vm))
+		xe_svm_fini(vm);
+
 	up_write(&vm->lock);
 
 	down_write(&xe->usm.lock);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index db7107e784c8..96ba631da68a 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -6,6 +6,7 @@
 #ifndef _XE_VM_TYPES_H_
 #define _XE_VM_TYPES_H_
 
+#include <drm/drm_gpusvm.h>
 #include <drm/drm_gpuvm.h>
 
 #include <linux/dma-resv.h>
@@ -144,6 +145,12 @@ struct xe_vm {
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

