Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C40372F81E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 10:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25CDD10E42E;
	Wed, 14 Jun 2023 08:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17BDB10E425
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 08:43:12 +0000 (UTC)
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E3D0D6606F45;
 Wed, 14 Jun 2023 09:43:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1686732191;
 bh=8BBsxp6XAIVhovJ5Yvw4wMPhV32ZZO8+LeDwZAeuWYA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LieUGfRuNhr8GWkSmH3/jw5KsDhdxA5H2yINUAvxnkgQES6eDdAqxapFOjQWdFBmI
 F7x4pZWoxNCjO0OKjqTs4AZa82yEr8u5DpK4+ekFjY8mHoVuhxCp8UhPqhd+gAr4yB
 kqgz4QLERqNf45ARzlnEQkM5teUwPMm5mbWgXQS41Xxh65Ti5O04moBunyHVlOplL2
 7LgeiXEj8kemBw0Og9Q83K8QK8fA7OjyjR4TOarE5/FCdqB7VT5K6LZWiFD9FSN9jL
 qSOlkHQ/ioebGtmZV4gziiiX3TsaXc7VZkDe7VQH19B5+oOBX/KqVrKhV8sGaFG24D
 wEcKiT+0h1TcA==
Message-ID: <0f17e59f-21d6-bdf6-99a7-4f4e91f698ba@collabora.com>
Date: Wed, 14 Jun 2023 10:43:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 3/4] drm/mediatek: Add casting before assign
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Alexandre Mergnat <amergnat@baylibre.com>
References: <20230613113210.24949-1-jason-jh.lin@mediatek.com>
 <20230613113210.24949-4-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230613113210.24949-4-jason-jh.lin@mediatek.com>
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
> 1. Add casting before assign to avoid the unintentional integer
>     overflow or unintended sign extension.
> 2. Add a int varriable for multiplier calculation instead of calculating
>     different types multiplier with dma_addr_t varriable directly.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Fixes: 1a64a7aff8da ("drm/mediatek: Fix cursor plane no update")
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_gem.c   |  2 +-
>   drivers/gpu/drm/mediatek/mtk_drm_plane.c | 22 +++++++++++++---------
>   2 files changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> index a25b28d3ee90..0c7878bc0b37 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -121,7 +121,7 @@ int mtk_drm_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
>   	int ret;
>   
>   	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
> -	args->size = args->pitch * args->height;
> +	args->size = (__u64)args->pitch * args->height;

We could avoid explicit casting here if you do

	args->size = args->pitch;
	args->size *= args->height;

>   
>   	mtk_gem = mtk_drm_gem_create(dev, args->size, false);
>   	if (IS_ERR(mtk_gem))
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index 31f9420aff6f..1cd41454d545 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -145,6 +145,7 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
>   	dma_addr_t addr;
>   	dma_addr_t hdr_addr = 0;
>   	unsigned int hdr_pitch = 0;
> +	int offset;

...but offset can never be negative, can it?
in that case, this should be unsigned int.

>   
>   	gem = fb->obj[0];
>   	mtk_gem = to_mtk_gem_obj(gem);
> @@ -154,8 +155,10 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
>   	modifier = fb->modifier;
>   
>   	if (modifier == DRM_FORMAT_MOD_LINEAR) {
> -		addr += (new_state->src.x1 >> 16) * fb->format->cpp[0];
> -		addr += (new_state->src.y1 >> 16) * pitch;
> +		offset = (new_state->src.x1 >> 16) * fb->format->cpp[0];
> +		addr += offset;
> +		offset = (new_state->src.y1 >> 16) * pitch;
> +		addr += offset;
>   	} else {
>   		int width_in_blocks = ALIGN(fb->width, AFBC_DATA_BLOCK_WIDTH)
>   				      / AFBC_DATA_BLOCK_WIDTH;
> @@ -163,21 +166,22 @@ static void mtk_plane_update_new_state(struct drm_plane_state *new_state,
>   				       / AFBC_DATA_BLOCK_HEIGHT;
>   		int x_offset_in_blocks = (new_state->src.x1 >> 16) / AFBC_DATA_BLOCK_WIDTH;
>   		int y_offset_in_blocks = (new_state->src.y1 >> 16) / AFBC_DATA_BLOCK_HEIGHT;
> -		int hdr_size;
> +		int hdr_size, hdr_offset;
>   
>   		hdr_pitch = width_in_blocks * AFBC_HEADER_BLOCK_SIZE;
>   		pitch = width_in_blocks * AFBC_DATA_BLOCK_WIDTH *
>   			AFBC_DATA_BLOCK_HEIGHT * fb->format->cpp[0];
>   
>   		hdr_size = ALIGN(hdr_pitch * height_in_blocks, AFBC_HEADER_ALIGNMENT);
> +		hdr_offset = hdr_pitch * y_offset_in_blocks +
> +			AFBC_HEADER_BLOCK_SIZE * x_offset_in_blocks;
> +		hdr_addr = addr + hdr_offset;
>   
> -		hdr_addr = addr + hdr_pitch * y_offset_in_blocks +
> -			   AFBC_HEADER_BLOCK_SIZE * x_offset_in_blocks;
>   		/* The data plane is offset by 1 additional block. */
> -		addr = addr + hdr_size +
> -		       pitch * y_offset_in_blocks +
> -		       AFBC_DATA_BLOCK_WIDTH * AFBC_DATA_BLOCK_HEIGHT *
> -		       fb->format->cpp[0] * (x_offset_in_blocks + 1);
> +		offset = pitch * y_offset_in_blocks +
> +			 AFBC_DATA_BLOCK_WIDTH * AFBC_DATA_BLOCK_HEIGHT *
> +			 fb->format->cpp[0] * (x_offset_in_blocks + 1);
> +		addr = addr + hdr_size + offset;
>   	}
>   
>   	mtk_plane_state->pending.enable = true;

