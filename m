Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B92E961C4F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 04:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97C110E465;
	Wed, 28 Aug 2024 02:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rv7Pa/qu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62AA110E43F;
 Wed, 28 Aug 2024 02:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724813288; x=1756349288;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lRe+mxjUJ3daY2t9QkGYxv3ZPXLMMbSxj4sVAJUhbOQ=;
 b=Rv7Pa/qu408wCsvttLwBaHlizmush3aPa4t8Ce2HV6HrUGT9+yaFyZa/
 HCER6PvYx5I7V6tLaP8f7OeWDe5mYOy2ze+9W8O4/s29CJJVsV+VyILVx
 8nc23W20nyd5XJp+35VL2CSGsgy6QbcesDSgLQtKYbd4poCwNQ3OcYTzJ
 Eql0LCmiocsEKJlDMdjXtnt6cjaDBmQaNsgxjgSHpOwSf41AVvRi5kYcU
 PGeE2Iym+IwNl4+DtqrwFUd3uQXRaVGq+obFKTexObBimcahqJBitBcvS
 gzNZwGrsNOFLHjbA8AbS1bwB86gqS2VhEHnRITKjNnEnyuSd3dcc8eOfx A==;
X-CSE-ConnectionGUID: qTgV7ezVRdKwstFR2VPVig==
X-CSE-MsgGUID: rBO25tboSPurXL6K7i/nGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="13251876"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="13251876"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:08 -0700
X-CSE-ConnectionGUID: ER9EcjSNRdSpxdYOqv/CYA==
X-CSE-MsgGUID: 7nmdmOKPTyW9MKSRXuWkpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; d="scan'208";a="67224605"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 19:48:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
Subject: [RFC PATCH 07/28] drm/xe: Add SVM init / fini to faulting VMs
Date: Tue, 27 Aug 2024 19:48:40 -0700
Message-Id: <20240828024901.2582335-8-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828024901.2582335-1-matthew.brost@intel.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
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

Add SVM init / fini to faulting VMs. Minimual implementation.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/Makefile      |  1 +
 drivers/gpu/drm/xe/xe_svm.c      | 40 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h      | 14 +++++++++++
 drivers/gpu/drm/xe/xe_vm.c       | 10 ++++++++
 drivers/gpu/drm/xe/xe_vm_types.h |  7 ++++++
 5 files changed, 72 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_svm.c
 create mode 100644 drivers/gpu/drm/xe/xe_svm.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index b8fc2ee58f1a..17bd7cfc9a62 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -94,6 +94,7 @@ xe-y += drm_gpusvm.o \
 	xe_sa.o \
 	xe_sched_job.o \
 	xe_step.o \
+	xe_svm.o \
 	xe_sync.o \
 	xe_tile.o \
 	xe_tile_sysfs.o \
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
new file mode 100644
index 000000000000..7166100e3298
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -0,0 +1,40 @@
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
+void xe_svm_fini(struct xe_vm *vm)
+{
+	drm_gpusvm_fini(&vm->svm.gpusvm);
+}
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
new file mode 100644
index 000000000000..4982d9168095
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -0,0 +1,14 @@
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
+
+#endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 5ec160561662..17ad6a533b2f 100644
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
 
@@ -1616,6 +1623,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 		xe_vma_destroy_unlocked(vma);
 	}
 
+	if (xe_vm_in_fault_mode(vm))
+		xe_svm_fini(vm);
+
 	up_write(&vm->lock);
 
 	mutex_lock(&xe->usm.lock);
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

