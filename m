Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E088E817B92
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 21:04:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2F610E08B;
	Mon, 18 Dec 2023 20:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f73.google.com (mail-ot1-f73.google.com
 [209.85.210.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22B910E08B
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 20:03:39 +0000 (UTC)
Received: by mail-ot1-f73.google.com with SMTP id
 46e09a7af769-6d9decbc5d7so4333914a34.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 12:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702929819; x=1703534619;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=0NYFi1E6S6T+SKvDHn8CGr+ocURXqvLv0Q7fBvZhwls=;
 b=sQa1nWTnYfk6xjwvs4CtPUfzdT0f4NIUEU0L3faQEeGtk2N9vrTkB2MMuR6ZVgtRvC
 bhvoTmr1RIBuupbKLOQIB4XGUo6TVqVdlMRapVaeQQ4vmhuzVVvWrkQJ/37DJ3YINDEs
 K2O5x8IdlT/r8TyfNo4+2bbBt2VEI797qnNowpazH2vIMzaAUQprSsuddNOe6DaHU5AA
 vCeMNwCO0K2+NcezZ7pIGtJoKf0kLpLmgiV/YTXhqF+CL8gy5hapjRBxWN+pE80dKFtV
 7bWhCnQDj0XTg5W+x9BHBY++cRdZcA9DVN+Mw0kNc4g6jQN6w62OyA0kHnP/NoLf47/Q
 wrzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702929819; x=1703534619;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0NYFi1E6S6T+SKvDHn8CGr+ocURXqvLv0Q7fBvZhwls=;
 b=vLOwsxWKc6EuGDFgbf//sCCY2hBx7iRSrz7ASlDpzwCx3SVlG41W8JA7nI+eKn7nyn
 I4cF3L8CmbYaJwXpLN8CS19PEf1sZJ9BrAtfQ9uu9GWkO2JFYxA/BOaNbzUw74ap15od
 fiBoNJ5Q0zb/S4Kex0YZbHzFHnMJop9gqdb8E7AAgckFV6mL7RqvSdcesv7zWtMia51R
 ZoEk04TGMbWVgIWpruDO0dc2IXBB84tDOWjB2xt37DUCr9AA8bMTjlxXR2LBskpo3k2g
 PQiKJR9vyprDadpBaGFPPc5XdaRrrMlNPCSGn89JIVvfaANIhsd0gBXjSfDZu7yi80nH
 KFNw==
X-Gm-Message-State: AOJu0Yyrge3ijYAm9SqNzZoB2aJz+zO8KgScRLhH6AhqitCcyEWuVtDN
 lJLIWMO6dt2X5aSDfF1Kkjk7QUAuUn075N/psQ==
X-Google-Smtp-Source: AGHT+IE2XSqfv2CUNqqU64sA1WFOtidasTRZ6basBPuVSba7XJNyOKLZqJ4mltH4ukBLFHqO73jJyF5cXDhkelwyAw==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:5cbf:3534:fb34:758e])
 (user=almasrymina job=sendgmr) by 2002:a05:690c:1e:b0:5d7:545e:3bd0 with SMTP
 id bc30-20020a05690c001e00b005d7545e3bd0mr1609684ywb.4.1702867246059; Sun, 17
 Dec 2023 18:40:46 -0800 (PST)
Date: Sun, 17 Dec 2023 18:40:15 -0800
In-Reply-To: <20231218024024.3516870-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20231218024024.3516870-1-almasrymina@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231218024024.3516870-9-almasrymina@google.com>
Subject: [RFC PATCH net-next v5 08/14] memory-provider: dmabuf devmem memory
 provider
From: Mina Almasry <almasrymina@google.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org, 
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
Cc: Kaiyuan Zhang <kaiyuanz@google.com>,
 Pavel Begunkov <asml.silence@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Eric Dumazet <edumazet@google.com>, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Mina Almasry <almasrymina@google.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Jonathan Corbet <corbet@lwn.net>, Helge Deller <deller@gmx.de>,
 Andrii Nakryiko <andrii@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jakub Kicinski <kuba@kernel.org>, Matt Turner <mattst88@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Steven Rostedt <rostedt@goodmis.org>, Shailend Chand <shailend@google.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Willem de Bruijn <willemb@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, David Wei <dw@davidwei.uk>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Yunsheng Lin <linyunsheng@huawei.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Shakeel Butt <shakeelb@google.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement a memory provider that allocates dmabuf devmem in the form of
