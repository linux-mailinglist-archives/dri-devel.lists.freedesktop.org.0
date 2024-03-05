Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A60B87201D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 14:28:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF02112AD9;
	Tue,  5 Mar 2024 13:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="fcCvJcgA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB88112ADF
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 13:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=2o5mFGZCvQCk7WKP/xRNSu+/KpBgcWlkfRQoWTuInbY=; b=fcCvJcgAkcMcQFOc4nYDR/Yzhv
 Y8IiVBCtwKjUMpOh02072azemJ8Sb6tC/SVw+f74ahwPgdczkKF8WJ9UMCYkcOVxYnaoVgZ6Z3Jwt
 iiS6/PoKPPutlUHIT5TpgkIpdugZ8H0BsYpd3BejSVa4AjBYvnRK+kDjUeDZosHHJi3Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rhUqi-009Qae-FR; Tue, 05 Mar 2024 14:28:52 +0100
Date: Tue, 5 Mar 2024 14:28:52 +0100
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
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 2/2] net: ethernet: ti: am65-cpsw: Add minimal XDP
 support
Message-ID: <be16d069-062e-489d-b8e9-19ef3ef90029@lunn.ch>
References: <20240223-am65-cpsw-xdp-basic-v2-0-01c6caacabb6@baylibre.com>
 <20240223-am65-cpsw-xdp-basic-v2-2-01c6caacabb6@baylibre.com>
 <356f4dd4-eb0e-49fa-a9eb-4dffbe5c7e7c@lunn.ch>
 <3a5f3950-e47f-409a-b881-0c8545778b91@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a5f3950-e47f-409a-b881-0c8545778b91@baylibre.com>
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

On Tue, Mar 05, 2024 at 11:46:00AM +0100, Julien Panis wrote:
> On 3/1/24 17:38, Andrew Lunn wrote:
> > On Fri, Mar 01, 2024 at 04:02:53PM +0100, Julien Panis wrote:
> > > This patch adds XDP (eXpress Data Path) support to TI AM65 CPSW
> > > Ethernet driver. The following features are implemented:
> > > - NETDEV_XDP_ACT_BASIC (XDP_PASS, XDP_TX, XDP_DROP, XDP_ABORTED)
> > > - NETDEV_XDP_ACT_REDIRECT (XDP_REDIRECT)
> > > - NETDEV_XDP_ACT_NDO_XMIT (ndo_xdp_xmit callback)
> > > 
> > > The page pool memory model is used to get better performance.
> > Do you have any benchmark numbers? It should help with none XDP
> > traffic as well. So maybe iperf numbers before and after?
> > 
> > 	Andrew
> 
> Argh...Houston, we have a problem. I checked my v3, which is ready for
> submission, with iperf3:
> 1) Before = without page pool -> 500 MBits/sec
> 2) After = with page pool -> 442 MBits/sec
> -> ~ 10% worse with page pool here.
> 
> Unless the difference is not due to page pool. Maybe there's something else
> which is not good in my patch. I'm going to send the v3 which uses page pool,
> hopefully someone will find out something suspicious. Meanwhile, I'll carry on
> investigating: I'll check the results with my patch, by removing only the using of
> page pool.

You can also go the other way. First add page pool support. For the
FEC, that improved its performance. Then add XDP, which i think
decreased the performance a little. It is extra processing in the hot
path, so a little loss is not unsurprising.

What tends to be expensive with ARM is cache invalidation and
flush. So make sure you have the lengths correct. You don't want to
operate on more memory than necessary. No point flushing the full MTU
for a 64 byte TCP ACK, etc.

      Andrew
