Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0AB7E18C4
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 03:44:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161ED10E25E;
	Mon,  6 Nov 2023 02:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B235410E25A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 02:44:34 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5afa071d100so81471907b3.1
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Nov 2023 18:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699238673; x=1699843473;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=NQu48K4LNQ8WFJH6/Q5I7aNtbI5kIYTQfwkiquHqTME=;
 b=sL/5DQVFUTLejLUv4ty1GKnyMLEdQP5RVVgII/OqV9vtF2wKXyzdOXKuT+rg6IYdZP
 MeAeEb4ZRIU8DfP8WPtuE2AxWDxwt+RtlUD4B/tA5zqP9d5wNL392jt81q/os/CHXb/g
 nyvuzzhLnWPXrQuPBGd7VXMSnTGfZf2MhHWArDtqS0jMRtqxk/NwUjT9z/nOwIWROV6e
 G54T1izJeHXkE2P/X1mi2VLLamBKr4DU+uLj01deMfuNFjtKFYn9inEjZ+Vc47Gx9QtE
 c0Iu1Wm3Ep1IvKxd/n8y6yfyIKXkKnc0efRoMIq1t6jvRN54jUTvhl/YIIqncXPrPrXI
 ZjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699238673; x=1699843473;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NQu48K4LNQ8WFJH6/Q5I7aNtbI5kIYTQfwkiquHqTME=;
 b=vgHjC18wgz3rYX9i6G9gVzbYzfpEEY0cRrVyCFzJtyZssHiBv5Ziw0DbYfsOInsdNA
 kB4entUaIeQeHsDJbgvrecLNLcU6eDPlvwR1zOIXAPhpv4UlkIP9+7ZGP1lYRB2Yuq/9
 mq2cYT0NV1mE6lS4lbnSRTXUqNvLrIgW8rh5GTm7I56Fth6m9vnqm8TrttooJdGFrHNs
 LbAu7/RZqYh53Mxbi81rSdqgIoFMY8yjYRgDWLbRBw5Ya1wksUKZJN+WCxP237kND8ar
 dxME2o0szmdiBPHrU9X7k61zSSc1MbqYtdglAShUCWd7U86L66oBTLF3l3KrH7BHh+UN
 X0dA==
X-Gm-Message-State: AOJu0YziNynIqZfkv3xUmYW7wLIF/V8PBRAW0a4Xg8WJZay5QMI6VCqP
 9TW55qmjXpfFEfbJYai9ZKzon+w1we9AHb7p0Q==
X-Google-Smtp-Source: AGHT+IEZMbWQfzrxoPZHwOWR4BvATqps1Lm805Xf6dRuk23Kr0wtrH56ZlHocpW6kuXWCf2FI0sYhcvf7cTOroJczw==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:35de:fff:97b7:db3e])
 (user=almasrymina job=sendgmr) by 2002:a25:d785:0:b0:da0:5af7:d51a with SMTP
 id o127-20020a25d785000000b00da05af7d51amr582834ybg.0.1699238673723; Sun, 05
 Nov 2023 18:44:33 -0800 (PST)
Date: Sun,  5 Nov 2023 18:44:06 -0800
In-Reply-To: <20231106024413.2801438-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
Message-ID: <20231106024413.2801438-8-almasrymina@google.com>
Subject: [RFC PATCH v3 07/12] page-pool: device memory support
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

Overload the LSB of struct page* to indicate that it's a page_pool_iov.

Refactor mm calls on struct page* into helpers, and add page_pool_iov
handling on those helpers. Modify callers of these mm APIs with calls to
these helpers instead.

In areas where struct page* is dereferenced, add a check for special
handling of page_pool_iov.

Signed-off-by: Mina Almasry <almasrymina@google.com>

---
 include/net/page_pool/helpers.h | 74 ++++++++++++++++++++++++++++++++-
 net/core/page_pool.c            | 63 ++++++++++++++++++++--------
 2 files changed, 118 insertions(+), 19 deletions(-)

diff --git a/include/net/page_pool/helpers.h b/include/net/page_pool/helpers.h
index b93243c2a640..08f1a2cc70d2 100644
--- a/include/net/page_pool/helpers.h
+++ b/include/net/page_pool/helpers.h
@@ -151,6 +151,64 @@ static inline struct page_pool_iov *page_to_page_pool_iov(struct page *page)
 	return NULL;
 }
 
