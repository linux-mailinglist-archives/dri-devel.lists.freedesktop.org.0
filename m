Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F0B7E18C3
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 03:44:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F303C10E259;
	Mon,  6 Nov 2023 02:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37B010E258
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 02:44:32 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5b064442464so55031577b3.3
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Nov 2023 18:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699238672; x=1699843472;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=9xKJa4I8M00nBYKJxGW44sf+c8CRhaACyIJxG3DJfPA=;
 b=MMmNyzGMTFd3v/93zbA0nn4iTQBbVVEaUwcrGrL2dsCSoSMdr+IS/tl3Kw3lxu3JPJ
 umkvV+OYkfGjPKSZhWxvO8uHEX6Lzkak7X3G6L63dny5NGtokSK+Hz7Lw4NBF3EBpPqh
 AVG9OmuqRTyQ2VXNS9vFe0qAu0bLREIbcvg/mHrnaEo1vnG0vwMvitWcZdSn08owwjJc
 vO9ivbnCZ/g60BNky0zZK6Dc4UToSEs66WVrXyi5z/dLVNlpxsY5cIPXPcvdBvf7vHxq
 rQHpOFvTeGBuRlaxm58i98SXu83lg940JL2lYUgeF+Oygm+vb/WQN8JFYZYgx+8vtRzY
 pEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699238672; x=1699843472;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9xKJa4I8M00nBYKJxGW44sf+c8CRhaACyIJxG3DJfPA=;
 b=unXOmEHkGb9Quv+iJSdEm1WC4RkewCBqudm+RFlT5TJgXULBxECCHNbjBXgRzMBN48
 4k/RpwpgIDG5ARlawqt0lNGDd689cXQZhEvGhd31987RnDJIvY+/VbLKT/H4KAAnOEfO
 jzKkzOkpyKsG4WbtryK/c16+zvSywTAT9u0MjjZeC5ipKz/LBVSH0No37jtpwQj6kqcf
 +SgWoIVWoi8y/aY5uSpMWmZ6Mdkl7XoLh0Y24lJAZjAnTlrf+6ieByY4nqkx9LDV0z4a
 qk0XCO6mZY6+ckNswA9Y74e9x6nRmR7pxas17SaQ5SRx5u/hLwtaNNfd27NrSQBxM1M9
 Lh/w==
X-Gm-Message-State: AOJu0YxaGdfnqbWE2/AjM6KHTmaeDMW0C24PCUplNd92zDls/K5EYjAc
 zHLErR7WPlNS5axNs7NR+hc7qoPqlMfiXJx0Lw==
X-Google-Smtp-Source: AGHT+IHQZek7gksg2/4l9r8mKorM1hefc52r/xXnPMd1/CJoSrUbDmmvNsfJ2kDrXMdiPilQpsmvFoDWEPDC3BTnqw==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:35de:fff:97b7:db3e])
 (user=almasrymina job=sendgmr) by 2002:a81:914a:0:b0:5a8:2fb9:aeab with SMTP
 id i71-20020a81914a000000b005a82fb9aeabmr164143ywg.3.1699238671757; Sun, 05
 Nov 2023 18:44:31 -0800 (PST)
Date: Sun,  5 Nov 2023 18:44:05 -0800
In-Reply-To: <20231106024413.2801438-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
Message-ID: <20231106024413.2801438-7-almasrymina@google.com>
Subject: [RFC PATCH v3 06/12] memory-provider: dmabuf devmem memory provider
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
 Kaiyuan Zhang <kaiyuanz@google.com>, Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Willem de Bruijn <willemb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Eric Dumazet <edumazet@google.com>, Shakeel Butt <shakeelb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement a memory provider that allocates dmabuf devmem page_pool_iovs.

Support of PP_FLAG_DMA_MAP and PP_FLAG_DMA_SYNC_DEV is omitted for
simplicity.

The provider receives a reference to the struct netdev_dmabuf_binding
via the pool->mp_priv pointer. The driver needs to set this pointer for
the provider in the page_pool_params.

The provider obtains a reference on the netdev_dmabuf_binding which
guarantees the binding and the underlying mapping remains alive until
the provider is destroyed.

Signed-off-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>

---
 include/net/page_pool/helpers.h | 40 +++++++++++++++++
 include/net/page_pool/types.h   | 10 +++++
 net/core/page_pool.c            | 76 +++++++++++++++++++++++++++++++++
 3 files changed, 126 insertions(+)

diff --git a/include/net/page_pool/helpers.h b/include/net/page_pool/helpers.h
index 78cbb040af94..b93243c2a640 100644
--- a/include/net/page_pool/helpers.h
+++ b/include/net/page_pool/helpers.h
@@ -53,6 +53,7 @@
 #define _NET_PAGE_POOL_HELPERS_H
 
 #include <net/page_pool/types.h>
+#include <net/net_debug.h>
 
 #ifdef CONFIG_PAGE_POOL_STATS
 int page_pool_ethtool_stats_get_count(void);
@@ -111,6 +112,45 @@ page_pool_iov_binding(const struct page_pool_iov *ppiov)
 	return page_pool_iov_owner(ppiov)->binding;
 }
 
