Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 374D95E8A89
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 11:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077F210E55A;
	Sat, 24 Sep 2022 09:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E3210E55A
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 09:11:31 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id d11so2131727pll.8
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 02:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date;
 bh=i+DbZ92rhFWH/0UDN/zG8OtvV+E4X59I6BjaPOZbEQQ=;
 b=E5bOhboA/+6BWRDx1UWFFrMvOXvKoaBtGsWYlDmuj8X7rAkhnZpWRHTQ3LNDz7+mZj
 DgCRrEBR3MyfN1vHwttkAVt9C+sNXNl8rbk7MHBer0lal296QvNAuoGU6ltJiVjNpwJw
 ZbeC7n9zGD6mKw33TGHmgsxJslMQNugj0HBL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=i+DbZ92rhFWH/0UDN/zG8OtvV+E4X59I6BjaPOZbEQQ=;
 b=sN9GZW9+lOjjfb8KmOF0KBI+Noe7pddFlfyswdQVsscUJBXHYr9Pvv95d7WjkvReii
 wQhzwP0Z5Bc675Keq+hsNvjxJjcXmI9fValMIsIvb5bSNEL+VX1kw0WJzce+D9Dbnko4
 ubjY9QqYyt/01TSFqEfMUfnsJwOc6hxSR9bHONPRL8Ea92HZYz2YpsMJaBljMnF9t+LO
 o0iykFKRIHEcBwniA4u9dxqOOSCH/lqMXaibrc3evojzrW9YLWN8i7DjPLOK3Y888B2T
 UY/gV/12Wt5zO0/hBKSIQA32zgQdyi1Vtuhhzh+xhyshQ+7NTypol1ErnOfiHtslKeq4
 zLGw==
X-Gm-Message-State: ACrzQf1an5LZNgcDdHx0shwdbyNhTmh0XiIbptgl7oHztTHciRjY715c
 /v31AWU0yRfogQ3jDXb5oIm4vw==
X-Google-Smtp-Source: AMsMyM7r8bq+DxJ2Zg4nmPe+hShYURXJSZpppn8rw6aZz5OkkmasnCi/hTE7Baskd4vD2R6zimHrAA==
X-Received: by 2002:a17:902:d4c9:b0:178:6d7b:c36f with SMTP id
 o9-20020a170902d4c900b001786d7bc36fmr12510856plg.19.1664010691458; 
 Sat, 24 Sep 2022 02:11:31 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 b13-20020aa7950d000000b005546fe4b127sm5590232pfp.78.2022.09.24.02.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 02:11:30 -0700 (PDT)
Date: Sat, 24 Sep 2022 02:11:29 -0700
From: Kees Cook <keescook@chromium.org>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v2 03/16] skbuff: Proactively round up to kmalloc bucket
 size
Message-ID: <202209240208.84F847F3B@keescook>
References: <20220923202822.2667581-1-keescook@chromium.org>
 <20220923202822.2667581-4-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220923202822.2667581-4-keescook@chromium.org>
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
 Miguel Ojeda <ojeda@kernel.org>, Yonghong Song <yhs@fb.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Josef Bacik <josef@toxicpanda.com>,
 linaro-mm-sig@lists.linaro.org, David Sterba <dsterba@suse.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Vlastimil Babka <vbabka@suse.cz>,
 Alex Elder <elder@kernel.org>, linux-mm@kvack.org, netdev@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Pekka Enberg <penberg@kernel.org>,
 Daniel Micay <danielmicay@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-btrfs@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 23, 2022 at 01:28:09PM -0700, Kees Cook wrote:
> Instead of discovering the kmalloc bucket size _after_ allocation, round
> up proactively so the allocation is explicitly made for the full size,
> allowing the compiler to correctly reason about the resulting size of
> the buffer through the existing __alloc_size() hint.
> 
> This will allow for kernels built with CONFIG_UBSAN_BOUNDS or the
> coming dynamic bounds checking under CONFIG_FORTIFY_SOURCE to gain
> back the __alloc_size() hints that were temporarily reverted in commit
> 93dd04ab0b2b ("slab: remove __alloc_size attribute from __kmalloc_track_caller")
> 
> Additionally tries to normalize size variables to u32 from int. Most
> interfaces are using "int", but notably __alloc_skb uses unsigned int.
> 
> Also fix some reverse Christmas tree and comments while touching nearby
> code.

Something in this patch is breaking things -- I've refactored it again
to avoid overwriting the incoming size argument, and instead add a
dedicated outgoing size variable. Here's what will be v3 ...

