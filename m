Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA66D8097C2
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 01:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23CD10E9B0;
	Fri,  8 Dec 2023 00:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7764910E243
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 00:53:10 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-db54c11887aso1918744276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 16:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1701996789; x=1702601589;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=SdsQlA52rmqBL7OXbh7npWQi67Syf8S/UwksNo2UDhs=;
 b=BKK3pzrZ3iy6uYHN6NChhX/q0LE1O3cVRj1foCbA8P3BHyf5wOTiZ8pL2FXq0AGip4
 yBSCyCBdZE7hauGCNM5HPtaxrefh+Zj6BPKlMl4MGMg5WSWoUFpuoka6gSdcR4xH/ecq
 GCzvpAlirafFU8NQt0xguMOkS/jTFnhtC6+3a1TTMheyF0PajGlR9hLcf0QFNvabPq+l
 4uROTGB01k+kvzSseafl7t0zDayf62i4dDz72HAp0gAYE9Ysf6OS+GhdDypj96dKH7yM
 viI475bdq3hDcoYC6WS9jMrldAZG4NivIHi2ybA7NZP2FxB5sHeRa9it0sw87hpIoLbA
 x6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701996789; x=1702601589;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SdsQlA52rmqBL7OXbh7npWQi67Syf8S/UwksNo2UDhs=;
 b=L/ESH03YV/eh6gptfmR714f2oIaYv/nH6MDYowsAwAS5btij+/3N9yHlOP8V6rY+Qb
 D4a2tQJsnY4czcIPWWUDe1ZnFNOOy+Ipn1BWhAuaB8hlrMxTBW1not8+/1tAdCmvnQzm
 I3KYhZNSkOS8SPizyVUswIeE9mjNDX5yPxbVVSMO7E5i1RNr3/SP7+59vIsb/PNf6scY
 iqPujWo/4tpZ8YmvMtbxlQMQ1Nd+fvAG4w9slTkqH5/5nyDsW4qKacBCQymh+OQjhlRU
 Qah+ZLg3CxI3xNdjEcxnnkspurSA1BBhDlshvwpy7K7RZnwb4v7hbrhpurrI4rcdREpl
 pqMw==
X-Gm-Message-State: AOJu0YwyNo9ESNoO9edTt5J3wPKaWIJpRVVYw9hr551bGz01bqZo7XRg
 HuJwaZ+o+j/G3dbi287n3ObhhZkF06LprIR6Ng==
X-Google-Smtp-Source: AGHT+IH/gfYr5EUfMzd/NX+8vXC/GoT0BalxzSTTls31g4lmQqKZy/8eIFEENuQk1BoM56tiXZ2me83KTuMQvZ3iJQ==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:f1cf:c733:235b:9fff])
 (user=almasrymina job=sendgmr) by 2002:a25:7690:0:b0:db4:6936:48b7 with SMTP
 id r138-20020a257690000000b00db4693648b7mr52142ybc.2.1701996789635; Thu, 07
 Dec 2023 16:53:09 -0800 (PST)
Date: Thu,  7 Dec 2023 16:52:38 -0800
In-Reply-To: <20231208005250.2910004-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20231208005250.2910004-1-almasrymina@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231208005250.2910004-8-almasrymina@google.com>
Subject: [net-next v1 07/16] netdev: netdevice devmem allocator
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

Implement netdev devmem allocator. The allocator takes a given struct
netdev_dmabuf_binding as input and allocates page_pool_iov from that
binding.

The allocation simply delegates to the binding's genpool for the
allocation logic and wraps the returned memory region in a page_pool_iov
struct.

page_pool_iov are refcounted and are freed back to the binding when the
refcount drops to 0.

Signed-off-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>

---

v1:
- Rename devmem -> dmabuf (David).

---
 include/net/devmem.h            | 13 ++++++++++++
 include/net/page_pool/helpers.h | 28 +++++++++++++++++++++++++
 net/core/dev.c                  | 37 ++++++++++++++++++++++++++++++++-
 3 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/include/net/devmem.h b/include/net/devmem.h
index 29ff125f9815..29bc337c7743 100644
--- a/include/net/devmem.h
+++ b/include/net/devmem.h
@@ -48,6 +48,9 @@ struct netdev_dmabuf_binding {
 };
 
 #ifdef CONFIG_DMA_SHARED_BUFFER
