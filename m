Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E310B2B366
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 23:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B882210E4D8;
	Mon, 18 Aug 2025 21:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ARnol9x3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E834F10E4DD;
 Mon, 18 Aug 2025 21:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755552656; x=1787088656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ox7X3c0cLdJlQ+B+2L2wuJIazZXIVv+szjOL40pV0yA=;
 b=ARnol9x3vobi0FMkhrD1xnNg5dCOgrzind2zeYeK2nc+Q1eQzwD9nM1D
 7GFfLAUrQxmSoOaCGx1ws/zdql/v6L/JsjVLWAETMxwUf7xG9+S6c5T0x
 HfnIrl9P3A6W4FETWnHN3bU7pQ4sC2YCg+Bpi5sJtHjK7rUm69bX1hHQL
 hTmQQOD8ge2HDmc9XLkk3zvJCsInW6xDmHDzSToxyHxt2Sn3ZjYGnHHA6
 xis62taMuKBt3pZXVTx74j5uP5Ifs4EynBsR7V9/2NtPaEoqFjZdGDByD
 bLnKcYxbu+hJVqLKnuatM+CzLAE2arbVYfy4aFPxQ2DYL5Q9hz3ouCRQB g==;
X-CSE-ConnectionGUID: 4tt/fGKHR/iNCEd2Z6IuNg==
X-CSE-MsgGUID: NBzuvq8kS/id8gqq+6iIbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="56815200"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="56815200"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 14:30:56 -0700
X-CSE-ConnectionGUID: PWKHPWbYS9axBJ1bMKCviQ==
X-CSE-MsgGUID: Et6x9gZHQsewM7utpLS9dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="167186264"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by fmviesa007.fm.intel.com with ESMTP; 18 Aug 2025 14:30:54 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v8 08/24] drm/gpusvm: Make drm_gpusvm_for_each_* macros public
Date: Tue, 19 Aug 2025 03:27:37 +0530
Message-Id: <20250818215753.2762426-9-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250818215753.2762426-1-himal.prasad.ghimiray@intel.com>
References: <20250818215753.2762426-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
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

The drm_gpusvm_for_each_notifier, drm_gpusvm_for_each_notifier_safe and
drm_gpusvm_for_each_range_safe macros are useful for locating notifiers
and ranges within a user-specified range. By making these macros public,
we enable broader access and utility for developers who need to leverage
them in their implementations.

v2 (Matthew Brost)
- drop inline __drm_gpusvm_range_find
- /s/notifier_iter_first/drm_gpusvm_notifier_find

Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 122 +++++++----------------------------
 include/drm/drm_gpusvm.h     |  70 ++++++++++++++++++++
 2 files changed, 95 insertions(+), 97 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 661306da6b2d..e2a9a6ae1d54 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -271,107 +271,50 @@ npages_in_range(unsigned long start, unsigned long end)
 }
 
 /**
- * drm_gpusvm_range_find() - Find GPU SVM range from GPU SVM notifier
- * @notifier: Pointer to the GPU SVM notifier structure.
- * @start: Start address of the range
- * @end: End address of the range
+ * drm_gpusvm_notifier_find() - Find GPU SVM notifier from GPU SVM
+ * @gpusvm: Pointer to the GPU SVM structure.
+ * @start: Start address of the notifier
+ * @end: End address of the notifier
  *
- * Return: A pointer to the drm_gpusvm_range if found or NULL
+ * Return: A pointer to the drm_gpusvm_notifier if found or NULL
  */
-struct drm_gpusvm_range *
-drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, unsigned long start,
-		      unsigned long end)
+struct drm_gpusvm_notifier *
+drm_gpusvm_notifier_find(struct drm_gpusvm *gpusvm, unsigned long start,
+			 unsigned long end)
 {
 	struct interval_tree_node *itree;
 
-	itree = interval_tree_iter_first(&notifier->root, start, end - 1);
+	itree = interval_tree_iter_first(&gpusvm->root, start, end - 1);
 
 	if (itree)
-		return container_of(itree, struct drm_gpusvm_range, itree);
+		return container_of(itree, struct drm_gpusvm_notifier, itree);
 	else
 		return NULL;
 }
