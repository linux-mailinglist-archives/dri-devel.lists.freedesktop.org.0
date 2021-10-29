Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF6743FB77
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 13:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7756E50E;
	Fri, 29 Oct 2021 11:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F726E50E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 11:35:46 +0000 (UTC)
Received: from [IPv6:2a02:810a:880:f54:6141:93b5:19a6:af87] (unknown
 [IPv6:2a02:810a:880:f54:6141:93b5:19a6:af87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 137BD1F45952;
 Fri, 29 Oct 2021 12:35:42 +0100 (BST)
Subject: Re: [PATCH v8, 03/17] media: mtk-vcodec: Refactor vcodec pm interface
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Tzung-Bi Shih <tzungbi@google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20211029035527.454-1-yunfei.dong@mediatek.com>
 <20211029035527.454-4-yunfei.dong@mediatek.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <2a25abdc-691b-9409-15ed-980af460c6c6@collabora.com>
Date: Fri, 29 Oct 2021 13:35:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029035527.454-4-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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



On 29.10.21 05:55, Yunfei Dong wrote:
> Using the needed param for pm init/release function and remove unused
> param mtkdev in 'struct mtk_vcodec_pm'.
> 
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Hi,
I already commented on v7 that since the pm implementation for dec and enc is identical,
you should better do the same refactor to enc and dec or better remove the code duplication.

Thanks,
Dafna

> ---
>   .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  6 ++---
>   .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 22 ++++++++-----------
>   .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |  5 +++--
>   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  1 -
>   .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |  1 -
>   5 files changed, 15 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index 055d50e52720..3ac4c3935e4e 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -249,7 +249,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>   	if (IS_ERR(dev->fw_handler))
>   		return PTR_ERR(dev->fw_handler);
>   
> -	ret = mtk_vcodec_init_dec_pm(dev);
> +	ret = mtk_vcodec_init_dec_pm(dev->plat_dev, &dev->pm);
>   	if (ret < 0) {
>   		dev_err(&pdev->dev, "Failed to get mt vcodec clock source");
>   		goto err_dec_pm;
> @@ -378,7 +378,7 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>   err_dec_alloc:
>   	v4l2_device_unregister(&dev->v4l2_dev);
>   err_res:
> -	mtk_vcodec_release_dec_pm(dev);
> +	mtk_vcodec_release_dec_pm(&dev->pm);
>   err_dec_pm:
>   	mtk_vcodec_fw_release(dev->fw_handler);
>   	return ret;
> @@ -418,7 +418,7 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
>   		video_unregister_device(dev->vfd_dec);
>   
>   	v4l2_device_unregister(&dev->v4l2_dev);
> -	mtk_vcodec_release_dec_pm(dev);
> +	mtk_vcodec_release_dec_pm(&dev->pm);
>   	mtk_vcodec_fw_release(dev->fw_handler);
>   	return 0;
>   }
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> index 6038db96f71c..20bd157a855c 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> @@ -13,18 +13,15 @@
>   #include "mtk_vcodec_dec_pm.h"
>   #include "mtk_vcodec_util.h"
>   
> -int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
> +int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
> +	struct mtk_vcodec_pm *pm)
>   {
>   	struct device_node *node;
> -	struct platform_device *pdev;
> -	struct mtk_vcodec_pm *pm;
> +	struct platform_device *larb_pdev;
>   	struct mtk_vcodec_clk *dec_clk;
>   	struct mtk_vcodec_clk_info *clk_info;
>   	int i = 0, ret = 0;
>   
> -	pdev = mtkdev->plat_dev;
> -	pm = &mtkdev->pm;
> -	pm->mtkdev = mtkdev;
>   	dec_clk = &pm->vdec_clk;
>   	node = of_parse_phandle(pdev->dev.of_node, "mediatek,larb", 0);
>   	if (!node) {
> @@ -32,13 +29,12 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
>   		return -1;
>   	}
>   
> -	pdev = of_find_device_by_node(node);
> +	larb_pdev = of_find_device_by_node(node);
>   	of_node_put(node);
> -	if (WARN_ON(!pdev)) {
> +	if (WARN_ON(!larb_pdev)) {
>   		return -1;
>   	}
> -	pm->larbvdec = &pdev->dev;
> -	pdev = mtkdev->plat_dev;
> +	pm->larbvdec = &larb_pdev->dev;
>   	pm->dev = &pdev->dev;
>   
>   	dec_clk->clk_num =
> @@ -82,10 +78,10 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
>   	return ret;
>   }
>   
> -void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev)
> +void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm)
>   {
> -	pm_runtime_disable(dev->pm.dev);
> -	put_device(dev->pm.larbvdec);
> +	pm_runtime_disable(pm->dev);
> +	put_device(pm->larbvdec);
>   }
>   
>   int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
> index 280aeaefdb65..a3df6aef6cb9 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
> @@ -9,8 +9,9 @@
>   
>   #include "mtk_vcodec_drv.h"
>   
> -int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *dev);
> -void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev);
> +int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
> +	struct mtk_vcodec_pm *pm);
> +void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm);
>   
>   int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm);
>   void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm);
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 1d2370608d0d..0fa9d85114b9 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -195,7 +195,6 @@ struct mtk_vcodec_pm {
>   	struct mtk_vcodec_clk	venc_clk;
>   	struct device	*larbvenc;
>   	struct device	*dev;
> -	struct mtk_vcodec_dev	*mtkdev;
>   };
>   
>   /**
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> index 1b2e4930ed27..0c8c8f86788c 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> @@ -26,7 +26,6 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
>   	pdev = mtkdev->plat_dev;
>   	pm = &mtkdev->pm;
>   	memset(pm, 0, sizeof(struct mtk_vcodec_pm));
> -	pm->mtkdev = mtkdev;
>   	pm->dev = &pdev->dev;
>   	dev = &pdev->dev;
>   	enc_clk = &pm->venc_clk;
> 
