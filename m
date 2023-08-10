Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33748776DBC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 03:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0675810E173;
	Thu, 10 Aug 2023 01:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD47C10E173
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 01:58:17 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-d1c693a29a0so450000276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 18:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1691632697; x=1692237497;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ewIR3DDgMmJ8BnNKd3qQzObvFMmy60EaYGcnV9PQRmM=;
 b=lwrkNH5EGaIsg06YIUFIqAi41k/EZqWnDtbvAyBb6jqI5IbB3CEe9V64BFCG8+H77L
 +/u+XsM+/wF+04vGsdws+ARhE3samlulxdfvJnPZ/WIrBXOXZMPw2vxYnw2tXSsSP0la
 lJER9poE4gbUR3QFtj6x+c6ml1/3G9+jaD6iz6Aj2zA7h7W0BOZFK2qsUeN+ycLTjKeQ
 OXAmu77iLnQ2PiamQeUlWsB4OZCmR+iBMokHaRTmL3uG1gdS63yRpbfuf0VettpjZ4OY
 HhffnwpUdxNdZB9vg2j9ucZ6x6BrrWM5n3hQcb3jQe0VmlcwOm0UdosLm0S5ua3K7j5i
 lzgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691632697; x=1692237497;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ewIR3DDgMmJ8BnNKd3qQzObvFMmy60EaYGcnV9PQRmM=;
 b=K1ayyg0apINm+lydD7S0VwFVG0pvsDmdStl99ljx7eYTgRKrdltlGb7z1oS0sWbh+e
 /vEg2cMbSakZ/SrwZiLA/GmtOu9W0kCf0RSSA3h5p76md9+Dj2CfARj103mxxUF3tOXt
 Ur3zMeO/WzzoM9P1JhsQkcG7DLw5DeM4vcCPz12PfqsrWW5+1wBs5kKkjjqm4JoaVspz
 j3smOJcFUajpqM6QSTx650jQIY0nTyEXE3AOxMZWuv60pGIF78Xyr60MPDDZE5uowdfS
 j3h0Z072Be0T3hCJQLngwmCchAx5Z/jkeMbYywv3KN4ylCucHaR56cpBtTJGbLuki4Wg
 +h+A==
X-Gm-Message-State: AOJu0Yy37WJd6oOOZWMlgCmWAyJbyv46eIDlXZ1VNKobaKon02RAvNZM
 euzI1D0qmziCFnHDRPXHwuYMJEabCx8xz/sYdw==
X-Google-Smtp-Source: AGHT+IHQXC92xGLBpjtBfTmT7ryt7BwKv8NqRJfGfu7d9AKpAvKZXXGgEuAoictW8Q26UU3lfF4ZIdPaLJbDrx1slw==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:73ad:9ed5:e067:2b9b])
 (user=almasrymina job=sendgmr) by 2002:a25:d18e:0:b0:c78:c530:6345 with SMTP
 id i136-20020a25d18e000000b00c78c5306345mr16446ybg.7.1691632696924; Wed, 09
 Aug 2023 18:58:16 -0700 (PDT)
Date: Wed,  9 Aug 2023 18:57:42 -0700
In-Reply-To: <20230810015751.3297321-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230810015751.3297321-7-almasrymina@google.com>
Subject: [RFC PATCH v2 06/11] page-pool: add device memory support
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-media@vger.kernel.org, 
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
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, stephen@networkplumber.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Eric Dumazet <edumazet@google.com>,
 sdf@google.com, Andy Lutomirski <luto@kernel.org>,
 Hari Ramakrishnan <rharix@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Overload the LSB of struct page* to indicate that it's a page_pool_iov.

Refactor mm calls on struct page * into helpers, and add page_pool_iov
handling on those helpers. Modify callers of these mm APIs with calls to
these helpers instead.

In areas where struct page* is dereferenced, add a check for special
handling of page_pool_iov.

The memory providers producing page_pool_iov can set the LSB on the
struct page* returned to the page pool.

Note that instead of overloading the LSB of page pointers, we can
instead define a new union between struct page & struct page_pool_iov and
compact it in a new type. However, we'd need to implement the code churn
to modify the page_pool & drivers to use this new type. For this POC
that is not implemented (feedback welcome).

