Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F39A49F2B9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 06:04:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168A910F2CB;
	Fri, 28 Jan 2022 05:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB7710F2CB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 05:04:00 +0000 (UTC)
X-UUID: 5ec7b59803ef48eea92c3e282e01dfca-20220128
X-UUID: 5ec7b59803ef48eea92c3e282e01dfca-20220128
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1636993121; Fri, 28 Jan 2022 13:03:57 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 28 Jan 2022 13:03:56 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 Jan 2022 13:03:55 +0800
Message-ID: <092258211c47eca805c4dea6c4bf4ecc4c246cea.camel@mediatek.com>
Subject: Re: [v1, 3/3] drm/mediatek: Move the getting bridge node function
 to mtk_dsi_bind
From: CK Hu <ck.hu@mediatek.com>
To: <xinlei.lee@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
Date: Fri, 28 Jan 2022 13:03:55 +0800
In-Reply-To: <1643283773-7081-4-git-send-email-xinlei.lee@mediatek.com>
References: <1643283773-7081-1-git-send-email-xinlei.lee@mediatek.com>
 <1643283773-7081-4-git-send-email-xinlei.lee@mediatek.com>
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
Cc: jitao.shi@mediatek.com, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Xinlei:

On Thu, 2022-01-27 at 19:42 +0800, xinlei.lee@mediatek.com wrote:
> From: xinlei lee <xinlei.lee@mediatek.com>
> 
> The order of probe function for bridge drivers and dsi drivers is
> uncertain.
> To avoid the dsi probe cannot be executed, we place getting bridge
> node function in
> mtk_dsi_bind.

It seems this patch want to fix the same problem as [1]. Does [1] fix
your problem? If so, let's ignore this patch.

[1] 
https://patchwork.kernel.org/project/linux-mediatek/patch/20220127143623.123025-1-angelogioacchino.delregno@collabora.com/

Regards,
CK

> 
> Signed-off-by:Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 29 +++++++++++++++-------------
> -
>  1 file changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 62af60d..a390f26 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -991,6 +991,21 @@ static int mtk_dsi_bind(struct device *dev,
> struct device *master, void *data)
>  	int ret;
>  	struct drm_device *drm = data;
>  	struct mtk_dsi *dsi = dev_get_drvdata(dev);
> +	struct drm_panel *panel;
> +
> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
> +					  &panel, &dsi->next_bridge);
> +	if (ret)
> +		return ret;
> +
> +	if (panel) {
> +		dsi->next_bridge = devm_drm_panel_bridge_add(dev,
> panel);
> +		if (IS_ERR(dsi->next_bridge)) {
> +			ret = PTR_ERR(dsi->next_bridge);
> +			dev_err(dev, "failed to add bridge: %d\n",
> ret);
> +			return ret;
> +		}
> +	}
>  
>  	ret = mtk_dsi_encoder_init(drm, dsi);
>  	if (ret)
> @@ -1016,7 +1031,6 @@ static int mtk_dsi_probe(struct platform_device
> *pdev)
>  {
>  	struct mtk_dsi *dsi;
>  	struct device *dev = &pdev->dev;
> -	struct drm_panel *panel;
>  	struct resource *regs;
>  	int irq_num;
>  	int ret;
> @@ -1033,19 +1047,6 @@ static int mtk_dsi_probe(struct
> platform_device *pdev)
>  		return ret;
>  	}
>  
> -	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
> -					  &panel, &dsi->next_bridge);
> -	if (ret)
> -		goto err_unregister_host;
> -
> -	if (panel) {
> -		dsi->next_bridge = devm_drm_panel_bridge_add(dev,
> panel);
> -		if (IS_ERR(dsi->next_bridge)) {
> -			ret = PTR_ERR(dsi->next_bridge);
> -			goto err_unregister_host;
> -		}
> -	}
> -
>  	dsi->driver_data = of_device_get_match_data(dev);
>  
>  	dsi->engine_clk = devm_clk_get(dev, "engine");

