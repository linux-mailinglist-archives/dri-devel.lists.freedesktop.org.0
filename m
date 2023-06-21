Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4246D738BEC
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 18:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92C310E324;
	Wed, 21 Jun 2023 16:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D6F10E32D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 16:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=V8mDv0EPPLn9jbcc1q5//Yn83nwPOxgWUqrHoyXGI0c=; b=PLRq9KKLTjSuYOK7GHTRrCHMdg
 05lLjp1ehbCv+052CPARXxvQnb1O43zxj7iURZQn/E1jaN0bwIQW5tu0K45Zbr+3zxWU+wPrVZlCK
 +QqsOSr6EUqo15LlAazBFikNdb1fRpMqJvFYQgSLPIYQxMIV53HL0n1UNVHnv6JnPh6JKkExbpJ6p
 J6MYSwHHyE8H5k3lgy2R+EbEeMzUGq7Yt8LNMEzUcWUZ+ExfwFRmFIPsNXNCW5Mk31QYFy5kzCoHz
 0e5RPgd7Cd8SGsqqWpYTptkDT+lG0sounVV2V2o0EUvc/3O7Y3fLam5B//dQFJa/rpuagffUbR3Pv
 xw/swJBg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qC0y1-00EjDg-9p; Wed, 21 Jun 2023 16:46:01 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 01/13] afs: Convert pagevec to folio_batch in
 afs_extend_writeback()
Date: Wed, 21 Jun 2023 17:45:45 +0100
Message-Id: <20230621164557.3510324-2-willy@infradead.org>
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

Removes a folio->page->folio conversion for each folio that's involved.
More importantly, removes one of the last few uses of a pagevec.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/afs/write.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/afs/write.c b/fs/afs/write.c
index 18ccb613dff8..6e68c70d0b22 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -465,7 +465,7 @@ static void afs_extend_writeback(struct address_space *mapping,
 				 bool caching,
 				 unsigned int *_len)
 {
-	struct pagevec pvec;
+	struct folio_batch fbatch;
 	struct folio *folio;
 	unsigned long priv;
 	unsigned int psize, filler = 0;
@@ -476,7 +476,7 @@ static void afs_extend_writeback(struct address_space *mapping,
 	unsigned int i;
 
 	XA_STATE(xas, &mapping->i_pages, index);
-	pagevec_init(&pvec);
+	folio_batch_init(&fbatch);
 
 	do {
 		/* Firstly, we gather up a batch of contiguous dirty pages
@@ -535,7 +535,7 @@ static void afs_extend_writeback(struct address_space *mapping,
 				stop = false;
 
 			index += folio_nr_pages(folio);
-			if (!pagevec_add(&pvec, &folio->page))
+			if (!folio_batch_add(&fbatch, folio))
 				break;
 			if (stop)
 				break;
@@ -545,14 +545,14 @@ static void afs_extend_writeback(struct address_space *mapping,
 			xas_pause(&xas);
 		rcu_read_unlock();
 
-		/* Now, if we obtained any pages, we can shift them to being
+		/* Now, if we obtained any folios, we can shift them to being
 		 * writable and mark them for caching.
 		 */
-		if (!pagevec_count(&pvec))
+		if (!folio_batch_count(&fbatch))
 			break;
 
-		for (i = 0; i < pagevec_count(&pvec); i++) {
-			folio = page_folio(pvec.pages[i]);
+		for (i = 0; i < folio_batch_count(&fbatch); i++) {
+			folio = fbatch.folios[i];
 			trace_afs_folio_dirty(vnode, tracepoint_string("store+"), folio);
 
 			if (!folio_clear_dirty_for_io(folio))
@@ -565,7 +565,7 @@ static void afs_extend_writeback(struct address_space *mapping,
 			folio_unlock(folio);
 		}
 
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 	} while (!stop);
 
-- 
2.39.2

