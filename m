Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D6DC14369
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 11:57:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0448510E14D;
	Tue, 28 Oct 2025 10:57:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GoX60KGy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D03D510E14D
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 10:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761649073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ss7g9OPGrAkY9kUcGCclPiLcw52MVKuR0CuNg2oTpdY=;
 b=GoX60KGyBU7TaI352OE0Ic9ZAlHFkRFOugnC/z/ujAlg5NvjtAiSj88+61XRw1nuXR+yGB
 T/68B741Q7uOr0fjluU/s+fmHlKCRgGl0S5Zhsx7lwvrDUjbOVy3jV2kFL16qHcBr03flA
 BylgLV1b4MzMPmzKFSs2jZx8sGOyO1g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-KQgWm85POryCxCW7P80eyw-1; Tue, 28 Oct 2025 06:57:52 -0400
X-MC-Unique: KQgWm85POryCxCW7P80eyw-1
X-Mimecast-MFC-AGG-ID: KQgWm85POryCxCW7P80eyw_1761649071
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-475ddd57999so26716095e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 03:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761649071; x=1762253871;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ss7g9OPGrAkY9kUcGCclPiLcw52MVKuR0CuNg2oTpdY=;
 b=kbTcLpJXWYefvj8MUIg8CJEAXbUVXQYhn4dYJkWAtzndTYgfrXz7SjouKZRRRlAEDG
 iyFnDHu28MQMwgx0jliOVEaTIFELI+Txo2wBoiWO3Y2hD3VKyJpoxYoBGccfie5eqryQ
 va/QrSvSZa2DcO7JsJYzsp1W04OzzpxV5MLD7nlKPJHQt7+dvQNxtpAVzp++jbALVeh9
 Z3Rk2zV3micPgf9IAqo5yYaHUJcDOSETHNxs4yo0e+ONZ61hAxUcVMH0JP9UhukaXZVL
 vFMi+Q1KX5yjxiDclC3JSnAG7uMF86lFneDoKY4g8qeHCvjDyebY7bhOlxYLAbVD0Weu
 P9SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUb6jvZrm8koZpRNu6YVOyX4CO2Mr10Di90LIjeVcBuoTjC8jKULEyvwLhRoKZ+HfN7YSOr0uCZfWA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyUJXrzCt4AiA70GL4Jz5ZvuW0U8qofTPMFy60J/v9MjX8L4l9
 Q22MSvIJqGPbelwbK/jvKpmMJZ1qzIyJJi0fm/cgXg3chWZ25jR3ABU42fyHbbqB4PaTOElAHMC
 SreN0NBuJ0QJ9dWl5vcoWgQ/UsedH/otcDi0tWk+lpXtLRkc0LNitVcyif2tWwqwYWSW+vw==
X-Gm-Gg: ASbGncsOmQvyudNp7As+oW7KsBe4ZaGLsp9Xs6/dNpe14WnYMWTtV12UbLM8xTtXcM6
 M8umYGLD7BUkeT1Eoz8l6NPhUbg9ftd25PgqdTZfCXssy6YXRf5jmlJG7iKdG7LZJcBE0x//8Hp
 hx4EmoTsLFIlKGvYsj8gUZMlMYjA6xADAadWdy5IOriVaXtFpp3Or1w5N9t9PY/bunVTfVvpTXM
 WtKQesRyiHktjra8i/8BjM85UMG7rJPuGm8YhxwZOWuvcV0EuBhYDeZtifjjUSbubkBB0bq1DrA
 L6SY2Te5+CUSNzUF2i1d0c1ENL1AoTXRCadXkG+ZyoGFDcvXJgjvTD2IIc7UaD/t0UAQfw1ULVT
 WmxwYI3DVLvIiD/bl1qAI1Ul8bjhNxDqSslbM5vJuTtJ9NGc=
