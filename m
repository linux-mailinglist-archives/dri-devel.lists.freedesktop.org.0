Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E074A1022E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 09:38:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D849310E449;
	Tue, 14 Jan 2025 08:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eMFeKPPJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E27F10E880
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 08:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736843891; x=1768379891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AGr3HND4zgilxVnk1lyq4l3ZnqiUJy/LoPlwt7ZEFYA=;
 b=eMFeKPPJvcWjOsrGxXyHO5vjpJovPf5DC8aL0nr2Fb9rX5+2EXHKfss4
 Vp8McXuiSA/gI6OiTdLNrAt7IQxZgnJ7/Lh5lmrOrMuXKHp7RbRzESHaB
 o+q8QNSC6AG3jcl+jULb1KmMWrRSS1KtpHpTrvEDr4kZ2VHMuLDl9nef9
 IIro6BjLe3cOSpIKm5cofRHK2U3i4sDosz0bECH0cqx0Sp0CSC+dpaFIH
 N7RxJc5GZ0s5cnajWk7LjEbPTHl1D3qx4L6WataRiH50PMWognQeea3Et
 9QiKqpEpRkg+lxLuR03pPCuMInZlVvZ2EJPtIo+Km1mrwwwdqM5EU41HE A==;
X-CSE-ConnectionGUID: lddrZ779TZ2w4amha9Iafg==
X-CSE-MsgGUID: lChK9EYgSUG1mCQDAm+WBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36418229"
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; d="scan'208";a="36418229"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 00:38:10 -0800
X-CSE-ConnectionGUID: wkVOiRxRTka7a4K9WUv16Q==
X-CSE-MsgGUID: 2HrSYbVTTZa1Ve8SNlQiXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; d="scan'208";a="105251577"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 00:38:10 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com,
 Steve Sistare <steven.sistare@oracle.com>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 1/2] mm/memfd: reserve hugetlb folios before allocation
Date: Tue, 14 Jan 2025 00:08:00 -0800
Message-ID: <20250114080927.2616684-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250114080927.2616684-1-vivek.kasireddy@intel.com>
References: <20250114080927.2616684-1-vivek.kasireddy@intel.com>
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

There are cases when we try to pin a folio but discover that it has
not been faulted-in. So, we try to allocate it in memfd_alloc_folio()
but there is a chance that we might encounter a crash/failure
(VM_BUG_ON(!h->resv_huge_pages)) if there are no active reservations
at that instant. This issue was reported by syzbot:

kernel BUG at mm/hugetlb.c:2403!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 5315 Comm: syz.0.0 Not tainted
6.13.0-rc5-syzkaller-00161-g63676eefb7a0 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:alloc_hugetlb_folio_reserve+0xbc/0xc0 mm/hugetlb.c:2403
Code: 1f eb 05 e8 56 18 a0 ff 48 c7 c7 40 56 61 8e e8 ba 21 cc 09 4c 89
f0 5b 41 5c 41 5e 41 5f 5d c3 cc cc cc cc e8 35 18 a0 ff 90 <0f> 0b 66
90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f
RSP: 0018:ffffc9000d3d77f8 EFLAGS: 00010087
RAX: ffffffff81ff6beb RBX: 0000000000000000 RCX: 0000000000100000
RDX: ffffc9000e51a000 RSI: 00000000000003ec RDI: 00000000000003ed
RBP: 1ffffffff34810d9 R08: ffffffff81ff6ba3 R09: 1ffffd4000093005
R10: dffffc0000000000 R11: fffff94000093006 R12: dffffc0000000000
R13: dffffc0000000000 R14: ffffea0000498000 R15: ffffffff9a4086c8
FS:  00007f77ac12e6c0(0000) GS:ffff88801fc00000(0000)
knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f77ab54b170 CR3: 0000000040b70000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 memfd_alloc_folio+0x1bd/0x370 mm/memfd.c:88
 memfd_pin_folios+0xf10/0x1570 mm/gup.c:3750
 udmabuf_pin_folios drivers/dma-buf/udmabuf.c:346 [inline]
 udmabuf_create+0x70e/0x10c0 drivers/dma-buf/udmabuf.c:443
 udmabuf_ioctl_create drivers/dma-buf/udmabuf.c:495 [inline]
 udmabuf_ioctl+0x301/0x4e0 drivers/dma-buf/udmabuf.c:526
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl+0xf5/0x170 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Therefore, to avoid this situation and fix this issue, we just need
to make a reservation (by calling hugetlb_reserve_pages()) before
we try to allocate the folio. This will ensure that we are properly
doing region/subpool accounting associated with our allocation.

