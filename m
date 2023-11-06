Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAAB7E18B4
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 03:44:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4525410E252;
	Mon,  6 Nov 2023 02:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4660B10E0B5
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 02:44:21 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5a9012ab0adso56422377b3.1
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Nov 2023 18:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699238660; x=1699843460;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=BYi74RniIHsB6Wn3ca/EzKecGeVK7nuy82fMJ6xIaLE=;
 b=060GSR9lzXS7N+0sQ0V5fQsHAhVd3LYgQKAbg5Sdax2gJy1wP6DFkhgYOktPvnC4v5
 HMuqLT6VqwVzJX29hoZtUAzeVTdGqiFs/AiN6pmzzGk2JD0thkIbkxcx1Oc1dN2BzEdb
 OFQmdby6XdndrArDa201ux39gMM43NK7OoGBzNvWqEFQ2HP/Xm7TgSp3UDqPqhk6ouIe
 jNwOxcKegdl6/hkx7xJR/6t65c6fdL4xfzPqXN5aG+8Eqso8qfCtwSMuNuc4FaqkuOCD
 qsdRUoVAHdispgjKqkK4EgPZ55jBJS4icLkst6GNI0f12p/i6E+aUoOhkgaZLd9RDpiR
 umNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699238660; x=1699843460;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BYi74RniIHsB6Wn3ca/EzKecGeVK7nuy82fMJ6xIaLE=;
 b=LpNts8FbX3j/K+0NSxgrH6xcLapoxpQpRCSVkcebe3XSTS6JxygWMQVoTbmPGFtSgA
 bH6RB2Qi+7bsrJE4rW1vwouhiSENoTnYfV39yGFpRewYhStTGHEzI2iqZ1bpFSmw0CO5
 2/AQ5ERbRXWKKlYUXoPNji7VOk7bE1l+zGW503DcmLLCifOKvxzQxrZJeHdiIbS0ThCh
 8ZuAlVuethK29SI4KgSPyiwTIdekNO18EuXvTulC9geBgB/oGt0sm5oO7rTZoHQiBLK9
 fgzcZvZE8fdDVO3m8WZgb/n094fsU8co10OnUT2Tgq4MG+hTIJBEqOmCfECaDIl9tyeg
 cPag==
X-Gm-Message-State: AOJu0Ywl3/FeH3SSHk4+/rMZRV8yRgAbVbKdHShoWwCJLu7cc2Tf/bSQ
 0zSHWjQqUncAewILAvi9ii6jgl5KSlvwzRtOfA==
X-Google-Smtp-Source: AGHT+IE9YqB9SYLUxgQ5eT9abp+8TWDhj3Fso2Go2CEiYjAa/XP+wuQiIsvJrogX9aN67VSXhqeSBYMoIbWBDLOY2A==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:35de:fff:97b7:db3e])
 (user=almasrymina job=sendgmr) by 2002:a25:ac04:0:b0:d9a:520f:1988 with SMTP
 id w4-20020a25ac04000000b00d9a520f1988mr525338ybi.4.1699238660358; Sun, 05
 Nov 2023 18:44:20 -0800 (PST)
Date: Sun,  5 Nov 2023 18:44:00 -0800
In-Reply-To: <20231106024413.2801438-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
Message-ID: <20231106024413.2801438-2-almasrymina@google.com>
Subject: [RFC PATCH v3 01/12] net: page_pool: factor out releasing DMA from
 releasing the page
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
 Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>,
 Shakeel Butt <shakeelb@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jakub Kicinski <kuba@kernel.org>

Releasing the DMA mapping will be useful for other types
of pages, so factor it out. Make sure compiler inlines it,
to avoid any regressions.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Mina Almasry <almasrymina@google.com>

---

This is implemented by Jakub in his RFC:

https://lore.kernel.org/netdev/f8270765-a27b-6ccf-33ea-cda097168d79@redhat.com/T/

I take no credit for the idea or implementation. This is a critical
dependency of device memory TCP and thus I'm pulling it into this series
to make it revewable and mergable.

---
 net/core/page_pool.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index 5e409b98aba0..578b6f2eeb46 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -514,21 +514,16 @@ static s32 page_pool_inflight(struct page_pool *pool)
 	return inflight;
 }
 
-/* Disconnects a page (from a page_pool).  API users can have a need
- * to disconnect a page (from a page_pool), to allow it to be used as
- * a regular page (that will eventually be returned to the normal
- * page-allocator via put_page).
- */
-static void page_pool_return_page(struct page_pool *pool, struct page *page)
+static __always_inline
+void __page_pool_release_page_dma(struct page_pool *pool, struct page *page)
 {
 	dma_addr_t dma;
-	int count;
 
 	if (!(pool->p.flags & PP_FLAG_DMA_MAP))
 		/* Always account for inflight pages, even if we didn't
 		 * map them
 		 */
-		goto skip_dma_unmap;
+		return;
 
 	dma = page_pool_get_dma_addr(page);
 
@@ -537,7 +532,19 @@ static void page_pool_return_page(struct page_pool *pool, struct page *page)
 			     PAGE_SIZE << pool->p.order, pool->p.dma_dir,
 			     DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_WEAK_ORDERING);
 	page_pool_set_dma_addr(page, 0);
-skip_dma_unmap:
+}
+
+/* Disconnects a page (from a page_pool).  API users can have a need
+ * to disconnect a page (from a page_pool), to allow it to be used as
+ * a regular page (that will eventually be returned to the normal
+ * page-allocator via put_page).
+ */
+void page_pool_return_page(struct page_pool *pool, struct page *page)
+{
+	int count;
+
+	__page_pool_release_page_dma(pool, page);
+
 	page_pool_clear_pp_info(page);
 
 	/* This may be the last page returned, releasing the pool, so
-- 
2.42.0.869.gea05f2083d-goog

