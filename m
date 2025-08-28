Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E7AB3A199
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 16:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD6210E9F5;
	Thu, 28 Aug 2025 14:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d2iuEgEm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183D610E9D1;
 Thu, 28 Aug 2025 14:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756391168; x=1787927168;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TRrqseKT3MpbTk9g0cbwVpEObVv1E4P8KQMxkzp0Ww4=;
 b=d2iuEgEmRn3PypqqKMMvApyqsaz7hzHKnEl/pQCWRUicACqK3Ceqam3l
 LGSAT0am5iqeyApLFhqKosLgvYRmwDSrbA4pQH7wQl+IW/Isc33v/fvAL
 3NX3cQqH35Pf/2qyPO4XSZmCP2kVA+fI6NgSLP3WnsFOD/pxXcwqo1foG
 VkteRvtloWGCTr4uVzla1wcblVqACEqpr7OfS0Uex1YFQaaZ2EGK2rooX
 5h+R6FYo9PAamgjVPeCBlqAy9KQ1bY6qtTj4SvJaMejnquA8mFxCbw3Uf
 HbFaKKvnSJmyKcGPO2lQ8OfbzNTatgl0awi7R22d38uk8WLRnRogmNsVG g==;
X-CSE-ConnectionGUID: YH9Y4wSrSEy30c1La2pEng==
X-CSE-MsgGUID: UzxLaLTJRf2mwVwYjmv4zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58763206"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58763206"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 07:26:07 -0700
X-CSE-ConnectionGUID: poeHGHWfTeq0c1VQ1QSO2Q==
X-CSE-MsgGUID: EuaRKRdIQryP2fLzUD+prw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170025906"
Received: from johunt-mobl9.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.84])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 07:26:06 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Dafna Hirschfeld <dafna.hirschfeld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v6 7/8] drm/xe/userptr: replace xe_hmm with gpusvm
Date: Thu, 28 Aug 2025 15:24:38 +0100
Message-ID: <20250828142430.615826-17-matthew.auld@intel.com>
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

Goal here is cut over to gpusvm and remove xe_hmm, relying instead on
common code. The core facilities we need are get_pages(), unmap_pages()
and free_pages() for a given useptr range, plus a vm level notifier
lock, which is now provided by gpusvm.

v2:
  - Reuse the same SVM vm struct we use for full SVM, that way we can
    use the same lock (Matt B & Himal)
v3:
  - Re-use svm_init/fini for userptr.
v4:
  - Allow building xe without userptr if we are missing DRM_GPUSVM
    config. (Matt B)
  - Always make .read_only match xe_vma_read_only() for the ctx. (Dafna)
v5:
  - Fix missing conversion with CONFIG_DRM_XE_USERPTR_INVAL_INJECT
v6:
  - Convert the new user in xe_vm_madise.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/Kconfig         |   2 +-
 drivers/gpu/drm/xe/Makefile        |   3 +-
 drivers/gpu/drm/xe/xe_exec.c       |   5 +-
 drivers/gpu/drm/xe/xe_hmm.c        | 325 -----------------------------
 drivers/gpu/drm/xe/xe_hmm.h        |  18 --
 drivers/gpu/drm/xe/xe_pt.c         |  24 +--
 drivers/gpu/drm/xe/xe_svm.c        |  32 +--
 drivers/gpu/drm/xe/xe_svm.h        |  56 +++--
 drivers/gpu/drm/xe/xe_userptr.c    |  54 +++--
 drivers/gpu/drm/xe/xe_userptr.h    |  46 ++--
 drivers/gpu/drm/xe/xe_vm.c         |  48 ++---
 drivers/gpu/drm/xe/xe_vm_madvise.c |  24 +--
 drivers/gpu/drm/xe/xe_vm_types.h   |   8 +-
 13 files changed, 171 insertions(+), 474 deletions(-)
 delete mode 100644 drivers/gpu/drm/xe/xe_hmm.c
 delete mode 100644 drivers/gpu/drm/xe/xe_hmm.h

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 714d5702dfd7..7219f6b884b6 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -40,12 +40,12 @@ config DRM_XE
 	select DRM_TTM
 	select DRM_TTM_HELPER
 	select DRM_EXEC
+	select DRM_GPUSVM if !UML && DEVICE_PRIVATE
 	select DRM_GPUVM
 	select DRM_SCHED
 	select MMU_NOTIFIER
 	select WANT_DEV_COREDUMP
 	select AUXILIARY_BUS
-	select HMM_MIRROR
 	select REGMAP if I2C
 	help
 	  Driver for Intel Xe2 series GPUs and later. Experimental support
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 85ead33f69ab..f57e3d4dc6fe 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -130,7 +130,6 @@ xe-y += xe_bb.o \
 	xe_tuning.o \
 	xe_uc.o \
 	xe_uc_fw.o \
-	xe_userptr.o \
 	xe_vm.o \
 	xe_vm_madvise.o \
 	xe_vram.o \
@@ -141,8 +140,8 @@ xe-y += xe_bb.o \
 	xe_wopcm.o
 
 xe-$(CONFIG_I2C)	+= xe_i2c.o
-xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
 xe-$(CONFIG_DRM_XE_GPUSVM) += xe_svm.o
+xe-$(CONFIG_DRM_GPUSVM) += xe_userptr.o
 
 # graphics hardware monitoring (HWMON) support
 xe-$(CONFIG_HWMON) += xe_hwmon.o
diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
index 44364c042ad7..25a59b6934f6 100644
--- a/drivers/gpu/drm/xe/xe_exec.c
+++ b/drivers/gpu/drm/xe/xe_exec.c
@@ -19,6 +19,7 @@
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 #include "xe_sync.h"
+#include "xe_svm.h"
 #include "xe_vm.h"
 
 /**
@@ -294,7 +295,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 		if (err)
 			goto err_put_job;
 
-		err = down_read_interruptible(&vm->userptr.notifier_lock);
+		err = xe_svm_notifier_lock_interruptible(vm);
 		if (err)
 			goto err_put_job;
 
@@ -336,7 +337,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 
 err_repin:
 	if (!xe_vm_in_lr_mode(vm))
-		up_read(&vm->userptr.notifier_lock);
+		xe_svm_notifier_unlock(vm);
 err_put_job:
 	if (err)
 		xe_sched_job_put(job);
diff --git a/drivers/gpu/drm/xe/xe_hmm.c b/drivers/gpu/drm/xe/xe_hmm.c
deleted file mode 100644
index 57b71956ddf4..000000000000
--- a/drivers/gpu/drm/xe/xe_hmm.c
+++ /dev/null
@@ -1,325 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright © 2024 Intel Corporation
- */
-
-#include <linux/scatterlist.h>
-#include <linux/mmu_notifier.h>
-#include <linux/dma-mapping.h>
-#include <linux/memremap.h>
-#include <linux/swap.h>
-#include <linux/hmm.h>
-#include <linux/mm.h>
-#include "xe_hmm.h"
-#include "xe_vm.h"
-#include "xe_bo.h"
-
-static u64 xe_npages_in_range(unsigned long start, unsigned long end)
-{
-	return (end - start) >> PAGE_SHIFT;
-}
-
-static int xe_alloc_sg(struct xe_device *xe, struct sg_table *st,
-		       struct hmm_range *range, struct rw_semaphore *notifier_sem)
-{
-	unsigned long i, npages, hmm_pfn;
-	unsigned long num_chunks = 0;
-	int ret;
-
-	/* HMM docs says this is needed. */
-	ret = down_read_interruptible(notifier_sem);
-	if (ret)
-		return ret;
-
-	if (mmu_interval_read_retry(range->notifier, range->notifier_seq)) {
-		up_read(notifier_sem);
-		return -EAGAIN;
-	}
-
-	npages = xe_npages_in_range(range->start, range->end);
-	for (i = 0; i < npages;) {
-		unsigned long len;
-
-		hmm_pfn = range->hmm_pfns[i];
-		xe_assert(xe, hmm_pfn & HMM_PFN_VALID);
-
-		len = 1UL << hmm_pfn_to_map_order(hmm_pfn);
-
-		/* If order > 0 the page may extend beyond range->start */
-		len -= (hmm_pfn & ~HMM_PFN_FLAGS) & (len - 1);
-		i += len;
-		num_chunks++;
-	}
-	up_read(notifier_sem);
-
-	return sg_alloc_table(st, num_chunks, GFP_KERNEL);
-}
-
-/**
- * xe_build_sg() - build a scatter gather table for all the physical pages/pfn
- * in a hmm_range. dma-map pages if necessary. dma-address is save in sg table
- * and will be used to program GPU page table later.
- * @xe: the xe device who will access the dma-address in sg table
- * @range: the hmm range that we build the sg table from. range->hmm_pfns[]
- * has the pfn numbers of pages that back up this hmm address range.
- * @st: pointer to the sg table.
- * @notifier_sem: The xe notifier lock.
- * @write: whether we write to this range. This decides dma map direction
- * for system pages. If write we map it bi-diretional; otherwise
- * DMA_TO_DEVICE
- *
- * All the contiguous pfns will be collapsed into one entry in
- * the scatter gather table. This is for the purpose of efficiently
- * programming GPU page table.
- *
- * The dma_address in the sg table will later be used by GPU to
- * access memory. So if the memory is system memory, we need to
- * do a dma-mapping so it can be accessed by GPU/DMA.
- *
- * FIXME: This function currently only support pages in system
- * memory. If the memory is GPU local memory (of the GPU who
- * is going to access memory), we need gpu dpa (device physical
- * address), and there is no need of dma-mapping. This is TBD.
- *
- * FIXME: dma-mapping for peer gpu device to access remote gpu's
- * memory. Add this when you support p2p
- *
- * This function allocates the storage of the sg table. It is
- * caller's responsibility to free it calling sg_free_table.
- *
- * Returns 0 if successful; -ENOMEM if fails to allocate memory
- */
-static int xe_build_sg(struct xe_device *xe, struct hmm_range *range,
-		       struct sg_table *st,
-		       struct rw_semaphore *notifier_sem,
-		       bool write)
-{
-	unsigned long npages = xe_npages_in_range(range->start, range->end);
-	struct device *dev = xe->drm.dev;
-	struct scatterlist *sgl;
-	struct page *page;
-	unsigned long i, j;
-
-	lockdep_assert_held(notifier_sem);
-
-	i = 0;
-	for_each_sg(st->sgl, sgl, st->nents, j) {
-		unsigned long hmm_pfn, size;
-
-		hmm_pfn = range->hmm_pfns[i];
-		page = hmm_pfn_to_page(hmm_pfn);
-		xe_assert(xe, !is_device_private_page(page));
-
-		size = 1UL << hmm_pfn_to_map_order(hmm_pfn);
-		size -= page_to_pfn(page) & (size - 1);
-		i += size;
-
-		if (unlikely(j == st->nents - 1)) {
-			xe_assert(xe, i >= npages);
-			if (i > npages)
-				size -= (i - npages);
-
-			sg_mark_end(sgl);
-		} else {
-			xe_assert(xe, i < npages);
-		}
-
-		sg_set_page(sgl, page, size << PAGE_SHIFT, 0);
-	}
-
-	return dma_map_sgtable(dev, st, write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE,
-			       DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_NO_KERNEL_MAPPING);
-}
-
-static void xe_hmm_userptr_set_mapped(struct xe_userptr_vma *uvma)
-{
-	struct xe_userptr *userptr = &uvma->userptr;
-	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
-
-	lockdep_assert_held_write(&vm->lock);
-	lockdep_assert_held(&vm->userptr.notifier_lock);
-
-	mutex_lock(&userptr->unmap_mutex);
-	xe_assert(vm->xe, !userptr->mapped);
-	userptr->mapped = true;
-	mutex_unlock(&userptr->unmap_mutex);
-}
-
-void xe_hmm_userptr_unmap(struct xe_userptr_vma *uvma)
-{
-	struct xe_userptr *userptr = &uvma->userptr;
-	struct xe_vma *vma = &uvma->vma;
-	bool write = !xe_vma_read_only(vma);
-	struct xe_vm *vm = xe_vma_vm(vma);
-	struct xe_device *xe = vm->xe;
-
-	if (!lockdep_is_held_type(&vm->userptr.notifier_lock, 0) &&
-	    !lockdep_is_held_type(&vm->lock, 0) &&
-	    !(vma->gpuva.flags & XE_VMA_DESTROYED)) {
-		/* Don't unmap in exec critical section. */
-		xe_vm_assert_held(vm);
-		/* Don't unmap while mapping the sg. */
-		lockdep_assert_held(&vm->lock);
-	}
-
-	mutex_lock(&userptr->unmap_mutex);
-	if (userptr->sg && userptr->mapped)
-		dma_unmap_sgtable(xe->drm.dev, userptr->sg,
-				  write ? DMA_BIDIRECTIONAL : DMA_TO_DEVICE, 0);
-	userptr->mapped = false;
-	mutex_unlock(&userptr->unmap_mutex);
-}
-
-/**
- * xe_hmm_userptr_free_sg() - Free the scatter gather table of userptr
- * @uvma: the userptr vma which hold the scatter gather table
- *
- * With function xe_userptr_populate_range, we allocate storage of
- * the userptr sg table. This is a helper function to free this
- * sg table, and dma unmap the address in the table.
- */
-void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma)
-{
-	struct xe_userptr *userptr = &uvma->userptr;
-
-	xe_assert(xe_vma_vm(&uvma->vma)->xe, userptr->sg);
-	xe_hmm_userptr_unmap(uvma);
-	sg_free_table(userptr->sg);
-	userptr->sg = NULL;
-}
-
-/**
- * xe_hmm_userptr_populate_range() - Populate physical pages of a virtual
- * address range
- *
- * @uvma: userptr vma which has information of the range to populate.
- * @is_mm_mmap_locked: True if mmap_read_lock is already acquired by caller.
- *
- * This function populate the physical pages of a virtual
- * address range. The populated physical pages is saved in
- * userptr's sg table. It is similar to get_user_pages but call
- * hmm_range_fault.
- *
- * This function also read mmu notifier sequence # (
- * mmu_interval_read_begin), for the purpose of later
- * comparison (through mmu_interval_read_retry).
- *
- * This must be called with mmap read or write lock held.
- *
- * This function allocates the storage of the userptr sg table.
- * It is caller's responsibility to free it calling sg_free_table.
- *
- * returns: 0 for success; negative error no on failure
- */
-int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma,
-				  bool is_mm_mmap_locked)
-{
-	unsigned long timeout =
-		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
-	unsigned long *pfns;
-	struct xe_userptr *userptr;
-	struct xe_vma *vma = &uvma->vma;
-	u64 userptr_start = xe_vma_userptr(vma);
-	u64 userptr_end = userptr_start + xe_vma_size(vma);
-	struct xe_vm *vm = xe_vma_vm(vma);
-	struct hmm_range hmm_range = {
-		.pfn_flags_mask = 0, /* ignore pfns */
-		.default_flags = HMM_PFN_REQ_FAULT,
-		.start = userptr_start,
-		.end = userptr_end,
-		.notifier = &uvma->userptr.notifier,
-		.dev_private_owner = vm->xe,
-	};
-	bool write = !xe_vma_read_only(vma);
-	unsigned long notifier_seq;
-	u64 npages;
-	int ret;
-
-	userptr = &uvma->userptr;
-
-	if (is_mm_mmap_locked)
-		mmap_assert_locked(userptr->notifier.mm);
-
-	if (vma->gpuva.flags & XE_VMA_DESTROYED)
-		return 0;
-
-	notifier_seq = mmu_interval_read_begin(&userptr->notifier);
-	if (notifier_seq == userptr->notifier_seq)
-		return 0;
-
-	if (userptr->sg)
-		xe_hmm_userptr_free_sg(uvma);
-
-	npages = xe_npages_in_range(userptr_start, userptr_end);
-	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
-	if (unlikely(!pfns))
-		return -ENOMEM;
-
-	if (write)
-		hmm_range.default_flags |= HMM_PFN_REQ_WRITE;
-
-	if (!mmget_not_zero(userptr->notifier.mm)) {
-		ret = -EFAULT;
-		goto free_pfns;
-	}
-
-	hmm_range.hmm_pfns = pfns;
-
-	while (true) {
-		hmm_range.notifier_seq = mmu_interval_read_begin(&userptr->notifier);
-
-		if (!is_mm_mmap_locked)
-			mmap_read_lock(userptr->notifier.mm);
-
-		ret = hmm_range_fault(&hmm_range);
-
-		if (!is_mm_mmap_locked)
-			mmap_read_unlock(userptr->notifier.mm);
-
-		if (ret == -EBUSY) {
-			if (time_after(jiffies, timeout))
-				break;
-
-			continue;
-		}
-		break;
-	}
-
-	mmput(userptr->notifier.mm);
-
-	if (ret)
-		goto free_pfns;
-
-	ret = xe_alloc_sg(vm->xe, &userptr->sgt, &hmm_range, &vm->userptr.notifier_lock);
-	if (ret)
-		goto free_pfns;
-
-	ret = down_read_interruptible(&vm->userptr.notifier_lock);
-	if (ret)
-		goto free_st;
-
-	if (mmu_interval_read_retry(hmm_range.notifier, hmm_range.notifier_seq)) {
-		ret = -EAGAIN;
-		goto out_unlock;
-	}
-
-	ret = xe_build_sg(vm->xe, &hmm_range, &userptr->sgt,
-			  &vm->userptr.notifier_lock, write);
-	if (ret)
-		goto out_unlock;
-
-	userptr->sg = &userptr->sgt;
-	xe_hmm_userptr_set_mapped(uvma);
-	userptr->notifier_seq = hmm_range.notifier_seq;
-	up_read(&vm->userptr.notifier_lock);
-	kvfree(pfns);
-	return 0;
-
-out_unlock:
-	up_read(&vm->userptr.notifier_lock);
-free_st:
-	sg_free_table(&userptr->sgt);
-free_pfns:
-	kvfree(pfns);
-	return ret;
-}
diff --git a/drivers/gpu/drm/xe/xe_hmm.h b/drivers/gpu/drm/xe/xe_hmm.h
deleted file mode 100644
index 0ea98d8e7bbc..000000000000
--- a/drivers/gpu/drm/xe/xe_hmm.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* SPDX-License-Identifier: MIT
- *
- * Copyright © 2024 Intel Corporation
- */
-
-#ifndef _XE_HMM_H_
-#define _XE_HMM_H_
-
-#include <linux/types.h>
-
-struct xe_userptr_vma;
-
-int xe_hmm_userptr_populate_range(struct xe_userptr_vma *uvma, bool is_mm_mmap_locked);
-
-void xe_hmm_userptr_free_sg(struct xe_userptr_vma *uvma);
-
-void xe_hmm_userptr_unmap(struct xe_userptr_vma *uvma);
-#endif
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index 9eac29cbdc48..382b25798bc3 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -761,8 +761,8 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 
 	if (!xe_vma_is_null(vma) && !range) {
 		if (xe_vma_is_userptr(vma))
-			xe_res_first_sg(to_userptr_vma(vma)->userptr.sg, 0,
-					xe_vma_size(vma), &curs);
+			xe_res_first_dma(to_userptr_vma(vma)->userptr.pages.dma_addr, 0,
+					 xe_vma_size(vma), &curs);
 		else if (xe_bo_is_vram(bo) || xe_bo_is_stolen(bo))
 			xe_res_first(bo->ttm.resource, xe_vma_bo_offset(vma),
 				     xe_vma_size(vma), &curs);
@@ -915,7 +915,7 @@ bool xe_pt_zap_ptes(struct xe_tile *tile, struct xe_vma *vma)
 	if (xe_vma_bo(vma))
 		xe_bo_assert_held(xe_vma_bo(vma));
 	else if (xe_vma_is_userptr(vma))
-		lockdep_assert_held(&xe_vma_vm(vma)->userptr.notifier_lock);
+		lockdep_assert_held(&xe_vma_vm(vma)->svm.gpusvm.notifier_lock);
 
 	if (!(pt_mask & BIT(tile->id)))
 		return false;
@@ -1050,7 +1050,7 @@ static void xe_pt_commit_locks_assert(struct xe_vma *vma)
 	xe_pt_commit_prepare_locks_assert(vma);
 
 	if (xe_vma_is_userptr(vma))
-		lockdep_assert_held_read(&vm->userptr.notifier_lock);
+		xe_svm_assert_held_read(vm);
 }
 
 static void xe_pt_commit(struct xe_vma *vma,
@@ -1407,7 +1407,7 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
 	struct xe_userptr_vma *uvma;
 	unsigned long notifier_seq;
 
-	lockdep_assert_held_read(&vm->userptr.notifier_lock);
+	xe_svm_assert_held_read(vm);
 
 	if (!xe_vma_is_userptr(vma))
 		return 0;
@@ -1416,7 +1416,7 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
 	if (xe_pt_userptr_inject_eagain(uvma))
 		xe_vma_userptr_force_invalidate(uvma);
 
-	notifier_seq = uvma->userptr.notifier_seq;
+	notifier_seq = uvma->userptr.pages.notifier_seq;
 
 	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
 				     notifier_seq))
