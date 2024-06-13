Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 321AF907E4E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 23:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DAD910EBBC;
	Thu, 13 Jun 2024 21:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="3EnM92Rk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A51D10EBBC
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 21:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=2tgawcyxp7e6LF/gNJHmG9oPpwqaaAvXUh9+M7UWf7c=; b=3EnM92Rk7DmDJc+RAa3EiMUH1m
 hHpvDI0GQPzxsTAWddB2Q20QiDM/mMCPCPtKzRZ1hi+4tCZ+WoImbaFDu5RTREUPfcIN6iStA3T9J
 /pA8sqcDg0PcH5KpLpk6yqSMBIufj7NfpabiOrUoHNLerqkOxh/pkPonVcnEdcTsWSVk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sHsK5-0000ZS-5O; Thu, 13 Jun 2024 23:49:33 +0200
Date: Thu, 13 Jun 2024 23:49:33 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Omer Shpigelman <oshpigelman@habana.ai>
Cc: linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ogabbay@kernel.org, zyehudai@habana.ai
Subject: Re: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Message-ID: <10902044-fb02-4328-bf88-0b386ee51c78@lunn.ch>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-10-oshpigelman@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613082208.1439968-10-oshpigelman@habana.ai>
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

> +static int hbl_en_napi_poll(struct napi_struct *napi, int budget);
> +static int hbl_en_port_open(struct hbl_en_port *port);

When you do the Intel internal review, i expect this is crop up. No
forward declarations please. Put the code in the right order so they
are not needed.

