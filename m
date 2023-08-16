Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB4F77DC76
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 10:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A04510E309;
	Wed, 16 Aug 2023 08:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD87B10E309
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 08:36:11 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3a3ee866e00so1190002b6e.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 01:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1692174971; x=1692779771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qRHd4JcGnkoybpwH6/5aA4cQ+LBMzk7z4xqKJvv8dhI=;
 b=ajh7xjzpXNgMTh4unZjbjB0bFFDGBpv7e78SZ7k2dZ45J7+SIUcZkV4QPiWIFHULos
 50eHEit2nZduxy3147qh5g3HarPg4p/RgWl6Jmf9wh6iH+CmLIStC6E2bi35cMhgi2LM
 52E12LBqoCpz4VTJt5gTqma9BJ/dr3BXi/KRETgyDFVNXdiGoACcNnI+ppP92DELRr8K
 +eyQs2ExWZadFGr4AlXFWhYSf5l5QwIaiph4OI8Pudlh1EgEb6iBulipasm/vqmB9pVe
 fFsAy2Hiq8rs5UzlNJgQ3I0OD+5UH7s/6OOoXIqviS65Mv7ff9yPSTE8+2+usf2p6Qzs
 qxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692174971; x=1692779771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qRHd4JcGnkoybpwH6/5aA4cQ+LBMzk7z4xqKJvv8dhI=;
 b=eOZDG5TtEDGLI775Wxc0x7SeWqZVvhtlwfNXABH+8kc5y/mopdewiSKFTIKLjDMQM+
 krYwQCG1WUBbRdPjQFjcQ1URA0JbG9leM5KCZUb1DmgVJsy7e6sHfDabEozYE3fMRKq+
 UWC909Vc07HKOHhj+3bHZbYG8g2YteOp2tURycm/2+LTd307jaINjk7yKpOxDCAUp4Bs
 ux+bbv1hjcvVNfKCysGa8SYrhXe8/qbBrheYKZW7E6MQinsStRTXW7aEcbAkn4yIdKEL
 147oCJkoYlXNOnlGssM5pahA4XdmOsYS2MYbOseXttHJ1wYQUKULvWkFERbothQ7nyCU
 9PYQ==
X-Gm-Message-State: AOJu0Yyn2gzQDGfiM87JgIwUfuCEg4OYvD7rb6gwuwpq4goR4Z9eQBZ1
 GHhXdF/6ZLeYfMnl3bvGWbnmBg==
X-Google-Smtp-Source: AGHT+IF28Gu3pzoNkt0lhF4apUrH5iwZUnFBt5ekqtY4PdfHts1SFMZwDvJgI46TmbtZtTo+TVsxpg==
X-Received: by 2002:a05:6808:2e4e:b0:3a1:a62a:9ed0 with SMTP id
 gp14-20020a0568082e4e00b003a1a62a9ed0mr1225989oib.1.1692174970946; 
 Wed, 16 Aug 2023 01:36:10 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a639510000000b005658d3a46d7sm7506333pgd.84.2023.08.16.01.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 01:36:10 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev,
 joel@joelfernandes.org, christian.koenig@amd.com
Subject: [PATCH 4/5] drm/ttm: introduce pool_shrink_rwsem
Date: Wed, 16 Aug 2023 16:34:18 +0800
Message-Id: <20230816083419.41088-5-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230816083419.41088-1-zhengqi.arch@bytedance.com>
References: <20230816083419.41088-1-zhengqi.arch@bytedance.com>
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
Cc: linux-kernel@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 Muchun Song <songmuchun@bytedance.com>, linux-fsdevel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, the synchronize_shrinkers() is only used by TTM pool. It only
requires that no shrinkers run in parallel.

After we use RCU+refcount method to implement the lockless slab shrink,
we can not use shrinker_rwsem or synchronize_rcu() to guarantee that all
shrinker invocations have seen an update before freeing memory.

So we introduce a new pool_shrink_rwsem to implement a private
synchronize_shrinkers(), so as to achieve the same purpose.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 15 +++++++++++++++
 include/linux/shrinker.h       |  1 -
 mm/shrinker.c                  | 15 ---------------
 3 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index cddb9151d20f..713b1c0a70e1 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -74,6 +74,7 @@ static struct ttm_pool_type global_dma32_uncached[MAX_ORDER + 1];
 static spinlock_t shrinker_lock;
 static struct list_head shrinker_list;
 static struct shrinker mm_shrinker;
+static DECLARE_RWSEM(pool_shrink_rwsem);
 
 /* Allocate pages of size 1 << order with the given gfp_flags */
 static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
@@ -317,6 +318,7 @@ static unsigned int ttm_pool_shrink(void)
 	unsigned int num_pages;
 	struct page *p;
 
+	down_read(&pool_shrink_rwsem);
 	spin_lock(&shrinker_lock);
 	pt = list_first_entry(&shrinker_list, typeof(*pt), shrinker_list);
 	list_move_tail(&pt->shrinker_list, &shrinker_list);
@@ -329,6 +331,7 @@ static unsigned int ttm_pool_shrink(void)
 	} else {
 		num_pages = 0;
 	}
+	up_read(&pool_shrink_rwsem);
 
 	return num_pages;
 }
@@ -572,6 +575,18 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
 }
 EXPORT_SYMBOL(ttm_pool_init);
 
+/**
+ * synchronize_shrinkers - Wait for all running shrinkers to complete.
+ *
+ * This is useful to guarantee that all shrinker invocations have seen an
+ * update, before freeing memory, similar to rcu.
+ */
+static void synchronize_shrinkers(void)
+{
+	down_write(&pool_shrink_rwsem);
+	up_write(&pool_shrink_rwsem);
+}
+
 /**
  * ttm_pool_fini - Cleanup a pool
  *
diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
index 8dc15aa37410..6b5843c3b827 100644
--- a/include/linux/shrinker.h
+++ b/include/linux/shrinker.h
@@ -103,7 +103,6 @@ extern int __printf(2, 3) register_shrinker(struct shrinker *shrinker,
 					    const char *fmt, ...);
 extern void unregister_shrinker(struct shrinker *shrinker);
 extern void free_prealloced_shrinker(struct shrinker *shrinker);
-extern void synchronize_shrinkers(void);
 
 #ifdef CONFIG_SHRINKER_DEBUG
 extern int __printf(2, 3) shrinker_debugfs_rename(struct shrinker *shrinker,
diff --git a/mm/shrinker.c b/mm/shrinker.c
index 043c87ccfab4..a16cd448b924 100644
--- a/mm/shrinker.c
+++ b/mm/shrinker.c
@@ -692,18 +692,3 @@ void unregister_shrinker(struct shrinker *shrinker)
 	shrinker->nr_deferred = NULL;
 }
 EXPORT_SYMBOL(unregister_shrinker);
-
-/**
- * synchronize_shrinkers - Wait for all running shrinkers to complete.
- *
- * This is equivalent to calling unregister_shrink() and register_shrinker(),
- * but atomically and with less overhead. This is useful to guarantee that all
- * shrinker invocations have seen an update, before freeing memory, similar to
- * rcu.
- */
-void synchronize_shrinkers(void)
-{
-	down_write(&shrinker_rwsem);
-	up_write(&shrinker_rwsem);
-}
-EXPORT_SYMBOL(synchronize_shrinkers);
-- 
2.30.2

