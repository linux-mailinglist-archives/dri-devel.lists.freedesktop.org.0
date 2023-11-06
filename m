Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 436DC7E18BF
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 03:44:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D6210E257;
	Mon,  6 Nov 2023 02:44:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E98310E258
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 02:44:30 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-da033914f7cso4641713276.0
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Nov 2023 18:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699238669; x=1699843469;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=zCln+P1ZLV/9SicyKW3j3Qj5ciapVl1fP7AJwqOPEjI=;
 b=XRO7AvDSVWmiey5iZ77XMvCKIWoRqsKXxxh72YeFNMTV5T5aArl8gvrjdQTdOTk0Ha
 SPMeJgRJ5g4i3e+YBVbXtUOM3RWz/GuE70lHhQX073CvpzKlo1gmnf4IEA5UvtQA1Mgu
 bI4LJ27+vDYs46uppNzpAlwxqEPtehcKszf/tMrd8aKBzE1d5napTBh6y9lXF5DWVXlY
 Mz/iDvU9j1twSkJBtd4yHkdJL1WKpPhjjGsxpAJ8dJ2zpRtfw7JnHK6KW0dnfrFZkYeG
 qLDRr9jcYkjDj8BoJi8LI1JdU6wiyxpHrIt9ZFQ8g7VMusZ0MghZIQOgn+5DOwtGraq3
 FXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699238669; x=1699843469;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zCln+P1ZLV/9SicyKW3j3Qj5ciapVl1fP7AJwqOPEjI=;
 b=NLCJHbzKavcaVBjJpp1KOGjW4WanczQeHk/91VgzkPFxS+8ywWWG0xhZCP7L1L5HyL
 dGpNYHoQrt3+iknYo7HeWui9EKpNIza/TEb0MWAi1DURHb8xZaJUUAJEcEG07GJV6pE/
 BN3fjRhg5eghaHOHkkGu4EZeYbcyvVQJ3pP6Fvkxr5BN72MBWnu1Iol3dfOoagRk5LyV
 czzsSCEl9ioDmcllTQsu9UiUG73ZNI+nhU8LTdIEqFZELNJPs/mIMo9ykpt6HzaMsnCe
 ppGJdkKSHoD/i4Sx3RKmkKaqPwruTYhcYZcyAu5jWU6jh2XO6mtNX1U0b/+PjsmZSLtf
 vCMw==
X-Gm-Message-State: AOJu0YzTwBNp/JbWUlauNx76CzTfj63JGUlIOmcSbWYlKgAxQN+4vIas
 fyotLaosaL/kHIZaywNE2PyLWAkHIzBS5K9fJA==
X-Google-Smtp-Source: AGHT+IFZen1iqDzFOOtrS1FJ3xpxQBaOHPO073Jp0lQAOyUF53fYpT9RjFB9mOvm7AmbRG1CjowhqVQUNAxlAUzmOA==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:35de:fff:97b7:db3e])
 (user=almasrymina job=sendgmr) by 2002:a25:7909:0:b0:da3:ab41:304a with SMTP
 id u9-20020a257909000000b00da3ab41304amr308351ybc.4.1699238669418; Sun, 05
 Nov 2023 18:44:29 -0800 (PST)
Date: Sun,  5 Nov 2023 18:44:04 -0800
In-Reply-To: <20231106024413.2801438-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
Message-ID: <20231106024413.2801438-6-almasrymina@google.com>
Subject: [RFC PATCH v3 05/12] netdev: netdevice devmem allocator
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
 include/linux/netdevice.h       | 13 ++++++++++++
 include/net/page_pool/helpers.h | 28 +++++++++++++++++++++++++
 net/core/dev.c                  | 37 +++++++++++++++++++++++++++++++++
 3 files changed, 78 insertions(+)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index eeeda849115c..1c351c138a5b 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -843,6 +843,9 @@ struct netdev_dmabuf_binding {
 };
 
 #ifdef CONFIG_DMA_SHARED_BUFFER
+struct page_pool_iov *
+netdev_alloc_devmem(struct netdev_dmabuf_binding *binding);
+void netdev_free_devmem(struct page_pool_iov *ppiov);
 void __netdev_devmem_binding_free(struct netdev_dmabuf_binding *binding);
 int netdev_bind_dmabuf(struct net_device *dev, unsigned int dmabuf_fd,
 		       struct netdev_dmabuf_binding **out);
@@ -850,6 +853,16 @@ void netdev_unbind_dmabuf(struct netdev_dmabuf_binding *binding);
 int netdev_bind_dmabuf_to_queue(struct net_device *dev, u32 rxq_idx,
 				struct netdev_dmabuf_binding *binding);
 #else
+static inline struct page_pool_iov *
+netdev_alloc_devmem(struct netdev_dmabuf_binding *binding)
+{
+	return NULL;
+}
+
+static inline void netdev_free_devmem(struct page_pool_iov *ppiov)
+{
+}
+
 static inline void
 __netdev_devmem_binding_free(struct netdev_dmabuf_binding *binding)
 {
diff --git a/include/net/page_pool/helpers.h b/include/net/page_pool/helpers.h
index 4ebd544ae977..78cbb040af94 100644
--- a/include/net/page_pool/helpers.h
+++ b/include/net/page_pool/helpers.h
@@ -83,6 +83,34 @@ static inline u64 *page_pool_ethtool_stats_get(u64 *data, void *stats)
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
index c8c3709d42c8..2315bbc03ec8 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -156,6 +156,7 @@
 #include <linux/genalloc.h>
 #include <linux/dma-buf.h>
 #include <net/page_pool/types.h>
+#include <net/page_pool/helpers.h>
 
 #include "dev.h"
 #include "net-sysfs.h"
@@ -2077,6 +2078,42 @@ void __netdev_devmem_binding_free(struct netdev_dmabuf_binding *binding)
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
 void netdev_unbind_dmabuf(struct netdev_dmabuf_binding *binding)
 {
 	struct netdev_rx_queue *rxq;
-- 
2.42.0.869.gea05f2083d-goog

