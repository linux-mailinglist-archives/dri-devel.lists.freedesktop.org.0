Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 256953B7B49
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 03:34:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5861F6E918;
	Wed, 30 Jun 2021 01:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5438B6E0DF
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 01:34:33 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id a127so902073pfa.10
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 18:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f7FvesnFZtEkQqc9Vhikn1W8hwZHSFqCkNBKNAcZa+k=;
 b=UTRqcAonCOmEpLXYTxiIciOZgFW4bRHzMzBoD3+Gibvj2TTgv0sBO0MIt+YmnarrCe
 pycct/KBpz4kBF+0zrZPzrwnex23iy8TOlVH1Spg81GdJVh8KeDpkpjxdNxnDeXuxtSZ
 u8ws+zhm4OvLK7kDUtNlj1nT+tJEUKcyE1tUu/P0C86GHL0KHZQGx0nvoOH98C85c4fs
 O5aYnoV/Hy/FARfg9HRydjLNAtTDoi9gmHGnE5UQx+4yW6rb93y+YXllGCt9T33kD4yP
 qRlYDUwJniiMkOZnEVBHS7BB4sOroW6LY6pTcH57N54x+MQeIy4pATMnXrlilsDtpoe5
 d3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f7FvesnFZtEkQqc9Vhikn1W8hwZHSFqCkNBKNAcZa+k=;
 b=UC8aHJWaV9OtVMy+yhCtZ1HDX5NJmuIjClNUEY2clXQ8Z8TeTzZ1FFK+xkUJm0BXS2
 FrYEIq5FGqDZWC/GjFiTbaeBg4mUxWfxwp8FmTIeVB7GImgreWjltwMilH1kSjPcZFtO
 VLgUxC0y6rAxg2Z+yYHWrVhptZnThClcrSFgTPmNTAJFJqfGe1Sd+4l+iwr1/hfUt9YE
 Fl/xTKDz7BFywktSnSVDAFZRxLGHasnanEJNVgCjICW5qHbIP5fC4kxSkFIJFHUen1Wp
 VU9Z5Q/+UuZNP22o2XiHYEipZt4w/kPNBCFBwCc/fIyEIX7dQuITUNb5DG4PqhQbGOLx
 8jaw==
X-Gm-Message-State: AOAM531Y6SfPIs16+G3STmYEO1GRgjCk1tD9pVWD/B7yffVEPiuj9B2o
 ZGJXkDtPLoTGACy/Ml5OqX9lDQ==
X-Google-Smtp-Source: ABdhPJwwJ6FImXAWETVvS8aVQkTszK7LdVQHHAgqehKcfaUi5GcmNfbDKZyWguSJ+Eqv6cg/qVN1Zg==
X-Received: by 2002:a62:5547:0:b029:2ec:8f20:4e2 with SMTP id
 j68-20020a6255470000b02902ec8f2004e2mr33097276pfb.71.1625016872939; 
 Tue, 29 Jun 2021 18:34:32 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 g8sm20252901pja.14.2021.06.29.18.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 18:34:32 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 2/5] drm: ttm_pool: Rework ttm_pool to use drm_page_pool
Date: Wed, 30 Jun 2021 01:34:18 +0000
Message-Id: <20210630013421.735092-3-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210630013421.735092-1-john.stultz@linaro.org>
References: <20210630013421.735092-1-john.stultz@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, Sandeep Patil <sspatil@google.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 James Jones <jajones@nvidia.com>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?q?=C3=98rjan=20Eide?= <orjan.eide@arm.com>,
 linux-media@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Daniel Mentz <danielmentz@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch reworks the ttm_pool logic to utilize the recently
added drm_page_pool code.

This adds drm_page_pool structures to the ttm_pool_type
structures, and then removes all the ttm_pool_type shrinker
logic (as its handled in the drm_page_pool shrinker).

NOTE: There is one mismatch in the interfaces I'm not totally
happy with. The ttm_pool tracks all of its pooled pages across
a number of different pools, and tries to keep this size under
the specified page_pool_size value. With the drm_page_pool,
there may other users, however there is still one global
shrinker list of pools. So we can't easily reduce the ttm
pool under the ttm specified size without potentially doing
a lot of shrinking to other non-ttm pools. So either we can:
  1) Try to split it so each user of drm_page_pools manages its
     own pool shrinking.
  2) Push the max value into the drm_page_pool, and have it
     manage shrinking to fit under that global max. Then share
     those size/max values out so the ttm_pool debug output
     can have more context.

I've taken the second path in this patch set, but wanted to call
it out so folks could look closely.

