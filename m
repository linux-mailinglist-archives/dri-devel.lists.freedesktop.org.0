Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A2CAEA627
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 21:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEC810E8F5;
	Thu, 26 Jun 2025 19:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H3/mZdPV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E288C10E900
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 19:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750965180; x=1782501180;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FndfxWS1YeFWxReAAV8nrkQod2f/3VNZrcZSbE2kFYk=;
 b=H3/mZdPVwDvMWDYY5OrQfV6/623ArtCqUWHwof7oCWGhXkKJsR37T0FT
 WO95mJhAxPPaJtvYHhlHdvmo0ex3Ok/hDylEO4qWwBdlQ+xt8CrXNIs1W
 E2lIOmew1apQ1GXBkrfRczYv2dXWx2RVQ+0j6oVup2KR67+Pu98HzLQf5
 9N+13P+Lvsy4WQdVcPKXkSIIraeM8RkAMk63dm6wC16nEP8SkdIEOdu+w
 eNMmXoUqrmIqV39rinB+FxZbd32LjVnOkRstEJdeTkYNHhGad+jUwfLb9
 UdhD1U4RwJ67WRAaXbFSeQ5eCZFQijPeBTjrvAY9b76Vq1sIoD4l8loPA w==;
X-CSE-ConnectionGUID: VFWBvDdjRpWTkRVjqcincA==
X-CSE-MsgGUID: NZCXgoPXSxa8JCY8FvpEeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="70706655"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="70706655"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 12:12:59 -0700
X-CSE-ConnectionGUID: Bi2FFmnQSvO1JnUYCtDxaA==
X-CSE-MsgGUID: SPY3scn5QcKvwcyVrjAnmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; d="scan'208";a="156628635"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 12:12:59 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com,
 Steve Sistare <steven.sistare@oracle.com>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v2] mm/hugetlb: Don't crash when allocating a folio if there
 are no resv
Date: Thu, 26 Jun 2025 12:11:16 -0700
Message-ID: <20250626191116.1377761-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.49.0
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
but there is a chance that we might encounter a fatal crash/failure
(VM_BUG_ON(!h->resv_huge_pages) in alloc_hugetlb_folio_reserve()) if
there are no active reservations at that instant. This issue was
reported by syzbot:

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

Therefore, prevent the above crash by removing the VM_BUG_ON()
as there is no need to crash the system in this situation and
instead we could just fail the allocation request.

Furthermore, as described above, the specific situation where this
happens is when we try to pin memfd folios before they are faulted-in.
Although, this is a valid thing to do, it is not the regular or the
common use-case. Let us consider the following scenarios:

1) hugetlbfs_file_mmap()
    memfd_alloc_folio()
    hugetlb_fault()

2) memfd_alloc_folio()
    hugetlbfs_file_mmap()
    hugetlb_fault()

3) hugetlbfs_file_mmap()
    hugetlb_fault()
        alloc_hugetlb_folio()

3) is the most common use-case where first a memfd is allocated
followed by mmap(), user writes/updates and then the relevant folios
are pinned (memfd_pin_folios()). The BUG this patch is fixing occurs
in 2) because we try to pin the folios before hugetlbfs_file_mmap()
is called. So, in this situation we try to allocate the folios
before pinning them but since we did not make any reservations,
resv_huge_pages would be 0, leading to this issue.

---
v1 -> v2:
- Remove the WARN_ON_ONCE in alloc_hugetlb_folio_reserve() if
  resv_huge_pages is 0 and instead just return NULL to indicate that
  that the allocation failed. Otherwise, tools such as Syzbot would
  continue to report this as a bug. Additionally, since this issue
  occurs during a situation that is not very common as described in
  the commit message, it probably does not make sense to emit the
  warning.

Fixes: 26a8ea80929c ("mm/hugetlb: fix memfd_pin_folios resv_huge_pages leak")
Reported-by: syzbot+a504cb5bae4fe117ba94@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=a504cb5bae4fe117ba94
Closes: https://lore.kernel.org/all/677928b5.050a0220.3b53b0.004d.GAE@google.com/T/
Cc: Steve Sistare <steven.sistare@oracle.com>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Oscar Salvador <osalvador@suse.de>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 mm/hugetlb.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 8746ed2fec13..a181c55f268b 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -2340,12 +2340,15 @@ struct folio *alloc_hugetlb_folio_reserve(struct hstate *h, int preferred_nid,
 	struct folio *folio;
 
 	spin_lock_irq(&hugetlb_lock);
+	if (!h->resv_huge_pages) {
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
-- 
2.49.0

