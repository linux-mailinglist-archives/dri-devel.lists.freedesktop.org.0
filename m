Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 550248097C1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 01:53:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD47710E243;
	Fri,  8 Dec 2023 00:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A9E10E243
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 00:53:12 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5d42c43d8daso10064637b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 16:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1701996792; x=1702601592;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=6PanYp2ouKVS9w/roipcdSrUh/6HC+Cc/BaaByD7oTA=;
 b=1FNfAdztRBEl/T2ivS6XN7Z+91PP189w0uehLGq6JUySXERTGxYHZrDgOksjAloAPe
 zn6UTypaw8s0AtO+vqEMKrQBehBnxXuwZFFnOg+mqJ48GktWf1Hv8h0dQOoM5U/F4Wps
 SrCdUevuebUBOgJRw0vygBi9svQgsrYwx35PHhMxhsANdKui9LUSaDdN7WVWx0/IHjcB
 ruQYRYyDovWCSCf2/6eABXxrkDgUUUkfmX2H98oX3kfWZSSvHs42WrM6t2LcglpbEVQR
 MgV/enNsq1RlbJ9Mxxh+o8j8rWCbnIDVcoi34r0s5H08oxKTb8Z1OKyZ331Kr4YZW1Al
 RmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701996792; x=1702601592;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6PanYp2ouKVS9w/roipcdSrUh/6HC+Cc/BaaByD7oTA=;
 b=kXdWheVPCHinoxF3qdXrE6Z1KsXv+K/HfsKxE8orH18K40TyTNP8kjSnwxTCbCmSVM
 +6eWq/Gsk/4lH/ZyQq6b2HZ+AuqCRSnkJHve9zA6C+1OvxV5NGNPQ75+5o4DKwxx9yj8
 HFzhvcpjaFYNYCXhfRmRgrJiUmRNubdj7CpuY4Ko4sekckXvrWzTrM+nSbKvsA038+ss
 Ho24FPNgojrXhmhYpyItgNVMPbUAS9o8jPO/bsnNYGeW+TUSS9eIL/215NspRkiCDNYH
 5VBakz0lLCijFd9IHEJ+0Oi0VkA4H4KT31Jjr2Cam5eWTn2y8tMqzwpTQObfaTgD/oO7
 KG5w==
X-Gm-Message-State: AOJu0YywKrdYrWyL6NljRlvbq6ySyHZ8z4T0wwHSOsSLuM2q7/B6haha
 HHt8B6qVE/3vsIgpB5pY3aQeQHKvZN7O5AR2bw==
X-Google-Smtp-Source: AGHT+IGDrGdzKCZeXxHvoevYHR+XyV2uxTFS42twCXRztl0Uu67zB8k7EQNOQjn97TY+B0DF6/AXdEuat+JKehFLBw==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:f1cf:c733:235b:9fff])
 (user=almasrymina job=sendgmr) by 2002:a0d:e208:0:b0:5d9:340c:292d with SMTP
 id l8-20020a0de208000000b005d9340c292dmr1876ywe.4.1701996791753; Thu, 07 Dec
 2023 16:53:11 -0800 (PST)
Date: Thu,  7 Dec 2023 16:52:39 -0800
In-Reply-To: <20231208005250.2910004-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20231208005250.2910004-1-almasrymina@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231208005250.2910004-9-almasrymina@google.com>
Subject: [net-next v1 08/16] memory-provider: dmabuf devmem memory provider
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
 Kaiyuan Zhang <kaiyuanz@google.com>, Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Yunsheng Lin <linyunsheng@huawei.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Eric Dumazet <edumazet@google.com>, Shakeel Butt <shakeelb@google.com>,
 Willem de Bruijn <willemb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement a memory provider that allocates dmabuf devmem page_pool_iovs.

The provider receives a reference to the struct netdev_dmabuf_binding
via the pool->mp_priv pointer. The driver needs to set this pointer for
the provider in the page_pool_params.