---
 net/core/skbuff.c | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 974bbbbe7138..9b5a9fb69d9d 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -346,11 +346,12 @@ EXPORT_SYMBOL(napi_build_skb);
  * memory is free
  */
 static void *kmalloc_reserve(size_t size, gfp_t flags, int node,
-			     bool *pfmemalloc)
+			     bool *pfmemalloc, size_t *alloc_size)
 {
 	void *obj;
 	bool ret_pfmemalloc = false;
 
+	size = kmalloc_size_roundup(size);
 	/*
 	 * Try a regular allocation, when that fails and we're not entitled
 	 * to the reserves, fail.
@@ -369,6 +370,7 @@ static void *kmalloc_reserve(size_t size, gfp_t flags, int node,
 	if (pfmemalloc)
 		*pfmemalloc = ret_pfmemalloc;
 
+	*alloc_size = size;
 	return obj;
 }
 
@@ -400,7 +402,7 @@ struct sk_buff *__alloc_skb(unsigned int size, gfp_t gfp_mask,
 {
 	struct kmem_cache *cache;
 	struct sk_buff *skb;
-	unsigned int osize;
+	size_t alloc_size;
 	bool pfmemalloc;
 	u8 *data;
 
@@ -427,15 +429,15 @@ struct sk_buff *__alloc_skb(unsigned int size, gfp_t gfp_mask,
 	 */
 	size = SKB_DATA_ALIGN(size);
 	size += SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
-	data = kmalloc_reserve(size, gfp_mask, node, &pfmemalloc);
-	if (unlikely(!data))
-		goto nodata;
-	/* kmalloc(size) might give us more room than requested.
+	/* kmalloc(size) might give us more room than requested, so
+	 * allocate the true bucket size up front.
 	 * Put skb_shared_info exactly at the end of allocated zone,
 	 * to allow max possible filling before reallocation.
 	 */
-	osize = ksize(data);
-	size = SKB_WITH_OVERHEAD(osize);
+	data = kmalloc_reserve(size, gfp_mask, node, &pfmemalloc, &alloc_size);
+	if (unlikely(!data))
+		goto nodata;
+	size = SKB_WITH_OVERHEAD(alloc_size);
 	prefetchw(data + size);
 
 	/*
@@ -444,7 +446,7 @@ struct sk_buff *__alloc_skb(unsigned int size, gfp_t gfp_mask,
 	 * the tail pointer in struct sk_buff!
 	 */
 	memset(skb, 0, offsetof(struct sk_buff, tail));
-	__build_skb_around(skb, data, osize);
+	__build_skb_around(skb, data, alloc_size);
 	skb->pfmemalloc = pfmemalloc;
 
 	if (flags & SKB_ALLOC_FCLONE) {
@@ -1709,6 +1711,7 @@ int pskb_expand_head(struct sk_buff *skb, int nhead, int ntail,
 {
 	int i, osize = skb_end_offset(skb);
 	int size = osize + nhead + ntail;
+	size_t alloc_size;
 	long off;
 	u8 *data;
 
@@ -1723,10 +1726,10 @@ int pskb_expand_head(struct sk_buff *skb, int nhead, int ntail,
 	if (skb_pfmemalloc(skb))
 		gfp_mask |= __GFP_MEMALLOC;
 	data = kmalloc_reserve(size + SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
-			       gfp_mask, NUMA_NO_NODE, NULL);
+			       gfp_mask, NUMA_NO_NODE, NULL, &alloc_size);
 	if (!data)
 		goto nodata;
-	size = SKB_WITH_OVERHEAD(ksize(data));
+	size = SKB_WITH_OVERHEAD(alloc_size);
 
 	/* Copy only real data... and, alas, header. This should be
 	 * optimized for the cases when header is void.
@@ -6063,19 +6066,19 @@ static int pskb_carve_inside_header(struct sk_buff *skb, const u32 off,
 	int i;
 	int size = skb_end_offset(skb);
 	int new_hlen = headlen - off;
+	size_t alloc_size;
 	u8 *data;
 
 	size = SKB_DATA_ALIGN(size);
 
 	if (skb_pfmemalloc(skb))
 		gfp_mask |= __GFP_MEMALLOC;
-	data = kmalloc_reserve(size +
-			       SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
-			       gfp_mask, NUMA_NO_NODE, NULL);
+	data = kmalloc_reserve(size + SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
+			       gfp_mask, NUMA_NO_NODE, NULL, &alloc_size);
 	if (!data)
 		return -ENOMEM;
 
-	size = SKB_WITH_OVERHEAD(ksize(data));
+	size = SKB_WITH_OVERHEAD(alloc_size);
 
 	/* Copy real data, and all frags */
 	skb_copy_from_linear_data_offset(skb, off, data, new_hlen);
@@ -6184,18 +6187,18 @@ static int pskb_carve_inside_nonlinear(struct sk_buff *skb, const u32 off,
 	u8 *data;
 	const int nfrags = skb_shinfo(skb)->nr_frags;
 	struct skb_shared_info *shinfo;
+	size_t alloc_size;
 
 	size = SKB_DATA_ALIGN(size);
 
 	if (skb_pfmemalloc(skb))
 		gfp_mask |= __GFP_MEMALLOC;
-	data = kmalloc_reserve(size +
-			       SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
-			       gfp_mask, NUMA_NO_NODE, NULL);
+	data = kmalloc_reserve(size + SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
+			       gfp_mask, NUMA_NO_NODE, NULL, &alloc_size);
 	if (!data)
 		return -ENOMEM;
 
-	size = SKB_WITH_OVERHEAD(ksize(data));
+	size = SKB_WITH_OVERHEAD(alloc_size);
 
 	memcpy((struct skb_shared_info *)(data + size),
 	       skb_shinfo(skb), offsetof(struct skb_shared_info, frags[0]));
-- 
2.34.1


-- 
Kees Cook
