Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B795784704
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 18:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9DA10E3AD;
	Tue, 22 Aug 2023 16:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 789DB10E377;
 Tue, 22 Aug 2023 16:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692721323; x=1724257323;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7ZWn21J9dIvq9GZ8/rl2IemoEDLroEysvvgCre2NgxY=;
 b=PuVVBK8lB8LyLjsbw56mJuz84ETAY2zfiG2EhoHnmRLDg1RaIYfAhhgy
 XJoIs7n4dgaV8aXSCGZsv3C+plTm/5bbWUfBgqy4UPoK80cOHXwev3R2a
 9GSjcImE6nCGj06B8TAbfophVdvC0EO9iswhdDfqG4olewh/xnA93syo1
 bj9Vvz/vLwVvPQmpKXvVLn4hbxh+VC+UiPjtiJR2ZWmK8pSNl87BQGk19
 qGXXEGJ+Emi3HUcMNMmupko1XOamdl5g4+j/1gM1+pd8JFAkHxLhIoV86
 DQ1W1FDophmzTGpX+JxRRQpOmEmxdBhtgtl5owNao2XQLrpbVFNDkHn8N w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="354260390"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="354260390"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 09:22:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="826373918"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="826373918"
Received: from kahchuno-mobl.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.65])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 09:22:00 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 2/4] drm/xe/vm: Implement userptr page pinning
Date: Tue, 22 Aug 2023 18:21:34 +0200
Message-ID: <20230822162136.25895-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822162136.25895-1-thomas.hellstrom@linux.intel.com>
References: <20230822162136.25895-1-thomas.hellstrom@linux.intel.com>
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

v2:
- Avoid marking userptr VMAs as invalid in the mmu invalidation notifier.
  (Matthew Brost)
- Add an WARN that we don't try to repin userptr pages (Matthew Brost)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c       | 80 +++++++++++++++++++++++---------
 drivers/gpu/drm/xe/xe_vm.h       |  9 ++++
 drivers/gpu/drm/xe/xe_vm_types.h | 12 +++++
 3 files changed, 79 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8bf7f62e6548..037ac42f74a5 100644
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
@@ -87,6 +83,18 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
 		vma->userptr.sg = NULL;
 	}
 
+	/* TODO: Convert to xe_assert() */
+	if (XE_WARN_ON(vma->userptr.pinned_pages)) {
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
@@ -97,11 +105,18 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
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
@@ -137,19 +152,24 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
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
@@ -160,9 +180,14 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
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
 
@@ -718,6 +743,11 @@ static bool vma_userptr_invalidate(struct mmu_interval_notifier *mni,
 		return false;
 
 	down_write(&vm->userptr.notifier_lock);
+	if (xe_vma_is_pinned(vma)) {
+		up_write(&vm->userptr.notifier_lock);
+		return true;
+	}
+
 	mmu_interval_set_seq(mni, cur_seq);
 
 	/* No need to stop gpu access if the userptr is not yet bound. */
@@ -976,10 +1006,16 @@ static void xe_vma_destroy_late(struct xe_vma *vma)
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

