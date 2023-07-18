Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5138D75770E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 10:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9953210E2FA;
	Tue, 18 Jul 2023 08:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1608510E2FA
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 08:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689670225; x=1721206225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ytZGfVs0FjX73uMwB3S3VLJpXAwmQPIgbbtxJr4xh/I=;
 b=Pidz3hwOmwx9GASUaZdQfBdeQvce706ENWchXuHQadrkiQxkvpF3aoKA
 VBMheCr5ciwtzFAP4Fdky0oZaKrQVD5D/H2L/zjqkid6GAUNSXgoSLDiL
 ZKQ+QLOObkzbglVuEOMydtq3HvQtUIyddD/fRicQd0Ol3OaVXuvA7PUW9
 cvAyiWjJTD/8/A8EMqXwMpgP8QQXwEi4DgdCrtEmMDan3m1ppeIJdPebv
 JqOpml8VG948p+mnWrQT/PqFz04SedUilV1ViEjh0AA4VvlX19w3KUq4g
 JTJFiBPp6uNpMX2Tp05TghErckIiWfgs2o42wJevYTDQqdZ5jAfjtYNe5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="363616482"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; d="scan'208";a="363616482"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 01:50:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="837205682"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; d="scan'208";a="837205682"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 01:50:23 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping updates
 (new pages)
Date: Tue, 18 Jul 2023 01:28:56 -0700
Message-Id: <20230718082858.1570809-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718082858.1570809-1-vivek.kasireddy@intel.com>
References: <20230718082858.1570809-1-vivek.kasireddy@intel.com>
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
Cc: Dongwon Kim <dongwon.kim@intel.com>, David Hildenbrand <david@redhat.com>,
 Junxiao Chang <junxiao.chang@intel.com>, Hugh Dickins <hughd@google.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, there does not appear to be any mechanism for letting
drivers or other kernel entities know about updates made in a
mapping particularly when a new page is faulted in. Providing
notifications for such situations is really useful when using
memfds backed by ram-based filesystems such as shmem or hugetlbfs
that also allow FALLOC_FL_PUNCH_HOLE.

More specifically, when a hole is punched in a memfd (that is
backed by shmem or hugetlbfs), a driver can register for
notifications associated with range invalidations. However, it
would also be useful to have notifications when new pages are
faulted in as a result of writes made to the mapping region that
overlaps with a previously punched hole.

Cc: David Hildenbrand <david@redhat.com>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Hugh Dickins <hughd@google.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Junxiao Chang <junxiao.chang@intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/linux/mmu_notifier.h | 27 +++++++++++++++++++++++++++
 mm/hugetlb.c                 |  9 ++++++++-
 mm/mmu_notifier.c            | 17 +++++++++++++++++
 mm/shmem.c                   |  7 ++++++-
 4 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index 64a3e051c3c4..218ddc3b4bc7 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -131,6 +131,16 @@ struct mmu_notifier_ops {
 			   unsigned long address,
 			   pte_t pte);
 