@@ -1437,7 +1437,7 @@ static int op_check_userptr(struct xe_vm *vm, struct xe_vma_op *op,
 {
 	int err = 0;
 
-	lockdep_assert_held_read(&vm->userptr.notifier_lock);
+	xe_svm_assert_held_read(vm);
 
 	switch (op->base.op) {
 	case DRM_GPUVA_OP_MAP:
@@ -1478,12 +1478,12 @@ static int xe_pt_userptr_pre_commit(struct xe_migrate_pt_update *pt_update)
 	if (err)
 		return err;
 
-	down_read(&vm->userptr.notifier_lock);
+	down_read(&vm->svm.gpusvm.notifier_lock);
 
 	list_for_each_entry(op, &vops->list, link) {
 		err = op_check_userptr(vm, op, pt_update_ops);
 		if (err) {
-			up_read(&vm->userptr.notifier_lock);
+			up_read(&vm->svm.gpusvm.notifier_lock);
 			break;
 		}
 	}
@@ -2200,7 +2200,7 @@ static void bind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 			   vma->tile_invalidated & ~BIT(tile->id));
 	vma->tile_staged &= ~BIT(tile->id);
 	if (xe_vma_is_userptr(vma)) {
-		lockdep_assert_held_read(&vm->userptr.notifier_lock);
+		xe_svm_assert_held_read(vm);
 		to_userptr_vma(vma)->userptr.initial_bind = true;
 	}
 
@@ -2236,7 +2236,7 @@ static void unbind_op_commit(struct xe_vm *vm, struct xe_tile *tile,
 	if (!vma->tile_present) {
 		list_del_init(&vma->combined_links.rebind);
 		if (xe_vma_is_userptr(vma)) {
-			lockdep_assert_held_read(&vm->userptr.notifier_lock);
+			xe_svm_assert_held_read(vm);
 
 			spin_lock(&vm->userptr.invalidated_lock);
 			list_del_init(&to_userptr_vma(vma)->userptr.invalidate_link);
@@ -2535,7 +2535,7 @@ xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
 	if (pt_update_ops->needs_svm_lock)
 		xe_svm_notifier_unlock(vm);
 	if (pt_update_ops->needs_userptr_lock)
-		up_read(&vm->userptr.notifier_lock);
+		up_read(&vm->svm.gpusvm.notifier_lock);
 
 	xe_tlb_inval_job_put(mjob);
 	xe_tlb_inval_job_put(ijob);
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index d6ef0cd8a02c..e8e7d6365dc4 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -630,22 +630,26 @@ int xe_svm_init(struct xe_vm *vm)
 {
 	int err;
 
-	spin_lock_init(&vm->svm.garbage_collector.lock);
-	INIT_LIST_HEAD(&vm->svm.garbage_collector.range_list);
-	INIT_WORK(&vm->svm.garbage_collector.work,
-		  xe_svm_garbage_collector_work_func);
+	if (vm->flags & XE_VM_FLAG_FAULT_MODE) {
+		spin_lock_init(&vm->svm.garbage_collector.lock);
+		INIT_LIST_HEAD(&vm->svm.garbage_collector.range_list);
+		INIT_WORK(&vm->svm.garbage_collector.work,
+			  xe_svm_garbage_collector_work_func);
 
-	err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
-			      current->mm, xe_svm_devm_owner(vm->xe), 0,
-			      vm->size, xe_modparam.svm_notifier_size * SZ_1M,
-			      &gpusvm_ops, fault_chunk_sizes,
-			      ARRAY_SIZE(fault_chunk_sizes));
-	if (err)
-		return err;
+		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
+				      current->mm, xe_svm_devm_owner(vm->xe), 0,
+				      vm->size,
+				      xe_modparam.svm_notifier_size * SZ_1M,
+				      &gpusvm_ops, fault_chunk_sizes,
+				      ARRAY_SIZE(fault_chunk_sizes));
+		drm_gpusvm_driver_set_lock(&vm->svm.gpusvm, &vm->lock);
+	} else {
+		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)",
+				      &vm->xe->drm, NULL, NULL, 0, 0, 0, NULL,
+				      NULL, 0);
+	}
 
-	drm_gpusvm_driver_set_lock(&vm->svm.gpusvm, &vm->lock);
-
-	return 0;
+	return err;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index f0e0e009c7fc..9d791b0bc6c2 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -155,15 +155,6 @@ static inline unsigned long xe_svm_range_size(struct xe_svm_range *range)
 	return drm_gpusvm_range_size(&range->base);
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
 void xe_svm_flush(struct xe_vm *vm);
 
 #else
@@ -206,12 +197,21 @@ int xe_devm_add(struct xe_tile *tile, struct xe_vram_region *vr)
 static inline
 int xe_svm_init(struct xe_vm *vm)
 {
+#if IS_ENABLED(CONFIG_DRM_GPUSVM)
+	return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)", &vm->xe->drm,
+			       NULL, NULL, 0, 0, 0, NULL, NULL, 0);
+#else
 	return 0;
+#endif
 }
 
 static inline
 void xe_svm_fini(struct xe_vm *vm)
 {
+#if IS_ENABLED(CONFIG_DRM_GPUSVM)
+	xe_assert(vm->xe, xe_vm_is_closed(vm));
+	drm_gpusvm_fini(&vm->svm.gpusvm);
+#endif
 }
 
 static inline
