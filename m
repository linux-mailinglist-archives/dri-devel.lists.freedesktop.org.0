Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3DB197543
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:14:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210EE6E0ED;
	Mon, 30 Mar 2020 07:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 363706EA73
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 20:00:35 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id z13so5567262qvw.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 13:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9QoBL2elXCgBQYfLUofWPZ+WlaBKVcEFC/RukhDLmrw=;
 b=WuL3sUI3tbw/U0XG7NWMDd1WUeDaBUsogCrq7+FDuRkAbsrKV82rHP4vcJwfLkF2gg
 7RFowYXUucT+ro5VSC9QSk0FrDwJabuexGQSPqng1BwqiZzp2un/0xDQ2mk5Knu6XEkh
 LbUoPopLvqKJ+0wumG9i0lhmsK01rb8n+mS19r2NwNP7c0uB5g2vLSXjwzZjvwxNWWUo
 kSLlfGN3HEmGqe58GdPkfi1QlPKBCxRJRBDQmZ1S+Q0BjI1a4SOjbGTjECQO+gcGk6mH
 lXiJMw3Qwp+Kt00yXEuxFp2hlnG7TKcI78dnI10wbTpfjf8nVZVas3N7BcXJPe63KZTC
 fcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9QoBL2elXCgBQYfLUofWPZ+WlaBKVcEFC/RukhDLmrw=;
 b=BF+d07VqpXfMhE19Y4yn2ilm+28tVJPr9JpQVbBxhDgJzSVCAcQosLM1lbL2ao34/l
 Zw/45Tv6Tqffdl2n++gEGaSSmhDx4aSBKnG8K9foEaQ7xoZKFFMYzhxFp3suetXc74MC
 cv9SfYcdJNH5uimVrSMfKOEs2C33aoNGTPBGXRlnW50GhHRxEhdz1HRMjjbeRR95vK/h
 /pplmeN5f7slg7KNlx7vB8X/qN5lrnUoR2WxujZ/mj4TK+CPH435McjHtxVgs4v2NoFW
 0RWN9H9PvdYWnxODxj1pn0A7TaSRSsA0LdaSJDAAb/Cy7uYUsscx77+HwS2U0T8g0oI1
 55/g==
X-Gm-Message-State: ANhLgQ3rk9PVfG2322aW9dOq7US5WkPVrwWsghtNLR0CBDg+4Sy92ss/
 epeoqj1uhAJYleUj5EMC5qa9NA==
X-Google-Smtp-Source: ADFU+vsJyJRZmZ5TMEYNXYMMzAdCRdRiK4gIWxEwhTOBgyVY+Pj2x550WvJcZ6da79IK6DKEnEHegw==
X-Received: by 2002:ad4:43c1:: with SMTP id o1mr963932qvs.56.1585339234373;
 Fri, 27 Mar 2020 13:00:34 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id o81sm4515430qke.24.2020.03.27.13.00.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 27 Mar 2020 13:00:27 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jHv9V-0007fs-5I; Fri, 27 Mar 2020 17:00:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH v2 hmm 5/9] mm/hmm: remove the CONFIG_TRANSPARENT_HUGEPAGE
 #ifdef
Date: Fri, 27 Mar 2020 17:00:17 -0300
Message-Id: <20200327200021.29372-6-jgg@ziepe.ca>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200327200021.29372-1-jgg@ziepe.ca>
References: <20200327200021.29372-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:45 +0000
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
Reviewed-by: Christoph Hellwig <hch@lst.de>
Tested-by: Ralph Campbell <rcampbell@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 mm/hmm.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index 8dbd9e1d0308b4..3a71ec72b0a42f 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -193,7 +193,6 @@ static inline uint64_t pmd_to_hmm_pfn_flags(struct hmm_range *range, pmd_t pmd)
 				range->flags[HMM_PFN_VALID];
 }
 
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
 		unsigned long end, uint64_t *pfns, pmd_t pmd)
 {
@@ -216,11 +215,6 @@ static int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
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
