Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B7D8097C9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 01:53:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56AF10E9B4;
	Fri,  8 Dec 2023 00:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1C910E9B6
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 00:53:18 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-5d3a1e5f8d6so18285357b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 16:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1701996797; x=1702601597;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ffR5lRGBwRWz92voabMKfnUxOBX9ei9jc/R/TuPbdfY=;
 b=U9WIvkCyre7Z/FNUDCLez48QG/S5UaQUJvlrt4EDw5nR06eedytnLkKEco/JA1KowC
 bl5bbWg6m3lGWaidhxaudSSdVHSdZOyv5KFJRCrjU3VGY9FyiyGfan0GJYlKi5/tOBjI
 sbJWZNwanN0f8tqsv07BjHao9a2Cjd0NLOxTB5wA2Gu5yweBaahfEf47A/AOsFrP5iSf
 844UYJqtNADF/meS9msVrOx6UrFHWi+echc0EYaB2hu2HY6UFi1EauS3nfco3E4zO9bJ
 HlPS9o1Ai9v9Wx90ahDEwG31gCPfhj+FVuUMPkI9ByMBIbAFphDs/ha8/7tMJ/HyYDsR
 Kfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701996797; x=1702601597;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ffR5lRGBwRWz92voabMKfnUxOBX9ei9jc/R/TuPbdfY=;
 b=anCses00+rnlLKJBY0UzYPCAhHgz3NjuyIqaJl/MvZnPOdnPehUkJX4QfmC8pWhwZm
 rvjhMM8iWyZsRhsrFakgcBihRNb+oVwSaqAx/LL9PLv+PRCJyUh76FanvoorNHm+L324
 0B1ZYfRunEhh9JfTNTeTcXk/+bInnpOVmLtYq2N2GPStlWnr+3dTMyyy9uncae4wyeuY
 qeelFV/tZ86XpPQSMieh2peBV+cRb0w31S6yTQicbW///N/50qHL3SPhsVgtDcWmgi86
 LvgKESb5AGt066Ao/DONdj1rPAbiYPTBujEBnU8lKNTgCrSDHm5EcPXiDeZ/at3JUT9Y
 ocrw==
X-Gm-Message-State: AOJu0YzRDTA7+SGp94TtQbjXUTBgKx/fh8ts5BbWOxP6FkthNpfpOZMl
 fFF29l2rTNXgGQI9s9ol0dSuKkkWWvYCweZvEA==
X-Google-Smtp-Source: AGHT+IH8QZVgyP79RbEsqH0j0RL1Mpin9iL/UFr2+o7Otvdv7pJ6u3sBW0Y9+P6SJHsoq2x+yqVIWLpUXWuYkWSTkw==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:f1cf:c733:235b:9fff])
 (user=almasrymina job=sendgmr) by 2002:a25:ccd5:0:b0:daf:6333:17c3 with SMTP
 id l204-20020a25ccd5000000b00daf633317c3mr42079ybf.1.1701996797568; Thu, 07
 Dec 2023 16:53:17 -0800 (PST)
Date: Thu,  7 Dec 2023 16:52:42 -0800
In-Reply-To: <20231208005250.2910004-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20231208005250.2910004-1-almasrymina@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231208005250.2910004-12-almasrymina@google.com>
Subject: [net-next v1 11/16] net: support non paged skb frags
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

Make skb_frag_page() fail in the case where the frag is not backed
by a page, and fix its relevant callers to handle this case.

Correctly handle skb_frag refcounting in the page_pool_iovs case.

Signed-off-by: Mina Almasry <almasrymina@google.com>


---

Changes in v1:
- Fix illegal_highdma() (Yunsheng).
- Rework napi_pp_put_page() slightly to reduce code churn (Willem).

---
 include/linux/skbuff.h | 42 +++++++++++++++++++++++++++++++++++-------
 net/core/dev.c         |  3 ++-
 net/core/gro.c         |  2 +-
 net/core/skbuff.c      |  3 +++
 net/ipv4/tcp.c         |  3 +++
 5 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index b370eb8d70f7..851f448d2181 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -37,6 +37,8 @@
 #endif
 #include <net/net_debug.h>
 #include <net/dropreason-core.h>
