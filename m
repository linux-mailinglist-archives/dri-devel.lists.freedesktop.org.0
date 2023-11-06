Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 650937E18BA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 03:44:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4ED10E253;
	Mon,  6 Nov 2023 02:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D019910E253
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 02:44:23 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-5afa86b8d66so56328537b3.3
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Nov 2023 18:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699238663; x=1699843463;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=2aWBuORvTMxiaxkeVBpZ19MJEVfIpSc8yfaq5OEMLWc=;
 b=Lo8InCkcOeubxY9JJ7docUJ0icGbjDhd4Z+o78oxz69xOEPSXXeFC+Axc/694WJs1+
 79c5vWlPVlWOYNSRBONdSyK5riJOLlznOTlo0gfvYv3PkqSpiHUfbbUQLFy9nuhHYbSU
 BFjSlWeVrlMrlip3Et5eAdUBnw9tJD+1pPgICQrzygpop2vMOucMgB2q9DEzTCjYFoD/
 ODUAv6Drn6saNCnWATgNUctU5hVeQaH2jQaVkQbcoQjZ0GlCzqfe9gQ2GDqYM4JLe6oF
 PHj6aM9zxhdzMqBE9o3kxI5gsl6Fet4WzsjHe5be/MwSxXs2I3uDbD7C6pjPfIKs+Uzb
 MbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699238663; x=1699843463;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2aWBuORvTMxiaxkeVBpZ19MJEVfIpSc8yfaq5OEMLWc=;
 b=s88PDJxpHAwEYQ+ScWAAh0L/eniUNiIb7PPtjcw/ceTdn2MAz9LReQOlpOAjLdBwPX
 eJKqHaNAv8azHDSuo7MamzK4wgonYnEC6idg3v/boOz5bq1hTcJ6gUd1HwafwMQBNjCD
 /JSsnItRoftEu2d9NuoeREj7oqgSF0somEDL7MiBitKuF3o0xKfH4Eo7WpTYXTjSDQDL
 M0Gx5ImIYzvVAF+3qKa05rTqGCsr0Ho790mqOVNACzU3GxSWnbWG92caaKQUAXSjPc3d
 4VET3B63NQOtvtrdpwTuU1xvqrSr4fdycJnwKQMMjEL/NyroloL7jjys+2PjimvrXlsM
 Jypw==
X-Gm-Message-State: AOJu0Ywcu+STggA3A11TNE8QXzwiDmrZ9eaRYgzmZHecdKEmNUjbeSll
 z213DavMLf4tHhvaS2EMF8pAw0ZGCOo9sw5U0Q==
X-Google-Smtp-Source: AGHT+IEw+DPriD5kGCKLp7L9RvV3A2PIEZmUjmOXZu2L4QcO1pjeWSWUha8L2tTFId6zhwFVRynJBYuZ216EpkRCrw==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:35de:fff:97b7:db3e])
 (user=almasrymina job=sendgmr) by 2002:a25:688b:0:b0:da0:46e5:a7ef with SMTP
 id d133-20020a25688b000000b00da046e5a7efmr496838ybc.3.1699238662743; Sun, 05
 Nov 2023 18:44:22 -0800 (PST)
Date: Sun,  5 Nov 2023 18:44:01 -0800
In-Reply-To: <20231106024413.2801438-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
Message-ID: <20231106024413.2801438-3-almasrymina@google.com>
Subject: [RFC PATCH v3 02/12] net: page_pool: create hooks for custom page
 providers
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mina Almasry <almasrymina@google.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>,
 Shakeel Butt <shakeelb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jakub Kicinski <kuba@kernel.org>

The page providers which try to reuse the same pages will
need to hold onto the ref, even if page gets released from
the pool - as in releasing the page from the pp just transfers
the "ownership" reference from pp to the provider, and provider
will wait for other references to be gone before feeding this
page back into the pool.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Mina Almasry <almasrymina@google.com>


---

This is implemented by Jakub in his RFC:
https://lore.kernel.org/netdev/f8270765-a27b-6ccf-33ea-cda097168d79@redhat.com/T/

I take no credit for the idea or implementation; I only added minor
edits to make this workable with device memory TCP, and removed some
hacky test code. This is a critical dependency of device memory TCP
and thus I'm pulling it into this series to make it revewable and
mergable.

---
 include/net/page_pool/types.h | 18 +++++++++++++
 net/core/page_pool.c          | 51 +++++++++++++++++++++++++++++++----
 2 files changed, 64 insertions(+), 5 deletions(-)

