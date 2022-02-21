Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5CA4BDA39
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 15:31:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE6410E4AD;
	Mon, 21 Feb 2022 14:31:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D252910E4AD
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 14:31:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 7C2781F437D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645453874;
 bh=mk0k2/MEJmiURqVRoi1Wk1mPXDdi5cLxGGCrvu3Zv+o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cAHt7Se+QbWvrlRL1ngiD9HhR8lKnozQrO13TG0uDtl7RyS2/LEdrMtzyAOBlbMHv
 mp0bZ9zLZgs1g0nPN0Sh01/GvEXPhDTOv7WjzJLOrx+S3y3ONUNvHrvGkEAd4g/za3
 FFBbM3R1VepHpLyS3iwOuiZ5hs7HSkDxwUDhnHcmLXzRZsT6Sws7LvaRyttjdj1mJg
 1/3tzkg59CBmstvES4lryQ95TF9kRHRW3Gy/Yszr7sJUSBUMitEClrh7awHB6L+2PV
 REfUL7zqfeiDuydEepo85W2hreRiHcj3ilQ9qyvLbUK84xmS5NsLN58QNXc3hcy/K9
 zTrhFB6wOe+hQ==
Message-ID: <0a6fe69b-245a-c889-15be-3136c29d3d61@collabora.com>
Date: Mon, 21 Feb 2022 15:31:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v8 10/19] drm/mediatek: dpi: move swap_shift to board
 config
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com,
 kishon@ti.com, vkoul@kernel.org, deller@gmx.de, ck.hu@mediatek.com,
 jitao.shi@mediatek.com
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-11-granquet@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220218145437.18563-11-granquet@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 18/02/22 15:54, Guillaume Ranquet ha scritto:
> Add flexibility by moving the swap shift value to board config
> 

Same board->SoC as all the other commits..

> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dpi.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 0d3acd08ea358..ec221e24e0fee 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -131,6 +131,7 @@ struct mtk_dpi_conf {
>   	u32 dimension_mask;
>   	// Mask used for HSIZE and VSIZE (no shift)
>   	u32 hvsize_mask;
> +	u32 channel_swap_shift;
>   	const struct mtk_dpi_yc_limit *limit;
>   };
>   
> @@ -349,7 +350,8 @@ static void mtk_dpi_config_channel_swap(struct mtk_dpi *dpi,
>   		break;
>   	}
>   
> -	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << CH_SWAP, CH_SWAP_MASK);
> +	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << CH_SWAP,
> +		     CH_SWAP_MASK << dpi->conf->channel_swap_shift);

I would say that this should be instead:
	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING,

		     val << dpi->conf->channel_swap_shift, CH_SWAP_MASK);


>   }
>   
>   static void mtk_dpi_config_yuv422_enable(struct mtk_dpi *dpi, bool enable)
> @@ -821,6 +823,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
>   	.swap_input_support = true,
>   	.dimension_mask = HPW_MASK,
>   	.hvsize_mask = HSIZE_MASK,
> +	.channel_swap_shift = CH_SWAP,
>   	.limit = &mtk_dpi_limit,
>   };
>   
> @@ -835,6 +838,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
>   	.swap_input_support = true,
>   	.dimension_mask = HPW_MASK,
>   	.hvsize_mask = HSIZE_MASK,
> +	.channel_swap_shift = CH_SWAP,
>   	.limit = &mtk_dpi_limit,
>   };
>   
> @@ -848,6 +852,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
>   	.swap_input_support = true,
>   	.dimension_mask = HPW_MASK,
>   	.hvsize_mask = HSIZE_MASK,
> +	.channel_swap_shift = CH_SWAP,
>   	.limit = &mtk_dpi_limit,
>   };
>   
> @@ -861,6 +866,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
>   	.swap_input_support = true,
>   	.dimension_mask = HPW_MASK,
>   	.hvsize_mask = HSIZE_MASK,
> +	.channel_swap_shift = CH_SWAP,
>   	.limit = &mtk_dpi_limit,
>   };
>   