X-Received: by 2002:a05:600c:34c7:b0:475:e067:f23d with SMTP id
 5b1f17b1804b1-47717e30340mr24822405e9.25.1761649071062; 
 Tue, 28 Oct 2025 03:57:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErU20c2eSasDdwQZzdlRNWvVKDbbva3lmpIExHrHtMT8SPwj/9JiHFRH8lMSjet+8CB83SCA==
X-Received: by 2002:a05:600c:34c7:b0:475:e067:f23d with SMTP id
 5b1f17b1804b1-47717e30340mr24821915e9.25.1761649070539; 
 Tue, 28 Oct 2025 03:57:50 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c?
 ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd47853csm191118005e9.13.2025.10.28.03.57.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 03:57:50 -0700 (PDT)
Message-ID: <05efdc9a-8704-476e-8179-1a9fc0ada749@redhat.com>
Date: Tue, 28 Oct 2025 11:57:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 2/6] net: ti: icssg-prueth: Add XSK pool
 helpers
To: Meghana Malladi <m-malladi@ti.com>, horms@kernel.org,
 namcao@linutronix.de, vadim.fedorenko@linux.dev, jacob.e.keller@intel.com,
 christian.koenig@amd.com, sumit.semwal@linaro.org, sdf@fomichev.me,
 john.fastabend@gmail.com, hawk@kernel.org, daniel@iogearbox.net,
 ast@kernel.org, kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
 andrew+netdev@lunn.ch
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>,
 danishanwar@ti.com
References: <20251023093927.1878411-1-m-malladi@ti.com>
 <20251023093927.1878411-3-m-malladi@ti.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251023093927.1878411-3-m-malladi@ti.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YimoOIOu-ZqDu0zGUQXMGEWEkGVfpQeABxrI-pl2Iuo_1761649071
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

On 10/23/25 11:39 AM, Meghana Malladi wrote:
> @@ -1200,6 +1218,109 @@ static int emac_xdp_setup(struct prueth_emac *emac, struct netdev_bpf *bpf)
>  	return 0;
>  }
>  
> +static int prueth_xsk_pool_enable(struct prueth_emac *emac,
> +				  struct xsk_buff_pool *pool, u16 queue_id)
> +{
> +	struct prueth_rx_chn *rx_chn = &emac->rx_chns;
> +	u32 frame_size;
> +	int ret;
> +
> +	if (queue_id >= PRUETH_MAX_RX_FLOWS ||
> +	    queue_id >= emac->tx_ch_num) {
> +		netdev_err(emac->ndev, "Invalid XSK queue ID %d\n", queue_id);
> +		return -EINVAL;
> +	}
> +
> +	frame_size = xsk_pool_get_rx_frame_size(pool);
> +	if (frame_size < PRUETH_MAX_PKT_SIZE)
> +		return -EOPNOTSUPP;
> +
> +	ret = xsk_pool_dma_map(pool, rx_chn->dma_dev, PRUETH_RX_DMA_ATTR);
> +	if (ret) {
> +		netdev_err(emac->ndev, "Failed to map XSK pool: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (netif_running(emac->ndev)) {
> +		/* stop packets from wire for graceful teardown */
> +		ret = icssg_set_port_state(emac, ICSSG_EMAC_PORT_DISABLE);
> +		if (ret)
> +			return ret;
> +		prueth_destroy_rxq(emac);
> +	}
> +
> +	emac->xsk_qid = queue_id;
> +	prueth_set_xsk_pool(emac, queue_id);
> +
> +	if (netif_running(emac->ndev)) {
> +		ret = prueth_create_rxq(emac);

It looks like this falls short of Jakub's request on v2:

https://lore.kernel.org/netdev/20250903174847.5d8d1c9f@kernel.org/

about not freeing the rx queue for reconfig.

I think you should:
- stop the H/W from processing incoming packets,
- spool all the pending packets
- attach/detach the xsk_pool
- refill the ring
- re-enable the H/W

/P

