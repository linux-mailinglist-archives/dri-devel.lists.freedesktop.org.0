Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC10913CE51
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 21:52:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF9D6EA98;
	Wed, 15 Jan 2020 20:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0F56EA98;
 Wed, 15 Jan 2020 20:52:53 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 19893960-1500050 
 for multiple; Wed, 15 Jan 2020 20:52:47 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Inject a cond_resched() into long drm_clflush_sg()
Date: Wed, 15 Jan 2020 20:52:45 +0000
Message-Id: <20200115205245.2772800-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
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
Cc: intel-gfx@lists.freedesktop.org, David Laight <David.Laight@ACULAB.COM>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since we may try and flush the cachelines associated with large buffers
(an 8K framebuffer is about 128MiB, even before we try HDR), this leads
to unacceptably long latencies (when using a voluntary CONFIG_PREEMPT).
If we call cond_resched() between each sg chunk, that it about every 128
pages, we have a natural break point in which to check if the process
needs to be rescheduled. Naturally, this means that drm_clflush_sg() can
only be called from process context -- which is true at the moment. The
other clflush routines remain usable from atomic context.

Even though flushing large objects takes a demonstrable amount to time
to flush all the cachelines, clflush is still preferred over a
system-wide wbinvd as the latter has unpredictable latencies affecting
the whole system not just the local task.

Reported-by: David Laight <David.Laight@ACULAB.COM>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: David Laight <David.Laight@ACULAB.COM>
---
 drivers/gpu/drm/drm_cache.c | 49 ++++++++++++++++++++++++++++++++++---
 1 file changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index 03e01b000f7a..fbd2bb644544 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -112,23 +112,64 @@ drm_clflush_pages(struct page *pages[], unsigned long num_pages)
 }
 EXPORT_SYMBOL(drm_clflush_pages);
 
+static __always_inline struct sgt_iter {
+	struct scatterlist *sgp;
+	unsigned long pfn;
+	unsigned int curr;
+	unsigned int max;
+} __sgt_iter(struct scatterlist *sgl) {
+	struct sgt_iter s = { .sgp = sgl };
+
+	if (s.sgp) {
+		s.max = s.curr = s.sgp->offset;
+		s.max += s.sgp->length;
+		s.pfn = page_to_pfn(sg_page(s.sgp));
+	}
+
+	return s;
+}
+
+static inline struct scatterlist *__sg_next_resched(struct scatterlist *sg)
+{
+	if (sg_is_last(sg))
+		return NULL;
+
+	++sg;
+	if (unlikely(sg_is_chain(sg))) {
+		sg = sg_chain_ptr(sg);
+		cond_resched();
+	}
+	return sg;
+}
+
+#define for_each_sgt_page(__pp, __iter, __sgt)				\
+	for ((__iter) = __sgt_iter((__sgt)->sgl);			\
+	     ((__pp) = (__iter).pfn == 0 ? NULL :			\
+	      pfn_to_page((__iter).pfn + ((__iter).curr >> PAGE_SHIFT))); \
+	     (((__iter).curr += PAGE_SIZE) >= (__iter).max) ?		\
+	     (__iter) = __sgt_iter(__sg_next_resched((__iter).sgp)), 0 : 0)
+
 /**
  * drm_clflush_sg - Flush dcache lines pointing to a scather-gather.
  * @st: struct sg_table.
  *
  * Flush every data cache line entry that points to an address in the
- * sg.
+ * sg. This may schedule between scatterlist chunks, in order to keep
+ * the system preemption-latency down for large buffers.
  */
 void
 drm_clflush_sg(struct sg_table *st)
 {
+	might_sleep();
+
 #if defined(CONFIG_X86)
 	if (static_cpu_has(X86_FEATURE_CLFLUSH)) {
-		struct sg_page_iter sg_iter;
+		struct sgt_iter sg_iter;
+		struct page *page;
 
 		mb(); /*CLFLUSH is ordered only by using memory barriers*/
-		for_each_sg_page(st->sgl, &sg_iter, st->nents, 0)
-			drm_clflush_page(sg_page_iter_page(&sg_iter));
+		for_each_sgt_page(page, sg_iter, st)
+			drm_clflush_page(page);
 		mb(); /*Make sure that all cache line entry is flushed*/
 
 		return;
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
