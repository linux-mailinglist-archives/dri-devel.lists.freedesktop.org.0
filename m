Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3DB197535
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:13:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F3BA89F71;
	Mon, 30 Mar 2020 07:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179306E0F2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 20:00:29 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id z12so9684026qtq.5
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 13:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q0OsabNYqQz9XezfUAjPoyuspZFWQcrY4Mhi6eg0HzY=;
 b=H1W0eveTDYFp9Me6A7/gA4rO/fywX4Lkj9lBPMfHlCm+QsCrBoc31mD4j7V3cQcAXh
 QOlQIvesfCTUyHo4J/1oAR4ksHK6O8H3SiXtz4NlIC/TQGNktGUOdjWIBn5JmLTTYgoN
 eTRYLQJRFW7bBXZ7IZ9KtyUBg60ZAYHc/jJn2QTkGvwjGIJQCfiBpnHRcbfyCeuXBqnx
 L+HxsN697K3iOPQWULz54HPHfQrAnVGG2YSoD1aJBkGpYxGqMJvLAJXPbTyYQGQFPobh
 J4uQhJF9Kk+QVN+wrbqTw0cj/TtOGyv71hmd15wH5Evbq7IdTyhDfza2i1rCJ/aRLHZv
 1GTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q0OsabNYqQz9XezfUAjPoyuspZFWQcrY4Mhi6eg0HzY=;
 b=GTMTfeIzAbGeJCq9UC9fJVAgBsaEX158SydtSnwrcTp4WsbYHmwq3w6yXxLRQ3MPss
 kvxggBsDBah1xNREj3ua6mg6srK8zum77hJjLuFUmOlePXiKSDTA0l7nm+2i8Wom70HM
 yKF/ojAgHPG4+7TTxUMmpGMVXthp2sznh4+cdpQIpACZsf5Hq6P3C5HEiUZCmuGmuv2B
 U73vqPBUJWK8Nvl7/vp4Wp19LNq8ffhHKnqe/eex/Qwbzer2XSX6Bf5l1hiN7tPt+N5z
 kkeTkaoV28exZxtukEW35Q0ZjbB/t/y35IRHXl44P2AWmFSTcVmlq5Fydc2OrMoOnny9
 p5jg==
X-Gm-Message-State: ANhLgQ23iJzRkmCdfPQTBia734nOgHZ7vRhYF8JQVLkA2erb6yIySiHq
 B8YeEvQJue5kYsE/F/rubBFM9g==
X-Google-Smtp-Source: ADFU+vv1KEJUNoOTFPYi7PUdKmoRKZ930ogjB3Gxy2qwLSxuhnLwJkV54eLdQAnPUsAEMzUP3D5Ziw==
X-Received: by 2002:ac8:4d06:: with SMTP id w6mr956299qtv.287.1585339227895;
 Fri, 27 Mar 2020 13:00:27 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id m67sm4357086qke.101.2020.03.27.13.00.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 27 Mar 2020 13:00:25 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jHv9V-0007fZ-0I; Fri, 27 Mar 2020 17:00:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH v2 hmm 2/9] mm/hmm: return the fault type from
 hmm_pte_need_fault()
Date: Fri, 27 Mar 2020 17:00:14 -0300
Message-Id: <20200327200021.29372-3-jgg@ziepe.ca>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200327200021.29372-1-jgg@ziepe.ca>
References: <20200327200021.29372-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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
index 3a2610e0713329..d208ddd351066f 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -32,6 +32,12 @@ struct hmm_vma_walk {
 	unsigned int		flags;
 };
 
+enum {
+	HMM_NEED_FAULT = 1 << 0,
+	HMM_NEED_WRITE_FAULT = 1 << 1,
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
+	if (required_fault & HMM_NEED_WRITE_FAULT) {
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
+		return HMM_NEED_FAULT | HMM_NEED_WRITE_FAULT;
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
