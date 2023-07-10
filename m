Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 271BE74E142
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 00:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0109110E2E2;
	Mon, 10 Jul 2023 22:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB6E10E2E2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 22:33:53 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-57003dac4a8so87446727b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 15:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1689028432; x=1691620432;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ZtAFtzT26HwoXDlgQMNRwGQzav+ArXt3GcR/tyBO9gA=;
 b=HkBlwsebRlph1pf39ww19ir3TXRKAaMo7qsHRnHvMwd7eaBtsd+aEsyn2PFrjYVPN/
 Q1m2zbfqNxMH7b2QmwqEmx7Hw8+0VDdPsjPbv5ClyeuSbRANbqwhxJwBlxKfNPSzGspo
 7yQorKtO9RR3lY8Caocl1cEReHVAh3gKZjRNe8K/5mwfYof1P1cHyHw8LwIbAtpadOQi
 xt/cqEvGCmmTBBOu377T/OItahks2lVVcdnKMKB3565gPdYG/TvH20z3G9f0jRiObQC7
 /Ikbp8b7IOidW9ZdGHVTIfQ7XQf/3jcuOVmetsVhHpuKf5wo9wt+kW67ruZRHH/8+c9U
 xfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689028432; x=1691620432;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZtAFtzT26HwoXDlgQMNRwGQzav+ArXt3GcR/tyBO9gA=;
 b=LEMua2jgp2xjH5J+St5GOniA29ckSdnMk2tC6iTBAkfAi02H/w40EWaLq8swThtyOJ
 K+sdnz1TBYu3Pt+6vMRxmjNH2D6jlr8jG7vV4c7wXju4CuzVmJVYVJ0nUSXLiqEiTUxn
 1DRNKuT4iKV24ez6ClWXkohmuFcu9QEFd5IigaGrmhGP49Nnab/stKNXnp1FNZSOVuQ1
 qJA0tb7RojZo+CaVnofLIEAulkd4hmTIRO7G4v4iJB5CTtlKlR4Gah9g9Hn9BXndDiSU
 DzqmUe4VNap4y9ysirsYKUD5S6qy2FOQi7kX/YThqV76o2m/G33r18jAjXasC7GFn641
 kg/g==
X-Gm-Message-State: ABy/qLYGflD9Ueq1mzNPzxn6AMXW7ygyl2OZJeA98LQgFYKPK6B3Sk3F
 SkoZtveVZNzxchtn6Ve6fCzCWN2VsMQULYG55w==
X-Google-Smtp-Source: APBJJlHZU5kmoFW1exgCNXZVHrLAP9FADaXQZjpO/QBcTqC0+9vh1t2Y55mCZ3uaTrm2ya/0CivoRDUtK7ota9l6xA==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:4c0f:bfb6:9942:8c53])
 (user=almasrymina job=sendgmr) by 2002:a81:7e0c:0:b0:56c:e9fe:3cb4 with SMTP
 id o12-20020a817e0c000000b0056ce9fe3cb4mr204351ywn.1.1689028432231; Mon, 10
 Jul 2023 15:33:52 -0700 (PDT)
Date: Mon, 10 Jul 2023 15:32:54 -0700
In-Reply-To: <20230710223304.1174642-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20230710223304.1174642-1-almasrymina@google.com>
X-Mailer: git-send-email 2.41.0.390.g38632f3daf-goog
Message-ID: <20230710223304.1174642-4-almasrymina@google.com>
Subject: [RFC PATCH 03/10] dma-buf: add support for NET_TX pages
From: Mina Almasry <almasrymina@google.com>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 netdev@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
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
 Sumit Semwal <sumit.semwal@linaro.org>, jgg@ziepe.ca,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Used the paged attachment mappings support to create NET_TX pages.
NET_TX pages can be used in the networking transmit path:

1. Create an iov_iter & bio_vec entries to represent this dmabuf.

2. Initialize the bio_vec with the backing dmabuf pages.

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 drivers/dma-buf/dma-buf.c    | 47 ++++++++++++++++++++++++++++++++++++
 include/linux/dma-buf.h      |  7 ++++++
 include/uapi/linux/dma-buf.h |  1 +
 3 files changed, 55 insertions(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index acb86bf406f4..3ca71297b9b4 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1683,6 +1683,7 @@ static void dma_buf_pages_destroy(struct percpu_ref *ref)
 }
 
 const struct dma_buf_pages_type_ops net_rx_ops;
