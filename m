Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF1561F8E1
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 17:18:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B0610E46E;
	Mon,  7 Nov 2022 16:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F5010E46C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 16:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667837924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M275xa5VmJFFF0eoqC6jgMpj+JGpdliWktdg7eTdqh0=;
 b=OoLdmJkyjUZTvqaypxz3KM4vvBfRPUukja9Z3ZTAcQhZu5fg1DEg3F7YYmORytB+vG5QPk
 t50YGxWk/TCYns7J6/qlXFg1Ki2ecmlEF//hZ1jQ6LZ2K5Mfxx4qOUowWZDzLKfouzfNAB
 JTzt99ZoSbWD24o+0scRX/8G62BE2t8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-ZqeOm0KSP125jOJcWFkLSQ-1; Mon, 07 Nov 2022 11:18:42 -0500
X-MC-Unique: ZqeOm0KSP125jOJcWFkLSQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 292AE800B30;
 Mon,  7 Nov 2022 16:18:40 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.195.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D95624B3FC8;
 Mon,  7 Nov 2022 16:18:34 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC 09/19] mm/gup: reliable R/O long-term pinning in COW
 mappings
Date: Mon,  7 Nov 2022 17:17:30 +0100
Message-Id: <20221107161740.144456-10-david@redhat.com>
In-Reply-To: <20221107161740.144456-1-david@redhat.com>
References: <20221107161740.144456-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
Cc: David Hildenbrand <david@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Nadav Amit <namit@vmware.com>,
 linux-kselftest@vger.kernel.org, Andrea Arcangeli <aarcange@redhat.com>,
 linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, etnaviv@lists.freedesktop.org,
 Peter Xu <peterx@redhat.com>, Muchun Song <songmuchun@bytedance.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We already support reliable R/O pinning of anonymous memory. However,
assume we end up pinning (R/O long-term) a pagecache page or the shared
zeropage inside a writable private ("COW") mapping. The next write access
will trigger a write-fault and replace the pinned page by an exclusive
anonymous page in the process page tables to break COW: the pinned page no
longer corresponds to the page mapped into the process' page table.

Now that FAULT_FLAG_UNSHARE can break COW on anything mapped into a
COW mapping, let's properly break COW first before R/O long-term
pinning something that's not an exclusive anon page inside a COW
mapping. FAULT_FLAG_UNSHARE will break COW and map an exclusive anon page
instead that can get pinned safely.

With this change, we can stop using FOLL_FORCE|FOLL_WRITE for reliable
R/O long-term pinning in COW mappings.

With this change, the new R/O long-term pinning tests for non-anonymous
memory succeed:
  # [RUN] R/O longterm GUP pin ... with shared zeropage
  ok 151 Longterm R/O pin is reliable
  # [RUN] R/O longterm GUP pin ... with memfd
  ok 152 Longterm R/O pin is reliable
  # [RUN] R/O longterm GUP pin ... with tmpfile
  ok 153 Longterm R/O pin is reliable
  # [RUN] R/O longterm GUP pin ... with huge zeropage
  ok 154 Longterm R/O pin is reliable
  # [RUN] R/O longterm GUP pin ... with memfd hugetlb (2048 kB)
  ok 155 Longterm R/O pin is reliable
  # [RUN] R/O longterm GUP pin ... with memfd hugetlb (1048576 kB)
  ok 156 Longterm R/O pin is reliable
  # [RUN] R/O longterm GUP-fast pin ... with shared zeropage
  ok 157 Longterm R/O pin is reliable
  # [RUN] R/O longterm GUP-fast pin ... with memfd
  ok 158 Longterm R/O pin is reliable
  # [RUN] R/O longterm GUP-fast pin ... with tmpfile
  ok 159 Longterm R/O pin is reliable
  # [RUN] R/O longterm GUP-fast pin ... with huge zeropage
  ok 160 Longterm R/O pin is reliable
  # [RUN] R/O longterm GUP-fast pin ... with memfd hugetlb (2048 kB)
  ok 161 Longterm R/O pin is reliable
  # [RUN] R/O longterm GUP-fast pin ... with memfd hugetlb (1048576 kB)
  ok 162 Longterm R/O pin is reliable

Note 1: We don't care about short-term R/O-pinning, because they have
snapshot semantics: they are not supposed to observe modifications that
happen after pinning.

As one example, assume we start direct I/O to read from a page and store
page content into a file: modifications to page content after starting
direct I/O are not guaranteed to end up in the file. So even if we'd pin
the shared zeropage, the end result would be as expected -- getting zeroes
stored to the file.

Note 2: For shared mappings we'll now always fallback to the slow path to
lookup the VMA when R/O long-term pining. While that's the necessary price
we have to pay right now, it's actually not that bad in practice: most
FOLL_LONGTERM users already specify FOLL_WRITE, for example, along with
FOLL_FORCE because they tried dealing with COW mappings correctly ...

Note 3: For users that use FOLL_LONGTERM right now without FOLL_WRITE,
such as VFIO, we'd now no longer pin the shared zeropage. Instead, we'd
populate exclusive anon pages that we can pin. There was a concern that
this could affect the memlock limit of existing setups.

For example, a VM running with VFIO could run into the memlock limit and
fail to run. However, we essentially had the same behavior already in
commit 17839856fd58 ("gup: document and work around "COW can break either
way" issue") which got merged into some enterprise distros, and there were
not any such complaints. So most probably, we're fine.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h | 27 ++++++++++++++++++++++++---
 mm/gup.c           | 10 +++++-----
 mm/huge_memory.c   |  2 +-
 mm/hugetlb.c       |  7 ++++---
 4 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 517c8cc8ccb9..3252ed88b472 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3002,8 +3002,12 @@ static inline int vm_fault_to_errno(vm_fault_t vm_fault, int foll_flags)
  * Must be called with the (sub)page that's actually referenced via the
  * page table entry, which might not necessarily be the head page for a
  * PTE-mapped THP.
