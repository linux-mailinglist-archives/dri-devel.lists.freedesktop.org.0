Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45818737976
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 05:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070C910E3A8;
	Wed, 21 Jun 2023 03:03:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D222210E3A8
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 03:03:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3139160E9A;
 Wed, 21 Jun 2023 03:03:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03ACC433C8;
 Wed, 21 Jun 2023 03:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687316588;
 bh=w2ndax/dIn8hHqRy2GYj3R5SQpIQobIRN1xdBilDOAM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ulEKOqncD0TzcZAJbJ/bKEu3UGhtRJ68LnvzU2rdEgAlY4m2qNoaukYimvt50gHTL
 mR9TVB/BQ1gQwEITI57SurXEBr+om25sVGUA5lDNZxM5BUezSNGWOhR1lsaKCFiXBb
 PrSZsFQ852f+SitMqZ5GqufLr6KTa6SPGUIze1w4FqWNeNQubVC9S731GYSTIlzu0p
 mZNgRmCpom3RU42zpSaSk880Fx9isrnlM8jPvO4NkEApP06FjkowmrStJoXq2LUUGd
 1Wn9tp7cn2Smqi9wTcknL8yOytiUNYz5yr/oi7ivAbsVyGp3SAW+fWbm7CbN1zZHSm
 bM+7GXzA9YHAQ==
Date: Tue, 20 Jun 2023 20:03:06 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Justin Chen <justin.chen@broadcom.com>
Subject: Re: [PATCH net-next v8 03/11] net: bcmasp: Add support for ASP2.0
 Ethernet controller
Message-ID: <20230620200306.48781299@kernel.org>
In-Reply-To: <1686953664-17498-4-git-send-email-justin.chen@broadcom.com>
References: <1686953664-17498-1-git-send-email-justin.chen@broadcom.com>
 <1686953664-17498-4-git-send-email-justin.chen@broadcom.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, opendmb@gmail.com,
 florian.fainelli@broadcom.com, andrew@lunn.ch, netdev@vger.kernel.org,
 richardcochran@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux@armlinux.org.uk, edumazet@google.com,
 robh+dt@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 krzysztof.kozlowski+dt@linaro.org, simon.horman@corigine.com,
 christian.koenig@amd.com, pabeni@redhat.com, sumit.semwal@linaro.org,
 davem@davemloft.net, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 16 Jun 2023 15:14:16 -0700 Justin Chen wrote:
> Add support for the Broadcom ASP 2.0 Ethernet controller which is first
> introduced with 72165. This controller features two distinct Ethernet
> ports that can be independently operated.

First of all - thanks for splitting the patches up.
This one is still a bit big but much better and good enough.

> +	/* Probe each interface (Initialization should continue even if
> +	 * interfaces are unable to come up)
> +	 */
> +	i = 0;
> +	for_each_available_child_of_node(ports_node, intf_node) {
> +		priv->intfs[i] = bcmasp_interface_create(priv, intf_node, i);
> +		i++;
> +	}
> +
> +	/* Drop the clock reference count now and let ndo_open()/ndo_close()
> +	 * manage it for us from now on.
> +	 */
> +	bcmasp_core_clock_set(priv, 0, ASP_CTRL_CLOCK_CTRL_ASP_ALL_DISABLE);
> +
> +	clk_disable_unprepare(priv->clk);
> +
> +	/* Now do the registration of the network ports which will take care
> +	 * of managing the clock properly.
> +	 */
> +	for (i = 0; i < priv->intf_count; i++) {
> +		intf = priv->intfs[i];
> +		if (!intf)
> +			continue;
> +
> +		ret = register_netdev(intf->ndev);
> +		if (ret) {
> +			netdev_err(intf->ndev,
> +				   "failed to register net_device: %d\n", ret);
> +			bcmasp_interface_destroy(intf, false);
> +			continue;

Did you mean to clear the priv->intfs[i] pointer after destroy?
Otherwise remove will try to free it again.

> +		}
> +		count++;
> +	}
> +
> +	dev_info(dev, "Initialized %d port(s)\n", count);
> +
> +of_put_exit:
> +	of_node_put(ports_node);
> +	return ret;

And in case the last register_netdev() fails .probe will return an
error, meaning that .remove will never get called.

Why are you trying to gracefully handle the case where only some ports
were registered? It's error prone, why not fail probe if any netdev
fails to register?

> +}
> +
> +static int bcmasp_remove(struct platform_device *pdev)
> +{
> +	struct bcmasp_priv *priv = dev_get_drvdata(&pdev->dev);
> +	struct bcmasp_intf *intf;
> +	int i;
> +

since .shutdown is defined this callback should probably clear the priv
pointer and check whether priv != NULL before proceeding. It's a bit
unclear whether both .remove and .shutdown may get called for the same
device..

> +	for (i = 0; i < priv->intf_count; i++) {
> +		intf = priv->intfs[i];
> +		if (!intf)
> +			continue;
> +
> +		bcmasp_interface_destroy(intf, true);
> +	}
> +
> +	return 0;
> +}

> +MODULE_AUTHOR("Broadcom");

Companies cannot be authors. MODULE_AUTHOR() is not required,
you can drop it if you don't want to put your name there.

> +	if (unlikely(skb_headroom(skb) < sizeof(*offload))) {
> +		new_skb = skb_realloc_headroom(skb, sizeof(*offload));

That's not right, you can't push to an tx skb just because there's
headroom. Use skb_cow_head().

> +	if (tx_spb_ring_full(intf, nr_frags + 1)) {
> +		netif_stop_queue(dev);
> +		netdev_err(dev, "Tx Ring Full!\n");

rate limit this one, please

> +		/* Calculate virt addr by offsetting from physical addr */
> +		data = intf->rx_ring_cpu +
> +			(DESC_ADDR(desc->buf) - intf->rx_ring_dma);
> +
> +		flags = DESC_FLAGS(desc->buf);
> +		if (unlikely(flags & (DESC_CRC_ERR | DESC_RX_SYM_ERR))) {
> +			netif_err(intf, rx_status, intf->ndev, "flags=0x%llx\n",
> +				  flags);

ditto

> +			u64_stats_update_begin(&stats->syncp);
> +			if (flags & DESC_CRC_ERR)
> +				u64_stats_inc(&stats->rx_crc_errs);
> +			if (flags & DESC_RX_SYM_ERR)
> +				u64_stats_inc(&stats->rx_sym_errs);
> +			u64_stats_inc(&stats->rx_dropped);

Not right, please see the documentation on struct rtnl_link_stats64
These are errors not drops. Please read that comment and double
check all your stats.

> +			u64_stats_update_end(&stats->syncp);
> +
> +			goto next;
> +		}
> +
> +		dma_sync_single_for_cpu(kdev, DESC_ADDR(desc->buf), desc->size,
> +					DMA_FROM_DEVICE);
> +
> +		len = desc->size;
> +
> +		skb = __netdev_alloc_skb(intf->ndev, len,
> +					 GFP_ATOMIC | __GFP_NOWARN);

maybe napi_alloc_skb()? 

> +		if (!skb) {
> +			u64_stats_update_begin(&stats->syncp);
> +			u64_stats_inc(&stats->rx_errors);
> +			u64_stats_update_end(&stats->syncp);
> +
> +			netif_warn(intf, rx_err, intf->ndev,
> +				   "SKB alloc failed\n");

error counter is enough for allocations, OOMs are common

> +			goto next;
> +		}

-- 
pw-bot: cr
