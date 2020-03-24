Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C50A190725
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 09:10:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B256E455;
	Tue, 24 Mar 2020 08:10:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77DC46E43B
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 01:15:14 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id d12so11252579qtj.4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 18:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8z+Ak8LJ4cusnv639Xm98KV9Wso4IbiTcHYELSH/G24=;
 b=HhKFH+h9dsFIf1c+y5ZAjNcHJkLfL/7TByr8KqLLVhFohTYKwWhXx2XiETLziarPtW
 HmC89Ua/ZfOQ53NE5bjqh2YkzI3VjXOn9sjDenilAjM2tgLtIs+v5bMY3AnTgGPB6sBY
 b1oed859g52WVKLkm7EBX27mr9X3LBNTceG4ymOTF3BxLJp8wDGWq+wXPMW1orpJA3y1
 o4TLZlvcbSHFVCu7RdAGl/h2z1hO8vJNXGZX6OIQ3uwn+EpAbkt+7b1ZXGgMMqMoOzpy
 FqJ5FKyR0qY7mwkSGi6gaRmlHxT/E4dqGkJiaugNvgjpT+6iFBJR1xYGeMw1Je2MPBe6
 BQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8z+Ak8LJ4cusnv639Xm98KV9Wso4IbiTcHYELSH/G24=;
 b=fvFiq0FA78qT1sdwNT5jT5RHyFC+XimXX48XbrLa3aolDSEU+gq0xldhcNzRRWglKv
 VtNNEwqfZ0ILOZ3Lzkc16A5BwgIOcptZAOhcHemfadHB5e8Q8zbpmzCzSm9YHLGUz3K3
 FPSSpnutWGSppKRTTv102eCJxaQbWKopz0Rig83UHD4QTXUY3JMZysavIKVspHTZtCoI
 ZGtMqNAnYaSppVboEZECLBRxFX3nwp3MWrIo4v8NEbG74q32hfJ+Sdn2XUSe0gDzjzdc
 b0buCy6pMJLtYsZyrJfK6p2FRxFnh0mJTshLFIBMfSFaClvXQjvft5LxYaYInOdgohFR
 v/7g==
X-Gm-Message-State: ANhLgQ3ZoSZtAkQT6FZuqiglepiPCJW88utRsbCU5qstlK+ox8JEPpEO
 bxIpLzb5d8+Ndj+14oMi05cMAw==
X-Google-Smtp-Source: ADFU+vtZbGElVq6NnluuIoEaJ5hmkuMgLimt1kzM3fgd1S4xdMrXicEqcrH3LtFkdjgiw9dY0n+5gA==
X-Received: by 2002:ac8:3105:: with SMTP id g5mr3662259qtb.358.1585012513624; 
 Mon, 23 Mar 2020 18:15:13 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id l13sm12025440qke.116.2020.03.23.18.15.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 23 Mar 2020 18:15:11 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jGY9u-0000rC-9H; Mon, 23 Mar 2020 22:15:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH v2 hmm 5/9] mm/hmm: remove the CONFIG_TRANSPARENT_HUGEPAGE
 #ifdef
Date: Mon, 23 Mar 2020 22:14:53 -0300
Message-Id: <20200324011457.2817-6-jgg@ziepe.ca>
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

This code can be compiled when CONFIG_TRANSPARENT_HUGEPAGE is off, so
remove the ifdef.

The function is only ever called under

   if (pmd_devmap(pmd) || pmd_trans_huge(pmd))

Which is statically false if !CONFIG_TRANSPARENT_HUGEPAGE, so the compiler
reliably eliminates all of this code.

Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 mm/hmm.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 43d107a4d9dec6..f59e59fb303e95 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -198,7 +198,6 @@ static inline uint64_t pmd_to_hmm_pfn_flags(struct hmm_range *range, pmd_t pmd)
 				range->flags[HMM_PFN_VALID];
 }
 
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
 		unsigned long end, uint64_t *pfns, pmd_t pmd)
 {
@@ -221,11 +220,6 @@ static int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
 	hmm_vma_walk->last = end;
 	return 0;
 }
-#else /* CONFIG_TRANSPARENT_HUGEPAGE */
-/* stub to allow the code below to compile */
-int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
-		unsigned long end, uint64_t *pfns, pmd_t pmd);
-#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 static inline bool hmm_is_device_private_entry(struct hmm_range *range,
 		swp_entry_t entry)
-- 
2.25.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