Thoughts would be greatly appreciated here!

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Liam Mark <lmark@codeaurora.org>
Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Brian Starkey <Brian.Starkey@arm.com>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Daniel Mentz <danielmentz@google.com>
Cc: Ørjan Eide <orjan.eide@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ezequiel Garcia <ezequiel@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: James Jones <jajones@nvidia.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v7:
* Major refactoring to use drm_page_pools inside the
  ttm_pool_type structure. This allows us to use container_of to
  get the needed context to free a page. This also means less
  code is changed overall.
v8:
* Reworked to use the new cleanly rewritten drm_page_pool logic
v9:
* Renamed functions, and dropped duplicative order tracking, as
  suggested by ChristianK
* Use new *_(un)lock_shrinker() hooks to fix atomic calculations
  for debugfs
---
 drivers/gpu/drm/Kconfig        |   1 +
 drivers/gpu/drm/ttm/ttm_pool.c | 167 ++++++---------------------------
 include/drm/ttm/ttm_pool.h     |  14 +--
 3 files changed, 33 insertions(+), 149 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 52d9ba92b35e..6be5344c009c 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -183,6 +183,7 @@ config DRM_PAGE_POOL
 config DRM_TTM
 	tristate
 	depends on DRM && MMU
+	select DRM_PAGE_POOL
 	help
 	  GPU memory management subsystem for devices with multiple
 	  GPU memory types. Will be enabled automatically if a device driver
diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index cb38b1a17b09..7ae647bce551 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -40,6 +40,7 @@
 #include <asm/set_memory.h>
 #endif
 
+#include <drm/page_pool.h>
 #include <drm/ttm/ttm_pool.h>
 #include <drm/ttm/ttm_bo_driver.h>
 #include <drm/ttm/ttm_tt.h>
@@ -70,10 +71,6 @@ static struct ttm_pool_type global_uncached[MAX_ORDER];
 static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER];
 static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
 
-static struct mutex shrinker_lock;
-static struct list_head shrinker_list;
-static struct shrinker mm_shrinker;
-
 /* Allocate pages of size 1 << order with the given gfp_flags */
 static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
 					unsigned int order)
@@ -158,6 +155,15 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
 	kfree(dma);
 }
 
+static void ttm_pool_free_callback(struct drm_page_pool *subpool,
+				   struct page *p)
+{
+	struct ttm_pool_type *pt;
+
+	pt = container_of(subpool, struct ttm_pool_type, subpool);
+	return ttm_pool_free_page(pt->pool, pt->caching, subpool->order, p);
+}
+
 /* Apply a new caching to an array of pages */
 static int ttm_pool_apply_caching(struct page **first, struct page **last,
 				  enum ttm_caching caching)
@@ -219,66 +225,20 @@ static void ttm_pool_unmap(struct ttm_pool *pool, dma_addr_t dma_addr,
 		       DMA_BIDIRECTIONAL);
 }
 
-/* Give pages into a specific pool_type */
-static void ttm_pool_type_give(struct ttm_pool_type *pt, struct page *p)
-{
-	unsigned int i, num_pages = 1 << pt->order;
-
-	for (i = 0; i < num_pages; ++i) {
-		if (PageHighMem(p))
-			clear_highpage(p + i);
-		else
-			clear_page(page_address(p + i));
-	}
-
-	spin_lock(&pt->lock);
-	list_add(&p->lru, &pt->pages);
-	spin_unlock(&pt->lock);
-	atomic_long_add(1 << pt->order, &allocated_pages);
-}
-
-/* Take pages from a specific pool_type, return NULL when nothing available */
-static struct page *ttm_pool_type_take(struct ttm_pool_type *pt)
-{
-	struct page *p;
-
-	spin_lock(&pt->lock);
-	p = list_first_entry_or_null(&pt->pages, typeof(*p), lru);
-	if (p) {
-		atomic_long_sub(1 << pt->order, &allocated_pages);
-		list_del(&p->lru);
-	}
-	spin_unlock(&pt->lock);
-
-	return p;
-}
-
 /* Initialize and add a pool type to the global shrinker list */
 static void ttm_pool_type_init(struct ttm_pool_type *pt, struct ttm_pool *pool,
 			       enum ttm_caching caching, unsigned int order)
 {
 	pt->pool = pool;
 	pt->caching = caching;
-	pt->order = order;
-	spin_lock_init(&pt->lock);
-	INIT_LIST_HEAD(&pt->pages);
 
-	mutex_lock(&shrinker_lock);
-	list_add_tail(&pt->shrinker_list, &shrinker_list);
-	mutex_unlock(&shrinker_lock);
+	drm_page_pool_init(&pt->subpool, order, ttm_pool_free_callback);
 }
 
 /* Remove a pool_type from the global shrinker list and free all pages */
 static void ttm_pool_type_fini(struct ttm_pool_type *pt)
 {
-	struct page *p;
-
-	mutex_lock(&shrinker_lock);
-	list_del(&pt->shrinker_list);
-	mutex_unlock(&shrinker_lock);
-
-	while ((p = ttm_pool_type_take(pt)))
-		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
+	drm_page_pool_fini(&pt->subpool);
 }
 
 /* Return the pool_type to use for the given caching and order */