+struct page_pool_iov *
+netdev_alloc_dmabuf(struct netdev_dmabuf_binding *binding);
+void netdev_free_dmabuf(struct page_pool_iov *ppiov);
 void __netdev_dmabuf_binding_free(struct netdev_dmabuf_binding *binding);
 int netdev_bind_dmabuf(struct net_device *dev, unsigned int dmabuf_fd,
 		       struct netdev_dmabuf_binding **out);
@@ -55,6 +58,16 @@ void netdev_unbind_dmabuf(struct netdev_dmabuf_binding *binding);
 int netdev_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
 				struct netdev_dmabuf_binding *binding);
 #else
+static inline struct page_pool_iov *
+netdev_alloc_dmabuf(struct netdev_dmabuf_binding *binding)
+{
+	return NULL;
+}
+
+static inline void netdev_free_dmabuf(struct page_pool_iov *ppiov)
+{
+}
+
 static inline void
 __netdev_dmabuf_binding_free(struct netdev_dmabuf_binding *binding)
 {
diff --git a/include/net/page_pool/helpers.h b/include/net/page_pool/helpers.h
index 7dc65774cde5..8bfc2d43efd4 100644
--- a/include/net/page_pool/helpers.h
+++ b/include/net/page_pool/helpers.h
@@ -79,6 +79,34 @@ static inline u64 *page_pool_ethtool_stats_get(u64 *data, void *stats)
 }
 #endif
 
+/* page_pool_iov support */
+
+static inline struct dmabuf_genpool_chunk_owner *
+page_pool_iov_owner(const struct page_pool_iov *ppiov)
+{
+	return ppiov->owner;
+}
+
+static inline unsigned int page_pool_iov_idx(const struct page_pool_iov *ppiov)
+{
+	return ppiov - page_pool_iov_owner(ppiov)->ppiovs;
+}
+
+static inline dma_addr_t
+page_pool_iov_dma_addr(const struct page_pool_iov *ppiov)
+{
+	struct dmabuf_genpool_chunk_owner *owner = page_pool_iov_owner(ppiov);
+
+	return owner->base_dma_addr +
+	       ((dma_addr_t)page_pool_iov_idx(ppiov) << PAGE_SHIFT);
+}
+
+static inline struct netdev_dmabuf_binding *
+page_pool_iov_binding(const struct page_pool_iov *ppiov)
+{
+	return page_pool_iov_owner(ppiov)->binding;
+}
+
 /**
  * page_pool_dev_alloc_pages() - allocate a page.
  * @pool:	pool from which to allocate
diff --git a/net/core/dev.c b/net/core/dev.c
index b8c8be5a912e..30667e4c3b95 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -155,8 +155,8 @@
 #include <net/netdev_rx_queue.h>
 #include <linux/genalloc.h>
 #include <linux/dma-buf.h>
-#include <net/page_pool/types.h>
 #include <net/devmem.h>
+#include <net/page_pool/helpers.h>
 
 #include "dev.h"
 #include "net-sysfs.h"
@@ -2120,6 +2120,41 @@ static int netdev_restart_rx_queue(struct net_device *dev, int rxq_idx)
 	return err;
 }
 
+struct page_pool_iov *netdev_alloc_dmabuf(struct netdev_dmabuf_binding *binding)
+{
+	struct dmabuf_genpool_chunk_owner *owner;
+	struct page_pool_iov *ppiov;
+	unsigned long dma_addr;
+	ssize_t offset;
+	ssize_t index;
+
+	dma_addr = gen_pool_alloc_owner(binding->chunk_pool, PAGE_SIZE,
+					(void **)&owner);
+	if (!dma_addr)
+		return NULL;
+
+	offset = dma_addr - owner->base_dma_addr;
+	index = offset / PAGE_SIZE;
+	ppiov = &owner->ppiovs[index];
+
+	netdev_dmabuf_binding_get(binding);
+
+	return ppiov;
+}
+
+void netdev_free_dmabuf(struct page_pool_iov *ppiov)
+{
+	struct netdev_dmabuf_binding *binding = page_pool_iov_binding(ppiov);
+	unsigned long dma_addr = page_pool_iov_dma_addr(ppiov);
+
+	refcount_set(&ppiov->refcount, 1);
+
+	if (gen_pool_has_addr(binding->chunk_pool, dma_addr, PAGE_SIZE))
+		gen_pool_free(binding->chunk_pool, dma_addr, PAGE_SIZE);
+
+	netdev_dmabuf_binding_put(binding);
+}
+
 /* Protected by rtnl_lock() */
 static DEFINE_XARRAY_FLAGS(netdev_dmabuf_bindings, XA_FLAGS_ALLOC1);
 
-- 
2.43.0.472.g3155946c3a-goog

