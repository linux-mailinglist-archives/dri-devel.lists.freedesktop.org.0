Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECB7182D9F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 11:29:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66AFC6E121;
	Thu, 12 Mar 2020 10:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C466E6E120;
 Thu, 12 Mar 2020 10:29:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6521031B;
 Thu, 12 Mar 2020 03:29:07 -0700 (PDT)
Received: from e112269-lin.cambridge.arm.com (e112269-lin.cambridge.arm.com
 [10.1.195.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD5873F67D;
 Thu, 12 Mar 2020 03:29:05 -0700 (PDT)
From: Steven Price <steven.price@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH] mm/hmm: Simplify hmm_vma_walk_pud slightly
Date: Thu, 12 Mar 2020 10:28:13 +0000
Message-Id: <20200312102813.56699-1-steven.price@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <5bd778fa-51e5-3e0c-d9bb-b38539b03c8d@arm.com>
References: <5bd778fa-51e5-3e0c-d9bb-b38539b03c8d@arm.com>
MIME-Version: 1.0
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
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 linux-mm@kvack.org, Jason Gunthorpe <jgg@mellanox.com>,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

By refactoring to deal with the !pud_huge(pud) || !pud_devmap(pud)
condition early it's possible to remove the 'ret' variable and remove a
level of indentation from half the function making the code easier to
read.

No functional change.

Signed-off-by: Steven Price <steven.price@arm.com>
---
Thanks to Jason's changes there were only two code paths left using
the out_unlock label so it seemed like a good opportunity to refactor.
---
 mm/hmm.c | 69 ++++++++++++++++++++++++++------------------------------
 1 file changed, 32 insertions(+), 37 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index ca33d086bdc1..0117c86426d1 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -466,8 +466,10 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
 	struct hmm_range *range = hmm_vma_walk->range;
 	unsigned long addr = start;
 	pud_t pud;
-	int ret = 0;
 	spinlock_t *ptl = pud_trans_huge_lock(pudp, walk->vma);
+	unsigned long i, npages, pfn;
+	uint64_t *pfns, cpu_flags;
+	bool fault, write_fault;
 
 	if (!ptl)
 		return 0;
@@ -481,50 +483,43 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
 		return hmm_vma_walk_hole(start, end, -1, walk);
 	}
 
-	if (pud_huge(pud) && pud_devmap(pud)) {
-		unsigned long i, npages, pfn;
-		uint64_t *pfns, cpu_flags;
-		bool fault, write_fault;
+	if (!pud_huge(pud) || !pud_devmap(pud)) {
+		/* Ask for the PUD to be split */
+		walk->action = ACTION_SUBTREE;
+		spin_unlock(ptl);
+		return 0;
+	}
 
-		if (!pud_present(pud)) {
-			spin_unlock(ptl);
-			return hmm_vma_walk_hole(start, end, -1, walk);
-		}
+	if (!pud_present(pud)) {
+		spin_unlock(ptl);
+		return hmm_vma_walk_hole(start, end, -1, walk);
+	}
 
-		i = (addr - range->start) >> PAGE_SHIFT;
-		npages = (end - addr) >> PAGE_SHIFT;
-		pfns = &range->pfns[i];
+	i = (addr - range->start) >> PAGE_SHIFT;
+	npages = (end - addr) >> PAGE_SHIFT;
+	pfns = &range->pfns[i];
 
-		cpu_flags = pud_to_hmm_pfn_flags(range, pud);
-		hmm_range_need_fault(hmm_vma_walk, pfns, npages,
-				     cpu_flags, &fault, &write_fault);
-		if (fault || write_fault) {
-			spin_unlock(ptl);
-			return hmm_vma_walk_hole_(addr, end, fault, write_fault,
-						  walk);
-		}
+	cpu_flags = pud_to_hmm_pfn_flags(range, pud);
+	hmm_range_need_fault(hmm_vma_walk, pfns, npages,
+			     cpu_flags, &fault, &write_fault);
+	if (fault || write_fault) {
+		spin_unlock(ptl);
+		return hmm_vma_walk_hole_(addr, end, fault, write_fault, walk);
+	}
 
-		pfn = pud_pfn(pud) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
-		for (i = 0; i < npages; ++i, ++pfn) {
-			hmm_vma_walk->pgmap = get_dev_pagemap(pfn,
-					      hmm_vma_walk->pgmap);
-			if (unlikely(!hmm_vma_walk->pgmap)) {
-				ret = -EBUSY;
-				goto out_unlock;
-			}
-			pfns[i] = hmm_device_entry_from_pfn(range, pfn) |
-				  cpu_flags;
+	pfn = pud_pfn(pud) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
+	for (i = 0; i < npages; ++i, ++pfn) {
+		hmm_vma_walk->pgmap = get_dev_pagemap(pfn, hmm_vma_walk->pgmap);
+		if (unlikely(!hmm_vma_walk->pgmap)) {
+			spin_unlock(ptl);
+			return -EBUSY;
 		}
-		hmm_vma_walk->last = end;
-		goto out_unlock;
+		pfns[i] = hmm_device_entry_from_pfn(range, pfn) | cpu_flags;
 	}
+	hmm_vma_walk->last = end;
 
-	/* Ask for the PUD to be split */
-	walk->action = ACTION_SUBTREE;
-
-out_unlock:
 	spin_unlock(ptl);
-	return ret;
+	return 0;
 }
 #else
 #define hmm_vma_walk_pud	NULL
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