+static inline int page_pool_page_ref_count(struct page *page)
+{
+	if (page_is_page_pool_iov(page))
+		return page_pool_iov_refcount(page_to_page_pool_iov(page));
+
+	return page_ref_count(page);
+}
+
+static inline void page_pool_page_get_many(struct page *page,
+					   unsigned int count)
+{
+	if (page_is_page_pool_iov(page))
+		return page_pool_iov_get_many(page_to_page_pool_iov(page),
+					      count);
+
+	return page_ref_add(page, count);
+}
+
+static inline void page_pool_page_put_many(struct page *page,
+					   unsigned int count)
+{
+	if (page_is_page_pool_iov(page))
+		return page_pool_iov_put_many(page_to_page_pool_iov(page),
+					      count);
+
+	if (count > 1)
+		page_ref_sub(page, count - 1);
+
+	put_page(page);
+}
+
+static inline bool page_pool_page_is_pfmemalloc(struct page *page)
+{
+	if (page_is_page_pool_iov(page))
+		return false;
+
+	return page_is_pfmemalloc(page);
+}
+
+static inline bool page_pool_page_is_pref_nid(struct page *page, int pref_nid)
+{
+	/* Assume page_pool_iov are on the preferred node without actually
+	 * checking...
+	 *
+	 * This check is only used to check for recycling memory in the page
+	 * pool's fast paths. Currently the only implementation of page_pool_iov
+	 * is dmabuf device memory. It's a deliberate decision by the user to
+	 * bind a certain dmabuf to a certain netdev, and the netdev rx queue
+	 * would not be able to reallocate memory from another dmabuf that
+	 * exists on the preferred node, so, this check doesn't make much sense
+	 * in this case. Assume all page_pool_iovs can be recycled for now.
+	 */
+	if (page_is_page_pool_iov(page))
+		return true;
+
+	return page_to_nid(page) == pref_nid;
+}
+
 /**
  * page_pool_dev_alloc_pages() - allocate a page.
  * @pool:	pool from which to allocate
@@ -301,6 +359,9 @@ static inline long page_pool_defrag_page(struct page *page, long nr)
 {
 	long ret;
 
+	if (page_is_page_pool_iov(page))
+		return -EINVAL;
+
 	/* If nr == pp_frag_count then we have cleared all remaining
 	 * references to the page:
 	 * 1. 'n == 1': no need to actually overwrite it.
@@ -431,7 +492,12 @@ static inline void page_pool_free_va(struct page_pool *pool, void *va,
  */
 static inline dma_addr_t page_pool_get_dma_addr(struct page *page)
 {
-	dma_addr_t ret = page->dma_addr;
+	dma_addr_t ret;
+
+	if (page_is_page_pool_iov(page))
+		return page_pool_iov_dma_addr(page_to_page_pool_iov(page));
+
+	ret = page->dma_addr;
 
 	if (PAGE_POOL_32BIT_ARCH_WITH_64BIT_DMA)
 		ret <<= PAGE_SHIFT;
@@ -441,6 +507,12 @@ static inline dma_addr_t page_pool_get_dma_addr(struct page *page)
 
 static inline bool page_pool_set_dma_addr(struct page *page, dma_addr_t addr)
 {
+	/* page_pool_iovs are mapped and their dma-addr can't be modified. */
+	if (page_is_page_pool_iov(page)) {
+		DEBUG_NET_WARN_ON_ONCE(true);
+		return false;
+	}
+
 	if (PAGE_POOL_32BIT_ARCH_WITH_64BIT_DMA) {
 		page->dma_addr = addr >> PAGE_SHIFT;
 
diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index 138ddea0b28f..d211996d423b 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -317,7 +317,7 @@ static struct page *page_pool_refill_alloc_cache(struct page_pool *pool)
 		if (unlikely(!page))
 			break;
 
-		if (likely(page_to_nid(page) == pref_nid)) {
+		if (likely(page_pool_page_is_pref_nid(page, pref_nid))) {
 			pool->alloc.cache[pool->alloc.count++] = page;
 		} else {
 			/* NUMA mismatch;
@@ -362,7 +362,15 @@ static void page_pool_dma_sync_for_device(struct page_pool *pool,
 					  struct page *page,
 					  unsigned int dma_sync_size)
 {
-	dma_addr_t dma_addr = page_pool_get_dma_addr(page);
+	dma_addr_t dma_addr;
+
+	/* page_pool_iov memory provider do not support PP_FLAG_DMA_SYNC_DEV */
+	if (page_is_page_pool_iov(page)) {
+		DEBUG_NET_WARN_ON_ONCE(true);
+		return;
+	}
+
+	dma_addr = page_pool_get_dma_addr(page);
 
 	dma_sync_size = min(dma_sync_size, pool->p.max_len);
 	dma_sync_single_range_for_device(pool->p.dev, dma_addr,
@@ -374,6 +382,12 @@ static bool page_pool_dma_map(struct page_pool *pool, struct page *page)
 {
 	dma_addr_t dma;
 
+	if (page_is_page_pool_iov(page)) {
+		/* page_pool_iovs are already mapped */
+		DEBUG_NET_WARN_ON_ONCE(true);
+		return true;
+	}
+
 	/* Setup DMA mapping: use 'struct page' area for storing DMA-addr
 	 * since dma_addr_t can be either 32 or 64 bits and does not always fit
 	 * into page private data (i.e 32bit cpu with 64bit DMA caps)
@@ -405,22 +419,33 @@ static bool page_pool_dma_map(struct page_pool *pool, struct page *page)
 static void page_pool_set_pp_info(struct page_pool *pool,
 				  struct page *page)
 {
-	page->pp = pool;
-	page->pp_magic |= PP_SIGNATURE;
-
-	/* Ensuring all pages have been split into one fragment initially:
-	 * page_pool_set_pp_info() is only called once for every page when it
-	 * is allocated from the page allocator and page_pool_fragment_page()
-	 * is dirtying the same cache line as the page->pp_magic above, so
-	 * the overhead is negligible.
-	 */
-	page_pool_fragment_page(page, 1);
+	if (!page_is_page_pool_iov(page)) {
+		page->pp = pool;
+		page->pp_magic |= PP_SIGNATURE;
+
+		/* Ensuring all pages have been split into one fragment
+		 * initially:
+		 * page_pool_set_pp_info() is only called once for every page
+		 * when it is allocated from the page allocator and
+		 * page_pool_fragment_page() is dirtying the same cache line as
+		 * the page->pp_magic above, so * the overhead is negligible.
+		 */
+		page_pool_fragment_page(page, 1);
+	} else {
+		page_to_page_pool_iov(page)->pp = pool;
+	}
+
 	if (pool->p.init_callback)
 		pool->p.init_callback(page, pool->p.init_arg);
 }
 
 static void page_pool_clear_pp_info(struct page *page)
 {
+	if (page_is_page_pool_iov(page)) {
+		page_to_page_pool_iov(page)->pp = NULL;
+		return;
+	}
+
 	page->pp_magic = 0;
 	page->pp = NULL;
 }
@@ -630,7 +655,7 @@ static bool page_pool_recycle_in_cache(struct page *page,
 		return false;
 	}
 
-	/* Caller MUST have verified/know (page_ref_count(page) == 1) */
+	/* Caller MUST have verified/know (page_pool_page_ref_count(page) == 1) */
 	pool->alloc.cache[pool->alloc.count++] = page;
 	recycle_stat_inc(pool, cached);
 	return true;
@@ -655,9 +680,10 @@ __page_pool_put_page(struct page_pool *pool, struct page *page,
 	 * refcnt == 1 means page_pool owns page, and can recycle it.
 	 *
 	 * page is NOT reusable when allocated when system is under
-	 * some pressure. (page_is_pfmemalloc)
+	 * some pressure. (page_pool_page_is_pfmemalloc)
 	 */
-	if (likely(page_ref_count(page) == 1 && !page_is_pfmemalloc(page))) {
+	if (likely(page_pool_page_ref_count(page) == 1 &&
+		   !page_pool_page_is_pfmemalloc(page))) {
 		/* Read barrier done in page_ref_count / READ_ONCE */
 
 		if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
@@ -772,7 +798,8 @@ static struct page *page_pool_drain_frag(struct page_pool *pool,
 	if (likely(page_pool_defrag_page(page, drain_count)))
 		return NULL;
 
-	if (page_ref_count(page) == 1 && !page_is_pfmemalloc(page)) {
+	if (page_pool_page_ref_count(page) == 1 &&
+	    !page_pool_page_is_pfmemalloc(page)) {
 		if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
 			page_pool_dma_sync_for_device(pool, page, -1);
 
@@ -848,9 +875,9 @@ static void page_pool_empty_ring(struct page_pool *pool)
 	/* Empty recycle ring */
 	while ((page = ptr_ring_consume_bh(&pool->ring))) {
 		/* Verify the refcnt invariant of cached pages */
-		if (!(page_ref_count(page) == 1))
+		if (!(page_pool_page_ref_count(page) == 1))
 			pr_crit("%s() page_pool refcnt %d violation\n",
-				__func__, page_ref_count(page));
+				__func__, page_pool_page_ref_count(page));
 
 		page_pool_return_page(pool, page);
 	}
-- 
2.42.0.869.gea05f2083d-goog

