Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2114E9044
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 10:34:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2783810E5E0;
	Mon, 28 Mar 2022 08:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F3710E5E0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 08:34:24 +0000 (UTC)
X-UUID: e39f0a4d0661449095e029a816657317-20220328
X-UUID: e39f0a4d0661449095e029a816657317-20220328
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2107649653; Mon, 28 Mar 2022 16:34:20 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 28 Mar 2022 16:34:18 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 28 Mar 2022 16:34:18 +0800
Message-ID: <77c27222d09ad9ca1751985533bae5027391c19b.camel@mediatek.com>
Subject: Re: [PATCH v9 12/22] drm/mediatek: dpi: move swap_shift to SoC config
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Guillaume Ranquet <granquet@baylibre.com>, <airlied@linux.ie>,
 <angelogioacchino.delregno@collabora.com>, <chunfeng.yun@mediatek.com>,
 <chunkuang.hu@kernel.org>, <ck.hu@mediatek.com>, <daniel@ffwll.ch>,
 <deller@gmx.de>, <jitao.shi@mediatek.com>, <kishon@ti.com>,
 <krzk+dt@kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <matthias.bgg@gmail.com>, <mripard@kernel.org>, <p.zabel@pengutronix.de>,
 <robh+dt@kernel.org>, <tzimmermann@suse.de>, <vkoul@kernel.org>
Date: Mon, 28 Mar 2022 16:34:18 +0800
In-Reply-To: <20220327223927.20848-13-granquet@baylibre.com>
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-13-granquet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
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
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-03-28 at 00:39 +0200, Guillaume Ranquet wrote:
> Add flexibility by moving the swap shift value to SoC specific config
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 6eeda222a973..6d4d8c6ec47d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -131,6 +131,7 @@ struct mtk_dpi_conf {
>  	u32 dimension_mask;
>  	/* HSIZE and VSIZE mask (no shift) */
>  	u32 hvsize_mask;
> +	u32 channel_swap_shift;
>  	const struct mtk_dpi_yc_limit *limit;
>  };
>  
> @@ -349,7 +350,8 @@ static void mtk_dpi_config_channel_swap(struct
> mtk_dpi *dpi,
>  		break;
>  	}
>  
> -	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << CH_SWAP,
> CH_SWAP_MASK);
> +	mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, val << dpi->conf-
> >channel_swap_shift,
> +		     CH_SWAP_MASK);
>  }
>  
>  static void mtk_dpi_config_yuv422_enable(struct mtk_dpi *dpi, bool
> enable)
> @@ -821,6 +823,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
>  	.swap_input_support = true,
>  	.dimension_mask = HPW_MASK,
>  	.hvsize_mask = HSIZE_MASK,
> +	.channel_swap_shift = CH_SWAP,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -835,6 +838,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
>  	.swap_input_support = true,
>  	.dimension_mask = HPW_MASK,
>  	.hvsize_mask = HSIZE_MASK,
> +	.channel_swap_shift = CH_SWAP,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -848,6 +852,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
>  	.swap_input_support = true,
>  	.dimension_mask = HPW_MASK,
>  	.hvsize_mask = HSIZE_MASK,
> +	.channel_swap_shift = CH_SWAP,
>  	.limit = &mtk_dpi_limit,
>  };
>  
> @@ -861,6 +866,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
>  	.swap_input_support = true,
>  	.dimension_mask = HPW_MASK,
>  	.hvsize_mask = HSIZE_MASK,
> +	.channel_swap_shift = CH_SWAP,
>  	.limit = &mtk_dpi_limit,
>  };
>  

Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

