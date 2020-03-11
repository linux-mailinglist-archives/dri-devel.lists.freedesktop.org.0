Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47312182A9D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 09:09:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B046EA4F;
	Thu, 12 Mar 2020 08:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1996E9E5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 18:35:20 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id e16so3097559qkl.6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 11:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8lEcVZbpC6FaqZy+Eys87JwANFXrjLZWV2hXSwo7DsY=;
 b=W2QcOA29+2hWCo5dDy/jbUb7GhqQlmsnMJZk/cECcBgqjRYGVtdV2RyzDV9agkzEDY
 kdGVL25lhvr2y1TCNOvtamw6p7HliGBbQOlw5wyKr5k01cZPcqO3bX8bYmGwGbdVbjzZ
 Qw2Q7wpYrxD4X6zOi2KLFKH5EiBC1WW9a0e7B7cX60TfFbRpaDvpECRZsYahA2FgOPcC
 l8evX/8XNukV9x7I9e6WmEE8SxUhCDwQ8vktxGPhdfd+O1KaOqLDUEEevOUGpLT1R1G+
 iwi43ZEr6GqkZtDpl7jhMmGOTb/j9MRuywyNP2Pf72IzWStQ2oSvqU+oCwVTGUwoilMP
 KaFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8lEcVZbpC6FaqZy+Eys87JwANFXrjLZWV2hXSwo7DsY=;
 b=uIcSVZwfioRJUiEYngM4mo+WfkQlq/UhprOzl03HpoccQw5atkXzMGfEhMiOAqvFrn
 DgPA+SJ7AQiEq/NXrnFRycKcXS28FIz0QzP/4LgzoGuBc+dWJ1D+OGOpHnq09G6jD3ju
 A6DRz+F91ptBRgdOfTSio7ryUvDyDyd0VxWS82+sQA0eqkbCsSIBYZvn5/952UpI/wT4
 iKriS0oJyaDR5bg1v5VZ8qWu00acGLdwoZVwXnhmNV1oUC5krPFXl402O0yqvaCf4/Mo
 BBNmycqnvkvNqmI6Kb0Ttvw1jATP5E6J+hbrqYr9cBzr58z6btGgE2LZRAakJh0lZOCe
 1ptQ==
X-Gm-Message-State: ANhLgQ3FqRGiv+0R+X2N8P75g6zy/NEJafFLJOoqmSEUnYcO8AtCkgSm
 75sND9RjqPMpy1/i34G8JmJ8yg==
X-Google-Smtp-Source: ADFU+vv42iIVOVgQYb8TOc186/XWa+snYITfoBWnXSMFRcjaqugUYatuGxkE3I0VXu08rjERKTHgkg==
X-Received: by 2002:a05:620a:134a:: with SMTP id
 c10mr4076890qkl.188.1583951719448; 
 Wed, 11 Mar 2020 11:35:19 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id d73sm7995274qkg.113.2020.03.11.11.35.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Mar 2020 11:35:16 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jC6CJ-00016F-3B; Wed, 11 Mar 2020 15:35:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH  hmm 2/8] mm/hmm: don't free the cached pgmap while scanning
Date: Wed, 11 Mar 2020 15:35:00 -0300
Message-Id: <20200311183506.3997-3-jgg@ziepe.ca>
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

The pgmap is held in the hmm_vma_walk variable in hope of speeding up
future get_dev_pagemap() calls by hitting the same pointer. The algorithm
doesn't actually care about how long the pgmap is held for.

Move the put of the cached pgmap to after the walk is completed and delete
all the other now redundant puts.

This solves a possible leak of the reference in hmm_vma_walk_pmd() if a
hmm_vma_handle_pte() fails while looping.

Fixes: 992de9a8b751 ("mm/hmm: allow to mirror vma of a file on a DAX backed filesystem")
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 mm/hmm.c | 31 +++++++++----------------------
 1 file changed, 9 insertions(+), 22 deletions(-)

We talked about just deleting this stuff, but I think it makes alot sense for
hmm_range_fault() to trigger fault on devmap pages that are not compatible
with the caller - so lets just fix the leak on error path for now.

diff --git a/mm/hmm.c b/mm/hmm.c
index 35f85424176d14..9e8f68eb83287a 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -239,10 +239,6 @@ static int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
 		}
 		pfns[i] = hmm_device_entry_from_pfn(range, pfn) | cpu_flags;
 	}
-	if (hmm_vma_walk->pgmap) {
-		put_dev_pagemap(hmm_vma_walk->pgmap);
-		hmm_vma_walk->pgmap = NULL;
-	}
 	hmm_vma_walk->last = end;
 	return 0;
 }
@@ -360,10 +356,6 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 	return 0;
 
 fault:
-	if (hmm_vma_walk->pgmap) {
-		put_dev_pagemap(hmm_vma_walk->pgmap);
-		hmm_vma_walk->pgmap = NULL;
-	}
 	pte_unmap(ptep);
 	/* Fault any virtual address we were asked to fault */
 	return hmm_vma_walk_hole_(addr, end, fault, write_fault, walk);
@@ -446,16 +438,6 @@ static int hmm_vma_walk_pmd(pmd_t *pmdp,
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
@@ -529,10 +511,6 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
 			pfns[i] = hmm_device_entry_from_pfn(range, pfn) |
 				  cpu_flags;
 		}
-		if (hmm_vma_walk->pgmap) {
-			put_dev_pagemap(hmm_vma_walk->pgmap);
-			hmm_vma_walk->pgmap = NULL;
-		}
 		hmm_vma_walk->last = end;
 		goto out_unlock;
 	}
@@ -694,6 +672,15 @@ long hmm_range_fault(struct hmm_range *range, unsigned int flags)
 			return -EBUSY;
 		ret = walk_page_range(mm, hmm_vma_walk.last, range->end,
 				      &hmm_walk_ops, &hmm_vma_walk);
+		/*
+		 * A pgmap is kept cached in the hmm_vma_walk to avoid expensive
+		 * searching in the probably common case that the pgmap is the
+		 * same for the entire requested range.
+		 */
+		if (hmm_vma_walk.pgmap) {
+			put_dev_pagemap(hmm_vma_walk.pgmap);
+			hmm_vma_walk.pgmap = NULL;
+		}
 	} while (ret == -EBUSY);
 
 	if (ret)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
