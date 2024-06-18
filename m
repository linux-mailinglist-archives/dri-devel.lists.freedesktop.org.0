Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D5A90D44C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 16:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5986C10E69D;
	Tue, 18 Jun 2024 14:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="f3eCBtfs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B0210E69D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 14:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=IHXESVOig3NejZU/7dMNNwP07/UkNvAaj6tfPl9/fTE=; b=f3eCBtfs/bOAxsDjHm9VlWP9Sn
 TpC6H58PuGIr5tLpWhsB8V9KDNXUOJL6bWZfwheAD13A5GsOeiUFOcrA4Rb4vxh8Ah9IqHnB6/y9K
 jpM72PKyeV2QDcEZEJw7/KAJ79slcHpHfxBJ9ugGMa/vL2g6InR1ZWcHp+mruhgE9Cl0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sJZfq-000Nq5-Cj; Tue, 18 Jun 2024 16:19:02 +0200
Date: Tue, 18 Jun 2024 16:19:02 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Omer Shpigelman <oshpigelman@habana.ai>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Message-ID: <621d4891-36d7-48c6-bdd8-2f3ca06a23f6@lunn.ch>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-10-oshpigelman@habana.ai>
 <10902044-fb02-4328-bf88-0b386ee51c78@lunn.ch>
 <bddb69c3-511b-4385-a67d-903e910a8b51@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bddb69c3-511b-4385-a67d-903e910a8b51@habana.ai>
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

