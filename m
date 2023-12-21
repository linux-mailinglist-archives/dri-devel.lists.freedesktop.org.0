Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD0781ADFB
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 05:28:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D78F10E66D;
	Thu, 21 Dec 2023 04:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AA210E638;
 Thu, 21 Dec 2023 04:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703132901; x=1734668901;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=61zBSdrJ80mEY4m4E27nOmJa1Z6npZKoFz/hC/ENZ5c=;
 b=MWhU94Qf+Zbek55pH0vKpxEPdTQ89FsuwB8hwKES4q7qDNcd0d4PlRsd
 VZRWLHFRBMMliFsf59mTTwRGpqORW8e9+ViHnc5Z8580lN7LYb28fYrnt
 e4vzwPbTtccxya5lHixi7mjg6LjCxjWbmwACoPpUsPuX58kz93x7ijiFg
 fHDgbYjpbM+IoB90keb9ARlPucLc5j1DAW5B9KyChathi3wA5miaGaRTg
 kJD/6Ztl40INhlKHBZI+PlfE4/G2kth0bCEpJBwVRVx6DlNcBEu+gzFFz
 Wz/h7AnYbUHkg2p79Jnrac6045+tMf5bJQ8iw0O78mzmj6JM8PJYEKIw2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="427069761"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="427069761"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="805481343"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="805481343"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:20 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 02/22] drm/xe/svm: Add svm key data structures
Date: Wed, 20 Dec 2023 23:37:52 -0500
Message-Id: <20231221043812.3783313-3-oak.zeng@intel.com>
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

Add xe_svm and xe_svm_range data structure. Each xe_svm
represents a svm address space and it maps 1:1 to the
process's mm_struct. It also maps 1:1 to the gpu xe_vm
struct.

Each xe_svm_range represent a virtual address range inside
a svm address space. It is similar to CPU's  vm_area_struct,
or to the GPU xe_vma struct. It contains data to synchronize
this address range to CPU's virtual address range, using mmu
notifier mechanism. It can also hold this range's memory
attributes set by user, such as preferred memory location etc -
this is TBD.

Each svm address space is made of many svm virtual address range.
All address ranges are maintained in xe_svm's interval tree.

Also add a xe_svm pointer to xe_vm data structure. So we have
a 1:1 mapping b/t xe_svm and xe_vm.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.h      | 59 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
 2 files changed, 61 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_svm.h

diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
new file mode 100644
index 000000000000..ba301a331f59
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __XE_SVM_H
+#define __XE_SVM_H
+#include <linux/list.h>
+#include <linux/mutex.h>
+#include <linux/mmu_notifier.h>
+#include <linux/workqueue.h>
+#include <linux/rbtree_types.h>
+#include <linux/interval_tree.h>
+
+struct xe_vm;
+struct mm_struct;
+
+/**
+ * struct xe_svm - data structure to represent a shared
+ * virtual address space from device side. xe_svm, xe_vm
+ * and mm_struct has a 1:1:1 relationship.
+ */
+struct xe_svm {
+	/** @vm: The xe_vm address space corresponding to this xe_svm */
+	struct xe_vm *vm;
+	/** @mm: The mm_struct corresponding to this xe_svm */
+	struct mm_struct *mm;
+	/**
+	 * @mutex: A lock used by svm subsystem. It protects:
+	 * 1. below range_tree
+	 * 2. GPU page table update. Serialize all SVM GPU page table updates
+	 */
+	struct mutex mutex;
+	/**
+	 * @range_tree: Interval tree of all svm ranges in this svm
+	 */
+	struct rb_root_cached range_tree;
+};
+
+/**
+ * struct xe_svm_range - Represents a shared virtual address range.
+ */
+struct xe_svm_range {
+	/** @notifier: The mmu interval notifer used to keep track of CPU
+	 * side address range change. Driver will get a callback with this
+	 * notifier if anything changed from CPU side, such as range is
+	 * unmapped from CPU
+	 */
+	struct mmu_interval_notifier notifier;
+	/** @start: start address of this range, inclusive */
+	u64 start;
+	/** @end: end address of this range, exclusive */
+	u64 end;
+	/** @unregister_notifier_work: A worker used to unregister this notifier */
+	struct work_struct unregister_notifier_work;
+	/** @inode: used to link this range to svm's range_tree */
+	struct interval_tree_node inode;
+};
+#endif
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 63e8a50b88e9..037fb7168c63 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -17,6 +17,7 @@
 #include "xe_pt_types.h"
 #include "xe_range_fence.h"
 
+struct xe_svm;
 struct xe_bo;
 struct xe_sync_entry;
 struct xe_vm;
@@ -279,6 +280,7 @@ struct xe_vm {
 	bool batch_invalidate_tlb;
 	/** @xef: XE file handle for tracking this VM's drm client */
 	struct xe_file *xef;
+	struct xe_svm *svm;
 };
 
 /** struct xe_vma_op_map - VMA map operation */
-- 
2.26.3

