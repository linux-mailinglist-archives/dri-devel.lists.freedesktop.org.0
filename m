Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FB3A9AD1C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 14:18:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B9810E7E2;
	Thu, 24 Apr 2025 12:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Unz58MCJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993D810E7E2;
 Thu, 24 Apr 2025 12:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745497132; x=1777033132;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SoNllQo1bMenny0filNN59hQIAP3rsNosbrCLQFHl3Y=;
 b=Unz58MCJxJk8qEklB1ZO5MVOruN9KT14z5R3GROJbNgXfP7CVGeCX+K1
 3IaChaaU3xwU229xuMTW51+vo4Fcp1ronSh7XYe+Pyo6o+Z3sU/cex1H5
 tyKC2OydE/xZo6kmvH1iW0gr+W3DtnEywxEu7LcOTVtM0mO1Nwh27hY5h
 DdayijMYCD0lgzcWdjZoSiLOBEQ/lUswbMIynR5402njrcHswlpainWe3
 uILtcmlEIbqQwHhFDMN8cjAa5Kp6Tz0GROOmCLfE8OVLeigbxFY7/HKXb
 O3DsQOPIZ9OJV2zaanYmpjTPWzPkcjwOT8Z9/mt6FoErnBzUcSihtuqfU A==;
X-CSE-ConnectionGUID: cxmdrJ0tQO68SeBrIvmhZA==
X-CSE-MsgGUID: a49e3SunTuenleU+76NFXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="50947954"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="50947954"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 05:18:52 -0700
X-CSE-ConnectionGUID: XK7LPFksTjqC9fMYtPuUzw==
X-CSE-MsgGUID: HT8fEKi4TBOYOIIARDu7GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="137589423"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.164])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 05:18:50 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v3 4/7] drm/gpusvm: refactor core API to use pages struct
Date: Thu, 24 Apr 2025 13:18:32 +0100
Message-ID: <20250424121827.862729-13-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424121827.862729-9-matthew.auld@intel.com>
References: <20250424121827.862729-9-matthew.auld@intel.com>
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

Refactor the core API of get/unmap/free pages to all operate on
drm_gpusvm_pages. In the next patch we want to export a simplified core
API without needing fully blown svm range etc.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 161 ++++++++++++++++++++++++-----------
 1 file changed, 110 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index ef38017d2159..fbe0d70ef163 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -1128,19 +1128,19 @@ drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm,
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_find_or_insert);
 
 /**
- * __drm_gpusvm_range_unmap_pages() - Unmap pages associated with a GPU SVM range (internal)
+ * __drm_gpusvm_unmap_pages() - Unmap pages associated with GPU SVM pages
+ * (internal)
  * @gpusvm: Pointer to the GPU SVM structure
- * @range: Pointer to the GPU SVM range structure
+ * @pages: Pointer to the GPU SVM pages structure
  * @npages: Number of pages to unmap
  *
- * This function unmap pages associated with a GPU SVM range. Assumes and
+ * This function unmap pages associated with a GPU SVM pages struct. Assumes and
  * asserts correct locking is in place when called.
  */
-static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
-					   struct drm_gpusvm_range *range,
-					   unsigned long npages)
+static void __drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
+				     struct drm_gpusvm_pages *svm_pages,
+				     unsigned long npages)
 {
-	struct drm_gpusvm_pages *svm_pages = &range->pages;
 	struct drm_pagemap *dpagemap = svm_pages->dpagemap;
 	struct device *dev = gpusvm->drm->dev;
 	unsigned long i, j;
@@ -1168,17 +1168,15 @@ static void __drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
 }
 
 /**
- * drm_gpusvm_range_free_pages() - Free pages associated with a GPU SVM range
+ * __drm_gpusvm_free_pages() - Free dma array associated with GPU SVM pages
  * @gpusvm: Pointer to the GPU SVM structure
- * @range: Pointer to the GPU SVM range structure
+ * @svm_pages: Pointer to the GPU SVM pages structure
  *
  * This function frees the dma address array associated with a GPU SVM range.
  */
