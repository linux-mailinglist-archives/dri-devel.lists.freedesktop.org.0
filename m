Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8542F3F2BB3
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 14:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003C36EA7B;
	Fri, 20 Aug 2021 12:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260926EA79
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 12:05:35 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id q10so13948736wro.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 05:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IKkeWH2aVo8+bNDFjaaLnyl7lHM7nrKx22UgPmWsr0k=;
 b=O7YBUWvg8voeF70NTJSHJZqxmozoka05hfeVtmsxvE4ozKoQF/HKIMYWWsktyLa/ip
 Ei0yrD4Wys0up851/psFUxB6aEeTTviB4aaQcyyYohzD1eS/DE2uEAmK+5NX3oE5dtlm
 3/RyJNT0nWqcEwgNrIbcjMHVpty7bzt2PTbvbbJFPnElp0NdyulNQZ1JckzAEvO60DND
 OtOkYdj0sNKK5ql+m3vdqTeDGIIftdAlaI3g+cJfIhluR49a0YgYbhOmZt9RI/IQS9Ae
 RmnR3lBW5UaiSlk0zvT4b7h+379HFYCffNc2qDjjzY5OLz/PZl52duVTHyMMKTh7LwHZ
 OOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IKkeWH2aVo8+bNDFjaaLnyl7lHM7nrKx22UgPmWsr0k=;
 b=rRMIUdzYQsrJe2ZLe1h8H1j9oeihKyoF9NoR0G0TkHEp9gT9KzWOgE6hpIQO71xuel
 js6FF6YGcixZ92OJUyOS+nHsIaEdAVO3ZOFesN24Qwg9ekiJMElJd8AYyzOCIZuB0o28
 OKMrZtbwsuC228dXCNFAOSpX7gao1X2D5h0nAj4r0z7U+ZCnpVdrToEEf3oWkExmB18q
 iUEyDPK70V3rY+vkNSq9A7Y29FfyjUYN2jbMXVDZIWLG2QFSFhVFXKI8Ojj0AETvPh63
 sQoDBXoXqu4Da9UFrpcuYMxcZdS08iPfMYiH6lTqOpQ3OiZ+rTntacae37muB5earWG6
 jatA==
X-Gm-Message-State: AOAM5305dWAj5yjXPurIc/91aGKMVjcMKxLr4qXmm+BuYZUccVsY4kw5
 NzfF/BCJM0IdiYfvFvcRIJAsqQS7/5uESRuU
X-Google-Smtp-Source: ABdhPJx/fMvzM5RO5TfZWgRQ76b6ZVkGnChLukl0RSvB7/TpB8j8kV5J+WoFsJTkmquswBH2Ix4P8w==
X-Received: by 2002:a5d:4d8e:: with SMTP id b14mr9599914wru.422.1629461133712; 
 Fri, 20 Aug 2021 05:05:33 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 r12sm6139818wrv.96.2021.08.20.05.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 05:05:33 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: akpm@linux-foundation.org
Cc: dri-devel@lists.freedesktop.org,
	daniel@ffwll.ch
Subject: [PATCH 2/2] drm/ttm: optimize the pool shrinker a bit v2
Date: Fri, 20 Aug 2021 14:05:28 +0200
Message-Id: <20210820120528.81114-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820120528.81114-1-christian.koenig@amd.com>
References: <20210820120528.81114-1-christian.koenig@amd.com>
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

Switch back to using a spinlock again by moving the IOMMU unmap outside
of the locked region.

This avoids contention especially while freeing pages.

v2: Add a comment explaining why we need sync_shrinkers().

Signed-off-by: Christian König <christian.koenig@amd.com>
Acked-by: Huang Rui <ray.huang@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 40 +++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index cb38b1a17b09..7d4f76d4141d 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -70,7 +70,7 @@ static struct ttm_pool_type global_uncached[MAX_ORDER];
 static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER];
 static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
 
-static struct mutex shrinker_lock;
+static spinlock_t shrinker_lock;
 static struct list_head shrinker_list;
 static struct shrinker mm_shrinker;
 
