Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70027738C0F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 18:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B5F10E332;
	Wed, 21 Jun 2023 16:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767F310E328
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 16:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=AQBN8EOVNpFsbWS+GiPKIXRePvvUD9BdImp+Rjg78p8=; b=b7ub/H7BmTbgUPuQXUwrP95FRP
 0IEUGdTz1HyQpbYbP/rbXcBqz+W7V+5ZyOjKUhJSJl1n0gWxNajfSW0gpLlDNGLr+5x3X7lQR0rGc
 sJWHL9uXmDvqiZXMwcdWkmeIwBlxZ0p2TGny4RZf+u9Oy/cwjqb38MgaLGQbLvGbHq+8CEI/DGZKo
 gUMOu3TMpZs3AvjXPtNNn7A40mwTZlRy5EJveUHHXZJ+ekg0kRdv2vQGboivcW/SubBxp2z4OSPtU
 9wVf5kjxK4hgOVoj68acJOECaVXYQcN43ZnqYfbigs2K4HQL3lMwUjSgTAavCrqxUYqENlRUp9rhI
 tkXqYsRw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qC0y2-00EjER-5C; Wed, 21 Jun 2023 16:46:02 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 09/13] net: Convert sunrpc from pagevec to folio_batch
Date: Wed, 21 Jun 2023 17:45:53 +0100
Message-Id: <20230621164557.3510324-10-willy@infradead.org>
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

Remove the last usage of pagevecs.  There is a slight change here; we
now free the folio_batch as soon as it fills up instead of freeing the
folio_batch when we try to add a page to a full batch.  This should have
no effect in practice.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/sunrpc/svc.h |  2 +-
 net/sunrpc/svc.c           | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/sunrpc/svc.h b/include/linux/sunrpc/svc.h
index c2807e301790..f8751118c122 100644
--- a/include/linux/sunrpc/svc.h
+++ b/include/linux/sunrpc/svc.h
@@ -222,7 +222,7 @@ struct svc_rqst {
 	struct page *		*rq_next_page; /* next reply page to use */
 	struct page *		*rq_page_end;  /* one past the last page */
 
-	struct pagevec		rq_pvec;
+	struct folio_batch	rq_fbatch;
 	struct kvec		rq_vec[RPCSVC_MAXPAGES]; /* generally useful.. */
 	struct bio_vec		rq_bvec[RPCSVC_MAXPAGES];
 
diff --git a/net/sunrpc/svc.c b/net/sunrpc/svc.c
index e7c101290425..587811a002c9 100644
--- a/net/sunrpc/svc.c
+++ b/net/sunrpc/svc.c
@@ -640,7 +640,7 @@ svc_rqst_alloc(struct svc_serv *serv, struct svc_pool *pool, int node)
 	if (!rqstp)
 		return rqstp;
 
-	pagevec_init(&rqstp->rq_pvec);
+	folio_batch_init(&rqstp->rq_fbatch);
 
 	__set_bit(RQ_BUSY, &rqstp->rq_flags);
 	rqstp->rq_server = serv;
@@ -851,9 +851,9 @@ bool svc_rqst_replace_page(struct svc_rqst *rqstp, struct page *page)
 	}
 
 	if (*rqstp->rq_next_page) {
-		if (!pagevec_space(&rqstp->rq_pvec))
-			__pagevec_release(&rqstp->rq_pvec);
-		pagevec_add(&rqstp->rq_pvec, *rqstp->rq_next_page);
+		if (!folio_batch_add(&rqstp->rq_fbatch,
+				page_folio(*rqstp->rq_next_page)))
+			__folio_batch_release(&rqstp->rq_fbatch);
 	}
 
 	get_page(page);
@@ -887,7 +887,7 @@ void svc_rqst_release_pages(struct svc_rqst *rqstp)
 void
 svc_rqst_free(struct svc_rqst *rqstp)
 {
-	pagevec_release(&rqstp->rq_pvec);
+	folio_batch_release(&rqstp->rq_fbatch);
 	svc_release_buffer(rqstp);
 	if (rqstp->rq_scratch_page)
 		put_page(rqstp->rq_scratch_page);
-- 
2.39.2

