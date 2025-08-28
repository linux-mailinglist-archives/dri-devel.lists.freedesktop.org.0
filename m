Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACA3B3A193
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 16:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6645A10E9DF;
	Thu, 28 Aug 2025 14:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="INm5UcCy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0503510E9F2;
 Thu, 28 Aug 2025 14:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756391166; x=1787927166;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5gGVSsXCEtI16jRJQStBLSzoFKgEC4+JRVkNKYFn0cw=;
 b=INm5UcCyC17t8qd8vKwXmdTX+EanMpQT5CbZppee1+AQNT6J6fHt5DXn
 yLmZkRRDWbDWQoftGSKlbzR1oxVm2UnEjwJjgxtBgsD02dhW+tgUeRK63
 Ecn+XLkTTDAh1pk8cQMjwViYEFBTS3KdK9BTWOkUAVzKFq5Jj/SlqQ1kn
 aMyFYcygPb/Ax7mxKP2LOpn9QPR1Wzap0wvKn0KOPTP9eAzJbdwuCBW9x
 0Igrvw6WsRMaaGKMwfDFBZmLAlciEh91nfHzQOuqhjPs+wloBkoYtvqx+
 3eXZX6gfh3lRdt5JFBM9KUM7pBsFLTkhOwvvcN6Ce1Du5P9AisanQew0n w==;
X-CSE-ConnectionGUID: 583oDfX6QqusGE1SkKRLFw==
X-CSE-MsgGUID: QMD/BnaHSXSPgk+BQXIQTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58763203"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58763203"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 07:26:05 -0700
X-CSE-ConnectionGUID: FPN8O0a3RCqjs4N+WNdFHg==
X-CSE-MsgGUID: EUEHODuNS4KOZc7MFHraeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170025903"
Received: from johunt-mobl9.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.84])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 07:26:05 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v6 6/8] drm/xe/vm: split userptr bits into separate file
Date: Thu, 28 Aug 2025 15:24:37 +0100
Message-ID: <20250828142430.615826-16-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250828142430.615826-10-matthew.auld@intel.com>
References: <20250828142430.615826-10-matthew.auld@intel.com>
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

This will simplify compiling out the bits that depend on DRM_GPUSVM in a
later patch. Without this we end up littering the code with ifdef
checks, plus it becomes hard to be sure that something won't blow at
runtime due to something not being initialised, even though it passed
the build. Should be no functional change here.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/Makefile      |   1 +
 drivers/gpu/drm/xe/xe_pt.c       |   1 +
 drivers/gpu/drm/xe/xe_userptr.c  | 305 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_userptr.h  |  97 ++++++++++
 drivers/gpu/drm/xe/xe_vm.c       | 278 +---------------------------
 drivers/gpu/drm/xe/xe_vm.h       |  17 --
 drivers/gpu/drm/xe/xe_vm_types.h |  60 +-----
 7 files changed, 411 insertions(+), 348 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_userptr.c
 create mode 100644 drivers/gpu/drm/xe/xe_userptr.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 987e4fe10538..85ead33f69ab 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -130,6 +130,7 @@ xe-y += xe_bb.o \
 	xe_tuning.o \
 	xe_uc.o \
 	xe_uc_fw.o \
+	xe_userptr.o \
 	xe_vm.o \
 	xe_vm_madvise.o \
 	xe_vram.o \
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 029480c9cebd..9eac29cbdc48 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -24,6 +24,7 @@
 #include "xe_tlb_inval_job.h"
 #include "xe_trace.h"
 #include "xe_ttm_stolen_mgr.h"
