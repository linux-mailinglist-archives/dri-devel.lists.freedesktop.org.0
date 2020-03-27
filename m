Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B783197533
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC24D6E039;
	Mon, 30 Mar 2020 07:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEDA6E0F2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 20:00:29 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id x3so12196409qki.4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 13:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l6FSIJA11GUWp0iQEXEKmA47YraWhMsGW7mGBig6TKg=;
 b=B8VIl8CsE0i+yz5ktETkDbP6oCOwB9jFF8uCJ5FsWSqFmwjzIX+ImPVf858PHxOngZ
 ar1UKDakP5k672+PK0UTM50jgjlop3Up/AAzRr6TcXWAf6PymK/aYrFCVX+YRsLSHbWm
 BWMdTTu4lzuUPsSXRrv1YIzdXO6RBckMWW+1LFkz/8bclf6GpGihBt3R+5ir6kcwRwT4
 waTAzWqFFB7r/KeILUCDs+8sdRcwDLOUFMQx+DnVqZcxVqd475UoFYlunnDoT7OUmUWp
 4FXzV+aeAYANqWe0j4RUopm83PCyP3jcmVpMUqI/YhPVOy6WF4QHlKb3XvRoKGBXj7kS
 E7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l6FSIJA11GUWp0iQEXEKmA47YraWhMsGW7mGBig6TKg=;
 b=c9AZ+TKiY4dtgywxPQ3CYvQIWV/CCnZ7z6pYEJYq9wWEjfGhnSpNnXteMOHJgko77Z
 VW4BsJbNBFsgIwMLEIvk96g+QnUwscKvqiYjAQ7ybHhTCeQXlflmSevClehLAtWJIBWf
 2CzCB7AWuGyj4wzxNJVNdCsdqkZCedTqs/yYE/il2M7H2Uh3IZ88OyIRBmNZoJnA5atY
 Y6zG3PnPq+1TH+UqVXT9ENDgRhm7j+WGL2CMwa3sUiVfgQ/IuetGx9RQR4t/bPg1gw+p
 F1I1vidTMEoqVGbkqH2lHuw3w9O/T3HPEmx38oIy9mrkP386xsMts5znILZiCmpwYz63
 stIA==
X-Gm-Message-State: ANhLgQ0wZw216FNdC5UGmhn3v8HwqodQvqiyWw8iO2BlAIgPhG4FbhYg
 zBKXO9nIi0OYkN9jW2MO5OnQxw==
X-Google-Smtp-Source: ADFU+vvf5lpmfE6Vv1KUN24OJu+znyEDbu+4t7Aq/PDfqWm3EIcAZ1pXP806ufmPt/PEbjgcavPE0g==
X-Received: by 2002:a37:aec2:: with SMTP id x185mr1076168qke.45.1585339228406; 
 Fri, 27 Mar 2020 13:00:28 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id j6sm4681752qti.25.2020.03.27.13.00.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 27 Mar 2020 13:00:25 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jHv9U-0007fT-UC; Fri, 27 Mar 2020 17:00:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH v2 hmm 1/9] mm/hmm: remove pgmap checking for devmap pages
Date: Fri, 27 Mar 2020 17:00:13 -0300
Message-Id: <20200327200021.29372-2-jgg@ziepe.ca>
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

The checking boils down to some racy check if the pagemap is still
available or not. Instead of checking this, rely entirely on the
notifiers, if a pagemap is destroyed then all pages that belong to it must
be removed from the tables and the notifiers triggered.

Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Tested-by: Ralph Campbell <rcampbell@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 mm/hmm.c | 50 ++------------------------------------------------
 1 file changed, 2 insertions(+), 48 deletions(-)

diff --git a/mm/hmm.c b/mm/hmm.c
index a491d9aaafe45d..3a2610e0713329 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -28,7 +28,6 @@
 
 struct hmm_vma_walk {
 	struct hmm_range	*range;
-	struct dev_pagemap	*pgmap;
 	unsigned long		last;
 	unsigned int		flags;
 };
@@ -196,19 +195,8 @@ static int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
 		return hmm_vma_fault(addr, end, fault, write_fault, walk);
 
 	pfn = pmd_pfn(pmd) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
-	for (i = 0; addr < end; addr += PAGE_SIZE, i++, pfn++) {
-		if (pmd_devmap(pmd)) {
-			hmm_vma_walk->pgmap = get_dev_pagemap(pfn,
-					      hmm_vma_walk->pgmap);
-			if (unlikely(!hmm_vma_walk->pgmap))
-				return -EBUSY;
-		}
+	for (i = 0; addr < end; addr += PAGE_SIZE, i++, pfn++)
 		pfns[i] = hmm_device_entry_from_pfn(range, pfn) | cpu_flags;
-	}
-	if (hmm_vma_walk->pgmap) {
-		put_dev_pagemap(hmm_vma_walk->pgmap);
-		hmm_vma_walk->pgmap = NULL;
-	}
 	hmm_vma_walk->last = end;
 	return 0;
 }
@@ -300,15 +288,6 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 	if (fault || write_fault)
 		goto fault;
 
-	if (pte_devmap(pte)) {
-		hmm_vma_walk->pgmap = get_dev_pagemap(pte_pfn(pte),
-					      hmm_vma_walk->pgmap);
-		if (unlikely(!hmm_vma_walk->pgmap)) {
-			pte_unmap(ptep);
-			return -EBUSY;
-		}
-	}
-
 	/*
 	 * Since each architecture defines a struct page for the zero page, just
 	 * fall through and treat it like a normal page.
@@ -328,10 +307,6 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 	return 0;
 
 fault:
-	if (hmm_vma_walk->pgmap) {
-		put_dev_pagemap(hmm_vma_walk->pgmap);
-		hmm_vma_walk->pgmap = NULL;
-	}
 	pte_unmap(ptep);
 	/* Fault any virtual address we were asked to fault */
 	return hmm_vma_fault(addr, end, fault, write_fault, walk);
@@ -418,16 +393,6 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
 			return r;
 		}
 	}
-	if (hmm_vma_walk->pgmap) {
-		/*
-		 * We do put_dev_pagemap() here and not in hmm_vma_handle_pte()
-		 * so that we can leverage get_dev_pagemap() optimization which
-		 * will not re-take a reference on a pgmap if we already have
-		 * one.
-		 */
-		put_dev_pagemap(hmm_vma_walk->pgmap);
-		hmm_vma_walk->pgmap = NULL;
-	}
 	pte_unmap(ptep - 1);
 
 	hmm_vma_walk->last = addr;
@@ -491,20 +456,9 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
 		}
 
 		pfn = pud_pfn(pud) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
-		for (i = 0; i < npages; ++i, ++pfn) {
-			hmm_vma_walk->pgmap = get_dev_pagemap(pfn,
-					      hmm_vma_walk->pgmap);
-			if (unlikely(!hmm_vma_walk->pgmap)) {
-				ret = -EBUSY;
-				goto out_unlock;
-			}
+		for (i = 0; i < npages; ++i, ++pfn)
 			pfns[i] = hmm_device_entry_from_pfn(range, pfn) |
 				  cpu_flags;
-		}
-		if (hmm_vma_walk->pgmap) {
-			put_dev_pagemap(hmm_vma_walk->pgmap);
-			hmm_vma_walk->pgmap = NULL;
-		}
 		hmm_vma_walk->last = end;
 		goto out_unlock;
 	}
-- 
2.25.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