diff --git a/include/net/page_pool/types.h b/include/net/page_pool/types.h
index 6fc5134095ed..d4bea053bb7e 100644
--- a/include/net/page_pool/types.h
+++ b/include/net/page_pool/types.h
@@ -60,6 +60,8 @@ struct page_pool_params {
 	int		nid;
 	struct device	*dev;
 	struct napi_struct *napi;
+	u8		memory_provider;
+	void            *mp_priv;
 	enum dma_data_direction dma_dir;
 	unsigned int	max_len;
 	unsigned int	offset;
@@ -118,6 +120,19 @@ struct page_pool_stats {
 };
 #endif
 
+struct mem_provider;
+
+enum pp_memory_provider_type {
+	__PP_MP_NONE, /* Use system allocator directly */
+};
+
+struct pp_memory_provider_ops {
+	int (*init)(struct page_pool *pool);
+	void (*destroy)(struct page_pool *pool);
+	struct page *(*alloc_pages)(struct page_pool *pool, gfp_t gfp);
+	bool (*release_page)(struct page_pool *pool, struct page *page);
+};
+
 struct page_pool {
 	struct page_pool_params p;
 
@@ -165,6 +180,9 @@ struct page_pool {
 	 */
 	struct ptr_ring ring;
 
+	const struct pp_memory_provider_ops *mp_ops;
+	void *mp_priv;
+
 #ifdef CONFIG_PAGE_POOL_STATS
 	/* recycle stats are per-cpu to avoid locking */
 	struct page_pool_recycle_stats __percpu *recycle_stats;
diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index 578b6f2eeb46..7ea1f4682479 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -23,6 +23,8 @@
 
 #include <trace/events/page_pool.h>
 
+static DEFINE_STATIC_KEY_FALSE(page_pool_mem_providers);
+
 #define DEFER_TIME (msecs_to_jiffies(1000))
 #define DEFER_WARN_INTERVAL (60 * HZ)
 
@@ -172,6 +174,7 @@ static int page_pool_init(struct page_pool *pool,
 			  const struct page_pool_params *params)
 {
 	unsigned int ring_qsize = 1024; /* Default */
+	int err;
 
 	memcpy(&pool->p, params, sizeof(pool->p));
 
@@ -225,10 +228,34 @@ static int page_pool_init(struct page_pool *pool,
 	/* Driver calling page_pool_create() also call page_pool_destroy() */
 	refcount_set(&pool->user_cnt, 1);
 
+	switch (pool->p.memory_provider) {
+	case __PP_MP_NONE:
+		break;
+	default:
+		err = -EINVAL;
+		goto free_ptr_ring;
+	}
+
+	pool->mp_priv = pool->p.mp_priv;
+	if (pool->mp_ops) {
+		err = pool->mp_ops->init(pool);
+		if (err) {
+			pr_warn("%s() mem-provider init failed %d\n",
+				__func__, err);
+			goto free_ptr_ring;
+		}
+
+		static_branch_inc(&page_pool_mem_providers);
+	}
+
 	if (pool->p.flags & PP_FLAG_DMA_MAP)
 		get_device(pool->p.dev);
 
 	return 0;
+
+free_ptr_ring:
+	ptr_ring_cleanup(&pool->ring, NULL);
+	return err;
 }
 
 /**
@@ -490,7 +517,10 @@ struct page *page_pool_alloc_pages(struct page_pool *pool, gfp_t gfp)
 		return page;
 
 	/* Slow-path: cache empty, do real allocation */
-	page = __page_pool_alloc_pages_slow(pool, gfp);
+	if (static_branch_unlikely(&page_pool_mem_providers) && pool->mp_ops)
+		page = pool->mp_ops->alloc_pages(pool, gfp);
+	else
+		page = __page_pool_alloc_pages_slow(pool, gfp);
 	return page;
 }
 EXPORT_SYMBOL(page_pool_alloc_pages);
@@ -542,10 +572,13 @@ void __page_pool_release_page_dma(struct page_pool *pool, struct page *page)
 void page_pool_return_page(struct page_pool *pool, struct page *page)
 {
 	int count;
+	bool put;
 
-	__page_pool_release_page_dma(pool, page);
-
-	page_pool_clear_pp_info(page);
+	put = true;
+	if (static_branch_unlikely(&page_pool_mem_providers) && pool->mp_ops)
+		put = pool->mp_ops->release_page(pool, page);
+	else
+		__page_pool_release_page_dma(pool, page);
 
 	/* This may be the last page returned, releasing the pool, so
 	 * it is not safe to reference pool afterwards.
@@ -553,7 +586,10 @@ void page_pool_return_page(struct page_pool *pool, struct page *page)
 	count = atomic_inc_return_relaxed(&pool->pages_state_release_cnt);
 	trace_page_pool_state_release(pool, page, count);
 
-	put_page(page);
+	if (put) {
+		page_pool_clear_pp_info(page);
+		put_page(page);
+	}
 	/* An optimization would be to call __free_pages(page, pool->p.order)
 	 * knowing page is not part of page-cache (thus avoiding a
 	 * __page_cache_release() call).
@@ -821,6 +857,11 @@ static void __page_pool_destroy(struct page_pool *pool)
 	if (pool->disconnect)
 		pool->disconnect(pool);
 
+	if (pool->mp_ops) {
+		pool->mp_ops->destroy(pool);
+		static_branch_dec(&page_pool_mem_providers);
+	}
+
 	ptr_ring_cleanup(&pool->ring, NULL);
 
 	if (pool->p.flags & PP_FLAG_DMA_MAP)
-- 
2.42.0.869.gea05f2083d-goog