+#include "xe_userptr.h"
 #include "xe_vm.h"
 
 struct xe_pt_dir {
diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
new file mode 100644
index 000000000000..17ecff17c993
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -0,0 +1,305 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include "xe_userptr.h"
+
+#include <linux/mm.h>
+
+#include "xe_hmm.h"
+#include "xe_trace_bo.h"
+
+/**
+ * xe_vma_userptr_check_repin() - Advisory check for repin needed
+ * @uvma: The userptr vma
+ *
+ * Check if the userptr vma has been invalidated since last successful
+ * repin. The check is advisory only and can the function can be called
+ * without the vm->svm.gpusvm.notifier_lock held. There is no guarantee that the
+ * vma userptr will remain valid after a lockless check, so typically
+ * the call needs to be followed by a proper check under the notifier_lock.
+ *
+ * Return: 0 if userptr vma is valid, -EAGAIN otherwise; repin recommended.
+ */
+int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma)
+{
+	return mmu_interval_check_retry(&uvma->userptr.notifier,
+					uvma->userptr.notifier_seq) ?
+		-EAGAIN : 0;
+}
+
+/**
+ * __xe_vm_userptr_needs_repin() - Check whether the VM does have userptrs
+ * that need repinning.
+ * @vm: The VM.
+ *
+ * This function checks for whether the VM has userptrs that need repinning,
+ * and provides a release-type barrier on the userptr.notifier_lock after
+ * checking.
+ *
+ * Return: 0 if there are no userptrs needing repinning, -EAGAIN if there are.
+ */
+int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
+{
+	lockdep_assert_held_read(&vm->userptr.notifier_lock);
+
+	return (list_empty(&vm->userptr.repin_list) &&
+		list_empty(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
+}
+
+int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
+{
+	struct xe_vma *vma = &uvma->vma;
+	struct xe_vm *vm = xe_vma_vm(vma);
+	struct xe_device *xe = vm->xe;
+
+	lockdep_assert_held(&vm->lock);
+	xe_assert(xe, xe_vma_is_userptr(vma));
+
+	return xe_hmm_userptr_populate_range(uvma, false);
+}
+
+static void __vma_userptr_invalidate(struct xe_vm *vm, struct xe_userptr_vma *uvma)
+{
+	struct xe_userptr *userptr = &uvma->userptr;
+	struct xe_vma *vma = &uvma->vma;
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
+	long err;
+
+	/*
+	 * Tell exec and rebind worker they need to repin and rebind this
+	 * userptr.
+	 */
+	if (!xe_vm_in_fault_mode(vm) &&
+	    !(vma->gpuva.flags & XE_VMA_DESTROYED)) {
+		spin_lock(&vm->userptr.invalidated_lock);
+		list_move_tail(&userptr->invalidate_link,
+			       &vm->userptr.invalidated);
+		spin_unlock(&vm->userptr.invalidated_lock);
+	}
+
+	/*
+	 * Preempt fences turn into schedule disables, pipeline these.
+	 * Note that even in fault mode, we need to wait for binds and
+	 * unbinds to complete, and those are attached as BOOKMARK fences
+	 * to the vm.
+	 */
+	dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
+			    DMA_RESV_USAGE_BOOKKEEP);
+	dma_resv_for_each_fence_unlocked(&cursor, fence)
+		dma_fence_enable_sw_signaling(fence);
+	dma_resv_iter_end(&cursor);
+
+	err = dma_resv_wait_timeout(xe_vm_resv(vm),
+				    DMA_RESV_USAGE_BOOKKEEP,
+				    false, MAX_SCHEDULE_TIMEOUT);
+	XE_WARN_ON(err <= 0);
+
+	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
+		err = xe_vm_invalidate_vma(vma);
+		XE_WARN_ON(err);
+	}
+
+	xe_hmm_userptr_unmap(uvma);
+}
+
+static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
+				   const struct mmu_notifier_range *range,
+				   unsigned long cur_seq)
+{
+	struct xe_userptr_vma *uvma = container_of(mni, typeof(*uvma), userptr.notifier);
+	struct xe_vma *vma = &uvma->vma;
+	struct xe_vm *vm = xe_vma_vm(vma);
+
+	xe_assert(vm->xe, xe_vma_is_userptr(vma));
+	trace_xe_vma_userptr_invalidate(vma);
+
+	if (!mmu_notifier_range_blockable(range))
+		return false;
+
+	vm_dbg(&xe_vma_vm(vma)->xe->drm,
+	       "NOTIFIER: addr=0x%016llx, range=0x%016llx",
+		xe_vma_start(vma), xe_vma_size(vma));
+
+	down_write(&vm->userptr.notifier_lock);
+	mmu_interval_set_seq(mni, cur_seq);
+
+	__vma_userptr_invalidate(vm, uvma);
+	up_write(&vm->userptr.notifier_lock);
+	trace_xe_vma_userptr_invalidate_complete(vma);
+
+	return true;
+}
+
+static const struct mmu_interval_notifier_ops vma_userptr_notifier_ops = {
+	.invalidate = vma_userptr_invalidate,
+};
+
+#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
+/**
+ * xe_vma_userptr_force_invalidate() - force invalidate a userptr
+ * @uvma: The userptr vma to invalidate
+ *
+ * Perform a forced userptr invalidation for testing purposes.
+ */
+void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
+{
+	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
+
+	/* Protect against concurrent userptr pinning */
+	lockdep_assert_held(&vm->lock);
+	/* Protect against concurrent notifiers */
+	lockdep_assert_held(&vm->userptr.notifier_lock);
+	/*
+	 * Protect against concurrent instances of this function and
+	 * the critical exec sections
+	 */
+	xe_vm_assert_held(vm);
+
+	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
+				     uvma->userptr.notifier_seq))
+		uvma->userptr.notifier_seq -= 2;
+	__vma_userptr_invalidate(vm, uvma);
+}
+#endif
+
+int xe_vm_userptr_pin(struct xe_vm *vm)
+{
+	struct xe_userptr_vma *uvma, *next;
+	int err = 0;
+
+	xe_assert(vm->xe, !xe_vm_in_fault_mode(vm));
+	lockdep_assert_held_write(&vm->lock);
+
+	/* Collect invalidated userptrs */
+	spin_lock(&vm->userptr.invalidated_lock);
+	xe_assert(vm->xe, list_empty(&vm->userptr.repin_list));
+	list_for_each_entry_safe(uvma, next, &vm->userptr.invalidated,
+				 userptr.invalidate_link) {
+		list_del_init(&uvma->userptr.invalidate_link);
+		list_add_tail(&uvma->userptr.repin_link,
+			      &vm->userptr.repin_list);
+	}
+	spin_unlock(&vm->userptr.invalidated_lock);
+
+	/* Pin and move to bind list */
+	list_for_each_entry_safe(uvma, next, &vm->userptr.repin_list,
+				 userptr.repin_link) {
+		err = xe_vma_userptr_pin_pages(uvma);
+		if (err == -EFAULT) {
+			list_del_init(&uvma->userptr.repin_link);
+			/*
+			 * We might have already done the pin once already, but
+			 * then had to retry before the re-bind happened, due
+			 * some other condition in the caller, but in the
+			 * meantime the userptr got dinged by the notifier such
+			 * that we need to revalidate here, but this time we hit
+			 * the EFAULT. In such a case make sure we remove
+			 * ourselves from the rebind list to avoid going down in
+			 * flames.
+			 */
+			if (!list_empty(&uvma->vma.combined_links.rebind))
+				list_del_init(&uvma->vma.combined_links.rebind);
+
+			/* Wait for pending binds */
+			xe_vm_lock(vm, false);
+			dma_resv_wait_timeout(xe_vm_resv(vm),
+					      DMA_RESV_USAGE_BOOKKEEP,
+					      false, MAX_SCHEDULE_TIMEOUT);
+
+			down_read(&vm->userptr.notifier_lock);
+			err = xe_vm_invalidate_vma(&uvma->vma);
+			up_read(&vm->userptr.notifier_lock);
+			xe_vm_unlock(vm);
+			if (err)
+				break;
+		} else {
+			if (err)
+				break;
+
+			list_del_init(&uvma->userptr.repin_link);
+			list_move_tail(&uvma->vma.combined_links.rebind,
+				       &vm->rebind_list);
+		}
+	}
+
+	if (err) {
+		down_write(&vm->userptr.notifier_lock);
+		spin_lock(&vm->userptr.invalidated_lock);
+		list_for_each_entry_safe(uvma, next, &vm->userptr.repin_list,
+					 userptr.repin_link) {
+			list_del_init(&uvma->userptr.repin_link);
+			list_move_tail(&uvma->userptr.invalidate_link,
+				       &vm->userptr.invalidated);
+		}
+		spin_unlock(&vm->userptr.invalidated_lock);
+		up_write(&vm->userptr.notifier_lock);
+	}
+	return err;
+}
+
+/**
+ * xe_vm_userptr_check_repin() - Check whether the VM might have userptrs
+ * that need repinning.
+ * @vm: The VM.
+ *
+ * This function does an advisory check for whether the VM has userptrs that
+ * need repinning.
+ *
+ * Return: 0 if there are no indications of userptrs needing repinning,
+ * -EAGAIN if there are.
+ */
+int xe_vm_userptr_check_repin(struct xe_vm *vm)
+{
+	return (list_empty_careful(&vm->userptr.repin_list) &&
+		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
+}
+
+int xe_userptr_setup(struct xe_userptr_vma *uvma, unsigned long start,
+		     unsigned long range)
+{
+	struct xe_userptr *userptr = &uvma->userptr;
+	int err;
+
+	INIT_LIST_HEAD(&userptr->invalidate_link);
+	INIT_LIST_HEAD(&userptr->repin_link);
+	mutex_init(&userptr->unmap_mutex);
+
+	err = mmu_interval_notifier_insert(&userptr->notifier, current->mm,
+					   start, range,
+					   &vma_userptr_notifier_ops);
+	if (err)
+		return err;
+
+	userptr->notifier_seq = LONG_MAX;
+
+	return 0;
+}
+
+void xe_userptr_remove(struct xe_userptr_vma *uvma)
+{
+	struct xe_userptr *userptr = &uvma->userptr;
+
+	if (userptr->sg)
+		xe_hmm_userptr_free_sg(uvma);
+
+	/*
+	 * Since userptr pages are not pinned, we can't remove
+	 * the notifier until we're sure the GPU is not accessing
+	 * them anymore
+	 */
+	mmu_interval_notifier_remove(&userptr->notifier);
+	mutex_destroy(&userptr->unmap_mutex);
+}
+
+void xe_userptr_destroy(struct xe_userptr_vma *uvma)
+{
+	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
+
+	spin_lock(&vm->userptr.invalidated_lock);
+	xe_assert(vm->xe, list_empty(&uvma->userptr.repin_link));
+	list_del(&uvma->userptr.invalidate_link);
+	spin_unlock(&vm->userptr.invalidated_lock);
+}
diff --git a/drivers/gpu/drm/xe/xe_userptr.h b/drivers/gpu/drm/xe/xe_userptr.h
new file mode 100644
index 000000000000..dc49348ac42d
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_userptr.h
@@ -0,0 +1,97 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#ifndef _XE_USERPTR_H_
+#define _XE_USERPTR_H_
+
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/notifier.h>
+#include <linux/scatterlist.h>
+#include <linux/spinlock.h>
+
+struct xe_vm;
+struct xe_vma;
+struct xe_userptr_vma;
+
+/** struct xe_userptr_vm - User pointer VM level state */
+struct xe_userptr_vm {
+	/**
+	 * @userptr.repin_list: list of VMAs which are user pointers,
+	 * and needs repinning. Protected by @lock.
+	 */
+	struct list_head repin_list;
+	/**
+	 * @notifier_lock: protects notifier in write mode and
+	 * submission in read mode.o
+	 */
+	struct rw_semaphore notifier_lock;
+	/**
+	 * @userptr.invalidated_lock: Protects the
+	 * @userptr.invalidated list.
+	 */
+	spinlock_t invalidated_lock;
+	/**
+	 * @userptr.invalidated: List of invalidated userptrs, not yet
+	 * picked
+	 * up for revalidation. Protected from access with the
+	 * @invalidated_lock. Removing items from the list
+	 * additionally requires @lock in write mode, and adding
+	 * items to the list requires either the @userptr.notifier_lock in
+	 * write mode, OR @lock in write mode.
+	 */
+	struct list_head invalidated;
+};
+
+/** struct xe_userptr - User pointer */
+struct xe_userptr {
+	/** @invalidate_link: Link for the vm::userptr.invalidated list */
+	struct list_head invalidate_link;
+	/** @userptr: link into VM repin list if userptr. */
+	struct list_head repin_link;
+	/**
+	 * @notifier: MMU notifier for user pointer (invalidation call back)
+	 */
+	struct mmu_interval_notifier notifier;
+	/** @sgt: storage for a scatter gather table */
+	struct sg_table sgt;
+	/** @sg: allocated scatter gather table */
+	struct sg_table *sg;
+	/** @notifier_seq: notifier sequence number */
+	unsigned long notifier_seq;
+	/** @unmap_mutex: Mutex protecting dma-unmapping */
+	struct mutex unmap_mutex;
+	/**
+	 * @initial_bind: user pointer has been bound at least once.
+	 * write: vm->userptr.notifier_lock in read mode and vm->resv held.
+	 * read: vm->userptr.notifier_lock in write mode or vm->resv held.
+	 */
+	bool initial_bind;
+	/** @mapped: Whether the @sgt sg-table is dma-mapped. Protected by @unmap_mutex. */
+	bool mapped;
+#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
+	u32 divisor;
+#endif
+};
+
+void xe_userptr_remove(struct xe_userptr_vma *uvma);
+int xe_userptr_setup(struct xe_userptr_vma *uvma, unsigned long start,
+		     unsigned long range);
+void xe_userptr_destroy(struct xe_userptr_vma *uvma);
+
+int xe_vm_userptr_pin(struct xe_vm *vm);
+int __xe_vm_userptr_needs_repin(struct xe_vm *vm);
+int xe_vm_userptr_check_repin(struct xe_vm *vm);
+int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma);
+int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
+
+#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
+void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma);
+#else
+static inline void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
+{
+}
+#endif
+#endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 3ff3c67aa79d..57afe9819842 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -40,6 +40,7 @@
 #include "xe_tile.h"
 #include "xe_tlb_inval.h"
 #include "xe_trace_bo.h"
