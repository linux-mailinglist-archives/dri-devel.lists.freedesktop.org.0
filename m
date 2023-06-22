Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2C573B190
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 09:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D2210E621;
	Fri, 23 Jun 2023 07:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C6B10E50A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 08:55:15 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1b693afe799so2464625ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 01:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1687424115; x=1690016115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Gb8UpD3lZt4bh5cbhFKOyQevww2sfofkVlmbPNwxg8=;
 b=D5LVC+4HokJCz4FPeXcY+dsaTssife3Qqo2QFad+aTpXncu7uEYIb5Esgo0X9193yq
 JD9ShpMbmoNV55hSp3a3PNB6eqKE4aEEgjXjfXMhn0CWCq43W/gk5ji4OA6QFiz5YEbm
 Of780eCZQIl3oU3nzqHMjitXTfpqsvwkQAoJ3/aSYN48pFnlXdDicr+5TJONhzqSsJ8t
 IgcwK0tiB9rdlMicFxhfFEkVC1N5FWb0hV5n3c+iSTxmBlXa0ZlHHEAwcq0BLcrHgmll
 f7y7d2fR0/LzWuGi/rCVXp+lACayEzs+7pdEprt9XcBuFLw9Vycb7reaOybOjmFS0TWh
 I1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687424115; x=1690016115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Gb8UpD3lZt4bh5cbhFKOyQevww2sfofkVlmbPNwxg8=;
 b=btXDoe2A9BuTyW0kapZVuJ+R6d3rwX2UIJ0MPK6mr0e62mrpMSF2AODqPn1omfNQbh
 YLo1z1FgLpcmibUU8IrxyaB7kgpMKRaLzCM0lzx7i4mqPZAKgcgxeMNYkaPO51rswTdL
 4BkkDgOsog/t0vzV/p4YhWxZkUBoWInYVZq/kAoIFXQ9CerXbibwWnw29IOJq/lKgN6W
 0+1zo0+sFMdNLaWG70FFL+6jjAF5fCX/SbvyOeQEooV2smKRWNCFG2y50+bJNh+DZs/U
 lkniiOpjQ1j1W26fE6uay48oOoR6WDdqUJDNWgzga1mCIQ7wy01oChgQ37uiGYlbx0tw
 CVHw==
X-Gm-Message-State: AC+VfDwDmXVaU0ZlPZaF63JqlEVeX5MKoC2KS7VhDnIbIJWRIgDVyjei
 Aw2eHKWIi33BdseptQFCgCSvTg==
X-Google-Smtp-Source: ACHHUZ4eMYIbb4I7cyZSyRLa7A39+u7jKZFqr72/TYsRg3oKUy2dca/PQ8JGq6DHBe5p8nrFI+JLcw==
X-Received: by 2002:a17:903:2451:b0:1b0:34c6:3bf2 with SMTP id
 l17-20020a170903245100b001b034c63bf2mr21539426pls.5.1687424114850; 
 Thu, 22 Jun 2023 01:55:14 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.254])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a170902f7c200b001b549fce345sm4806971plw.230.2023.06.22.01.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 01:55:14 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu
Subject: [PATCH 09/29] bcache: dynamically allocate the md-bcache shrinker
Date: Thu, 22 Jun 2023 16:53:15 +0800
Message-Id: <20230622085335.77010-10-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230622085335.77010-1-zhengqi.arch@bytedance.com>
References: <20230622085335.77010-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 23 Jun 2023 07:26:31 +0000
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
Cc: linux-bcache@vger.kernel.org, linux-xfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-raid@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com,
 Qi Zheng <zhengqi.arch@bytedance.com>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for implementing lockless slab shrink,
we need to dynamically allocate the md-bcache shrinker,
so that it can be freed asynchronously using kfree_rcu().
Then it doesn't need to wait for RCU read-side critical
section when releasing the struct cache_set.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 drivers/md/bcache/bcache.h |  2 +-
 drivers/md/bcache/btree.c  | 23 ++++++++++++++---------
 drivers/md/bcache/sysfs.c  |  2 +-
 3 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/md/bcache/bcache.h b/drivers/md/bcache/bcache.h