+	/*
+	 * update_mapping is called when a page is replaced (at a given offset)
+	 * in a mapping backed by shmem or hugetlbfs. The new page's pfn will
+	 * be contained in the pfn field.
+	 */
+	void (*update_mapping)(struct mmu_notifier *subscription,
+			       struct mm_struct *mm,
+			       unsigned long address,
+			       unsigned long pfn);
+
 	/*
 	 * invalidate_range_start() and invalidate_range_end() must be
 	 * paired and are called only when the mmap_lock and/or the
@@ -394,6 +404,9 @@ extern int __mmu_notifier_test_young(struct mm_struct *mm,
 				     unsigned long address);
 extern void __mmu_notifier_change_pte(struct mm_struct *mm,
 				      unsigned long address, pte_t pte);
+extern void __mmu_notifier_update_mapping(struct mm_struct *mm,
+					  unsigned long address,
+					  unsigned long pfn);
 extern int __mmu_notifier_invalidate_range_start(struct mmu_notifier_range *r);
 extern void __mmu_notifier_invalidate_range_end(struct mmu_notifier_range *r,
 				  bool only_end);
@@ -447,6 +460,14 @@ static inline void mmu_notifier_change_pte(struct mm_struct *mm,
 		__mmu_notifier_change_pte(mm, address, pte);
 }
 
+static inline void mmu_notifier_update_mapping(struct mm_struct *mm,
+					       unsigned long address,
+					       unsigned long pfn)
+{
+	if (mm_has_notifiers(mm))
+		__mmu_notifier_update_mapping(mm, address, pfn);
+}
+
 static inline void
 mmu_notifier_invalidate_range_start(struct mmu_notifier_range *range)
 {
@@ -695,6 +716,12 @@ static inline void mmu_notifier_change_pte(struct mm_struct *mm,
 {
 }
 
+static inline void mmu_notifier_update_mapping(struct mm_struct *mm,
+					       unsigned long address,
+					       unsigned long pfn)
+{
+}
+
 static inline void
 mmu_notifier_invalidate_range_start(struct mmu_notifier_range *range)
 {
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 64a3239b6407..1f2f0209101a 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6096,8 +6096,12 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 		 * hugetlb_no_page will drop vma lock and hugetlb fault
 		 * mutex internally, which make us return immediately.
 		 */
-		return hugetlb_no_page(mm, vma, mapping, idx, address, ptep,
+		ret = hugetlb_no_page(mm, vma, mapping, idx, address, ptep,
 				      entry, flags);
+		if (!ret)
+			mmu_notifier_update_mapping(vma->vm_mm, address,
+						    pte_pfn(*ptep));
+		return ret;
 
 	ret = 0;
 
@@ -6223,6 +6227,9 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 	 */
 	if (need_wait_lock)
 		folio_wait_locked(folio);
+	if (!ret)
+		mmu_notifier_update_mapping(vma->vm_mm, address,
+					    pte_pfn(*ptep));
 	return ret;
 }
 
diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
index 50c0dde1354f..6421405334b9 100644
--- a/mm/mmu_notifier.c
+++ b/mm/mmu_notifier.c
@@ -441,6 +441,23 @@ void __mmu_notifier_change_pte(struct mm_struct *mm, unsigned long address,
 	srcu_read_unlock(&srcu, id);
 }
 
+void __mmu_notifier_update_mapping(struct mm_struct *mm, unsigned long address,
+				   unsigned long pfn)
+{
+	struct mmu_notifier *subscription;
+	int id;
+
+	id = srcu_read_lock(&srcu);
+	hlist_for_each_entry_rcu(subscription,
+				 &mm->notifier_subscriptions->list, hlist,
+				 srcu_read_lock_held(&srcu)) {
+		if (subscription->ops->update_mapping)
+			subscription->ops->update_mapping(subscription, mm,
+							  address, pfn);
+	}
+	srcu_read_unlock(&srcu, id);
+}
+
 static int mn_itree_invalidate(struct mmu_notifier_subscriptions *subscriptions,
 			       const struct mmu_notifier_range *range)
 {
diff --git a/mm/shmem.c b/mm/shmem.c
index 2f2e0e618072..e59eb5fafadb 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -77,6 +77,7 @@ static struct vfsmount *shm_mnt;
 #include <linux/fcntl.h>
 #include <uapi/linux/memfd.h>
 #include <linux/rmap.h>
+#include <linux/mmu_notifier.h>
 #include <linux/uuid.h>
 
 #include <linux/uaccess.h>
@@ -2164,8 +2165,12 @@ static vm_fault_t shmem_fault(struct vm_fault *vmf)
 				  gfp, vma, vmf, &ret);
 	if (err)
 		return vmf_error(err);
-	if (folio)
+	if (folio) {
 		vmf->page = folio_file_page(folio, vmf->pgoff);
+		if (ret == VM_FAULT_LOCKED)
+			mmu_notifier_update_mapping(vma->vm_mm, vmf->address,
+						    page_to_pfn(vmf->page));
+	}
 	return ret;
 }
 
-- 
2.39.2