-static void drm_gpusvm_range_free_pages(struct drm_gpusvm *gpusvm,
-					struct drm_gpusvm_range *range)
+static void __drm_gpusvm_free_pages(struct drm_gpusvm *gpusvm,
+				    struct drm_gpusvm_pages *svm_pages)
 {
-	struct drm_gpusvm_pages *svm_pages = &range->pages;
-
 	lockdep_assert_held(&gpusvm->notifier_lock);
 
 	if (svm_pages->dma_addr) {
@@ -1211,8 +1209,8 @@ void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
 		return;
 
 	drm_gpusvm_notifier_lock(gpusvm);
-	__drm_gpusvm_range_unmap_pages(gpusvm, range, npages);
-	drm_gpusvm_range_free_pages(gpusvm, range);
+	__drm_gpusvm_unmap_pages(gpusvm, &range->pages, npages);
+	__drm_gpusvm_free_pages(gpusvm, &range->pages);
 	__drm_gpusvm_range_remove(notifier, range);
 	drm_gpusvm_notifier_unlock(gpusvm);
 
@@ -1277,6 +1275,28 @@ void drm_gpusvm_range_put(struct drm_gpusvm_range *range)
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_put);
 
+/**
+ * drm_gpusvm_pages_valid() - GPU SVM range pages valid
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @svm_pages: Pointer to the GPU SVM pages structure
+ *
+ * This function determines if a GPU SVM range pages are valid. Expected be
+ * called holding gpusvm->notifier_lock and as the last step before committing a
+ * GPU binding. This is akin to a notifier seqno check in the HMM documentation
+ * but due to wider notifiers (i.e., notifiers which span multiple ranges) this
+ * function is required for finer grained checking (i.e., per range) if pages
+ * are valid.
+ *
+ * Return: True if GPU SVM range has valid pages, False otherwise
+ */
+static bool drm_gpusvm_pages_valid(struct drm_gpusvm *gpusvm,
+				   struct drm_gpusvm_pages *svm_pages)
+{
+	lockdep_assert_held(&gpusvm->notifier_lock);
+
+	return svm_pages->flags.has_devmem_pages || svm_pages->flags.has_dma_mapping;
+}
+
 /**
  * drm_gpusvm_range_pages_valid() - GPU SVM range pages valid
  * @gpusvm: Pointer to the GPU SVM structure
@@ -1294,11 +1314,7 @@ EXPORT_SYMBOL_GPL(drm_gpusvm_range_put);
 bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
 				  struct drm_gpusvm_range *range)
 {
-	struct drm_gpusvm_pages *svm_pages = &range->pages;
-
-	lockdep_assert_held(&gpusvm->notifier_lock);
-
-	return svm_pages->flags.has_devmem_pages || svm_pages->flags.has_dma_mapping;
+	return drm_gpusvm_pages_valid(gpusvm, &range->pages);
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_pages_valid);
 
@@ -1312,57 +1328,59 @@ EXPORT_SYMBOL_GPL(drm_gpusvm_range_pages_valid);
  *
  * Return: True if GPU SVM range has valid pages, False otherwise
  */
-static bool
-drm_gpusvm_range_pages_valid_unlocked(struct drm_gpusvm *gpusvm,
-				      struct drm_gpusvm_range *range)
+static bool drm_gpusvm_pages_valid_unlocked(struct drm_gpusvm *gpusvm,
+					    struct drm_gpusvm_pages *svm_pages)
 {
-	struct drm_gpusvm_pages *svm_pages = &range->pages;
 	bool pages_valid;
 
 	if (!svm_pages->dma_addr)
 		return false;
 
 	drm_gpusvm_notifier_lock(gpusvm);
-	pages_valid = drm_gpusvm_range_pages_valid(gpusvm, range);
+	pages_valid = drm_gpusvm_pages_valid(gpusvm, svm_pages);
 	if (!pages_valid)
-		drm_gpusvm_range_free_pages(gpusvm, range);
+		__drm_gpusvm_free_pages(gpusvm, svm_pages);
 	drm_gpusvm_notifier_unlock(gpusvm);
 
 	return pages_valid;
 }
 
 /**
- * drm_gpusvm_range_get_pages() - Get pages for a GPU SVM range
+ * drm_gpusvm_get_pages() - Get pages and populate GPU SVM pages struct
  * @gpusvm: Pointer to the GPU SVM structure
- * @range: Pointer to the GPU SVM range structure
+ * @svm_pages: The SVM pages to populate. This will contain the dma-addresses
+ * @mm: The mm corresponding to the CPU range
+ * @notifier: The corresponding notifier for the given CPU range
+ * @pages_start: Start CPU address for the pages
+ * @pages_end: End CPU address for the pages (exclusive)
  * @ctx: GPU SVM context
  *
- * This function gets pages for a GPU SVM range and ensures they are mapped for
- * DMA access.
+ * This function gets and maps pages for CPU range and ensures they are
+ * mapped for DMA access.
  *
  * Return: 0 on success, negative error code on failure.
  */
-int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
-			       struct drm_gpusvm_range *range,
-			       const struct drm_gpusvm_ctx *ctx)
+static int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
+				struct drm_gpusvm_pages *svm_pages,
+				struct mm_struct *mm,
+				struct mmu_interval_notifier *notifier,
+				unsigned long pages_start,
+				unsigned long pages_end,
+				const struct drm_gpusvm_ctx *ctx)
 {
-	struct drm_gpusvm_pages *svm_pages = &range->pages;
-	struct mmu_interval_notifier *notifier = &range->notifier->notifier;
 	struct hmm_range hmm_range = {
 		.default_flags = HMM_PFN_REQ_FAULT | (ctx->read_only ? 0 :
 			HMM_PFN_REQ_WRITE),
 		.notifier = notifier,
-		.start = drm_gpusvm_range_start(range),
-		.end = drm_gpusvm_range_end(range),
+		.start = pages_start,
+		.end = pages_end,
 		.dev_private_owner = gpusvm->device_private_page_owner,
 	};
-	struct mm_struct *mm = gpusvm->mm;
 	struct drm_gpusvm_zdd *zdd;
 	unsigned long timeout =
 		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 	unsigned long i, j;
-	unsigned long npages = npages_in_range(drm_gpusvm_range_start(range),
-					       drm_gpusvm_range_end(range));
+	unsigned long npages = npages_in_range(pages_start, pages_end);
 	unsigned long num_dma_mapped;
 	unsigned int order = 0;
 	unsigned long *pfns;
@@ -1375,7 +1393,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 
 retry:
 	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
-	if (drm_gpusvm_range_pages_valid_unlocked(gpusvm, range))
+	if (drm_gpusvm_pages_valid_unlocked(gpusvm, svm_pages))
 		goto set_seqno;
 
 	pfns = kvmalloc_array(npages, sizeof(*pfns), GFP_KERNEL);
@@ -1522,7 +1540,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 	return 0;
 
 err_unmap:
-	__drm_gpusvm_range_unmap_pages(gpusvm, range, num_dma_mapped);
+	__drm_gpusvm_unmap_pages(gpusvm, svm_pages, num_dma_mapped);
 	drm_gpusvm_notifier_unlock(gpusvm);
 err_free:
 	kvfree(pfns);
@@ -1530,8 +1548,57 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
 		goto retry;
 	return err;
 }