index 700dc5588d5f..53c73b372e7a 100644
--- a/drivers/md/bcache/bcache.h
+++ b/drivers/md/bcache/bcache.h
@@ -541,7 +541,7 @@ struct cache_set {
 	struct bio_set		bio_split;
 
 	/* For the btree cache */
-	struct shrinker		shrink;
+	struct shrinker		*shrink;
 
 	/* For the btree cache and anything allocation related */
 	struct mutex		bucket_lock;
diff --git a/drivers/md/bcache/btree.c b/drivers/md/bcache/btree.c
index 569f48958bde..1131ae91f62a 100644
--- a/drivers/md/bcache/btree.c
+++ b/drivers/md/bcache/btree.c
@@ -667,7 +667,7 @@ static int mca_reap(struct btree *b, unsigned int min_order, bool flush)
 static unsigned long bch_mca_scan(struct shrinker *shrink,
 				  struct shrink_control *sc)
 {
-	struct cache_set *c = container_of(shrink, struct cache_set, shrink);
+	struct cache_set *c = shrink->private_data;
 	struct btree *b, *t;
 	unsigned long i, nr = sc->nr_to_scan;
 	unsigned long freed = 0;
@@ -734,7 +734,7 @@ static unsigned long bch_mca_scan(struct shrinker *shrink,
 static unsigned long bch_mca_count(struct shrinker *shrink,
 				   struct shrink_control *sc)
 {
-	struct cache_set *c = container_of(shrink, struct cache_set, shrink);
+	struct cache_set *c = shrink->private_data;
 
 	if (c->shrinker_disabled)
 		return 0;
@@ -752,8 +752,8 @@ void bch_btree_cache_free(struct cache_set *c)
 
 	closure_init_stack(&cl);
 
-	if (c->shrink.list.next)
-		unregister_shrinker(&c->shrink);
+	if (c->shrink->list.next)
+		unregister_and_free_shrinker(c->shrink);
 
 	mutex_lock(&c->bucket_lock);
 
@@ -828,14 +828,19 @@ int bch_btree_cache_alloc(struct cache_set *c)
 		c->verify_data = NULL;
 #endif
 
-	c->shrink.count_objects = bch_mca_count;
-	c->shrink.scan_objects = bch_mca_scan;
-	c->shrink.seeks = 4;
-	c->shrink.batch = c->btree_pages * 2;
+	c->shrink = shrinker_alloc_and_init(bch_mca_count, bch_mca_scan,
+					    c->btree_pages * 2, 4, 0, c);
+	if (!c->shrink) {
+		pr_warn("bcache: %s: could not allocate shrinker\n",
+				__func__);
+		return -ENOMEM;
+	}
 
-	if (register_shrinker(&c->shrink, "md-bcache:%pU", c->set_uuid))
+	if (register_shrinker(c->shrink, "md-bcache:%pU", c->set_uuid)) {
 		pr_warn("bcache: %s: could not register shrinker\n",
 				__func__);
+		shrinker_free(c->shrink);
+	}
 
 	return 0;
 }
diff --git a/drivers/md/bcache/sysfs.c b/drivers/md/bcache/sysfs.c
index c6f677059214..771577581f52 100644
--- a/drivers/md/bcache/sysfs.c
+++ b/drivers/md/bcache/sysfs.c
@@ -866,7 +866,7 @@ STORE(__bch_cache_set)
 
 		sc.gfp_mask = GFP_KERNEL;
 		sc.nr_to_scan = strtoul_or_return(buf);
-		c->shrink.scan_objects(&c->shrink, &sc);
+		c->shrink->scan_objects(c->shrink, &sc);
 	}
 
 	sysfs_strtoul_clamp(congested_read_threshold_us,
-- 
2.30.2

