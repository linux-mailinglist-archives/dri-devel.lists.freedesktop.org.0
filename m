Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E73D95CF69
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 16:20:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA7C10EB6B;
	Fri, 23 Aug 2024 14:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ews8qhWn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CEF310EB59
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 14:20:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 89E9D60FD9;
 Fri, 23 Aug 2024 14:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4440C32786;
 Fri, 23 Aug 2024 14:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724422822;
 bh=UoJ5fJMmlhygHRetgflC2hxUvjxWyKFUJ5/bnCZVNUc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ews8qhWnjGup4oLn7E65LN2Zw+jr0QQqMoDWddjuo1g0KKN2g6/Sfnb9XCtKwM7QZ
 y7HtXXe3Xs43mwkwzqUvpj+wzXUoUP3QlYyQqV2Nb+XAUa9uQgIMS1O8AeLYpcV17W
 OEHALbLIqjau82+xucH+ruXml9VdfDfxK10nDAZpRzGBm5yNmiw8GELwPOYa6WyE0T
 PGsU59PCMMEkRWXmav0Y+SLWMBt5jkEcAhUGyu44P6xm47Wc6NaOpxDYICh32EstyP
 NJs3PsbBT9F4XPftGv5EorwKUQE34OCX6QBzkEhkPy1ZajmJuHujtjqwVwSvxK8KnB
 kTDpgFq6EQQ3w==
Message-ID: <ff3136fa-712b-4238-a534-4f1f5c542197@kernel.org>
Date: Fri, 23 Aug 2024 17:20:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 3/3] net: ethernet: ti: am65-cpsw: Add minimal
 XDP support
To: Julien Panis <jpanis@baylibre.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Ratheesh Kannoth <rkannoth@marvell.com>,
 Naveen Mamindlapalli <naveenm@marvell.com>,
 Jacob Keller <jacob.e.keller@intel.com>
Cc: danishanwar@ti.com, yuehaibing@huawei.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, "Govindarajan, Sriramakrishnan" <srk@ti.com>
References: <20240223-am65-cpsw-xdp-basic-v9-0-2c194217e325@baylibre.com>
 <20240223-am65-cpsw-xdp-basic-v9-3-2c194217e325@baylibre.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20240223-am65-cpsw-xdp-basic-v9-3-2c194217e325@baylibre.com>
Content-Type: text/plain; charset=UTF-8
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



On 12/04/2024 18:38, Julien Panis wrote:
> This patch adds XDP (eXpress Data Path) support to TI AM65 CPSW
> Ethernet driver. The following features are implemented:
> - NETDEV_XDP_ACT_BASIC (XDP_PASS, XDP_TX, XDP_DROP, XDP_ABORTED)
> - NETDEV_XDP_ACT_REDIRECT (XDP_REDIRECT)
> - NETDEV_XDP_ACT_NDO_XMIT (ndo_xdp_xmit callback)
> 
> The page pool memory model is used to get better performance.
> Below are benchmark results obtained for the receiver with iperf3 default
> parameters:
> - Without page pool: 495 Mbits/sec
> - With page pool: 605 Mbits/sec (actually 610 Mbits/sec, with a 5 Mbits/sec
> loss due to extra processing in the hot path to handle XDP).
> 
> Signed-off-by: Julien Panis <jpanis@baylibre.com>
> ---
>  drivers/net/ethernet/ti/am65-cpsw-nuss.c | 659 ++++++++++++++++++++++++++-----
>  drivers/net/ethernet/ti/am65-cpsw-nuss.h |  13 +
>  2 files changed, 576 insertions(+), 96 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> index 9d2f4ac783e4..3c8134006061 100644
> --- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> +++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> @@ -5,6 +5,7 @@
>   *

<snip>

