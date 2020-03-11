Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36864182ADF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE526EA8E;
	Thu, 12 Mar 2020 08:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AECD36E9E6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 18:35:19 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id f17so1058238qtq.6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 11:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uygKHmkoF/XJeHmET22wDgQZ4IaJVIkBqpHNgU4CsJM=;
 b=Obbz1qB+tB3LW2qPkKBSaSvBXS0QAxokU4EYzwIOqtm8mh2BUcwkjBK401WkLDG3qN
 maRWjYJWBrWo0yx7uPmbBEL9/OzQfBwoxFIjDiIZ4OOTuIIkTb0vfXIeIFlufr44gvy8
 ozDGUwJ+AScwhg3khplp06oZj8CIkNUNOOOSsNf9UpdHapwBkULUpPjYH90BGR4d5ybZ
 l2D7tGyYQL+lxEibzC81pQq/n5FVYiBCvnO3s8o0YZ74E2FigGT6Ku4BH3nFtHmoRzsv
 Y1UQAMgsdkUeEyDQRU6R2V+PqPmV9Io8KFSEaRkCEdGoEN79gzAbDpSPiBBGoLfSwi6k
 0GSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uygKHmkoF/XJeHmET22wDgQZ4IaJVIkBqpHNgU4CsJM=;
 b=R8+N75xdLLSANHV4EfJcczsB4KI3VpAG4waSzuOlPYHHHW6vY4dEH/yPavnoi9QM3z
 JOAJJHbX8pjeIZS+ZtI8Uu0XxV79AMLcdMId1edWqtgRguG6M00ggr7iQM4FGqq0RgaF
 en2m0vfuyoDdrlaHtHr/4d+3+BtfzzjT5c9zwbPsdwBiKh9zP8ge9K3bfDV+Q9vHYpiH
 7JH2DZJZwvoiCQ+0Gc404oPZPSJR2DCfCPlSCZkOsK6Y+mx20TJsreqgPdDcUgvurd8N
 /mAiTolcYs0NmncdqJM/FGqNKEDCWafiiYe1HITqVJk1KHueGj39fnQBPc1EgipqUJC3
 49MQ==
X-Gm-Message-State: ANhLgQ2fGn1XKzyBKtClNYCdTcHKsahuQ7hSVBW8uRq+vb/MJPWQK3i6
 dbaYCBGeMkiEZWFJxzYQwBRuRw==
X-Google-Smtp-Source: ADFU+vuxi2jwTZNWP7BbaHt9jLf2pO1O8MStIxhR8zwOb6icVa77ppaQhtJcOJ1hj7G1PBtoZXjjag==
X-Received: by 2002:ac8:b43:: with SMTP id m3mr3894888qti.191.1583951718521;
 Wed, 11 Mar 2020 11:35:18 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id g22sm11074847qtp.8.2020.03.11.11.35.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Mar 2020 11:35:16 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jC6CJ-00016j-CP; Wed, 11 Mar 2020 15:35:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH hmm 7/8] mm/hmm: return -EFAULT when setting HMM_PFN_ERROR on
 requested valid pages
Date: Wed, 11 Mar 2020 15:35:05 -0300
Message-Id: <20200311183506.3997-8-jgg@ziepe.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311183506.3997-1-jgg@ziepe.ca>
References: <20200311183506.3997-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 12 Mar 2020 08:08:13 +0000
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

hmm_range_fault() should never return 0 if the caller requested a valid
page, but the pfns output for that page would be HMM_PFN_ERROR.

hmm_pte_need_fault() must always be called before setting HMM_PFN_ERROR to
detect if the page is in faulting mode or not.

Fix two cases in hmm_vma_walk_pmd() and reorganize some of the duplicated
code.

Fixes: d08faca018c4 ("mm/hmm: properly handle migration pmd")
Fixes: da4c3c735ea4 ("mm/hmm/mirror: helper to snapshot CPU page table")
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 mm/hmm.c | 38 +++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index bf676cfef3e8ee..f61fddf2ef6505 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -363,8 +363,10 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 {
 	struct hmm_vma_walk *hmm_vma_walk = walk->private;
 	struct hmm_range *range = hmm_vma_walk->range;
-	uint64_t *pfns = range->pfns;
-	unsigned long addr = start, i;
+	uint64_t *pfns = &range->pfns[(start - range->start) >> PAGE_SHIFT];
+	unsigned long npages = (end - start) >> PAGE_SHIFT;
+	unsigned long addr = start;
+	bool fault, write_fault;
 	pte_t *ptep;
 	pmd_t pmd;
 
@@ -374,14 +376,6 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 		return hmm_vma_walk_hole(start, end, -1, walk);
 
 	if (thp_migration_supported() && is_pmd_migration_entry(pmd)) {
-		bool fault, write_fault;
-		unsigned long npages;
-		uint64_t *pfns;
-
-		i = (addr - range->start) >> PAGE_SHIFT;
-		npages = (end - addr) >> PAGE_SHIFT;
-		pfns = &range->pfns[i];
-
 		hmm_range_need_fault(hmm_vma_walk, pfns, npages,
 				     0, &fault, &write_fault);
 		if (fault || write_fault) {
@@ -390,8 +384,15 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 			return -EBUSY;
 		}
 		return hmm_pfns_fill(start, end, range, HMM_PFN_NONE);
-	} else if (!pmd_present(pmd))
+	}
+
+	if (!pmd_present(pmd)) {
+		hmm_range_need_fault(hmm_vma_walk, pfns, npages, 0, &fault,
+				     &write_fault);
+		if (fault || write_fault)
+			return -EFAULT;
 		return hmm_pfns_fill(start, end, range, HMM_PFN_ERROR);
+	}
 
 	if (pmd_devmap(pmd) || pmd_trans_huge(pmd)) {
 		/*
@@ -408,8 +409,7 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 		if (!pmd_devmap(pmd) && !pmd_trans_huge(pmd))
 			goto again;
 
-		i = (addr - range->start) >> PAGE_SHIFT;
-		return hmm_vma_handle_pmd(walk, addr, end, &pfns[i], pmd);
+		return hmm_vma_handle_pmd(walk, addr, end, pfns, pmd);
 	}
 
 	/*
@@ -418,15 +418,19 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 	 * entry pointing to pte directory or it is a bad pmd that will not
 	 * recover.
 	 */
-	if (pmd_bad(pmd))
+	if (pmd_bad(pmd)) {
+		hmm_range_need_fault(hmm_vma_walk, pfns, npages, 0, &fault,
+				     &write_fault);
+		if (fault || write_fault)
+			return -EFAULT;
 		return hmm_pfns_fill(start, end, range, HMM_PFN_ERROR);
+	}
 
 	ptep = pte_offset_map(pmdp, addr);
-	i = (addr - range->start) >> PAGE_SHIFT;
-	for (; addr < end; addr += PAGE_SIZE, ptep++, i++) {
+	for (; addr < end; addr += PAGE_SIZE, ptep++, pfns++) {
 		int r;
 
-		r = hmm_vma_handle_pte(walk, addr, end, pmdp, ptep, &pfns[i]);
+		r = hmm_vma_handle_pte(walk, addr, end, pmdp, ptep, pfns);
 		if (r) {
 			/* hmm_vma_handle_pte() did pte_unmap() */
 			hmm_vma_walk->last = addr;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
