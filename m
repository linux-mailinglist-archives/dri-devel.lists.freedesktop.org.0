Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 312ECA7919E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 17:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B1F10E7F9;
	Wed,  2 Apr 2025 15:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="Rgpmie3P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0632410E7FB;
 Wed,  2 Apr 2025 15:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=HxorfBgE1Uv1byaGENr7pDp1WuWnctNAqk3G3c3CU84=; b=Rgpmie3PxYC1mfYW3w8XJdLFLM
 68IZm5NGrCaClZqC3nKJYdIKGsB9h3JMsYOLPPY8ATYR0OcEt13uXZk9CS0jPSa/6/OEnVSnp+edn
 JtxL3K6k/cAaAPnIWeuw6+iwIVR25bAFZBbxqjronOrOtc8H5iobhcWmrZQdGWb2o0JqDsgecbGEB
 HfdWvIXKNnyRerhjAo32CuQy3pHoEKaBz0FHeCA9ZaSmapfUsfM+zxb2hRq+btwmZYOlie2LnekjW
 vQoPBKxXlold4/4j1Yc7w9yTYhuj1kWqrWw/hO7N07E6HYSJUOZHneXcoL9DAx1IweKyALy4yV8tG
 M75fmUIw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzzZX-00000009gsR-2QUj;
 Wed, 02 Apr 2025 15:00:07 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/9] i915: Use writeback_iter()
Date: Wed,  2 Apr 2025 16:00:00 +0100
Message-ID: <20250402150005.2309458-7-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402150005.2309458-1-willy@infradead.org>
References: <20250402150005.2309458-1-willy@infradead.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert from an inefficient loop to the standard writeback iterator.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 32 ++++++-----------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index ae3343c81a64..5e784db9f315 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -305,36 +305,20 @@ void __shmem_writeback(size_t size, struct address_space *mapping)
 		.range_end = LLONG_MAX,
 		.for_reclaim = 1,
 	};
-	unsigned long i;
+	struct folio *folio = NULL;
+	int error = 0;
 
 	/*
 	 * Leave mmapings intact (GTT will have been revoked on unbinding,
-	 * leaving only CPU mmapings around) and add those pages to the LRU
+	 * leaving only CPU mmapings around) and add those folios to the LRU
 	 * instead of invoking writeback so they are aged and paged out
 	 * as normal.
 	 */
-
-	/* Begin writeback on each dirty page */
-	for (i = 0; i < size >> PAGE_SHIFT; i++) {
-		struct page *page;
-
-		page = find_lock_page(mapping, i);
-		if (!page)
-			continue;
-
-		if (!page_mapped(page) && clear_page_dirty_for_io(page)) {
-			int ret;
-
-			SetPageReclaim(page);
-			ret = mapping->a_ops->writepage(page, &wbc);
-			if (!PageWriteback(page))
-				ClearPageReclaim(page);
-			if (!ret)
-				goto put;
-		}
-		unlock_page(page);
-put:
-		put_page(page);
+	while ((folio = writeback_iter(mapping, &wbc, folio, &error))) {
+		if (folio_mapped(folio))
+			folio_redirty_for_writepage(&wbc, folio);
+		else
+			error = shmem_writeout(folio, &wbc);
 	}
 }
 
-- 
2.47.2

