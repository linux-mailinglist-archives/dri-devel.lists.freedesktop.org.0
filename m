Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6653C8009
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 10:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC1D899A3;
	Wed, 14 Jul 2021 08:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA180899A3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 08:28:51 +0000 (UTC)
Received: from [IPv6:2a02:810a:880:f54:e49e:3ed0:1a77:5623] (unknown
 [IPv6:2a02:810a:880:f54:e49e:3ed0:1a77:5623])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C8B601F42822;
 Wed, 14 Jul 2021 09:28:48 +0100 (BST)
Subject: Re: [PATCH v6 04/11] media: mtk-jpeg: Get rid of mtk_smi_larb_get/put
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20210714025626.5528-1-yong.wu@mediatek.com>
 <20210714025626.5528-5-yong.wu@mediatek.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <2753c4b1-76e7-9acd-ca1c-62e6017ed971@collabora.com>
Date: Wed, 14 Jul 2021 10:28:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714025626.5528-5-yong.wu@mediatek.com>
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
 Nicolas Boichat <drinkcat@chromium.org>, Rick Chang <rick.chang@mediatek.com>,
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
> MediaTek IOMMU has already added device_link between the consumer
> and smi-larb device. If the jpg device call the pm_runtime_get_sync,
> the smi-larb's pm_runtime_get_sync also be called automatically.
> 
> After removing the larb_get operations, then mtk_jpeg_clk_init is
> also unnecessary. Remove it too.
> 
> CC: Rick Chang <rick.chang@mediatek.com>
> CC: Xia Jiang <xia.jiang@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: Evan Green <evgreen@chromium.org>
> Acked-by: Rick Chang <rick.chang@mediatek.com>

Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

> ---
>   .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 45 +------------------
>   .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  2 -
>   2 files changed, 2 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index a89c7b206eef..4fea2c512434 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -22,7 +22,6 @@
>   #include <media/v4l2-ioctl.h>
>   #include <media/videobuf2-core.h>
>   #include <media/videobuf2-dma-contig.h>
> -#include <soc/mediatek/smi.h>
>   
>   #include "mtk_jpeg_enc_hw.h"
>   #include "mtk_jpeg_dec_hw.h"
> @@ -1055,10 +1054,6 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
>   {
>   	int ret;
>   
> -	ret = mtk_smi_larb_get(jpeg->larb);
> -	if (ret)
> -		dev_err(jpeg->dev, "mtk_smi_larb_get larbvdec fail %d\n", ret);
> -
>   	ret = clk_bulk_prepare_enable(jpeg->variant->num_clks,
>   				      jpeg->variant->clks);
>   	if (ret)
> @@ -1069,7 +1064,6 @@ static void mtk_jpeg_clk_off(struct mtk_jpeg_dev *jpeg)
>   {
>   	clk_bulk_disable_unprepare(jpeg->variant->num_clks,
>   				   jpeg->variant->clks);
> -	mtk_smi_larb_put(jpeg->larb);
>   }
>   
>   static irqreturn_t mtk_jpeg_enc_done(struct mtk_jpeg_dev *jpeg)
> @@ -1284,35 +1278,6 @@ static struct clk_bulk_data mtk_jpeg_clocks[] = {
>   	{ .id = "jpgenc" },
>   };
>   
> -static int mtk_jpeg_clk_init(struct mtk_jpeg_dev *jpeg)
> -{
> -	struct device_node *node;
> -	struct platform_device *pdev;
> -	int ret;
> -
> -	node = of_parse_phandle(jpeg->dev->of_node, "mediatek,larb", 0);
> -	if (!node)
> -		return -EINVAL;
> -	pdev = of_find_device_by_node(node);
> -	if (WARN_ON(!pdev)) {
> -		of_node_put(node);
> -		return -EINVAL;
> -	}
> -	of_node_put(node);
> -
> -	jpeg->larb = &pdev->dev;
> -
> -	ret = devm_clk_bulk_get(jpeg->dev, jpeg->variant->num_clks,
> -				jpeg->variant->clks);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to get jpeg clock:%d\n", ret);
> -		put_device(&pdev->dev);
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
>   static void mtk_jpeg_job_timeout_work(struct work_struct *work)
>   {
>   	struct mtk_jpeg_dev *jpeg = container_of(work, struct mtk_jpeg_dev,
> @@ -1333,11 +1298,6 @@ static void mtk_jpeg_job_timeout_work(struct work_struct *work)
>   	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
>   }
>   
> -static inline void mtk_jpeg_clk_release(struct mtk_jpeg_dev *jpeg)
> -{
> -	put_device(jpeg->larb);
> -}
> -
>   static int mtk_jpeg_probe(struct platform_device *pdev)
>   {
>   	struct mtk_jpeg_dev *jpeg;
> @@ -1376,7 +1336,8 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>   		goto err_req_irq;
>   	}
>   
> -	ret = mtk_jpeg_clk_init(jpeg);
> +	ret = devm_clk_bulk_get(jpeg->dev, jpeg->variant->num_clks,
> +				jpeg->variant->clks);
>   	if (ret) {
>   		dev_err(&pdev->dev, "Failed to init clk, err %d\n", ret);
>   		goto err_clk_init;
> @@ -1442,7 +1403,6 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>   	v4l2_device_unregister(&jpeg->v4l2_dev);
>   
>   err_dev_register:
> -	mtk_jpeg_clk_release(jpeg);
>   
>   err_clk_init:
>   
> @@ -1460,7 +1420,6 @@ static int mtk_jpeg_remove(struct platform_device *pdev)
>   	video_device_release(jpeg->vdev);
>   	v4l2_m2m_release(jpeg->m2m_dev);
>   	v4l2_device_unregister(&jpeg->v4l2_dev);
> -	mtk_jpeg_clk_release(jpeg);
>   
>   	return 0;
>   }
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> index 595f7f10c9fd..3e4811a41ba2 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
> @@ -85,7 +85,6 @@ struct mtk_jpeg_variant {
>    * @alloc_ctx:		videobuf2 memory allocator's context
>    * @vdev:		video device node for jpeg mem2mem mode
>    * @reg_base:		JPEG registers mapping
> - * @larb:		SMI device
>    * @job_timeout_work:	IRQ timeout structure
>    * @variant:		driver variant to be used
>    */
> @@ -99,7 +98,6 @@ struct mtk_jpeg_dev {
>   	void			*alloc_ctx;
>   	struct video_device	*vdev;
>   	void __iomem		*reg_base;
> -	struct device		*larb;
>   	struct delayed_work job_timeout_work;
>   	const struct mtk_jpeg_variant *variant;
>   };
> 
