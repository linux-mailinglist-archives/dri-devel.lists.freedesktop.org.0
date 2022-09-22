Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C77755E5921
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 05:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C487C10EA44;
	Thu, 22 Sep 2022 03:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F8D10E00B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 03:10:24 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 q9-20020a17090a178900b0020265d92ae3so802154pja.5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 20:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=e/QakfBu8OdcLOaNtNAlOZZbARPmNgFJAYuG6V5fVNI=;
 b=KID4+fNPZ/+EeETfIhlZodisrk94VxxslzZcsqTK2+SnDvmzAz6LYMBzVDpytU/nEq
 EIXxg57qTfuTgbSUKdc6GxhGn+QXLKP5XVcWuZOc8i9lduGT5GmK9QPkOg0atE9jam9x
 IA1gpnZyHuwdwIlZEHKE4Y17orFlGUFf4xU0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=e/QakfBu8OdcLOaNtNAlOZZbARPmNgFJAYuG6V5fVNI=;
 b=4+lSkONCzjzn0NK0P4sljQAWX1y66Nn88qpiBSNPiGDuLQzL5W8yB4PdA8u+rUFBrD
 Jzgn0FFtmZI8sWqEe35TxT6kr8RDTyI5myXfo0Rg+BtBFdJzo4znNHdDnJmd8OrQM8jX
 xf9hODtuOPKuC6HhS+msrKgqhX8hW+P05nmL8f8PX7HLZJfXC+9oEq3rgY/9IOfTEROU
 dfrL6qfGa57VEmDZWlLNY0Wn7pJE4aJirFBQIECCK9oB3bY/khyUls7FCL+gvpua8cs3
 FlnQ689qyISEFVCvAJ4xEyEQYCyeyDKsPk4Quw/i+jEdSdI7NfZ3QdYBl5XSv1SzK4bg
 ngNw==
X-Gm-Message-State: ACrzQf26JySdcLZBIxqD39hjzexsY7CD4uOxgIxo7VV/knYaOrO4VE74
 Dv8pAt7bj6bjnkZ+gdjzcYOkYA==
X-Google-Smtp-Source: AMsMyM40uPN5zeKYkv78Anmrprlj6jSzqrJtHp0Hc07l03jt/qUE59pMSphisPX0a2uGMaa6VRKIFQ==
X-Received: by 2002:a17:90b:3809:b0:202:b482:b7d6 with SMTP id
 mq9-20020a17090b380900b00202b482b7d6mr12697142pjb.209.1663816223696; 
 Wed, 21 Sep 2022 20:10:23 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a17090abd9300b001fab208523esm2641836pjr.3.2022.09.21.20.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 20:10:22 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH 02/12] skbuff: Proactively round up to kmalloc bucket size
