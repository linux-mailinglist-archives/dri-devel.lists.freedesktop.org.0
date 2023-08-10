Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04846776DB9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 03:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF0A10E16E;
	Thu, 10 Aug 2023 01:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99E8210E16E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 01:58:14 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-d5869d96657so478080276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 18:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1691632694; x=1692237494;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=7yDr7JQeHi3HbfjhCajA/kTx8YfoU/wmOXpUofE1h4w=;
 b=XfCKIi7ayck9Nw0bIZfVpqsATb0SO0Nh0Drm64/DAcULnkhUWKp++UzHd1KQT9bmRZ
 pmvRDhJqyQiWxcybNrFcOVutxvfmyDLqS9AwT1w31Cwhq+JxPbZmYuYZWYAjji2phxiR
 UrdHPM/pD1jXE0ooBUufFnt1xheblVx5sw2QpSz1W1XnYdxxk4gz1zmx9BODhaml85mR
 eH0RQB7DfNzN3GnXzawdpsmIshnQCjy99WbzFWl3RzDJRXIkTI9COJBcT/pjGJC38OH4
 W0PZDcOhs9n17MPeeV8thi79paIxx0Dbl9LXmQLGfK6JctFH8DQo7XzWDqmwkE1vECZA
 asIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691632694; x=1692237494;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7yDr7JQeHi3HbfjhCajA/kTx8YfoU/wmOXpUofE1h4w=;
 b=QrDCqnEjEfKjyxRvEf0uF7O1T0BvZYoEk6v4GOoASPtOsn5VAe1p8euWvkYEQ4fAII
 1CJJU1CZa4jj25Wg/dvKoy/48FxoXeYb2gPzr3x1z+UA72qf7b1CCVsBKhiQPdFrQqRu
 D+LpqJJzgJXv80CZymu+xAAmHpr0ZThalebq3VsLv0Xm5alNxzJI4JJiSbX8gVMf9vEY
 w1q4+UvvJjo/jWnObCWllsH2bo0TqiFuIi9oC4zACUvx7NpK5t92sIrv1jGJK6Es2s2e
 2o1WTSOSKtAvRCdyueP2ikE/piO5lv5OF/EMPhWIc/KeYbfYgdXO1uz0CofkilMTquBa
 p2kA==
X-Gm-Message-State: AOJu0Yz9vIecADYXScgLwHlGrWxJ9bYKyDgmjdIxNvN5seG8llztN2By
 fdfdwaY0rG7ApWKpBbye2eFH/aw/ii4GklZ0cg==
X-Google-Smtp-Source: AGHT+IHvIgRoUi9uTu8RQhbvocSiejbRnMQw0KEmAOPCPAqjCwCmVL+NueD6xFCvDOx3/je0ZQbqIBEk9eQZYEBgWA==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:73ad:9ed5:e067:2b9b])
 (user=almasrymina job=sendgmr) by 2002:a25:dad7:0:b0:d14:6868:16a3 with SMTP
 id n206-20020a25dad7000000b00d14686816a3mr18332ybf.5.1691632693837; Wed, 09
 Aug 2023 18:58:13 -0700 (PDT)
Date: Wed,  9 Aug 2023 18:57:41 -0700
In-Reply-To: <20230810015751.3297321-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230810015751.3297321-6-almasrymina@google.com>
Subject: [RFC PATCH v2 05/11] memory-provider: implement dmabuf devmem memory
 provider
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
 Kaiyuan Zhang <kaiyuanz@google.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Willem de Bruijn <willemb@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 stephen@networkplumber.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Eric Dumazet <edumazet@google.com>, sdf@google.com,
 Andy Lutomirski <luto@kernel.org>, Hari Ramakrishnan <rharix@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement a memory provider that allocates dmabuf devmem page_pool_iovs.

Support of PP_FLAG_DMA_MAP, PP_FLAG_DMA_SYNC_DEV, and PP_FLAG_PAGE_FRAG
is omitted. PP_FLAG_DMA_MAP is irrelevant as dma-buf devmem is already
mapped. The other flags are omitted for simplicity.

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
 include/net/page_pool.h | 58 ++++++++++++++++++++++++++++++
 net/core/page_pool.c    | 79 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 137 insertions(+)

diff --git a/include/net/page_pool.h b/include/net/page_pool.h
index e395f82e182b..537eb36115ed 100644
--- a/include/net/page_pool.h
+++ b/include/net/page_pool.h
@@ -32,6 +32,7 @@
 #include <linux/mm.h> /* Needed by ptr_ring */
 #include <linux/ptr_ring.h>
 #include <linux/dma-direction.h>
