Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3AE780E9D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 17:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FB510E53B;
	Fri, 18 Aug 2023 15:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B860110E53E;
 Fri, 18 Aug 2023 15:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692371394; x=1723907394;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X1GaeCi2BOZUajkq9QoiMEyip0DITynEJdUxDRqtubY=;
 b=RjcvxvcvJQwljXJgtpOAtGCWakIBuIJK1mg3obbvkQW1e72Cnms5SUy8
 uwJ9xNy1iB5/2ipLYCYIayxmZTflGXK4ALBkKIpHLRzZFXz/vU7z8+qLy
 FBxYZN1Huwmxsx4ZJ7oCg5KGUsGP+eq4FBrFJKIHt7xP1lydLBDML/iPc
 FJA7w1O2mcSbI7f9atzTfo6Aizyid6X6ADWS19dY+Um5RIk22lWddk2fL
 vcw98t2udSUUD/DbI9C7rbtikqOJUvgN9IeGb10oW0hHj42pMDAGCTv61
 tg+Hc96wDkilTxGeK+t5J4hh8GaWKrMIKPmw9tQcomRhanbJxww9OGUcj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="363276745"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="363276745"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 08:09:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="1065774160"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="1065774160"
Received: from kjeldbeg-mobl.ger.corp.intel.com (HELO fedora..)
 ([10.249.254.202])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 08:09:23 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 2/4] drm/xe/vm: Implement userptr page pinning
Date: Fri, 18 Aug 2023 17:08:43 +0200
Message-ID: <20230818150845.96679-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230818150845.96679-1-thomas.hellstrom@linux.intel.com>
References: <20230818150845.96679-1-thomas.hellstrom@linux.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement pinning of userptrs between VM_BIND and VM_UNBIND, which will
facilitate avoiding long hangs on non-preemptible workloads. But don't
hook it up to userspace just yet.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 76 ++++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_vm.h       |  9 ++++
 drivers/gpu/drm/xe/xe_vm_types.h | 12 +++++
 3 files changed, 74 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8bf7f62e6548..ecbcad696b60 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -74,10 +74,6 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
 	if (notifier_seq == vma->userptr.notifier_seq)
 		return 0;
 