+static inline int page_pool_iov_refcount(const struct page_pool_iov *ppiov)
+{
+	return refcount_read(&ppiov->refcount);
+}
+
+static inline void page_pool_iov_get_many(struct page_pool_iov *ppiov,
+					  unsigned int count)
+{
+	refcount_add(count, &ppiov->refcount);
+}
+
+void __page_pool_iov_free(struct page_pool_iov *ppiov);
+
+static inline void page_pool_iov_put_many(struct page_pool_iov *ppiov,
+					  unsigned int count)
+{
+	if (!refcount_sub_and_test(count, &ppiov->refcount))
+		return;
+
+	__page_pool_iov_free(ppiov);
+}
+
+/* page pool mm helpers */
+
+static inline bool page_is_page_pool_iov(const struct page *page)
+{
+	return (unsigned long)page & PP_DEVMEM;
+}
+
+static inline struct page_pool_iov *page_to_page_pool_iov(struct page *page)
+{
+	if (page_is_page_pool_iov(page))
+		return (struct page_pool_iov *)((unsigned long)page &
+						~PP_DEVMEM);
+
+	DEBUG_NET_WARN_ON_ONCE(true);
+	return NULL;
+}
+
 /**
  * page_pool_dev_alloc_pages() - allocate a page.
  * @pool:	pool from which to allocate
diff --git a/include/net/page_pool/types.h b/include/net/page_pool/types.h
index 64386325d965..1e67f9466250 100644
--- a/include/net/page_pool/types.h
+++ b/include/net/page_pool/types.h
@@ -124,6 +124,7 @@ struct mem_provider;
 
 enum pp_memory_provider_type {
 	__PP_MP_NONE, /* Use system allocator directly */
+	PP_MP_DMABUF_DEVMEM, /* dmabuf devmem provider */
 };
 
 struct pp_memory_provider_ops {
@@ -133,8 +134,15 @@ struct pp_memory_provider_ops {
 	bool (*release_page)(struct page_pool *pool, struct page *page);
 };
 
+extern const struct pp_memory_provider_ops dmabuf_devmem_ops;
+
 /* page_pool_iov support */
 
+/*  We overload the LSB of the struct page pointer to indicate whether it's
+ *  a page or page_pool_iov.
+ */
+#define PP_DEVMEM 0x01UL
+
 /* Owner of the dma-buf chunks inserted into the gen pool. Each scatterlist
  * entry from the dmabuf is inserted into the genpool as a chunk, and needs
  * this owner struct to keep track of some metadata necessary to create
@@ -158,6 +166,8 @@ struct page_pool_iov {
 	struct dmabuf_genpool_chunk_owner *owner;
 
 	refcount_t refcount;
+
+	struct page_pool *pp;
 };
 
 struct page_pool {
diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index 7ea1f4682479..138ddea0b28f 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -20,6 +20,7 @@
 #include <linux/poison.h>
 #include <linux/ethtool.h>
 #include <linux/netdevice.h>
+#include <linux/genalloc.h>
 
 #include <trace/events/page_pool.h>
 
@@ -231,6 +232,9 @@ static int page_pool_init(struct page_pool *pool,
 	switch (pool->p.memory_provider) {
 	case __PP_MP_NONE:
 		break;
+	case PP_MP_DMABUF_DEVMEM:
+		pool->mp_ops = &dmabuf_devmem_ops;
+		break;
 	default:
 		err = -EINVAL;
 		goto free_ptr_ring;
@@ -996,3 +1000,75 @@ void page_pool_update_nid(struct page_pool *pool, int new_nid)
 	}
 }
 EXPORT_SYMBOL(page_pool_update_nid);
+
+void __page_pool_iov_free(struct page_pool_iov *ppiov)
+{
+	if (ppiov->pp->mp_ops != &dmabuf_devmem_ops)
+		return;
+
+	netdev_free_devmem(ppiov);
+}
+EXPORT_SYMBOL_GPL(__page_pool_iov_free);
+
+/*** "Dmabuf devmem memory provider" ***/
+
+static int mp_dmabuf_devmem_init(struct page_pool *pool)
+{
+	struct netdev_dmabuf_binding *binding = pool->mp_priv;
+
+	if (!binding)
+		return -EINVAL;
+
+	if (pool->p.flags & PP_FLAG_DMA_MAP ||
+	    pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
+		return -EOPNOTSUPP;
+
+	netdev_devmem_binding_get(binding);
+	return 0;
+}
+
+static struct page *mp_dmabuf_devmem_alloc_pages(struct page_pool *pool,
+						 gfp_t gfp)
+{
+	struct netdev_dmabuf_binding *binding = pool->mp_priv;
+	struct page_pool_iov *ppiov;
+
+	ppiov = netdev_alloc_devmem(binding);
+	if (!ppiov)
+		return NULL;
+
+	ppiov->pp = pool;
+	pool->pages_state_hold_cnt++;
+	trace_page_pool_state_hold(pool, (struct page *)ppiov,
+				   pool->pages_state_hold_cnt);
+	return (struct page *)((unsigned long)ppiov | PP_DEVMEM);
+}
+
+static void mp_dmabuf_devmem_destroy(struct page_pool *pool)
+{
+	struct netdev_dmabuf_binding *binding = pool->mp_priv;
+
+	netdev_devmem_binding_put(binding);
+}
+
+static bool mp_dmabuf_devmem_release_page(struct page_pool *pool,
+					  struct page *page)
+{
+	struct page_pool_iov *ppiov;
+
+	if (WARN_ON_ONCE(!page_is_page_pool_iov(page)))
+		return false;
+
+	ppiov = page_to_page_pool_iov(page);
+	page_pool_iov_put_many(ppiov, 1);
+	/* We don't want the page pool put_page()ing our page_pool_iovs. */
+	return false;
+}
+
+const struct pp_memory_provider_ops dmabuf_devmem_ops = {
+	.init			= mp_dmabuf_devmem_init,
+	.destroy		= mp_dmabuf_devmem_destroy,
+	.alloc_pages		= mp_dmabuf_devmem_alloc_pages,
+	.release_page		= mp_dmabuf_devmem_release_page,
+};
+EXPORT_SYMBOL(dmabuf_devmem_ops);
-- 
2.42.0.869.gea05f2083d-goog

