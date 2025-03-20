Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDCBA6AC12
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 18:32:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DB3E10E676;
	Thu, 20 Mar 2025 17:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iJ04HUcg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A9710E681;
 Thu, 20 Mar 2025 17:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742491944; x=1774027944;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JkOss8FQVZXeS/kuK8ft95fgIs2KRspfBHr2NglTK1c=;
 b=iJ04HUcgu2+tgtbKOT83iOH3BvwFzLVefyHxthRzkgA6dfLiX0GaUZ7Z
 08eh/HtbbdntQF+QXTqCSdRzE2ALRaoZdPLXgz8k6jXtPWcDyjT2S7iJY
 Py04QvpPUSJhzyIeM/wdWGgQ0cw2/VB/ppB7A+xQMmSGwaVetBp7a7SEl
 DMPlCq1FrQBWODQ7+XFWJRm1ONCfE5aGrSkn2bukzENFsrIgPmCMcc+w7
 l4e658/fZL3SswAlwEGAfALfPQJkwtrk8zxaDOGzVWhyWVrB3nRj5WO2e
 X+OlFXDxSqpFMgVThgOUT+l6qOGTNBOvq0Xr/QnOh4U1bwUjnwTzp2Dua w==;
X-CSE-ConnectionGUID: mY5+yRFLToe+X6WIR3t80A==
X-CSE-MsgGUID: K1BrsDrnRUusVunXLYRI2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="69095606"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="69095606"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 10:32:24 -0700
X-CSE-ConnectionGUID: P8/Y4X2oR2OPx9MqGBu+eQ==
X-CSE-MsgGUID: Lp0T+vvDQgKMyOcOEfw0ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="123168455"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.226])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 10:32:22 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH 6/7] drm/gpusvm: support basic_range
Date: Thu, 20 Mar 2025 17:30:03 +0000
Message-ID: <20250320172956.168358-15-matthew.auld@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320172956.168358-9-matthew.auld@intel.com>
References: <20250320172956.168358-9-matthew.auld@intel.com>
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

Idea is to use this for userptr, where we mostly just need
get/unmap/free pages, plus some kind of common notifier lock at the svm
level (provided by gpusvm). The range itself also maps to a single
notifier, covering the entire range (provided by the user).

TODO: needs proper kernel-doc, assuming this change makes sense.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 138 +++++++++++++++++++++++++++++------
 include/drm/drm_gpusvm.h     |  23 ++++++
 2 files changed, 137 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 2beca5a6dc0a..ca571610214c 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -521,6 +521,41 @@ static const struct mmu_interval_notifier_ops drm_gpusvm_notifier_ops = {
 	.invalidate = drm_gpusvm_notifier_invalidate,
 };
 