@@ -328,19 +328,47 @@ struct drm_pagemap *xe_vma_resolve_pagemap(struct xe_vma *vma, struct xe_tile *t
 	return NULL;
 }
 
-#define xe_svm_assert_in_notifier(...) do {} while (0)
+static inline void xe_svm_flush(struct xe_vm *vm)
+{
+}
 #define xe_svm_range_has_dma_mapping(...) false
+#endif /* CONFIG_DRM_XE_GPUSVM */
+
+#if IS_ENABLED(CONFIG_DRM_GPUSVM) /* Need to support userptr without XE_GPUSVM */
+#define xe_svm_assert_in_notifier(vm__) \
+	lockdep_assert_held_write(&(vm__)->svm.gpusvm.notifier_lock)
+
+#define xe_svm_assert_held_read(vm__) \
+	lockdep_assert_held_read(&(vm__)->svm.gpusvm.notifier_lock)
+
+#define xe_svm_notifier_lock(vm__)	\
+	drm_gpusvm_notifier_lock(&(vm__)->svm.gpusvm)
+
+#define xe_svm_notifier_lock_interruptible(vm__)	\
+	down_read_interruptible(&(vm__)->svm.gpusvm.notifier_lock)
+
+#define xe_svm_notifier_unlock(vm__)	\
+	drm_gpusvm_notifier_unlock(&(vm__)->svm.gpusvm)
+
+#else
+#define xe_svm_assert_in_notifier(...) do {} while (0)
+
+static inline void xe_svm_assert_held_read(struct xe_vm *vm)
+{
+}
 
 static inline void xe_svm_notifier_lock(struct xe_vm *vm)
 {
 }
 
