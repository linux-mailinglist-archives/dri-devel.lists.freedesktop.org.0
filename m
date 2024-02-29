Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 020AB86CF8A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 17:46:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAAEC10E4BC;
	Thu, 29 Feb 2024 16:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="1OWCIDj4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9BF10E592
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 16:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=GPdrTWWNk0hVqVfgtVA3ir8vbZUdW88VBnAsM+agQMA=; b=1OWCIDj43lnZawPBZGsVyLBAOs
 +fKb+1Di2PO1zysIwHgjYTR87lm2qb+UyjbN1+aNLlM8P4JaLzmqoF37mPvCwlh3ziC1kgXdwcnT/
 ToEJhyhiNYMe0c9bfZc+wSvOYY6vY6gyS6hF6wLii5DVxUGpguFHD1MdyqYHa4nivXi4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rfjXs-0093j8-1U; Thu, 29 Feb 2024 17:46:08 +0100
Date: Thu, 29 Feb 2024 17:46:08 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Julien Panis <jpanis@baylibre.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] net: ethernet: ti: am65-cpsw: Add minimal XDP support
Message-ID: <0ad02716-520e-41e6-ba11-38390427447f@lunn.ch>
References: <20240223-am65-cpsw-xdp-basic-v1-1-9f0b6cbda310@baylibre.com>
 <e382df16-c78a-448d-b6d5-39a627b30652@lunn.ch>
 <65250d0c-96c1-4eb0-adbf-1d3296a7cf36@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65250d0c-96c1-4eb0-adbf-1d3296a7cf36@baylibre.com>
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

On Thu, Feb 29, 2024 at 05:19:44PM +0100, Julien Panis wrote:
> On 2/27/24 00:18, Andrew Lunn wrote:
> > > +static struct sk_buff *am65_cpsw_alloc_skb(struct net_device *ndev, unsigned int len)
> > > +{
> > > +	struct page *page;
> > > +	struct sk_buff *skb;
> > > +
> > > +	page = dev_alloc_pages(0);
> > You are likely to get better performance if you use the page_pool.
> > 
> > When FEC added XDP support, the first set of changes was to make use
> > of page_pool. That improved the drivers performance. Then XDP was
> > added on top. Maybe you can follow that pattern.
> > 
> >        Andrew
> 
> Hello Andrew,
> 
> Thanks for this suggestion. I've been working on it over the last days.
> I encountered issues and I begin to wonder if that's a good option for
> this driver. Let me explain...

I'm not a page pool expert, so hopefully those that are will jump in
and help.

> This device has 3 ports:
> - Port0 is the host port (internal to the subsystem and referred as CPPI
> in the driver).
> - Port1 and 2 are the external ethernet ports.
> Each port's RX FIFO has 1 queue.
> 
> As mentioned in page_pool documentation:
> https://docs.kernel.org/networking/page_pool.html
> "The number of pools created MUST match the number of hardware
> queues unless hardware restrictions make that impossible. This would
> otherwise beat the purpose of page pool, which is allocate pages fast
> from cache without locking."

My guess is, this last bit is the important part. Locking. Do ports 1
and port 2 rx and tx run in parallel on different CPUs? Hence do you
need locking?

> So, for this driver I should use 2 page pools (for port1 and 2) if possible.

Maybe, maybe not. It is not really the number of front panel interface
which matters here. It is the number of entities which need buffers.

> But, if I I replace any alloc_skb() with page_pool_alloc() in the original
> driver, I will have to create only 1 page_pool.
> This is visible in am65_cpsw_nuss_common_open(), which starts with:
> "if (common->usage_count) return 0;" to ensure that subsequent code
> will be executed only once even if the 2 interfaces are ndo_open'd.
> IOW, skbs will be allocated for only 1 RX channel. I checked that behavior,
> and that's the way it works.

> This is because the host port (CPPI) has only 1 RX queue. This single
> queue is used to get all the packets, from both Ports and 2 (port ID is
> stored in each descriptor).

So you have one entity which needs buffers. CPPI. It seems like Port1
and Port2 do not need buffers? So to me, you need one page pool.

> So, because of this constraint, I ended up working on the "single
> page pool" option.
> 
> Questions:
> 1) Is the behavior described above usual for ethernet switch devices ?

This might be the first time page pool has been used by a switch? I
would check the melanox and sparx5 driver and see if they use page
pool.

> 2) Given that I can't use a page pool for each HW queue, is it worth
> using the page pool memory model ?

> 3) Currently I use 2 xdp_rxq (one for port1 and another one for port2).
> If an XDP program is attached to port1, my page pool dma parameter
> will need to be DMA_BIDIRECTIONAL (because of XDP_TX). As a result,
> even if there is no XDP program attached to port2, the setting for page
> pool will need to be DMA_BIDIRECTIONAL instead of DMA_FROM_DEVICE.
> In such situation, isn't it a problem for port2 ?
> 4) Because of 1) and 2), will page pool performance really be better for
> this driver ?

You probably need to explain the TX architecture a bit. How are
packets passed to the hardware? Is it again via a single CPPI entity?
Or are there two entities?

DMA_BIDIRECTIONAL and DMA_FROM_DEVICE is about cache flushing and
invalidation. Before you pass a buffer to the hardware for it to
receive into, you need to invalidate the cache. That means when the
hardware gives the buffer back with a packet in it, there is a cache
miss and it fetches the new data from memory. If that packet gets
turned into an XDP_TX, you need to flush the cache to force any
changes out of the cache and into memory. The DMA from memory then
gets the up to date packet contents.

My guess would be, always using DMA_BIDIRECTIONAL is fine, so long as
your cache operations are correct. Turn on DMA_API_DEBUG and make sure
it is happy.

     Andrew
