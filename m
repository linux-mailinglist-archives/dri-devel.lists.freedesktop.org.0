Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E5AC9D17F
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 22:31:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A419E10E6DC;
	Tue,  2 Dec 2025 21:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qZpOAkdr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DA210E6DC
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 21:31:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 94D566019A;
 Tue,  2 Dec 2025 21:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C88AAC4CEF1;
 Tue,  2 Dec 2025 21:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764711101;
 bh=LIsUpX46nz8hXTPl3ASkyok9wqGryCPo8iyJRm2nQFw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qZpOAkdrwJACnUdpSzBSxrBly0k1US5uT5Ymfi9n9+1mFsYFyzlLYBsIsi9UpS1mN
 fGIzYhpWlYKpBnwleO7L8b7Z0UvRdyuFsmX7ELNxfFGU7eL9RLi4+fEeTAIxaGlzDF
 SHNLcW47XrKMVLhSWJ+bNXakkZSeLRENfdA5NJijFV95B/n1n5c2FRByp4wRQO7yrV
 KW8Yf9cdElo4G89A2o3mQdHTiZusBL0Zp009LTvd1fa+4NnTbe0kVAN4/But40i6nN
 OiQF8BJKJ0giZObUop6+rMJMXMmMmiBGbGwfhnhFmtm+UKjUvqeXvM96F11YGIv0VB
 mXUpj1nq9//hQ==
Date: Tue, 2 Dec 2025 15:37:43 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>, 
 Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-wireless@vger.kernel.org, 
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, netdev@vger.kernel.org,
 mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
 vivek.pernamitta@oss.qualcomm.com
Subject: Re: [PATCH 3/4] net: mhi_net: Implement runtime PM support
Message-ID: <nj4ovttt4i7hsqfdv5zhdotxrx3upxfq4ozuligwuheubnsmkd@e6bwzgkn55kl>
References: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
 <20251201-mhi_runtimepm-v1-3-fab94399ca75@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-mhi_runtimepm-v1-3-fab94399ca75@oss.qualcomm.com>
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

On Mon, Dec 01, 2025 at 06:13:19PM +0530, Krishna Chaitanya Chundru wrote:
> Add runtime power management support to the mhi_net driver to align with
> the updated MHI framework, which expects runtime PM to be enabled by client
> drivers. This ensures the controller remains active during data transfers
> and can autosuspend when idle.

This last sentence hints at there being an actual problem with the
current code. Perhaps we do this because it's the right thing to do,
perhaps we're making this change because devices are crashing and
burning?

Start your commit message with making the reason for your change clear.

Ask yourself https://en.wikipedia.org/wiki/Five_whys when you come up
with your problem description.

> 
> The driver now uses pm_runtime_get() and pm_runtime_put() around
> transmit, receive, and buffer refill operations. Runtime PM is initialized
> during probe with autosuspend enabled and a 100ms delay. The device is
> marked with pm_runtime_no_callbacks() to notify PM framework that there
> are no callbacks for this driver.

This looks like an AI prompt, does it add value to the commit message?

It can mostly be summarized as "Implement pm_runtime in the driver". The
only part that's not obvious is the 100ms autosuspend delay, but you
skipped explaining why you did choose this number.

> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/net/mhi_net.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
> index ae169929a9d8e449b5a427993abf68e8d032fae2..c5c697f29e69e9bc874b6cfff4699de12a4af114 100644
> --- a/drivers/net/mhi_net.c
> +++ b/drivers/net/mhi_net.c
> @@ -9,6 +9,7 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/netdevice.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/skbuff.h>
>  #include <linux/u64_stats_sync.h>
>  
> @@ -76,6 +77,7 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
>  	struct mhi_device *mdev = mhi_netdev->mdev;
>  	int err;
>  
> +	pm_runtime_get(&mdev->dev);

What happened to your error handling?

Regards,
Bjorn

>  	err = mhi_queue_skb(mdev, DMA_TO_DEVICE, skb, skb->len, MHI_EOT);
>  	if (unlikely(err)) {
>  		net_err_ratelimited("%s: Failed to queue TX buf (%d)\n",
> @@ -94,6 +96,7 @@ static netdev_tx_t mhi_ndo_xmit(struct sk_buff *skb, struct net_device *ndev)
>  	u64_stats_inc(&mhi_netdev->stats.tx_dropped);
>  	u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
>  
> +	pm_runtime_put_autosuspend(&mdev->dev);
>  	return NETDEV_TX_OK;
>  }
>  
> @@ -261,6 +264,7 @@ static void mhi_net_ul_callback(struct mhi_device *mhi_dev,
>  	}
>  	u64_stats_update_end(&mhi_netdev->stats.tx_syncp);
>  
> +	pm_runtime_put_autosuspend(&mdev->dev);
>  	if (netif_queue_stopped(ndev) && !mhi_queue_is_full(mdev, DMA_TO_DEVICE))
>  		netif_wake_queue(ndev);
>  }
> @@ -277,6 +281,7 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
>  
>  	size = mhi_netdev->mru ? mhi_netdev->mru : READ_ONCE(ndev->mtu);
>  
> +	pm_runtime_get_sync(&mdev->dev);
>  	while (!mhi_queue_is_full(mdev, DMA_FROM_DEVICE)) {
>  		skb = netdev_alloc_skb(ndev, size);
>  		if (unlikely(!skb))
> @@ -296,6 +301,7 @@ static void mhi_net_rx_refill_work(struct work_struct *work)
>  		cond_resched();
>  	}
>  
> +	pm_runtime_put_autosuspend(&mdev->dev);
>  	/* If we're still starved of rx buffers, reschedule later */
>  	if (mhi_get_free_desc_count(mdev, DMA_FROM_DEVICE) == mhi_netdev->rx_queue_sz)
>  		schedule_delayed_work(&mhi_netdev->rx_refill, HZ / 2);
> @@ -362,12 +368,19 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
>  
>  	SET_NETDEV_DEV(ndev, &mhi_dev->dev);
>  
> +	pm_runtime_no_callbacks(&mhi_dev->dev);
> +	devm_pm_runtime_set_active_enabled(&mhi_dev->dev);
> +	pm_runtime_set_autosuspend_delay(&mhi_dev->dev, 100);
> +	pm_runtime_use_autosuspend(&mhi_dev->dev);
> +	pm_runtime_get(&mhi_dev->dev);
>  	err = mhi_net_newlink(mhi_dev, ndev);
>  	if (err) {
>  		free_netdev(ndev);
> +		pm_runtime_put_autosuspend(&mhi_dev->dev);
>  		return err;
>  	}
>  
> +	pm_runtime_put_autosuspend(&mhi_dev->dev);
>  	return 0;
>  }
>  
> 
> -- 
> 2.34.1
> 
> 