+static inline int xe_svm_notifier_lock_interruptible(struct xe_vm *vm)
+{
+	return 0;
+}
+
 static inline void xe_svm_notifier_unlock(struct xe_vm *vm)
 {
 }
+#endif /* CONFIG_DRM_GPUSVM */
 
-static inline void xe_svm_flush(struct xe_vm *vm)
-{
-}
-#endif
 #endif
diff --git a/drivers/gpu/drm/xe/xe_userptr.c b/drivers/gpu/drm/xe/xe_userptr.c
index 17ecff17c993..91d09af71ced 100644
--- a/drivers/gpu/drm/xe/xe_userptr.c
+++ b/drivers/gpu/drm/xe/xe_userptr.c
@@ -7,7 +7,6 @@
 
 #include <linux/mm.h>
 
-#include "xe_hmm.h"
 #include "xe_trace_bo.h"
 
 /**
@@ -25,7 +24,7 @@
 int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma)
 {
 	return mmu_interval_check_retry(&uvma->userptr.notifier,
-					uvma->userptr.notifier_seq) ?
+					uvma->userptr.pages.notifier_seq) ?
 		-EAGAIN : 0;
 }
 
@@ -35,14 +34,14 @@ int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma)
  * @vm: The VM.
  *
  * This function checks for whether the VM has userptrs that need repinning,
- * and provides a release-type barrier on the userptr.notifier_lock after
+ * and provides a release-type barrier on the svm.gpusvm.notifier_lock after
  * checking.
  *
  * Return: 0 if there are no userptrs needing repinning, -EAGAIN if there are.
  */
 int __xe_vm_userptr_needs_repin(struct xe_vm *vm)
 {
-	lockdep_assert_held_read(&vm->userptr.notifier_lock);
+	lockdep_assert_held_read(&vm->svm.gpusvm.notifier_lock);
 
 	return (list_empty(&vm->userptr.repin_list) &&
 		list_empty(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
@@ -53,11 +52,22 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma)
 	struct xe_vma *vma = &uvma->vma;
 	struct xe_vm *vm = xe_vma_vm(vma);
 	struct xe_device *xe = vm->xe;
+	struct drm_gpusvm_ctx ctx = {
+		.read_only = xe_vma_read_only(vma),
+	};
 
 	lockdep_assert_held(&vm->lock);
 	xe_assert(xe, xe_vma_is_userptr(vma));
 
-	return xe_hmm_userptr_populate_range(uvma, false);
+	if (vma->gpuva.flags & XE_VMA_DESTROYED)
+		return 0;
+
+	return drm_gpusvm_get_pages(&vm->svm.gpusvm, &uvma->userptr.pages,
+				    uvma->userptr.notifier.mm,
+				    &uvma->userptr.notifier,
+				    xe_vma_userptr(vma),
+				    xe_vma_userptr(vma) + xe_vma_size(vma),
+				    &ctx);
 }
 
 static void __vma_userptr_invalidate(struct xe_vm *vm, struct xe_userptr_vma *uvma)
@@ -66,6 +76,10 @@ static void __vma_userptr_invalidate(struct xe_vm *vm, struct xe_userptr_vma *uv
 	struct xe_vma *vma = &uvma->vma;
 	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
+	struct drm_gpusvm_ctx ctx = {
+		.in_notifier = true,
+		.read_only = xe_vma_read_only(vma),
+	};
 	long err;
 
 	/*
@@ -102,7 +116,8 @@ static void __vma_userptr_invalidate(struct xe_vm *vm, struct xe_userptr_vma *uv
 		XE_WARN_ON(err);
 	}
 
-	xe_hmm_userptr_unmap(uvma);
+	drm_gpusvm_unmap_pages(&vm->svm.gpusvm, &uvma->userptr.pages,
+			       xe_vma_size(vma) >> PAGE_SHIFT, &ctx);
 }
 
 static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
@@ -123,11 +138,11 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 	       "NOTIFIER: addr=0x%016llx, range=0x%016llx",
 		xe_vma_start(vma), xe_vma_size(vma));
 
-	down_write(&vm->userptr.notifier_lock);
+	down_write(&vm->svm.gpusvm.notifier_lock);
 	mmu_interval_set_seq(mni, cur_seq);
 
 	__vma_userptr_invalidate(vm, uvma);
-	up_write(&vm->userptr.notifier_lock);
+	up_write(&vm->svm.gpusvm.notifier_lock);
 	trace_xe_vma_userptr_invalidate_complete(vma);
 
 	return true;
@@ -151,7 +166,7 @@ void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
 	/* Protect against concurrent userptr pinning */
 	lockdep_assert_held(&vm->lock);
 	/* Protect against concurrent notifiers */
-	lockdep_assert_held(&vm->userptr.notifier_lock);
+	lockdep_assert_held(&vm->svm.gpusvm.notifier_lock);
 	/*
 	 * Protect against concurrent instances of this function and
 	 * the critical exec sections
@@ -159,8 +174,8 @@ void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
 	xe_vm_assert_held(vm);
 
 	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
-				     uvma->userptr.notifier_seq))
-		uvma->userptr.notifier_seq -= 2;
+				     uvma->userptr.pages.notifier_seq))
+		uvma->userptr.pages.notifier_seq -= 2;
 	__vma_userptr_invalidate(vm, uvma);
 }
 #endif
@@ -209,9 +224,9 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
 					      DMA_RESV_USAGE_BOOKKEEP,
 					      false, MAX_SCHEDULE_TIMEOUT);
 
-			down_read(&vm->userptr.notifier_lock);
+			down_read(&vm->svm.gpusvm.notifier_lock);
 			err = xe_vm_invalidate_vma(&uvma->vma);
-			up_read(&vm->userptr.notifier_lock);
+			up_read(&vm->svm.gpusvm.notifier_lock);
 			xe_vm_unlock(vm);
 			if (err)
 				break;
@@ -226,7 +241,7 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
 	}
 
 	if (err) {
-		down_write(&vm->userptr.notifier_lock);
+		down_write(&vm->svm.gpusvm.notifier_lock);
 		spin_lock(&vm->userptr.invalidated_lock);
 		list_for_each_entry_safe(uvma, next, &vm->userptr.repin_list,
 					 userptr.repin_link) {
@@ -235,7 +250,7 @@ int xe_vm_userptr_pin(struct xe_vm *vm)
 				       &vm->userptr.invalidated);
 		}
 		spin_unlock(&vm->userptr.invalidated_lock);
-		up_write(&vm->userptr.notifier_lock);
+		up_write(&vm->svm.gpusvm.notifier_lock);
 	}
 	return err;
 }
@@ -265,7 +280,6 @@ int xe_userptr_setup(struct xe_userptr_vma *uvma, unsigned long start,
 
 	INIT_LIST_HEAD(&userptr->invalidate_link);
 	INIT_LIST_HEAD(&userptr->repin_link);
-	mutex_init(&userptr->unmap_mutex);
 
 	err = mmu_interval_notifier_insert(&userptr->notifier, current->mm,
 					   start, range,
@@ -273,17 +287,18 @@ int xe_userptr_setup(struct xe_userptr_vma *uvma, unsigned long start,
 	if (err)
 		return err;
 
-	userptr->notifier_seq = LONG_MAX;
+	userptr->pages.notifier_seq = LONG_MAX;
 
 	return 0;
 }
 
 void xe_userptr_remove(struct xe_userptr_vma *uvma)
 {
+	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
 	struct xe_userptr *userptr = &uvma->userptr;
 
-	if (userptr->sg)
-		xe_hmm_userptr_free_sg(uvma);
+	drm_gpusvm_free_pages(&vm->svm.gpusvm, &uvma->userptr.pages,
+			      xe_vma_size(&uvma->vma) >> PAGE_SHIFT);
 
 	/*
 	 * Since userptr pages are not pinned, we can't remove
@@ -291,7 +306,6 @@ void xe_userptr_remove(struct xe_userptr_vma *uvma)
 	 * them anymore
 	 */
 	mmu_interval_notifier_remove(&userptr->notifier);
-	mutex_destroy(&userptr->unmap_mutex);
 }
 
 void xe_userptr_destroy(struct xe_userptr_vma *uvma)
diff --git a/drivers/gpu/drm/xe/xe_userptr.h b/drivers/gpu/drm/xe/xe_userptr.h
index dc49348ac42d..ef801234991e 100644
--- a/drivers/gpu/drm/xe/xe_userptr.h
+++ b/drivers/gpu/drm/xe/xe_userptr.h
@@ -12,6 +12,8 @@
 #include <linux/scatterlist.h>
 #include <linux/spinlock.h>
 
+#include <drm/drm_gpusvm.h>
+
 struct xe_vm;
 struct xe_vma;
 struct xe_userptr_vma;
@@ -23,11 +25,6 @@ struct xe_userptr_vm {
 	 * and needs repinning. Protected by @lock.
 	 */
 	struct list_head repin_list;
-	/**
-	 * @notifier_lock: protects notifier in write mode and
-	 * submission in read mode.o
-	 */
-	struct rw_semaphore notifier_lock;
 	/**
 	 * @userptr.invalidated_lock: Protects the
 	 * @userptr.invalidated list.
@@ -39,7 +36,7 @@ struct xe_userptr_vm {
 	 * up for revalidation. Protected from access with the
 	 * @invalidated_lock. Removing items from the list
 	 * additionally requires @lock in write mode, and adding
-	 * items to the list requires either the @userptr.notifier_lock in
+	 * items to the list requires either the @svm.gpusvm.notifier_lock in
 	 * write mode, OR @lock in write mode.
 	 */
 	struct list_head invalidated;
@@ -51,31 +48,27 @@ struct xe_userptr {
 	struct list_head invalidate_link;
 	/** @userptr: link into VM repin list if userptr. */
 	struct list_head repin_link;
+	/**
+	 * @pages: gpusvm pages for this user pointer.
+	 */
+	struct drm_gpusvm_pages pages;
 	/**
 	 * @notifier: MMU notifier for user pointer (invalidation call back)
 	 */
 	struct mmu_interval_notifier notifier;
-	/** @sgt: storage for a scatter gather table */
-	struct sg_table sgt;
-	/** @sg: allocated scatter gather table */
-	struct sg_table *sg;
-	/** @notifier_seq: notifier sequence number */
-	unsigned long notifier_seq;
-	/** @unmap_mutex: Mutex protecting dma-unmapping */
-	struct mutex unmap_mutex;
+
 	/**
 	 * @initial_bind: user pointer has been bound at least once.
-	 * write: vm->userptr.notifier_lock in read mode and vm->resv held.
-	 * read: vm->userptr.notifier_lock in write mode or vm->resv held.
+	 * write: vm->svm.gpusvm.notifier_lock in read mode and vm->resv held.
+	 * read: vm->svm.gpusvm.notifier_lock in write mode or vm->resv held.
 	 */
 	bool initial_bind;
-	/** @mapped: Whether the @sgt sg-table is dma-mapped. Protected by @unmap_mutex. */
-	bool mapped;
 #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
 	u32 divisor;
 #endif
 };
 
+#if IS_ENABLED(CONFIG_DRM_GPUSVM)
 void xe_userptr_remove(struct xe_userptr_vma *uvma);
 int xe_userptr_setup(struct xe_userptr_vma *uvma, unsigned long start,
 		     unsigned long range);
@@ -86,6 +79,23 @@ int __xe_vm_userptr_needs_repin(struct xe_vm *vm);
 int xe_vm_userptr_check_repin(struct xe_vm *vm);
 int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma);
 int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
+#else
+static inline void xe_userptr_remove(struct xe_userptr_vma *uvma) {}
+
+static inline int xe_userptr_setup(struct xe_userptr_vma *uvma,
+				   unsigned long start, unsigned long range)
+{
+	return -ENODEV;
+}
+
+static inline void xe_userptr_destroy(struct xe_userptr_vma *uvma) {}
+
+static inline int xe_vm_userptr_pin(struct xe_vm *vm) { return 0; }
+static inline int __xe_vm_userptr_needs_repin(struct xe_vm *vm) { return 0; }
+static inline int xe_vm_userptr_check_repin(struct xe_vm *vm) { return 0; }
+static inline int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma) { return -ENODEV; }
+static inline int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma) { return -ENODEV; };
+#endif
 
 #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
 void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 57afe9819842..49a0cc0ab6c7 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -40,9 +40,7 @@
 #include "xe_tile.h"
 #include "xe_tlb_inval.h"
 #include "xe_trace_bo.h"
