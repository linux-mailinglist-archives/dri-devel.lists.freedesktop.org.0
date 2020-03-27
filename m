Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E121974FD
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F22889F0B;
	Mon, 30 Mar 2020 07:11:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C47B6EA72
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 20:00:33 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id j4so12144080qkc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 13:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w7HT384dLquXkifrMSaPZlakZIt6uG6pSy8/vMIPtTg=;
 b=LO8u6Sf1tFMYHfFgs/mRngqSax2KnXlZcJO3p0Dc+bnFdWQ3mFI2oTFey6thDTmmaF
 6vQSVW9hkX0MF2gHtADWhz2PG6//81Sy+koWSRmlUtdE4JkEDlbi+Hl7e9/fJkqBDQ1W
 wZGR9Wj/y9vVjDnX6QH2oWytEcLS1b2oPoz2PvXkTnw7cdsqRkzHAarbUERdJ7ThoQ/X
 cjfSJj6agzko8pFrT99pB+ejxChHQOTwCS/jnyQVX3vj5kkIgnEKBBVdjZ6Uyg+MCpb7
 McioaeQ1NszNr6YE8lMUcEsAudEty68BJWZfarn6H3IuArhauChB9pgs+awHkyiMwPkH
 VdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w7HT384dLquXkifrMSaPZlakZIt6uG6pSy8/vMIPtTg=;
 b=MHMhlOLmlgzay2n9UsVMc6752CXHmbi53YnPczDYxrsQaBe36bGRCjC/n/6ItQx7yb
 +MBJytgSWKqjjafkSFzf/1HLZ2+dwUlmFH9OPy5912Z4uzARwNOMmh9iip1nsSjeiOTV
 K2ze54/tDcf+JnJ9qyp4Y/wb/j+SvB10EI15yKy9lqyGDq7kvBzHUwIKtLKeX3Qvxw26
 nEbuyVhbt0zEzHOPPT+Iitgl1DomTxXJ45mSmwhJpZ1NLjfsZ72FZ+K1tP/5AsdLd4QO
 RY1bIPhRyHGUg6YgY01ABGLb+XgMjF9qXqoUd+1sVUOXqtNz/w/RGQ389Tz1xMk+VtOT
 XEAg==
X-Gm-Message-State: ANhLgQ2ey2PBWoOrwldfRWr5Ds2+D8mwpqle6ynfk6FFlhxkkxK9yAYH
 4YA1PfZOqaHTjCDCc23HYe7M3g==
X-Google-Smtp-Source: ADFU+vsV4R08VNgi3U0EcEDSpq36V0bb1XOE53WhiumJ5wLNMq9YlKH0bNPjhSJsWggFm8HqFwZeRw==
X-Received: by 2002:a37:86c4:: with SMTP id i187mr1090284qkd.110.1585339232485; 
 Fri, 27 Mar 2020 13:00:32 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id n64sm4367174qkf.23.2020.03.27.13.00.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 27 Mar 2020 13:00:25 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jHv9V-0007g4-98; Fri, 27 Mar 2020 17:00:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH v2 hmm 7/9] mm/hmm: do not unconditionally set pfns when
 returning EBUSY
Date: Fri, 27 Mar 2020 17:00:19 -0300
Message-Id: <20200327200021.29372-8-jgg@ziepe.ca>
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

In hmm_vma_handle_pte() and hmm_vma_walk_hugetlb_entry() if fault happens
then -EBUSY will be returned and the pfns input flags will have been
destroyed.

For hmm_vma_handle_pte() set HMM_PFN_NONE only on the success returns that
don't otherwise store to pfns.

For hmm_vma_walk_hugetlb_entry() all exit paths already set pfns, so
remove the redundant store.

Fixes: 2aee09d8c116 ("mm/hmm: change hmm_vma_fault() to allow write fault on page basis")
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 mm/hmm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 3303686bf16d24..dc826898979bc5 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -244,11 +244,11 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
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
 
@@ -269,8 +269,10 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 		}
 
 		required_fault = hmm_pte_need_fault(hmm_vma_walk, orig_pfn, 0);
-		if (!required_fault)
+		if (!required_fault) {
+			*pfn = range->values[HMM_PFN_NONE];
 			return 0;
+		}
 
 		if (!non_swap_entry(entry))
 			goto fault;
@@ -488,7 +490,6 @@ static int hmm_vma_walk_hugetlb_entry(pte_t *pte, unsigned long hmask,
 
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
