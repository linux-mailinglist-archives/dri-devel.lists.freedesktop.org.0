Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 679CAADE312
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 07:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6796B10E69F;
	Wed, 18 Jun 2025 05:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OZwEjJjY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1073110E35E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 05:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750224990; x=1781760990;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7pe1C3/18gXrbSK7Ga1vjic4Mv+FC0hczXd2d50b5hQ=;
 b=OZwEjJjYQP2+gNfMPp64tX4mjp8Qcj3Gi2RMjJfmAIuRISrxr18z4+Cx
 aOVpaxUrKxlEZi+TzFmmSPI8DKPnLrwYWNOqXT9GnEd02o42opON1efuM
 wETatqQGw2FNZzt6gpBXYZnfkXTDRtOza2GOzgblKJRSXZl4oZKq3s1hP
 kGFEzNadVy7WKKyWHTKa1ZlnRo1B3/NYkumx6CKUPh8vs6FNSFkTofnGB
 01nN0VWr0StdJfKFMzSTstQgoRlZLec9Ir1QfbPr3GS3T8ksN0hymaseB
 hsbx/lKMN+TgNGml8l3okovCLuoaXN7F9MTw5OOIJHEJ/2D1zhfsi9WmP Q==;
X-CSE-ConnectionGUID: yl7uH+6gRRSSC0JK8gZTiQ==
X-CSE-MsgGUID: fwgw7vFMR8eR6nzlPAIcpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="74960319"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="74960319"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 22:36:29 -0700
X-CSE-ConnectionGUID: TIPs7cIBQ36gdUVvR36mug==
X-CSE-MsgGUID: xnaHIO6jQTmsOOAzJjZdGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="149052937"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 22:36:28 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 2/3] mm/memfd: Reserve hugetlb folios before allocation
Date: Tue, 17 Jun 2025 22:30:54 -0700
Message-ID: <20250618053415.1036185-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618053415.1036185-1-vivek.kasireddy@intel.com>
References: <20250618053415.1036185-1-vivek.kasireddy@intel.com>
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

When we try to allocate a folio via alloc_hugetlb_folio_reserve(),
we need to ensure that there is an active reservation associated
with the allocation. Otherwise, our allocation request would fail
if there are no active reservations made at that moment against any
other allocations. This is because alloc_hugetlb_folio_reserve()
checks h->resv_huge_pages before proceeding with the allocation.

Therefore, to address this issue, we just need to make a reservation
(by calling hugetlb_reserve_pages()) before we try to allocate the
folio. This will also ensure that proper region/subpool accounting is
done associated with our allocation.

Cc: Steve Sistare <steven.sistare@oracle.com>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/linux/hugetlb.h |  5 +++++
 mm/hugetlb.c            |  5 -----
 mm/memfd.c              | 17 ++++++++++++++---
 3 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index d8310b0f36dd..c6c87eae4a8d 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -740,6 +740,11 @@ extern unsigned int default_hstate_idx;
 
 #define default_hstate (hstates[default_hstate_idx])
 
+static inline struct hugepage_subpool *subpool_inode(struct inode *inode)
+{
+	return HUGETLBFS_SB(inode->i_sb)->spool;
+}
+
 static inline struct hugepage_subpool *hugetlb_folio_subpool(struct folio *folio)
 {
 	return folio->_hugetlb_subpool;
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 6b34152744cc..57d85af6db3f 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -284,11 +284,6 @@ static long hugepage_subpool_put_pages(struct hugepage_subpool *spool,
 	return ret;
 }
 
-static inline struct hugepage_subpool *subpool_inode(struct inode *inode)
-{
-	return HUGETLBFS_SB(inode->i_sb)->spool;
-}
-
 static inline struct hugepage_subpool *subpool_vma(struct vm_area_struct *vma)
 {
 	return subpool_inode(file_inode(vma->vm_file));
diff --git a/mm/memfd.c b/mm/memfd.c
index ab367e61553d..2c861a7ac345 100644
--- a/mm/memfd.c
+++ b/mm/memfd.c
@@ -71,7 +71,6 @@ struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
 #ifdef CONFIG_HUGETLB_PAGE
 	struct folio *folio;
 	gfp_t gfp_mask;
-	int err;
 
 	if (is_file_hugepages(memfd)) {
 		/*
@@ -80,12 +79,19 @@ struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
 		 * alloc from. Also, the folio will be pinned for an indefinite
 		 * amount of time, so it is not expected to be migrated away.
 		 */
+		struct inode *inode = file_inode(memfd);
 		struct hstate *h = hstate_file(memfd);
+		int err = -ENOMEM;
+		long nr_resv;
 
 		gfp_mask = htlb_alloc_mask(h);
 		gfp_mask &= ~(__GFP_HIGHMEM | __GFP_MOVABLE);
 		idx >>= huge_page_order(h);
 
+		nr_resv = hugetlb_reserve_pages(inode, idx, idx + 1, NULL, 0);
+		if (nr_resv < 0)
+			return ERR_PTR(nr_resv);
+
 		folio = alloc_hugetlb_folio_reserve(h,
 						    numa_node_id(),
 						    NULL,
@@ -96,12 +102,17 @@ struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
 							idx);
 			if (err) {
 				folio_put(folio);
-				return ERR_PTR(err);
+				goto err_unresv;
 			}
+
+			hugetlb_set_folio_subpool(folio, subpool_inode(inode));
 			folio_unlock(folio);
 			return folio;
 		}
-		return ERR_PTR(-ENOMEM);
+err_unresv:
+		if (nr_resv > 0)
+			hugetlb_unreserve_pages(inode, idx, idx + 1, 0);
+		return ERR_PTR(err);
 	}
 #endif
 	return shmem_read_folio(memfd->f_mapping, idx);
-- 
2.49.0

