Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BED5182ADA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8ED76EAA7;
	Thu, 12 Mar 2020 08:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28036E9E4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 18:35:19 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id du17so1337969qvb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 11:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QKMl+66IkY5RJBc0Lj1AmzrrF9o7Pt2qhF3I7u882Ls=;
 b=My+Tr5obADx21Hw+/1ZHcQU2g7c3b+OTd5/wmC6UjpMNkjW0hIDHzK8ddjx9NxansQ
 xMX4Aj/BzOraQiOZJMCoAJ8BCbWpA76TeDQJpSF1cBs17/ZSUbEOp4oTniYhhkumK6D7
 KPLipNTzlsr1LrvMhvbr+cT/iJpfFUGKIEcWYdHQmJuix/X8M9v34cDlqNcvcZb93gg/
 qmECXi4N7kLooQrxoej2u3Z7KgVr5NUCbBqtvxqBvM21srVWLIok/zC+S/xT+e22qQba
 ye/unTNuQ58XryNUiO+MHYbpZFny3E4SK95zolNONBnkBWCTXSu4FmHMN6+0AqoaxvaT
 c/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QKMl+66IkY5RJBc0Lj1AmzrrF9o7Pt2qhF3I7u882Ls=;
 b=Q3hLdEX08wTyhjV5Pr4lECbDoDciE3i7kztqD9HB0FIk5VJ7aTvkvttSq9b0qfd99t
 u2gDvjQVKkiUulfJ4HbGNPrQvDiV+vNXkgtD+8nbHfF9rnU4MH+NNHWBPITBMOwyKcPh
 ycYSI2kdrnp10kX4hCUwxw/VPoGaLj1v+XiY/CzXLoxsemasG5H1tIUuOh2Qt4II1Q8a
 zCvYBVelfhlWyQY+AjlFnwpb9K99YujtZYDQkvKV5zTyxtNt54qh5txTij3/jf1Ovi2D
 PFtvJSDQ6YxFVOoQlg3Ix2StP9vC1NAPgcyfQ7NZ8WXK2rnuN+KIcEjRerpgj1VyoK4S
 JKZQ==
X-Gm-Message-State: ANhLgQ0zYquPrZGLU8mcrMpGVz677ULJGnqE8z8KRZW6RFeEzSsRQSlw
 md5aXReIpnY48PzAU4EA90wd1w==
X-Google-Smtp-Source: ADFU+vtfPiOC5zRwhZ8OGnDckKKD8dKwbpO/uXMgStKCVg9GMeRPWKdwyL8T6AA5IGkEm62LONCB8g==
X-Received: by 2002:ad4:4a89:: with SMTP id h9mr4082034qvx.168.1583951719048; 
 Wed, 11 Mar 2020 11:35:19 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id 17sm9154803qkm.105.2020.03.11.11.35.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Mar 2020 11:35:16 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jC6CJ-00016p-Dt; Wed, 11 Mar 2020 15:35:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH hmm 8/8] mm/hmm: add missing call to hmm_pte_need_fault in
 HMM_PFN_SPECIAL handling
Date: Wed, 11 Mar 2020 15:35:06 -0300
Message-Id: <20200311183506.3997-9-jgg@ziepe.ca>
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

Currently if a special PTE is encountered hmm_range_fault() immediately
returns EFAULT and sets the HMM_PFN_SPECIAL error output (which nothing
uses).

EFAULT should only be returned after testing with hmm_pte_need_fault().

Also pte_devmap() and pte_special() are exclusive, and there is no need to
check IS_ENABLED, pte_special() is stubbed out to return false on
unsupported architectures.

Fixes: 992de9a8b751 ("mm/hmm: allow to mirror vma of a file on a DAX backed filesystem")
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 mm/hmm.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index f61fddf2ef6505..ca33d086bdc190 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -335,16 +335,21 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 			pte_unmap(ptep);
 			return -EBUSY;
 		}
-	} else if (IS_ENABLED(CONFIG_ARCH_HAS_PTE_SPECIAL) && pte_special(pte)) {
-		if (!is_zero_pfn(pte_pfn(pte))) {
+	}
+
+	/*
+	 * Since each architecture defines a struct page for the zero page, just
+	 * fall through and treat it like a normal page.
+	 */
+	if (pte_special(pte) && !is_zero_pfn(pte_pfn(pte))) {
+		hmm_pte_need_fault(hmm_vma_walk, orig_pfn, 0, &fault,
+				   &write_fault);
+		if (fault || write_fault) {
 			pte_unmap(ptep);
-			*pfn = range->values[HMM_PFN_SPECIAL];
 			return -EFAULT;
 		}
-		/*
-		 * Since each architecture defines a struct page for the zero
-		 * page, just fall through and treat it like a normal page.
-		 */
+		*pfn = range->values[HMM_PFN_SPECIAL];
+		return 0;
 	}
 
 	*pfn = hmm_device_entry_from_pfn(range, pte_pfn(pte)) | cpu_flags;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