net_iov.

The provider receives a reference to the struct netdev_dmabuf_binding
via the pool->mp_priv pointer. The driver needs to set this pointer for
the provider in the net_iov.

The provider obtains a reference on the netdev_dmabuf_binding which
guarantees the binding and the underlying mapping remains alive until
the provider is destroyed.

Usage of PP_FLAG_DMA_MAP is required for this memory provide such that
the page_pool can provide the driver with the dma-addrs of the devmem.

Support for PP_FLAG_DMA_SYNC_DEV is omitted for simplicity & p.order !=
0.

Signed-off-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>

---

v2:
- Disable devmem for p.order != 0

v1:
- static_branch check in page_is_page_pool_iov() (Willem & Paolo).
- PP_DEVMEM -> PP_IOV (David).
- Require PP_FLAG_DMA_MAP (Jakub).


memory provider

---
 include/net/netmem.h          | 14 ++++++
 include/net/page_pool/types.h |  2 +
 net/core/page_pool.c          | 93 +++++++++++++++++++++++++++++++++++
 3 files changed, 109 insertions(+)

diff --git a/include/net/netmem.h b/include/net/netmem.h
index 7557aecc0f78..ab3824b7b789 100644
--- a/include/net/netmem.h
+++ b/include/net/netmem.h
@@ -97,6 +97,20 @@ static inline bool netmem_is_net_iov(const struct netmem *netmem)
 #endif
 }
 
+static inline struct net_iov *netmem_to_net_iov(struct netmem *netmem)
+{
+	if (netmem_is_net_iov(netmem))
+		return (struct net_iov *)((unsigned long)netmem & ~NET_IOV);
+
+	DEBUG_NET_WARN_ON_ONCE(true);
+	return NULL;
+}
+
+static inline struct netmem *net_iov_to_netmem(struct net_iov *niov)
+{
+	return (struct netmem *)((unsigned long)niov | NET_IOV);
+}
+
 static inline struct page *netmem_to_page(struct netmem *netmem)
 {
 	if (WARN_ON_ONCE(netmem_is_net_iov(netmem)))
diff --git a/include/net/page_pool/types.h b/include/net/page_pool/types.h
index 433ae9ae658b..3ddef7d7ba74 100644
--- a/include/net/page_pool/types.h
+++ b/include/net/page_pool/types.h
@@ -134,6 +134,8 @@ struct memory_provider_ops {
 	bool (*release_page)(struct page_pool *pool, struct netmem *netmem);
 };
 
+extern const struct memory_provider_ops dmabuf_devmem_ops;
+
 struct page_pool {
 	struct page_pool_params_fast p;
 
diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index 173158a3dd61..231840112956 100644
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
 
 DEFINE_STATIC_KEY_FALSE(page_pool_mem_providers);
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
@@ -1055,3 +1068,83 @@ void page_pool_update_nid(struct page_pool *pool, int new_nid)
 	}
 }
 EXPORT_SYMBOL(page_pool_update_nid);
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
+	if (pool->p.order != 0)
+		return -E2BIG;
+
+	netdev_dmabuf_binding_get(binding);
+	return 0;
+}
+
+static struct netmem *mp_dmabuf_devmem_alloc_pages(struct page_pool *pool,
+						   gfp_t gfp)
+{
+	struct netdev_dmabuf_binding *binding = pool->mp_priv;
+	struct netmem *netmem;
+	struct net_iov *niov;
+	dma_addr_t dma_addr;
+
+	niov = netdev_alloc_dmabuf(binding);
+	if (!niov)
+		return NULL;
+
+	dma_addr = net_iov_dma_addr(niov);
+
+	netmem = net_iov_to_netmem(niov);
+
+	page_pool_set_pp_info(pool, netmem);
+
+	if (page_pool_set_dma_addr_netmem(netmem, dma_addr))
+		goto err_free;
+
+	pool->pages_state_hold_cnt++;
+	trace_page_pool_state_hold(pool, netmem, pool->pages_state_hold_cnt);
+	return netmem;
+
+err_free:
+	netdev_free_dmabuf(niov);
+	return NULL;
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
+					  struct netmem *netmem)
+{
+	WARN_ON_ONCE(!netmem_is_net_iov(netmem));
+
+	page_pool_clear_pp_info(netmem);
+
+	netdev_free_dmabuf(netmem_to_net_iov(netmem));
+
+	/* We don't want the page pool put_page()ing our net_iovs. */
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

