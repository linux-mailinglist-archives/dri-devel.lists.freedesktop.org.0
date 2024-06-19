Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D605A90F3C7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 18:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4D710E150;
	Wed, 19 Jun 2024 16:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="hZtWJDV6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF65A10E107
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 16:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=QYakplpX2ykVLz/kbSetsTy/eCXPauRn2WMhcnSUh5U=; b=hZtWJDV6/74RoNLZREg3Eg1ifW
 PlUV3M2v70xab1/+k7hwo14qthUfkAdnRIm9oM5VYCQ2HEksluneVYx42N8+dg65fFRz5uE4l25sc
 0RfDFTo4S1K4SPVcQ7V0KxXnoS1psxbPKFml/pQBxXamEntMS+lN4waE5pSjd5BhSUIY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sJxwS-000U9w-Kg; Wed, 19 Jun 2024 18:13:48 +0200
Date: Wed, 19 Jun 2024 18:13:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Omer Shpigelman <oshpigelman@habana.ai>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Message-ID: <2c66dc75-b321-4980-955f-7fdcd902b578@lunn.ch>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-10-oshpigelman@habana.ai>
 <10902044-fb02-4328-bf88-0b386ee51c78@lunn.ch>
 <bddb69c3-511b-4385-a67d-903e910a8b51@habana.ai>
 <621d4891-36d7-48c6-bdd8-2f3ca06a23f6@lunn.ch>
 <45e35940-c8fc-4f6c-8429-e6681a48b889@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45e35940-c8fc-4f6c-8429-e6681a48b889@habana.ai>
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