+const struct dma_buf_pages_type_ops net_tx_ops;
 
 static long dma_buf_create_pages(struct file *file,
 				 struct dma_buf_create_pages_info *create_info)
@@ -1799,6 +1800,9 @@ static long dma_buf_create_pages(struct file *file,
 	case DMA_BUF_PAGES_NET_RX:
 		priv->type_ops = &net_rx_ops;
 		break;
+	case DMA_BUF_PAGES_NET_TX:
+		priv->type_ops = &net_tx_ops;
+		break;
 	default:
 		err = -EINVAL;
 		goto out_put_new_file;
@@ -2140,3 +2144,46 @@ struct page *dma_buf_pages_net_rx_alloc(struct dma_buf_pages *priv)
 	percpu_ref_get(&priv->pgmap.ref);
 	return pg;
 }
+
+/********************************
+ *	dma_buf_pages_net_tx	*
+ ********************************/
+
+static void dma_buf_pages_net_tx_release(struct dma_buf_pages *priv,
+					 struct file *file)
+{
+	int i;
+	for (i = 0; i < priv->num_pages; i++)
+		put_page(&priv->pages[i]);
+}
+
+static int dma_buf_pages_net_tx_init(struct dma_buf_pages *priv,
+				     struct file *file)
+{
+	int i;
+	priv->net_tx.tx_bv = kvmalloc_array(priv->num_pages,
+					    sizeof(struct bio_vec), GFP_KERNEL);
+	if (!priv->net_tx.tx_bv)
+		return -ENOMEM;
+
+	for (i = 0; i < priv->num_pages; i++) {
+		priv->net_tx.tx_bv[i].bv_page = &priv->pages[i];
+		priv->net_tx.tx_bv[i].bv_offset = 0;
+		priv->net_tx.tx_bv[i].bv_len = PAGE_SIZE;
+	}
+	percpu_ref_get_many(&priv->pgmap.ref, priv->num_pages);
+	iov_iter_bvec(&priv->net_tx.iter, WRITE, priv->net_tx.tx_bv,
+		      priv->num_pages, priv->dmabuf->size);
+	return 0;
+}
+
+static void dma_buf_pages_net_tx_free(struct dma_buf_pages *priv)
+{
+	kvfree(priv->net_tx.tx_bv);
+}
+
+const struct dma_buf_pages_type_ops net_tx_ops = {
+	.dma_buf_pages_init		= dma_buf_pages_net_tx_init,
+	.dma_buf_pages_release		= dma_buf_pages_net_tx_release,
+	.dma_buf_pages_destroy		= dma_buf_pages_net_tx_free,
+};
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index e8e66d6407d0..93228a2fec47 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -22,6 +22,7 @@
 #include <linux/fs.h>
 #include <linux/dma-fence.h>
 #include <linux/wait.h>
+#include <linux/uio.h>
 #include <linux/genalloc.h>
 #include <linux/xarray.h>
 #include <net/page_pool.h>
@@ -555,6 +556,11 @@ struct dma_buf_pages_type_ops {
 				  struct page *page);
 };
 
+struct dma_buf_pages_net_tx {
+	struct iov_iter iter;
+	struct bio_vec *tx_bv;
+};
+
 struct dma_buf_pages_net_rx {
 	struct gen_pool *page_pool;
 	struct xarray bound_rxq_list;
@@ -579,6 +585,7 @@ struct dma_buf_pages {
 
 	union {
 		struct dma_buf_pages_net_rx net_rx;
+		struct dma_buf_pages_net_tx net_tx;
 	};
 };
 
diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
index b392cef9d3c6..546f211a7556 100644
--- a/include/uapi/linux/dma-buf.h
+++ b/include/uapi/linux/dma-buf.h
@@ -187,6 +187,7 @@ struct dma_buf_create_pages_info {
 };
 
 #define DMA_BUF_PAGES_NET_RX		(1 << 0)
+#define DMA_BUF_PAGES_NET_TX		(2 << 0)
 
 #define DMA_BUF_CREATE_PAGES	_IOW(DMA_BUF_BASE, 4, struct dma_buf_create_pages_info)
 
-- 
2.41.0.390.g38632f3daf-goog