+
+/**
+ * drm_gpusvm_range_get_pages() - Get pages for a GPU SVM range
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @range: Pointer to the GPU SVM range structure
+ * @ctx: GPU SVM context
+ *
+ * This function gets pages for a GPU SVM range and ensures they are mapped for
+ * DMA access.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
+			       struct drm_gpusvm_range *range,
+			       const struct drm_gpusvm_ctx *ctx)
+{
+	return drm_gpusvm_get_pages(gpusvm, &range->pages, gpusvm->mm,
+				    &range->notifier->notifier,
+				    drm_gpusvm_range_start(range),
+				    drm_gpusvm_range_end(range), ctx);
+}
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_get_pages);
 
+/**
+ * drm_gpusvm_unmap_pages() - Unmap GPU svm pages
+ * @gpusvm: Pointer to the GPU SVM structure
+ * @pages: Pointer to the GPU SVM pages structure
+ * @ctx: GPU SVM context
+ *
+ * This function unmaps pages associated with a GPU SVM pages struct. If
+ * @in_notifier is set, it is assumed that gpusvm->notifier_lock is held in
+ * write mode; if it is clear, it acquires gpusvm->notifier_lock in read mode.
+ * Must be called in the invalidate() callback of the corresponding notifier for
+ * IOMMU security model.
+ */
+static void drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
+				   struct drm_gpusvm_pages *svm_pages,
+				   unsigned long npages,
+				   const struct drm_gpusvm_ctx *ctx)
+{
+	if (ctx->in_notifier)
+		lockdep_assert_held_write(&gpusvm->notifier_lock);
+	else
+		drm_gpusvm_notifier_lock(gpusvm);
+
+	__drm_gpusvm_unmap_pages(gpusvm, svm_pages, npages);
+
+	if (!ctx->in_notifier)
+		drm_gpusvm_notifier_unlock(gpusvm);
+}
+
 /**
  * drm_gpusvm_range_unmap_pages() - Unmap pages associated with a GPU SVM range
  * @gpusvm: Pointer to the GPU SVM structure
@@ -1551,15 +1618,7 @@ void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
 	unsigned long npages = npages_in_range(drm_gpusvm_range_start(range),
 					       drm_gpusvm_range_end(range));
 
-	if (ctx->in_notifier)
-		lockdep_assert_held_write(&gpusvm->notifier_lock);
-	else
-		drm_gpusvm_notifier_lock(gpusvm);
-
-	__drm_gpusvm_range_unmap_pages(gpusvm, range, npages);
-
-	if (!ctx->in_notifier)
-		drm_gpusvm_notifier_unlock(gpusvm);
+	return drm_gpusvm_unmap_pages(gpusvm, &range->pages, npages, ctx);
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_unmap_pages);
 
-- 
2.49.0

