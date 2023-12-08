Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DCF8097C6
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 01:53:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C4E10E9B9;
	Fri,  8 Dec 2023 00:53:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9965F10E247
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 00:53:16 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-5d33b70fce8so17788837b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 16:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1701996795; x=1702601595;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=lPnDX1rYMAtCe+hQ8qdPonfWEnFnkE5EPZQcdSbkY2c=;
 b=mJdZQZ1sMuPggtdABjG98dgbaUUUMt21cokmg7RuyVG+g7y0dd2G0U52mEZG77q/Hp
 ceyB5AqukuBbuKOoZLAfzKmLVbFrdM4t8KsHsgyZHjmaQwakwwfY31LmAqab+vpHGfLE
 GZbXobIJ3ToNR1gYkuAJcLzrI4fOy/HI0+wvvZ4AnppiR2nTdkaJI4QzInjxaYxdFWBB
 IhLjYLMZD1O9vD21RDmeMpH3NA6Tiz5WeYzY4kXFIM1cbfMs2tC7CpHAUBRvdQUKDc0T
 HjrFGqzZPZGjFds9gq8dQWovmcLsFSfr7cKOLblRiNmEZf6PV3484ev972l57JgZXfYt
 +Jog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701996795; x=1702601595;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lPnDX1rYMAtCe+hQ8qdPonfWEnFnkE5EPZQcdSbkY2c=;
 b=w32Gbr9H7D8n1d/O11KsDzcEzOp9OlPetNESJBQ6eEZwzt3e76GgCU6e1U1BSYGkwd
 skcIUwWxh8ufjZLDen2ZhercUncJNGJa7F5NdWDtgfuyzAziDBldFAeTjpk+yw2TDTzZ
 U1OLE/5+5mNt6zwL40ALu71aLVjtFqFxvKaJO4BdJWLrvzZcSMUwDUewl7brpFw7wPfC
 Cgw6JHVcRFL5ozhJs/0mesFshX/8f4jX5zVJcPjvAQBDJm4GKFR7RF1vXnMZYw8zO8oj
 lx2pyO/vKt7rWouk6lKMYid/uuyV9ELIC1jp/Ak2Nkz44MhYCkydrC3IuOGi9e+Ce4Tw
 a8EA==
X-Gm-Message-State: AOJu0YzuH9KiyyLPpWtwhqQyq2Rs0u/diQZpvJlKrS46cMOPodjePIS+
 nmYqwA7BvKz6QAPDUCPounozz5WwCS2eIclpHA==
X-Google-Smtp-Source: AGHT+IEKP0wg/owThAA3/mC6Vxrn1R6Pw24Bozp4eJkoXp2s6/m2Qgw2X1bYwO4di4FgizGGC3rWfu0KjgUDlNjaXA==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:f1cf:c733:235b:9fff])
 (user=almasrymina job=sendgmr) by 2002:a05:690c:4707:b0:5d4:ce2:e908 with
 SMTP id gz7-20020a05690c470700b005d40ce2e908mr53364ywb.3.1701996795620; Thu,
 07 Dec 2023 16:53:15 -0800 (PST)
Date: Thu,  7 Dec 2023 16:52:41 -0800
In-Reply-To: <20231208005250.2910004-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20231208005250.2910004-1-almasrymina@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231208005250.2910004-11-almasrymina@google.com>
Subject: [net-next v1 10/16] page_pool: don't release iov on elevanted refcount
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
 Jeroen de Borst <jeroendb@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Yunsheng Lin <linyunsheng@huawei.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Eric Dumazet <edumazet@google.com>, Shakeel Butt <shakeelb@google.com>,
 Harshitha Ramamurthy <hramamurthy@google.com>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the page_pool behavior is that a page is considered for
recycling only once, the first time __page_pool_put_page() is called on
it.

This works because in practice the net stack only holds 1 reference to
the skb frags. In that case, the page_pool recycling works as expected,
as the skb frags will have 1 reference on the pages from the net stack
when __page_pool_put_page() is called (if the driver is not holding
extra references for recycling), and so the page will be recycled.

However, this is not compatible with devmem TCP. For devmem TCP, the net
stack holds 2 references for each frag, 1 reference is part of the SKB,
and the second reference is for the user holding the frag until they
call SO_DEVMEM_DONTNEED. This causes a bug in the page_pool recycling
where, when the skb is freed, the reference count goes from 2->1, the
page_pool sees a pending reference, releases the page, and so no devmem
iovs get recycled.

To fix this, don't release iovs on elevated refcount.

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 net/core/page_pool.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index f0148d66371b..dc2a148f5b06 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -731,6 +731,29 @@ __page_pool_put_page(struct page_pool *pool, struct page *page,
 		/* Page found as candidate for recycling */
 		return page;
 	}
+
+	if (page_is_page_pool_iov(page)) {
+		/* With devmem TCP and ppiovs, we can't release pages if the
+		 * refcount is > 1. This is because the net stack holds
+		 * 2 references:
+		 *	- 1 for the skb, and
+		 *	- 1 for the user until they call SO_DEVMEM_DONTNEED.
+		 * Releasing pages for elevated refcounts completely disables
+		 * page_pool recycling. Instead, simply don't release pages and
+		 * the next call to napi_pp_put_page() via SO_DEVMEM_DONTNEED
+		 * will consider the page again for recycling. As a result,
+		 * devmem TCP incompatible with drivers doing refcnt based
+		 * recycling unless those drivers:
+		 *
+		 * - don't mark skb_mark_for_recycle()
+		 * - are sure to release the last reference with
+		 *   page_pool_put_full_page() to consider the page for
+		 *   page_pool recycling.
+		 */
+		page_pool_page_put_many(page, 1);
+		return NULL;
+	}
+
 	/* Fallback/non-XDP mode: API user have elevated refcnt.
 	 *
 	 * Many drivers split up the page into fragments, and some
-- 
2.43.0.472.g3155946c3a-goog