@@ -309,30 +269,6 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
 	return NULL;
 }
 
-/* Free pages using the global shrinker list */
-static unsigned int ttm_pool_shrink(void)
-{
-	struct ttm_pool_type *pt;
-	unsigned int num_freed;
-	struct page *p;
-
-	mutex_lock(&shrinker_lock);
-	pt = list_first_entry(&shrinker_list, typeof(*pt), shrinker_list);
-
-	p = ttm_pool_type_take(pt);
-	if (p) {
-		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
-		num_freed = 1 << pt->order;
-	} else {
-		num_freed = 0;
-	}
-
-	list_move_tail(&pt->shrinker_list, &shrinker_list);
-	mutex_unlock(&shrinker_lock);
-
-	return num_freed;
-}
-
 /* Return the allocation order based for a page */
 static unsigned int ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
 {
@@ -389,7 +325,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 		struct ttm_pool_type *pt;
 
 		pt = ttm_pool_select_type(pool, tt->caching, order);
-		p = pt ? ttm_pool_type_take(pt) : NULL;
+		p = pt ? drm_page_pool_remove(&pt->subpool) : NULL;
 		if (p) {
 			apply_caching = true;
 		} else {
@@ -471,16 +407,13 @@ void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
 
 		pt = ttm_pool_select_type(pool, tt->caching, order);
 		if (pt)
-			ttm_pool_type_give(pt, tt->pages[i]);
+			drm_page_pool_add(&pt->subpool, tt->pages[i]);
 		else
 			ttm_pool_free_page(pool, tt->caching, order,
 					   tt->pages[i]);
 
 		i += num_pages;
 	}
-
-	while (atomic_long_read(&allocated_pages) > page_pool_size)
-		ttm_pool_shrink();
 }
 EXPORT_SYMBOL(ttm_pool_free);
 
@@ -532,44 +465,7 @@ void ttm_pool_fini(struct ttm_pool *pool)
 	}
 }
 
-/* As long as pages are available make sure to release at least one */
-static unsigned long ttm_pool_shrinker_scan(struct shrinker *shrink,
-					    struct shrink_control *sc)
-{
-	unsigned long num_freed = 0;
-
-	do
-		num_freed += ttm_pool_shrink();
-	while (!num_freed && atomic_long_read(&allocated_pages));
-
-	return num_freed;
-}
-
-/* Return the number of pages available or SHRINK_EMPTY if we have none */
-static unsigned long ttm_pool_shrinker_count(struct shrinker *shrink,
-					     struct shrink_control *sc)
-{
-	unsigned long num_pages = atomic_long_read(&allocated_pages);
-
-	return num_pages ? num_pages : SHRINK_EMPTY;
-}
-
 #ifdef CONFIG_DEBUG_FS