Date: Wed, 21 Sep 2022 20:10:03 -0700
Message-Id: <20220922031013.2150682-3-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220922031013.2150682-1-keescook@chromium.org>
References: <20220922031013.2150682-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4645; h=from:subject;
 bh=3WJZlXdhsWxnvdirTV8FcTTBEg/t69yXm1UnFNwV9iU=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBjK9ISG+mldB4B+ZQUmvF386D3yd+qSk6StyPf1824
 8ETszD+JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYyvSEgAKCRCJcvTf3G3AJs8VD/
 9DiU++7/Ux07qrQmKcm2ezAAgh30rdqxKBsQKDrEL5EOX43CK7LgkmIf5KQ4kOjg1Ex2RxD6Yv+Dfu
 IDElH/EKSC/tRs1m4xC3h+q+7SbPjgQtmT9a1i7nnOlBSJqcbBqgQZ+Hespu169Fv7Hx8O+weK7bWC
 muvsyI9vTnW0JpI1rPfLOOuKjJ9sJYhk/W394UUvBZ4qMgXFE8aIbG8xv2R7+NixPSkSyQ6b4Is/W/
 uWoVPoWJ3Ls+LdnmTnJk6b/E3AYpCLPbBzVShs8FTktYCaTY3VT44AcqfR9kRa2oc56ACWEfbkOpGV
 9Gdqub12EZ8F5YMvtWlggw8p51Y10wSTZMspf3mp9LrJ+nx5uZjuzI1PVjfwxQXMRJgEhTkhCDDSuv
 m+dzcrKowiJxgMAkwOeKwQ8qujiIBEiZUXYyh+XMBd6lv3eqaKtmbfVjheVmcOKPdIHpDXFeAi2TKg
 8ifxHByFdWEpvyMobgH17zpUhVJO9SadJqpr6eeqxOjE1ZoxhVgQ9O5qvP+z593Jj9IcW1wAszLbTk
 gH9xXpGnAHbvxSgL9fcZE1eSRiJ5TlYNZ/k5Pg37qUzVRuuybsmEFKzLhX1Uy/JT/L3Q8EfXaLuynn
 pjk6/2IqlrRV1hBXe63De0ndNRPpfun/+iA/10deHRQwZNQRHdL3HARlGZMA==
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
Cc: linux-wireless@vger.kernel.org, Jacob Shin <jacob.shin@amd.com>,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, dev@openvswitch.org, x86@kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 intel-wired-lan@lists.osuosl.org, David Rientjes <rientjes@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Yonghong Song <yhs@fb.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Josef Bacik <josef@toxicpanda.com>, linaro-mm-sig@lists.linaro.org,
 Jakub Kicinski <kuba@kernel.org>, David Sterba <dsterba@suse.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, Alex Elder <elder@kernel.org>,
 netdev@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Pekka Enberg <penberg@kernel.org>, Daniel Micay <danielmicay@gmail.com>,
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
 net/core/skbuff.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 974bbbbe7138..4fe4c7544c1d 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -427,14 +427,15 @@ struct sk_buff *__alloc_skb(unsigned int size, gfp_t gfp_mask,
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
+	osize = kmalloc_size_roundup(size);
+	data = kmalloc_reserve(osize, gfp_mask, node, &pfmemalloc);
+	if (unlikely(!data))
+		goto nodata;
 	size = SKB_WITH_OVERHEAD(osize);
 	prefetchw(data + size);
 
@@ -1709,6 +1710,7 @@ int pskb_expand_head(struct sk_buff *skb, int nhead, int ntail,
 {
 	int i, osize = skb_end_offset(skb);
 	int size = osize + nhead + ntail;
+	int alloc_size;
 	long off;
 	u8 *data;
 
@@ -1722,11 +1724,11 @@ int pskb_expand_head(struct sk_buff *skb, int nhead, int ntail,
 
 	if (skb_pfmemalloc(skb))
 		gfp_mask |= __GFP_MEMALLOC;
-	data = kmalloc_reserve(size + SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
-			       gfp_mask, NUMA_NO_NODE, NULL);
+	alloc_size = kmalloc_size_roundup(size + SKB_DATA_ALIGN(sizeof(struct skb_shared_info)));
+	data = kmalloc_reserve(alloc_size, gfp_mask, NUMA_NO_NODE, NULL);
 	if (!data)
 		goto nodata;
-	size = SKB_WITH_OVERHEAD(ksize(data));
+	size = SKB_WITH_OVERHEAD(alloc_size);
 
 	/* Copy only real data... and, alas, header. This should be
 	 * optimized for the cases when header is void.
@@ -6063,19 +6065,19 @@ static int pskb_carve_inside_header(struct sk_buff *skb, const u32 off,
 	int i;
 	int size = skb_end_offset(skb);
 	int new_hlen = headlen - off;
+	int alloc_size;
 	u8 *data;
 
 	size = SKB_DATA_ALIGN(size);
 
 	if (skb_pfmemalloc(skb))
 		gfp_mask |= __GFP_MEMALLOC;
-	data = kmalloc_reserve(size +
-			       SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
-			       gfp_mask, NUMA_NO_NODE, NULL);
+	alloc_size = kmalloc_size_roundup(size + SKB_DATA_ALIGN(sizeof(struct skb_shared_info)));
+	data = kmalloc_reserve(alloc_size, gfp_mask, NUMA_NO_NODE, NULL);
 	if (!data)
 		return -ENOMEM;
 
-	size = SKB_WITH_OVERHEAD(ksize(data));
+	size = SKB_WITH_OVERHEAD(alloc_size);
 
 	/* Copy real data, and all frags */
 	skb_copy_from_linear_data_offset(skb, off, data, new_hlen);
@@ -6184,18 +6186,18 @@ static int pskb_carve_inside_nonlinear(struct sk_buff *skb, const u32 off,
 	u8 *data;
 	const int nfrags = skb_shinfo(skb)->nr_frags;
 	struct skb_shared_info *shinfo;
+	int alloc_size;
 
 	size = SKB_DATA_ALIGN(size);
 
 	if (skb_pfmemalloc(skb))
 		gfp_mask |= __GFP_MEMALLOC;
-	data = kmalloc_reserve(size +
-			       SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
-			       gfp_mask, NUMA_NO_NODE, NULL);
+	alloc_size = kmalloc_size_roundup(size + SKB_DATA_ALIGN(sizeof(struct skb_shared_info)));
+	data = kmalloc_reserve(alloc_size, gfp_mask, NUMA_NO_NODE, NULL);
 	if (!data)
 		return -ENOMEM;
 
-	size = SKB_WITH_OVERHEAD(ksize(data));
+	size = SKB_WITH_OVERHEAD(alloc_size);
 
 	memcpy((struct skb_shared_info *)(data + size),
 	       skb_shinfo(skb), offsetof(struct skb_shared_info, frags[0]));
-- 
2.34.1

