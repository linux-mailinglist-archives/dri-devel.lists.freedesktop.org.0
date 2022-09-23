Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA4B5E83AA
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 22:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8FE10E969;
	Fri, 23 Sep 2022 20:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C5310E1C0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 20:28:28 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id y11so1062156pjv.4
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 13:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=WvdKcFRqdjuCQfT0JD0gE0+SmtwNOrU+Pg1jOBHe3u4=;
 b=HrEaRqblEiynLI80qIODRxODwTegHwanOC+vBRaT+N4CuyIyDnT1Ka3u4nfVp9IIHd
 diT0lWeZvMtZhxZoszDpodW+IF3HNONiVLb+u/CcrtF0chbqY7ZgfyXXY3bccBOo8VEU
 9aWzIy88EGpAGDtPIK6TJqjioaB1k1Ced9PHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=WvdKcFRqdjuCQfT0JD0gE0+SmtwNOrU+Pg1jOBHe3u4=;
 b=rUoNlF4uY4QtxqZynVmv6pSs1w5xeKDCeiEAbrmK/AWMQtTYYMRjMmgOtNqfClH+d0
 okBdpflYyUNCbW4Ix9J1d5YogCfONt0vagAGfdotV7jc7yBYwASlYXJwlro3idqc5ZPM
 +R6Zs4IplSaX6bh4vcA6BZVfDEbyWiUZMqDPSMgeLjWp9KNfQBjSMd6efI/zS1VHMQWf
 UC9ul5YDJA2PsFmzYxzSF1WO7Qcn7Qbqag2TM7SwJw+9fPYz1KDiOiAqH7cSxmucPqiA
 6lNZxx99qqFGqdYClqFRge6I4YcqXiU4knceJo0Ph/yYJo7xO5NHrureeA+p5XfzQU0v
 udFw==
X-Gm-Message-State: ACrzQf0y5H6wI4ztGkKT0hy1YclrEc9WQb1e/KOBrGPbZyg+YKLD2I/i
 J90NnJmWOdfGFJIqzUlEFuhOzg==
X-Google-Smtp-Source: AMsMyM4ngI9FRR1eL+yZ6uwD2KKL58Y//80JdSNI55TW3osObzJLJuYdaOAbceb8ExT348oeslycRw==
X-Received: by 2002:a17:90b:1d12:b0:200:461c:fa7d with SMTP id
 on18-20020a17090b1d1200b00200461cfa7dmr11526582pjb.38.1663964907877; 
 Fri, 23 Sep 2022 13:28:27 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a170902f68b00b0017832c8cc85sm6427549plg.292.2022.09.23.13.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 13:28:25 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH v2 03/16] skbuff: Proactively round up to kmalloc bucket size