I have a sample implementation of adding a new page_pool_token type
in the page_pool to give a general idea here:
https://github.com/torvalds/linux/commit/3a7628700eb7fd02a117db036003bca50779608d

Full branch here:
https://github.com/torvalds/linux/compare/master...mina:linux:tcpdevmem-pp-tokens

(In the branches above, page_pool_iov is called devmem_slice).

Could also add static_branch to speed up the checks in page_pool_iov
memory providers are being used.

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 include/net/page_pool.h | 74 ++++++++++++++++++++++++++++++++++-
 net/core/page_pool.c    | 85 ++++++++++++++++++++++++++++-------------
 2 files changed, 131 insertions(+), 28 deletions(-)

diff --git a/include/net/page_pool.h b/include/net/page_pool.h
index 537eb36115ed..f08ca230d68e 100644
--- a/include/net/page_pool.h
+++ b/include/net/page_pool.h
@@ -282,6 +282,64 @@ static inline struct page_pool_iov *page_to_page_pool_iov(struct page *page)
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
 struct page_pool {
 	struct page_pool_params p;

@@ -434,6 +492,9 @@ static inline long page_pool_defrag_page(struct page *page, long nr)
 {
 	long ret;

+	if (page_is_page_pool_iov(page))
+		return -EINVAL;
+
 	/* If nr == pp_frag_count then we have cleared all remaining
 	 * references to the page. No need to actually overwrite it, instead
 	 * we can leave this to be overwritten by the calling function.
@@ -494,7 +555,12 @@ static inline void page_pool_recycle_direct(struct page_pool *pool,

 static inline dma_addr_t page_pool_get_dma_addr(struct page *page)
 {
-	dma_addr_t ret = page->dma_addr;
+	dma_addr_t ret;
+
+	if (page_is_page_pool_iov(page))
+		return page_pool_iov_dma_addr(page_to_page_pool_iov(page));
+
+	ret = page->dma_addr;

 	if (PAGE_POOL_DMA_USE_PP_FRAG_COUNT)
 		ret |= (dma_addr_t)page->dma_addr_upper << 16 << 16;
@@ -504,6 +570,12 @@ static inline dma_addr_t page_pool_get_dma_addr(struct page *page)

 static inline void page_pool_set_dma_addr(struct page *page, dma_addr_t addr)
 {
+	/* page_pool_iovs are mapped and their dma-addr can't be modified. */
+	if (page_is_page_pool_iov(page)) {
+		DEBUG_NET_WARN_ON_ONCE(true);
+		return;
+	}
+
 	page->dma_addr = addr;
 	if (PAGE_POOL_DMA_USE_PP_FRAG_COUNT)
 		page->dma_addr_upper = upper_32_bits(addr);
diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index 0a7c08d748b8..20c1f74fd844 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -318,7 +318,7 @@ static struct page *page_pool_refill_alloc_cache(struct page_pool *pool)
 		if (unlikely(!page))
 			break;

-		if (likely(page_to_nid(page) == pref_nid)) {
+		if (likely(page_pool_page_is_pref_nid(page, pref_nid))) {
 			pool->alloc.cache[pool->alloc.count++] = page;
 		} else {
 			/* NUMA mismatch;
@@ -363,7 +363,15 @@ static void page_pool_dma_sync_for_device(struct page_pool *pool,
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
@@ -375,6 +383,12 @@ static bool page_pool_dma_map(struct page_pool *pool, struct page *page)
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
@@ -398,14 +412,24 @@ static bool page_pool_dma_map(struct page_pool *pool, struct page *page)
 static void page_pool_set_pp_info(struct page_pool *pool,
 				  struct page *page)
 {
-	page->pp = pool;
-	page->pp_magic |= PP_SIGNATURE;
+	if (!page_is_page_pool_iov(page)) {
+		page->pp = pool;
+		page->pp_magic |= PP_SIGNATURE;
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
@@ -615,7 +639,7 @@ static bool page_pool_recycle_in_cache(struct page *page,
 		return false;
 	}

-	/* Caller MUST have verified/know (page_ref_count(page) == 1) */
+	/* Caller MUST have verified/know (page_pool_page_ref_count(page) == 1) */
 	pool->alloc.cache[pool->alloc.count++] = page;
 	recycle_stat_inc(pool, cached);
 	return true;
@@ -638,9 +662,10 @@ __page_pool_put_page(struct page_pool *pool, struct page *page,
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
@@ -741,7 +766,8 @@ static struct page *page_pool_drain_frag(struct page_pool *pool,
 	if (likely(page_pool_defrag_page(page, drain_count)))
 		return NULL;

-	if (page_ref_count(page) == 1 && !page_is_pfmemalloc(page)) {
+	if (page_pool_page_ref_count(page) == 1 &&
+	    !page_pool_page_is_pfmemalloc(page)) {
 		if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
 			page_pool_dma_sync_for_device(pool, page, -1);

@@ -818,9 +844,9 @@ static void page_pool_empty_ring(struct page_pool *pool)
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
@@ -977,19 +1003,24 @@ bool page_pool_return_skb_page(struct page *page, bool napi_safe)
 	struct page_pool *pp;
 	bool allow_direct;

-	page = compound_head(page);
+	if (!page_is_page_pool_iov(page)) {
+		page = compound_head(page);

-	/* page->pp_magic is OR'ed with PP_SIGNATURE after the allocation
-	 * in order to preserve any existing bits, such as bit 0 for the
-	 * head page of compound page and bit 1 for pfmemalloc page, so
-	 * mask those bits for freeing side when doing below checking,
-	 * and page_is_pfmemalloc() is checked in __page_pool_put_page()
-	 * to avoid recycling the pfmemalloc page.
-	 */
-	if (unlikely((page->pp_magic & ~0x3UL) != PP_SIGNATURE))
-		return false;
+		/* page->pp_magic is OR'ed with PP_SIGNATURE after the
+		 * allocation in order to preserve any existing bits, such as
+		 * bit 0 for the head page of compound page and bit 1 for
+		 * pfmemalloc page, so mask those bits for freeing side when
+		 * doing below checking, and page_pool_page_is_pfmemalloc() is
+		 * checked in __page_pool_put_page() to avoid recycling the
+		 * pfmemalloc page.
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
@@ -1273,9 +1304,9 @@ static bool mp_huge_busy(struct mp_huge *hu, unsigned int idx)

 	for (j = 0; j < (1 << MP_HUGE_ORDER); j++) {
 		page = hu->page[idx] + j;
-		if (page_ref_count(page) != 1) {
+		if (page_pool_page_ref_count(page) != 1) {
 			pr_warn("Page with ref count %d at %u, %u. Can't safely destory, leaking memory!\n",
-				page_ref_count(page), idx, j);
+				page_pool_page_ref_count(page), idx, j);
 			return true;
 		}
 	}
@@ -1330,7 +1361,7 @@ static struct page *mp_huge_alloc_pages(struct page_pool *pool, gfp_t gfp)
 			continue;

 		if ((page->pp_magic & ~0x3UL) == PP_SIGNATURE ||
-		    page_ref_count(page) != 1) {
+		    page_pool_page_ref_count(page) != 1) {
 			atomic_inc(&mp_huge_ins_b);
 			continue;
 		}
@@ -1458,9 +1489,9 @@ static void mp_huge_1g_destroy(struct page_pool *pool)
 	free = true;
 	for (i = 0; i < MP_HUGE_1G_CNT; i++) {
 		page = hu->page + i;
-		if (page_ref_count(page) != 1) {
+		if (page_pool_page_ref_count(page) != 1) {
 			pr_warn("Page with ref count %d at %u. Can't safely destory, leaking memory!\n",
-				page_ref_count(page), i);
+				page_pool_page_ref_count(page), i);
 			free = false;
 			break;
 		}
@@ -1489,7 +1520,7 @@ static struct page *mp_huge_1g_alloc_pages(struct page_pool *pool, gfp_t gfp)
 		page = hu->page + page_i;

 		if ((page->pp_magic & ~0x3UL) == PP_SIGNATURE ||
-		    page_ref_count(page) != 1) {
+		    page_pool_page_ref_count(page) != 1) {
 			atomic_inc(&mp_huge_ins_b);
 			continue;
 		}
--
2.41.0.640.ga95def55d0-goog
