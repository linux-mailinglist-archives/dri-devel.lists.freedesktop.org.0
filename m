Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB53B79A6C2
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 11:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6081410E1DA;
	Mon, 11 Sep 2023 09:34:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316FE10E1DA
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 09:34:02 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C3CF966072F0;
 Mon, 11 Sep 2023 10:33:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694424840;
 bh=rHHHuF02A5nvt+AXbCIowWRbwndRguiS4v+mhK3ndws=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hdEWKVqo2v+9z5TdmS3rsrer803Qt2ExqloC2R16vDBb7HzzZm8InCiQhzTKEB5jV
 h/GZcp87wLWxXngKvN3N6LFft7Z9rOzIEzICp1S2uOvBNiT8QLjnSj1sOQGxGCxtl+
 b3R9QGOcOM1GUQfQPgxDD9SordElS28hYwIO6Axb3HOH0zh/3jTIgD4k/m9/LCuC25
 waPj7xE0dpPGBLtYjoZUVWSOyfphK2L/xqTN0syYLACpTujIeg/T7T0YmH6d2+SxRO
 8RZtgPaUop56crCMOSYatDaTZfv/2i4IETmyUQQla/KkNb4IWL7JpM1X4Ewdd1QgXg
 WcMMM3kRqLYeg==
Message-ID: <dd418409-1c91-f58d-f8ed-a0c8d42a26be@collabora.com>
Date: Mon, 11 Sep 2023 11:33:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 9/9] dma_buf: heaps: mtk_sec_heap: Add a new CMA heap
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-10-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230911023038.30649-10-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tjmercier@google.com, linaro-mm-sig@lists.linaro.org,
 John Stultz <jstultz@google.com>, jianjiao.zeng@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 11/09/23 04:30, Yong Wu ha scritto:
> Create a new mtk_svp_cma heap from the CMA reserved buffer.
> 
> When the first allocating buffer, use cma_alloc to prepare whole the
> CMA range, then send its range to TEE to protect and manage.
> For the later allocating, we just adds the cma_used_size.
> 
> When SVP done, cma_release will release the buffer, then kernel may
> reuse it.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/dma-buf/heaps/Kconfig           |   2 +-
>   drivers/dma-buf/heaps/mtk_secure_heap.c | 121 +++++++++++++++++++++++-
>   2 files changed, 119 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-buf/heaps/Kconfig
> index 729c0cf3eb7c..e101f788ecbf 100644
> --- a/drivers/dma-buf/heaps/Kconfig
> +++ b/drivers/dma-buf/heaps/Kconfig
> @@ -15,7 +15,7 @@ config DMABUF_HEAPS_CMA
>   
>   config DMABUF_HEAPS_MTK_SECURE
>   	bool "DMA-BUF MediaTek Secure Heap"
> -	depends on DMABUF_HEAPS && TEE
> +	depends on DMABUF_HEAPS && TEE && CMA
>   	help
>   	  Choose this option to enable dma-buf MediaTek secure heap for Secure
>   	  Video Path. This heap is backed by TEE client interfaces. If in
> diff --git a/drivers/dma-buf/heaps/mtk_secure_heap.c b/drivers/dma-buf/heaps/mtk_secure_heap.c
> index daf6cf2121a1..3f568fe6b569 100644
> --- a/drivers/dma-buf/heaps/mtk_secure_heap.c
> +++ b/drivers/dma-buf/heaps/mtk_secure_heap.c

..snip..

> +}
> +
> +RESERVEDMEM_OF_DECLARE(mtk_secure_cma, "mediatek,secure_cma_chunkmem",

I'd suggest "mediatek,secure-heap" as compatible name.

> +		       mtk_secure_cma_init);
> +

Regards,
Angelo


