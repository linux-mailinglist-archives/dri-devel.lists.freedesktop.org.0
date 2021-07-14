Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE5A3C801F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 10:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE0DC6E1A8;
	Wed, 14 Jul 2021 08:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 216356E1A8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 08:31:26 +0000 (UTC)
Received: from [IPv6:2a02:810a:880:f54:e49e:3ed0:1a77:5623] (unknown
 [IPv6:2a02:810a:880:f54:e49e:3ed0:1a77:5623])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A31B81F42822;
 Wed, 14 Jul 2021 09:31:23 +0100 (BST)
Subject: Re: [PATCH v6 08/11] media: mtk-vcodec: Get rid of
 mtk_smi_larb_get/put
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20210714025626.5528-1-yong.wu@mediatek.com>
 <20210714025626.5528-9-yong.wu@mediatek.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <61f0bc1f-3324-4c3d-2cc6-daa0d9ad4769@collabora.com>
Date: Wed, 14 Jul 2021 10:31:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714025626.5528-9-yong.wu@mediatek.com>
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
Cc: Xia Jiang <xia.jiang@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Irui Wang <irui.wang@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>,
 Evan Green <evgreen@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, yi.kuo@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 ming-fan.chen@mediatek.com, Tiffany Lin <tiffany.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, anan.sun@mediatek.com,
 srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14.07.21 04:56, Yong Wu wrote:
> MediaTek IOMMU has already added the device_link between the consumer
> and smi-larb device. If the vcodec device call the pm_runtime_get_sync,
> the smi-larb's pm_runtime_get_sync also be called automatically.
> 
> CC: Tiffany Lin <tiffany.lin@mediatek.com>
> CC: Irui Wang <irui.wang@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: Evan Green <evgreen@chromium.org>
> Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>

Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

