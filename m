Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97548776DBF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 03:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8823310E15E;
	Thu, 10 Aug 2023 01:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C463F10E148
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 01:58:22 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5899825ae5aso6164787b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 18:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1691632702; x=1692237502;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Tx6ZfONqtotsLULugIdGrrRKzq2s4AhG+kEo1kI7Jo0=;
 b=phKzX3fEAWBvDiJNz7jia4iegX0d1RSB3/d3n7lqZQ045SsL1jD7xofLfLpv2O8FDg
 hjIttXMblZ6NGf3YqOkk0Sl162JcTr3CZe5dXZgHWf6Hu4F0KQF5b3kVD7JfXxfM4igr
 PAJjmFuDoBJ+Y1Efk/P2kUS5eiYtd9NUbG+qCxr+4Dmu/os1WQBqba8fjZB5B5i3JPwW
 MFDdDojNYxHBjieDu7cClM/S/kyIFTnkUmvIZTnHPaG0oEUFno81IW7DaFg7QEJvqCGL
 P+IztKwQ/0rsaulGbIuwT80VSPZ4as0TFja6TBtHys2OPVSaGntFstguHBC8Avqc7DgK
 rPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691632702; x=1692237502;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tx6ZfONqtotsLULugIdGrrRKzq2s4AhG+kEo1kI7Jo0=;
 b=RbhykT0CdOfO0KjoXNwkF/7MP6Sm980ECiCZKlVB8RKyIJjBtNqDwNPJ9R8cx6A7iQ
 TKoC7I3LH5piaLBNdreiNpOEQ5jYhGE3jadlMsHvzdq3FQl8ofuksQ+5Oc8PsMfbpuD8
 6p0jICw6CPUPm0Vr8O6uQHsg/o2uqzbK92hKJO+ICV6GGmeoiyOSucHZqtAPjtZSrPoz
 z4xl9TLSZhD4mNO0zXrTNE1Cp8sU3ZYY5Skz/jjO/PR+XH+rNoptXRGqmgTzHO5j1FpO
 tsOAHyeWQ2Yf7b/pV86gP/fgbghsUakReDzcmve4kemNNZV1qf+6nOeRkpzbVTxa8u4q
 83WQ==
X-Gm-Message-State: AOJu0YwbTL06DAuyGFVbi5iuzNPQpQnlM4Y0vsxzvRtQ99Tv5ybZmgNm
 JAe5yOq2u83h+L4oUdKGpgJw3ku7JGymzhlhCQ==
X-Google-Smtp-Source: AGHT+IEO6r0ZjyRATxOUR21AKoL40mJNLD83QAwhGNKvI6kYGWdPWzkV0rIfvOVQBM/LHDLM960r1yZ2i+9WiCWk2g==
X-Received: from almasrymina.svl.corp.google.com
 ([2620:15c:2c4:200:73ad:9ed5:e067:2b9b])
 (user=almasrymina job=sendgmr) by 2002:a81:b65d:0:b0:586:500a:37d6 with SMTP
 id h29-20020a81b65d000000b00586500a37d6mr16180ywk.2.1691632701950; Wed, 09
 Aug 2023 18:58:21 -0700 (PDT)
Date: Wed,  9 Aug 2023 18:57:44 -0700
In-Reply-To: <20230810015751.3297321-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230810015751.3297321-9-almasrymina@google.com>
Subject: [RFC PATCH v2 08/11] net: add support for skbs with unreadable frags
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

For device memory TCP, we expect the skb headers to be available in host
memory for access, and we expect the skb frags to be in device memory
and unaccessible to the host. We expect there to be no mixing and
matching of device memory frags (unaccessible) with host memory frags
(accessible) in the same skb.

Add a skb->devmem flag which indicates whether the frags in this skb
are device memory frags or not.

__skb_fill_page_desc() now checks frags added to skbs for page_pool_iovs,
and marks the skb as skb->devmem accordingly.

Add checks through the network stack to avoid accessing the frags of
devmem skbs and avoid coalescing devmem skbs with non devmem skbs.

Signed-off-by: Willem de Bruijn <willemb@google.com>
Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>