> +static int hbl_en_get_src_ip(struct hbl_aux_dev *aux_dev, u32 port_idx, u32 *src_ip)
> +{
> +	struct hbl_en_port *port = HBL_EN_PORT(aux_dev, port_idx);
> +	struct net_device *ndev = port->ndev;
> +	struct in_device *in_dev;
> +	struct in_ifaddr *ifa;
> +	int rc = 0;
> +
> +	/* for the case where no src IP is configured */
> +	*src_ip = 0;
> +
> +	/* rtnl lock should be acquired in relevant flows before taking configuration lock */
> +	if (!rtnl_is_locked()) {
> +		netdev_err(port->ndev, "Rtnl lock is not acquired, can't proceed\n");
> +		rc = -EFAULT;
> +		goto out;
> +	}

You will find all other drivers just do:

	ASSERT_RTNL().

If your locking is broken, you are probably dead anyway, so you might
as well keep going and try to explode in the most interesting way
possible.

> +static void hbl_en_reset_stats(struct hbl_aux_dev *aux_dev, u32 port_idx)
> +{
> +	struct hbl_en_port *port = HBL_EN_PORT(aux_dev, port_idx);
> +
> +	port->net_stats.rx_packets = 0;
> +	port->net_stats.tx_packets = 0;
> +	port->net_stats.rx_bytes = 0;
> +	port->net_stats.tx_bytes = 0;
> +	port->net_stats.tx_errors = 0;
> +	atomic64_set(&port->net_stats.rx_dropped, 0);
> +	atomic64_set(&port->net_stats.tx_dropped, 0);

Why atomic64_set? Atomics are expensive, so you should not be using
them. netdev has other cheaper methods, which other Intel developers
should be happy to tell you all about.

> +static u32 hbl_en_get_mtu(struct hbl_aux_dev *aux_dev, u32 port_idx)
> +{
> +	struct hbl_en_port *port = HBL_EN_PORT(aux_dev, port_idx);
> +	struct net_device *ndev = port->ndev;
> +	u32 mtu;
> +
> +	if (atomic_cmpxchg(&port->in_reset, 0, 1)) {
> +		netdev_err(ndev, "port is in reset, can't get MTU\n");
> +		return 0;
> +	}
> +
> +	mtu = ndev->mtu;

I think you need a better error message. All this does is access
ndev->mtu. What does it matter if the port is in reset? You don't
access it.

> +static int hbl_en_close(struct net_device *netdev)
> +{
> +	struct hbl_en_port *port = hbl_netdev_priv(netdev);
> +	struct hbl_en_device *hdev = port->hdev;
> +	ktime_t timeout;
> +
> +	/* Looks like the return value of this function is not checked, so we can't just return
> +	 * EBUSY if the port is under reset. We need to wait until the reset is finished and then
> +	 * close the port. Otherwise the netdev will set the port as closed although port_close()
> +	 * wasn't called. Only if we waited long enough and the reset hasn't finished, we can return
> +	 * an error without actually closing the port as it is a fatal flow anyway.
> +	 */
> +	timeout = ktime_add_ms(ktime_get(), PORT_RESET_TIMEOUT_MSEC);
> +	while (atomic_cmpxchg(&port->in_reset, 0, 1)) {
> +		/* If this is called from unregister_netdev() then the port was already closed and
> +		 * hence we can safely return.
> +		 * We could have just check the port_open boolean, but that might hide some future
> +		 * bugs. Hence it is better to use a dedicated flag for that.
> +		 */
> +		if (READ_ONCE(hdev->in_teardown))
> +			return 0;
> +
> +		usleep_range(50, 200);
> +		if (ktime_compare(ktime_get(), timeout) > 0) {
> +			netdev_crit(netdev,
> +				    "Timeout while waiting for port to finish reset, can't close it\n"
> +				    );
> +			return -EBUSY;
> +		}

This has the usual bug. Please look at include/linux/iopoll.h. 

> +		timeout = ktime_add_ms(ktime_get(), PORT_RESET_TIMEOUT_MSEC);
> +		while (atomic_cmpxchg(&port->in_reset, 0, 1)) {
> +			usleep_range(50, 200);
> +			if (ktime_compare(ktime_get(), timeout) > 0) {
> +				netdev_crit(port->ndev,
> +					    "Timeout while waiting for port %d to finish reset\n",
> +					    port->idx);
> +				break;
> +			}
> +		}

and again. Don't roll your own timeout loops like this, use the core
version.

> +static int hbl_en_change_mtu(struct net_device *netdev, int new_mtu)
> +{
> +	struct hbl_en_port *port = hbl_netdev_priv(netdev);
> +	int rc = 0;
> +
> +	if (atomic_cmpxchg(&port->in_reset, 0, 1)) {
> +		netdev_err(netdev, "port is in reset, can't change MTU\n");
> +		return -EBUSY;
> +	}
> +
> +	if (netif_running(port->ndev)) {
> +		hbl_en_port_close(port);
> +
> +		/* Sleep in order to let obsolete events to be dropped before re-opening the port */
> +		msleep(20);
> +
> +		netdev->mtu = new_mtu;
> +
> +		rc = hbl_en_port_open(port);
> +		if (rc)
> +			netdev_err(netdev, "Failed to reinit port for MTU change, rc %d\n", rc);

Does that mean the port is FUBAR?

Most operations like this are expected to roll back to the previous
working configuration on failure. So if changing the MTU requires new
buffers in your ring, you should first allocate the new buffers, then
free the old buffers, so that if allocation fails, you still have
buffers, and the device can continue operating.

> +module_param(poll_enable, bool, 0444);
> +MODULE_PARM_DESC(poll_enable,
> +		 "Enable Rx polling rather than IRQ + NAPI (0 = no, 1 = yes, default: no)");

Module parameters are not liked. This probably needs to go away.

> +static int hbl_en_ethtool_get_module_info(struct net_device *ndev, struct ethtool_modinfo *modinfo)
> +{
> +	modinfo->eeprom_len = ETH_MODULE_SFF_8636_LEN;
> +	modinfo->type = ETH_MODULE_SFF_8636;

Is this an SFF, not an SFP? How else can you know what module it is
without doing an I2C transfer to ask the module what it is?

> +static int hbl_en_ethtool_get_module_eeprom(struct net_device *ndev, struct ethtool_eeprom *ee,
> +					    u8 *data)
> +{

This is the old API. Please update to the new API so there is access
to all the pages of the SFF/SFP.

> +static int hbl_en_ethtool_get_link_ksettings(struct net_device *ndev,
> +					     struct ethtool_link_ksettings *cmd)
> +{
> +	struct hbl_en_aux_ops *aux_ops;
> +	struct hbl_aux_dev *aux_dev;
> +	struct hbl_en_device *hdev;
> +	struct hbl_en_port *port;
> +	u32 port_idx, speed;
> +
> +	port = hbl_netdev_priv(ndev);
> +	hdev = port->hdev;
> +	port_idx = port->idx;
> +	aux_dev = hdev->aux_dev;
> +	aux_ops = aux_dev->aux_ops;
> +	speed = aux_ops->get_speed(aux_dev, port_idx);
> +
> +	cmd->base.speed = speed;
> +	cmd->base.duplex = DUPLEX_FULL;
> +
> +	ethtool_link_ksettings_zero_link_mode(cmd, supported);
> +	ethtool_link_ksettings_zero_link_mode(cmd, advertising);
> +
> +	switch (speed) {
> +	case SPEED_100000:
> +		ethtool_link_ksettings_add_link_mode(cmd, supported, 100000baseCR4_Full);
> +		ethtool_link_ksettings_add_link_mode(cmd, supported, 100000baseSR4_Full);
> +		ethtool_link_ksettings_add_link_mode(cmd, supported, 100000baseKR4_Full);
> +		ethtool_link_ksettings_add_link_mode(cmd, supported, 100000baseLR4_ER4_Full);
> +
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, 100000baseCR4_Full);
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, 100000baseSR4_Full);
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, 100000baseKR4_Full);
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, 100000baseLR4_ER4_Full);
> +
> +		cmd->base.port = PORT_FIBRE;
> +
> +		ethtool_link_ksettings_add_link_mode(cmd, supported, FIBRE);
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, FIBRE);
> +
> +		ethtool_link_ksettings_add_link_mode(cmd, supported, Backplane);
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, Backplane);
> +		break;
> +	case SPEED_50000:
> +		ethtool_link_ksettings_add_link_mode(cmd, supported, 50000baseSR2_Full);
> +		ethtool_link_ksettings_add_link_mode(cmd, supported, 50000baseCR2_Full);
> +		ethtool_link_ksettings_add_link_mode(cmd, supported, 50000baseKR2_Full);
> +
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, 50000baseSR2_Full);
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, 50000baseCR2_Full);
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, 50000baseKR2_Full);
> +		break;
> +	case SPEED_25000:
> +		ethtool_link_ksettings_add_link_mode(cmd, supported, 25000baseCR_Full);
> +
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, 25000baseCR_Full);
> +		break;
> +	case SPEED_200000:
> +		ethtool_link_ksettings_add_link_mode(cmd, supported, 200000baseCR4_Full);
> +		ethtool_link_ksettings_add_link_mode(cmd, supported, 200000baseKR4_Full);
> +
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, 200000baseCR4_Full);
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, 200000baseKR4_Full);
> +		break;
> +	case SPEED_400000:
> +		ethtool_link_ksettings_add_link_mode(cmd, supported, 400000baseCR4_Full);
> +		ethtool_link_ksettings_add_link_mode(cmd, supported, 400000baseKR4_Full);
> +
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, 400000baseCR4_Full);
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, 400000baseKR4_Full);
> +		break;
> +	default:
> +		netdev_err(port->ndev, "unknown speed %d\n", speed);
> +		return -EFAULT;
> +	}
> +
> +	ethtool_link_ksettings_add_link_mode(cmd, supported, Autoneg);
> +
> +	if (port->auto_neg_enable) {
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, Autoneg);
> +		cmd->base.autoneg = AUTONEG_ENABLE;
> +		if (port->auto_neg_resolved)
> +			ethtool_link_ksettings_add_link_mode(cmd, lp_advertising, Autoneg);

That looks odd. Care to explain?

> +	} else {
> +		cmd->base.autoneg = AUTONEG_DISABLE;
> +	}
> +
> +	ethtool_link_ksettings_add_link_mode(cmd, supported, Pause);
> +
> +	if (port->pfc_enable)
> +		ethtool_link_ksettings_add_link_mode(cmd, advertising, Pause);

And is suspect that is wrong. Everybody gets pause wrong. Please
double check my previous posts about pause.

> +	if (auto_neg && !(hdev->auto_neg_mask & BIT(port_idx))) {
> +		netdev_err(port->ndev, "port autoneg is disabled by BMC\n");
> +		rc = -EFAULT;
> +		goto out;

Don't say you support autoneg in supported if that is the case.

And EFAULT is about memory problems. EINVAL, maybe EPERM? or
EOPNOTSUPP.

	Andrew