-#include "xe_userptr.h"
 #include "xe_wa.h"
-#include "xe_hmm.h"
 
 static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
 {
@@ -220,7 +218,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	++vm->preempt.num_exec_queues;
 	q->lr.pfence = pfence;
 
-	down_read(&vm->userptr.notifier_lock);
+	xe_svm_notifier_lock(vm);
 
 	drm_gpuvm_resv_add_fence(&vm->gpuvm, exec, pfence,
 				 DMA_RESV_USAGE_BOOKKEEP, DMA_RESV_USAGE_BOOKKEEP);
@@ -234,7 +232,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
 	if (wait)
 		dma_fence_enable_sw_signaling(pfence);
 
-	up_read(&vm->userptr.notifier_lock);
+	xe_svm_notifier_unlock(vm);
 
 out_fini:
 	drm_exec_fini(exec);
@@ -498,9 +496,9 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	(!(__tries)++ || __xe_vm_userptr_needs_repin(__vm)) : \
 	__xe_vm_userptr_needs_repin(__vm))
 
-	down_read(&vm->userptr.notifier_lock);
+	xe_svm_notifier_lock(vm);
 	if (retry_required(tries, vm)) {
-		up_read(&vm->userptr.notifier_lock);
+		xe_svm_notifier_unlock(vm);
 		err = -EAGAIN;
 		goto out_unlock;
 	}