+static void __drm_gpusvm_init(struct drm_gpusvm *gpusvm, const char *name,
+			      struct drm_device *drm, struct mm_struct *mm,
+			      void *device_private_page_owner,
+			      unsigned long mm_start, unsigned long mm_range,
+			      unsigned long notifier_size,
+			      const struct drm_gpusvm_ops *ops,
+			      const unsigned long *chunk_sizes, int num_chunks)
+{
+	gpusvm->name = name;
+	gpusvm->drm = drm;
+	gpusvm->mm = mm;
+	gpusvm->device_private_page_owner = device_private_page_owner;
+	gpusvm->mm_start = mm_start;
+	gpusvm->mm_range = mm_range;
+	gpusvm->notifier_size = notifier_size;
+	gpusvm->ops = ops;
+	gpusvm->chunk_sizes = chunk_sizes;
+	gpusvm->num_chunks = num_chunks;
+
+	if (mm)
+		mmgrab(mm);
+	gpusvm->root = RB_ROOT_CACHED;
+	INIT_LIST_HEAD(&gpusvm->notifier_list);
+
+	init_rwsem(&gpusvm->notifier_lock);
+
+	fs_reclaim_acquire(GFP_KERNEL);
+	might_lock(&gpusvm->notifier_lock);
+	fs_reclaim_release(GFP_KERNEL);
+
+#ifdef CONFIG_LOCKDEP
+	gpusvm->lock_dep_map = NULL;
+#endif
+}
+
 /**
  * drm_gpusvm_init() - Initialize the GPU SVM.
  * @gpusvm: Pointer to the GPU SVM structure.
@@ -552,35 +587,32 @@ int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
 	if (!ops->invalidate || !num_chunks)
 		return -EINVAL;
 
-	gpusvm->name = name;
-	gpusvm->drm = drm;
-	gpusvm->mm = mm;
-	gpusvm->device_private_page_owner = device_private_page_owner;
-	gpusvm->mm_start = mm_start;
-	gpusvm->mm_range = mm_range;
-	gpusvm->notifier_size = notifier_size;
-	gpusvm->ops = ops;
-	gpusvm->chunk_sizes = chunk_sizes;
-	gpusvm->num_chunks = num_chunks;
-
-	mmgrab(mm);
-	gpusvm->root = RB_ROOT_CACHED;
-	INIT_LIST_HEAD(&gpusvm->notifier_list);
-
-	init_rwsem(&gpusvm->notifier_lock);
-
-	fs_reclaim_acquire(GFP_KERNEL);
-	might_lock(&gpusvm->notifier_lock);
-	fs_reclaim_release(GFP_KERNEL);
-
-#ifdef CONFIG_LOCKDEP
-	gpusvm->lock_dep_map = NULL;
-#endif
+	__drm_gpusvm_init(gpusvm, name, drm, mm, device_private_page_owner,
+			  mm_start, mm_range, notifier_size, ops, chunk_sizes,
+			  num_chunks);
 
 	return 0;
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_init);
 
+static bool drm_gpusvm_is_basic(struct drm_gpusvm *svm)
+{
+	return !svm->mm;
+}
+
+void drm_gpusvm_basic_init(struct drm_gpusvm *gpusvm, const char *name,
+			   struct drm_device *drm)
+{
+	__drm_gpusvm_init(gpusvm, name, drm, NULL, NULL, 0, 0, 0, NULL, NULL,
+			  0);
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_basic_init);
+
+void drm_gpusvm_basic_fini(struct drm_gpusvm *gpusvm)
+{
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_basic_fini);
+
 /**
  * drm_gpusvm_notifier_find() - Find GPU SVM notifier
  * @gpusvm: Pointer to the GPU SVM structure
@@ -1001,6 +1033,27 @@ static void drm_gpusvm_driver_lock_held(struct drm_gpusvm *gpusvm)
 }
 #endif
 
+void drm_gpusvm_basic_range_init(struct drm_gpusvm *svm,
+				 struct drm_gpusvm_basic_range *range,
+				 struct mmu_interval_notifier *notifier,
+				 unsigned long *notifier_seq)
+{
+	WARN_ON(!drm_gpusvm_is_basic(svm));
+
+	range->gpusvm = svm;
+	range->notifier = notifier;
+	range->notifier_seq = notifier_seq;
+	*notifier_seq = LONG_MAX;
+	memset(&range->pages, 0, sizeof(range->pages));
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_basic_range_init);
+
+void drm_gpusvm_basic_range_fini(struct drm_gpusvm_basic_range *range)
+{
+	WARN_ON(range->pages.flags.has_dma_mapping);
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_basic_range_fini);
+
 /**
  * drm_gpusvm_range_find_or_insert() - Find or insert GPU SVM range
  * @gpusvm: Pointer to the GPU SVM structure
@@ -1176,6 +1229,19 @@ static void drm_gpusvm_free_pages(struct drm_gpusvm *gpusvm,
 	}
 }
 
+void drm_gpusvm_basic_range_free_pages(struct drm_gpusvm_basic_range *range)
+{
+	unsigned long npages =
+		npages_in_range(range->notifier->interval_tree.start,
+				range->notifier->interval_tree.last + 1);
+
+	drm_gpusvm_notifier_lock(range->gpusvm);
+	__drm_gpusvm_unmap_pages(range->gpusvm, &range->pages, npages);
+	drm_gpusvm_free_pages(range->gpusvm, &range->pages);
+	drm_gpusvm_notifier_unlock(range->gpusvm);
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_basic_range_free_pages);
+
 /**
  * drm_gpusvm_range_remove() - Remove GPU SVM range
  * @gpusvm: Pointer to the GPU SVM structure
@@ -1545,6 +1611,20 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_get_pages);
 
+int drm_gpusvm_basic_range_get_pages(struct drm_gpusvm_basic_range *range,
+				     const struct drm_gpusvm_ctx *ctx)
+{
+	drm_gpusvm_driver_lock_held(range->gpusvm);
+
+	return drm_gpusvm_get_pages(range->gpusvm, &range->pages,
+				    range->notifier->mm, range->notifier,
+				    range->notifier_seq,
+				    range->notifier->interval_tree.start,
+				    range->notifier->interval_tree.last + 1,
+				    ctx);
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_basic_range_get_pages);
+
 static void drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
 				   unsigned long mm_start, unsigned long mm_end,
 				   struct drm_gpusvm_pages *svm_pages,
@@ -1585,6 +1665,16 @@ void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_unmap_pages);
 
+void drm_gpusvm_basic_range_unmap_pages(struct drm_gpusvm_basic_range *range,
+					const struct drm_gpusvm_ctx *ctx)
+{
+	drm_gpusvm_unmap_pages(range->gpusvm,
+			       range->notifier->interval_tree.start,
+			       range->notifier->interval_tree.last + 1,
+			       &range->pages, ctx);
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_basic_range_unmap_pages);
+
 /**
  * drm_gpusvm_migration_unlock_put_page() - Put a migration page
  * @page: Pointer to the page to put
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index c15c733ef0ad..82c4e58fa84c 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -305,6 +305,29 @@ struct drm_gpusvm_ctx {
 	unsigned int devmem_possible :1;
 };
 
+struct drm_gpusvm_basic_range {
+	struct drm_gpusvm *gpusvm;
+	struct drm_gpusvm_pages pages;
+	struct mmu_interval_notifier *notifier;
+	unsigned long *notifier_seq;
+};
+
+void drm_gpusvm_basic_init(struct drm_gpusvm *gpusvm, const char *name,
+			   struct drm_device *drm);
+void drm_gpusvm_basic_fini(struct drm_gpusvm *gpusvm);
+
+void drm_gpusvm_basic_range_init(struct drm_gpusvm *svm,
+				 struct drm_gpusvm_basic_range *range,
+				 struct mmu_interval_notifier *notifier,
+				 unsigned long *notifier_seq);
+void drm_gpusvm_basic_range_fini(struct drm_gpusvm_basic_range *range);
+
+int drm_gpusvm_basic_range_get_pages(struct drm_gpusvm_basic_range *range,
+				     const struct drm_gpusvm_ctx *ctx);
+void drm_gpusvm_basic_range_unmap_pages(struct drm_gpusvm_basic_range *range,
+					const struct drm_gpusvm_ctx *ctx);
+void drm_gpusvm_basic_range_free_pages(struct drm_gpusvm_basic_range *range);
+
 int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
 		    const char *name, struct drm_device *drm,
 		    struct mm_struct *mm, void *device_private_page_owner,
-- 
2.48.1