Date: Fri, 23 Sep 2022 13:28:09 -0700
Message-Id: <20220923202822.2667581-4-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220923202822.2667581-1-keescook@chromium.org>
References: <20220923202822.2667581-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8786; h=from:subject;
 bh=/55In49mcQKg/1B/2W03m4b/pZThn3d5JbnnA49Rm6I=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjLhbkHxh06F0h70CVmnqi/5BazOvRlOHWM3KgI6U5
 EH+6FCyJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYy4W5AAKCRCJcvTf3G3AJhURD/
 9I6XEF+He0Ww+60DOgfxrHQg5rlWLQ0kqhBM44ODly9CeGSh3lhyoVQ/h9WpsVZNuLWimeIaArOgsM
 IAW1lVoADGZnBF9ATBVtZo64La+i6ahcPdQ7LBs/s6pDjZeopNi7al0Bt1YzlRe0VOSUjYGy82cVtY
 WOaobW8pTWoyLTjo3iTpHKyFaKQN1MKp1Y3EqG0/B05W8mFeqsmuQ0qy6EIiP8Zs4iEfvR/7UrSGb0
 BVshxfoJapBmV7hlF/1qXAMi4Nva19VNb6+8aYgQRWD6SHG43lz++GxcOt3rERzf1S1B61G/WpKdPE
 OmQF4aoA0KyjqK6KPG9b+IKbK9H4qTgxuIMqrcyFVniVxLQqm8OZeZ7G8Sc/RmyqeiIp4dcT2wfHlo
 9rn+/pIzx3dZkhHIt1dBi6oGIYcft5FhSjoTBRNpDCbB3q6t7Z6v+2tx9BprHS7rO3CCsH36HQEZ7B
 UKU1zH31UqO/iWiGbvto4ioPgRV91yQV1fmC9MAvO70ri2/E2LfLPOhO5Ie/MQ1W6dyCRLrTbXBryi
 qvuZGLPA690eYRPxm2oVZ54qQE6SU2XdbPMDsuG9ONR6QSv2mTERQ9OgeKQnOPu3Yznrzyd99lObTv
 OIpbLfaEVj2GDT+fQjDKwgYif/bE416Ch2kM90zcPNidPn2ZZH/+EY2ye6/A==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
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
Cc: llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, "Ruhl,
 Michael J" <michael.j.ruhl@intel.com>, Eric Dumazet <edumazet@google.com>,
 linux-hardening@vger.kernel.org, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 Christoph Lameter <cl@linux.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Josef Bacik <josef@toxicpanda.com>, linaro-mm-sig@lists.linaro.org,
 Yonghong Song <yhs@fb.com>, David Sterba <dsterba@suse.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Alex Elder <elder@kernel.org>,
 linux-mm@kvack.org, netdev@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Pekka Enberg <penberg@kernel.org>,
 Daniel Micay <danielmicay@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of discovering the kmalloc bucket size _after_ allocation, round
up proactively so the allocation is explicitly made for the full size,
allowing the compiler to correctly reason about the resulting size of
the buffer through the existing __alloc_size() hint.

This will allow for kernels built with CONFIG_UBSAN_BOUNDS or the
coming dynamic bounds checking under CONFIG_FORTIFY_SOURCE to gain
back the __alloc_size() hints that were temporarily reverted in commit
93dd04ab0b2b ("slab: remove __alloc_size attribute from __kmalloc_track_caller")

Additionally tries to normalize size variables to u32 from int. Most
interfaces are using "int", but notably __alloc_skb uses unsigned int.

