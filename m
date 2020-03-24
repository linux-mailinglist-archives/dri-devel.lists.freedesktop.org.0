Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 421F6190728
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 09:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CFA6E454;
	Tue, 24 Mar 2020 08:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870D789E35
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 01:15:13 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id z13so8439755qvw.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 18:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o1MlItvq3/CcOwkWaXphhJAzDcJzLbhnUG4S07COKYc=;
 b=VI/Jh9chK4V7s3tjYT0khOqKd5olO2FygmNSG5UqEayDfWyPOkrNoyWSHNidyulAZo
 JOSbcu1CEzvBIX7PhHhGD9Ujd79JI7div1m2mxN+k4bBTDqOzGIo8V1j2J/TMwana/Pu
 HdlLwjf68bNMDHxnWaI1PzdUzJymnj0xPmF4fN8LvF8pdUIwaF7a3L0h1PHTiWCeZ3vB
 0KWxIhGmHXv8G313UYOfn3gfSb0vw9AfjGfr2NFTJQbJTEqV5cGGQNygulDaj3Ivd947
 ejvRJRoW2cs1iqz36kTlmkYsq0vW791hpeOuW7OWW6WytBfh8d0HZMyi3xMCFitBt96R
 0eYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o1MlItvq3/CcOwkWaXphhJAzDcJzLbhnUG4S07COKYc=;
 b=n3m4YZ1c8XCPGOEkz1CmpZVJoGq8kj9CzcwNgGKfVyacDjBe8iFVl1xyeRuOx7mQpw
 RJ2+TPu9OfqTqxpgdxut+6c25tfkhbQ0juXVFcYZj+iAG//x64h7cFJWLRtleMKIvXid
 nWkj3/jC7hOVFRWpu7jvyrcyq+oy4/lwQKo3+4gWqCp4rss2nWX4P7cHHvZkghQ+axFT
 tConOj0ghz92WQwW+oPqmfRdFOIwzn6UMQ38InYoefkV6DxjkIK8kAmF1ZNwmgWYUwDi
 gqjLMVr7AwYS61h5B4W5rO+iG7VwPlTiYrPO3VvRr27DuUMeSWuKOmwXTrXe5/4w+mbn
 WZqg==
X-Gm-Message-State: ANhLgQ0Q0t5favI6idyIB/gsNwx4F3C/X3Poq/lXIzEtB3TYU7YiknqE
 roqtOPua2EZRyEfAQHah/cTaxQ==
X-Google-Smtp-Source: ADFU+vtIogRzO3pADuND7By4iCRXCsa/DxPpoXlbRrrrm//K6PkufBoV5lk3+UXqPo6EJzrbd3NFqw==
X-Received: by 2002:a0c:e886:: with SMTP id b6mr23233950qvo.31.1585012512542; 
 Mon, 23 Mar 2020 18:15:12 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id u51sm14112250qth.46.2020.03.23.18.15.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 23 Mar 2020 18:15:10 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jGY9u-0000qu-3v; Mon, 23 Mar 2020 22:15:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH v2 hmm 2/9] mm/hmm: return the fault type from
 hmm_pte_need_fault()
Date: Mon, 23 Mar 2020 22:14:50 -0300
Message-Id: <20200324011457.2817-3-jgg@ziepe.ca>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200324011457.2817-1-jgg@ziepe.ca>
References: <20200324011457.2817-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 24 Mar 2020 08:09:16 +0000
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
Cc: Philip Yang <Philip.Yang@amd.com>, John Hubbard <jhubbard@nvidia.com>,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jason Gunthorpe <jgg@mellanox.com>

Using two bools instead of flags return is not necessary and leads to
bugs. Returning a value is easier for the compiler to check and easier to
pass around the code flow.

Convert the two bools into flags and push the change to all callers.

Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 mm/hmm.c | 183 ++++++++++++++++++++++++-------------------------------
 1 file changed, 81 insertions(+), 102 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 3a2610e0713329..2a0eda1534bcda 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -32,6 +32,12 @@ struct hmm_vma_walk {
 	unsigned int		flags;
 };
 
