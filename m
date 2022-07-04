Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA87565BD2
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8B210F6D9;
	Mon,  4 Jul 2022 16:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C483210E028
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 09:16:32 +0000 (UTC)
X-UUID: e9b2141855f94f6dbd5189379df3b4be-20220704
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7, REQID:5cab4f8f-2ec6-4f62-9f19-39fded9d65c4, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:87442a2, CLOUDID:65087d86-57f0-47ca-ba27-fe8c57fbf305,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: e9b2141855f94f6dbd5189379df3b4be-20220704
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1370740734; Mon, 04 Jul 2022 17:16:28 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 4 Jul 2022 17:16:27 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 4 Jul 2022 17:16:27 +0800
Message-ID: <870cac7815d0f2ec9cfe4a18b19c141723fcd178.camel@mediatek.com>
Subject: Re: [PATCH] drm/mediatek: ensure bridge disable happends before
 suspend
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 4 Jul 2022 17:16:27 +0800
In-Reply-To: <20220629190545.478113-1-hsinyi@chromium.org>
References: <20220629190545.478113-1-hsinyi@chromium.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Hsin-yi:

On Thu, 2022-06-30 at 03:05 +0800, Hsin-Yi Wang wrote:
> Make sure bridge_disable will be called before suspend by calling
> drm_mode_config_helper_suspend() in .prepare callback.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> The issue is found if suspend is called via VT2 in several MTK SoC
> (eg.
> MT8173, MT8183, MT8186) chromebook boards with eDP bridge:
> bridge disable is called through mtk-drm's suspend, and it needs to
> be
> called before bridge pm runtime suspend.
> So we move the hook to .prepare() and .complete().
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 13a1bbe7ead7f..a42812e490007 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -828,8 +828,7 @@ static int mtk_drm_remove(struct platform_device
> *pdev)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_PM_SLEEP
> -static int mtk_drm_sys_suspend(struct device *dev)
> +static int mtk_drm_sys_prepare(struct device *dev)
>  {
>  	struct mtk_drm_private *private = dev_get_drvdata(dev);
>  	struct drm_device *drm = private->drm;
> @@ -840,20 +839,21 @@ static int mtk_drm_sys_suspend(struct device
> *dev)
>  	return ret;
>  }
>  
> -static int mtk_drm_sys_resume(struct device *dev)
> +static void mtk_drm_sys_complete(struct device *dev)
>  {
>  	struct mtk_drm_private *private = dev_get_drvdata(dev);
>  	struct drm_device *drm = private->drm;
>  	int ret;
>  
>  	ret = drm_mode_config_helper_resume(drm);
> -
> -	return ret;
> +	if (ret)
> +		dev_err(dev, "Failed to resume\n");
>  }
> -#endif
>  
> -static SIMPLE_DEV_PM_OPS(mtk_drm_pm_ops, mtk_drm_sys_suspend,
> -			 mtk_drm_sys_resume);
> +static const struct dev_pm_ops mtk_drm_pm_ops = {
> +	.prepare = mtk_drm_sys_prepare,
> +	.complete = mtk_drm_sys_complete,
> +};
>  
>  static struct platform_driver mtk_drm_platform_driver = {
>  	.probe	= mtk_drm_probe,