Also fix some reverse Christmas tree and comments while touching nearby
code.

Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: David Rientjes <rientjes@google.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/skbuff.h |  5 +---
 net/core/skbuff.c      | 64 +++++++++++++++++++++---------------------
 2 files changed, 33 insertions(+), 36 deletions(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index ca8afa382bf2..5a16177f38b5 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -1234,7 +1234,7 @@ void kfree_skb_partial(struct sk_buff *skb, bool head_stolen);
 bool skb_try_coalesce(struct sk_buff *to, struct sk_buff *from,
 		      bool *fragstolen, int *delta_truesize);
 
-struct sk_buff *__alloc_skb(unsigned int size, gfp_t priority, int flags,
+struct sk_buff *__alloc_skb(unsigned int bytes, gfp_t priority, int flags,
 			    int node);
 struct sk_buff *__build_skb(void *data, unsigned int frag_size);
 struct sk_buff *build_skb(void *data, unsigned int frag_size);
@@ -1870,9 +1870,6 @@ static inline int skb_unclone(struct sk_buff *skb, gfp_t pri)
 
 /* This variant of skb_unclone() makes sure skb->truesize
  * and skb_end_offset() are not changed, whenever a new skb->head is needed.
- *
- * Indeed there is no guarantee that ksize(kmalloc(X)) == ksize(kmalloc(X))
- * when various debugging features are in place.
  */
 int __skb_unclone_keeptruesize(struct sk_buff *skb, gfp_t pri);
 static inline int skb_unclone_keeptruesize(struct sk_buff *skb, gfp_t pri)
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 974bbbbe7138..0b30fbdbd0d0 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -343,19 +343,23 @@ EXPORT_SYMBOL(napi_build_skb);
  * the caller if emergency pfmemalloc reserves are being used. If it is and
  * the socket is later found to be SOCK_MEMALLOC then PFMEMALLOC reserves
  * may be used. Otherwise, the packet data may be discarded until enough
- * memory is free
+ * memory is free.
  */
-static void *kmalloc_reserve(size_t size, gfp_t flags, int node,
+static void *kmalloc_reserve(u32 *size, gfp_t flags, int node,
 			     bool *pfmemalloc)
 {
 	void *obj;
 	bool ret_pfmemalloc = false;
 
+	/* kmalloc(size) might give us more room than requested, so
+	 * allocate the true bucket size up front.
+	 */
+	*size = kmalloc_size_roundup(*size);
 	/*
 	 * Try a regular allocation, when that fails and we're not entitled
 	 * to the reserves, fail.
 	 */
-	obj = kmalloc_node_track_caller(size,
+	obj = kmalloc_node_track_caller(*size,
 					flags | __GFP_NOMEMALLOC | __GFP_NOWARN,
 					node);
 	if (obj || !(gfp_pfmemalloc_allowed(flags)))
@@ -363,7 +367,7 @@ static void *kmalloc_reserve(size_t size, gfp_t flags, int node,
 
 	/* Try again but now we are using pfmemalloc reserves */
 	ret_pfmemalloc = true;
-	obj = kmalloc_node_track_caller(size, flags, node);
+	obj = kmalloc_node_track_caller(*size, flags, node);
 
 out:
 	if (pfmemalloc)
@@ -380,7 +384,7 @@ static void *kmalloc_reserve(size_t size, gfp_t flags, int node,
 
 /**
  *	__alloc_skb	-	allocate a network buffer
- *	@size: size to allocate
+ *	@bytes: minimum bytes to allocate
  *	@gfp_mask: allocation mask
  *	@flags: If SKB_ALLOC_FCLONE is set, allocate from fclone cache
  *		instead of head cache and allocate a cloned (child) skb.
@@ -395,12 +399,12 @@ static void *kmalloc_reserve(size_t size, gfp_t flags, int node,
  *	Buffers may only be allocated from interrupts using a @gfp_mask of
  *	%GFP_ATOMIC.
  */
-struct sk_buff *__alloc_skb(unsigned int size, gfp_t gfp_mask,
+struct sk_buff *__alloc_skb(unsigned int bytes, gfp_t gfp_mask,
 			    int flags, int node)
 {
 	struct kmem_cache *cache;
 	struct sk_buff *skb;
-	unsigned int osize;
+	u32 size = bytes;
 	bool pfmemalloc;
 	u8 *data;
 
@@ -427,15 +431,13 @@ struct sk_buff *__alloc_skb(unsigned int size, gfp_t gfp_mask,
 	 */
 	size = SKB_DATA_ALIGN(size);
 	size += SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
-	data = kmalloc_reserve(size, gfp_mask, node, &pfmemalloc);
-	if (unlikely(!data))
-		goto nodata;
-	/* kmalloc(size) might give us more room than requested.
-	 * Put skb_shared_info exactly at the end of allocated zone,
+	/* Put skb_shared_info exactly at the end of allocated zone,
 	 * to allow max possible filling before reallocation.
 	 */
-	osize = ksize(data);
-	size = SKB_WITH_OVERHEAD(osize);
+	data = kmalloc_reserve(&size, gfp_mask, node, &pfmemalloc);
+	if (unlikely(!data))
+		goto nodata;
+	size = SKB_WITH_OVERHEAD(size);
 	prefetchw(data + size);
 
 	/*
@@ -444,7 +446,7 @@ struct sk_buff *__alloc_skb(unsigned int size, gfp_t gfp_mask,
 	 * the tail pointer in struct sk_buff!
 	 */
 	memset(skb, 0, offsetof(struct sk_buff, tail));
-	__build_skb_around(skb, data, osize);
+	__build_skb_around(skb, data, size);
 	skb->pfmemalloc = pfmemalloc;
 
 	if (flags & SKB_ALLOC_FCLONE) {
@@ -1708,7 +1710,7 @@ int pskb_expand_head(struct sk_buff *skb, int nhead, int ntail,
 		     gfp_t gfp_mask)
 {
 	int i, osize = skb_end_offset(skb);
-	int size = osize + nhead + ntail;
+	u32 size = osize + nhead + ntail;
 	long off;
 	u8 *data;
 
@@ -1722,11 +1724,11 @@ int pskb_expand_head(struct sk_buff *skb, int nhead, int ntail,
 
 	if (skb_pfmemalloc(skb))
 		gfp_mask |= __GFP_MEMALLOC;
-	data = kmalloc_reserve(size + SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
-			       gfp_mask, NUMA_NO_NODE, NULL);
+	size += SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
+	data = kmalloc_reserve(&size, gfp_mask, NUMA_NO_NODE, NULL);
 	if (!data)
 		goto nodata;
-	size = SKB_WITH_OVERHEAD(ksize(data));
+	size = SKB_WITH_OVERHEAD(size);
 
 	/* Copy only real data... and, alas, header. This should be
 	 * optimized for the cases when header is void.
@@ -6060,22 +6062,21 @@ EXPORT_SYMBOL(alloc_skb_with_frags);
 static int pskb_carve_inside_header(struct sk_buff *skb, const u32 off,
 				    const int headlen, gfp_t gfp_mask)
 {
-	int i;
-	int size = skb_end_offset(skb);
+	u32 size = skb_end_offset(skb);
 	int new_hlen = headlen - off;
 	u8 *data;
+	int i;
 
 	size = SKB_DATA_ALIGN(size);
 
 	if (skb_pfmemalloc(skb))
 		gfp_mask |= __GFP_MEMALLOC;
-	data = kmalloc_reserve(size +
-			       SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
-			       gfp_mask, NUMA_NO_NODE, NULL);
+	size += SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
+	data = kmalloc_reserve(&size, gfp_mask, NUMA_NO_NODE, NULL);
 	if (!data)
 		return -ENOMEM;
 
-	size = SKB_WITH_OVERHEAD(ksize(data));
+	size = SKB_WITH_OVERHEAD(size);
 
 	/* Copy real data, and all frags */
 	skb_copy_from_linear_data_offset(skb, off, data, new_hlen);
@@ -6179,23 +6180,22 @@ static int pskb_carve_frag_list(struct sk_buff *skb,
 static int pskb_carve_inside_nonlinear(struct sk_buff *skb, const u32 off,
 				       int pos, gfp_t gfp_mask)
 {
-	int i, k = 0;
-	int size = skb_end_offset(skb);
-	u8 *data;
 	const int nfrags = skb_shinfo(skb)->nr_frags;
 	struct skb_shared_info *shinfo;
+	u32 size = skb_end_offset(skb);
+	int i, k = 0;
+	u8 *data;
 
 	size = SKB_DATA_ALIGN(size);
 
 	if (skb_pfmemalloc(skb))
 		gfp_mask |= __GFP_MEMALLOC;
-	data = kmalloc_reserve(size +
-			       SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
-			       gfp_mask, NUMA_NO_NODE, NULL);
+	size += SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
+	data = kmalloc_reserve(&size, gfp_mask, NUMA_NO_NODE, NULL);
 	if (!data)
 		return -ENOMEM;
 
-	size = SKB_WITH_OVERHEAD(ksize(data));
+	size = SKB_WITH_OVERHEAD(size);
 
 	memcpy((struct skb_shared_info *)(data + size),
 	       skb_shinfo(skb), offsetof(struct skb_shared_info, frags[0]));
-- 
2.34.1

