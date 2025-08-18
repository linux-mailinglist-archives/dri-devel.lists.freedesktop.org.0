Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB736B2AC94
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 17:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D0210E497;
	Mon, 18 Aug 2025 15:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kf0J+4Mv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACEDE10E48B;
 Mon, 18 Aug 2025 15:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755530532; x=1787066532;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jOzs844wD3QQZhxMCdzrLYX19+02QAxkK0SDKC6QAXE=;
 b=kf0J+4MvL+rhfcqt9gXewIW6PonE6cRfs3khcDy/vCcYQm3H+cyWSaE8
 nJIDcACPaQxARLI/x5SQSB+QFtOjno0Ow5LDRHq+S+DaMnTARmaR8rQNm
 o/OZpS6lbLYWlZxjUTBBgXlZmuM6epX5AI3JApzpa/oyqVeMkGTl8DFFJ
 V8W2jS/JvAnHpLBa73L0XMo6bPr3F4yTajK1QNPwxXyWe1MOZLNPrpMYp
 XuwyE3bjr6/j83Qhla+0eW8Q/G8BNKui/9hBGCPxQA9sIImZYlZelwJsV
 cIlu7emwFfIu2QZz4W1be7hMqFZTZPU1DtCCGjC8SS8WCFjeIi2fuf/CM A==;
X-CSE-ConnectionGUID: 8Et0RrRtSEC3bXAbySUFTA==
X-CSE-MsgGUID: TXVrHosLQWaHNAGCqk30ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="69205856"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="69205856"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 08:22:12 -0700
X-CSE-ConnectionGUID: eoK1nMRNQyaOeufRJ8M2kA==
X-CSE-MsgGUID: SmWu5wbXSrWuHXqlJrnKCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="171837247"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.202])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 08:22:11 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v5 5/8] drm/gpusvm: export drm_gpusvm_pages API
Date: Mon, 18 Aug 2025 16:21:58 +0100
Message-ID: <20250818152152.67815-15-matthew.auld@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250818152152.67815-10-matthew.auld@intel.com>
References: <20250818152152.67815-10-matthew.auld@intel.com>
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 66 ++++++++++++++++++++++++++++--------
 include/drm/drm_gpusvm.h     | 16 +++++++++
 2 files changed, 67 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 2fb4978c396b..4c7cfe60459e 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -430,6 +430,12 @@ static const struct mmu_interval_notifier_ops drm_gpusvm_notifier_ops = {
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
@@ -440,8 +446,16 @@ int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
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
@@ -454,7 +468,6 @@ int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
 	gpusvm->chunk_sizes = chunk_sizes;
 	gpusvm->num_chunks = num_chunks;
 
-	mmgrab(mm);
 	gpusvm->root = RB_ROOT_CACHED;
 	INIT_LIST_HEAD(&gpusvm->notifier_list);
 
@@ -562,7 +575,8 @@ void drm_gpusvm_fini(struct drm_gpusvm *gpusvm)
 			drm_gpusvm_range_remove(gpusvm, range);
 	}
 
-	mmdrop(gpusvm->mm);
+	if (gpusvm->mm)
+		mmdrop(gpusvm->mm);
 	WARN_ON(!RB_EMPTY_ROOT(&gpusvm->root.rb_root));
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_fini);
@@ -1117,6 +1131,27 @@ static void __drm_gpusvm_free_pages(struct drm_gpusvm *gpusvm,
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
@@ -1292,13 +1327,12 @@ static bool drm_gpusvm_pages_valid_unlocked(struct drm_gpusvm *gpusvm,
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
@@ -1487,6 +1521,7 @@ static int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 		goto retry;
 	return err;
 }
+EXPORT_SYMBOL_GPL(drm_gpusvm_get_pages);
 
 /**
  * drm_gpusvm_range_get_pages() - Get pages for a GPU SVM range
@@ -1522,10 +1557,10 @@ EXPORT_SYMBOL_GPL(drm_gpusvm_range_get_pages);
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
@@ -1537,6 +1572,7 @@ static void drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
 	if (!ctx->in_notifier)
 		drm_gpusvm_notifier_unlock(gpusvm);
 }
+EXPORT_SYMBOL_GPL(drm_gpusvm_unmap_pages);
 
 /**
  * drm_gpusvm_range_unmap_pages() - Unmap pages associated with a GPU SVM range
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 1eb484c6af57..c214d6015c64 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -303,6 +303,22 @@ drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, unsigned long start,
 void drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
 				   const struct mmu_notifier_range *mmu_range);
 
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
2.50.1