+#include "xe_userptr.h"
 #include "xe_wa.h"
 #include "xe_hmm.h"
 
@@ -48,37 +49,6 @@ static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
 	return vm->gpuvm.r_obj;
 }
 
-/**
- * xe_vma_userptr_check_repin() - Advisory check for repin needed
- * @uvma: The userptr vma
- *
- * Check if the userptr vma has been invalidated since last successful
- * repin. The check is advisory only and can the function can be called
- * without the vm->userptr.notifier_lock held. There is no guarantee that the
- * vma userptr will remain valid after a lockless check, so typically
- * the call needs to be followed by a proper check under the notifier_lock.
- *
- * Return: 0 if userptr vma is valid, -EAGAIN otherwise; repin recommended.
- */
-int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma)
-{
-	return mmu_interval_check_retry(&uvma->userptr.notifier,
-					uvma->userptr.notifier_seq) ?
-		-EAGAIN : 0;
-}
-
-int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
-{
-	struct xe_vma *vma = &uvma->vma;
-	struct xe_vm *vm = xe_vma_vm(vma);
-	struct xe_device *xe = vm->xe;
-
-	lockdep_assert_held(&vm->lock);
-	xe_assert(xe, xe_vma_is_userptr(vma));
-
-	return xe_hmm_userptr_populate_range(uvma, false);
-}
-
 static bool preempt_fences_waiting(struct xe_vm *vm)
 {
 	struct xe_exec_queue *q;
@@ -300,25 +270,6 @@ void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	up_write(&vm->lock);
 }
 
