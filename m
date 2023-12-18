Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C27817BA0
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 21:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA2410E2BA;
	Mon, 18 Dec 2023 20:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com
 [209.85.215.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D710F10E2BA
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 20:14:30 +0000 (UTC)
Received: by mail-pg1-f201.google.com with SMTP id
 41be03b00d2f7-5c1af03481bso1437605a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 12:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702930470; x=1703535270;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=e7ZiIb8MLUHR5WE0ilENIpcZDtQSwPuT0/gwz/yRXbY=;
 b=qZpFMTv+52WFSIFbzid4KTMMcKaInjE/SuvzSG9AmHQPFyEy2gXAMZAWaGUbVTrBjN
 U3sbRQtiRehdFT1mgrFg2MklR4sK5F53Vm3L5IOzGa1gi6rlaoSh0YRcmWo7vBLPt0Qx
 92O5BThUxrrdqTTHMYJGhGVxHlcqFHv5xpe4USSiALEfD9RI+o7nqSfpMRm5gyDWskxq
 6R9An8Gv0nM4MxtZHpGvUml4KQk699fw2ngOIloIev+TfWavd2DkxIrUj2Jyh2qF7nXY
 5Dk9a2y2pkX0y+Bt0VcB+4UJN/2C7E8EGRB30OpeFgNWts/H3G+e64iwNQugyvruITXi
 fi7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702930470; x=1703535270;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e7ZiIb8MLUHR5WE0ilENIpcZDtQSwPuT0/gwz/yRXbY=;
 b=MiHREBA1yrRhL4Z5HpLNJfY226SZXmTunvFti5skJHbEBck/f53Y+17XdW6rI/NreR
 ppFGULKEaWWFdT7fpCnmC4IhAe/CS0z4FY+zH0BmGsUEEcWUDpwhcS/i5saQuXhOdphm
 vrf/pkhN0W/6+ozNFlPWEWl4x6phseNq13dP9yIzno6E5AGu6R6rlySw47XwAojVigt/
 OUGrld6b2xKc8f0D67pNMrlm9NO339jF+cdGGgYsAuzKhsdr4L/FBca2ArePrVGRj1rp
 bHqr4SepvFGnbp3OAGKeNEIPF1Mgw/2y/wKTOiGPnissF/MLdv0/OiXkS+76ygiX7LZ3
 Orfw==
X-Gm-Message-State: AOJu0YwTZUGuP5uYA1AxNKiocpr0PTpmxFOP9DONxdZsORi+/tq7Pilp
 cauON3FeHXOfstF/vZqLeO/iQn6XgxRYKnqk8Q==
X-Google-Smtp-Source: AGHT+IGYt6iqPG2FjUKXUN8ySlIMViPuOzAnT09JcLEECZ7CdlQnRc1ni84YQQ9aTrK9dTaYGwfeTFP3mUL+lGAiEw==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:5cbf:3534:fb34:758e])
 (user=almasrymina job=sendgmr) by 2002:a25:83c1:0:b0:dbc:ff55:6067 with SMTP
 id v1-20020a2583c1000000b00dbcff556067mr1368244ybm.0.1702867248313; Sun, 17
 Dec 2023 18:40:48 -0800 (PST)
Date: Sun, 17 Dec 2023 18:40:16 -0800
In-Reply-To: <20231218024024.3516870-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20231218024024.3516870-1-almasrymina@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231218024024.3516870-10-almasrymina@google.com>
Subject: [RFC PATCH net-next v5 09/14] net: support non paged skb frags
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
Cc: Pavel Begunkov <asml.silence@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>,
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
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, David Wei <dw@davidwei.uk>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Yunsheng Lin <linyunsheng@huawei.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Shakeel Butt <shakeelb@google.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make skb_frag_page() fail in the case where the frag is not backed
by a page, and fix its relevant callers to handle this case.

Signed-off-by: Mina Almasry <almasrymina@google.com>


---

Changes in v1:
- Fix illegal_highdma() (Yunsheng).
- Rework napi_pp_put_page() slightly to reduce code churn (Willem).

(cherry picked from commit e11c8035ed635e22aab224a89c48d93b5e881278)

