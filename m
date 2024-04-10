Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C5689FAED
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 17:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA771133F1;
	Wed, 10 Apr 2024 15:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gXma+fnC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5822810E23A
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 15:02:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A754B61DF9;
 Wed, 10 Apr 2024 15:02:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B563C43390;
 Wed, 10 Apr 2024 15:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712761347;
 bh=IOowjB6zmv7LWIIHnvL4MTPFjatrAlEyg+PbmUZJMpc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gXma+fnCrP+8JcafhxFRa8FwqmzMRCM6LT9J47FvXt3BW8mZFWTBRpAU3xsGFCDQW
 OjWGzbMYCxYOZme9arf3D++/Dj+aAjbdfiyEcrhamdQTpGekuevl5GpW2loZwGooQK
 3f+jYvPaMLEQZ8FRE3npnk/eQiPY9X9Z+vh0zdFDOA7ZjVkL644A792E+F6KEMp51C
 5098qAjwdTTAmTriGVmyjqlxkVyi2Dljg79fZ4aISlWHf5LzbC2UwzmHbvjpUgw4dO
 Xvt2GRE9TR4FACx0cvbn8pTfnWDoxmG36K0J6sjNBr5yPAdybjZjnkXJWI8PQEmuIj
 SSHZg/INvS7bQ==
Date: Wed, 10 Apr 2024 08:02:25 -0700
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
Message-ID: <20240410080225.2e024f7c@kernel.org>
In-Reply-To: <9cb903df-3e83-409a-aa4b-218742804cc6@baylibre.com>
References: <20240223-am65-cpsw-xdp-basic-v8-0-f3421b58da09@baylibre.com>
 <20240223-am65-cpsw-xdp-basic-v8-3-f3421b58da09@baylibre.com>
 <20240409174928.58a7c3f0@kernel.org>
 <9cb903df-3e83-409a-aa4b-218742804cc6@baylibre.com>
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

On Wed, 10 Apr 2024 16:02:00 +0200 Julien Panis wrote:
> > You shouldn't build the skb upfront any more. Give the page to the HW,
> > once HW sends you a completion - build the skbs. If build fails
> > (allocation failure) just give the page back to HW. If it succeeds,
> > however, you'll get a skb which is far more likely to be cache hot.  
> 
> Not sure I get this point.
> 
> "Give the page to the HW" = Do you mean that I should dma_map_single()
> a full page (|PAGE_SIZE|) in am65_cpsw_nuss_rx_push() ?

Yes, I think so. I think that's what you effectively do now anyway,
you just limit the len and wrap it in an skb. But
am65_cpsw_nuss_rx_push() will effectively get that page back from
skb->data and map it.
