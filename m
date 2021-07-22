Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 713063D22CB
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 13:34:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 980776E3BB;
	Thu, 22 Jul 2021 11:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDBA6E3BB
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 11:34:56 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 z8-20020a1c4c080000b029022d4c6cfc37so1337106wmf.5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 04:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kM+yiHgK+67J1zEqIrNHgWW0nOyZkyCM+79UHcw02UE=;
 b=DqlkVIbs1+ONQ42Az9YT/hPU7QSIVmPcOeGhY1NwaBGXrgMQ0z4aHGBhPG2hQV6oF6
 gRtlVLFPEFi0w2h6GrVc9O1HjEHdwy8yM5Vz+spGuGQcn+XfTwxe1PYU/bkhAZZKOuWH
 suTPGAixJa2gX30+mTAE472daCUdWB5UhF7gaJmcJe9vnjodAkThe27Z4jHRlnHxrR21
 3yt65ugeEKt9fpFPL+jsSaWfukcZ440Sg96nXCXX7pXHNiARlVp3jcn69ean73QxfkeU
 U48a/NlT57xMDfv+CnANolvYtG1Qb1Z8xPjYjoQSQH4ZieeQui+pzySuutK31KIBmMka
 9kyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kM+yiHgK+67J1zEqIrNHgWW0nOyZkyCM+79UHcw02UE=;
 b=eE9VrmoKH86Ug37Pf6U+8MCkhtW/bxVW/sALKLx/2yZVlEMYsl9cg6HnoNdt78llrx
 sTlNTmyhZ++EE369XP58FCHRmJ42VAQYLzKg7acY5EDq7Z1XLrc4iQw9/ZDCGT+PyhMC
 oBg3ImSWjHy/rDHgn+qTsgMR2XPcH2k6MMfq7CIi2i2DA6/L90FPQDwXY5sSVUjCZWEz
 uLoU0cvPTk3h6PvSpFtGEGljymBkXmKMnUkTMF2UCsefRbTCy08YqUBAQ7dTG3U6zjiw
 vuz7LnOpY6lA6ev4P80M5cv0PTMBhQFPEUwziNmZI9c6JEFw8xuWc+X3RIkCPDICIdIt
 njzQ==
X-Gm-Message-State: AOAM532cQvnVVJssh8QJ41mDYhvvbCpreHXLYBVTRL/iQXMgO8B27jvh
 CrrUBZF4essHTWUBxgqP9t0gyH+c9us=
X-Google-Smtp-Source: ABdhPJwzvIAAqSb+AZmXeKEg/6jn4vN3zxoSOjlRLDem8NBnXtS81zG8DbQcM6TexwgAhBC9EtxMoQ==
X-Received: by 2002:a7b:c108:: with SMTP id w8mr42442620wmi.99.1626953694719; 
 Thu, 22 Jul 2021 04:34:54 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6c5:784c:9ce7:760b])
 by smtp.gmail.com with ESMTPSA id c125sm2737436wme.36.2021.07.22.04.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 04:34:54 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	daniel@ffwll.ch
Subject: [PATCH] drm/ttm: optimize the pool shrinker a bit v3
Date: Thu, 22 Jul 2021 13:34:53 +0200
Message-Id: <20210722113453.2314-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

v2: Add a comment explaining why we need sync_shrinkers().
v3: Drop sync_shrinkers() and use an SRCU instead.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 45 ++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index cb38b1a17b09..cee664c487b5 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -70,7 +70,8 @@ static struct ttm_pool_type global_uncached[MAX_ORDER];
 static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER];
 static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
 
-static struct mutex shrinker_lock;
+static spinlock_t shrinker_lock;
+DEFINE_STATIC_SRCU(shrinker_srcu);
 static struct list_head shrinker_list;
 static struct shrinker mm_shrinker;
 