-/* Count the number of pages available in a pool_type */
-static unsigned int ttm_pool_type_count(struct ttm_pool_type *pt)
-{
-	unsigned int count = 0;
-	struct page *p;
-
-	spin_lock(&pt->lock);
-	/* Only used for debugfs, the overhead doesn't matter */
-	list_for_each_entry(p, &pt->pages, lru)
-		++count;
-	spin_unlock(&pt->lock);
-
-	return count;
-}
-
 /* Print a nice header for the order */
 static void ttm_pool_debugfs_header(struct seq_file *m)
 {
@@ -588,7 +484,8 @@ static void ttm_pool_debugfs_orders(struct ttm_pool_type *pt,
 	unsigned int i;
 
 	for (i = 0; i < MAX_ORDER; ++i)
-		seq_printf(m, " %8u", ttm_pool_type_count(&pt[i]));
+		seq_printf(m, " %8lu",
+			   drm_page_pool_get_size(&pt[i].subpool));
 	seq_puts(m, "\n");
 }
 
@@ -596,7 +493,10 @@ static void ttm_pool_debugfs_orders(struct ttm_pool_type *pt,
 static void ttm_pool_debugfs_footer(struct seq_file *m)
 {
 	seq_printf(m, "\ntotal\t: %8lu of %8lu\n",
-		   atomic_long_read(&allocated_pages), page_pool_size);
+		   atomic_long_read(&allocated_pages),
+		   drm_page_pool_get_max());
+	seq_printf(m, "(%8lu in non-ttm pools)\n", drm_page_pool_get_total() -
+					atomic_long_read(&allocated_pages));
 }
 
 /* Dump the information for the global pools */
@@ -604,7 +504,7 @@ static int ttm_pool_debugfs_globals_show(struct seq_file *m, void *data)
 {
 	ttm_pool_debugfs_header(m);
 
-	mutex_lock(&shrinker_lock);
+	dma_page_pool_lock_shrinker();
 	seq_puts(m, "wc\t:");
 	ttm_pool_debugfs_orders(global_write_combined, m);
 	seq_puts(m, "uc\t:");
@@ -613,7 +513,7 @@ static int ttm_pool_debugfs_globals_show(struct seq_file *m, void *data)
 	ttm_pool_debugfs_orders(global_dma32_write_combined, m);
 	seq_puts(m, "uc 32\t:");
 	ttm_pool_debugfs_orders(global_dma32_uncached, m);
-	mutex_unlock(&shrinker_lock);
+	dma_page_pool_unlock_shrinker();
 
 	ttm_pool_debugfs_footer(m);
 
@@ -640,7 +540,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
 
 	ttm_pool_debugfs_header(m);
 
-	mutex_lock(&shrinker_lock);
+	dma_page_pool_lock_shrinker();
 	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
 		seq_puts(m, "DMA ");
 		switch (i) {
@@ -656,7 +556,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
 		}
 		ttm_pool_debugfs_orders(pool->caching[i].orders, m);
 	}
-	mutex_unlock(&shrinker_lock);
+	dma_page_pool_unlock_shrinker();
 
 	ttm_pool_debugfs_footer(m);
 	return 0;
@@ -666,13 +566,10 @@ EXPORT_SYMBOL(ttm_pool_debugfs);
 /* Test the shrinker functions and dump the result */
 static int ttm_pool_debugfs_shrink_show(struct seq_file *m, void *data)
 {
-	struct shrink_control sc = { .gfp_mask = GFP_NOFS };
-
 	fs_reclaim_acquire(GFP_KERNEL);
-	seq_printf(m, "%lu/%lu\n", ttm_pool_shrinker_count(&mm_shrinker, &sc),
-		   ttm_pool_shrinker_scan(&mm_shrinker, &sc));
+	seq_printf(m, "%lu/%lu\n", drm_page_pool_get_total(),
+		   (unsigned long)drm_page_pool_shrink());
 	fs_reclaim_release(GFP_KERNEL);
-
 	return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(ttm_pool_debugfs_shrink);
@@ -693,8 +590,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 	if (!page_pool_size)
 		page_pool_size = num_pages;
 
-	mutex_init(&shrinker_lock);
-	INIT_LIST_HEAD(&shrinker_list);
+	drm_page_pool_set_max(page_pool_size);
 
 	for (i = 0; i < MAX_ORDER; ++i) {
 		ttm_pool_type_init(&global_write_combined[i], NULL,
@@ -713,11 +609,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 	debugfs_create_file("page_pool_shrink", 0400, ttm_debugfs_root, NULL,
 			    &ttm_pool_debugfs_shrink_fops);
 #endif
-
-	mm_shrinker.count_objects = ttm_pool_shrinker_count;
-	mm_shrinker.scan_objects = ttm_pool_shrinker_scan;
-	mm_shrinker.seeks = 1;
-	return register_shrinker(&mm_shrinker);
+	return 0;
 }
 
 /**
@@ -736,7 +628,4 @@ void ttm_pool_mgr_fini(void)
 		ttm_pool_type_fini(&global_dma32_write_combined[i]);
 		ttm_pool_type_fini(&global_dma32_uncached[i]);
 	}
-
-	unregister_shrinker(&mm_shrinker);
-	WARN_ON(!list_empty(&shrinker_list));
 }
diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
index 4321728bdd11..c854a81491da 100644
--- a/include/drm/ttm/ttm_pool.h
+++ b/include/drm/ttm/ttm_pool.h
@@ -30,6 +30,7 @@
 #include <linux/llist.h>
 #include <linux/spinlock.h>
 #include <drm/ttm/ttm_caching.h>
+#include <drm/page_pool.h>
 
 struct device;
 struct ttm_tt;
@@ -39,22 +40,15 @@ struct ttm_operation_ctx;
 /**
  * ttm_pool_type - Pool for a certain memory type
  *
- * @pool: the pool we belong to, might be NULL for the global ones
- * @order: the allocation order our pages have
+ * @pool: the ttm pool we belong to, might be NULL for the global ones
  * @caching: the caching type our pages have
- * @shrinker_list: our place on the global shrinker list
- * @lock: protection of the page list
- * @pages: the list of pages in the pool
+ * @subpool: the dma_page_pool that we use to manage the pages
  */
 struct ttm_pool_type {
 	struct ttm_pool *pool;
-	unsigned int order;
 	enum ttm_caching caching;
 
-	struct list_head shrinker_list;
-
-	spinlock_t lock;
-	struct list_head pages;
+	struct drm_page_pool subpool;
 };
 
 /**
-- 
2.25.1