@@ -263,9 +263,9 @@ static void ttm_pool_type_init(struct ttm_pool_type *pt, struct ttm_pool *pool,
 	spin_lock_init(&pt->lock);
 	INIT_LIST_HEAD(&pt->pages);
 
-	mutex_lock(&shrinker_lock);
+	spin_lock(&shrinker_lock);
 	list_add_tail(&pt->shrinker_list, &shrinker_list);
-	mutex_unlock(&shrinker_lock);
+	spin_unlock(&shrinker_lock);
 }
 
 /* Remove a pool_type from the global shrinker list and free all pages */
@@ -273,9 +273,9 @@ static void ttm_pool_type_fini(struct ttm_pool_type *pt)
 {
 	struct page *p;
 
-	mutex_lock(&shrinker_lock);
+	spin_lock(&shrinker_lock);
 	list_del(&pt->shrinker_list);
-	mutex_unlock(&shrinker_lock);
+	spin_unlock(&shrinker_lock);
 
 	while ((p = ttm_pool_type_take(pt)))
 		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
@@ -313,24 +313,23 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
 static unsigned int ttm_pool_shrink(void)
 {
 	struct ttm_pool_type *pt;
-	unsigned int num_freed;
+	unsigned int num_pages;
 	struct page *p;
 
-	mutex_lock(&shrinker_lock);
+	spin_lock(&shrinker_lock);
 	pt = list_first_entry(&shrinker_list, typeof(*pt), shrinker_list);
+	list_move_tail(&pt->shrinker_list, &shrinker_list);
+	spin_unlock(&shrinker_lock);
 
 	p = ttm_pool_type_take(pt);
 	if (p) {
 		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
-		num_freed = 1 << pt->order;
+		num_pages = 1 << pt->order;
 	} else {
-		num_freed = 0;
+		num_pages = 0;
 	}
 
-	list_move_tail(&pt->shrinker_list, &shrinker_list);
-	mutex_unlock(&shrinker_lock);
-
-	return num_freed;
+	return num_pages;
 }
 
 /* Return the allocation order based for a page */
@@ -530,6 +529,11 @@ void ttm_pool_fini(struct ttm_pool *pool)
 			for (j = 0; j < MAX_ORDER; ++j)
 				ttm_pool_type_fini(&pool->caching[i].orders[j]);
 	}
+
+	/* We removed the pool types from the LRU, but we need to also make sure
+	 * that no shrinker is concurrently freeing pages from the pool.
+	 */
+	sync_shrinkers();
 }
 
 /* As long as pages are available make sure to release at least one */
@@ -604,7 +608,7 @@ static int ttm_pool_debugfs_globals_show(struct seq_file *m, void *data)
 {
 	ttm_pool_debugfs_header(m);
 
-	mutex_lock(&shrinker_lock);
+	spin_lock(&shrinker_lock);
 	seq_puts(m, "wc\t:");
 	ttm_pool_debugfs_orders(global_write_combined, m);
 	seq_puts(m, "uc\t:");
@@ -613,7 +617,7 @@ static int ttm_pool_debugfs_globals_show(struct seq_file *m, void *data)
 	ttm_pool_debugfs_orders(global_dma32_write_combined, m);
 	seq_puts(m, "uc 32\t:");
 	ttm_pool_debugfs_orders(global_dma32_uncached, m);
-	mutex_unlock(&shrinker_lock);
+	spin_unlock(&shrinker_lock);
 
 	ttm_pool_debugfs_footer(m);
 
@@ -640,7 +644,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
 
 	ttm_pool_debugfs_header(m);
 
-	mutex_lock(&shrinker_lock);
+	spin_lock(&shrinker_lock);
 	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
 		seq_puts(m, "DMA ");
 		switch (i) {
@@ -656,7 +660,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
 		}
 		ttm_pool_debugfs_orders(pool->caching[i].orders, m);
 	}
-	mutex_unlock(&shrinker_lock);
+	spin_unlock(&shrinker_lock);
 
 	ttm_pool_debugfs_footer(m);
 	return 0;
@@ -693,7 +697,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 	if (!page_pool_size)
 		page_pool_size = num_pages;
 
-	mutex_init(&shrinker_lock);
+	spin_lock_init(&shrinker_lock);
 	INIT_LIST_HEAD(&shrinker_list);
 
 	for (i = 0; i < MAX_ORDER; ++i) {
-- 
2.25.1