> +
> +static int am65_cpsw_run_xdp(struct am65_cpsw_common *common,
> +			     struct am65_cpsw_port *port,
> +			     struct xdp_buff *xdp,
> +			     int desc_idx, int cpu, int *len)
> +{
> +	struct am65_cpsw_rx_chn *rx_chn = &common->rx_chns;
> +	struct net_device *ndev = port->ndev;
> +	int ret = AM65_CPSW_XDP_CONSUMED;
> +	struct am65_cpsw_tx_chn *tx_chn;
> +	struct netdev_queue *netif_txq;
> +	struct xdp_frame *xdpf;
> +	struct bpf_prog *prog;
> +	struct page *page;
> +	u32 act;
> +
> +	prog = READ_ONCE(port->xdp_prog);
> +	if (!prog)
> +		return AM65_CPSW_XDP_PASS;
> +
> +	act = bpf_prog_run_xdp(prog, xdp);
> +	/* XDP prog might have changed packet data and boundaries */
> +	*len = xdp->data_end - xdp->data;
> +
> +	switch (act) {
> +	case XDP_PASS:
> +		ret = AM65_CPSW_XDP_PASS;
> +		goto out;
> +	case XDP_TX:
> +		tx_chn = &common->tx_chns[cpu % AM65_CPSW_MAX_TX_QUEUES];
> +		netif_txq = netdev_get_tx_queue(ndev, tx_chn->id);
> +
> +		xdpf = xdp_convert_buff_to_frame(xdp);
> +		if (unlikely(!xdpf))
> +			break;
> +
> +		__netif_tx_lock(netif_txq, cpu);
> +		ret = am65_cpsw_xdp_tx_frame(ndev, tx_chn, xdpf,
> +					     AM65_CPSW_TX_BUF_TYPE_XDP_TX);
> +		__netif_tx_unlock(netif_txq);
> +		if (ret)
> +			break;
> +
> +		ndev->stats.rx_bytes += *len;
> +		ndev->stats.rx_packets++;
> +		ret = AM65_CPSW_XDP_CONSUMED;
> +		goto out;
> +	case XDP_REDIRECT:
> +		if (unlikely(xdp_do_redirect(ndev, xdp, prog)))
> +			break;
> +
> +		ndev->stats.rx_bytes += *len;
> +		ndev->stats.rx_packets++;
> +		ret = AM65_CPSW_XDP_REDIRECT;
> +		goto out;
> +	default:
> +		bpf_warn_invalid_xdp_action(ndev, prog, act);
> +		fallthrough;
> +	case XDP_ABORTED:
> +		trace_xdp_exception(ndev, prog, act);
> +		fallthrough;
> +	case XDP_DROP:
> +		ndev->stats.rx_dropped++;
> +	}
> +
> +	page = virt_to_head_page(xdp->data);
> +	am65_cpsw_put_page(rx_chn, page, true, desc_idx);

here you put the page for failures, XDP_ABORTED or XDP_DROP.

> +
> +out:
> +	return ret;
> +}
> +
>  static void am65_cpsw_nuss_rx_ts(struct sk_buff *skb, u32 *psdata)
>  {
>  	struct skb_shared_hwtstamps *ssh;
> @@ -795,7 +1090,7 @@ static void am65_cpsw_nuss_rx_csum(struct sk_buff *skb, u32 csum_info)
>  }
>  
>  static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_common *common,
> -				     u32 flow_idx)
> +				     u32 flow_idx, int cpu)
>  {
>  	struct am65_cpsw_rx_chn *rx_chn = &common->rx_chns;
>  	u32 buf_dma_len, pkt_len, port_id = 0, csum_info;
> @@ -803,13 +1098,16 @@ static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_common *common,
>  	struct am65_cpsw_ndev_stats *stats;
>  	struct cppi5_host_desc_t *desc_rx;
>  	struct device *dev = common->dev;
> -	struct sk_buff *skb, *new_skb;
> +	struct page *page, *new_page;
>  	dma_addr_t desc_dma, buf_dma;
>  	struct am65_cpsw_port *port;
> +	int headroom, desc_idx, ret;
>  	struct net_device *ndev;
> +	struct sk_buff *skb;
> +	struct xdp_buff	xdp;
> +	void *page_addr;
>  	void **swdata;
>  	u32 *psdata;
> -	int ret = 0;
>  
>  	ret = k3_udma_glue_pop_rx_chn(rx_chn->rx_chn, flow_idx, &desc_dma);
>  	if (ret) {
> @@ -830,7 +1128,8 @@ static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_common *common,
>  		__func__, flow_idx, &desc_dma);
>  
>  	swdata = cppi5_hdesc_get_swdata(desc_rx);
> -	skb = *swdata;
> +	page_addr = *swdata;
> +	page = virt_to_page(page_addr);
>  	cppi5_hdesc_get_obuf(desc_rx, &buf_dma, &buf_dma_len);
>  	k3_udma_glue_rx_cppi5_to_dma_addr(rx_chn->rx_chn, &buf_dma);
>  	pkt_len = cppi5_hdesc_get_pktlen(desc_rx);
> @@ -838,12 +1137,7 @@ static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_common *common,
>  	dev_dbg(dev, "%s rx port_id:%d\n", __func__, port_id);
>  	port = am65_common_get_port(common, port_id);
>  	ndev = port->ndev;
> -	skb->dev = ndev;
> -
>  	psdata = cppi5_hdesc_get_psdata(desc_rx);
> -	/* add RX timestamp */
> -	if (port->rx_ts_enabled)
> -		am65_cpsw_nuss_rx_ts(skb, psdata);
>  	csum_info = psdata[2];
>  	dev_dbg(dev, "%s rx csum_info:%#x\n", __func__, csum_info);
>  
> @@ -851,36 +1145,66 @@ static int am65_cpsw_nuss_rx_packets(struct am65_cpsw_common *common,
>  
>  	k3_cppi_desc_pool_free(rx_chn->desc_pool, desc_rx);
>  
> -	new_skb = netdev_alloc_skb_ip_align(ndev, AM65_CPSW_MAX_PACKET_SIZE);
> -	if (new_skb) {
> -		ndev_priv = netdev_priv(ndev);
> -		am65_cpsw_nuss_set_offload_fwd_mark(skb, ndev_priv->offload_fwd_mark);
> -		skb_put(skb, pkt_len);
> -		skb->protocol = eth_type_trans(skb, ndev);
> -		am65_cpsw_nuss_rx_csum(skb, csum_info);
> -		napi_gro_receive(&common->napi_rx, skb);
> -
> -		stats = this_cpu_ptr(ndev_priv->stats);
> -
> -		u64_stats_update_begin(&stats->syncp);
> -		stats->rx_packets++;
> -		stats->rx_bytes += pkt_len;
> -		u64_stats_update_end(&stats->syncp);
> -		kmemleak_not_leak(new_skb);
> -	} else {
> -		ndev->stats.rx_dropped++;
> -		new_skb = skb;
> +	desc_idx = am65_cpsw_nuss_desc_idx(rx_chn->desc_pool, desc_rx,
> +					   rx_chn->dsize_log2);
> +
> +	skb = am65_cpsw_build_skb(page_addr, ndev,
> +				  AM65_CPSW_MAX_PACKET_SIZE);
> +	if (unlikely(!skb)) {
> +		new_page = page;
> +		goto requeue;
> +	}
> +
> +	if (port->xdp_prog) {
> +		xdp_init_buff(&xdp, AM65_CPSW_MAX_PACKET_SIZE, &port->xdp_rxq);
> +
> +		xdp_prepare_buff(&xdp, page_addr, skb_headroom(skb),
> +				 pkt_len, false);
> +
> +		ret = am65_cpsw_run_xdp(common, port, &xdp, desc_idx,
> +					cpu, &pkt_len);
> +		if (ret != AM65_CPSW_XDP_PASS)

For all cases except AM65_CPSW_XDP_PASS, you never requeue the page for RX.
This is why after all pages are exhausted for example with XDP_DROP,
RX will stall forever.

I will send a fixup patch for this.

> +			return ret;
> +
> +		/* Compute additional headroom to be reserved */
> +		headroom = (xdp.data - xdp.data_hard_start) - skb_headroom(skb);
> +		skb_reserve(skb, headroom);
>  	}
>  
> +	/* Pass skb to netstack if no XDP prog or returned XDP_PASS */
> +	if (port->rx_ts_enabled)
> +		am65_cpsw_nuss_rx_ts(skb, psdata);
> +
> +	ndev_priv = netdev_priv(ndev);
> +	am65_cpsw_nuss_set_offload_fwd_mark(skb, ndev_priv->offload_fwd_mark);
> +	skb_put(skb, pkt_len);
> +	skb_mark_for_recycle(skb);
> +	skb->protocol = eth_type_trans(skb, ndev);
> +	am65_cpsw_nuss_rx_csum(skb, csum_info);
> +	napi_gro_receive(&common->napi_rx, skb);
> +
> +	stats = this_cpu_ptr(ndev_priv->stats);
> +
> +	u64_stats_update_begin(&stats->syncp);
> +	stats->rx_packets++;
> +	stats->rx_bytes += pkt_len;
> +	u64_stats_update_end(&stats->syncp);
> +
> +	new_page = page_pool_dev_alloc_pages(rx_chn->page_pool);
> +	if (unlikely(!new_page))
> +		return -ENOMEM;
> +	rx_chn->pages[desc_idx] = new_page;
> +
>  	if (netif_dormant(ndev)) {
> -		dev_kfree_skb_any(new_skb);
> +		am65_cpsw_put_page(rx_chn, new_page, true, desc_idx);
>  		ndev->stats.rx_dropped++;
>  		return 0;
>  	}
>  
> -	ret = am65_cpsw_nuss_rx_push(common, new_skb);
> +requeue:
> +	ret = am65_cpsw_nuss_rx_push(common, new_page);
>  	if (WARN_ON(ret < 0)) {
> -		dev_kfree_skb_any(new_skb);
> +		am65_cpsw_put_page(rx_chn, new_page, true, desc_idx);
>  		ndev->stats.rx_errors++;
>  		ndev->stats.rx_dropped++;
>  	}
> @@ -901,6 +1225,8 @@ static int am65_cpsw_nuss_rx_poll(struct napi_struct *napi_rx, int budget)
>  {
>  	struct am65_cpsw_common *common = am65_cpsw_napi_to_common(napi_rx);
>  	int flow = AM65_CPSW_MAX_RX_FLOWS;
> +	int cpu = smp_processor_id();
> +	bool xdp_redirect = false;
>  	int cur_budget, ret;
>  	int num_rx = 0;
>  

<snip>

-- 
cheers,
-roger