+#include <net/net_debug.h>

 #define PP_FLAG_DMA_MAP		BIT(0) /* Should page_pool do the DMA
 					* map/unmap
@@ -157,6 +158,7 @@ enum pp_memory_provider_type {
 	PP_MP_HUGE_SPLIT, /* 2MB, online page alloc */
 	PP_MP_HUGE, /* 2MB, all memory pre-allocated */
 	PP_MP_HUGE_1G, /* 1G pages, MEP, pre-allocated */
+	PP_MP_DMABUF_DEVMEM, /* dmabuf devmem provider */
 };

 struct pp_memory_provider_ops {
@@ -170,9 +172,15 @@ extern const struct pp_memory_provider_ops basic_ops;
 extern const struct pp_memory_provider_ops hugesp_ops;
 extern const struct pp_memory_provider_ops huge_ops;
 extern const struct pp_memory_provider_ops huge_1g_ops;
+extern const struct pp_memory_provider_ops dmabuf_devmem_ops;

 /* page_pool_iov support */

+/*  We overload the LSB of the struct page pointer to indicate whether it's
+ *  a page or page_pool_iov.
+ */
+#define PP_DEVMEM 0x01UL
+
 /* Owner of the dma-buf chunks inserted into the gen pool. Each scatterlist
  * entry from the dmabuf is inserted into the genpool as a chunk, and needs
  * this owner struct to keep track of some metadata necessary to create
@@ -196,6 +204,8 @@ struct page_pool_iov {
 	struct dmabuf_genpool_chunk_owner *owner;

 	refcount_t refcount;
+
+	struct page_pool *pp;
 };

 static inline struct dmabuf_genpool_chunk_owner *
@@ -218,12 +228,60 @@ page_pool_iov_dma_addr(const struct page_pool_iov *ppiov)
 	       ((dma_addr_t)page_pool_iov_idx(ppiov) << PAGE_SHIFT);
 }

+static inline unsigned long
+page_pool_iov_virtual_addr(const struct page_pool_iov *ppiov)
+{
+	struct dmabuf_genpool_chunk_owner *owner = page_pool_iov_owner(ppiov);
+
+	return owner->base_virtual +
+	       ((unsigned long)page_pool_iov_idx(ppiov) << PAGE_SHIFT);
+}
+
 static inline struct netdev_dmabuf_binding *
 page_pool_iov_binding(const struct page_pool_iov *ppiov)
 {
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
 struct page_pool {
 	struct page_pool_params p;

diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index df3f431fcff3..0a7c08d748b8 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -20,6 +20,7 @@
 #include <linux/poison.h>
 #include <linux/ethtool.h>
 #include <linux/netdevice.h>
+#include <linux/genalloc.h>

 #include <trace/events/page_pool.h>

@@ -236,6 +237,9 @@ static int page_pool_init(struct page_pool *pool,
 	case PP_MP_HUGE_1G:
 		pool->mp_ops = &huge_1g_ops;
 		break;
+	case PP_MP_DMABUF_DEVMEM:
+		pool->mp_ops = &dmabuf_devmem_ops;
+		break;
 	default:
 		err = -EINVAL;
 		goto free_ptr_ring;
@@ -1006,6 +1010,15 @@ bool page_pool_return_skb_page(struct page *page, bool napi_safe)
 }
 EXPORT_SYMBOL(page_pool_return_skb_page);

+void __page_pool_iov_free(struct page_pool_iov *ppiov)
+{
+	if (ppiov->pp->mp_ops != &dmabuf_devmem_ops)
+		return;
+
+	netdev_free_devmem(ppiov);
+}
+EXPORT_SYMBOL_GPL(__page_pool_iov_free);
+
 /***********************
  *  Mem provider hack  *
  ***********************/
@@ -1538,3 +1551,69 @@ const struct pp_memory_provider_ops huge_1g_ops = {
 	.alloc_pages		= mp_huge_1g_alloc_pages,
 	.release_page		= mp_huge_1g_release,
 };
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
+	    pool->p.flags & PP_FLAG_DMA_SYNC_DEV ||
+	    pool->p.flags & PP_FLAG_PAGE_FRAG)
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
+	ppiov = (struct page_pool_iov *)((unsigned long)ppiov | PP_DEVMEM);
+
+	return (struct page *)ppiov;
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
2.41.0.640.ga95def55d0-goog
