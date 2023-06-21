Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E439738BF1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 18:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D99410E32F;
	Wed, 21 Jun 2023 16:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7966510E329
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 16:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=7niWMu6g/Ga9ZksmA0zYh6a0pI2cBG5yqVDcIc9jMKw=; b=mY+uBPiycIfHNeNVplxKugqw8y
 ja2K6C7MvJK6a5FI2+yURLUgfwFYXZEiQLFhJKZKFoH26P6b8EqoKQNl4q/RV/1sfv1WL7OKRLXrA
 INno6Z7BtR+COXHsKd7SXQ6k1Df/kRG5SHduBcfxktVSs0GP9cCVaLt+gjY79DWa5MOXGMXWbYAT6
 etNCZZSKWiK1mHVDNJ+WCmubynjm50iSWFRDEX+P84WWha4AngPA+I2KS8lh3AQ0Lhy0SKsmaFCKv
 oy8NE0qqvtkZw7y0DBgRqj6k2mTOcmX89ClyhVMXPPrdLQC/DiqTeH0jAYyZs7bulU0tpckAefW40
 zJ4u14gw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qC0y1-00EjDy-P0; Wed, 21 Jun 2023 16:46:01 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 06/13] mm: Remove check_move_unevictable_pages()
Date: Wed, 21 Jun 2023 17:45:50 +0100
Message-Id: <20230621164557.3510324-7-willy@infradead.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230621164557.3510324-1-willy@infradead.org>
References: <20230621164557.3510324-1-willy@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All callers have now been converted to call check_move_unevictable_folios().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/swap.h |  1 -
 mm/vmscan.c          | 17 -----------------
 2 files changed, 18 deletions(-)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index ce7e82cf787f..456546443f1f 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -439,7 +439,6 @@ static inline bool node_reclaim_enabled(void)
 }
 
 void check_move_unevictable_folios(struct folio_batch *fbatch);
-void check_move_unevictable_pages(struct pagevec *pvec);
 
 extern void __meminit kswapd_run(int nid);
 extern void __meminit kswapd_stop(int nid);
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 45d17c7cc555..f8dd1db15897 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -8074,23 +8074,6 @@ int node_reclaim(struct pglist_data *pgdat, gfp_t gfp_mask, unsigned int order)
 }
 #endif
 
-void check_move_unevictable_pages(struct pagevec *pvec)
-{
-	struct folio_batch fbatch;
-	unsigned i;
-
-	folio_batch_init(&fbatch);
-	for (i = 0; i < pvec->nr; i++) {
-		struct page *page = pvec->pages[i];
-
-		if (PageTransTail(page))
-			continue;
-		folio_batch_add(&fbatch, page_folio(page));
-	}
-	check_move_unevictable_folios(&fbatch);
-}
-EXPORT_SYMBOL_GPL(check_move_unevictable_pages);
-
 /**
  * check_move_unevictable_folios - Move evictable folios to appropriate zone
  * lru list
-- 
2.39.2