-EXPORT_SYMBOL_GPL(drm_gpusvm_range_find);
+EXPORT_SYMBOL_GPL(drm_gpusvm_notifier_find);
 
 /**
- * drm_gpusvm_for_each_range_safe() - Safely iterate over GPU SVM ranges in a notifier
- * @range__: Iterator variable for the ranges
- * @next__: Iterator variable for the ranges temporay storage
- * @notifier__: Pointer to the GPU SVM notifier
- * @start__: Start address of the range
- * @end__: End address of the range
- *
- * This macro is used to iterate over GPU SVM ranges in a notifier while
- * removing ranges from it.
- */
-#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
-	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
-	     (next__) = __drm_gpusvm_range_next(range__);				\
-	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
-	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))
-
-/**
- * __drm_gpusvm_notifier_next() - get the next drm_gpusvm_notifier in the list
- * @notifier: a pointer to the current drm_gpusvm_notifier
+ * drm_gpusvm_range_find() - Find GPU SVM range from GPU SVM notifier
+ * @notifier: Pointer to the GPU SVM notifier structure.
+ * @start: Start address of the range
+ * @end: End address of the range
  *
- * Return: A pointer to the next drm_gpusvm_notifier if available, or NULL if
- *         the current notifier is the last one or if the input notifier is
- *         NULL.
+ * Return: A pointer to the drm_gpusvm_range if found or NULL
  */
-static struct drm_gpusvm_notifier *
-__drm_gpusvm_notifier_next(struct drm_gpusvm_notifier *notifier)
-{
-	if (notifier && !list_is_last(&notifier->entry,
-				      &notifier->gpusvm->notifier_list))
-		return list_next_entry(notifier, entry);
-
-	return NULL;
-}
-
-static struct drm_gpusvm_notifier *
-notifier_iter_first(struct rb_root_cached *root, unsigned long start,
-		    unsigned long last)
+struct drm_gpusvm_range *
+drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, unsigned long start,
+		      unsigned long end)
 {
 	struct interval_tree_node *itree;
 
-	itree = interval_tree_iter_first(root, start, last);
+	itree = interval_tree_iter_first(&notifier->root, start, end - 1);
 
 	if (itree)
-		return container_of(itree, struct drm_gpusvm_notifier, itree);
+		return container_of(itree, struct drm_gpusvm_range, itree);
 	else
 		return NULL;
 }