+ *
+ * If the vma is NULL, we're coming from the GUP-fast path and might have
+ * to fallback to the slow path just to lookup the vma.
  */
-static inline bool gup_must_unshare(unsigned int flags, struct page *page)
+static inline bool gup_must_unshare(struct vm_area_struct *vma,
+				    unsigned int flags, struct page *page)
 {
 	/*
 	 * FOLL_WRITE is implicitly handled correctly as the page table entry
@@ -3016,8 +3020,25 @@ static inline bool gup_must_unshare(unsigned int flags, struct page *page)
 	 * Note: PageAnon(page) is stable until the page is actually getting
 	 * freed.
 	 */
-	if (!PageAnon(page))
-		return false;
+	if (!PageAnon(page)) {
+		/*
+		 * We only care about R/O long-term pining: R/O short-term
+		 * pinning does not have the semantics to observe successive
+		 * changes through the process page tables.
+		 */
+		if (!(flags & FOLL_LONGTERM))
+			return false;
+
+		/* We really need the vma ... */
+		if (!vma)
+			return true;
+
+		/*
+		 * ... because we only care about writable private ("COW")
+		 * mappings where we have to break COW early.
+		 */
+		return is_cow_mapping(vma->vm_flags);
+	}
 
 	/* Paired with a memory barrier in page_try_share_anon_rmap(). */
 	if (IS_ENABLED(CONFIG_HAVE_FAST_GUP))
diff --git a/mm/gup.c b/mm/gup.c
index 5182abaaecde..01116699c863 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -578,7 +578,7 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
 		}
 	}
 
-	if (!pte_write(pte) && gup_must_unshare(flags, page)) {
+	if (!pte_write(pte) && gup_must_unshare(vma, flags, page)) {
 		page = ERR_PTR(-EMLINK);
 		goto out;
 	}
@@ -2338,7 +2338,7 @@ static int gup_pte_range(pmd_t pmd, pmd_t *pmdp, unsigned long addr,
 			goto pte_unmap;
 		}
 
-		if (!pte_write(pte) && gup_must_unshare(flags, page)) {
+		if (!pte_write(pte) && gup_must_unshare(NULL, flags, page)) {
 			gup_put_folio(folio, 1, flags);
 			goto pte_unmap;
 		}
@@ -2506,7 +2506,7 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
 		return 0;
 	}
 
-	if (!pte_write(pte) && gup_must_unshare(flags, &folio->page)) {
+	if (!pte_write(pte) && gup_must_unshare(NULL, flags, &folio->page)) {
 		gup_put_folio(folio, refs, flags);
 		return 0;
 	}
@@ -2572,7 +2572,7 @@ static int gup_huge_pmd(pmd_t orig, pmd_t *pmdp, unsigned long addr,
 		return 0;
 	}
 
-	if (!pmd_write(orig) && gup_must_unshare(flags, &folio->page)) {
+	if (!pmd_write(orig) && gup_must_unshare(NULL, flags, &folio->page)) {
 		gup_put_folio(folio, refs, flags);
 		return 0;
 	}
@@ -2612,7 +2612,7 @@ static int gup_huge_pud(pud_t orig, pud_t *pudp, unsigned long addr,
 		return 0;
 	}
 
-	if (!pud_write(orig) && gup_must_unshare(flags, &folio->page)) {
+	if (!pud_write(orig) && gup_must_unshare(NULL, flags, &folio->page)) {
 		gup_put_folio(folio, refs, flags);
 		return 0;
 	}
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 7173756d6868..50c673da3c6e 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1404,7 +1404,7 @@ struct page *follow_trans_huge_pmd(struct vm_area_struct *vma,
 	if (pmd_protnone(*pmd) && !gup_can_follow_protnone(flags))
 		return NULL;
 
-	if (!pmd_write(*pmd) && gup_must_unshare(flags, page))
+	if (!pmd_write(*pmd) && gup_must_unshare(vma, flags, page))
 		return ERR_PTR(-EMLINK);
 
 	VM_BUG_ON_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 3672c7e06748..d96bbc69806f 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6197,7 +6197,8 @@ static void record_subpages_vmas(struct page *page, struct vm_area_struct *vma,
 	}
 }
 
-static inline bool __follow_hugetlb_must_fault(unsigned int flags, pte_t *pte,
+static inline bool __follow_hugetlb_must_fault(struct vm_area_struct *vma,
+					       unsigned int flags, pte_t *pte,
 					       bool *unshare)
 {
 	pte_t pteval = huge_ptep_get(pte);
@@ -6209,7 +6210,7 @@ static inline bool __follow_hugetlb_must_fault(unsigned int flags, pte_t *pte,
 		return false;
 	if (flags & FOLL_WRITE)
 		return true;
-	if (gup_must_unshare(flags, pte_page(pteval))) {
+	if (gup_must_unshare(vma, flags, pte_page(pteval))) {
 		*unshare = true;
 		return true;
 	}
@@ -6338,7 +6339,7 @@ long follow_hugetlb_page(struct mm_struct *mm, struct vm_area_struct *vma,
 		 * directly from any kind of swap entries.
 		 */
 		if (absent ||
-		    __follow_hugetlb_must_fault(flags, pte, &unshare)) {
+		    __follow_hugetlb_must_fault(vma, flags, pte, &unshare)) {
 			vm_fault_t ret;
 			unsigned int fault_flags = 0;
 
-- 
2.38.1