+enum {
+	HMM_NEED_FAULT = 1 << 0,
+	HMM_NEED_WRITE_FAULT = HMM_NEED_FAULT | (1 << 1),
+	HMM_NEED_ALL_BITS = HMM_NEED_FAULT | HMM_NEED_WRITE_FAULT,
+};
+
 static int hmm_pfns_fill(unsigned long addr, unsigned long end,
 		struct hmm_range *range, enum hmm_pfn_value_e value)
 {
@@ -49,8 +55,7 @@ static int hmm_pfns_fill(unsigned long addr, unsigned long end,
  * hmm_vma_fault() - fault in a range lacking valid pmd or pte(s)
  * @addr: range virtual start address (inclusive)
  * @end: range virtual end address (exclusive)
- * @fault: should we fault or not ?
- * @write_fault: write fault ?
+ * @required_fault: HMM_NEED_* flags
  * @walk: mm_walk structure
  * Return: -EBUSY after page fault, or page fault error
  *
@@ -58,8 +63,7 @@ static int hmm_pfns_fill(unsigned long addr, unsigned long end,
  * or whenever there is no page directory covering the virtual address range.
  */
 static int hmm_vma_fault(unsigned long addr, unsigned long end,
-			      bool fault, bool write_fault,
-			      struct mm_walk *walk)
+			 unsigned int required_fault, struct mm_walk *walk)
 {
 	struct hmm_vma_walk *hmm_vma_walk = walk->private;
 	struct hmm_range *range = hmm_vma_walk->range;
@@ -68,13 +72,13 @@ static int hmm_vma_fault(unsigned long addr, unsigned long end,
 	unsigned long i = (addr - range->start) >> PAGE_SHIFT;
 	unsigned int fault_flags = FAULT_FLAG_REMOTE;
 
-	WARN_ON_ONCE(!fault && !write_fault);
+	WARN_ON_ONCE(!required_fault);
 	hmm_vma_walk->last = addr;
 
 	if (!vma)
 		goto out_error;
 
-	if (write_fault) {
+	if ((required_fault & HMM_NEED_WRITE_FAULT) == HMM_NEED_WRITE_FAULT) {
 		if (!(vma->vm_flags & VM_WRITE))
 			return -EPERM;
 		fault_flags |= FAULT_FLAG_WRITE;
@@ -91,14 +95,13 @@ static int hmm_vma_fault(unsigned long addr, unsigned long end,
 	return -EFAULT;
 }
 
-static inline void hmm_pte_need_fault(const struct hmm_vma_walk *hmm_vma_walk,
-				      uint64_t pfns, uint64_t cpu_flags,
-				      bool *fault, bool *write_fault)
+static unsigned int hmm_pte_need_fault(const struct hmm_vma_walk *hmm_vma_walk,
+				       uint64_t pfns, uint64_t cpu_flags)
 {
 	struct hmm_range *range = hmm_vma_walk->range;
 
 	if (hmm_vma_walk->flags & HMM_FAULT_SNAPSHOT)
-		return;
+		return 0;
 
 	/*
 	 * So we not only consider the individual per page request we also
@@ -114,37 +117,37 @@ static inline void hmm_pte_need_fault(const struct hmm_vma_walk *hmm_vma_walk,
 
 	/* We aren't ask to do anything ... */
 	if (!(pfns & range->flags[HMM_PFN_VALID]))
-		return;
+		return 0;
 
-	/* If CPU page table is not valid then we need to fault */
-	*fault = !(cpu_flags & range->flags[HMM_PFN_VALID]);
 	/* Need to write fault ? */
 	if ((pfns & range->flags[HMM_PFN_WRITE]) &&
-	    !(cpu_flags & range->flags[HMM_PFN_WRITE])) {
-		*write_fault = true;
-		*fault = true;
-	}
+	    !(cpu_flags & range->flags[HMM_PFN_WRITE]))
+		return HMM_NEED_WRITE_FAULT;
+
+	/* If CPU page table is not valid then we need to fault */
+	if (!(cpu_flags & range->flags[HMM_PFN_VALID]))
+		return HMM_NEED_FAULT;
+	return 0;
 }
 
-static void hmm_range_need_fault(const struct hmm_vma_walk *hmm_vma_walk,
-				 const uint64_t *pfns, unsigned long npages,
-				 uint64_t cpu_flags, bool *fault,
-				 bool *write_fault)
+static unsigned int
+hmm_range_need_fault(const struct hmm_vma_walk *hmm_vma_walk,
+		     const uint64_t *pfns, unsigned long npages,
+		     uint64_t cpu_flags)
 {
+	unsigned int required_fault = 0;
 	unsigned long i;
 
-	if (hmm_vma_walk->flags & HMM_FAULT_SNAPSHOT) {
-		*fault = *write_fault = false;
-		return;
-	}
+	if (hmm_vma_walk->flags & HMM_FAULT_SNAPSHOT)
+		return 0;
 
-	*fault = *write_fault = false;
 	for (i = 0; i < npages; ++i) {
-		hmm_pte_need_fault(hmm_vma_walk, pfns[i], cpu_flags,
-				   fault, write_fault);
-		if ((*write_fault))
-			return;
+		required_fault |=
+			hmm_pte_need_fault(hmm_vma_walk, pfns[i], cpu_flags);
+		if (required_fault == HMM_NEED_ALL_BITS)
+			return required_fault;
 	}
+	return required_fault;
 }
 
 static int hmm_vma_walk_hole(unsigned long addr, unsigned long end,
@@ -152,17 +155,16 @@ static int hmm_vma_walk_hole(unsigned long addr, unsigned long end,
 {
 	struct hmm_vma_walk *hmm_vma_walk = walk->private;
 	struct hmm_range *range = hmm_vma_walk->range;
-	bool fault, write_fault;
+	unsigned int required_fault;
 	unsigned long i, npages;
 	uint64_t *pfns;
 
 	i = (addr - range->start) >> PAGE_SHIFT;
 	npages = (end - addr) >> PAGE_SHIFT;
 	pfns = &range->pfns[i];
-	hmm_range_need_fault(hmm_vma_walk, pfns, npages,
-			     0, &fault, &write_fault);
-	if (fault || write_fault)
-		return hmm_vma_fault(addr, end, fault, write_fault, walk);
+	required_fault = hmm_range_need_fault(hmm_vma_walk, pfns, npages, 0);
+	if (required_fault)
+		return hmm_vma_fault(addr, end, required_fault, walk);
 	hmm_vma_walk->last = addr;
 	return hmm_pfns_fill(addr, end, range, HMM_PFN_NONE);
 }
@@ -183,16 +185,15 @@ static int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
 	struct hmm_vma_walk *hmm_vma_walk = walk->private;
 	struct hmm_range *range = hmm_vma_walk->range;
 	unsigned long pfn, npages, i;
-	bool fault, write_fault;
+	unsigned int required_fault;
 	uint64_t cpu_flags;
 
 	npages = (end - addr) >> PAGE_SHIFT;
 	cpu_flags = pmd_to_hmm_pfn_flags(range, pmd);
-	hmm_range_need_fault(hmm_vma_walk, pfns, npages, cpu_flags,
-			     &fault, &write_fault);
-
-	if (fault || write_fault)
-		return hmm_vma_fault(addr, end, fault, write_fault, walk);
+	required_fault =
+		hmm_range_need_fault(hmm_vma_walk, pfns, npages, cpu_flags);
+	if (required_fault)
+		return hmm_vma_fault(addr, end, required_fault, walk);
 
 	pfn = pmd_pfn(pmd) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
 	for (i = 0; addr < end; addr += PAGE_SIZE, i++, pfn++)
@@ -229,18 +230,15 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 {
 	struct hmm_vma_walk *hmm_vma_walk = walk->private;
 	struct hmm_range *range = hmm_vma_walk->range;
-	bool fault, write_fault;
+	unsigned int required_fault;
 	uint64_t cpu_flags;
 	pte_t pte = *ptep;
 	uint64_t orig_pfn = *pfn;
 
 	*pfn = range->values[HMM_PFN_NONE];
-	fault = write_fault = false;
-
 	if (pte_none(pte)) {
-		hmm_pte_need_fault(hmm_vma_walk, orig_pfn, 0,
-				   &fault, &write_fault);
-		if (fault || write_fault)
+		required_fault = hmm_pte_need_fault(hmm_vma_walk, orig_pfn, 0);
+		if (required_fault)
 			goto fault;
 		return 0;
 	}
@@ -261,9 +259,8 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 			return 0;
 		}
 
-		hmm_pte_need_fault(hmm_vma_walk, orig_pfn, 0, &fault,
-				   &write_fault);
-		if (!fault && !write_fault)
+		required_fault = hmm_pte_need_fault(hmm_vma_walk, orig_pfn, 0);
+		if (!required_fault)
 			return 0;
 
 		if (!non_swap_entry(entry))
@@ -283,9 +280,8 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 	}
 
 	cpu_flags = pte_to_hmm_pfn_flags(range, pte);
-	hmm_pte_need_fault(hmm_vma_walk, orig_pfn, cpu_flags, &fault,
-			   &write_fault);
-	if (fault || write_fault)
+	required_fault = hmm_pte_need_fault(hmm_vma_walk, orig_pfn, cpu_flags);
+	if (required_fault)
 		goto fault;
 
 	/*
@@ -293,9 +289,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 	 * fall through and treat it like a normal page.
 	 */
 	if (pte_special(pte) && !is_zero_pfn(pte_pfn(pte))) {
-		hmm_pte_need_fault(hmm_vma_walk, orig_pfn, 0, &fault,
-				   &write_fault);
-		if (fault || write_fault) {
+		if (hmm_pte_need_fault(hmm_vma_walk, orig_pfn, 0)) {
 			pte_unmap(ptep);
 			return -EFAULT;
 		}
@@ -309,7 +303,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 fault:
 	pte_unmap(ptep);
 	/* Fault any virtual address we were asked to fault */
-	return hmm_vma_fault(addr, end, fault, write_fault, walk);
+	return hmm_vma_fault(addr, end, required_fault, walk);
 }
 
 static int hmm_vma_walk_pmd(pmd_t *pmdp,
@@ -322,7 +316,6 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 	uint64_t *pfns = &range->pfns[(start - range->start) >> PAGE_SHIFT];
 	unsigned long npages = (end - start) >> PAGE_SHIFT;
 	unsigned long addr = start;
-	bool fault, write_fault;
 	pte_t *ptep;
 	pmd_t pmd;
 
@@ -332,9 +325,7 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 		return hmm_vma_walk_hole(start, end, -1, walk);
 
 	if (thp_migration_supported() && is_pmd_migration_entry(pmd)) {
-		hmm_range_need_fault(hmm_vma_walk, pfns, npages,
-				     0, &fault, &write_fault);
-		if (fault || write_fault) {
+		if (hmm_range_need_fault(hmm_vma_walk, pfns, npages, 0)) {
 			hmm_vma_walk->last = addr;
 			pmd_migration_entry_wait(walk->mm, pmdp);
 			return -EBUSY;
@@ -343,9 +334,7 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 	}
 
 	if (!pmd_present(pmd)) {
-		hmm_range_need_fault(hmm_vma_walk, pfns, npages, 0, &fault,
-				     &write_fault);
-		if (fault || write_fault)
+		if (hmm_range_need_fault(hmm_vma_walk, pfns, npages, 0))
 			return -EFAULT;
 		return hmm_pfns_fill(start, end, range, HMM_PFN_ERROR);
 	}
@@ -375,9 +364,7 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 	 * recover.
 	 */
 	if (pmd_bad(pmd)) {
-		hmm_range_need_fault(hmm_vma_walk, pfns, npages, 0, &fault,
-				     &write_fault);
-		if (fault || write_fault)
+		if (hmm_range_need_fault(hmm_vma_walk, pfns, npages, 0))
 			return -EFAULT;
 		return hmm_pfns_fill(start, end, range, HMM_PFN_ERROR);
 	}
@@ -434,8 +421,8 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
 
 	if (pud_huge(pud) && pud_devmap(pud)) {
 		unsigned long i, npages, pfn;
+		unsigned int required_fault;
 		uint64_t *pfns, cpu_flags;
-		bool fault, write_fault;
 
 		if (!pud_present(pud)) {
 			spin_unlock(ptl);
@@ -447,12 +434,11 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
 		pfns = &range->pfns[i];
 
 		cpu_flags = pud_to_hmm_pfn_flags(range, pud);
-		hmm_range_need_fault(hmm_vma_walk, pfns, npages,
-				     cpu_flags, &fault, &write_fault);
-		if (fault || write_fault) {
+		required_fault = hmm_range_need_fault(hmm_vma_walk, pfns,
+						      npages, cpu_flags);
+		if (required_fault) {
 			spin_unlock(ptl);
-			return hmm_vma_fault(addr, end, fault, write_fault,
-						  walk);
+			return hmm_vma_fault(addr, end, required_fault, walk);
 		}
 
 		pfn = pud_pfn(pud) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
@@ -484,7 +470,7 @@ static int hmm_vma_walk_hugetlb_entry(pte_t *pte, unsigned long hmask,
 	struct hmm_range *range = hmm_vma_walk->range;
 	struct vm_area_struct *vma = walk->vma;
 	uint64_t orig_pfn, cpu_flags;
-	bool fault, write_fault;
+	unsigned int required_fault;
 	spinlock_t *ptl;
 	pte_t entry;
 
@@ -495,12 +481,10 @@ static int hmm_vma_walk_hugetlb_entry(pte_t *pte, unsigned long hmask,
 	orig_pfn = range->pfns[i];
 	range->pfns[i] = range->values[HMM_PFN_NONE];
 	cpu_flags = pte_to_hmm_pfn_flags(range, entry);
-	fault = write_fault = false;
-	hmm_pte_need_fault(hmm_vma_walk, orig_pfn, cpu_flags,
-			   &fault, &write_fault);
-	if (fault || write_fault) {
+	required_fault = hmm_pte_need_fault(hmm_vma_walk, orig_pfn, cpu_flags);
+	if (required_fault) {
 		spin_unlock(ptl);
-		return hmm_vma_fault(addr, end, fault, write_fault, walk);
+		return hmm_vma_fault(addr, end, required_fault, walk);
 	}
 
 	pfn = pte_pfn(entry) + ((start & ~hmask) >> PAGE_SHIFT);
@@ -522,37 +506,32 @@ static int hmm_vma_walk_test(unsigned long start, unsigned long end,
 	struct hmm_range *range = hmm_vma_walk->range;
 	struct vm_area_struct *vma = walk->vma;
 
+	if (!(vma->vm_flags & (VM_IO | VM_PFNMAP | VM_MIXEDMAP)) &&
+	    vma->vm_flags & VM_READ)
+		return 0;
+
 	/*
-	 * Skip vma ranges that don't have struct page backing them or map I/O
-	 * devices directly.
+	 * vma ranges that don't have struct page backing them or map I/O
+	 * devices directly cannot be handled by hmm_range_fault().
 	 *
 	 * If the vma does not allow read access, then assume that it does not
 	 * allow write access either. HMM does not support architectures that
 	 * allow write without read.
+	 *
+	 * If a fault is requested for an unsupported range then it is a hard
+	 * failure.
 	 */
-	if ((vma->vm_flags & (VM_IO | VM_PFNMAP | VM_MIXEDMAP)) ||
-	    !(vma->vm_flags & VM_READ)) {
-		bool fault, write_fault;
-
-		/*
-		 * Check to see if a fault is requested for any page in the
-		 * range.
-		 */
-		hmm_range_need_fault(hmm_vma_walk, range->pfns +
-					((start - range->start) >> PAGE_SHIFT),
-					(end - start) >> PAGE_SHIFT,
-					0, &fault, &write_fault);
-		if (fault || write_fault)
-			return -EFAULT;
-
-		hmm_pfns_fill(start, end, range, HMM_PFN_ERROR);
-		hmm_vma_walk->last = end;
+	if (hmm_range_need_fault(hmm_vma_walk,
+				 range->pfns +
+					 ((start - range->start) >> PAGE_SHIFT),
+				 (end - start) >> PAGE_SHIFT, 0))
+		return -EFAULT;
 
-		/* Skip this vma and continue processing the next vma. */
-		return 1;
-	}
+	hmm_pfns_fill(start, end, range, HMM_PFN_ERROR);
+	hmm_vma_walk->last = end;
 
-	return 0;
+	/* Skip this vma and continue processing the next vma. */
+	return 1;
 }
 
 static const struct mm_walk_ops hmm_walk_ops = {
-- 
2.25.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