Signed-off-by: Mina Almasry <almasrymina@google.com>
---
 include/linux/skbuff.h | 14 +++++++-
 include/net/tcp.h      |  5 +--
 net/core/datagram.c    |  6 ++++
 net/core/skbuff.c      | 77 ++++++++++++++++++++++++++++++++++++------
 net/ipv4/tcp.c         |  6 ++++
 net/ipv4/tcp_input.c   | 13 +++++--
 net/ipv4/tcp_output.c  |  5 ++-
 net/packet/af_packet.c |  4 +--
 8 files changed, 111 insertions(+), 19 deletions(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 5520587050c4..88a3fc7f99b7 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -806,6 +806,8 @@ typedef unsigned char *sk_buff_data_t;
  *	@csum_level: indicates the number of consecutive checksums found in
  *		the packet minus one that have been verified as
  *		CHECKSUM_UNNECESSARY (max 3)
+ *	@devmem: indicates that all the fragments in this skb are backed by
+ *		device memory.
  *	@dst_pending_confirm: need to confirm neighbour
  *	@decrypted: Decrypted SKB
  *	@slow_gro: state present at GRO time, slower prepare step required
@@ -992,7 +994,7 @@ struct sk_buff {
 #if IS_ENABLED(CONFIG_IP_SCTP)
 	__u8			csum_not_inet:1;
 #endif
-
+	__u8			devmem:1;
 #if defined(CONFIG_NET_SCHED) || defined(CONFIG_NET_XGRESS)
 	__u16			tc_index;	/* traffic control index */
 #endif
@@ -1767,6 +1769,12 @@ static inline void skb_zcopy_downgrade_managed(struct sk_buff *skb)
 		__skb_zcopy_downgrade_managed(skb);
 }

+/* Return true if frags in this skb are not readable by the host. */
+static inline bool skb_frags_not_readable(const struct sk_buff *skb)
+{
+	return skb->devmem;
+}
+
 static inline void skb_mark_not_on_list(struct sk_buff *skb)
 {
 	skb->next = NULL;
@@ -2469,6 +2477,10 @@ static inline void __skb_fill_page_desc(struct sk_buff *skb, int i,
 					struct page *page, int off, int size)
 {
 	__skb_fill_page_desc_noacc(skb_shinfo(skb), i, page, off, size);
+	if (page_is_page_pool_iov(page)) {
+		skb->devmem = true;
+		return;
+	}

 	/* Propagate page pfmemalloc to the skb if we can. The problem is
 	 * that not all callers have unique ownership of the page but rely
diff --git a/include/net/tcp.h b/include/net/tcp.h
index c5fb90079920..1ea2d7274b8c 100644
--- a/include/net/tcp.h
+++ b/include/net/tcp.h
@@ -979,7 +979,7 @@ static inline int tcp_skb_mss(const struct sk_buff *skb)

 static inline bool tcp_skb_can_collapse_to(const struct sk_buff *skb)
 {
-	return likely(!TCP_SKB_CB(skb)->eor);
+	return likely(!TCP_SKB_CB(skb)->eor && !skb_frags_not_readable(skb));
 }

 static inline bool tcp_skb_can_collapse(const struct sk_buff *to,
@@ -987,7 +987,8 @@ static inline bool tcp_skb_can_collapse(const struct sk_buff *to,
 {
 	return likely(tcp_skb_can_collapse_to(to) &&
 		      mptcp_skb_can_collapse(to, from) &&
-		      skb_pure_zcopy_same(to, from));
+		      skb_pure_zcopy_same(to, from) &&
+		      skb_frags_not_readable(to) == skb_frags_not_readable(from));
 }

 /* Events passed to congestion control interface */
diff --git a/net/core/datagram.c b/net/core/datagram.c
index 176eb5834746..cdd4fb129968 100644
--- a/net/core/datagram.c
+++ b/net/core/datagram.c
@@ -425,6 +425,9 @@ static int __skb_datagram_iter(const struct sk_buff *skb, int offset,
 			return 0;
 	}

+	if (skb_frags_not_readable(skb))
+		goto short_copy;
+
 	/* Copy paged appendix. Hmm... why does this look so complicated? */
 	for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
 		int end;
@@ -616,6 +619,9 @@ int __zerocopy_sg_from_iter(struct msghdr *msg, struct sock *sk,
 {
 	int frag;

+	if (skb_frags_not_readable(skb))
+		return -EFAULT;
+
 	if (msg && msg->msg_ubuf && msg->sg_from_iter)
 		return msg->sg_from_iter(sk, skb, from, length);

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index ac79881a2630..1814d413897e 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -1175,6 +1175,14 @@ void skb_dump(const char *level, const struct sk_buff *skb, bool full_pkt)
 		struct page *p;
 		u8 *vaddr;

+		if (skb_frag_is_page_pool_iov(frag)) {
+			printk("%sskb frag: not readable", level);
+			len -= frag->bv_len;
+			if (!len)
+				break;
+			continue;
+		}
+
 		skb_frag_foreach_page(frag, skb_frag_off(frag),
 				      skb_frag_size(frag), p, p_off, p_len,
 				      copied) {
@@ -1752,6 +1760,9 @@ int skb_copy_ubufs(struct sk_buff *skb, gfp_t gfp_mask)
 	if (skb_shared(skb) || skb_unclone(skb, gfp_mask))
 		return -EINVAL;

+	if (skb_frags_not_readable(skb))
+		return -EFAULT;
+
 	if (!num_frags)
 		goto release;

@@ -1922,8 +1933,12 @@ struct sk_buff *skb_copy(const struct sk_buff *skb, gfp_t gfp_mask)
 {
 	int headerlen = skb_headroom(skb);
 	unsigned int size = skb_end_offset(skb) + skb->data_len;
-	struct sk_buff *n = __alloc_skb(size, gfp_mask,
-					skb_alloc_rx_flag(skb), NUMA_NO_NODE);
+	struct sk_buff *n;
+
+	if (skb_frags_not_readable(skb))
+		return NULL;
+
+	n = __alloc_skb(size, gfp_mask, skb_alloc_rx_flag(skb), NUMA_NO_NODE);

 	if (!n)
 		return NULL;
@@ -2249,14 +2264,16 @@ struct sk_buff *skb_copy_expand(const struct sk_buff *skb,
 				int newheadroom, int newtailroom,
 				gfp_t gfp_mask)
 {
-	/*
-	 *	Allocate the copy buffer
-	 */
-	struct sk_buff *n = __alloc_skb(newheadroom + skb->len + newtailroom,
-					gfp_mask, skb_alloc_rx_flag(skb),
-					NUMA_NO_NODE);
 	int oldheadroom = skb_headroom(skb);
 	int head_copy_len, head_copy_off;
+	struct sk_buff *n;
+
+	if (skb_frags_not_readable(skb))
+		return NULL;
+
+	/* Allocate the copy buffer */
+	n = __alloc_skb(newheadroom + skb->len + newtailroom, gfp_mask,
+			skb_alloc_rx_flag(skb), NUMA_NO_NODE);

 	if (!n)
 		return NULL;
@@ -2595,6 +2612,9 @@ void *__pskb_pull_tail(struct sk_buff *skb, int delta)
 	 */
 	int i, k, eat = (skb->tail + delta) - skb->end;

+	if (skb_frags_not_readable(skb))
+		return NULL;
+
 	if (eat > 0 || skb_cloned(skb)) {
 		if (pskb_expand_head(skb, 0, eat > 0 ? eat + 128 : 0,
 				     GFP_ATOMIC))
@@ -2748,6 +2768,9 @@ int skb_copy_bits(const struct sk_buff *skb, int offset, void *to, int len)
 		to     += copy;
 	}

+	if (skb_frags_not_readable(skb))
+		goto fault;
+
 	for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
 		int end;
 		skb_frag_t *f = &skb_shinfo(skb)->frags[i];
@@ -2936,6 +2959,9 @@ static bool __skb_splice_bits(struct sk_buff *skb, struct pipe_inode_info *pipe,
 	/*
 	 * then map the fragments
 	 */
+	if (skb_frags_not_readable(skb))
+		return false;
+
 	for (seg = 0; seg < skb_shinfo(skb)->nr_frags; seg++) {
 		const skb_frag_t *f = &skb_shinfo(skb)->frags[seg];

@@ -3159,6 +3185,9 @@ int skb_store_bits(struct sk_buff *skb, int offset, const void *from, int len)
 		from += copy;
 	}

+	if (skb_frags_not_readable(skb))
+		goto fault;
+
 	for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
 		skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
 		int end;
@@ -3238,6 +3267,9 @@ __wsum __skb_checksum(const struct sk_buff *skb, int offset, int len,
 		pos	= copy;
 	}

+	if (skb_frags_not_readable(skb))
+		return 0;
+
 	for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
 		int end;
 		skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
@@ -3338,6 +3370,9 @@ __wsum skb_copy_and_csum_bits(const struct sk_buff *skb, int offset,
 		pos	= copy;
 	}

+	if (skb_frags_not_readable(skb))
+		return 0;
+
 	for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
 		int end;

@@ -3795,7 +3830,9 @@ static inline void skb_split_inside_header(struct sk_buff *skb,
 		skb_shinfo(skb1)->frags[i] = skb_shinfo(skb)->frags[i];

 	skb_shinfo(skb1)->nr_frags = skb_shinfo(skb)->nr_frags;
+	skb1->devmem		   = skb->devmem;
 	skb_shinfo(skb)->nr_frags  = 0;
+	skb->devmem		   = 0;
 	skb1->data_len		   = skb->data_len;
 	skb1->len		   += skb1->data_len;
 	skb->data_len		   = 0;
@@ -3809,6 +3846,7 @@ static inline void skb_split_no_header(struct sk_buff *skb,
 {
 	int i, k = 0;
 	const int nfrags = skb_shinfo(skb)->nr_frags;
+	const int devmem = skb->devmem;

 	skb_shinfo(skb)->nr_frags = 0;
 	skb1->len		  = skb1->data_len = skb->len - len;
@@ -3842,6 +3880,16 @@ static inline void skb_split_no_header(struct sk_buff *skb,
 		pos += size;
 	}
 	skb_shinfo(skb1)->nr_frags = k;
+
+	if (skb_shinfo(skb)->nr_frags)
+		skb->devmem = devmem;
+	else
+		skb->devmem = 0;
+
+	if (skb_shinfo(skb1)->nr_frags)
+		skb1->devmem = devmem;
+	else
+		skb1->devmem = 0;
 }

 /**
@@ -4077,6 +4125,9 @@ unsigned int skb_seq_read(unsigned int consumed, const u8 **data,
 		return block_limit - abs_offset;
 	}

+	if (skb_frags_not_readable(st->cur_skb))
+		return 0;
+
 	if (st->frag_idx == 0 && !st->frag_data)
 		st->stepped_offset += skb_headlen(st->cur_skb);

@@ -5678,7 +5729,10 @@ bool skb_try_coalesce(struct sk_buff *to, struct sk_buff *from,
 	    (from->pp_recycle && skb_cloned(from)))
 		return false;

-	if (len <= skb_tailroom(to)) {
+	if (skb_frags_not_readable(from) != skb_frags_not_readable(to))
+		return false;
+
+	if (len <= skb_tailroom(to) && !skb_frags_not_readable(from)) {
 		if (len)
 			BUG_ON(skb_copy_bits(from, 0, skb_put(to, len), len));
 		*delta_truesize = 0;
@@ -5853,6 +5907,9 @@ int skb_ensure_writable(struct sk_buff *skb, unsigned int write_len)
 	if (!pskb_may_pull(skb, write_len))
 		return -ENOMEM;

+	if (skb_frags_not_readable(skb))
+		return -EFAULT;
+
 	if (!skb_cloned(skb) || skb_clone_writable(skb, write_len))
 		return 0;

@@ -6513,7 +6570,7 @@ void skb_condense(struct sk_buff *skb)
 {
 	if (skb->data_len) {
 		if (skb->data_len > skb->end - skb->tail ||
-		    skb_cloned(skb))
+		    skb_cloned(skb) || skb_frags_not_readable(skb))
 			return;

 		/* Nice, we can free page frag(s) right now */
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 7893df0e22ee..53ec616b1fb7 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -2143,6 +2143,9 @@ static int tcp_zerocopy_receive(struct sock *sk,
 				skb = tcp_recv_skb(sk, seq, &offset);
 			}

+			if (skb_frags_not_readable(skb))
+				break;
+
 			if (TCP_SKB_CB(skb)->has_rxtstamp) {
 				tcp_update_recv_tstamps(skb, tss);
 				zc->msg_flags |= TCP_CMSG_TS;
@@ -4415,6 +4418,9 @@ int tcp_md5_hash_skb_data(struct tcp_md5sig_pool *hp,
 	if (crypto_ahash_update(req))
 		return 1;

+	if (skb_frags_not_readable(skb))
+		return 1;
+
 	for (i = 0; i < shi->nr_frags; ++i) {
 		const skb_frag_t *f = &shi->frags[i];
 		unsigned int offset = skb_frag_off(f);
diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 670c3dab24f2..f5b12f963cd8 100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -5204,6 +5204,9 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 	for (end_of_skbs = true; skb != NULL && skb != tail; skb = n) {
 		n = tcp_skb_next(skb, list);

+		if (skb_frags_not_readable(skb))
+			goto skip_this;
+
 		/* No new bits? It is possible on ofo queue. */
 		if (!before(start, TCP_SKB_CB(skb)->end_seq)) {
 			skb = tcp_collapse_one(sk, skb, list, root);
@@ -5224,17 +5227,20 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 			break;
 		}

-		if (n && n != tail && mptcp_skb_can_collapse(skb, n) &&
+		if (n && n != tail && !skb_frags_not_readable(n) &&
+		    mptcp_skb_can_collapse(skb, n) &&
 		    TCP_SKB_CB(skb)->end_seq != TCP_SKB_CB(n)->seq) {
 			end_of_skbs = false;
 			break;
 		}

+skip_this:
 		/* Decided to skip this, advance start seq. */
 		start = TCP_SKB_CB(skb)->end_seq;
 	}
 	if (end_of_skbs ||
-	    (TCP_SKB_CB(skb)->tcp_flags & (TCPHDR_SYN | TCPHDR_FIN)))
+	    (TCP_SKB_CB(skb)->tcp_flags & (TCPHDR_SYN | TCPHDR_FIN)) ||
+	    skb_frags_not_readable(skb))
 		return;

 	__skb_queue_head_init(&tmp);
@@ -5278,7 +5284,8 @@ tcp_collapse(struct sock *sk, struct sk_buff_head *list, struct rb_root *root,
 				if (!skb ||
 				    skb == tail ||
 				    !mptcp_skb_can_collapse(nskb, skb) ||
-				    (TCP_SKB_CB(skb)->tcp_flags & (TCPHDR_SYN | TCPHDR_FIN)))
+				    (TCP_SKB_CB(skb)->tcp_flags & (TCPHDR_SYN | TCPHDR_FIN)) ||
+				    skb_frags_not_readable(skb))
 					goto end;
 #ifdef CONFIG_TLS_DEVICE
 				if (skb->decrypted != nskb->decrypted)
diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
index 2cb39b6dad02..54bc4de6bce4 100644
--- a/net/ipv4/tcp_output.c
+++ b/net/ipv4/tcp_output.c
@@ -2300,7 +2300,8 @@ static bool tcp_can_coalesce_send_queue_head(struct sock *sk, int len)

 		if (unlikely(TCP_SKB_CB(skb)->eor) ||
 		    tcp_has_tx_tstamp(skb) ||
-		    !skb_pure_zcopy_same(skb, next))
+		    !skb_pure_zcopy_same(skb, next) ||
+		    skb_frags_not_readable(skb) != skb_frags_not_readable(next))
 			return false;

 		len -= skb->len;
@@ -3169,6 +3170,8 @@ static bool tcp_can_collapse(const struct sock *sk, const struct sk_buff *skb)
 		return false;
 	if (skb_cloned(skb))
 		return false;
+	if (skb_frags_not_readable(skb))
+		return false;
 	/* Some heuristics for collapsing over SACK'd could be invented */
 	if (TCP_SKB_CB(skb)->sacked & TCPCB_SACKED_ACKED)
 		return false;
diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index 85ff90a03b0c..308151044032 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -2152,7 +2152,7 @@ static int packet_rcv(struct sk_buff *skb, struct net_device *dev,
 		}
 	}

-	snaplen = skb->len;
+	snaplen = skb_frags_not_readable(skb) ? skb_headlen(skb) : skb->len;

 	res = run_filter(skb, sk, snaplen);
 	if (!res)
@@ -2275,7 +2275,7 @@ static int tpacket_rcv(struct sk_buff *skb, struct net_device *dev,
 		}
 	}

-	snaplen = skb->len;
+	snaplen = skb_frags_not_readable(skb) ? skb_headlen(skb) : skb->len;

 	res = run_filter(skb, sk, snaplen);
 	if (!res)
--
2.41.0.640.ga95def55d0-goog
