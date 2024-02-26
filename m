Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D70867E5F
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 18:25:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBADA10E1B6;
	Mon, 26 Feb 2024 17:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WFtUa+Tr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C3810E279
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 17:25:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 375F561281;
 Mon, 26 Feb 2024 17:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C981C433C7;
 Mon, 26 Feb 2024 17:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708968338;
 bh=hG1hhNEZQpoCC0ZUVla+4Zhhfd/60PsfYtOoSxY9E4A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WFtUa+TrJXH8XiYxqXIqG52N70tW+5ZYRHjsIo0O5vnhGk7FNNY2Xh+WZ2f0hL4xs
 QdwMS/ecbQ6bvKNeIYbyFjGh+3dyiREZ+UMz/D7hvP7rHIaUAvnikfo2OIZQcfx9k6
 lEtyTeiPFnDqvdcOMnJnNbrc67Q+XKUsnTANcEoPffEBnkokAdn8jDqb4ma6ddlywD
 3SSqb4YDjw3e/TwxNZ2F664qx/UR8Gzumtr6W42Wxivjcgi2taZx9U9KKiTqeEsPUt
 E5XH5er16+1ce2mFMVTiSPNOPA9+kmphEI/lgKYo9mUAXgxMjTxv5t+gNfwMt7Nq2f
 CidUS099rTBvA==
Date: Mon, 26 Feb 2024 17:25:33 +0000
From: Simon Horman <horms@kernel.org>
To: Julien Panis <jpanis@baylibre.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] net: ethernet: ti: am65-cpsw: Add minimal XDP support
Message-ID: <20240226172533.GG13129@kernel.org>
References: <20240223-am65-cpsw-xdp-basic-v1-1-9f0b6cbda310@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240223-am65-cpsw-xdp-basic-v1-1-9f0b6cbda310@baylibre.com>
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

On Fri, Feb 23, 2024 at 12:01:37PM +0100, Julien Panis wrote:
> This patch adds XDP (eXpress Data Path) support to TI AM65 CPSW
> Ethernet driver. The following features are implemented:
> - NETDEV_XDP_ACT_BASIC (XDP_PASS, XDP_TX, XDP_DROP, XDP_ABORTED)
> - NETDEV_XDP_ACT_REDIRECT (XDP_REDIRECT)
> - NETDEV_XDP_ACT_NDO_XMIT (ndo_xdp_xmit callback)
> 
> Signed-off-by: Julien Panis <jpanis@baylibre.com>

...

> @@ -440,6 +476,27 @@ static void am65_cpsw_nuss_tx_cleanup(void *data, dma_addr_t desc_dma)
>  	dev_kfree_skb_any(skb);
>  }
>  
> +static struct sk_buff *am65_cpsw_alloc_skb(struct net_device *ndev, unsigned int len)
> +{
> +	struct page *page;
> +	struct sk_buff *skb;

nit: please arrange local variables in reverse xmas tree order,
     from longest line to shortest in new code.

     This tool can be useful: https://github.com/ecree-solarflare/xmastree

> +
> +	page = dev_alloc_pages(0);

nit: Maybe dev_alloc_page() is appropriate here?

> +	if (unlikely(!page))
> +		return NULL;
> +
> +	len += AM65_CPSW_HEADROOM;
> +
> +	skb = build_skb(page_address(page), len);
> +	if (unlikely(!skb))

Does page need to be freed here?

> +		return NULL;
> +
> +	skb_reserve(skb, AM65_CPSW_HEADROOM + NET_IP_ALIGN);
> +	skb->dev = ndev;
> +
> +	return skb;
> +}

...
