Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C5C19071C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 09:09:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F406E448;
	Tue, 24 Mar 2020 08:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D46789E35
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 01:15:15 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id h14so17730473qke.5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 18:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6ikMiGopONSmGx8OLjWFTB0Uq9GGdoKVpRzgxdsKjDE=;
 b=hvs5QGf0jmRvSVP0uvKT4F36pRHcuVBcLvvrAOORF3tJWFJ/r8EMh9If+rsHZjGMej
 0oiNAOLYvFCk8yhmmAKzYjQv/NpIX8VrgfadBPjJzMLn4KYdijiXiD8RoFvh/T9MmHYc
 j5Xnlsz2vE2JdTSl9/yvYIAD+XWQMBcSs5W4JKPD4c40Vah9bMdT4/dLp1geVnNKQG+N
 W6j1ga+NPsIulo4zBm0Kj+sUcQ3tC+A1zKFgIBCwxjgF/8aqEcjdOoZlPNz+QVGMYus5
 GgbR7H+yU2BR84S3OORNa0BPpKMS53JJLPnxshumgsSbIzqWJONPwlMR8yTUxe0xayER
 2xlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ikMiGopONSmGx8OLjWFTB0Uq9GGdoKVpRzgxdsKjDE=;
 b=V+4QHCbicL4P+6QSy1iYYwSac5972115mSEmNNAbjnZFZs48qtr9lTyoG/JkZCyPUY
 /lYONKz/9VqvEVEt2K9rDthKlLBLvTPvneWwdjRlzNwxIj+rlRyiFT8LoBn6/3cR3Osv
 +qo+GnSYD18yeDQOJL3TKrD4QIgpxbTHIFpZYN8MYTUKdbCe+ZrdgbNWow/voK2ZpeYB
 CIlQkRhE7+WYa8uYycikGUHtOT9U4b82IXtgqHTeDIHyOYIHsztPFQ02xa9BQJX1ALqV
 QavJKO97LjUThovFubEmbO5NGH8dCw2LYK+VM5pv0p7vPiJEWHohnrkHtZghWgpSlcaH
 Cx7Q==
X-Gm-Message-State: ANhLgQ1jqoga7ukD+66mkTdf+NS70UjBadFnv3wHYZ4e0wL9Gl3sDjI+
 /EBGZTzUOmoySoqfn9ej9x18Vg==
X-Google-Smtp-Source: ADFU+vuZpepMcJKEuA2+c4r701ctyS8+lSo0DrK9q4pQxbmg58MGtjdzJn9NH5w8Jxb5T8n5goA8lw==
X-Received: by 2002:a37:8101:: with SMTP id c1mr22947805qkd.236.1585012514707; 
 Mon, 23 Mar 2020 18:15:14 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id u77sm12241810qka.134.2020.03.23.18.15.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 23 Mar 2020 18:15:13 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jGY9u-0000rU-E3; Mon, 23 Mar 2020 22:15:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH v2 hmm 8/9] mm/hmm: do not set pfns when returning an error
 code
Date: Mon, 23 Mar 2020 22:14:56 -0300
Message-Id: <20200324011457.2817-9-jgg@ziepe.ca>
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

Most places that return an error code, like -EFAULT, do not set
HMM_PFN_ERROR, only two places do this.

Resolve this inconsistency by never setting the pfns on an error
exit. This doesn't seem like a worthwhile thing to do anyhow.

If for some reason it becomes important, it makes more sense to directly
return the address of the failing page rather than have the caller scan
for the HMM_PFN_ERROR.

No caller inspects the pnfs output array if hmm_range_fault() fails.

Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 mm/hmm.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index bf77b852f12d3a..14c33e1225866c 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -77,17 +77,14 @@ static int hmm_vma_fault(unsigned long addr, unsigned long end,
 			 unsigned int required_fault, struct mm_walk *walk)
 {
 	struct hmm_vma_walk *hmm_vma_walk = walk->private;
-	struct hmm_range *range = hmm_vma_walk->range;
 	struct vm_area_struct *vma = walk->vma;
-	uint64_t *pfns = range->pfns;
-	unsigned long i = (addr - range->start) >> PAGE_SHIFT;
 	unsigned int fault_flags = FAULT_FLAG_REMOTE;
 
 	WARN_ON_ONCE(!required_fault);
 	hmm_vma_walk->last = addr;
 
 	if (!vma)
-		goto out_error;
+		return -EFAULT;
 
 	if ((required_fault & HMM_NEED_WRITE_FAULT) == HMM_NEED_WRITE_FAULT) {
 		if (!(vma->vm_flags & VM_WRITE))
@@ -95,15 +92,10 @@ static int hmm_vma_fault(unsigned long addr, unsigned long end,
 		fault_flags |= FAULT_FLAG_WRITE;
 	}
 
-	for (; addr < end; addr += PAGE_SIZE, i++)
+	for (; addr < end; addr += PAGE_SIZE)
 		if (handle_mm_fault(vma, addr, fault_flags) & VM_FAULT_ERROR)
-			goto out_error;
-
+			return -EFAULT;
 	return -EBUSY;
-
-out_error:
-	pfns[i] = range->values[HMM_PFN_ERROR];
-	return -EFAULT;
 }
 
 static unsigned int hmm_pte_need_fault(const struct hmm_vma_walk *hmm_vma_walk,
@@ -291,7 +283,6 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 
 		/* Report error for everything else */
 		pte_unmap(ptep);
-		*pfn = range->values[HMM_PFN_ERROR];
 		return -EFAULT;
 	}
 
@@ -577,9 +568,6 @@ static const struct mm_walk_ops hmm_walk_ops = {
  *
  * This is similar to get_user_pages(), except that it can read the page tables
  * without mutating them (ie causing faults).
- *
- * On error, for one virtual address in the range, the function will mark the
- * corresponding HMM pfn entry with an error flag.
  */
 long hmm_range_fault(struct hmm_range *range)
 {
-- 
2.25.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