-/**
- * __xe_vm_userptr_needs_repin() - Check whether the VM does have userptrs
- * that need repinning.
- * @vm: The VM.
- *
- * This function checks for whether the VM has userptrs that need repinning,
- * and provides a release-type barrier on the userptr.notifier_lock after
- * checking.
- *
- * Return: 0 if there are no userptrs needing repinning, -EAGAIN if there are.
- */
-int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
-{
-	lockdep_assert_held_read(&vm->userptr.notifier_lock);
-
-	return (list_empty(&vm->userptr.repin_list) &&
-		list_empty(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
-}
-
 #define XE_VM_REBIND_RETRY_TIMEOUT_MS 1000
 
 /**
@@ -584,203 +535,6 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	trace_xe_vm_rebind_worker_exit(vm);
 }
 
-static void __vma_userptr_invalidate(struct xe_vm *vm, struct xe_userptr_vma *uvma)
-{
-	struct xe_userptr *userptr = &uvma->userptr;
-	struct xe_vma *vma = &uvma->vma;
-	struct dma_resv_iter cursor;
-	struct dma_fence *fence;
-	long err;
-
-	/*
-	 * Tell exec and rebind worker they need to repin and rebind this
-	 * userptr.
-	 */
-	if (!xe_vm_in_fault_mode(vm) &&
-	    !(vma->gpuva.flags & XE_VMA_DESTROYED)) {
-		spin_lock(&vm->userptr.invalidated_lock);
-		list_move_tail(&userptr->invalidate_link,
-			       &vm->userptr.invalidated);
-		spin_unlock(&vm->userptr.invalidated_lock);
-	}
-
-	/*
-	 * Preempt fences turn into schedule disables, pipeline these.
-	 * Note that even in fault mode, we need to wait for binds and
-	 * unbinds to complete, and those are attached as BOOKMARK fences
-	 * to the vm.
-	 */
-	dma_resv_iter_begin(&cursor, xe_vm_resv(vm),
-			    DMA_RESV_USAGE_BOOKKEEP);
-	dma_resv_for_each_fence_unlocked(&cursor, fence)
-		dma_fence_enable_sw_signaling(fence);
-	dma_resv_iter_end(&cursor);
-
-	err = dma_resv_wait_timeout(xe_vm_resv(vm),
-				    DMA_RESV_USAGE_BOOKKEEP,
-				    false, MAX_SCHEDULE_TIMEOUT);
-	XE_WARN_ON(err <= 0);
-
-	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
-		err = xe_vm_invalidate_vma(vma);
-		XE_WARN_ON(err);
-	}
-
-	xe_hmm_userptr_unmap(uvma);
-}
-
-static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
-				   const struct mmu_notifier_range *range,
-				   unsigned long cur_seq)
-{
-	struct xe_userptr_vma *uvma = container_of(mni, typeof(*uvma), userptr.notifier);
-	struct xe_vma *vma = &uvma->vma;
-	struct xe_vm *vm = xe_vma_vm(vma);
-
-	xe_assert(vm->xe, xe_vma_is_userptr(vma));
-	trace_xe_vma_userptr_invalidate(vma);
-
-	if (!mmu_notifier_range_blockable(range))
-		return false;
-
-	vm_dbg(&xe_vma_vm(vma)->xe->drm,
-	       "NOTIFIER: addr=0x%016llx, range=0x%016llx",
-		xe_vma_start(vma), xe_vma_size(vma));
-
-	down_write(&vm->userptr.notifier_lock);
-	mmu_interval_set_seq(mni, cur_seq);
-
-	__vma_userptr_invalidate(vm, uvma);
-	up_write(&vm->userptr.notifier_lock);
-	trace_xe_vma_userptr_invalidate_complete(vma);
-
-	return true;
-}
-
-static const struct mmu_interval_notifier_ops vma_userptr_notifier_ops = {
-	.invalidate = vma_userptr_invalidate,
-};
-
-#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
-/**
- * xe_vma_userptr_force_invalidate() - force invalidate a userptr
- * @uvma: The userptr vma to invalidate
- *
- * Perform a forced userptr invalidation for testing purposes.
- */
-void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
-{
-	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
-
-	/* Protect against concurrent userptr pinning */
-	lockdep_assert_held(&vm->lock);
-	/* Protect against concurrent notifiers */
-	lockdep_assert_held(&vm->userptr.notifier_lock);
-	/*
-	 * Protect against concurrent instances of this function and
-	 * the critical exec sections
-	 */
-	xe_vm_assert_held(vm);
-
-	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
-				     uvma->userptr.notifier_seq))
-		uvma->userptr.notifier_seq -= 2;
-	__vma_userptr_invalidate(vm, uvma);
-}
-#endif
-
-int xe_vm_userptr_pin(struct xe_vm *vm)
-{
-	struct xe_userptr_vma *uvma, *next;
-	int err = 0;
-
-	xe_assert(vm->xe, !xe_vm_in_fault_mode(vm));
-	lockdep_assert_held_write(&vm->lock);
-
-	/* Collect invalidated userptrs */
-	spin_lock(&vm->userptr.invalidated_lock);
-	xe_assert(vm->xe, list_empty(&vm->userptr.repin_list));
-	list_for_each_entry_safe(uvma, next, &vm->userptr.invalidated,
-				 userptr.invalidate_link) {
-		list_del_init(&uvma->userptr.invalidate_link);
-		list_add_tail(&uvma->userptr.repin_link,
-			      &vm->userptr.repin_list);
-	}
-	spin_unlock(&vm->userptr.invalidated_lock);
-
-	/* Pin and move to bind list */
-	list_for_each_entry_safe(uvma, next, &vm->userptr.repin_list,
-				 userptr.repin_link) {
-		err = xe_vma_userptr_pin_pages(uvma);
-		if (err == -EFAULT) {
-			list_del_init(&uvma->userptr.repin_link);
-			/*
-			 * We might have already done the pin once already, but
-			 * then had to retry before the re-bind happened, due
-			 * some other condition in the caller, but in the
-			 * meantime the userptr got dinged by the notifier such
-			 * that we need to revalidate here, but this time we hit
-			 * the EFAULT. In such a case make sure we remove
-			 * ourselves from the rebind list to avoid going down in
-			 * flames.
-			 */
-			if (!list_empty(&uvma->vma.combined_links.rebind))
-				list_del_init(&uvma->vma.combined_links.rebind);
-
-			/* Wait for pending binds */
-			xe_vm_lock(vm, false);
-			dma_resv_wait_timeout(xe_vm_resv(vm),
-					      DMA_RESV_USAGE_BOOKKEEP,
-					      false, MAX_SCHEDULE_TIMEOUT);
-
-			down_read(&vm->userptr.notifier_lock);
-			err = xe_vm_invalidate_vma(&uvma->vma);
-			up_read(&vm->userptr.notifier_lock);
-			xe_vm_unlock(vm);
-			if (err)
-				break;
-		} else {
-			if (err)
-				break;
-
-			list_del_init(&uvma->userptr.repin_link);
-			list_move_tail(&uvma->vma.combined_links.rebind,
-				       &vm->rebind_list);
-		}
-	}
-
-	if (err) {
-		down_write(&vm->userptr.notifier_lock);
-		spin_lock(&vm->userptr.invalidated_lock);
-		list_for_each_entry_safe(uvma, next, &vm->userptr.repin_list,
-					 userptr.repin_link) {
-			list_del_init(&uvma->userptr.repin_link);
-			list_move_tail(&uvma->userptr.invalidate_link,
-				       &vm->userptr.invalidated);
-		}
-		spin_unlock(&vm->userptr.invalidated_lock);
-		up_write(&vm->userptr.notifier_lock);
-	}
-	return err;
-}
-
-/**
- * xe_vm_userptr_check_repin() - Check whether the VM might have userptrs
- * that need repinning.
- * @vm: The VM.
- *
- * This function does an advisory check for whether the VM has userptrs that
- * need repinning.
- *
- * Return: 0 if there are no indications of userptrs needing repinning,
- * -EAGAIN if there are.
- */
-int xe_vm_userptr_check_repin(struct xe_vm *vm)
-{
-	return (list_empty_careful(&vm->userptr.repin_list) &&
-		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
-}
-
 static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
 {
 	int i;
@@ -1245,25 +999,17 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 		drm_gpuvm_bo_put(vm_bo);
 	} else /* userptr or null */ {
 		if (!is_null && !is_cpu_addr_mirror) {
-			struct xe_userptr *userptr = &to_userptr_vma(vma)->userptr;
+			struct xe_userptr_vma *uvma = to_userptr_vma(vma);
 			u64 size = end - start + 1;
 			int err;
 
-			INIT_LIST_HEAD(&userptr->invalidate_link);
-			INIT_LIST_HEAD(&userptr->repin_link);
 			vma->gpuva.gem.offset = bo_offset_or_userptr;
-			mutex_init(&userptr->unmap_mutex);
 
-			err = mmu_interval_notifier_insert(&userptr->notifier,
-							   current->mm,
-							   xe_vma_userptr(vma), size,
-							   &vma_userptr_notifier_ops);
+			err = xe_userptr_setup(uvma, xe_vma_userptr(vma), size);
 			if (err) {
 				xe_vma_free(vma);
 				return ERR_PTR(err);
 			}
-
-			userptr->notifier_seq = LONG_MAX;
 		}
 
 		xe_vm_get(vm);
@@ -1283,18 +1029,8 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 
 	if (xe_vma_is_userptr(vma)) {
 		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
-		struct xe_userptr *userptr = &uvma->userptr;
 
-		if (userptr->sg)
-			xe_hmm_userptr_free_sg(uvma);
-
-		/*
-		 * Since userptr pages are not pinned, we can't remove
-		 * the notifier until we're sure the GPU is not accessing
-		 * them anymore
-		 */
-		mmu_interval_notifier_remove(&userptr->notifier);
-		mutex_destroy(&userptr->unmap_mutex);
+		xe_userptr_remove(uvma);
 		xe_vm_put(vm);
 	} else if (xe_vma_is_null(vma) || xe_vma_is_cpu_addr_mirror(vma)) {
 		xe_vm_put(vm);
@@ -1331,11 +1067,7 @@ static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence *fence)
 
 	if (xe_vma_is_userptr(vma)) {
 		xe_assert(vm->xe, vma->gpuva.flags & XE_VMA_DESTROYED);
-
-		spin_lock(&vm->userptr.invalidated_lock);
-		xe_assert(vm->xe, list_empty(&to_userptr_vma(vma)->userptr.repin_link));
-		list_del(&to_userptr_vma(vma)->userptr.invalidate_link);
-		spin_unlock(&vm->userptr.invalidated_lock);
+		xe_userptr_destroy(to_userptr_vma(vma));
 	} else if (!xe_vma_is_null(vma) && !xe_vma_is_cpu_addr_mirror(vma)) {
 		xe_bo_assert_held(xe_vma_bo(vma));
 
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index b3e5bec0fa58..bec9bf89d937 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -220,12 +220,6 @@ static inline bool xe_vm_in_preempt_fence_mode(struct xe_vm *vm)
 int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
 void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q);
 
-int xe_vm_userptr_pin(struct xe_vm *vm);
-
-int __xe_vm_userptr_needs_repin(struct xe_vm *vm);
-
-int xe_vm_userptr_check_repin(struct xe_vm *vm);
-
 int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker);
 struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma,
 				u8 tile_mask);
