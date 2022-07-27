Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D15D58334A
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 21:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA57C8B1B4;
	Wed, 27 Jul 2022 19:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB33491928
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 19:15:55 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 6EF8832210A;
 Wed, 27 Jul 2022 20:15:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1658949353; bh=fDNM1EfhMSR7Cw1oq4fZRt3P7rh7g46DE/zY9bHZqlA=;
 h=From:To:Cc:Subject:Date:From;
 b=KEGwKYurTeFL3ZDo5YWGRYjweJm2eVRsxpOlnZVsSiwBzOk7iWCYqg/rxGL47SSGW
 6c7Q5uZVx5T1j/5EAzaDPAAtcXy/9kLW0alJ3QqN5eXc8unEvcttnz10HhgDzay97x
 ajjlGFpSho1WG7UqEeY/n1BSt2Ofb5jr2fwK5FGZP94vJy9Fc76lwrvXUrv19bhwiP
 hirhtX+R939fvG12SKq/DB2K0gf6v8lMzqFU6oZGnWB1B6Y647H8iCw2u57her2pT0
 GvzSywIB0TJUV3YQQF+PuIDqdn2DwwYVyCSpFFNudxDypNHE2w/bYHWaLWBrcEHKLf
 M3WssJ+/TYaSQ==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] mm: Fix a null ptr deref with CONFIG_DEBUG_VM enabled in
 wp_page_reuse
Date: Wed, 27 Jul 2022 15:14:07 -0400
Message-Id: <20220727191407.1768600-1-zack@kde.org>
X-Mailer: git-send-email 2.34.1
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: Miaohe Lin <linmiaohe@huawei.com>, Jan Kara <jack@suse.cz>,
 David Hildenbrand <david@redhat.com>, NeilBrown <neilb@suse.de>,
 Yang Shi <shy828301@gmail.com>, banackm@vmware.com,
 Michal Hocko <mhocko@kernel.org>, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, Khalid Aziz <khalid.aziz@oracle.com>,
 Don Dutile <ddutile@redhat.com>, Liang Zhang <zhangliang5@huawei.com>,
 Christoph Hellwig <hch@lst.de>, mombasawalam@vmware.com,
 Andrea Arcangeli <aarcange@redhat.com>, Minchan Kim <minchan@kernel.org>,
 Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Jason Gunthorpe <jgg@nvidia.com>,
 David Rientjes <rientjes@google.com>,
 Pedro Demarchi Gomes <pedrodemargomes@gmail.com>, Jann Horn <jannh@google.com>,
 John Hubbard <jhubbard@nvidia.com>, Shakeel Butt <shakeelb@google.com>,
 Peter Xu <peterx@redhat.com>, Muchun Song <songmuchun@bytedance.com>,
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Hongchen Zhang <zhanghongchen@loongson.cn>, Oleg Nesterov <oleg@redhat.com>,
 krastevm@vmware.com, Nadav Amit <namit@vmware.com>,
 Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Write page faults on last references might not have a valid page anymore.
wp_page_reuse has always dealt with that scenario by making
sure the page isn't null (or the reference was shared) before doing
anything with it. Recently added checks in VM_BUG_ON (enabled by the
CONFIG_DEBUG_VM option) use PageAnon helpers which assume the passed
page is never null, before making sure there is a valid page to work
with.

Move the VM_BUG_ON, which unconditionally uses the page, after the
code that checks that we have a valid one.

Fixes a kernel oops, which is easy to reproduce with 3D apps on arm64 and
x86 on kernels with CONFIG_DEBUG_VM set:

Unable to handle kernel paging request at virtual address dfff800000000001
KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
Mem abort info:
  ESR = 0x0000000096000004
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x04: level 0 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000004
  CM = 0, WnR = 0