-	pages = kvmalloc_array(num_pages, sizeof(*pages), GFP_KERNEL);
-	if (!pages)
-		return -ENOMEM;
-
 	if (vma->userptr.sg) {
 		dma_unmap_sgtable(xe->drm.dev,
 				  vma->userptr.sg,
@@ -87,6 +83,17 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
 		vma->userptr.sg = NULL;
 	}
 
+	if (vma->userptr.pinned_pages) {
+		unpin_user_pages_dirty_lock(vma->userptr.pinned_pages,
+					    vma->userptr.num_pinned,
+					    !read_only);
+		pages = vma->userptr.pinned_pages;
+	} else {
+		pages = kvmalloc_array(num_pages, sizeof(*pages), GFP_KERNEL);
+		if (!pages)
+			return -ENOMEM;
+	}
+
 	pinned = ret = 0;
 	if (in_kthread) {
 		if (!mmget_not_zero(vma->userptr.notifier.mm)) {
@@ -97,11 +104,18 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
 	}
 
 	while (pinned < num_pages) {
-		ret = get_user_pages_fast(xe_vma_userptr(vma) +
-					  pinned * PAGE_SIZE,
-					  num_pages - pinned,
-					  read_only ? 0 : FOLL_WRITE,
-					  &pages[pinned]);
+		if (xe_vma_is_pinned(vma))
+			ret = pin_user_pages_fast(xe_vma_userptr(vma) +
+						  pinned * PAGE_SIZE,
+						  num_pages - pinned,
+						  read_only ? 0 : FOLL_WRITE,
+						  &pages[pinned]);
+		else
+			ret = get_user_pages_fast(xe_vma_userptr(vma) +
+						  pinned * PAGE_SIZE,
+						  num_pages - pinned,
+						  read_only ? 0 : FOLL_WRITE,
+						  &pages[pinned]);
 		if (ret < 0) {
 			if (in_kthread)
 				ret = 0;
@@ -137,19 +151,24 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
 	if (ret)
 		goto out_free_sg;
 
-	for (i = 0; i < pinned; ++i) {
-		if (!read_only) {
-			lock_page(pages[i]);
-			set_page_dirty(pages[i]);
-			unlock_page(pages[i]);
+	if (!xe_vma_is_pinned(vma)) {
+		for (i = 0; i < pinned; ++i) {
+			if (!read_only) {
+				lock_page(pages[i]);
+				set_page_dirty(pages[i]);
+				unlock_page(pages[i]);
+			}
+
+			mark_page_accessed(pages[i]);
 		}
 
-		mark_page_accessed(pages[i]);
+		release_pages(pages, pinned);
+		kvfree(pages);
+	} else {
+		vma->userptr.pinned_pages = pages;
+		vma->userptr.num_pinned = pinned;
 	}
 
-	release_pages(pages, pinned);
-	kvfree(pages);
-
 	vma->userptr.notifier_seq = notifier_seq;
 	if (xe_vma_userptr_check_repin(vma) == -EAGAIN)
 		goto retry;
@@ -160,9 +179,14 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
 	sg_free_table(vma->userptr.sg);
 	vma->userptr.sg = NULL;
 out_release_pages:
-	release_pages(pages, pinned);
+	if (!xe_vma_is_pinned(vma))
+		release_pages(pages, pinned);
+	else
+		unpin_user_pages(pages, pinned);
+	vma->userptr.num_pinned = 0;
 mm_closed:
 	kvfree(pages);
+	vma->userptr.pinned_pages = NULL;
 	return ret;
 }
 
@@ -721,7 +745,7 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 	mmu_interval_set_seq(mni, cur_seq);
 
 	/* No need to stop gpu access if the userptr is not yet bound. */
-	if (!vma->userptr.initial_bind) {
+	if (xe_vma_is_pinned(vma) || !vma->userptr.initial_bind) {
 		up_write(&vm->userptr.notifier_lock);
 		return true;
 	}
@@ -976,10 +1000,16 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
 			vma->userptr.sg = NULL;
 		}
 
+		if (vma->userptr.pinned_pages) {
+			unpin_user_pages_dirty_lock(vma->userptr.pinned_pages,
+						    vma->userptr.num_pinned,
+						    !read_only);
+			kvfree(vma->userptr.pinned_pages);
+		}
+
 		/*
-		 * Since userptr pages are not pinned, we can't remove
-		 * the notifer until we're sure the GPU is not accessing
-		 * them anymore
+		 * We can't remove the notifer until we're sure the GPU is
+		 * not accessing the pages anymore
 		 */
 		mmu_interval_notifier_remove(&vma->userptr.notifier);
 		xe_vm_put(vm);
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 6de6e3edb24a..913544d7d995 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -139,6 +139,15 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
 	return xe_vma_has_no_bo(vma) && !xe_vma_is_null(vma);
 }
 
+/**
+ * xe_vma_is_pinned() - User has requested the backing store of this vma
+ * to be pinned.
+ */
+static inline bool xe_vma_is_pinned(struct xe_vma *vma)
+{
+	return xe_vma_is_userptr(vma) && (vma->gpuva.flags & XE_VMA_PINNED);
+}
+
 #define xe_vm_assert_held(vm) dma_resv_assert_held(&(vm)->resv)
 
 u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile);
diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
index 3681a5ff588b..9b90e649cd69 100644
--- a/drivers/gpu/drm/xe/xe_vm_types.h
+++ b/drivers/gpu/drm/xe/xe_vm_types.h
@@ -33,6 +33,8 @@ struct xe_vm;
 #define XE_VMA_PTE_4K		(DRM_GPUVA_USERBITS << 5)
 #define XE_VMA_PTE_2M		(DRM_GPUVA_USERBITS << 6)
 #define XE_VMA_PTE_1G		(DRM_GPUVA_USERBITS << 7)
+/* User requested backing store to be pinned */
+#define XE_VMA_PINNED           (DRM_GPUVA_USERBITS << 8)
 
 /** struct xe_userptr - User pointer */
 struct xe_userptr {
@@ -54,6 +56,16 @@ struct xe_userptr {
 	 * read: vm->userptr.notifier_lock in write mode or vm->resv held.
 	 */
 	bool initial_bind;
+	/**
+	 * @pinned_pages: List of pinned pages if xe_vma_pinned(),
+	 * NULL otherwise. protected by the vm lock.
+	 */
+	struct page **pinned_pages;
+	/**
+	 * @num_pinned: Number of pointers to pinned pages in @pinned_pages.
+	 * protected by the vm lock.
+	 */
+	unsigned long num_pinned;
 #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
 	u32 divisor;
 #endif
-- 
2.41.0

