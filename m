Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9DB89E73E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 02:49:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFE311304F;
	Wed, 10 Apr 2024 00:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="N8L5XQ7U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B77010EF0D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 00:49:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D0275CE2444;
 Wed, 10 Apr 2024 00:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 246CAC433F1;
 Wed, 10 Apr 2024 00:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712710170;
 bh=4dQCSPVGdX7rBPcNynyhRW6/uaF2WhuiAp6auxw113o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=N8L5XQ7Uyt1p7D86PM0X9FaE6vHZHDfNfuH9YFuO+/Jv+9nv0C8w2nqJoGRT5rWu8
 j9BBJDcdPfGXM1lFTqzgL/VqFo1kuEcQFTHzbOJhPlyXc+ZiRpTQDK7XOFDQynMD7Y
 cIH3sJPdfzwxouZTNEZN85j5odVTZPHNHqnG4NJHQCrYf4v86s+FxIe0Z2htkcO80N
 hlOGZqLDF6eCcf0jGutD0n3JVP4DVNhd/gwuzZlV2h5qr7I809K7D9AGFj8ASa6uFL
 Reh8saRGPvMjhqmzqhPTLpvcqEf2S2pVFao+QbNSfqtRvHU5lD4/2xyVvI2ci1kier
 OwSq0tEYCqMUw==
Date: Tue, 9 Apr 2024 17:49:28 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Julien Panis <jpanis@baylibre.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell King
 <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>, Ratheesh Kannoth <rkannoth@marvell.com>, Naveen
 Mamindlapalli <naveenm@marvell.com>, danishanwar@ti.com,
 yuehaibing@huawei.com, rogerq@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH net-next v8 3/3] net: ethernet: ti: am65-cpsw: Add
 minimal XDP support
Message-ID: <20240409174928.58a7c3f0@kernel.org>
In-Reply-To: <20240223-am65-cpsw-xdp-basic-v8-3-f3421b58da09@baylibre.com>
References: <20240223-am65-cpsw-xdp-basic-v8-0-f3421b58da09@baylibre.com>
 <20240223-am65-cpsw-xdp-basic-v8-3-f3421b58da09@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 08 Apr 2024 11:38:04 +0200 Julien Panis wrote:
> +static struct sk_buff *am65_cpsw_alloc_skb(struct am65_cpsw_rx_chn *rx_chn,
> +					   struct net_device *ndev,
> +					   unsigned int len,
> +					   int desc_idx,
> +					   bool allow_direct)
> +{
> +	struct sk_buff *skb;
> +	struct page *page;
> +
> +	page = page_pool_dev_alloc_pages(rx_chn->page_pool);
> +	if (unlikely(!page))
> +		return NULL;
> +
> +	len += AM65_CPSW_HEADROOM;
> +
> +	skb = build_skb(page_address(page), len);

You shouldn't build the skb upfront any more. Give the page to the HW,
once HW sends you a completion - build the skbs. If build fails
(allocation failure) just give the page back to HW. If it succeeds,
however, you'll get a skb which is far more likely to be cache hot.

> +	if (unlikely(!skb)) {
> +		page_pool_put_full_page(rx_chn->page_pool, page, allow_direct);
> +		rx_chn->pages[desc_idx] = NULL;
> +		return NULL;
> +	}
