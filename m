Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1981A425222
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 13:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F0456F417;
	Thu,  7 Oct 2021 11:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3246F417
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 11:37:39 +0000 (UTC)
Received: from [IPv6:2a01:e0a:4cb:a870:f328:d7c8:496e:3dd] (unknown
 [IPv6:2a01:e0a:4cb:a870:f328:d7c8:496e:3dd])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: benjamin.gaignard)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F076B1F44FA3;
 Thu,  7 Oct 2021 12:37:36 +0100 (BST)
Subject: Re: [PATCH v6, 12/15] media: mtk-vcodec: Support 34bits dma address
 for vdec
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Irui Wang <irui.wang@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
 <20210901083215.25984-13-yunfei.dong@mediatek.com>
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <09ce48f4-a785-97d9-2920-eacb39c59573@collabora.com>
Date: Thu, 7 Oct 2021 13:37:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210901083215.25984-13-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


Le 01/09/2021 à 10:32, Yunfei Dong a écrit :
> Use the dma_set_mask_and_coherent helper to set vdec
> DMA bit mask to support 34bits iova space(16GB) that
> the mt8192 iommu HW support.
>
> Whole the iova range separate to 0~4G/4G~8G/8G~12G/12G~16G,
> regarding which iova range VDEC actually locate, it
> depends on the dma-ranges property of vdec dtsi node.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>   drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> index 002352fcf8de..1a8d9308327d 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> @@ -417,6 +417,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> +	if (of_get_property(pdev->dev.of_node, "dma-ranges", NULL))
> +		dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
> +

Hi Yunfei,

Does all SoC support 34bits iova space ?
If not you need to also check SoC version before setting dma mask.

Regards,
Benjamin

>   	for (i = 0; i < MTK_VDEC_HW_MAX; i++)
>   		mutex_init(&dev->dec_mutex[i]);
>   	spin_lock_init(&dev->irqlock);
