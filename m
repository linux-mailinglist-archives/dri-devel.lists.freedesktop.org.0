Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB0E54F088
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 07:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C38D11AF00;
	Fri, 17 Jun 2022 05:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0034011AF00
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 05:23:30 +0000 (UTC)
X-UUID: 8db5ea7a49ef4ee68c53ba864463702c-20220617
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:615d91a7-f42e-4485-9bb6-a548c0d6a956, OB:10,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:45
X-CID-INFO: VERSION:1.1.6, REQID:615d91a7-f42e-4485-9bb6-a548c0d6a956, OB:10,
 LOB
 :0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:45
X-CID-META: VersionHash:b14ad71, CLOUDID:dbf2da48-4c92-421c-ad91-b806c0f58b2a,
 C
 OID:5e76de18f4ea,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 8db5ea7a49ef4ee68c53ba864463702c-20220617
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1705269823; Fri, 17 Jun 2022 13:23:23 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 17 Jun 2022 13:23:22 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Jun 2022 13:23:21 +0800
Message-ID: <81d35568f1caf58f420704f504bf78b7182c9975.camel@mediatek.com>
Subject: Re: [PATCH] drm/mediatek: fix crtc index computation
From: CK Hu <ck.hu@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
Date: Fri, 17 Jun 2022 13:23:21 +0800
In-Reply-To: <20220530142407.781187-1-fparent@baylibre.com>
References: <20220530142407.781187-1-fparent@baylibre.com>
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
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Fabien:

On Mon, 2022-05-30 at 16:24 +0200, Fabien Parent wrote:
> The code always assume that the main path is enabled, which is not
> always the case. When the main path is not enabled, the CRTC index
> of the ext path is incorrect which makes the secondary path
> not usable. Fix the CRTC index calculation.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 46 +++++++++++++++--
> ----
>  1 file changed, 34 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 5d7504a72b11..6f2abfc608fb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -430,25 +430,47 @@ int mtk_ddp_comp_get_id(struct device_node
> *node,
>  	return -EINVAL;
>  }
>  
> +static bool mtk_drm_comp_is_enabled(struct drm_device *drm,
> +				    const enum mtk_ddp_comp_id *path,
> +				    unsigned int path_len)
> +{
> +	struct mtk_drm_private *priv = drm->dev_private;
> +
> +	return path && path_len && !!priv->comp_node[path[path_len -
> 1]];

Why just check priv->comp_node[path[path_len - 1]]?
In mtk_drm_crtc_create(), crtc would not be created if any comp node in
the path is null.

Regards,
CK

> +}
> +
>  unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device
> *drm,
>  						struct device *dev)
>  {
>  	struct mtk_drm_private *private = drm->dev_private;
> -	unsigned int ret = 0;
> +	unsigned int index = 0;
>  
> -	if (mtk_drm_find_comp_in_ddp(dev, private->data->main_path,
> private->data->main_len,
> +	if (mtk_drm_find_comp_in_ddp(dev, private->data->main_path,
> +				     private->data->main_len,
>  				     private->ddp_comp))
> -		ret = BIT(0);
> -	else if (mtk_drm_find_comp_in_ddp(dev, private->data->ext_path,
> -					  private->data->ext_len,
> private->ddp_comp))
> -		ret = BIT(1);
> -	else if (mtk_drm_find_comp_in_ddp(dev, private->data-
> >third_path,
> -					  private->data->third_len,
> private->ddp_comp))
> -		ret = BIT(2);
> -	else
> -		DRM_INFO("Failed to find comp in ddp table\n");
> +		return BIT(index);
> +
> +	if (mtk_drm_comp_is_enabled(drm, private->data->main_path,
> +				    private->data->main_len))
> +		index++;
>  
> -	return ret;
> +	if (mtk_drm_find_comp_in_ddp(dev, private->data->ext_path,
> +				     private->data->ext_len,
> +				     private->ddp_comp))
> +		return BIT(index);
> +
> +	if (mtk_drm_comp_is_enabled(drm, private->data->ext_path,
> +				    private->data->ext_len))
> +		index++;
> +
> +	if (mtk_drm_find_comp_in_ddp(dev, private->data->third_path,
> +					  private->data->third_len,
> +					  private->ddp_comp))
> +		return BIT(index);
> +
> +	DRM_INFO("Failed to find comp in ddp table\n");
> +
> +	return 0;
>  }
>  
>  int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp
> *comp,

