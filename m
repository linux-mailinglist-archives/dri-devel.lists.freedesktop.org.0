Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E107A75031
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 19:11:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37F710EA8F;
	Fri, 28 Mar 2025 18:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E9qFXI0v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1521110EA8B;
 Fri, 28 Mar 2025 18:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743185467; x=1774721467;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wKqrvBT7/lOBanO8JRS2TVCeNbarfNc8woYvhjY0pAU=;
 b=E9qFXI0vXeXbubvCsQ+jjiaw9S+qjB7Qi8JWtBdiQqAiRXD/j+OQE8MM
 CvjXNvoILU3wXDQDOAm2rUEfYf7mn6HpW6KExoq6UReEJxsPY1ISqRYgC
 jOPbF4JsrTpUgrRRa8jBCAR/l70vD2g2YQ8I6XKWE64tl4gADD0h6Iec2
 KVs0IytZQaptOtE3GdH5L4QUV+AdSjaa31Huf6xwvj+o0sIN8Gr3wp93V
 RMgGxwQhlcKqEPIAsALxzkM8V++54qrq1THL6HZEkvps7iUr9idbAHNf7
 6vwUWQNuaM8O9a915U9ab/1pFOfkCxJZ3hl/EnrcfheJc9Vlp4IUSPKym A==;
X-CSE-ConnectionGUID: rCTG+XjXSk62/zcsGNVtVw==
X-CSE-MsgGUID: swrm63S8SiqToc+vlgjUiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55926142"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="55926142"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 11:11:06 -0700
X-CSE-ConnectionGUID: QiUJUPCzQQS26sZ9U+fwCw==
X-CSE-MsgGUID: B6OBJx1rT0G2VytYDToO2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="156436004"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.28])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 11:11:06 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2 5/7] drm/gpusvm: export drm_gpusvm_pages API
Date: Fri, 28 Mar 2025 18:10:34 +0000
Message-ID: <20250328181028.288312-14-matthew.auld@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250328181028.288312-9-matthew.auld@intel.com>
References: <20250328181028.288312-9-matthew.auld@intel.com>
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

Export get/unmap/free pages API. We also need to tweak the SVM init to
allow skipping much of the unneeded parts.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 66 ++++++++++++++++++++++++++++--------
 include/drm/drm_gpusvm.h     | 16 +++++++++
 2 files changed, 67 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index e1f9c013071f..7c117d7a8d5b 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -539,6 +539,12 @@ static const struct mmu_interval_notifier_ops drm_gpusvm_notifier_ops = {
  *
  * This function initializes the GPU SVM.
  *
+ * Note: If only using the simple drm_gpusvm_pages API (get/unmap/free),
+ * then only @gpusvm, @name, and @drm are expected. However, the same base
+ * @gpusvm can also be used with both modes together in which case the full
+ * setup is needed, where the core drm_gpusvm_pages API will simply never use
+ * the other fields.
+ *
  * Return: 0 on success, a negative error code on failure.
  */
 int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
@@ -549,8 +555,16 @@ int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
 		    const struct drm_gpusvm_ops *ops,
 		    const unsigned long *chunk_sizes, int num_chunks)
 {
-	if (!ops->invalidate || !num_chunks)
-		return -EINVAL;
+	if (mm) {
+		if (!ops->invalidate || !num_chunks)
+			return -EINVAL;
+		mmgrab(mm);
+	} else {
+		/* No full SVM mode, only core drm_gpusvm_pages API. */
+		if (ops || num_chunks || mm_range || notifier_size ||
+		    device_private_page_owner)
+			return -EINVAL;
+	}
 
 	gpusvm->name = name;
 	gpusvm->drm = drm;
@@ -563,7 +577,6 @@ int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
 	gpusvm->chunk_sizes = chunk_sizes;
 	gpusvm->num_chunks = num_chunks;
 
-	mmgrab(mm);
 	gpusvm->root = RB_ROOT_CACHED;
 	INIT_LIST_HEAD(&gpusvm->notifier_list);
 
@@ -671,7 +684,8 @@ void drm_gpusvm_fini(struct drm_gpusvm *gpusvm)
 			drm_gpusvm_range_remove(gpusvm, range);
 	}
 
-	mmdrop(gpusvm->mm);
+	if (gpusvm->mm)
+		mmdrop(gpusvm->mm);
 	WARN_ON(!RB_EMPTY_ROOT(&gpusvm->root.rb_root));
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_fini);
@@ -1185,6 +1199,27 @@ static void __drm_gpusvm_free_pages(struct drm_gpusvm *gpusvm,
 	}
 }
 
