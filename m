Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B0D711E91
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 05:55:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7847410E1AD;
	Fri, 26 May 2023 03:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D9510E1AD
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 03:54:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C7C4360C2B;
 Fri, 26 May 2023 03:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F786C433EF;
 Fri, 26 May 2023 03:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685073296;
 bh=BHY/pfIw2hUuaTnVESEiRxkn2QmMt7VyZTxiw2ST2/4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jo9QPA6rqq5KvmK2DyY2+wTV9OlRByScL9JF5u8QW4rzmCAD4VQJcrWWfwJUvaWdm
 bYKtT0u9TYP1uKYIOB1ujIiE/a3eYHYMmFOB9WALy4cqxNsbERAzE28Flrsfv16jjO
 /zAE2nBsXCa/QvVQEp+Zo4S5cAGiHzZE1B38Tl2os8CMZpYUBxH4ITmFk9iIE6188W
 dJ2YXTGIwV5kzov+ja1FldTeR6eG4aAVXdqdiGPmlPfUBjniwEO//sHB9xUqdSkY2y
 6s2sK1klCz3dbbXJOpSXvFvpAqByGjsp8L1yTqb/hzkAu6OOXDNyGtCcS9igSBWH7M
 p2/yarnzgRwGg==
Date: Thu, 25 May 2023 20:54:54 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Justin Chen <justin.chen@broadcom.com>
Subject: Re: [PATCH net-next v5 3/6] net: bcmasp: Add support for ASP2.0
 Ethernet controller
Message-ID: <20230525205454.1c766852@kernel.org>
In-Reply-To: <1684969313-35503-4-git-send-email-justin.chen@broadcom.com>
References: <1684969313-35503-1-git-send-email-justin.chen@broadcom.com>
 <1684969313-35503-4-git-send-email-justin.chen@broadcom.com>
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

On Wed, 24 May 2023 16:01:50 -0700 Justin Chen wrote:
> Add support for the Broadcom ASP 2.0 Ethernet controller which is first
> introduced with 72165. This controller features two distinct Ethernet
> ports that can be independently operated.
> 
> This patch supports:
> 
> - Wake-on-LAN using magic packets
> - basic ethtool operations (link, counters, message level)
> - MAC destination address filtering (promiscuous, ALL_MULTI, etc.)

> +static netdev_tx_t bcmasp_xmit(struct sk_buff *skb, struct net_device *dev)
> +{
> +	struct bcmasp_intf *intf = netdev_priv(dev);
> +	int spb_index, nr_frags, ret, i, j;
> +	unsigned int total_bytes, size;
> +	struct bcmasp_tx_cb *txcb;
> +	dma_addr_t mapping, valid;
> +	struct bcmasp_desc *desc;
> +	bool csum_hw = false;
> +	struct device *kdev;
> +	skb_frag_t *frag;
> +
> +	kdev = &intf->parent->pdev->dev;
> +
> +	spin_lock(&intf->tx_lock);

What is the tx_lock for? netdevs already have a tx lock, unless you
declare the device as lockless.

> +static void bcmasp_tx_timeout(struct net_device *dev, unsigned int txqueue)
> +{
> +	struct bcmasp_intf *intf = netdev_priv(dev);
> +
> +	netif_dbg(intf, tx_err, dev, "transmit timeout!\n");
> +
> +	netif_trans_update(dev);
> +	dev->stats.tx_errors++;
> +
> +	netif_wake_queue(dev);

If the queue is full xmit will just put it back to sleep.
You want to try to reap completions if anything, no?

> +static struct net_device_stats *bcmasp_get_stats(struct net_device *dev)
> +{
> +	return &dev->stats;
> +}

you don't have to do this, core will use device stats if there's no ndo

> +	ndev = alloc_etherdev(sizeof(struct bcmasp_intf));
> +	if (!dev) {

*blink* condition is typo'ed

> +		dev_warn(dev, "%s: unable to alloc ndev\n", ndev_dn->name);
> +		goto err;
> +	}

-- 
pw-bot: cr