The provider obtains a reference on the netdev_dmabuf_binding which
guarantees the binding and the underlying mapping remains alive until
the provider is destroyed.

Usage of PP_FLAG_DMA_MAP is required for this memory provide such that
the page_pool can provide the driver with the dma-addrs of the devmem.

Support for PP_FLAG_DMA_SYNC_DEV is omitted for simplicity.

Signed-off-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>

---

v1:
- static_branch check in page_is_page_pool_iov() (Willem & Paolo).
- PP_DEVMEM -> PP_IOV (David).
- Require PP_FLAG_DMA_MAP (Jakub).

---
 include/net/page_pool/helpers.h | 47 +++++++++++++++++
 include/net/page_pool/types.h   |  9 ++++
 net/core/page_pool.c            | 89 ++++++++++++++++++++++++++++++++-
 3 files changed, 144 insertions(+), 1 deletion(-)

diff --git a/include/net/page_pool/helpers.h b/include/net/page_pool/helpers.h
index 8bfc2d43efd4..00197f14aa87 100644
--- a/include/net/page_pool/helpers.h
+++ b/include/net/page_pool/helpers.h
@@ -53,6 +53,8 @@
 #define _NET_PAGE_POOL_HELPERS_H
 
 #include <net/page_pool/types.h>
+#include <net/net_debug.h>
+#include <net/devmem.h>
 
 #ifdef CONFIG_PAGE_POOL_STATS
 /* Deprecated driver-facing API, use netlink instead */
@@ -92,6 +94,11 @@ static inline unsigned int page_pool_iov_idx(const struct page_pool_iov *ppiov)
 	return ppiov - page_pool_iov_owner(ppiov)->ppiovs;
 }
 
