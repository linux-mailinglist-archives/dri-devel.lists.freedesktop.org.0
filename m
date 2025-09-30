Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E35A4BACD3F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 14:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0CD210E2B7;
	Tue, 30 Sep 2025 12:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jKrSLGBB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B0C10E2B3;
 Tue, 30 Sep 2025 12:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759235294; x=1790771294;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5M+3v/XrfNAJdnTxNAzlSPV3gnBydhHjSIo7nzPH/pk=;
 b=jKrSLGBBzKucpO4JJSchVHY7dLNlj4aM823u5NomUVt+mAz1rNYBPCo4
 dSlV8dzESMtZLFn3LNk/H8H1rJ3ZMdqC2lvxhvs9ehcPCSMZCnJ7pQqPF
 udHVxwRs0MdhedrxDO6QfXrri+JJLMXZjE2Ej2nw2FKDRrcG2mqFU7a+L
 D7zaQkn3oQTcPNe8tXMmeCuqAkj2EzwCbjoKlGLC4AB49jOrghFrHmlPp
 g+7P8e3KjC7IWzbng6MLABphWP/4A7G/pWOcorhlocQAJDJw/LjjVoU1x
 p46NY/3GFICpSwMf0C2Nv/yUd1ELShHzCgtCNN19ZE+j57A7nI8sC/E9y Q==;
X-CSE-ConnectionGUID: V829eGLxQrCkTWjZ7GKztw==
X-CSE-MsgGUID: ktrQRcIrQW6JRrugApTtuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72590688"
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="72590688"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 05:28:14 -0700
X-CSE-ConnectionGUID: Ackl/SIURgSEzLcNLB27Gg==
X-CSE-MsgGUID: KU8IX9cOT42TeUHCjwZkMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,304,1751266800"; d="scan'208";a="215659540"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO fedora)
 ([10.245.244.136])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 05:28:12 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] drm/gpusvm,
 drm/xe: Fix userptr to not allow device private pages
Date: Tue, 30 Sep 2025 14:27:52 +0200
Message-ID: <20250930122752.96034-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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

When userptr is used on SVM-enabled VMs, a non-NULL
hmm_range::dev_private_owner value might mean that
hmm_range_fault() attempts to return device private pages.
Either that will fail, or the userptr code will not know
how to handle those.

Use NULL for hmm_range::dev_private_owner to migrate
such pages to system. In order to do that, move the
struct drm_gpusvm::device_private_page_owner field to
struct drm_gpusvm_ctx::device_private_page_owner so that
it doesn't remain immutable over the drm_gpusvm lifetime.

v2:
- Don't conditionally compile xe_svm_devm_owner().
- Kerneldoc xe_svm_devm_owner().

