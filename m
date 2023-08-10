Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 066A8776DB6
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 03:58:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5E910E16B;
	Thu, 10 Aug 2023 01:58:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64E810E15E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 01:58:08 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-d4b1c8f2d91so446774276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 18:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1691632688; x=1692237488;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=02sZ2KF4/kqkk3itVZ075jQ951/44aLMfRaJz3dWZO4=;
 b=6mH2Ew/JcDBG5I+lwTS2EpGNdA9p2OpK3REUFQmgG/geEfGAlApwafQm+F8Gjno4YC
 vCDpAjVQe/ngWT9ZjuvRnO154w6wMjfn1TMqYO6+aMkf3aUUNdMJ68kQBo2qQ919+N+6
 lKxnUZJbXsq2kguUx1ebg3wjqtsA5OXafhjUWBT09q2+GKzL/W7LndWwN5JGkvJDAsIU
 f37R5BVREmn+7hqWsqzA49Zg1HbjS5FUv9sr3KyQvLdN0VbcJv5ntYIw6TECU5sCQfjR
 5iZE0rdJFNV4kBD7r9HDwuh2iYmq6tOP0IggmUN31yMTUrjT1B3pj+8C4fHWrpOgLVl5
 IaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691632688; x=1692237488;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=02sZ2KF4/kqkk3itVZ075jQ951/44aLMfRaJz3dWZO4=;
 b=Qsx5uzonByRIARWzs4v0SgU4Y6KFq0mQ3dFBlhRrSFHHNvYE5QQHBv/rf5krFSu9ic
 rY8zGUAhCaaTwT7CMFD8THHInKQgJoCrN/8ZMxpUeJo6dGA7f4mNl8XzH8zt1n66ZDTs
 NNDwtaPvCLyNCEMFN/BTJEjZJ1/aMMx7obIc+vJL+xwghZ3vyNLCcWP8QUh59oGMCWRc
 fBdFBqLkFQD0I5keqTmWE9NQb2Qguws6TQiKCK0dqxQZGuJtzIcyGUZVOR3AbzEwjQbN
 E99usuXH4r51/i3K7m8Nji/hyQDiMLEEGRbjGsATSUARGm0TtHrUUX1tUSIc8w0cnFhq
 KB7w==
X-Gm-Message-State: AOJu0YyECjt5TDBUU1LgHVxgBUiJBe7QM9DZ1dmEbszcJgiMjb138dJo
 vfJ2mjNgMFIj2ud0fVAsYUaJFWHzMkn1mUwacQ==
X-Google-Smtp-Source: AGHT+IGCapGPNtCMW44RrnrHw/oUHA4QZiHHbnSEAibZ2bVU1IyKSIRjwoib/ZnyU3K9b3mMe5ZiIByGi0TbafufWQ==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:73ad:9ed5:e067:2b9b])
 (user=almasrymina job=sendgmr) by 2002:a25:778b:0:b0:d09:17f2:d3b0 with SMTP
 id s133-20020a25778b000000b00d0917f2d3b0mr16984ybc.9.1691632688161; Wed, 09
 Aug 2023 18:58:08 -0700 (PDT)
Date: Wed,  9 Aug 2023 18:57:39 -0700
In-Reply-To: <20230810015751.3297321-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230810015751.3297321-4-almasrymina@google.com>
Subject: [RFC PATCH v2 03/11] netdev: implement netdevice devmem allocator
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
 include/linux/netdevice.h |  4 ++++
 include/net/page_pool.h   | 26 ++++++++++++++++++++++++++
 net/core/dev.c            | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 1b7c5966d2ca..bb5296e6cb00 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -5078,6 +5078,10 @@ void netif_set_tso_max_segs(struct net_device *dev, unsigned int segs);
 void netif_inherit_tso_max(struct net_device *to,
 			   const struct net_device *from);

+struct page_pool_iov *
+netdev_alloc_devmem(struct netdev_dmabuf_binding *binding);
+void netdev_free_devmem(struct page_pool_iov *ppiov);
+
 void netdev_unbind_dmabuf_to_queue(struct netdev_dmabuf_binding *binding);
 int netdev_bind_dmabuf_to_queue(struct net_device *dev, unsigned int dmabuf_fd,
 				u32 rxq_idx,
diff --git a/include/net/page_pool.h b/include/net/page_pool.h
index 61b2066d32b5..13ae7f668c9e 100644
--- a/include/net/page_pool.h
+++ b/include/net/page_pool.h
@@ -197,6 +197,32 @@ struct page_pool_iov {
 	refcount_t refcount;
 };

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
 struct page_pool {
 	struct page_pool_params p;

diff --git a/net/core/dev.c b/net/core/dev.c
index 02a25ccf771a..0149335a25b7 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -2072,6 +2072,42 @@ void __netdev_devmem_binding_free(struct netdev_dmabuf_binding *binding)
 	kfree(binding);
 }

+struct page_pool_iov *netdev_alloc_devmem(struct netdev_dmabuf_binding *binding)
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
+	netdev_devmem_binding_get(binding);
+
+	return ppiov;
+}
+
+void netdev_free_devmem(struct page_pool_iov *ppiov)
+{
+	struct netdev_dmabuf_binding *binding = page_pool_iov_binding(ppiov);
+
+	refcount_set(&ppiov->refcount, 1);
+
+	if (gen_pool_has_addr(binding->chunk_pool,
+			      page_pool_iov_dma_addr(ppiov), PAGE_SIZE))
+		gen_pool_free(binding->chunk_pool,
+			      page_pool_iov_dma_addr(ppiov), PAGE_SIZE);
+
+	netdev_devmem_binding_put(binding);
+}
+
 void netdev_unbind_dmabuf_to_queue(struct netdev_dmabuf_binding *binding)
 {
 	struct netdev_rx_queue *rxq;
--
2.41.0.640.ga95def55d0-goog