@@ -266,10 +260,6 @@ static inline void xe_vm_reactivate_rebind(struct xe_vm *vm)
 	}
 }
 
-int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma);
-
-int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
-
 bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
 
 int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
@@ -391,11 +381,4 @@ static inline bool xe_vm_is_validating(struct xe_vm *vm)
 #define xe_vm_has_valid_gpu_mapping(tile, tile_present, tile_invalidated)	\
 	((READ_ONCE(tile_present) & ~READ_ONCE(tile_invalidated)) & BIT((tile)->id))
 
-#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
-void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma);
-#else
-static inline void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
-{
-}
-#endif
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index b5108d010786..aee050c295db 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -17,6 +17,7 @@
 #include "xe_device_types.h"
 #include "xe_pt_types.h"
 #include "xe_range_fence.h"
+#include "xe_userptr.h"
 
 struct xe_bo;
 struct xe_svm_range;
@@ -46,37 +47,6 @@ struct xe_vm_pgtable_update_op;
 #define XE_VMA_DUMPABLE		(DRM_GPUVA_USERBITS << 8)
 #define XE_VMA_SYSTEM_ALLOCATOR	(DRM_GPUVA_USERBITS << 9)
 
-/** struct xe_userptr - User pointer */
-struct xe_userptr {
-	/** @invalidate_link: Link for the vm::userptr.invalidated list */
-	struct list_head invalidate_link;
-	/** @userptr: link into VM repin list if userptr. */
-	struct list_head repin_link;
-	/**
-	 * @notifier: MMU notifier for user pointer (invalidation call back)
-	 */
-	struct mmu_interval_notifier notifier;
-	/** @sgt: storage for a scatter gather table */
-	struct sg_table sgt;
-	/** @sg: allocated scatter gather table */
-	struct sg_table *sg;
-	/** @notifier_seq: notifier sequence number */
-	unsigned long notifier_seq;
-	/** @unmap_mutex: Mutex protecting dma-unmapping */
-	struct mutex unmap_mutex;
-	/**
-	 * @initial_bind: user pointer has been bound at least once.
-	 * write: vm->userptr.notifier_lock in read mode and vm->resv held.
-	 * read: vm->userptr.notifier_lock in write mode or vm->resv held.
-	 */
-	bool initial_bind;
-	/** @mapped: Whether the @sgt sg-table is dma-mapped. Protected by @unmap_mutex. */
-	bool mapped;
-#if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
-	u32 divisor;
-#endif
-};
-
 /**
  * struct xe_vma_mem_attr - memory attributes associated with vma
  */
@@ -289,33 +259,7 @@ struct xe_vm {
 	const struct xe_pt_ops *pt_ops;
 
 	/** @userptr: user pointer state */
-	struct {
-		/**
-		 * @userptr.repin_list: list of VMAs which are user pointers,
-		 * and needs repinning. Protected by @lock.
-		 */
-		struct list_head repin_list;
-		/**
-		 * @notifier_lock: protects notifier in write mode and
-		 * submission in read mode.
-		 */
-		struct rw_semaphore notifier_lock;
-		/**
-		 * @userptr.invalidated_lock: Protects the
-		 * @userptr.invalidated list.
-		 */
-		spinlock_t invalidated_lock;
-		/**
-		 * @userptr.invalidated: List of invalidated userptrs, not yet
-		 * picked
-		 * up for revalidation. Protected from access with the
-		 * @invalidated_lock. Removing items from the list
-		 * additionally requires @lock in write mode, and adding
-		 * items to the list requires either the @userptr.notifier_lock in
-		 * write mode, OR @lock in write mode.
-		 */
-		struct list_head invalidated;
-	} userptr;
+	struct xe_userptr_vm userptr;
 
 	/** @preempt: preempt state */
 	struct {
-- 
2.51.0

