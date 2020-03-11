Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 708A4182AE2
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:11:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF3D6EAA4;
	Thu, 12 Mar 2020 08:09:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE03A6E9E1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 18:35:16 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id c145so3070456qke.12
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 11:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uADmryRzUppwT0DoGC+vBgxjUH6ONtG4PbQCGFnnObM=;
 b=VUmp9gXg3gFFyzdp3BYqvtlRiDQuHpwTyPbJtafqR5nqzevoh+CJyh9Tmk0l1rtePV
 BQbOyou6HXXPi0MIBkFBd/nDlZ7zW6oaWhgYkg1746g6vTjLUc4zchtLbTk5u6rlJFcH
 OqI/UsNrU0c1qnzSRe+90EsTnAep6Cxv9sDTgutpePZ2ftbb4+r2vBajlqvQ/FtfH2WQ
 tcRgrS0PSKtpdfnaJFY1e10PVH+8BMdvSdmZ03GeCrZjItWXejdM+25Q9PumbjfaRSBO
 Tl6c+VS+Z2ou82HkY5RIOvzff/ouDGE/WNAnF+hBwzsCmqGcMlKT5IZzkHUBtySUT505
 m+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uADmryRzUppwT0DoGC+vBgxjUH6ONtG4PbQCGFnnObM=;
 b=bTK8UsaBbe5IP4n9oSBm0LqsC7/g9BadIzuf+V2eLEZFNPJgXTpBXZpq9vHq5m6T/C
 YSLwixmLyklB7tsZDIfGE3UNGDrDFJrSDhmNbbukqJBXUg+kG2UvAF/Vv0KSRt7ZtG4C
 k57t63T9a4EcHV7qkkXxWwtz3JJCI+8i+mHn48utOcP8IY7OFITsrVkUoqx4dd10Zr4Q
 c4nylPZxeBuFmUZIkmWppRowWQiScFIg9IjFQY/t7DkdbzD+Ns6/x6jDMzNDfSDYxfiS
 GcNgDtDzORaw64BOtFbM/3aNEfY926QGsc6RyQmJQOW92z97bocvF3rVbXxsB8C2h0X6
 tDEA==
X-Gm-Message-State: ANhLgQ2ZhcTYSWPX5m8f0KJwigCnN/wBkCDblpvZmXb7eI/Omd71aJBH
 KxvcFWZAygERXysEt78k8DmVjg==
X-Google-Smtp-Source: ADFU+vu4pkafRt7ZpiQA2Qo9TSkli2LPgyls9Ykw3IxuaySmx8qfnahDqH8g+HMF46wNbf60JV5d8Q==
X-Received: by 2002:a05:620a:11b3:: with SMTP id
 c19mr4218673qkk.296.1583951715965; 
 Wed, 11 Mar 2020 11:35:15 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id c40sm5273938qtk.18.2020.03.11.11.35.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Mar 2020 11:35:15 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jC6CJ-000168-0X; Wed, 11 Mar 2020 15:35:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH hmm 1/8] mm/hmm: add missing unmaps of the ptep during
 hmm_vma_handle_pte()
Date: Wed, 11 Mar 2020 15:34:59 -0300
Message-Id: <20200311183506.3997-2-jgg@ziepe.ca>
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

Many of the direct returns of error skipped doing the pte_unmap(). All non
zero exit paths must unmap the pte.

The pte_unmap() is split unnaturally like this because some of the error
exit paths trigger a sleep and must release the lock before sleeping.

Fixes: 992de9a8b751 ("mm/hmm: allow to mirror vma of a file on a DAX backed filesystem")
Fixes: 53f5c3f489ec ("mm/hmm: factor out pte and pmd handling to simplify hmm_vma_walk_pmd()")
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 mm/hmm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 72e5a6d9a41756..35f85424176d14 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -325,6 +325,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 		}
 
 		/* Report error for everything else */
+		pte_unmap(ptep);
 		*pfn = range->values[HMM_PFN_ERROR];
 		return -EFAULT;
 	} else {
@@ -339,10 +340,13 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 	if (pte_devmap(pte)) {
 		hmm_vma_walk->pgmap = get_dev_pagemap(pte_pfn(pte),
 					      hmm_vma_walk->pgmap);
-		if (unlikely(!hmm_vma_walk->pgmap))
+		if (unlikely(!hmm_vma_walk->pgmap)) {
+			pte_unmap(ptep);
 			return -EBUSY;
+		}
 	} else if (IS_ENABLED(CONFIG_ARCH_HAS_PTE_SPECIAL) && pte_special(pte)) {
 		if (!is_zero_pfn(pte_pfn(pte))) {
+			pte_unmap(ptep);
 			*pfn = range->values[HMM_PFN_SPECIAL];
 			return -EFAULT;
 		}
@@ -437,7 +441,7 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 
 		r = hmm_vma_handle_pte(walk, addr, end, pmdp, ptep, &pfns[i]);
 		if (r) {
-			/* hmm_vma_handle_pte() did unmap pte directory */
+			/* hmm_vma_handle_pte() did pte_unmap() */
 			hmm_vma_walk->last = addr;
 			return r;
 		}
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
