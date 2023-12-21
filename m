Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D0881ADF7
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 05:28:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0AB410E665;
	Thu, 21 Dec 2023 04:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BF110E646;
 Thu, 21 Dec 2023 04:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703132902; x=1734668902;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SnAGZEWVouqbngtFRpLMRdoRcj8w7Sa3qFCN3m4IV0s=;
 b=XV1kV2Wv1eaBs9DcLImF5q1n++Sj87KFO89YwaFV/tGdcdUL1kWL2nUu
 JHihqkTi4q1WkL1ZhS+MNxUJECY2DTf684XCwdSss5PVTcGDUjwLRM5tk
 AwCqkHTu099XlOW8Pb7pOBasVznp76niNwsJHVeG6eFrDIv8DYYjRt41d
 jDu4JNrhIh50HCJ76XgVEq8yI7avZpKN0qx3I9rGqRC8yav2LMDaaE91H
 SHUPz+io3YNlgUrPrYQIw7R4tTaFVQYTRxXoVEfrTtswN1yqPhvlzUVjk
 AXr4jj482C7huIaB5OwM+IQfHFRoPTL0eNG8n0QvtRlGqT4GBcYXCVvoC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="427069762"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="427069762"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="805481346"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="805481346"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:20 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 03/22] drm/xe/svm: create xe svm during vm creation
Date: Wed, 20 Dec 2023 23:37:53 -0500
Message-Id: <20231221043812.3783313-4-oak.zeng@intel.com>
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

Create the xe_svm struct during xe_vm creation.
Add xe_svm to a global hash table so later on
we can retrieve xe_svm using mm_struct (the key).

Destroy svm process during xe_vm close.

Also add a helper function to retrieve svm struct
from mm struct

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 63 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h | 11 +++++++
 drivers/gpu/drm/xe/xe_vm.c  |  5 +++
 3 files changed, 79 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_svm.c

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
new file mode 100644
index 000000000000..559188471949
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <linux/mutex.h>
+#include <linux/mm_types.h>
+#include "xe_svm.h"
+
+DEFINE_HASHTABLE(xe_svm_table, XE_MAX_SVM_PROCESS);
+
+/**
+ * xe_destroy_svm() - destroy a svm process
+ *
+ * @svm: the xe_svm to destroy
+ */
+void xe_destroy_svm(struct xe_svm *svm)
+{
+	hash_del_rcu(&svm->hnode);
+	mutex_destroy(&svm->mutex);
+	kfree(svm);
+}
+
+/**
+ * xe_create_svm() - create a svm process
+ *
+ * @vm: the xe_vm that we create svm process for
+ *
+ * Return the created xe svm struct
+ */
+struct xe_svm *xe_create_svm(struct xe_vm *vm)
+{
+	struct mm_struct *mm = current->mm;
+	struct xe_svm *svm;
+
+	svm = kzalloc(sizeof(struct xe_svm), GFP_KERNEL);
+	svm->mm = mm;
+	svm->vm	= vm;
+	mutex_init(&svm->mutex);
+	/** Add svm to global xe_svm_table hash table
+	 *  use mm as key so later we can retrieve svm using mm
+	 */
+	hash_add_rcu(xe_svm_table, &svm->hnode, (uintptr_t)mm);
+	return svm;
+}
+
+/**
+ * xe_lookup_svm_by_mm() - retrieve xe_svm from mm struct
+ *
+ * @mm: the mm struct of the svm to retrieve
+ *
+ * Return the xe_svm struct pointer, or NULL if fail
+ */
+struct xe_svm *xe_lookup_svm_by_mm(struct mm_struct *mm)
+{
+	struct xe_svm *svm;
+
+	hash_for_each_possible_rcu(xe_svm_table, svm, hnode, (uintptr_t)mm)
+		if (svm->mm == mm)
+			return svm;
+
+	return NULL;
+}
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index ba301a331f59..cd3cf92f3784 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -11,10 +11,15 @@
 #include <linux/workqueue.h>
 #include <linux/rbtree_types.h>
 #include <linux/interval_tree.h>
+#include <linux/hashtable.h>
+#include <linux/types.h>
 
 struct xe_vm;
 struct mm_struct;
 
+#define XE_MAX_SVM_PROCESS 5 /* Maximumly support 32 SVM process*/
+extern DECLARE_HASHTABLE(xe_svm_table, XE_MAX_SVM_PROCESS);
+
 /**
  * struct xe_svm - data structure to represent a shared
  * virtual address space from device side. xe_svm, xe_vm
@@ -35,6 +40,8 @@ struct xe_svm {
 	 * @range_tree: Interval tree of all svm ranges in this svm
 	 */
 	struct rb_root_cached range_tree;
+	/** @hnode: used to add this svm to a global xe_svm_hash table*/
+	struct hlist_node hnode;
 };
 
 /**
@@ -56,4 +63,8 @@ struct xe_svm_range {
 	/** @inode: used to link this range to svm's range_tree */
 	struct interval_tree_node inode;
 };
+
+void xe_destroy_svm(struct xe_svm *svm);
+struct xe_svm *xe_create_svm(struct xe_vm *vm);
+struct xe_svm *xe_lookup_svm_by_mm(struct mm_struct *mm);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 1ca917b8315c..3c301a5c7325 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -36,6 +36,7 @@
 #include "xe_trace.h"
 #include "generated/xe_wa_oob.h"
 #include "xe_wa.h"
+#include "xe_svm.h"
 
 #define TEST_VM_ASYNC_OPS_ERROR
 
@@ -1375,6 +1376,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 		xe->usm.num_vm_in_non_fault_mode++;
 	mutex_unlock(&xe->usm.lock);
 
+	vm->svm = xe_create_svm(vm);
 	trace_xe_vm_create(vm);
 
 	return vm;
@@ -1495,6 +1497,9 @@ void xe_vm_close_and_put(struct xe_vm *vm)
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
 
+	if (vm->svm)
+		xe_destroy_svm(vm->svm);
+
 	xe_vm_put(vm);
 }
 
-- 
2.26.3