[dfff800000000001] address between user and kernel address ranges
Internal error: Oops: 96000004 [#1] SMP
CPU: 0 PID: 2396 Comm: Xwayland Tainted: G     U            5.19.0-rc2-vmwgfx #28
Hardware name: VMware, Inc. VMware20,1/VBSA, BIOS VMW201.00V.20138482.BA64.2207201941 07/20/2022
pstate: 10400005 (nzcV daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : _compound_head+0x24/0xd0
lr : wp_page_reuse+0x8c/0x544
sp : ffff800013637aa0
x29: ffff800013637aa0 x28: ffff00002a28b730 x27: ffff800013637cc8
x26: 0000000000000000 x25: ffff800013637d00 x24: ffff00000c742168
x23: 1ffff000026c6fa0 x22: ffff000013ce59a0 x21: ffff00002a28b730
x20: 0000000000000000 x19: 0000000000000000 x18: 0000000000000000
x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
x14: 1ffff000026c6f22 x13: 65676170206c6c75 x12: ffff600019dc772f
x11: 1fffe00019dc772e x10: ffff600019dc772e x9 : ffff8000085b1a78
x8 : ffff0000cee3b977 x7 : 0000000000000001 x6 : ffff600019dc772e
x5 : ffff0000cee3b970 x4 : ffff600019dc772f x3 : 1ffff000026c6f99
x2 : 0000000000000001 x1 : dfff800000000000 x0 : 0000000000000008
Call trace:
 _compound_head+0x24/0xd0
 wp_page_reuse+0x8c/0x544
 finish_mkwrite_fault+0x1a0/0x274
 do_wp_page+0x6cc/0x1000
 __handle_mm_fault+0xdc8/0x2620
 handle_mm_fault+0x21c/0x530
 do_page_fault+0x250/0xa40
 do_mem_abort+0x78/0x1b4
 el0_da+0x80/0x1c0
 el0t_64_sync_handler+0xf8/0x140
 el0t_64_sync+0x1a0/0x1a4
Code: aa0003f3 91002000 f2fbffe1 d343fc02 (38e16841)
---[ end trace 0000000000000000 ]---

Fixes: 6c287605fd56 ("mm: remember exclusively mapped anonymous pages with PG_anon_exclusive")
Signed-off-by: Zack Rusin <zackr@vmware.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Andrea Arcangeli <aarcange@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: David Rientjes <rientjes@google.com>
Cc: Don Dutile <ddutile@redhat.com>
Cc: Hugh Dickins <hughd@google.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Jann Horn <jannh@google.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Khalid Aziz <khalid.aziz@oracle.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Liang Zhang <zhangliang5@huawei.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Mike Kravetz <mike.kravetz@oracle.com>
Cc: Mike Rapoport <rppt@linux.ibm.com>
Cc: Nadav Amit <namit@vmware.com>
Cc: Oded Gabbay <oded.gabbay@gmail.com>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Pedro Demarchi Gomes <pedrodemargomes@gmail.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Rik van Riel <riel@surriel.com>
Cc: Roman Gushchin <guro@fb.com>
Cc: Shakeel Butt <shakeelb@google.com>
Cc: Yang Shi <shy828301@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <songmuchun@bytedance.com>
Cc: Minchan Kim <minchan@kernel.org>
Cc: David Howells <dhowells@redhat.com>
Cc: Miaohe Lin <linmiaohe@huawei.com>
Cc: NeilBrown <neilb@suse.de>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: linux-mm@kvack.org
---
 mm/memory.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 7a089145cad4..3e28c652cf60 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3043,15 +3043,16 @@ static inline void wp_page_reuse(struct vm_fault *vmf)
 	pte_t entry;
 
 	VM_BUG_ON(!(vmf->flags & FAULT_FLAG_WRITE));
-	VM_BUG_ON(PageAnon(page) && !PageAnonExclusive(page));
 
 	/*
 	 * Clear the pages cpupid information as the existing
 	 * information potentially belongs to a now completely
 	 * unrelated process.
 	 */
-	if (page)
+	if (page) {
+		VM_BUG_ON(PageAnon(page) && !PageAnonExclusive(page));
 		page_cpupid_xchg_last(page, (1 << LAST_CPUPID_SHIFT) - 1);
+	}
 
 	flush_cache_page(vma, vmf->address, pte_pfn(vmf->orig_pte));
 	entry = pte_mkyoung(vmf->orig_pte);
-- 
2.34.1

