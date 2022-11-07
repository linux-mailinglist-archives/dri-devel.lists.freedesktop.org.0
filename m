Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 909D361F8DB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 17:18:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4895F10E466;
	Mon,  7 Nov 2022 16:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1515310E45C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 16:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667837898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jDk9bhO7j0dBiRTBonVIWKZ9rsqO0bmea9iIm0D/070=;
 b=CfGjtaYLGcc1bzNn9QAa4mw7O3F3UtoJ34pMf0D7LmObLSJhxT34T5LatRZgOuzaEMuoNg
 98ydNdV/EJ5ZJKlyXS5KZiXwyxKRlE+azFuauQko0312KTOM1TDSVxdNCjoJKNFuzlRzrC
 mHp6ChJoF0WeqvK5sYjv4ptVVDLorxw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-TGbR2pUAPIyw3MgPlt6EzA-1; Mon, 07 Nov 2022 11:18:13 -0500
X-MC-Unique: TGbR2pUAPIyw3MgPlt6EzA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2455857FAB;
 Mon,  7 Nov 2022 16:18:11 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.195.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 497EF4B3FC6;
 Mon,  7 Nov 2022 16:18:05 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC 04/19] mm: add early FAULT_FLAG_UNSHARE consistency checks
Date: Mon,  7 Nov 2022 17:17:25 +0100
Message-Id: <20221107161740.144456-5-david@redhat.com>
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

For now, FAULT_FLAG_UNSHARE only applies to anonymous pages, which
implies a COW mapping. Let's hide FAULT_FLAG_UNSHARE early if we're not
dealing with a COW mapping, such that we treat it like a read fault as
documented and don't have to worry about the flag throughout all fault
handlers.

While at it, centralize the check for mutual exclusion of
FAULT_FLAG_UNSHARE and FAULT_FLAG_WRITE and just drop the check that
either flag is set in the WP handler.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/huge_memory.c |  3 ---
 mm/hugetlb.c     |  5 -----
 mm/memory.c      | 23 ++++++++++++++++++++---
 3 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 1d47b3f7b877..7173756d6868 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1267,9 +1267,6 @@ vm_fault_t do_huge_pmd_wp_page(struct vm_fault *vmf)
 	vmf->ptl = pmd_lockptr(vma->vm_mm, vmf->pmd);
 	VM_BUG_ON_VMA(!vma->anon_vma, vma);
 
-	VM_BUG_ON(unshare && (vmf->flags & FAULT_FLAG_WRITE));
-	VM_BUG_ON(!unshare && !(vmf->flags & FAULT_FLAG_WRITE));
-
 	if (is_huge_zero_pmd(orig_pmd))
 		goto fallback;
 
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index be572af75d9c..3672c7e06748 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5316,9 +5316,6 @@ static vm_fault_t hugetlb_wp(struct mm_struct *mm, struct vm_area_struct *vma,
 	unsigned long haddr = address & huge_page_mask(h);
 	struct mmu_notifier_range range;
 
-	VM_BUG_ON(unshare && (flags & FOLL_WRITE));
-	VM_BUG_ON(!unshare && !(flags & FOLL_WRITE));
-
 	/*
 	 * hugetlb does not support FOLL_FORCE-style write faults that keep the
 	 * PTE mapped R/O such as maybe_mkwrite() would do.
@@ -5328,8 +5325,6 @@ static vm_fault_t hugetlb_wp(struct mm_struct *mm, struct vm_area_struct *vma,
 
 	/* Let's take out MAP_SHARED mappings first. */
 	if (vma->vm_flags & VM_MAYSHARE) {
-		if (unlikely(unshare))
-			return 0;
 		set_huge_ptep_writable(vma, haddr, ptep);
 		return 0;
 	}
diff --git a/mm/memory.c b/mm/memory.c
index 78e2c58f6f31..fe131273217a 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3343,9 +3343,6 @@ static vm_fault_t do_wp_page(struct vm_fault *vmf)
 	struct vm_area_struct *vma = vmf->vma;
 	struct folio *folio;
 
-	VM_BUG_ON(unshare && (vmf->flags & FAULT_FLAG_WRITE));
-	VM_BUG_ON(!unshare && !(vmf->flags & FAULT_FLAG_WRITE));
-
 	if (likely(!unshare)) {
 		if (userfaultfd_pte_wp(vma, *vmf->pte)) {
 			pte_unmap_unlock(vmf->pte, vmf->ptl);
@@ -5150,6 +5147,22 @@ static void lru_gen_exit_fault(void)
 }
 #endif /* CONFIG_LRU_GEN */
 
+static vm_fault_t sanitize_fault_flags(struct vm_area_struct *vma,
+				       unsigned int *flags)
+{
+	if (unlikely(*flags & FAULT_FLAG_UNSHARE)) {
+		if (WARN_ON_ONCE(*flags & FAULT_FLAG_WRITE))
+			return VM_FAULT_SIGSEGV;
+		/*
+		 * FAULT_FLAG_UNSHARE only applies to COW mappings. Let's
+		 * just treat it like an ordinary read-fault otherwise.
+		 */
+		if (!is_cow_mapping(vma->vm_flags))
+			*flags &= ~FAULT_FLAG_UNSHARE;
+	}
+	return 0;
+}
+
 /*
  * By the time we get here, we already hold the mm semaphore
  *
@@ -5166,6 +5179,10 @@ vm_fault_t handle_mm_fault(struct vm_area_struct *vma, unsigned long address,
 	count_vm_event(PGFAULT);
 	count_memcg_event_mm(vma->vm_mm, PGFAULT);
 
+	ret = sanitize_fault_flags(vma, &flags);
+	if (ret)
+		return ret;
+
 	if (!arch_vma_access_permitted(vma, flags & FAULT_FLAG_WRITE,
 					    flags & FAULT_FLAG_INSTRUCTION,
 					    flags & FAULT_FLAG_REMOTE))
-- 
2.38.1

