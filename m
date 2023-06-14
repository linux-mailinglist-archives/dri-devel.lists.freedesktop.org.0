Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D98072F81D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 10:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02B910E425;
	Wed, 14 Jun 2023 08:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B980710E425
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 08:43:10 +0000 (UTC)
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BADD46606F40;
 Wed, 14 Jun 2023 09:43:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686732189;
 bh=uViAY2Cm1gbmVlveITw/e/9a22hLrYLFv1lSuHg22gQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nI21QgcyQ2imTOZIMOYrCjeVJ7nBsbAWXFhdh3O777fcKK4wKEJDqzkPVa6kmfJZu
 o1bxl+Hc0FgXjJZWpWlTxDhX7T6zx8EbQSTgWX4Hc/qHqpGR/t9w5213mLC1iv+jBj
 AIk8lObjSXFYonOjeqhl5C6QZP8UnmgjAWW1jYhDwlZGQBPzo4W+vzRIAY0vzDEhLO
 1qNaJn6Y5eA43oQY9it13C4N9lYEABzhtuAu7GYnEQgWRF5wo1BMVxL6GH/zKEaU6P
 KzLiNGDsSWGM7n86zJBWIQ5OSE8p9aHv5v6fvHBvmcLsgHDmYyKQuaNTbmkNNDqxk5
 /Y8HiSdBobZUA==
Message-ID: <bea69aca-50c2-8b65-4c72-7caaed7e50d1@collabora.com>
Date: Wed, 14 Jun 2023 10:43:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 1/4] drm/mediatek: Remove freeing not dynamic allocated
 memory
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Alexandre Mergnat <amergnat@baylibre.com>
References: <20230613113210.24949-1-jason-jh.lin@mediatek.com>
 <20230613113210.24949-2-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230613113210.24949-2-jason-jh.lin@mediatek.com>
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
Cc: Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 13/06/23 13:32, Jason-JH.Lin ha scritto:
> Fixing the coverity issue of:
> mtk_drm_cmdq_pkt_destroy frees address of mtk_crtc->cmdq_handle
> 
> So remove the free function.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Fixes: 7627122fd1c0 ("drm/mediatek: Add cmdq_handle in mtk_crtc")

Fixes tag goes before your S-o-b tag.

Anyway,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index d40142842f85..8d44f3df116f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -116,10 +116,9 @@ static int mtk_drm_cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *
>   	dma_addr_t dma_addr;
>   
>   	pkt->va_base = kzalloc(size, GFP_KERNEL);
> -	if (!pkt->va_base) {
> -		kfree(pkt);
> +	if (!pkt->va_base)
>   		return -ENOMEM;
> -	}
> +
>   	pkt->buf_size = size;
>   	pkt->cl = (void *)client;
>   
> @@ -129,7 +128,6 @@ static int mtk_drm_cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *
>   	if (dma_mapping_error(dev, dma_addr)) {
>   		dev_err(dev, "dma map failed, size=%u\n", (u32)(u64)size);
>   		kfree(pkt->va_base);
> -		kfree(pkt);
>   		return -ENOMEM;
>   	}
>   
> @@ -145,7 +143,6 @@ static void mtk_drm_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
>   	dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_size,
>   			 DMA_TO_DEVICE);
>   	kfree(pkt->va_base);
> -	kfree(pkt);
>   }
>   #endif
>   