Fixes: 9e9787414882 ("drm/xe/userptr: replace xe_hmm with gpusvm")
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c    | 24 +++++++++++++-----------
 drivers/gpu/drm/xe/xe_svm.c     | 11 +++--------
 drivers/gpu/drm/xe/xe_svm.h     | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_userptr.c |  1 +
 drivers/gpu/drm/xe/xe_vm.c      |  1 +
 include/drm/drm_gpusvm.h        |  7 ++++---
 6 files changed, 36 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index eeeeb99cfdf6..cb906765897e 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -361,7 +361,6 @@ static const struct mmu_interval_notifier_ops drm_gpusvm_notifier_ops = {
  * @name: Name of the GPU SVM.
  * @drm: Pointer to the DRM device structure.
  * @mm: Pointer to the mm_struct for the address space.
- * @device_private_page_owner: Device private pages owner.
  * @mm_start: Start address of GPU SVM.
  * @mm_range: Range of the GPU SVM.
  * @notifier_size: Size of individual notifiers.
@@ -383,7 +382,7 @@ static const struct mmu_interval_notifier_ops drm_gpusvm_notifier_ops = {
  */
 int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
 		    const char *name, struct drm_device *drm,
-		    struct mm_struct *mm, void *device_private_page_owner,
+		    struct mm_struct *mm,
 		    unsigned long mm_start, unsigned long mm_range,
 		    unsigned long notifier_size,
 		    const struct drm_gpusvm_ops *ops,
@@ -395,15 +394,13 @@ int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
 		mmgrab(mm);
 	} else {
 		/* No full SVM mode, only core drm_gpusvm_pages API. */
-		if (ops || num_chunks || mm_range || notifier_size ||
-		    device_private_page_owner)
+		if (ops || num_chunks || mm_range || notifier_size)
 			return -EINVAL;
 	}
 
 	gpusvm->name = name;
 	gpusvm->drm = drm;
 	gpusvm->mm = mm;
-	gpusvm->device_private_page_owner = device_private_page_owner;
 	gpusvm->mm_start = mm_start;
 	gpusvm->mm_range = mm_range;
 	gpusvm->notifier_size = notifier_size;
@@ -684,6 +681,7 @@ static unsigned int drm_gpusvm_hmm_pfn_to_order(unsigned long hmm_pfn,
  * @notifier: Pointer to the GPU SVM notifier structure
  * @start: Start address
  * @end: End address
+ * @dev_private_owner: The device private page owner
  *
  * Check if pages between start and end have been faulted in on the CPU. Use to
  * prevent migration of pages without CPU backing store.
@@ -692,14 +690,15 @@ static unsigned int drm_gpusvm_hmm_pfn_to_order(unsigned long hmm_pfn,
  */
 static bool drm_gpusvm_check_pages(struct drm_gpusvm *gpusvm,
 				   struct drm_gpusvm_notifier *notifier,
-				   unsigned long start, unsigned long end)
+				   unsigned long start, unsigned long end,
+				   void *dev_private_owner)
 {
 	struct hmm_range hmm_range = {
 		.default_flags = 0,
 		.notifier = &notifier->notifier,
 		.start = start,
 		.end = end,
-		.dev_private_owner = gpusvm->device_private_page_owner,
+		.dev_private_owner = dev_private_owner,
 	};
 	unsigned long timeout =
 		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
@@ -753,6 +752,7 @@ static bool drm_gpusvm_check_pages(struct drm_gpusvm *gpusvm,
  * @gpuva_start: Start address of GPUVA which mirrors CPU
  * @gpuva_end: End address of GPUVA which mirrors CPU
  * @check_pages_threshold: Check CPU pages for present threshold
+ * @dev_private_owner: The device private page owner
  *
  * This function determines the chunk size for the GPU SVM range based on the
  * fault address, GPU SVM chunk sizes, existing GPU SVM ranges, and the virtual
@@ -767,7 +767,8 @@ drm_gpusvm_range_chunk_size(struct drm_gpusvm *gpusvm,
 			    unsigned long fault_addr,
 			    unsigned long gpuva_start,
 			    unsigned long gpuva_end,
-			    unsigned long check_pages_threshold)
+			    unsigned long check_pages_threshold,
+			    void *dev_private_owner)
 {
 	unsigned long start, end;
 	int i = 0;
@@ -814,7 +815,7 @@ drm_gpusvm_range_chunk_size(struct drm_gpusvm *gpusvm,
 		 * process-many-malloc' mallocs at least 64k at a time.
 		 */
 		if (end - start <= check_pages_threshold &&
-		    !drm_gpusvm_check_pages(gpusvm, notifier, start, end)) {
+		    !drm_gpusvm_check_pages(gpusvm, notifier, start, end, dev_private_owner)) {
 			++i;
 			goto retry;
 		}
@@ -957,7 +958,8 @@ drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm,
 	chunk_size = drm_gpusvm_range_chunk_size(gpusvm, notifier, vas,
 						 fault_addr, gpuva_start,
 						 gpuva_end,
-						 ctx->check_pages_threshold);
+						 ctx->check_pages_threshold,
+						 ctx->device_private_page_owner);
 	if (chunk_size == LONG_MAX) {
 		err = -EINVAL;
 		goto err_notifier_remove;
@@ -1268,7 +1270,7 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 		.notifier = notifier,
 		.start = pages_start,
 		.end = pages_end,
-		.dev_private_owner = gpusvm->device_private_page_owner,
+		.dev_private_owner = ctx->device_private_page_owner,
 	};
 	void *zdd;
 	unsigned long timeout =
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 7f2f1f041f1d..7e2db71ff34e 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -67,11 +67,6 @@ void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
 	range_debug(range, operation);
 }
 
-static void *xe_svm_devm_owner(struct xe_device *xe)
-{
-	return xe;
-}
-
 static struct drm_gpusvm_range *
 xe_svm_range_alloc(struct drm_gpusvm *gpusvm)
 {
@@ -744,15 +739,14 @@ int xe_svm_init(struct xe_vm *vm)
 			  xe_svm_garbage_collector_work_func);
 
 		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
-				      current->mm, xe_svm_devm_owner(vm->xe), 0,
-				      vm->size,
+				      current->mm, 0, vm->size,
 				      xe_modparam.svm_notifier_size * SZ_1M,
 				      &gpusvm_ops, fault_chunk_sizes,
 				      ARRAY_SIZE(fault_chunk_sizes));
 		drm_gpusvm_driver_set_lock(&vm->svm.gpusvm, &vm->lock);
 	} else {
 		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)",
-				      &vm->xe->drm, NULL, NULL, 0, 0, 0, NULL,
+				      &vm->xe->drm, NULL, 0, 0, 0, NULL,
 				      NULL, 0);
 	}
 