While at it, move subpool_inode() into hugetlb header and also
replace the VM_BUG_ON() with WARN_ON_ONCE() as there is no need to
crash the system in this scenario and instead we could just warn
and fail the allocation.

Fixes: 26a8ea80929c ("mm/hugetlb: fix memfd_pin_folios resv_huge_pages leak")
Reported-by: syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: Steve Sistare <steven.sistare@oracle.com>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 include/linux/hugetlb.h |  5 +++++
 mm/hugetlb.c            | 14 ++++++--------
 mm/memfd.c              | 14 +++++++++++---
 3 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index ae4fe8615bb6..38c580548564 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -712,6 +712,11 @@ extern unsigned int default_hstate_idx;
 
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
index c498874a7170..ef948f56b864 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -251,11 +251,6 @@ static long hugepage_subpool_put_pages(struct hugepage_subpool *spool,
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
@@ -2397,12 +2392,15 @@ struct folio *alloc_hugetlb_folio_reserve(struct hstate *h, int preferred_nid,
 	struct folio *folio;
 
 	spin_lock_irq(&hugetlb_lock);
+	if (WARN_ON_ONCE(!h->resv_huge_pages)) {
+		spin_unlock_irq(&hugetlb_lock);
+		return NULL;
+	}
+
 	folio = dequeue_hugetlb_folio_nodemask(h, gfp_mask, preferred_nid,
 					       nmask);
-	if (folio) {
-		VM_BUG_ON(!h->resv_huge_pages);
+	if (folio)
 		h->resv_huge_pages--;
-	}
 
 	spin_unlock_irq(&hugetlb_lock);
 	return folio;
diff --git a/mm/memfd.c b/mm/memfd.c
index 35a370d75c9a..0d128c44fb78 100644
--- a/mm/memfd.c
+++ b/mm/memfd.c
@@ -70,7 +70,7 @@ struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
 #ifdef CONFIG_HUGETLB_PAGE
 	struct folio *folio;
 	gfp_t gfp_mask;
-	int err;
+	int err = -ENOMEM;
 
 	if (is_file_hugepages(memfd)) {
 		/*
@@ -79,12 +79,16 @@ struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
 		 * alloc from. Also, the folio will be pinned for an indefinite
 		 * amount of time, so it is not expected to be migrated away.
 		 */
+		struct inode *inode = file_inode(memfd);
 		struct hstate *h = hstate_file(memfd);
 
 		gfp_mask = htlb_alloc_mask(h);
 		gfp_mask &= ~(__GFP_HIGHMEM | __GFP_MOVABLE);
 		idx >>= huge_page_order(h);
 
+		if (!hugetlb_reserve_pages(inode, idx, idx + 1, NULL, 0))
+			return ERR_PTR(err);
+
 		folio = alloc_hugetlb_folio_reserve(h,
 						    numa_node_id(),
 						    NULL,
@@ -95,12 +99,16 @@ struct folio *memfd_alloc_folio(struct file *memfd, pgoff_t idx)
 							idx);
 			if (err) {
 				folio_put(folio);
-				return ERR_PTR(err);
+				goto err;
 			}
+
+			hugetlb_set_folio_subpool(folio, subpool_inode(inode));
 			folio_unlock(folio);
 			return folio;
 		}
-		return ERR_PTR(-ENOMEM);
+err:
+		hugetlb_unreserve_pages(inode, idx, idx + 1, 0);
+		return ERR_PTR(err);
 	}
 #endif
 	return shmem_read_folio(memfd->f_mapping, idx);
-- 
2.47.1

