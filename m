Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6249A190723
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 09:10:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6AB96E44D;
	Tue, 24 Mar 2020 08:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B7B6E43B
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 01:15:15 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id t17so3558305qtn.12
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 18:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RCEeJYfl6outct1qYnu7zwwXyFPg9MEiDmZ4l7AVE1o=;
 b=JOsrAyd16cYncuUmAnJofPxGEHPSMyXzVFRHTfUgaUtKQnMKQ9ynOt7d3lrwavlJp/
 /IN0JyTxmAZ607ioCuNBWUktkLbgo/lpEm8DpreW8jOHxDlm1mxZZt9goSjN+0fKXnmg
 wJNKZ76KzknJPUVUZ3PaCndHijOTKfg69UiiJ5Jve2aEBIX3xThDU/BiqKbNtE0i32HM
 ZOzVclmIMhiAtmspcaRtkpSQqwwxoiL6rN/ZNJp3Ck415ZyIO+L5IlYTSO9QrYFRfnad
 +HYRZALtdAgJp8Hes3XgCqTNovtZFIIuSgA4CFH47W7eqX09xN2f+1uA1soJ8AcGpGnq
 9Lkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RCEeJYfl6outct1qYnu7zwwXyFPg9MEiDmZ4l7AVE1o=;
 b=MMahNCBUisZH6cmkwLkSQXuOT4sdxHWvreHEfNNmhkZnVluyXmDiItuaK2LqQsD4zh
 wyuRgN/YYD9M1aY5qfijONwqqlFaiwSVhUgKM53riyfBRvFu7NETog1sEcM1XtzWFV2k
 NDpYkh2A5rmr9LAxDBA0pU/vrTAnuvJZXn7lDxA1VwHzm9JPR0O8cAlLNd0jP2a+AFj1
 uDwyw48RyROTOyRbJMsQ7dIhPZYgr8yFdzkTQdww3c/WZgMzyQAbXXAU7yoJP3WvtMfI
 oJ1AIHyopS08ECs5VzkocB1V6uSKlOTWjjCUa0bTI+kJ9q0sdcd8/Rdb6YBfE3ocxE0k
 tb/w==
X-Gm-Message-State: ANhLgQ1VUsckoilrgr4V8mmw7Ko376JiFTEWKu9HZlrj/q1GcHIEk+dd
 I44PfatqxlqmlWkUzlqjqmCoBw==
X-Google-Smtp-Source: ADFU+vvXCEgg5WFWwZVfX5BvFcxgytFNWvUrqpjFKiAB7q1rUxOi4zWEQxeos003SLALiWs6BazZwA==
X-Received: by 2002:ac8:4f03:: with SMTP id b3mr18213749qte.282.1585012514361; 
 Mon, 23 Mar 2020 18:15:14 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id x203sm12013242qkb.44.2020.03.23.18.15.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 23 Mar 2020 18:15:13 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jGY9u-0000rO-Cg; Mon, 23 Mar 2020 22:15:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH v2 hmm 7/9] mm/hmm: do not unconditionally set pfns when
 returning EBUSY
Date: Mon, 23 Mar 2020 22:14:55 -0300
Message-Id: <20200324011457.2817-8-jgg@ziepe.ca>
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

In hmm_vma_handle_pte() and hmm_vma_walk_hugetlb_entry() if fault happens
then -EBUSY will be returned and the pfns input flags will have been
destroyed.

For hmm_vma_handle_pte() set HMM_PFN_NONE only on the success returns that
don't otherwise store to pfns.

For hmm_vma_walk_hugetlb_entry() all exit paths already set pfns, so
remove the redundant store.

Fixes: 2aee09d8c116 ("mm/hmm: change hmm_vma_fault() to allow write fault on page basis")
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 mm/hmm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index e114110ad498a2..bf77b852f12d3a 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -249,11 +249,11 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 	pte_t pte = *ptep;
 	uint64_t orig_pfn = *pfn;
 
-	*pfn = range->values[HMM_PFN_NONE];
 	if (pte_none(pte)) {
 		required_fault = hmm_pte_need_fault(hmm_vma_walk, orig_pfn, 0);
 		if (required_fault)
 			goto fault;
+		*pfn = range->values[HMM_PFN_NONE];
 		return 0;
 	}
 
@@ -274,8 +274,10 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 		}
 
 		required_fault = hmm_pte_need_fault(hmm_vma_walk, orig_pfn, 0);
-		if (!required_fault)
+		if (!required_fault) {
+			*pfn = range->values[HMM_PFN_NONE];
 			return 0;
+		}
 
 		if (!non_swap_entry(entry))
 			goto fault;
@@ -493,7 +495,6 @@ static int hmm_vma_walk_hugetlb_entry(pte_t *pte, unsigned long hmask,
 
 	i = (start - range->start) >> PAGE_SHIFT;
 	orig_pfn = range->pfns[i];
-	range->pfns[i] = range->values[HMM_PFN_NONE];
 	cpu_flags = pte_to_hmm_pfn_flags(range, entry);
 	required_fault = hmm_pte_need_fault(hmm_vma_walk, orig_pfn, cpu_flags);
 	if (required_fault) {
-- 
2.25.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