also squashed assorted fixes
---
 include/linux/skbuff.h | 47 +++++++++++++++++++++++++++++++++++++-----
 net/core/dev.c         |  3 ++-
 net/core/gro.c         |  2 +-
 net/core/skbuff.c      | 11 ++++++++++
 net/ipv4/tcp.c         |  3 +++
 5 files changed, 59 insertions(+), 7 deletions(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 1189d8d22da8..890fc2b94fc7 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -3452,17 +3452,53 @@ static inline void skb_frag_off_copy(skb_frag_t *fragto,
 	fragto->bv_offset = fragfrom->bv_offset;
 }
 
+/* Returns true if the skb_frag contains a net_iov. */
+static inline bool skb_frag_is_net_iov(const skb_frag_t *frag)
+{
+	return netmem_is_net_iov(frag->bv_page);
+}
+
+/**
+ * skb_frag_net_iov - retrieve the net_iov referred to by fragment
+ * @frag: the fragment
+ *
+ * Returns the &struct net_iov associated with @frag. Returns NULL if this
+ * frag has no associated net_iov.
+ */
+static inline struct net_iov *skb_frag_net_iov(const skb_frag_t *frag)
+{
+	if (!skb_frag_is_net_iov(frag))
+		return NULL;
+
+	return netmem_to_net_iov(frag->bv_page);
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
+	if (skb_frag_is_net_iov(frag))
+		return NULL;
+
 	return netmem_to_page(frag->bv_page);
 }
 
+/**
+ * skb_frag_netmem - retrieve the netmem referred to by a fragment
+ * @frag: the fragment
+ *
+ * Returns the &struct netmem associated with @frag.
+ */
+static inline struct netmem *skb_frag_netmem(const skb_frag_t *frag)
+{
+	return frag->bv_page;
+}
+
 /**
  * __skb_frag_ref - take an addition reference on a paged fragment.
  * @frag: the paged fragment
@@ -3491,13 +3527,11 @@ bool napi_pp_put_page(struct netmem *netmem, bool napi_safe);
 static inline void
 napi_frag_unref(skb_frag_t *frag, bool recycle, bool napi_safe)
 {
-	struct page *page = skb_frag_page(frag);
-
 #ifdef CONFIG_PAGE_POOL
-	if (recycle && napi_pp_put_page(page_to_netmem(page), napi_safe))
+	if (recycle && napi_pp_put_page(skb_frag_netmem(frag), napi_safe))
 		return;
 #endif
-	put_page(page);
+	put_page(skb_frag_page(frag));
 }
 
 /**
@@ -3537,6 +3571,9 @@ static inline void skb_frag_unref(struct sk_buff *skb, int f)
  */
 static inline void *skb_frag_address(const skb_frag_t *frag)
 {
+	if (!skb_frag_page(frag))
+		return NULL;
+
 	return page_address(skb_frag_page(frag)) + skb_frag_off(frag);
 }
 
diff --git a/net/core/dev.c b/net/core/dev.c
index 20ba528ef426..ad616b3c8e35 100644
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
index 96f85543f1dc..671775bad5f9 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -1239,6 +1239,14 @@ void skb_dump(const char *level, const struct sk_buff *skb, bool full_pkt)
 		struct page *p;
 		u8 *vaddr;
 
+		if (skb_frag_is_net_iov(frag)) {
+			printk("%sskb frag %d: not readable\n", level, i);
+			len -= frag->bv_len;
+			if (!len)
+				break;
+			continue;
+		}
+
 		skb_frag_foreach_page(frag, skb_frag_off(frag),
 				      skb_frag_size(frag), p, p_off, p_len,
 				      copied) {
@@ -3004,6 +3012,9 @@ static bool __skb_splice_bits(struct sk_buff *skb, struct pipe_inode_info *pipe,
 	for (seg = 0; seg < skb_shinfo(skb)->nr_frags; seg++) {
 		const skb_frag_t *f = &skb_shinfo(skb)->frags[seg];
 
+		if (WARN_ON_ONCE(!skb_frag_page(f)))
+			return false;
+
 		if (__splice_segment(skb_frag_page(f),
 				     skb_frag_off(f), skb_frag_size(f),
 				     offset, len, spd, false, sk, pipe))
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 1d6b80145efb..82485af12cdc 100644
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