@@ -1017,6 +1011,7 @@ static int __xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
 		.devmem_only = need_vram && devmem_possible,
 		.timeslice_ms = need_vram && devmem_possible ?
 			vm->xe->atomic_svm_timeslice_ms : 0,
+		.device_private_page_owner = xe_svm_devm_owner(vm->xe),
 	};
 	struct xe_validation_ctx vctx;
 	struct drm_exec exec;
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index cef6ee7d6fe3..0955d2ac8d74 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -6,6 +6,20 @@
 #ifndef _XE_SVM_H_
 #define _XE_SVM_H_
 
+struct xe_device;
+
+/**
+ * xe_svm_devm_owner() - Return the owner of device private memory
+ * @xe: The xe device.
+ *
+ * Return: The owner of this device's device private memory to use in
+ * hmm_range_fault()-
+ */
+static inline void *xe_svm_devm_owner(struct xe_device *xe)
+{
+	return xe;
+}
+
 #if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
 
 #include <drm/drm_pagemap.h>
diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
index 91d09af71ced..f16e92cd8090 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -54,6 +54,7 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
 	struct xe_device *xe = vm->xe;
 	struct drm_gpusvm_ctx ctx = {
 		.read_only = xe_vma_read_only(vma),
+		.device_private_page_owner = NULL,
 	};
 
 	lockdep_assert_held(&vm->lock);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 80b7f13ecd80..4e914928e0a9 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2883,6 +2883,7 @@ static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
 	ctx.read_only = xe_vma_read_only(vma);
 	ctx.devmem_possible = devmem_possible;
 	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
+	ctx.device_private_page_owner = xe_svm_devm_owner(vm->xe);
 
 	/* TODO: Threading the migration */
 	xa_for_each(&op->prefetch_range.range, i, svm_range) {
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 5434048a2ca4..b92faa9a26b2 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -179,7 +179,6 @@ struct drm_gpusvm_range {
  * @name: Name of the GPU SVM
  * @drm: Pointer to the DRM device structure
  * @mm: Pointer to the mm_struct for the address space
- * @device_private_page_owner: Device private pages owner
  * @mm_start: Start address of GPU SVM
  * @mm_range: Range of the GPU SVM
  * @notifier_size: Size of individual notifiers
@@ -204,7 +203,6 @@ struct drm_gpusvm {
 	const char *name;
 	struct drm_device *drm;
 	struct mm_struct *mm;
-	void *device_private_page_owner;
 	unsigned long mm_start;
 	unsigned long mm_range;
 	unsigned long notifier_size;
@@ -226,6 +224,8 @@ struct drm_gpusvm {
 /**
  * struct drm_gpusvm_ctx - DRM GPU SVM context
  *
+ * @device_private_page_owner: The device-private page owner to use for
+ * this operation
  * @check_pages_threshold: Check CPU pages for present if chunk is less than or
  *                         equal to threshold. If not present, reduce chunk
  *                         size.
@@ -239,6 +239,7 @@ struct drm_gpusvm {
  * Context that is DRM GPUSVM is operating in (i.e. user arguments).
  */
 struct drm_gpusvm_ctx {
+	void *device_private_page_owner;
 	unsigned long check_pages_threshold;
 	unsigned long timeslice_ms;
 	unsigned int in_notifier :1;
@@ -249,7 +250,7 @@ struct drm_gpusvm_ctx {
 
 int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
 		    const char *name, struct drm_device *drm,
-		    struct mm_struct *mm, void *device_private_page_owner,
+		    struct mm_struct *mm,
 		    unsigned long mm_start, unsigned long mm_range,
 		    unsigned long notifier_size,
 		    const struct drm_gpusvm_ops *ops,
-- 
2.51.0