> ---
>   .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 37 +++-------------
>   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 --
>   .../platform/mtk-vcodec/mtk_vcodec_enc.c      |  1 -
>   .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 44 +++----------------
>   4 files changed, 10 insertions(+), 75 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> index 6038db96f71c..d0bf9aa3b29d 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> @@ -8,14 +8,12 @@
>   #include <linux/of_address.h>
>   #include <linux/of_platform.h>
>   #include <linux/pm_runtime.h>
> -#include <soc/mediatek/smi.h>
>   
>   #include "mtk_vcodec_dec_pm.h"
>   #include "mtk_vcodec_util.h"
>   
>   int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
>   {
> -	struct device_node *node;
>   	struct platform_device *pdev;
>   	struct mtk_vcodec_pm *pm;
>   	struct mtk_vcodec_clk *dec_clk;
> @@ -26,18 +24,7 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
>   	pm = &mtkdev->pm;
>   	pm->mtkdev = mtkdev;
>   	dec_clk = &pm->vdec_clk;
> -	node = of_parse_phandle(pdev->dev.of_node, "mediatek,larb", 0);
> -	if (!node) {
> -		mtk_v4l2_err("of_parse_phandle mediatek,larb fail!");
> -		return -1;
> -	}
>   
> -	pdev = of_find_device_by_node(node);
> -	of_node_put(node);
> -	if (WARN_ON(!pdev)) {
> -		return -1;
> -	}
> -	pm->larbvdec = &pdev->dev;
>   	pdev = mtkdev->plat_dev;
>   	pm->dev = &pdev->dev;
>   
> @@ -47,14 +34,11 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
>   		dec_clk->clk_info = devm_kcalloc(&pdev->dev,
>   			dec_clk->clk_num, sizeof(*clk_info),
>   			GFP_KERNEL);
> -		if (!dec_clk->clk_info) {
> -			ret = -ENOMEM;
> -			goto put_device;
> -		}
> +		if (!dec_clk->clk_info)
> +			return -ENOMEM;
>   	} else {
>   		mtk_v4l2_err("Failed to get vdec clock count");
> -		ret = -EINVAL;
> -		goto put_device;
> +		return -EINVAL;
>   	}
>   
>   	for (i = 0; i < dec_clk->clk_num; i++) {
> @@ -63,29 +47,24 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
>   			"clock-names", i, &clk_info->clk_name);
>   		if (ret) {
>   			mtk_v4l2_err("Failed to get clock name id = %d", i);
> -			goto put_device;
> +			return ret;
>   		}
>   		clk_info->vcodec_clk = devm_clk_get(&pdev->dev,
>   			clk_info->clk_name);
>   		if (IS_ERR(clk_info->vcodec_clk)) {
>   			mtk_v4l2_err("devm_clk_get (%d)%s fail", i,
>   				clk_info->clk_name);
> -			ret = PTR_ERR(clk_info->vcodec_clk);
> -			goto put_device;
> +			return PTR_ERR(clk_info->vcodec_clk);
>   		}
>   	}
>   
>   	pm_runtime_enable(&pdev->dev);
>   	return 0;
> -put_device:
> -	put_device(pm->larbvdec);
> -	return ret;
>   }
>   
>   void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev)
>   {
>   	pm_runtime_disable(dev->pm.dev);
> -	put_device(dev->pm.larbvdec);
>   }
>   
>   int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
> @@ -122,11 +101,6 @@ void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
>   		}
>   	}
>   
> -	ret = mtk_smi_larb_get(pm->larbvdec);
> -	if (ret) {
> -		mtk_v4l2_err("mtk_smi_larb_get larbvdec fail %d", ret);
> -		goto error;
> -	}
>   	return;
>   
>   error:
> @@ -139,7 +113,6 @@ void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm)
>   	struct mtk_vcodec_clk *dec_clk = &pm->vdec_clk;
>   	int i = 0;
>   
> -	mtk_smi_larb_put(pm->larbvdec);
>   	for (i = dec_clk->clk_num - 1; i >= 0; i--)
>   		clk_disable_unprepare(dec_clk->clk_info[i].vcodec_clk);
>   }
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index c6c7672fecfb..64b73dd880ce 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -189,10 +189,7 @@ struct mtk_vcodec_clk {
>    */
>   struct mtk_vcodec_pm {
>   	struct mtk_vcodec_clk	vdec_clk;
> -	struct device	*larbvdec;
> -
>   	struct mtk_vcodec_clk	venc_clk;
> -	struct device	*larbvenc;
>   	struct device	*dev;
>   	struct mtk_vcodec_dev	*mtkdev;
>   };
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index 416f356af363..9a1515cf862d 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -8,7 +8,6 @@
>   #include <media/v4l2-event.h>
>   #include <media/v4l2-mem2mem.h>
>   #include <media/videobuf2-dma-contig.h>
> -#include <soc/mediatek/smi.h>
>   #include <linux/pm_runtime.h>
>   
>   #include "mtk_vcodec_drv.h"
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> index 1b2e4930ed27..dffb190267ed 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> @@ -8,58 +8,36 @@
>   #include <linux/of_address.h>
>   #include <linux/of_platform.h>
>   #include <linux/pm_runtime.h>
> -#include <soc/mediatek/smi.h>
>   
>   #include "mtk_vcodec_enc_pm.h"
>   #include "mtk_vcodec_util.h"
>   
>   int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
>   {
> -	struct device_node *node;
>   	struct platform_device *pdev;
>   	struct mtk_vcodec_pm *pm;
>   	struct mtk_vcodec_clk *enc_clk;
>   	struct mtk_vcodec_clk_info *clk_info;
>   	int ret = 0, i = 0;
> -	struct device *dev;
>   
>   	pdev = mtkdev->plat_dev;
>   	pm = &mtkdev->pm;
>   	memset(pm, 0, sizeof(struct mtk_vcodec_pm));
>   	pm->mtkdev = mtkdev;
>   	pm->dev = &pdev->dev;
> -	dev = &pdev->dev;
>   	enc_clk = &pm->venc_clk;
>   
> -	node = of_parse_phandle(dev->of_node, "mediatek,larb", 0);
> -	if (!node) {
> -		mtk_v4l2_err("no mediatek,larb found");
> -		return -ENODEV;
> -	}
> -	pdev = of_find_device_by_node(node);
> -	of_node_put(node);
> -	if (!pdev) {
> -		mtk_v4l2_err("no mediatek,larb device found");
> -		return -ENODEV;
> -	}
> -	pm->larbvenc = &pdev->dev;
> -	pdev = mtkdev->plat_dev;
> -	pm->dev = &pdev->dev;
> -
>   	enc_clk->clk_num = of_property_count_strings(pdev->dev.of_node,
>   		"clock-names");
>   	if (enc_clk->clk_num > 0) {
>   		enc_clk->clk_info = devm_kcalloc(&pdev->dev,
>   			enc_clk->clk_num, sizeof(*clk_info),
>   			GFP_KERNEL);
> -		if (!enc_clk->clk_info) {
> -			ret = -ENOMEM;
> -			goto put_larbvenc;
> -		}
> +		if (!enc_clk->clk_info)
> +			return -ENOMEM;
>   	} else {
>   		mtk_v4l2_err("Failed to get venc clock count");
> -		ret = -EINVAL;
> -		goto put_larbvenc;
> +		return -EINVAL;
>   	}
>   
>   	for (i = 0; i < enc_clk->clk_num; i++) {
> @@ -68,29 +46,23 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
>   			"clock-names", i, &clk_info->clk_name);
>   		if (ret) {
>   			mtk_v4l2_err("venc failed to get clk name %d", i);
> -			goto put_larbvenc;
> +			return ret;
>   		}
>   		clk_info->vcodec_clk = devm_clk_get(&pdev->dev,
>   			clk_info->clk_name);
>   		if (IS_ERR(clk_info->vcodec_clk)) {
>   			mtk_v4l2_err("venc devm_clk_get (%d)%s fail", i,
>   				clk_info->clk_name);
> -			ret = PTR_ERR(clk_info->vcodec_clk);
> -			goto put_larbvenc;
> +			return PTR_ERR(clk_info->vcodec_clk);
>   		}
>   	}
>   
>   	return 0;
> -
> -put_larbvenc:
> -	put_device(pm->larbvenc);
> -	return ret;
>   }
>   
>   void mtk_vcodec_release_enc_pm(struct mtk_vcodec_dev *mtkdev)
>   {
>   	pm_runtime_disable(mtkdev->pm.dev);
> -	put_device(mtkdev->pm.larbvenc);
>   }
>   
>   
> @@ -108,11 +80,6 @@ void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm)
>   		}
>   	}
>   
> -	ret = mtk_smi_larb_get(pm->larbvenc);
> -	if (ret) {
> -		mtk_v4l2_err("mtk_smi_larb_get larb3 fail %d", ret);
> -		goto clkerr;
> -	}
>   	return;
>   
>   clkerr:
> @@ -125,7 +92,6 @@ void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm)
>   	struct mtk_vcodec_clk *enc_clk = &pm->venc_clk;
>   	int i = 0;
>   
> -	mtk_smi_larb_put(pm->larbvenc);
>   	for (i = enc_clk->clk_num - 1; i >= 0; i--)
>   		clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
>   }
> 