On Wed, Jun 19, 2024 at 07:16:20AM +0000, Omer Shpigelman wrote:
> On 6/18/24 17:19, Andrew Lunn wrote:
> >>>> +static u32 hbl_en_get_mtu(struct hbl_aux_dev *aux_dev, u32 port_idx)
> >>>> +{
> >>>> +     struct hbl_en_port *port = HBL_EN_PORT(aux_dev, port_idx);
> >>>> +     struct net_device *ndev = port->ndev;
> >>>> +     u32 mtu;
> >>>> +
> >>>> +     if (atomic_cmpxchg(&port->in_reset, 0, 1)) {
> >>>> +             netdev_err(ndev, "port is in reset, can't get MTU\n");
> >>>> +             return 0;
> >>>> +     }
> >>>> +
> >>>> +     mtu = ndev->mtu;
> >>>
> >>> I think you need a better error message. All this does is access
> >>> ndev->mtu. What does it matter if the port is in reset? You don't
> >>> access it.
> >>>
> >>
> >> This function is called from the CN driver to get the current MTU in order
> >> to configure it to the HW, for exmaple when configuring an IB QP. The MTU
> >> value might be changed by user while we execute this function.
> > 
> > Change of MTU will happen while holding RTNL. Why not simply hold RTNL
> > while programming the hardware? That is the normal pattern for MAC
> > drivers.
> >
> 
> I can hold the RTNL lock while configuring the HW but it seems like a big
> overhead. Configuring the HW might take some time due to QP draining or
> cache invalidation.

How often does the MTU change? Once, maybe twice on boot, and never
again? MTU change is not hot path. For slow path code, KISS is much
better, so it is likely to be correct. 

> To me it seems unnecessary but if that's the common way then I'll change
> it.
>  
> >>>> +static int hbl_en_change_mtu(struct net_device *netdev, int new_mtu)
> >>>> +{
> >>>> +     struct hbl_en_port *port = hbl_netdev_priv(netdev);
> >>>> +     int rc = 0;
> >>>> +
> >>>> +     if (atomic_cmpxchg(&port->in_reset, 0, 1)) {
> >>>> +             netdev_err(netdev, "port is in reset, can't change MTU\n");
> >>>> +             return -EBUSY;
> >>>> +     }
> >>>> +
> >>>> +     if (netif_running(port->ndev)) {
> >>>> +             hbl_en_port_close(port);
> >>>> +
> >>>> +             /* Sleep in order to let obsolete events to be dropped before re-opening the port */
> >>>> +             msleep(20);
> >>>> +
> >>>> +             netdev->mtu = new_mtu;
> >>>> +
> >>>> +             rc = hbl_en_port_open(port);
> >>>> +             if (rc)
> >>>> +                     netdev_err(netdev, "Failed to reinit port for MTU change, rc %d\n", rc);
> >>>
> >>> Does that mean the port is FUBAR?
> >>>
> >>> Most operations like this are expected to roll back to the previous
> >>> working configuration on failure. So if changing the MTU requires new
> >>> buffers in your ring, you should first allocate the new buffers, then
> >>> free the old buffers, so that if allocation fails, you still have
> >>> buffers, and the device can continue operating.
> >>>
> >>
> >> A failure in opening a port is a fatal error. It shouldn't happen. This is
> >> not something we wish to recover from.
> > 
> > What could cause open to fail? Is memory allocated?
> > 
> 
> Memory is allocated but it is freed in case of a failure.
> Port opening can fail due to other reasons as well like some HW timeout
> while configuring the ETH QP.

If the hardware timeout because the hardware is dead, there is nothing
you can do about it. Its dead.

But what about when the system is under memory pressure? You say it
allocates memory. What happens if those allocations fail. Does
changing the MTU take me from a working system to a dead system? It is
good practice to not kill a working system under situations like
memory pressure. You try to first allocate the memory you need to
handle the new MTU, and only if successful do you free existing memory
you no longer need. That means if you cannot allocate the needed
memory, you still have the old memory, you can keep the old MTU and
return -ENOMEM, and the system keeps running.

> I didn't check that prior to my submit. Regarding this "no new module
> parameters allowed" rule, is that documented anywhere?

Lots of emails that fly passed on the mailing list. Maybe once every
couple of months when a vendor tries to mainline a new driver without
reading the mailing list for a few months to know how mainline
actually works. I _guess_ Davem has been pushing back on module
parameters for 10 years? Maybe more.


> if not, is that the
> common practice? not to try to do something that was not done recently?
> how "recently" is defined?
> I just want to clarify this because it's hard to handle these submissions
> when we write some code based on existing examples but then we are
> rejected because "we don't do that here anymore".
> I want to avoid future cases of this mismatch.

My suggestion would be to spend 30 minutes every day reading patches
and review comment on the mailing list. Avoid making the same mistakes
others make, especially newbies to mainline, and see what others are
doing in the same niche as this device. 30 minutes might seem like a
lot, but how much time did you waste implementing polling mode, now
you are going to throw it away?

> >>>> +                     ethtool_link_ksettings_add_link_mode(cmd, lp_advertising, Autoneg);
> >>>
> >>> That looks odd. Care to explain?
> >>>
> >>
> >> The HW of all of our ports supports autoneg.
> >> But in addition, the ports are divided to two groups:
> >> internal: ports which are connected to other Gaudi2 ports in the same server.
> >> external: ports which are connected to an external switch.
> >> Only internal ports use autoneg.
> >> The ports mask which sets each port as internal/external is fetched from
> >> the FW on device load.
> > 
> > That is not what i meant. lc_advertising should indicate the link
> > modes the peer is advertising. If this was a copper link, it typically
> > would contain 10BaseT-Half, 10BaseT-Full, 100BaseT-Half,
> > 100BaseT-Full, 1000BaseT-Half. Setting the Autoneg bit is pointless,
> > since the peer must be advertising in order that lp_advertising has a
> > value!
> > 
> 
> Sorry, but I don't get this. The problem is the setting of the Autoneg bit
> in lp_advertising? is that redundant? I see that other vendors set it too
> in case that Autoneg was completed.


$ ethtool eth0
Settings for eth0:
	Supported ports: [ TP	 MII ]
	Supported link modes:   10baseT/Half 10baseT/Full
	                        100baseT/Half 100baseT/Full
	                        1000baseT/Full

This is `supported`. The hardware can do these link modes.

	Supported pause frame use: Symmetric Receive-only
	Supports auto-negotiation: Yes

It also support symmetric pause, and can do autoneg.

	Supported FEC modes: Not reported
	Advertised link modes:  10baseT/Half 10baseT/Full
	                        100baseT/Half 100baseT/Full
	                        1000baseT/Full
	Advertised pause frame use: Symmetric Receive-only
	Advertised auto-negotiation: Yes
	Advertised FEC modes: Not reported

This is `advertising`, and is what this device is advertising to the
link partner. By default you copy supported into advertising, but the
user can use ethtool -s advertise N, where N is a list of link modes,
to change what is advertised to the link partner.

	Link partner advertised link modes:  10baseT/Half 10baseT/Full
	                                     100baseT/Half 100baseT/Full
	                                     1000baseT/Full
	Link partner advertised pause frame use: Symmetric
	Link partner advertised auto-negotiation: Yes
	Link partner advertised FEC modes: Not reported

This is `lp_advertising`, what the link partner is advertising to this
device. Once you have this, you mask lp_advertising with advertising,
and generally pick the link mode with the highest bandwidth:

	Speed: 1000Mb/s
	Duplex: Full

So autoneg resolved to 1000baseT/Full

	Andrew
