Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E97881ADFD
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 05:28:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB0C210E65F;
	Thu, 21 Dec 2023 04:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287DB10E659;
 Thu, 21 Dec 2023 04:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703132903; x=1734668903;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1rEGLaIa6Lp3+PyRExYWC9Us9ul7CVpa3VN8xsGdX1g=;
 b=ZxYrzAe1HvOMPdGJWQdxchIFHshswZzV2+lgt+66MZvZKwvL9lm0grt+
 TNQAKA6dBGKBahMKn+HfE0UUKdAHMNH++823NaJ6S6mK03o1G4ykSWFVt
 2w+8134YoPfUYJ61GlTPShcqAIuAj1ChWDtiu6VnkxZftEeTytBkMylrR
 eDgp7ouVHSSdV6Jv9d93z2Ew0BIXiTMY8srlmqR/XuY5RJarmyLuyRFju
 VRO7lPAXkaSdBUlgWs6AvbhWlx+bsdY6r8fmyHvtW9MtyT6BMhGudv7As
 5ehKUjhyipUijoKCWa+aFKw6b8/O/LyJhBJyVlDeGqOy4KS0YukINNnVN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="427069775"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="427069775"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="805481382"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="805481382"
Received: from szeng-desk.jf.intel.com ([10.165.21.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 20:28:21 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 15/22] drm/xe/svm: Implement functions to register and
 unregister mmu notifier
Date: Wed, 20 Dec 2023 23:38:05 -0500
Message-Id: <20231221043812.3783313-16-oak.zeng@intel.com>
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

xe driver register mmu interval notifier to core mm to monitor vma
change. We register mmu interval notifier for each svm range. mmu
interval notifier should be unregistered in a worker (see next patch
in this series), so also initialize kernel worker to unregister mmu
interval notifier.

Signed-off-by: Oak Zeng <oak.zeng@intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.h       | 14 ++++++
 drivers/gpu/drm/xe/xe_svm_range.c | 73 +++++++++++++++++++++++++++++++
 2 files changed, 87 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 6b93055934f8..90e665f2bfc6 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -52,16 +52,28 @@ struct xe_svm {
  * struct xe_svm_range - Represents a shared virtual address range.
  */
 struct xe_svm_range {
+	/** @svm: pointer of the xe_svm that this range belongs to */
+	struct xe_svm *svm;
+
 	/** @notifier: The mmu interval notifer used to keep track of CPU
 	 * side address range change. Driver will get a callback with this
 	 * notifier if anything changed from CPU side, such as range is
 	 * unmapped from CPU
 	 */
 	struct mmu_interval_notifier notifier;
+	bool mmu_notifier_registered;
 	/** @start: start address of this range, inclusive */
 	u64 start;
 	/** @end: end address of this range, exclusive */
 	u64 end;
+	/** @vma: the corresponding vma of this svm range
+	 *  The relationship b/t vma and svm range is 1:N,
+	 *  which means one vma can be splitted into multiple
+	 *  @xe_svm_range while one @xe_svm_range can have
+	 *  only one vma. A N:N mapping means some complication
+	 *  in codes. Lets assume 1:N for now.
+	 */
+	struct vm_area_struct *vma;
 	/** @unregister_notifier_work: A worker used to unregister this notifier */
 	struct work_struct unregister_notifier_work;
 	/** @inode: used to link this range to svm's range_tree */
@@ -77,6 +89,8 @@ struct xe_svm_range *xe_svm_range_from_addr(struct xe_svm *svm,
 bool xe_svm_range_belongs_to_vma(struct mm_struct *mm,
 								struct xe_svm_range *range,
 								struct vm_area_struct *vma);
+void xe_svm_range_unregister_mmu_notifier(struct xe_svm_range *range);
+int xe_svm_range_register_mmu_notifier(struct xe_svm_range *range);
 
 int xe_svm_build_sg(struct hmm_range *range, struct sg_table *st);
 int xe_svm_devm_add(struct xe_tile *tile, struct xe_mem_region *mem);
diff --git a/drivers/gpu/drm/xe/xe_svm_range.c b/drivers/gpu/drm/xe/xe_svm_range.c
index b32c32f60315..286d5f7d6ecd 100644
--- a/drivers/gpu/drm/xe/xe_svm_range.c
+++ b/drivers/gpu/drm/xe/xe_svm_range.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/interval_tree.h>
+#include <linux/mmu_notifier.h>
 #include <linux/container_of.h>
 #include <linux/mm_types.h>
 #include <linux/mutex.h>
@@ -57,3 +58,75 @@ bool xe_svm_range_belongs_to_vma(struct mm_struct *mm,
 
 	return (vma1 == vma) && (vma2 == vma);
 }
+
+static const struct mmu_interval_notifier_ops xe_svm_mni_ops = {
+	.invalidate = NULL,
+};
+
+/**
+ * unregister a mmu interval notifier for a svm range
+ *
+ * @range: svm range
+ *
+ */
+void xe_svm_range_unregister_mmu_notifier(struct xe_svm_range *range)
+{
+	if (!range->mmu_notifier_registered)
+		return;
+
+	mmu_interval_notifier_remove(&range->notifier);
+	range->mmu_notifier_registered = false;
+}
+
+static void xe_svm_unregister_notifier_work(struct work_struct *work)
+{
+	struct xe_svm_range *range;
+
+	range = container_of(work, struct xe_svm_range, unregister_notifier_work);
+
+	xe_svm_range_unregister_mmu_notifier(range);
+
+	/**
+	 * This is called from mmu notifier MUNMAP event. When munmap is called,
+	 * this range is not valid any more. Remove it.
+	 */
+	mutex_lock(&range->svm->mutex);
+	interval_tree_remove(&range->inode, &range->svm->range_tree);
+	mutex_unlock(&range->svm->mutex);
+	kfree(range);
+}
+
+/**
+ * register a mmu interval notifier to monitor vma change
+ *
+ * @range: svm range to monitor
+ *
+ * This has to be called inside a mmap_read_lock
+ */
+int xe_svm_range_register_mmu_notifier(struct xe_svm_range *range)
+{
+	struct vm_area_struct *vma = range->vma;
+	struct mm_struct *mm = range->svm->mm;
+	u64 start, length;
+	int ret = 0;
+
+	if (range->mmu_notifier_registered)
+		return 0;
+
+	start =  range->start;
+	length = range->end - start;
+	/** We are inside a mmap_read_lock, but it requires a mmap_write_lock
+	 *  to register mmu notifier.
+	 */
+	mmap_read_unlock(mm);
+	mmap_write_lock(mm);
+	ret = mmu_interval_notifier_insert_locked(&range->notifier, vma->vm_mm,
+						start, length, &xe_svm_mni_ops);
+	mmap_write_downgrade(mm);
+	if (ret)
+		return ret;
+
+	INIT_WORK(&range->unregister_notifier_work, xe_svm_unregister_notifier_work);
+	range->mmu_notifier_registered = true;
+	return ret;
+}
-- 
2.26.3