+/**
+ * drm_gpusvm_free_pages() - Free dma-mapping associated with GPU SVM pages
+ * struct
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @svm_pages: Pointer to the GPU SVM pages structure
+ * @npages: Number of mapped pages
+ *
+ * This function unmaps and frees the dma address array associated with a GPU
+ * SVM pages struct.
+ */
+void drm_gpusvm_free_pages(struct drm_gpusvm *gpusvm,
+			   struct drm_gpusvm_pages *svm_pages,
+			   unsigned long npages)
+{
+	drm_gpusvm_notifier_lock(gpusvm);
+	__drm_gpusvm_unmap_pages(gpusvm, svm_pages, npages);
+	__drm_gpusvm_free_pages(gpusvm, svm_pages);
+	drm_gpusvm_notifier_unlock(gpusvm);
+}
+EXPORT_SYMBOL_GPL(drm_gpusvm_free_pages);
+
 /**
  * drm_gpusvm_range_remove() - Remove GPU SVM range
  * @gpusvm: Pointer to the GPU SVM structure
@@ -1360,13 +1395,12 @@ static bool drm_gpusvm_pages_valid_unlocked(struct drm_gpusvm *gpusvm,
  *
  * Return: 0 on success, negative error code on failure.
  */
-static int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
-				struct drm_gpusvm_pages *svm_pages,
-				struct mm_struct *mm,
-				struct mmu_interval_notifier *notifier,
-				unsigned long pages_start,
-				unsigned long pages_end,
-				const struct drm_gpusvm_ctx *ctx)
+int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
+			 struct drm_gpusvm_pages *svm_pages,
+			 struct mm_struct *mm,
+			 struct mmu_interval_notifier *notifier,
+			 unsigned long pages_start, unsigned long pages_end,
+			 const struct drm_gpusvm_ctx *ctx)
 {
 	struct hmm_range hmm_range = {
 		.default_flags = HMM_PFN_REQ_FAULT | (ctx->read_only ? 0 :
@@ -1548,6 +1582,7 @@ static int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 		goto retry;
 	return err;
 }
+EXPORT_SYMBOL_GPL(drm_gpusvm_get_pages);
 
 /**
  * drm_gpusvm_range_get_pages() - Get pages for a GPU SVM range
@@ -1583,10 +1618,10 @@ EXPORT_SYMBOL_GPL(drm_gpusvm_range_get_pages);
  * Must be called in the invalidate() callback of the corresponding notifier for
  * IOMMU security model.
  */
-static void drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
-				   struct drm_gpusvm_pages *svm_pages,
-				   unsigned long npages,
-				   const struct drm_gpusvm_ctx *ctx)
+void drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
+			    struct drm_gpusvm_pages *svm_pages,
+			    unsigned long npages,
+			    const struct drm_gpusvm_ctx *ctx)
 {
 	if (ctx->in_notifier)
 		lockdep_assert_held_write(&gpusvm->notifier_lock);
@@ -1598,6 +1633,7 @@ static void drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
 	if (!ctx->in_notifier)
 		drm_gpusvm_notifier_unlock(gpusvm);
 }
+EXPORT_SYMBOL_GPL(drm_gpusvm_unmap_pages);
 
 /**
  * drm_gpusvm_range_unmap_pages() - Unmap pages associated with a GPU SVM range
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 1b7ed4f4a8e2..611aaba1ac80 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -370,6 +370,22 @@ void drm_gpusvm_devmem_init(struct drm_gpusvm_devmem *devmem_allocation,
 			    const struct drm_gpusvm_devmem_ops *ops,
 			    struct drm_pagemap *dpagemap, size_t size);
 
+int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
+			 struct drm_gpusvm_pages *svm_pages,
+			 struct mm_struct *mm,
+			 struct mmu_interval_notifier *notifier,
+			 unsigned long pages_start, unsigned long pages_end,
+			 const struct drm_gpusvm_ctx *ctx);
+
+void drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
+			    struct drm_gpusvm_pages *svm_pages,
+			    unsigned long npages,
+			    const struct drm_gpusvm_ctx *ctx);
+
+void drm_gpusvm_free_pages(struct drm_gpusvm *gpusvm,
+			   struct drm_gpusvm_pages *svm_pages,
+			   unsigned long npages);
+
 #ifdef CONFIG_LOCKDEP
 /**
  * drm_gpusvm_driver_set_lock() - Set the lock protecting accesses to GPU SVM
-- 
2.48.1