@@ -514,7 +512,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 	/* Point of no return. */
 	arm_preempt_fences(vm, &preempt_fences);
 	resume_and_reinstall_preempt_fences(vm, &exec);
-	up_read(&vm->userptr.notifier_lock);
+	xe_svm_notifier_unlock(vm);
 
 out_unlock:
 	drm_exec_fini(&exec);
@@ -1449,7 +1447,6 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 
 	INIT_LIST_HEAD(&vm->userptr.repin_list);
 	INIT_LIST_HEAD(&vm->userptr.invalidated);
-	init_rwsem(&vm->userptr.notifier_lock);
 	spin_lock_init(&vm->userptr.invalidated_lock);
 
 	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
@@ -1475,11 +1472,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 		xe_pm_runtime_get_noresume(xe);
 	}
 
-	if (flags & XE_VM_FLAG_FAULT_MODE) {
-		err = xe_svm_init(vm);
-		if (err)
-			goto err_no_resv;
-	}
+	err = xe_svm_init(vm);
+	if (err)
+		goto err_no_resv;
 
 	vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
 	if (!vm_resv_obj) {
@@ -1680,9 +1675,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 		vma = gpuva_to_vma(gpuva);
 
 		if (xe_vma_has_no_bo(vma)) {
-			down_read(&vm->userptr.notifier_lock);
+			xe_svm_notifier_lock(vm);
 			vma->gpuva.flags |= XE_VMA_DESTROYED;
-			up_read(&vm->userptr.notifier_lock);
+			xe_svm_notifier_unlock(vm);
 		}
 
 		xe_vm_remove_vma(vm, vma);
@@ -1726,8 +1721,7 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 		xe_vma_destroy_unlocked(vma);
 	}
 
-	if (xe_vm_in_fault_mode(vm))
-		xe_svm_fini(vm);
+	xe_svm_fini(vm);
 
 	up_write(&vm->lock);
 
