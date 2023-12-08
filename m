Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 054618097D1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 01:53:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B2D10E9B7;
	Fri,  8 Dec 2023 00:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA7110E9B7
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 00:53:14 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5d6b751dabcso15623827b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 16:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1701996794; x=1702601594;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=/frlnDGiPBjsiHjgXvPuD20HndGYXPjOBYCQWwtD/DY=;
 b=fegG0fH0mTB6Ff/a7zI0zM7ETicfQrTON8IJscdmk4vfREJbwj9BqIfRreCmXqFSKz
 xqxPhwgi58bO2x26bU/H/sgNudsXez7NA8eGbRcDA8pGyxdKWOUoUyeNX8rEQRwfc4hu
 zwZ+Bz7NgcsitJFiBWwkWkCYIwCL6uSxZkhBwhI7fIO5TPFV+HuESHkAXdivDILNjaX4
 pXTQYg1xI3NwfDX45udt9R9TV8hoep6fuH98IfyX/ssR/S34c9XViQ1iWodoRFpZBqNh
 dho3AmkkR9QrcJgVWfdiGjyU9pYGLWtSOZhOs1qLNe88KXEEDuOxUvLOAsn0EO2ymru6
 LKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701996794; x=1702601594;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/frlnDGiPBjsiHjgXvPuD20HndGYXPjOBYCQWwtD/DY=;
 b=NCfoYjFbFaDgfqQwGsr0syORZShdsOYWoblnQVNVjE6VvAv6sARVPFDDBJBmdeOia4
 7P/Gc5WhR8TOO4XReDwrs5f92V10NVYNY7cVogbtBcNcgmD9bSI7Tmmj8VRzuCnLqM2A
 IggLRgGhaxcWidboKJ4s2L/nP9Bb4fLzrZpDzYR+PbMLJ9d66qqUgGZy3hxQEbs1+Yuq
 N+OBxHSO4lkAQ+2+icNmD7F4aDLLO7ae2pCGB0O+wtYIA/eHJ4D4/gjeUWLISGc8pIP7
 XNpI5urm8k3r/ADVtXgfOZEd6TLsAki2aV/eUOucFoVs/kFyDhlYYnhtO66h1ZeGiWVS
 ayfQ==
X-Gm-Message-State: AOJu0YzvzGilbr/7a21TKBnsN81PR38jcV5VzHe8ojB9obuvEu2Pm3hJ
 z5ozs4+wal7Jc6fDPslXE5FrwNSX7QS0GKcnaw==
X-Google-Smtp-Source: AGHT+IEcVPz+c8f4+/XYi0qcn9xsa1Cmt6IzSmVdFx7S2IQm9w3Fp7tQK/S+bZFjz2BteYqKPoVID4eAqxK5vujUCQ==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:f1cf:c733:235b:9fff])
 (user=almasrymina job=sendgmr) by 2002:a05:690c:2893:b0:5d3:b449:e58e with
 SMTP id ee19-20020a05690c289300b005d3b449e58emr47990ywb.6.1701996793843; Thu,
 07 Dec 2023 16:53:13 -0800 (PST)
Date: Thu,  7 Dec 2023 16:52:40 -0800
In-Reply-To: <20231208005250.2910004-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20231208005250.2910004-1-almasrymina@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231208005250.2910004-10-almasrymina@google.com>
Subject: [net-next v1 09/16] page_pool: device memory support
From: Mina Almasry <almasrymina@google.com>
To: Shailend Chand <shailend@google.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 bpf@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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
 Jonathan Corbet <corbet@lwn.net>, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Yunsheng Lin <linyunsheng@huawei.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Eric Dumazet <edumazet@google.com>, Shakeel Butt <shakeelb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
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

v1:
- Disable fragmentation support for iov properly.
- fix napi_pp_put_page() path (Yunsheng).

---
 include/net/page_pool/helpers.h | 78 ++++++++++++++++++++++++++++++++-
 net/core/page_pool.c            | 67 ++++++++++++++++++++--------
 net/core/skbuff.c               | 28 +++++++-----
 3 files changed, 141 insertions(+), 32 deletions(-)