-
-/**
- * drm_gpusvm_for_each_notifier() - Iterate over GPU SVM notifiers in a gpusvm
- * @notifier__: Iterator variable for the notifiers
- * @notifier__: Pointer to the GPU SVM notifier
- * @start__: Start address of the notifier
- * @end__: End address of the notifier
- *
- * This macro is used to iterate over GPU SVM notifiers in a gpusvm.
- */
-#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
-	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1);	\
-	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
-	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))
-
-/**
- * drm_gpusvm_for_each_notifier_safe() - Safely iterate over GPU SVM notifiers in a gpusvm
- * @notifier__: Iterator variable for the notifiers
- * @next__: Iterator variable for the notifiers temporay storage
- * @notifier__: Pointer to the GPU SVM notifier
- * @start__: Start address of the notifier
- * @end__: End address of the notifier
- *
- * This macro is used to iterate over GPU SVM notifiers in a gpusvm while
- * removing notifiers from it.
- */
-#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
-	for ((notifier__) = notifier_iter_first(&(gpusvm__)->root, (start__), (end__) - 1),	\
-	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
-	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
-	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))
+EXPORT_SYMBOL_GPL(drm_gpusvm_range_find);
 
 /**
  * drm_gpusvm_notifier_invalidate() - Invalidate a GPU SVM notifier.
@@ -472,22 +415,6 @@ int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_init);
 
-/**
- * drm_gpusvm_notifier_find() - Find GPU SVM notifier
- * @gpusvm: Pointer to the GPU SVM structure
- * @fault_addr: Fault address
- *
- * This function finds the GPU SVM notifier associated with the fault address.
- *
- * Return: Pointer to the GPU SVM notifier on success, NULL otherwise.
- */
-static struct drm_gpusvm_notifier *
-drm_gpusvm_notifier_find(struct drm_gpusvm *gpusvm,
-			 unsigned long fault_addr)
-{
-	return notifier_iter_first(&gpusvm->root, fault_addr, fault_addr + 1);
-}
-
 /**
  * to_drm_gpusvm_notifier() - retrieve the container struct for a given rbtree node
  * @node: a pointer to the rbtree node embedded within a drm_gpusvm_notifier struct
@@ -943,7 +870,7 @@ drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm,
 	if (!mmget_not_zero(mm))
 		return ERR_PTR(-EFAULT);
 
-	notifier = drm_gpusvm_notifier_find(gpusvm, fault_addr);
+	notifier = drm_gpusvm_notifier_find(gpusvm, fault_addr, fault_addr + 1);
 	if (!notifier) {
 		notifier = drm_gpusvm_notifier_alloc(gpusvm, fault_addr);
 		if (IS_ERR(notifier)) {
@@ -1107,7 +1034,8 @@ void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
 	drm_gpusvm_driver_lock_held(gpusvm);
 
 	notifier = drm_gpusvm_notifier_find(gpusvm,
-					    drm_gpusvm_range_start(range));
+					    drm_gpusvm_range_start(range),
+					    drm_gpusvm_range_start(range) + 1);
 	if (WARN_ON_ONCE(!notifier))
 		return;
 
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 8d613e9b2690..0e336148309d 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -282,6 +282,10 @@ void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
 bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, unsigned long start,
 			    unsigned long end);
 
+struct drm_gpusvm_notifier *
+drm_gpusvm_notifier_find(struct drm_gpusvm *gpusvm, unsigned long start,
+			 unsigned long end);
+
 struct drm_gpusvm_range *
 drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, unsigned long start,
 		      unsigned long end);
@@ -434,4 +438,70 @@ __drm_gpusvm_range_next(struct drm_gpusvm_range *range)
 	     (range__) && (drm_gpusvm_range_start(range__) < (end__));	\
 	     (range__) = __drm_gpusvm_range_next(range__))
 
+/**
+ * drm_gpusvm_for_each_range_safe() - Safely iterate over GPU SVM ranges in a notifier
+ * @range__: Iterator variable for the ranges
+ * @next__: Iterator variable for the ranges temporay storage
+ * @notifier__: Pointer to the GPU SVM notifier
+ * @start__: Start address of the range
+ * @end__: End address of the range
+ *
+ * This macro is used to iterate over GPU SVM ranges in a notifier while
+ * removing ranges from it.
+ */
+#define drm_gpusvm_for_each_range_safe(range__, next__, notifier__, start__, end__)	\
+	for ((range__) = drm_gpusvm_range_find((notifier__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_range_next(range__);				\
+	     (range__) && (drm_gpusvm_range_start(range__) < (end__));			\
+	     (range__) = (next__), (next__) = __drm_gpusvm_range_next(range__))
+
+/**
+ * __drm_gpusvm_notifier_next() - get the next drm_gpusvm_notifier in the list
+ * @notifier: a pointer to the current drm_gpusvm_notifier
+ *
+ * Return: A pointer to the next drm_gpusvm_notifier if available, or NULL if
+ *         the current notifier is the last one or if the input notifier is
+ *         NULL.
+ */
+static inline struct drm_gpusvm_notifier *
+__drm_gpusvm_notifier_next(struct drm_gpusvm_notifier *notifier)
+{
+	if (notifier && !list_is_last(&notifier->entry,
+				      &notifier->gpusvm->notifier_list))
+		return list_next_entry(notifier, entry);
+
+	return NULL;
+}
+
+/**
+ * drm_gpusvm_for_each_notifier() - Iterate over GPU SVM notifiers in a gpusvm
+ * @notifier__: Iterator variable for the notifiers
+ * @gpusvm__: Pointer to the GPU SVM notifier
+ * @start__: Start address of the notifier
+ * @end__: End address of the notifier
+ *
+ * This macro is used to iterate over GPU SVM notifiers in a gpusvm.
+ */
+#define drm_gpusvm_for_each_notifier(notifier__, gpusvm__, start__, end__)		\
+	for ((notifier__) = drm_gpusvm_notifier_find((gpusvm__), (start__), (end__));	\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = __drm_gpusvm_notifier_next(notifier__))
+
+/**
+ * drm_gpusvm_for_each_notifier_safe() - Safely iterate over GPU SVM notifiers in a gpusvm
+ * @notifier__: Iterator variable for the notifiers
+ * @next__: Iterator variable for the notifiers temporay storage
+ * @gpusvm__: Pointer to the GPU SVM notifier
+ * @start__: Start address of the notifier
+ * @end__: End address of the notifier
+ *
+ * This macro is used to iterate over GPU SVM notifiers in a gpusvm while
+ * removing notifiers from it.
+ */
+#define drm_gpusvm_for_each_notifier_safe(notifier__, next__, gpusvm__, start__, end__)	\
+	for ((notifier__) = drm_gpusvm_notifier_find((gpusvm__), (start__), (end__)),	\
+	     (next__) = __drm_gpusvm_notifier_next(notifier__);				\
+	     (notifier__) && (drm_gpusvm_notifier_start(notifier__) < (end__));		\
+	     (notifier__) = (next__), (next__) = __drm_gpusvm_notifier_next(notifier__))
+
 #endif /* __DRM_GPUSVM_H__ */
-- 
2.34.1

