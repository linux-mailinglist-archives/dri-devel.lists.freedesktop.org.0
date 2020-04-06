Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A23891A08F8
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 10:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C1DC6E5A1;
	Tue,  7 Apr 2020 08:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C056E417
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 15:25:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 66E2D293F03
Subject: Re: [PATCH] drm: mediatek: fix device passed to cmdq
To: Hsin-Yi Wang <hsinyi@chromium.org>, linux-arm-kernel@lists.infradead.org
References: <20200406051131.225748-1-hsinyi@chromium.org>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <095576cb-7124-9b23-fe24-7a91cce57d99@collabora.com>
Date: Mon, 6 Apr 2020 17:25:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200406051131.225748-1-hsinyi@chromium.org>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 07 Apr 2020 08:09:32 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hsin-Yi

Thanks for sending the patch upstream

On 6/4/20 7:11, Hsin-Yi Wang wrote:
> drm device is now probed from mmsys. We need to use mmsys device to get gce
> nodes. Fix following errors:
> 
> [    0.740068] mediatek-drm mediatek-drm.1.auto: error -2 can't parse gce-client-reg property (0)
> [    0.748721] mediatek-drm mediatek-drm.1.auto: error -2 can't parse gce-client-reg property (0)
> ...
> [    2.659645] mediatek-drm mediatek-drm.1.auto: failed to request channel
> [    2.666270] mediatek-drm mediatek-drm.1.auto: failed to request channel
> 
> Fixes: 1d367541aded ("soc / drm: mediatek: Fix mediatek-drm device probing")
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Right, the mmsys device is now the parent of the drm device.

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Also I tested drm with the patch applied and adding the gce client register to
my device-tree.

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Thanks,
 Enric

> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 6 ++++--
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 3 ++-
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 615a54e60fe2..8621f0289399 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -822,14 +822,16 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>  	mtk_crtc->cmdq_client =
> -			cmdq_mbox_create(dev, drm_crtc_index(&mtk_crtc->base),
> +			cmdq_mbox_create(mtk_crtc->mmsys_dev,
> +					 drm_crtc_index(&mtk_crtc->base),
>  					 2000);
>  	if (IS_ERR(mtk_crtc->cmdq_client)) {
>  		dev_dbg(dev, "mtk_crtc %d failed to create mailbox client, writing register by CPU now\n",
>  			drm_crtc_index(&mtk_crtc->base));
>  		mtk_crtc->cmdq_client = NULL;
>  	}
> -	ret = of_property_read_u32_index(dev->of_node, "mediatek,gce-events",
> +	ret = of_property_read_u32_index(mtk_crtc->mmsys_dev->of_node,
> +					 "mediatek,gce-events",
>  					 drm_crtc_index(&mtk_crtc->base),
>  					 &mtk_crtc->cmdq_event);
>  	if (ret)
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index e2bb0d19ef99..dc78e86bccc0 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -517,7 +517,8 @@ static int mtk_drm_probe(struct platform_device *pdev)
>  				goto err_node;
>  			}
>  
> -			ret = mtk_ddp_comp_init(dev, node, comp, comp_id, NULL);
> +			ret = mtk_ddp_comp_init(dev->parent, node, comp,
> +						comp_id, NULL);
>  			if (ret) {
>  				of_node_put(node);
>  				goto err_node;
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
