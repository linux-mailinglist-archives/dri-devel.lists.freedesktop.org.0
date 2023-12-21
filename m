Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC7A81AE03
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 05:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B31E10E676;
	Thu, 21 Dec 2023 04:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39BF010E65B;
 Thu, 21 Dec 2023 04:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703132903; x=1734668903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GJo+44jDv+g6nOzMQZgGJ5rlhefDr6WjxKA4AakuTqs=;
 b=JIkzV1YEU+Z2+PTVJ2FAbhayj78NMf8kD6tWrZsXOOEjincd+D88TUop
 DCfnSBaRy9CbvgcV2fYbFA/+zwDRz49hxhMbSOhxBiLIhqAGBeLeHmUQh
 BNV5reu2siVgT74rrO8zBVyVXID2Iy5UXRjJLM01j9/ZyCzhmSb4q7Js2
 AQBPR3FWGkNAw0TE1X4ibDEkedkSEjVMr/sRsuKpRk+y4e+LP3CiEkZuy
 qn1gXdXkAyPYkMzLb3tibCG+nT+uUTNFTWeVINPL/w7Y7jv7P18MUUaJY
 MinLDx6ivT7M4LpLIxiwqxDQG3OmdlzGsfHJnnGACx0q/wYHP+mFax9jj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="427069777"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="427069777"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="805481388"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="805481388"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:21 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 17/22] drm/xe/svm: clean up svm range during process exit
Date: Wed, 20 Dec 2023 23:38:07 -0500
Message-Id: <20231221043812.3783313-18-oak.zeng@intel.com>
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

Clean up svm range during process exit: Zap GPU page table of
the svm process on process exit; unregister all the mmu interval
notifiers which are registered before; free svm range and svm
data structure.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c       | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_svm.h       |  1 +
 drivers/gpu/drm/xe/xe_svm_range.c | 17 +++++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 6393251c0051..5772bfcf7da4 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -9,6 +9,8 @@
 #include <linux/hmm.h>
 #include <linux/scatterlist.h>
 #include "xe_pt.h"
+#include "xe_assert.h"
+#include "xe_vm_types.h"
 
 DEFINE_HASHTABLE(xe_svm_table, XE_MAX_SVM_PROCESS);
 
@@ -19,9 +21,31 @@ DEFINE_HASHTABLE(xe_svm_table, XE_MAX_SVM_PROCESS);
  */
 void xe_destroy_svm(struct xe_svm *svm)
 {
+#define MAX_SVM_RANGE (1024*1024)
+	struct xe_svm_range **range_array;
+	struct interval_tree_node *node;
+	struct xe_svm_range *range;
+	int i = 0;
+
+	range_array = kzalloc(sizeof(struct xe_svm_range *) * MAX_SVM_RANGE,
+							GFP_KERNEL);
+	node = interval_tree_iter_first(&svm->range_tree, 0, ~0ULL);
+	while (node) {
+		range = container_of(node, struct xe_svm_range, inode);
+		xe_svm_range_prepare_destroy(range);
+		node = interval_tree_iter_next(node, 0, ~0ULL);
+		xe_assert(svm->vm->xe, i < MAX_SVM_RANGE);
+		range_array[i++] = range;
+	}
+
+	/** Free range (thus range->inode) while traversing above is not safe */
+	for(; i >= 0; i--)
+		kfree(range_array[i]);
+
 	hash_del_rcu(&svm->hnode);
 	mutex_destroy(&svm->mutex);
 	kfree(svm);
+	kfree(range_array);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 0038f98c0cc7..5b3bd2c064f5 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -90,6 +90,7 @@ bool xe_svm_range_belongs_to_vma(struct mm_struct *mm,
 								struct vm_area_struct *vma);
 void xe_svm_range_unregister_mmu_notifier(struct xe_svm_range *range);
 int xe_svm_range_register_mmu_notifier(struct xe_svm_range *range);
+void xe_svm_range_prepare_destroy(struct xe_svm_range *range);
 
 int xe_svm_build_sg(struct hmm_range *range, struct sg_table *st);
 int xe_svm_devm_add(struct xe_tile *tile, struct xe_mem_region *mem);
diff --git a/drivers/gpu/drm/xe/xe_svm_range.c b/drivers/gpu/drm/xe/xe_svm_range.c
index 53dd3be7ab9f..dfb4660dc26f 100644
--- a/drivers/gpu/drm/xe/xe_svm_range.c
+++ b/drivers/gpu/drm/xe/xe_svm_range.c
@@ -165,3 +165,20 @@ int xe_svm_range_register_mmu_notifier(struct xe_svm_range *range)
 	range->mmu_notifier_registered = true;
 	return ret;
 }
+
+/**
+ * xe_svm_range_prepare_destroy() - prepare work to destroy a svm range
+ *
+ * @range: the svm range to destroy
+ *
+ * prepare for a svm range destroy: Zap this range from GPU, unregister mmu
+ * notifier.
+ */
+void xe_svm_range_prepare_destroy(struct xe_svm_range *range)
+{
+	struct xe_vm *vm = range->svm->vm;
+	unsigned long length = range->end - range->start;
+
+	xe_invalidate_svm_range(vm, range->start, length);
+	xe_svm_range_unregister_mmu_notifier(range);
+}
-- 
2.26.3

