Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C27776DB8
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 03:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2557A10E16A;
	Thu, 10 Aug 2023 01:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93B310E16A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 01:58:11 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-d637af9a981so296270276.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 18:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1691632691; x=1692237491;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=PF7UhYesGVhoeJAxt80bdAiasdVmkSyS3tHMUDi8SQw=;
 b=pYFgcIsw4RGjSJ6O/WDPYvQAw5gzuBsFuvmi3RCtRNsk292HSz6F6Rq0SBmGzE9+v4
 6x/jBSlOkk/J+Yh3t/KTzU3FjaGbJ1FFnGn4rCiMW1WOCebJU52pQfzMGVgw3dCLCtGh
 ibdISG2VQMfwETS3995hpQNOYOrj6xJozdLmzr81MayqFjb/03ruiIH3Glj9WZwG5EjN
 RQKnQQbvKQVhynHpODxT7SyW85JCXAEYDtyJ8SWBS0iWtFhq7fF90spF53UKp4OsuKxW
 lPcMHahFVO0cPAIAIcp3vK/wY25c3Sh6fLtdc5SiYM3yvZuHjR3wr5RO5McZK+W8FoXx
 NzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691632691; x=1692237491;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PF7UhYesGVhoeJAxt80bdAiasdVmkSyS3tHMUDi8SQw=;
 b=CcKNIBq/vAfrQ3zTSxUO2IUAa84VFUY35dYhImenN8sT1xnJ9sDq0TmeqYTW3bAct1
 1v8T3MjFz9pHFYzmjdfXbqztbwf8SYFmVZkosczQzhceokifnq95ZcrIrFsLCjLL+aI/
 JpF/Rg0m9YUNFvpAK2C8jF60afBP5G/OK3dVMdTorMOwD2z+Mz3Bq4mHDpYlGmsnyyo7
 olkrozPW0uEfEeEbTowXQz8fM1mfF+l7QKHAUBB0YNsun9ko6GsN+CZxdBhC5SoBXUBy
 TaXSVTnnjHaFah4pRuYqACXd1UxcA9J5sgkm3pXrdqZNAnQxnO27UU1QMCJt3K58ovk7
 TXvg==
X-Gm-Message-State: AOJu0YwGTIwM/0sV40OnD9wSjkNmcF/5aV4tMGP/YxcdaPJxbrJ1RAny
 Q2N9Pue4YA0gw/Fe0mBm5u1ZHcsDTUNTIg5Qhw==
X-Google-Smtp-Source: AGHT+IGkjMr8m1EAO46mSdbpgOuU+k68iX+xxQzg7fLvTju4OvFhxMgZfxumSDV1ACjEoW/UuxWxOjwMGm+YP0pA8A==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:73ad:9ed5:e067:2b9b])
 (user=almasrymina job=sendgmr) by 2002:a25:d8c2:0:b0:d43:78e8:f628 with SMTP
 id p185-20020a25d8c2000000b00d4378e8f628mr17793ybg.6.1691632691163; Wed, 09
 Aug 2023 18:58:11 -0700 (PDT)
Date: Wed,  9 Aug 2023 18:57:40 -0700
In-Reply-To: <20230810015751.3297321-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230810015751.3297321-5-almasrymina@google.com>
Subject: [RFC PATCH v2 04/11] memory-provider: updates to core provider API
 for devmem TCP
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

Implement a few updates to Jakub's RFC memory provider[1] API to make it
suitable for device memory TCP:

1. Currently for devmem TCP the driver's netdev_rx_queue holds a
reference to the netdev_dmabuf_binding struct and needs to pass that to
the page_pool's memory provider somehow. For PoC purposes, create a
pp->mp_priv field that is set by the driver. Likely needs a better API
(likely dependent on the general memory provider API).

2. The current memory_provider API gives the memory_provider the option
to override put_page(), but tries page_pool_clear_pp_info() after the
memory provider has released the page. IMO if the page freeing is
delegated to the provider then the page_pool should not modify the
page after release_page() has been called.

[1]: https://lore.kernel.org/netdev/20230707183935.997267-1-kuba@kernel.org/

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 include/net/page_pool.h | 1 +
 net/core/page_pool.c    | 7 ++++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/net/page_pool.h b/include/net/page_pool.h
index 13ae7f668c9e..e395f82e182b 100644
--- a/include/net/page_pool.h
+++ b/include/net/page_pool.h
@@ -78,6 +78,7 @@ struct page_pool_params {
 	struct device	*dev; /* device, for DMA pre-mapping purposes */
 	struct napi_struct *napi; /* Sole consumer of pages, otherwise NULL */
 	u8		memory_provider; /* haaacks! should be user-facing */
+	void		*mp_priv; /* argument to pass to the memory provider */
 	enum dma_data_direction dma_dir; /* DMA mapping direction */
 	unsigned int	max_len; /* max DMA sync memory size */
 	unsigned int	offset;  /* DMA addr offset */
diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index d50f6728e4f6..df3f431fcff3 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -241,6 +241,7 @@ static int page_pool_init(struct page_pool *pool,
 		goto free_ptr_ring;
 	}

+	pool->mp_priv = pool->p.mp_priv;
 	if (pool->mp_ops) {
 		err = pool->mp_ops->init(pool);
 		if (err) {
@@ -564,16 +565,16 @@ void page_pool_return_page(struct page_pool *pool, struct page *page)
 	else
 		__page_pool_release_page_dma(pool, page);

-	page_pool_clear_pp_info(page);
-
 	/* This may be the last page returned, releasing the pool, so
 	 * it is not safe to reference pool afterwards.
 	 */
 	count = atomic_inc_return_relaxed(&pool->pages_state_release_cnt);
 	trace_page_pool_state_release(pool, page, count);

-	if (put)
+	if (put) {
+		page_pool_clear_pp_info(page);
 		put_page(page);
+	}
 	/* An optimization would be to call __free_pages(page, pool->p.order)
 	 * knowing page is not part of page-cache (thus avoiding a
 	 * __page_cache_release() call).
--
2.41.0.640.ga95def55d0-goog