@@ -263,9 +264,9 @@ static void ttm_pool_type_init(struct ttm_pool_type *pt, struct ttm_pool *pool,
 	spin_lock_init(&pt->lock);
 	INIT_LIST_HEAD(&pt->pages);
 
-	mutex_lock(&shrinker_lock);
+	spin_lock(&shrinker_lock);
 	list_add_tail(&pt->shrinker_list, &shrinker_list);
-	mutex_unlock(&shrinker_lock);
+	spin_unlock(&shrinker_lock);
 }
 
 /* Remove a pool_type from the global shrinker list and free all pages */
@@ -273,9 +274,9 @@ static void ttm_pool_type_fini(struct ttm_pool_type *pt)
 {
 	struct page *p;
 
-	mutex_lock(&shrinker_lock);
+	spin_lock(&shrinker_lock);
 	list_del(&pt->shrinker_list);
-	mutex_unlock(&shrinker_lock);
+	spin_unlock(&shrinker_lock);
 
 	while ((p = ttm_pool_type_take(pt)))
 		ttm_pool_free_page(pt->pool, pt->caching, pt->order, p);
@@ -313,24 +314,27 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
 static unsigned int ttm_pool_shrink(void)
 {
 	struct ttm_pool_type *pt;
-	unsigned int num_freed;
+	unsigned int num_pages;
 	struct page *p;
+	int idx;
 
-	mutex_lock(&shrinker_lock);
+	idx = srcu_read_lock(&shrinker_srcu);
+
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
+	srcu_read_unlock(&shrinker_srcu, idx);
+	return num_pages;
 }
 
 /* Return the allocation order based for a page */
@@ -530,6 +534,11 @@ void ttm_pool_fini(struct ttm_pool *pool)
 			for (j = 0; j < MAX_ORDER; ++j)
 				ttm_pool_type_fini(&pool->caching[i].orders[j]);
 	}
+
+	/* We removed the pool types from the LRU, but we need to also make sure
+	 * that no shrinker is concurrently freeing pages from the pool.
+	 */
+	synchronize_srcu(&shrinker_srcu);
 }
 
 /* As long as pages are available make sure to release at least one */
@@ -604,7 +613,7 @@ static int ttm_pool_debugfs_globals_show(struct seq_file *m, void *data)
 {
 	ttm_pool_debugfs_header(m);
 
-	mutex_lock(&shrinker_lock);
+	spin_lock(&shrinker_lock);
 	seq_puts(m, "wc\t:");
 	ttm_pool_debugfs_orders(global_write_combined, m);
 	seq_puts(m, "uc\t:");
@@ -613,7 +622,7 @@ static int ttm_pool_debugfs_globals_show(struct seq_file *m, void *data)
 	ttm_pool_debugfs_orders(global_dma32_write_combined, m);
 	seq_puts(m, "uc 32\t:");
 	ttm_pool_debugfs_orders(global_dma32_uncached, m);
-	mutex_unlock(&shrinker_lock);
+	spin_unlock(&shrinker_lock);
 
 	ttm_pool_debugfs_footer(m);
 
@@ -640,7 +649,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
 
 	ttm_pool_debugfs_header(m);
 
-	mutex_lock(&shrinker_lock);
+	spin_lock(&shrinker_lock);
 	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
 		seq_puts(m, "DMA ");
 		switch (i) {
@@ -656,7 +665,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
 		}
 		ttm_pool_debugfs_orders(pool->caching[i].orders, m);
 	}
-	mutex_unlock(&shrinker_lock);
+	spin_unlock(&shrinker_lock);
 
 	ttm_pool_debugfs_footer(m);
 	return 0;
@@ -693,7 +702,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
 	if (!page_pool_size)
 		page_pool_size = num_pages;
 
-	mutex_init(&shrinker_lock);
+	spin_lock_init(&shrinker_lock);
 	INIT_LIST_HEAD(&shrinker_list);
 
 	for (i = 0; i < MAX_ORDER; ++i) {
-- 
2.25.1

