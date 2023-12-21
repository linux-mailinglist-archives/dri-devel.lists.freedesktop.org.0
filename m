Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 520EB81AE05
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 05:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35AD10E680;
	Thu, 21 Dec 2023 04:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21B510E660;
 Thu, 21 Dec 2023 04:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703132903; x=1734668903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=toJHZ/EnH0ybS4vHd+ZNq/8CT0wCKgZvP2FrNGzeTxs=;
 b=RRSf7IW8kqlmHptKBJvTLfyZJMLaTNQ0ZyDO48voOLJcGqi2NyNH4BuL
 h7exqjtvWDTb9KpFjkcZ+lRNVwVzPXYRIZlYqv1xMWITP4qAqVhwgcQW3
 hPDEALPgOPSb95G+EVNC2eTLGj435h6rvAXtlnS9YHskT+d87GWhd5DNy
 wT5kTy1RWx7sx0AZw/NblxbHmdiBTOSBZu6exbYkbe7yMRCwnVL6IPr2d
 v/rU4wppDeY3zwUkp4vUsfikXWZVU7bYMeBv33q9oQNl/SxGGh9Yk0r+X
 nOIromMem9GYuoofpDCCrLJmy6CWMx05U4aDQcQJ7VcsRNarCkSsr/Vdq g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="427069781"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="427069781"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="805481400"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="805481400"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:21 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 21/22] drm/xe/svm: GPU page fault support
Date: Wed, 20 Dec 2023 23:38:11 -0500
Message-Id: <20231221043812.3783313-22-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20231221043812.3783313-1-oak.zeng@intel.com>
References: <20231221043812.3783313-1-oak.zeng@intel.com>
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
Cc: matthew.brost@intel.com, Thomas.Hellstrom@linux.intel.com,
 niranjana.vishwanathapura@intel.com, brian.welty@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On gpu page fault of a virtual address, try to fault in the virtual
address range to gpu page table and let HW to retry on the faulty
address.

Right now, we always migrate the whole vma which contains the fault
address to GPU. This is subject to change of a more sophisticated
migration policy: decide whether to migrate memory to GPU or map
in place with CPU memory; migration granularity.

There is rather complicated locking strategy in this patch. See more
details in xe_svm_doc.h, lock design section.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c |   7 ++
 drivers/gpu/drm/xe/xe_svm.c          | 116 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h          |   6 ++
 drivers/gpu/drm/xe/xe_svm_range.c    |  43 ++++++++++
 4 files changed, 172 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 6de1ff195aaa..0afd312ff154 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -22,6 +22,7 @@
 #include "xe_pt.h"
 #include "xe_trace.h"
 #include "xe_vm.h"
