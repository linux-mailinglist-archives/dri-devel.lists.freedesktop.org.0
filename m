Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D15DFC5C999
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 11:33:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7590F10EA43;
	Fri, 14 Nov 2025 10:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HXyqydi2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F7810EA43
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 10:33:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 194136017D;
 Fri, 14 Nov 2025 10:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC6D8C19421;
 Fri, 14 Nov 2025 10:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763116406;
 bh=b5OwkNMvy1x2IysaOqDsG57B8PQrzrGFhfkbSYYkR0A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HXyqydi2lZnpyrw0/0lR0YpZSKujyfxxMKaUGDtahDIfqEtu2IhKlYLGiFiNp099a
 sH1MABdbFsTk8b/RExfQfa5+BE7oRzzP5rT4HX71LoLe5Jbkuz/7MW/Zbc6Dsok55P
 z+7x6UlX0MPC63XsIdSkoq4y61m4hpV2b0iyrDAj3E8Z0BT8AbapSk9oqbvbpvm/Wc
 3AadrhNV6gfNdF7zUvaFohO42kaQ3CoJX5cNic+oKWI8jI+RK0LEZ+TObjXOmFlbcq
 XwbI/C1fqbXSa48xYujH5mxmAaTGqF4T4K6g1w3GW5s9VTnlRstsMNrB+pQUl0C0y9
 d2C769XDAMMTA==
Date: Fri, 14 Nov 2025 10:33:19 +0000
From: Simon Horman <horms@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: namcao@linutronix.de, vadim.fedorenko@linux.dev,
 jacob.e.keller@intel.com, christian.koenig@amd.com,
 sumit.semwal@linaro.org, sdf@fomichev.me, john.fastabend@gmail.com,
 hawk@kernel.org, daniel@iogearbox.net, ast@kernel.org,
 pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, andrew+netdev@lunn.ch,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Roger Quadros <rogerq@kernel.org>, danishanwar@ti.com
Subject: Re: [PATCH net-next v5 5/6] net: ti: icssg-prueth: Add AF_XDP zero
 copy for RX
Message-ID: <aRcFb-vsoLw24MbU@horms.kernel.org>
References: <20251111101523.3160680-1-m-malladi@ti.com>
 <20251111101523.3160680-6-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111101523.3160680-6-m-malladi@ti.com>
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

On Tue, Nov 11, 2025 at 03:45:22PM +0530, Meghana Malladi wrote:

...

> diff --git a/drivers/net/ethernet/ti/icssg/icssg_common.c b/drivers/net/ethernet/ti/icssg/icssg_common.c

...

> +static int prueth_dma_rx_push_mapped_zc(struct prueth_emac *emac,
> +					struct prueth_rx_chn *rx_chn,
> +					struct xdp_buff *xdp)
> +{
> +	struct net_device *ndev = emac->ndev;
> +	struct cppi5_host_desc_t *desc_rx;
> +	struct prueth_swdata *swdata;
> +	dma_addr_t desc_dma;
> +	dma_addr_t buf_dma;
> +	int buf_len;
> +
> +	buf_dma = xsk_buff_xdp_get_dma(xdp);
> +	desc_rx = k3_cppi_desc_pool_alloc(rx_chn->desc_pool);
> +	if (!desc_rx) {
> +		netdev_err(ndev, "rx push: failed to allocate descriptor\n");
> +		return -ENOMEM;
> +	}
> +	desc_dma = k3_cppi_desc_pool_virt2dma(rx_chn->desc_pool, desc_rx);
> +
> +	cppi5_hdesc_init(desc_rx, CPPI5_INFO0_HDESC_EPIB_PRESENT,
> +			 PRUETH_NAV_PS_DATA_SIZE);
> +	k3_udma_glue_rx_dma_to_cppi5_addr(rx_chn->rx_chn, &buf_dma);
> +	buf_len = xsk_pool_get_rx_frame_size(rx_chn->xsk_pool);
> +	cppi5_hdesc_attach_buf(desc_rx, buf_dma, buf_len, buf_dma, buf_len);
> +	swdata = cppi5_hdesc_get_swdata(desc_rx);
> +	swdata->type = PRUETH_SWDATA_XSK;
> +	swdata->data.xdp = xdp;
> +
> +	return k3_udma_glue_push_rx_chn(rx_chn->rx_chn, PRUETH_RX_FLOW_DATA,
> +					desc_rx, desc_dma);
> +
> +	return 0;

nit: The line above is dead code.

> +}

...