+#include <net/page_pool/types.h>
+#include <net/page_pool/helpers.h>
 
 /**
  * DOC: skb checksums
@@ -3414,15 +3416,38 @@ static inline void skb_frag_off_copy(skb_frag_t *fragto,
 	fragto->bv_offset = fragfrom->bv_offset;
 }
 
+/* Returns true if the skb_frag contains a page_pool_iov. */
+static inline bool skb_frag_is_page_pool_iov(const skb_frag_t *frag)
+{
+	return page_is_page_pool_iov(frag->bv_page);
+}
+
 /**
  * skb_frag_page - retrieve the page referred to by a paged fragment
  * @frag: the paged fragment
  *
- * Returns the &struct page associated with @frag.
+ * Returns the &struct page associated with @frag. Returns NULL if this frag
+ * has no associated page.
  */
 static inline struct page *skb_frag_page(const skb_frag_t *frag)
 {
-	return frag->bv_page;
+	if (!page_is_page_pool_iov(frag->bv_page))
+		return frag->bv_page;
+
+	return NULL;
+}
+
+/**
+ * skb_frag_page_pool_iov - retrieve the page_pool_iov referred to by fragment
+ * @frag: the fragment
+ *
+ * Returns the &struct page_pool_iov associated with @frag. Returns NULL if this
+ * frag has no associated page_pool_iov.
+ */
+static inline struct page_pool_iov *
+skb_frag_page_pool_iov(const skb_frag_t *frag)
+{
+	return page_to_page_pool_iov(frag->bv_page);
 }
 
 /**
@@ -3433,7 +3458,7 @@ static inline struct page *skb_frag_page(const skb_frag_t *frag)
  */
 static inline void __skb_frag_ref(skb_frag_t *frag)
 {
-	get_page(skb_frag_page(frag));
+	page_pool_page_get_many(frag->bv_page, 1);
 }
 
 /**
@@ -3453,13 +3478,13 @@ bool napi_pp_put_page(struct page *page, bool napi_safe);
 static inline void
 napi_frag_unref(skb_frag_t *frag, bool recycle, bool napi_safe)
 {
-	struct page *page = skb_frag_page(frag);
-
 #ifdef CONFIG_PAGE_POOL
-	if (recycle && napi_pp_put_page(page, napi_safe))
+	if (recycle && napi_pp_put_page(frag->bv_page, napi_safe))
 		return;
+	page_pool_page_put_many(frag->bv_page, 1);
+#else
+	put_page(skb_frag_page(frag));
 #endif
-	put_page(page);
 }
 
 /**
@@ -3499,6 +3524,9 @@ static inline void skb_frag_unref(struct sk_buff *skb, int f)
  */
 static inline void *skb_frag_address(const skb_frag_t *frag)
 {
+	if (!skb_frag_page(frag))
+		return NULL;
+
 	return page_address(skb_frag_page(frag)) + skb_frag_off(frag);
 }
 
diff --git a/net/core/dev.c b/net/core/dev.c
index 30667e4c3b95..1ae9257df441 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -3709,8 +3709,9 @@ static int illegal_highdma(struct net_device *dev, struct sk_buff *skb)
 	if (!(dev->features & NETIF_F_HIGHDMA)) {
 		for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
 			skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
+			struct page *page = skb_frag_page(frag);
 
-			if (PageHighMem(skb_frag_page(frag)))
+			if (page && PageHighMem(page))
 				return 1;
 		}
 	}
diff --git a/net/core/gro.c b/net/core/gro.c
index 0759277dc14e..42d7f6755f32 100644
--- a/net/core/gro.c
+++ b/net/core/gro.c
@@ -376,7 +376,7 @@ static inline void skb_gro_reset_offset(struct sk_buff *skb, u32 nhoff)
 	NAPI_GRO_CB(skb)->frag0 = NULL;
 	NAPI_GRO_CB(skb)->frag0_len = 0;
 
-	if (!skb_headlen(skb) && pinfo->nr_frags &&
+	if (!skb_headlen(skb) && pinfo->nr_frags && skb_frag_page(frag0) &&
 	    !PageHighMem(skb_frag_page(frag0)) &&
 	    (!NET_IP_ALIGN || !((skb_frag_off(frag0) + nhoff) & 3))) {
 		NAPI_GRO_CB(skb)->frag0 = skb_frag_address(frag0);
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 07f802f1adf1..2ce64f57a0f6 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -2999,6 +2999,9 @@ static bool __skb_splice_bits(struct sk_buff *skb, struct pipe_inode_info *pipe,
 	for (seg = 0; seg < skb_shinfo(skb)->nr_frags; seg++) {
 		const skb_frag_t *f = &skb_shinfo(skb)->frags[seg];
 
+		if (WARN_ON_ONCE(!skb_frag_page(f)))
+			return false;
+
 		if (__splice_segment(skb_frag_page(f),
 				     skb_frag_off(f), skb_frag_size(f),
 				     offset, len, spd, false, sk, pipe))
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 70a1bafbefba..e22681c4bfac 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -2157,6 +2157,9 @@ static int tcp_zerocopy_receive(struct sock *sk,
 			break;
 		}
 		page = skb_frag_page(frags);
+		if (WARN_ON_ONCE(!page))
+			break;
+
 		prefetchw(page);
 		pages[pages_to_map++] = page;
 		length += PAGE_SIZE;
-- 
2.43.0.472.g3155946c3a-goog