+#include "xe_svm.h"
 
 enum fault_type {
 	NOT_PRESENT = 0,
@@ -131,6 +132,11 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	if (!vm || !xe_vm_in_fault_mode(vm))
 		return -EINVAL;
 
+	if (vm->svm) {
+		ret = xe_svm_handle_gpu_fault(vm, gt, pf);
+		goto put_vm;
+	}
+
 retry_userptr:
 	/*
 	 * TODO: Avoid exclusive lock if VM doesn't have userptrs, or
@@ -219,6 +225,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 		if (ret >= 0)
 			ret = 0;
 	}
+put_vm:
 	xe_vm_put(vm);
 
 	return ret;
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 0c13690a19f5..1ade8d7f0ab2 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -12,6 +12,7 @@
 #include "xe_svm.h"
 #include <linux/hmm.h>
 #include <linux/scatterlist.h>
+#include <drm/xe_drm.h>
 #include "xe_pt.h"
 #include "xe_assert.h"
 #include "xe_vm_types.h"
@@ -206,3 +207,118 @@ static int svm_populate_range(struct xe_svm_range *svm_range,
 		kvfree(pfns);
 	return ret;
 }
+
+/**
+ * svm_access_allowed() -  Determine whether read or/and write to vma is allowed
+ *
+ * @write: true means a read and write access; false: read only access
+ */
+static bool svm_access_allowed(struct vm_area_struct *vma, bool write)
+{
+	unsigned long access = VM_READ;
+
+	if (write)
+		access |= VM_WRITE;
+
+	return (vma->vm_flags & access) == access;
+}
+
+/**
+ * svm_should_migrate() - Determine whether we should migrate a range to
+ * a destination memory region
+ *
+ * @range: The svm memory range to consider
+ * @dst_region: target destination memory region
+ * @is_atomic_fault: Is the intended migration triggered by a atomic access?
+ * On some platform, we have to migrate memory to guarantee atomic correctness.
+ */
+static bool svm_should_migrate(struct xe_svm_range *range,
+				struct xe_mem_region *dst_region, bool is_atomic_fault)
+{
+	return true;
+}
+
+/**
+ * xe_svm_handle_gpu_fault() - gpu page fault handler for svm subsystem
+ *
+ * @vm: The vm of the fault.
+ * @gt: The gt hardware on which the fault happens.
+ * @pf: page fault descriptor
+ *
+ * Workout a backing memory for the fault address, migrate memory from
+ * system memory to gpu vram if nessary, and map the fault address to
+ * GPU so GPU HW can retry the last operation which has caused the GPU
+ * page fault.
+ */
+int xe_svm_handle_gpu_fault(struct xe_vm *vm,
+				struct xe_gt *gt,
+				struct pagefault *pf)
+{
+	u8 access_type = pf->access_type;
+	u64 page_addr = pf->page_addr;
+	struct hmm_range hmm_range;
+	struct vm_area_struct *vma;
+	struct xe_svm_range *range;
+	struct mm_struct *mm;
+	struct xe_svm *svm;
+	int ret = 0;
+
+	svm = vm->svm;
+	if (!svm)
+		return -EINVAL;
+
+	mm = svm->mm;
+	mmap_read_lock(mm);
+	vma = find_vma_intersection(mm, page_addr, page_addr + 4);
+	if (!vma) {
+		mmap_read_unlock(mm);
+		return -ENOENT;
+	}
+
+	if (!svm_access_allowed (vma, access_type != ACCESS_TYPE_READ)) {
+		mmap_read_unlock(mm);
+		return -EPERM;
+	}
+
+	range = xe_svm_range_from_addr(svm, page_addr);
+	if (!range) {
+		range = xe_svm_range_create(svm, vma);
+		if (!range) {
+			mmap_read_unlock(mm);
+			return -ENOMEM;
+		}
+	}
+
+	if (svm_should_migrate(range, &gt->tile->mem.vram,
+						access_type == ACCESS_TYPE_ATOMIC))
+		/** Migrate whole svm range for now.
+		 *  This is subject to change once we introduce a migration granularity
+		 *  parameter for user to select.
+		 *
+		 *	Migration is best effort. If we failed to migrate to vram,
+		 *	we just map that range to gpu in system memory. For cases
+		 *	such as gpu atomic operation which requires memory to be
+		 *	resident in vram, we will fault again and retry migration.
+		 */
+		svm_migrate_range_to_vram(range, vma, gt->tile);
+
+	ret = svm_populate_range(range, &hmm_range, vma->vm_flags & VM_WRITE);
+	mmap_read_unlock(mm);
+	/** There is no need to destroy this range. Range can be reused later */
+	if (ret)
+		goto free_pfns;
+
+	/**FIXME: set the DM, AE flags in PTE*/
+	ret = xe_bind_svm_range(vm, gt->tile, &hmm_range,
+		!(vma->vm_flags & VM_WRITE) ? DRM_XE_VM_BIND_FLAG_READONLY : 0);
+	/** Concurrent cpu page table update happened,
+	 *  Return successfully so we will retry everything
+	 *  on next gpu page fault.
+	 */
+	if (ret == -EAGAIN)
+		ret = 0;
+
+free_pfns:
+	kvfree(hmm_range.hmm_pfns);
+	return ret;
+}
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 659bcb7927d6..a8ff4957a9b8 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -20,6 +20,7 @@
 
 struct xe_vm;
 struct mm_struct;
+struct pagefault;
 
 #define XE_MAX_SVM_PROCESS 5 /* Maximumly support 32 SVM process*/
 extern DECLARE_HASHTABLE(xe_svm_table, XE_MAX_SVM_PROCESS);
@@ -94,6 +95,8 @@ bool xe_svm_range_belongs_to_vma(struct mm_struct *mm,
 void xe_svm_range_unregister_mmu_notifier(struct xe_svm_range *range);
 int xe_svm_range_register_mmu_notifier(struct xe_svm_range *range);
 void xe_svm_range_prepare_destroy(struct xe_svm_range *range);
+struct xe_svm_range *xe_svm_range_create(struct xe_svm *svm,
+									struct vm_area_struct *vma);
 
 int xe_svm_build_sg(struct hmm_range *range, struct sg_table *st);
 int xe_svm_devm_add(struct xe_tile *tile, struct xe_mem_region *mem);
@@ -106,4 +109,7 @@ int xe_devm_alloc_pages(struct xe_tile *tile,
 
 void xe_devm_free_blocks(struct list_head *blocks);
 void xe_devm_page_free(struct page *page);
+int xe_svm_handle_gpu_fault(struct xe_vm *vm,
+				struct xe_gt *gt,
+				struct pagefault *pf);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_svm_range.c b/drivers/gpu/drm/xe/xe_svm_range.c
index dfb4660dc26f..05c088dddc2d 100644
--- a/drivers/gpu/drm/xe/xe_svm_range.c
+++ b/drivers/gpu/drm/xe/xe_svm_range.c
@@ -182,3 +182,46 @@ void xe_svm_range_prepare_destroy(struct xe_svm_range *range)
 	xe_invalidate_svm_range(vm, range->start, length);
 	xe_svm_range_unregister_mmu_notifier(range);
 }
+
+static void add_range_to_svm(struct xe_svm_range *range)
+{
+	range->inode.start = range->start;
+	range->inode.last = range->end;
+	mutex_lock(&range->svm->mutex);
+	interval_tree_insert(&range->inode, &range->svm->range_tree);
+	mutex_unlock(&range->svm->mutex);
+}
+
+/**
+ * xe_svm_range_create() - create and initialize a svm range
+ *
+ * @svm: the svm that the range belongs to
+ * @vma: the corresponding vma of the range
+ *
+ * Create range, add it to svm's interval tree. Regiter a mmu
+ * interval notifier for this range.
+ *
+ * Return the pointer of the created svm range
+ * or NULL if fail
+ */
+struct xe_svm_range *xe_svm_range_create(struct xe_svm *svm,
+									struct vm_area_struct *vma)
+{
+	struct xe_svm_range *range = kzalloc(sizeof(*range), GFP_KERNEL);
+
+	if (!range)
+		return NULL;
+
+	range->start = vma->vm_start;
+	range->end = vma->vm_end;
+	range->vma = vma;
+	range->svm = svm;
+
+	if (xe_svm_range_register_mmu_notifier(range)){
+		kfree(range);
+		return NULL;
+	}
+
+	add_range_to_svm(range);
+	return range;
+}
-- 
2.26.3

