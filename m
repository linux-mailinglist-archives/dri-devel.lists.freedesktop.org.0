Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CC49183B7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 16:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7794C10E8C6;
	Wed, 26 Jun 2024 14:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="BJFmmQyQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD1010E8C6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 14:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=e/r3KxX+Z2Dmu1E71CISshUp48TvjeiI0ZOqnh1fVEk=; b=BJFmmQyQeuEmVErk5/QtUZe7Yh
 VUEC0/D9H3JVtFJBThg+eXVMbbm523IfUDOHxbNi4TiM0TlV7a3x+NQOCeXerCOsDd7zLoPswX/Qn
 atH0p7j8kL1fyzvhOSU3E9daj1yDFmc/MUn4ICdytOcinXApdpsLuiY01h94b1mItE6s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sMTPH-0012mx-QE; Wed, 26 Jun 2024 16:13:55 +0200
Date: Wed, 26 Jun 2024 16:13:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Omer Shpigelman <oshpigelman@habana.ai>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Message-ID: <1baf52ff-d3ce-4d3f-9655-46a1a919119b@lunn.ch>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-10-oshpigelman@habana.ai>
 <10902044-fb02-4328-bf88-0b386ee51c78@lunn.ch>
 <bddb69c3-511b-4385-a67d-903e910a8b51@habana.ai>
 <621d4891-36d7-48c6-bdd8-2f3ca06a23f6@lunn.ch>
 <45e35940-c8fc-4f6c-8429-e6681a48b889@habana.ai>
 <2c66dc75-b321-4980-955f-7fdcd902b578@lunn.ch>
 <8a534044-ab84-4722-b4e9-4390c2cc6471@habana.ai>
 <f45a71f9-640e-473a-9b80-90a50b087474@lunn.ch>
 <96677540-c288-43f6-9a47-1db79a0880eb@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96677540-c288-43f6-9a47-1db79a0880eb@habana.ai>
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

> Here is the output:
> $ ethtool eth0
> Settings for eth0:
> 	Supported ports: [ FIBRE	 Backplane ]
> 	Supported link modes:   100000baseKR4/Full
> 	                        100000baseSR4/Full
> 	                        100000baseCR4/Full
> 	                        100000baseLR4_ER4/Full
> 	Supported pause frame use: Symmetric
> 	Supports auto-negotiation: Yes
> 	Supported FEC modes: Not reported
> 	Advertised link modes:  100000baseKR4/Full
> 	                        100000baseSR4/Full
> 	                        100000baseCR4/Full
> 	                        100000baseLR4_ER4/Full
> 	Advertised pause frame use: Symmetric
> 	Advertised auto-negotiation: Yes
> 	Advertised FEC modes: Not reported
> 	Link partner advertised link modes:  Not reported
> 	Link partner advertised pause frame use: No
> 	Link partner advertised auto-negotiation: Yes
> 	Link partner advertised FEC modes: Not reported
> 	Speed: 100000Mb/s
> 	Duplex: Full
> 	Auto-negotiation: on
> 
> There are few points to mention:
> 1. We don't allow to modify the advertised link modes so by definition the
>    advertised ones are a copy of the supported ones.

So there is no way to ask it use to use 100000baseCR4/Full, for
example? You would normally change the advertised modes to just that
one link mode, and then it has no choice. It either uses
100000baseCR4/Full, or it does not establish a link.

Also, my experience with slower modules is that one supporting
2500BaseX can also support 1000BaseX. However, there is no auto-neg
defined for speeds, just pause. So if the link peer only supports
1000BaseX, you don't get link. What you typically see is:

$ ethtool eth0
Settings for eth0:
 	Supported ports: [ FIBRE	 Backplane ]
 	Supported link modes:   1000baseX
 	                        2500baseX
 	Supported pause frame use: Symmetric
 	Supports auto-negotiation: Yes
 	Supported FEC modes: Not reported
 	Advertised link modes:  2500baseX
 	Advertised pause frame use: Symmetric

and then you use ethtool to change advertising to 1000baseX and then
you get link. Can these modules support slower speeds?

> 2. Reading the peer advertised link modes is not supported so we don't
>    report them (similarly to some other vendors).

Not supported by your firmware? Or not supported by the modules?

    Andrew