+static inline u32 page_pool_iov_binding_id(const struct page_pool_iov *ppiov)
+{
+	return page_pool_iov_owner(ppiov)->binding->id;
+}
+
 static inline dma_addr_t
 page_pool_iov_dma_addr(const struct page_pool_iov *ppiov)
 {
@@ -107,6 +114,46 @@ page_pool_iov_binding(const struct page_pool_iov *ppiov)
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
+DECLARE_STATIC_KEY_FALSE(page_pool_mem_providers);
+static inline bool page_is_page_pool_iov(const struct page *page)
+{
+	return static_branch_unlikely(&page_pool_mem_providers) &&
+	       (unsigned long)page & PP_IOV;
+}
+
+static inline struct page_pool_iov *page_to_page_pool_iov(struct page *page)
+{
+	if (page_is_page_pool_iov(page))
+		return (struct page_pool_iov *)((unsigned long)page & ~PP_IOV);
+
+	DEBUG_NET_WARN_ON_ONCE(true);
+	return NULL;
+}
+
 /**
  * page_pool_dev_alloc_pages() - allocate a page.
  * @pool:	pool from which to allocate
diff --git a/include/net/page_pool/types.h b/include/net/page_pool/types.h
index 44faee7a7b02..136930a238de 100644
--- a/include/net/page_pool/types.h
+++ b/include/net/page_pool/types.h
@@ -134,8 +134,15 @@ struct memory_provider_ops {
 	bool (*release_page)(struct page_pool *pool, struct page *page);
 };
 
+extern const struct memory_provider_ops dmabuf_devmem_ops;
+
 /* page_pool_iov support */
 
+/*  We overload the LSB of the struct page pointer to indicate whether it's
+ *  a page or page_pool_iov.
+ */
+#define PP_IOV 0x01UL
+
 /* Owner of the dma-buf chunks inserted into the gen pool. Each scatterlist
  * entry from the dmabuf is inserted into the genpool as a chunk, and needs
  * this owner struct to keep track of some metadata necessary to create
@@ -159,6 +166,8 @@ struct page_pool_iov {
 	struct dmabuf_genpool_chunk_owner *owner;
 
 	refcount_t refcount;
+
+	struct page_pool *pp;
 };
 
 struct page_pool {
diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index f5c84d2a4510..423c88564a00 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -12,6 +12,7 @@
 
 #include <net/page_pool/helpers.h>
 #include <net/xdp.h>
+#include <net/netdev_rx_queue.h>
 
 #include <linux/dma-direction.h>
 #include <linux/dma-mapping.h>
@@ -20,12 +21,15 @@
 #include <linux/poison.h>
 #include <linux/ethtool.h>
 #include <linux/netdevice.h>
+#include <linux/genalloc.h>
+#include <net/devmem.h>
 
 #include <trace/events/page_pool.h>
 
 #include "page_pool_priv.h"
 
-static DEFINE_STATIC_KEY_FALSE(page_pool_mem_providers);
+DEFINE_STATIC_KEY_FALSE(page_pool_mem_providers);
+EXPORT_SYMBOL(page_pool_mem_providers);
 
 #define DEFER_TIME (msecs_to_jiffies(1000))
 #define DEFER_WARN_INTERVAL (60 * HZ)
@@ -175,6 +179,7 @@ static void page_pool_producer_unlock(struct page_pool *pool,
 static int page_pool_init(struct page_pool *pool,
 			  const struct page_pool_params *params)
 {
+	struct netdev_dmabuf_binding *binding = NULL;
 	unsigned int ring_qsize = 1024; /* Default */
 	int err;
 
@@ -237,6 +242,14 @@ static int page_pool_init(struct page_pool *pool,
 	/* Driver calling page_pool_create() also call page_pool_destroy() */
 	refcount_set(&pool->user_cnt, 1);
 
+	if (pool->p.queue)
+		binding = READ_ONCE(pool->p.queue->binding);
+
+	if (binding) {
+		pool->mp_ops = &dmabuf_devmem_ops;
+		pool->mp_priv = binding;
+	}
+
 	if (pool->mp_ops) {
 		err = pool->mp_ops->init(pool);
 		if (err) {
@@ -1020,3 +1033,77 @@ void page_pool_update_nid(struct page_pool *pool, int new_nid)
 	}
 }
 EXPORT_SYMBOL(page_pool_update_nid);
+
+void __page_pool_iov_free(struct page_pool_iov *ppiov)
+{
+	if (WARN_ON(ppiov->pp->mp_ops != &dmabuf_devmem_ops))
+		return;
+
+	netdev_free_dmabuf(ppiov);
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
+	if (!(pool->p.flags & PP_FLAG_DMA_MAP))
+		return -EOPNOTSUPP;
+
+	if (pool->p.flags & PP_FLAG_DMA_SYNC_DEV)
+		return -EOPNOTSUPP;
+
+	netdev_dmabuf_binding_get(binding);
+	return 0;
+}
+
+static struct page *mp_dmabuf_devmem_alloc_pages(struct page_pool *pool,
+						 gfp_t gfp)
+{
+	struct netdev_dmabuf_binding *binding = pool->mp_priv;
+	struct page_pool_iov *ppiov;
+
+	ppiov = netdev_alloc_dmabuf(binding);
+	if (!ppiov)
+		return NULL;
+
+	ppiov->pp = pool;
+	pool->pages_state_hold_cnt++;
+	trace_page_pool_state_hold(pool, (struct page *)ppiov,
+				   pool->pages_state_hold_cnt);
+	return (struct page *)((unsigned long)ppiov | PP_IOV);
+}
+
+static void mp_dmabuf_devmem_destroy(struct page_pool *pool)
+{
+	struct netdev_dmabuf_binding *binding = pool->mp_priv;
+
+	netdev_dmabuf_binding_put(binding);
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
+const struct memory_provider_ops dmabuf_devmem_ops = {
+	.init			= mp_dmabuf_devmem_init,
+	.destroy		= mp_dmabuf_devmem_destroy,
+	.alloc_pages		= mp_dmabuf_devmem_alloc_pages,
+	.release_page		= mp_dmabuf_devmem_release_page,
+};
+EXPORT_SYMBOL(dmabuf_devmem_ops);
-- 
2.43.0.472.g3155946c3a-goog