@@ -2068,9 +2062,9 @@ static const u32 region_to_mem_type[] = {
 static void prep_vma_destroy(struct xe_vm *vm, struct xe_vma *vma,
 			     bool post_commit)
 {
-	down_read(&vm->userptr.notifier_lock);
+	xe_svm_notifier_lock(vm);
 	vma->gpuva.flags |= XE_VMA_DESTROYED;
-	up_read(&vm->userptr.notifier_lock);
+	xe_svm_notifier_unlock(vm);
 	if (post_commit)
 		xe_vm_remove_vma(vm, vma);
 }
@@ -2713,9 +2707,9 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 		struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
 
 		if (vma) {
-			down_read(&vm->userptr.notifier_lock);
+			xe_svm_notifier_lock(vm);
 			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
-			up_read(&vm->userptr.notifier_lock);
+			xe_svm_notifier_unlock(vm);
 			if (post_commit)
 				xe_vm_insert_vma(vm, vma);
 		}
@@ -2734,9 +2728,9 @@ static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op *op,
 			xe_vma_destroy_unlocked(op->remap.next);
 		}
 		if (vma) {
-			down_read(&vm->userptr.notifier_lock);
+			xe_svm_notifier_lock(vm);
 			vma->gpuva.flags &= ~XE_VMA_DESTROYED;
-			up_read(&vm->userptr.notifier_lock);
+			xe_svm_notifier_unlock(vm);
 			if (post_commit)
 				xe_vm_insert_vma(vm, vma);
 		}
@@ -3311,6 +3305,8 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe, struct xe_vm *vm,
 				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
 		    XE_IOCTL_DBG(xe, coh_mode == XE_COH_NONE &&
 				 op == DRM_XE_VM_BIND_OP_MAP_USERPTR) ||
+		    XE_IOCTL_DBG(xe, op == DRM_XE_VM_BIND_OP_MAP_USERPTR &&
+				 !IS_ENABLED(CONFIG_DRM_GPUSVM)) ||
 		    XE_IOCTL_DBG(xe, obj &&
 				 op == DRM_XE_VM_BIND_OP_PREFETCH) ||
 		    XE_IOCTL_DBG(xe, prefetch_region &&
@@ -3856,13 +3852,13 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
 	 */
 	if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
 		if (xe_vma_is_userptr(vma)) {
-			lockdep_assert(lockdep_is_held_type(&vm->userptr.notifier_lock, 0) ||
-				       (lockdep_is_held_type(&vm->userptr.notifier_lock, 1) &&
+			lockdep_assert(lockdep_is_held_type(&vm->svm.gpusvm.notifier_lock, 0) ||
+				       (lockdep_is_held_type(&vm->svm.gpusvm.notifier_lock, 1) &&
 					lockdep_is_held(&xe_vm_resv(vm)->lock.base)));
 
 			WARN_ON_ONCE(!mmu_interval_check_retry
 				     (&to_userptr_vma(vma)->userptr.notifier,
-				      to_userptr_vma(vma)->userptr.notifier_seq));
+				      to_userptr_vma(vma)->userptr.pages.notifier_seq));
 			WARN_ON_ONCE(!dma_resv_test_signaled(xe_vm_resv(vm),
 							     DMA_RESV_USAGE_BOOKKEEP));
 
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index 09c5783ee523..9862f2498f18 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -18,9 +18,8 @@ struct xe_vmas_in_madvise_range {
 	u64 range;
 	struct xe_vma **vmas;
 	int num_vmas;
-	bool has_svm_vmas;
 	bool has_bo_vmas;
-	bool has_userptr_vmas;
+	bool has_svm_userptr_vmas;
 };
 
 static int get_vmas(struct xe_vm *vm, struct xe_vmas_in_madvise_range *madvise_range)
@@ -46,10 +45,8 @@ static int get_vmas(struct xe_vm *vm, struct xe_vmas_in_madvise_range *madvise_r
 
 		if (xe_vma_bo(vma))
 			madvise_range->has_bo_vmas = true;
-		else if (xe_vma_is_cpu_addr_mirror(vma))
-			madvise_range->has_svm_vmas = true;
-		else if (xe_vma_is_userptr(vma))
-			madvise_range->has_userptr_vmas = true;
+		else if (xe_vma_is_cpu_addr_mirror(vma) || xe_vma_is_userptr(vma))
+			madvise_range->has_svm_userptr_vmas = true;
 
 		if (madvise_range->num_vmas == max_vmas) {
 			max_vmas <<= 1;
@@ -409,16 +406,10 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 		}
 	}
 
-	if (madvise_range.has_userptr_vmas) {
-		err = down_read_interruptible(&vm->userptr.notifier_lock);
-		if (err)
-			goto err_fini;
-	}
-
-	if (madvise_range.has_svm_vmas) {
+	if (madvise_range.has_svm_userptr_vmas) {
 		err = down_read_interruptible(&vm->svm.gpusvm.notifier_lock);
 		if (err)
-			goto unlock_userptr;
+			goto err_fini;
 	}
 
 	attr_type = array_index_nospec(args->type, ARRAY_SIZE(madvise_funcs));
@@ -426,12 +417,9 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 
 	err = xe_vm_invalidate_madvise_range(vm, args->start, args->start + args->range);
 
-	if (madvise_range.has_svm_vmas)
+	if (madvise_range.has_svm_userptr_vmas)
 		xe_svm_notifier_unlock(vm);
 
-unlock_userptr:
-	if (madvise_range.has_userptr_vmas)
-		up_read(&vm->userptr.notifier_lock);
 err_fini:
 	if (madvise_range.has_bo_vmas)
 		drm_exec_fini(&exec);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index aee050c295db..f6dd964be42f 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -110,10 +110,10 @@ struct xe_vma {
 
 	/**
 	 * @tile_invalidated: Tile mask of binding are invalidated for this VMA.
-	 * protected by BO's resv and for userptrs, vm->userptr.notifier_lock in
-	 * write mode for writing or vm->userptr.notifier_lock in read mode and
+	 * protected by BO's resv and for userptrs, vm->svm.gpusvm.notifier_lock in
+	 * write mode for writing or vm->svm.gpusvm.notifier_lock in read mode and
 	 * the vm->resv. For stable reading, BO's resv or userptr
-	 * vm->userptr.notifier_lock in read mode is required. Can be
+	 * vm->svm.gpusvm.notifier_lock in read mode is required. Can be
 	 * opportunistically read with READ_ONCE outside of locks.
 	 */
 	u8 tile_invalidated;
@@ -124,7 +124,7 @@ struct xe_vma {
 	/**
 	 * @tile_present: Tile mask of binding are present for this VMA.
 	 * protected by vm->lock, vm->resv and for userptrs,
-	 * vm->userptr.notifier_lock for writing. Needs either for reading,
+	 * vm->svm.gpusvm.notifier_lock for writing. Needs either for reading,
 	 * but if reading is done under the vm->lock only, it needs to be held
 	 * in write mode.
 	 */
-- 
2.51.0

