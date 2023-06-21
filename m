Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7218A738BEF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 18:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004BD10E25A;
	Wed, 21 Jun 2023 16:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716AF10E323
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 16:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=S9L58IPbLSJMGWxFtvlnrG4TzIQ7IOqSwhUMe45kT8U=; b=PW4Dwh4Gf1suM6iF8qmdwxhedV
 dGBA+OGAVi6nz1TzXhqQwejLNG6p8I/gHBdyJdF+v9Gwlfc+qXUjfsQRhEupLyGODb3oBlcxjqeZg
 MjDYrwlGzkp9KSAXfQWGPMLoY7z8XE2Ha7+Drv6kVcDGv88l6mKIj3vMNnmJc0wPJLF/1/j23opEa
 eo5D3L64k7UfoSUT0lpwRO6h7SIv4cOQ8G08UCt/pjyMlmUKsodXKsDFTzzN9xwAVenix5X7iC12y
 ymJp18fQp4MbBy2x2WRcwk0mKw0eF20AfD6Cvpc56WVKj7Wa6gjeZD91h/NOb3XGNU2NojtTr6joC
 HO//Edeg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qC0y2-00EjEL-0r; Wed, 21 Jun 2023 16:46:02 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 08/13] i915: Convert i915_gpu_error to use a folio_batch
Date: Wed, 21 Jun 2023 17:45:52 +0100
Message-Id: <20230621164557.3510324-9-willy@infradead.org>
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

Remove one of the last remaining users of pagevec.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 50 +++++++++++++--------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index ec368e700235..0c38bfb60c9a 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -187,64 +187,64 @@ i915_error_printer(struct drm_i915_error_state_buf *e)
 }
 
 /* single threaded page allocator with a reserved stash for emergencies */
-static void pool_fini(struct pagevec *pv)
+static void pool_fini(struct folio_batch *fbatch)
 {
-	pagevec_release(pv);
+	folio_batch_release(fbatch);
 }
 
-static int pool_refill(struct pagevec *pv, gfp_t gfp)
+static int pool_refill(struct folio_batch *fbatch, gfp_t gfp)
 {
-	while (pagevec_space(pv)) {
-		struct page *p;
+	while (folio_batch_space(fbatch)) {
+		struct folio *folio;
 
-		p = alloc_page(gfp);
-		if (!p)
+		folio = folio_alloc(gfp, 0);
+		if (!folio)
 			return -ENOMEM;
 
-		pagevec_add(pv, p);
+		folio_batch_add(fbatch, folio);
 	}
 
 	return 0;
 }
 
-static int pool_init(struct pagevec *pv, gfp_t gfp)
+static int pool_init(struct folio_batch *fbatch, gfp_t gfp)
 {
 	int err;
 
-	pagevec_init(pv);
+	folio_batch_init(fbatch);
 
-	err = pool_refill(pv, gfp);
+	err = pool_refill(fbatch, gfp);
 	if (err)
-		pool_fini(pv);
+		pool_fini(fbatch);
 
 	return err;
 }
 
-static void *pool_alloc(struct pagevec *pv, gfp_t gfp)
+static void *pool_alloc(struct folio_batch *fbatch, gfp_t gfp)
 {
-	struct page *p;
+	struct folio *folio;
 
-	p = alloc_page(gfp);
-	if (!p && pagevec_count(pv))
-		p = pv->pages[--pv->nr];
+	folio = folio_alloc(gfp, 0);
+	if (!folio && folio_batch_count(fbatch))
+		folio = fbatch->folios[--fbatch->nr];
 
-	return p ? page_address(p) : NULL;
+	return folio ? folio_address(folio) : NULL;
 }
 
-static void pool_free(struct pagevec *pv, void *addr)
+static void pool_free(struct folio_batch *fbatch, void *addr)
 {
-	struct page *p = virt_to_page(addr);
+	struct folio *folio = virt_to_folio(addr);
 
-	if (pagevec_space(pv))
-		pagevec_add(pv, p);
+	if (folio_batch_space(fbatch))
+		folio_batch_add(fbatch, folio);
 	else
-		__free_page(p);
+		folio_put(folio);
 }
 
 #ifdef CONFIG_DRM_I915_COMPRESS_ERROR
 
 struct i915_vma_compress {
-	struct pagevec pool;
+	struct folio_batch pool;
 	struct z_stream_s zstream;
 	void *tmp;
 };
@@ -381,7 +381,7 @@ static void err_compression_marker(struct drm_i915_error_state_buf *m)
 #else
 
 struct i915_vma_compress {
-	struct pagevec pool;
+	struct folio_batch pool;
 };
 
 static bool compress_init(struct i915_vma_compress *c)
-- 
2.39.2

