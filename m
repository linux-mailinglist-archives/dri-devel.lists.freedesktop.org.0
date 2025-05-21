Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC66ABEB3D
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 07:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6139910E5F0;
	Wed, 21 May 2025 05:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dIS8HPpX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2400B10E5F7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 05:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747805007; x=1779341007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l31XNRo8KI41uE4zOhXFi6rKnP37VgXQ4y+S+FAKKPc=;
 b=dIS8HPpXyoizHASFsjv/9Qo0ZnE8HuP5dhm0KI331QdUzbXHKv66Bul9
 w4IxFalm7B6KpfFOU60W3XcdFcJtX7X2Q5ar/NRkDMcMqmehX7I1NWM5o
 5JehYo0AzVyLv7iJeVsMglBfVDqqFrMuadVe4B0skr2dTRoagd30NL0zB
 130ihzAcepHDUx51RuQbP2It/btZ67EFGuuC5ExiP3HduW7hIs10z79yD
 RFrFjrLaQPq+kRM4mYBDwBAI11AC26hjiVcfCMSPWVb253PmnQNvti071
 ZczOpFoAs0bacmoEfZzXVnmtUVJNrraFPnf9jCJFPAoGIBJ7w9DdZAqUi A==;
X-CSE-ConnectionGUID: frtJregMQDi+9IXPhoiHOA==
X-CSE-MsgGUID: 9oe9eYJwQOmtws+m9DPODg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49638993"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="49638993"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 22:23:24 -0700
X-CSE-ConnectionGUID: 4TUVXEbDRxm1SXeutiiJ5g==
X-CSE-MsgGUID: mf16ue/6RlCpTs5bL9k1dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="163188662"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 22:23:23 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 1/3] mm/hugetlb: Make hugetlb_reserve_pages() return nr of
 entries updated
Date: Tue, 20 May 2025 22:19:35 -0700
Message-ID: <20250521052119.1105530-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250521052119.1105530-1-vivek.kasireddy@intel.com>
References: <20250521052119.1105530-1-vivek.kasireddy@intel.com>
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

Currently, hugetlb_reserve_pages() returns a bool to indicate whether
the reservation map update for the range [from, to] was successful or
not. This is not sufficient for the case where the caller needs to
determine how many entries were updated for the range.

Therefore, have hugetlb_reserve_pages() return the number of entries
updated in the reservation map associated with the range [from, to].
Also, update the callers of hugetlb_reserve_pages() to handle the new
return value.

Cc: Steve Sistare <steven.sistare@oracle.com>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 fs/hugetlbfs/inode.c    |  8 ++++----
 include/linux/hugetlb.h |  2 +-
 mm/hugetlb.c            | 19 +++++++++++++------
 3 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index e4de5425838d..00b2d1a032fd 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -150,10 +150,10 @@ static int hugetlbfs_file_mmap(struct file *file, struct vm_area_struct *vma)
 	if (inode->i_flags & S_PRIVATE)
 		vm_flags |= VM_NORESERVE;
 
-	if (!hugetlb_reserve_pages(inode,
+	if (hugetlb_reserve_pages(inode,
 				vma->vm_pgoff >> huge_page_order(h),
 				len >> huge_page_shift(h), vma,
-				vm_flags))
+				vm_flags) < 0)
 		goto out;
 
 	ret = 0;
@@ -1561,9 +1561,9 @@ struct file *hugetlb_file_setup(const char *name, size_t size,
 	inode->i_size = size;
 	clear_nlink(inode);
 
-	if (!hugetlb_reserve_pages(inode, 0,
+	if (hugetlb_reserve_pages(inode, 0,
 			size >> huge_page_shift(hstate_inode(inode)), NULL,
-			acctflag))
+			acctflag) < 0)
 		file = ERR_PTR(-ENOMEM);
 	else
 		file = alloc_file_pseudo(inode, mnt, name, O_RDWR,
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 8f3ac832ee7f..793d8390d3e4 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -148,7 +148,7 @@ int hugetlb_mfill_atomic_pte(pte_t *dst_pte,
 			     uffd_flags_t flags,
 			     struct folio **foliop);
 #endif /* CONFIG_USERFAULTFD */
-bool hugetlb_reserve_pages(struct inode *inode, long from, long to,
+long hugetlb_reserve_pages(struct inode *inode, long from, long to,
 						struct vm_area_struct *vma,
 						vm_flags_t vm_flags);
 long hugetlb_unreserve_pages(struct inode *inode, long start, long end,
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 7ae38bfb9096..cba9d60a4e28 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -7241,8 +7241,15 @@ long hugetlb_change_protection(struct vm_area_struct *vma,
 	return pages > 0 ? (pages << h->order) : pages;
 }
 
-/* Return true if reservation was successful, false otherwise.  */
-bool hugetlb_reserve_pages(struct inode *inode,
+/*
+ * Update the reservation map for the range [from, to].
+ *
+ * Returns the number of entries that would be added to the reservation map
+ * associated with the range [from, to].  This number is greater or equal to
+ * zero. -EINVAL or -ENOMEM is returned in case of any errors.
+ */
+
+long hugetlb_reserve_pages(struct inode *inode,
 					long from, long to,
 					struct vm_area_struct *vma,
 					vm_flags_t vm_flags)
@@ -7257,7 +7264,7 @@ bool hugetlb_reserve_pages(struct inode *inode,
 	/* This should never happen */
 	if (from > to) {
 		VM_WARN(1, "%s called with a negative range\n", __func__);
-		return false;
+		return -EINVAL;
 	}
 
 	/*
@@ -7272,7 +7279,7 @@ bool hugetlb_reserve_pages(struct inode *inode,
 	 * without using reserves
 	 */
 	if (vm_flags & VM_NORESERVE)
-		return true;
+		return 0;
 
 	/*
 	 * Shared mappings base their reservation on the number of pages that
@@ -7379,7 +7386,7 @@ bool hugetlb_reserve_pages(struct inode *inode,
 			hugetlb_cgroup_put_rsvd_cgroup(h_cg);
 		}
 	}
-	return true;
+	return chg;
 
 out_put_pages:
 	spool_resv = chg - gbl_reserve;
@@ -7407,7 +7414,7 @@ bool hugetlb_reserve_pages(struct inode *inode,
 		kref_put(&resv_map->refs, resv_map_release);
 		set_vma_resv_map(vma, NULL);
 	}
-	return false;
+	return chg < 0 ? chg : add < 0 ? add : -EINVAL;
 }
 
 long hugetlb_unreserve_pages(struct inode *inode, long start, long end,
-- 
2.49.0