diff --git a/include/net/page_pool/helpers.h b/include/net/page_pool/helpers.h
index 00197f14aa87..2d4e0a2c5620 100644
--- a/include/net/page_pool/helpers.h
+++ b/include/net/page_pool/helpers.h
@@ -154,6 +154,64 @@ static inline struct page_pool_iov *page_to_page_pool_iov(struct page *page)
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
@@ -304,6 +362,10 @@ static inline long page_pool_defrag_page(struct page *page, long nr)
 {
 	long ret;
 
+	/* fragmentation support hasn't been added to ppiov yet */
+	if (WARN_ON_ONCE(page_is_page_pool_iov(page)))
+		return 0;
+
 	/* If nr == pp_frag_count then we have cleared all remaining
 	 * references to the page:
 	 * 1. 'n == 1': no need to actually overwrite it.
@@ -347,7 +409,8 @@ static inline long page_pool_defrag_page(struct page *page, long nr)
 static inline bool page_pool_is_last_frag(struct page *page)
 {
 	/* If page_pool_defrag_page() returns 0, we were the last user */
-	return page_pool_defrag_page(page, 1) == 0;
+	return page_is_page_pool_iov(page) ||
+	       page_pool_defrag_page(page, 1) == 0;
 }
 
 /**
@@ -434,7 +497,12 @@ static inline void page_pool_free_va(struct page_pool *pool, void *va,
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
@@ -444,6 +512,12 @@ static inline dma_addr_t page_pool_get_dma_addr(struct page *page)
 
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
index 423c88564a00..f0148d66371b 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -346,7 +346,7 @@ static struct page *page_pool_refill_alloc_cache(struct page_pool *pool)
 		if (unlikely(!page))
 			break;
 
-		if (likely(page_to_nid(page) == pref_nid)) {
+		if (likely(page_pool_page_is_pref_nid(page, pref_nid))) {
 			pool->alloc.cache[pool->alloc.count++] = page;
 		} else {
 			/* NUMA mismatch;
@@ -391,7 +391,15 @@ static void page_pool_dma_sync_for_device(struct page_pool *pool,
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
@@ -403,6 +411,12 @@ static bool page_pool_dma_map(struct page_pool *pool, struct page *page)
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
@@ -434,22 +448,33 @@ static bool page_pool_dma_map(struct page_pool *pool, struct page *page)
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
 	if (pool->has_init_callback)
 		pool->slow.init_callback(page, pool->slow.init_arg);
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
@@ -664,7 +689,7 @@ static bool page_pool_recycle_in_cache(struct page *page,
 		return false;
 	}
 
-	/* Caller MUST have verified/know (page_ref_count(page) == 1) */
+	/* Caller MUST have verified/know (page_pool_page_ref_count(page) == 1) */
 	pool->alloc.cache[pool->alloc.count++] = page;
 	recycle_stat_inc(pool, cached);
 	return true;
@@ -689,9 +714,10 @@ __page_pool_put_page(struct page_pool *pool, struct page *page,
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
@@ -806,7 +832,8 @@ static struct page *page_pool_drain_frag(struct page_pool *pool,
 	if (likely(page_pool_defrag_page(page, drain_count)))
 		return NULL;
 
-	if (page_ref_count(page) == 1 && !page_is_pfmemalloc(page)) {
+	if (page_pool_page_ref_count(page) == 1 &&
+	    !page_pool_page_is_pfmemalloc(page)) {
 		if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
 			page_pool_dma_sync_for_device(pool, page, -1);
 
@@ -840,6 +867,10 @@ struct page *page_pool_alloc_frag(struct page_pool *pool,
 	if (WARN_ON(size > max_size))
 		return NULL;
 
+	/* page_pool_iov's don't currently support fragmentation */
+	if (WARN_ON_ONCE(pool->mp_ops == &dmabuf_devmem_ops))
+		return NULL;
+
 	size = ALIGN(size, dma_get_cache_alignment());
 	*offset = pool->frag_offset;
 
@@ -882,9 +913,9 @@ static void page_pool_empty_ring(struct page_pool *pool)
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
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index b157efea5dea..07f802f1adf1 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -896,19 +896,23 @@ bool napi_pp_put_page(struct page *page, bool napi_safe)
 	bool allow_direct = false;
 	struct page_pool *pp;
 
-	page = compound_head(page);
-
-	/* page->pp_magic is OR'ed with PP_SIGNATURE after the allocation
-	 * in order to preserve any existing bits, such as bit 0 for the
-	 * head page of compound page and bit 1 for pfmemalloc page, so
-	 * mask those bits for freeing side when doing below checking,
-	 * and page_is_pfmemalloc() is checked in __page_pool_put_page()
-	 * to avoid recycling the pfmemalloc page.
-	 */
-	if (unlikely((page->pp_magic & ~0x3UL) != PP_SIGNATURE))
-		return false;
+	if (!page_is_page_pool_iov(page)) {
+		page = compound_head(page);
+
+		/* page->pp_magic is OR'ed with PP_SIGNATURE after the allocation
+		 * in order to preserve any existing bits, such as bit 0 for the
+		 * head page of compound page and bit 1 for pfmemalloc page, so
+		 * mask those bits for freeing side when doing below checking,
+		 * and page_is_pfmemalloc() is checked in __page_pool_put_page()
+		 * to avoid recycling the pfmemalloc page.
+		 */
+		if (unlikely((page->pp_magic & ~0x3UL) != PP_SIGNATURE))
+			return false;
 
-	pp = page->pp;
+		pp = page->pp;
+	} else {
+		pp = page_to_page_pool_iov(page)->pp;
+	}
 
 	/* Allow direct recycle if we have reasons to believe that we are
 	 * in the same context as the consumer would run, so there's
-- 
2.43.0.472.g3155946c3a-goog

