Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F13A61452
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 15:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F2D10E9FE;
	Fri, 14 Mar 2025 14:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Omvhla0Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB19210E9FE
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 14:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+2mzYkuTr6a6bXG168USJ1I052Rawu++JfD94IBX//M=; b=Omvhla0ZziR/Ghm7U3HvQkSMRV
 1BOJtVos64atHqCrIotX6qwSQz0XRUedhUlFq38cn53UOofFVzZozJizfFquf0dh+etHZf7Ztitei
 3Q638vPA6blEb8+xn6suFjr0rt0dtolVxczZMlxaRLrV5HORWO47pnBEpDRhQEtNeC+TnkVKt+CXd
 0IH4Vuf5YafIhhaX72EUMxkNdHNpSPZqmaE6oew5q7UzDQSiDrvbEMnJCKwBXbPgnV/iQddW0L6+Y
 +ds0/ZWyuyJotLVao+Qmlxq6iu5r3ov6K38Z0iaX6qi7dV+IljsqaNLJcUrUxWtbjVWLzpMY0LMVD
 bpo1B7uA==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tt6Tc-0006hl-Mq; Fri, 14 Mar 2025 15:57:32 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH] drm/ttm: Make pool shrinker more responsive
Date: Fri, 14 Mar 2025 14:57:29 +0000
Message-ID: <20250314145729.34344-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Currently the TTM pool shrinker ensures it frees at least something every
time it is invoked, but it also lies to the core a bit on how hard it
tried.

For example core will ask it to free SHRINK_BATCH pages but the shrinker
can, due how it walks the LRU list of pools, free just a single page and
still leave the core thinking it expended the full SHRINK_BATCH effort.

Apart from being inefficient in terms of number of calls to the TTM pool
shrinker required, another consquence of this is that the core can abandon
the shrinking attempt too early due thinking that the whole set of
freeable pages has been scanned.

We fix this last part by correctly reporting how many out of potentially
freeable pages have been scanned.

We also do the freeing in an aggressive manner, considering the scan
target as a free target, to ensure walks over pools with unfreeable pages
do not cause no-op calls into our callback.

And finally we customise the shrinker batch size based on the median pool
order and the total number of pools, with the aim of searching more
possible pools on an average invocation.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 39 +++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 83b10706ba89..21a58933fdb1 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -368,7 +368,7 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
 }
 
 /* Free pages using the global shrinker list */
-static unsigned int ttm_pool_shrink(void)
+static unsigned int ttm_pool_shrink(unsigned long *nr_scanned)
 {
 	struct ttm_pool_type *pt;
 	unsigned int num_pages;
@@ -380,16 +380,15 @@ static unsigned int ttm_pool_shrink(void)
 	list_move_tail(&pt->shrinker_list, &shrinker_list);
 	spin_unlock(&shrinker_lock);
 
+	num_pages = 1 << pt->order;
+	(*nr_scanned) += num_pages;
+
 	p = ttm_pool_type_take(pt);
-	if (p) {
+	if (p)
 		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
-		num_pages = 1 << pt->order;
-	} else {
-		num_pages = 0;
-	}
 	up_read(&pool_shrink_rwsem);
 
-	return num_pages;
+	return p ? num_pages : 0;
 }
 
 /* Return the allocation order based for a page */
@@ -881,10 +880,12 @@ int ttm_pool_restore_and_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
  */
 void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
 {
+	unsigned long nr_scanned = 0;
+
 	ttm_pool_free_range(pool, tt, tt->caching, 0, tt->num_pages);
 
 	while (atomic_long_read(&allocated_pages) > page_pool_size)
-		ttm_pool_shrink();
+		ttm_pool_shrink(&nr_scanned);
 }
 EXPORT_SYMBOL(ttm_pool_free);
 
@@ -1132,17 +1133,21 @@ void ttm_pool_fini(struct ttm_pool *pool)
 }
 EXPORT_SYMBOL(ttm_pool_fini);
 
-/* As long as pages are available make sure to release at least one */
 static unsigned long ttm_pool_shrinker_scan(struct shrinker *shrink,
 					    struct shrink_control *sc)
 {
-	unsigned long num_freed = 0;
+	unsigned long to_scan, freed = 0;
 
-	do
-		num_freed += ttm_pool_shrink();
-	while (!num_freed && atomic_long_read(&allocated_pages));
+	sc->nr_scanned = 0;
+	to_scan = min_t(unsigned long,
+			sc->nr_to_scan, atomic_long_read(&allocated_pages));
+	while (freed < to_scan) {
+		freed += ttm_pool_shrink(&sc->nr_scanned);
+		to_scan = min_t(unsigned long,
+				to_scan, atomic_long_read(&allocated_pages));
+	}
 
-	return num_freed;
+	return sc->nr_scanned ? freed : SHRINK_STOP;
 }
 
 /* Return the number of pages available or SHRINK_EMPTY if we have none */
@@ -1266,7 +1271,10 @@ EXPORT_SYMBOL(ttm_pool_debugfs);
 /* Test the shrinker functions and dump the result */
 static int ttm_pool_debugfs_shrink_show(struct seq_file *m, void *data)
 {
-	struct shrink_control sc = { .gfp_mask = GFP_NOFS };
+	struct shrink_control sc = {
+		.gfp_mask = GFP_NOFS,
+		.nr_to_scan = 1,
+	};
 
 	fs_reclaim_acquire(GFP_KERNEL);
 	seq_printf(m, "%lu/%lu\n", ttm_pool_shrinker_count(mm_shrinker, &sc),
@@ -1324,6 +1332,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 
 	mm_shrinker->count_objects = ttm_pool_shrinker_count;
 	mm_shrinker->scan_objects = ttm_pool_shrinker_scan;
+	mm_shrinker->batch = (1 << (MAX_PAGE_ORDER / 2)) * NR_PAGE_ORDERS;
 	mm_shrinker->seeks = 1;
 
 	shrinker_register(mm_shrinker);
-- 
2.48.0