> >> +static u32 hbl_en_get_mtu(struct hbl_aux_dev *aux_dev, u32 port_idx)
> >> +{
> >> +     struct hbl_en_port *port = HBL_EN_PORT(aux_dev, port_idx);
> >> +     struct net_device *ndev = port->ndev;
> >> +     u32 mtu;
> >> +
> >> +     if (atomic_cmpxchg(&port->in_reset, 0, 1)) {
> >> +             netdev_err(ndev, "port is in reset, can't get MTU\n");
> >> +             return 0;
> >> +     }
> >> +
> >> +     mtu = ndev->mtu;
> > 
> > I think you need a better error message. All this does is access
> > ndev->mtu. What does it matter if the port is in reset? You don't
> > access it.
> > 
> 
> This function is called from the CN driver to get the current MTU in order
> to configure it to the HW, for exmaple when configuring an IB QP. The MTU
> value might be changed by user while we execute this function.

Change of MTU will happen while holding RTNL. Why not simply hold RTNL
while programming the hardware? That is the normal pattern for MAC
drivers.

> >> +static int hbl_en_change_mtu(struct net_device *netdev, int new_mtu)
> >> +{
> >> +     struct hbl_en_port *port = hbl_netdev_priv(netdev);
> >> +     int rc = 0;
> >> +
> >> +     if (atomic_cmpxchg(&port->in_reset, 0, 1)) {
> >> +             netdev_err(netdev, "port is in reset, can't change MTU\n");
> >> +             return -EBUSY;
> >> +     }
> >> +
> >> +     if (netif_running(port->ndev)) {
> >> +             hbl_en_port_close(port);
> >> +
> >> +             /* Sleep in order to let obsolete events to be dropped before re-opening the port */
> >> +             msleep(20);
> >> +
> >> +             netdev->mtu = new_mtu;
> >> +
> >> +             rc = hbl_en_port_open(port);
> >> +             if (rc)
> >> +                     netdev_err(netdev, "Failed to reinit port for MTU change, rc %d\n", rc);
> > 
> > Does that mean the port is FUBAR?
> > 
> > Most operations like this are expected to roll back to the previous
> > working configuration on failure. So if changing the MTU requires new
> > buffers in your ring, you should first allocate the new buffers, then
> > free the old buffers, so that if allocation fails, you still have
> > buffers, and the device can continue operating.
> > 
> 
> A failure in opening a port is a fatal error. It shouldn't happen. This is
> not something we wish to recover from.

What could cause open to fail? Is memory allocated?

> This kind of an error indicates a severe system error that will usually
> require a driver removal and reload anyway.
> 
> >> +module_param(poll_enable, bool, 0444);
> >> +MODULE_PARM_DESC(poll_enable,
> >> +              "Enable Rx polling rather than IRQ + NAPI (0 = no, 1 = yes, default: no)");
> > 
> > Module parameters are not liked. This probably needs to go away.
> > 
> 
> I see that various vendors under net/ethernet/* use module parameters.
> Can't we add another one?

Look at the history of those module parameters. Do you see many added
in the last year? 5 years?

> >> +static int hbl_en_ethtool_get_module_info(struct net_device *ndev, struct ethtool_modinfo *modinfo)
> >> +{
> >> +     modinfo->eeprom_len = ETH_MODULE_SFF_8636_LEN;
> >> +     modinfo->type = ETH_MODULE_SFF_8636;
> > 
> > Is this an SFF, not an SFP? How else can you know what module it is
> > without doing an I2C transfer to ask the module what it is?
> > 
> 
> The current type is SFF and it is unlikely to be changed.

Well, SFF are soldered to the board, so yes, it is unlikely to
change...

Please add a comment that this is an SFF, not an SFP, so is soldered
to the board, and so it is known to be an 8636 compatible device.

> Are you referring to get_module_eeprom_by_page()? if so, then it is not
> supported by our FW, we read the entire data on device load.
> However, I can hide that behind the new API and return only the
> requested page if that's the intention.

Well, if your firmware is so limited, then you might as well stick to
the old API, and let the core do the conversion to the legacy
code. But i'm surprised you don't allow access to the temperature
sensors, received signal strength, voltages etc, which could be
exported via HWMON.

> >> +                     ethtool_link_ksettings_add_link_mode(cmd, lp_advertising, Autoneg);
> > 
> > That looks odd. Care to explain?
> > 
> 
> The HW of all of our ports supports autoneg.
> But in addition, the ports are divided to two groups:
> internal: ports which are connected to other Gaudi2 ports in the same server.
> external: ports which are connected to an external switch.
> Only internal ports use autoneg.
> The ports mask which sets each port as internal/external is fetched from
> the FW on device load.

That is not what i meant. lc_advertising should indicate the link
modes the peer is advertising. If this was a copper link, it typically
would contain 10BaseT-Half, 10BaseT-Full, 100BaseT-Half,
100BaseT-Full, 1000BaseT-Half. Setting the Autoneg bit is pointless,
since the peer must be advertising in order that lp_advertising has a
value!

> Our HW supports Pause frames.
> But, PFC can be disabled via lldptool for exmaple, so we won't advertise
> it.

Please also implement the standard netdev way of configuring pause.
When you do that, you should start to understand how pause can be
negotiated, or forced. That is what most get wrong.

> I'll try to find more info about it, but can you please share what's wrong
> with the curent code?
> BTW I will change it to Asym_Pause as we support Tx pause frames as well.
> 
> >> +     if (auto_neg && !(hdev->auto_neg_mask & BIT(port_idx))) {
> >> +             netdev_err(port->ndev, "port autoneg is disabled by BMC\n");
> >> +             rc = -EFAULT;
> >> +             goto out;
> > 
> > Don't say you support autoneg in supported if that is the case.
> > 
> > And EFAULT is about memory problems. EINVAL, maybe EPERM? or
> > EOPNOTSUPP.
> > 
> >         Andrew
> 
> Yeah, should be switched to EPERM/EOPNOTSUPP.
> Regarding the support of autoneg - the HW supports autoneg but it might be
> disabled by the FW. Hence we might not be able to switch it on.

No problem, ask the firmware what it is doing, and return the reality
in ksetting. Only say you support autoneg if your firmware allows you
to perform autoneg.

   Andrew

