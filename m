Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E5454485F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 12:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDCC10F0F0;
	Thu,  9 Jun 2022 10:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0321410F0F0
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 10:09:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BCF8FB82C86;
 Thu,  9 Jun 2022 10:08:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE40C34114;
 Thu,  9 Jun 2022 10:08:51 +0000 (UTC)
Message-ID: <3cd958be-41a8-707d-983a-c9950e913ae5@xs4all.nl>
Date: Thu, 9 Jun 2022 12:08:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 1/4] media: mediatek: vcodec: Fix decoder v4l2 bus_info
 not correctly
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
References: <20220526095737.21118-1-yunfei.dong@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220526095737.21118-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yunfei Dong,

On 5/26/22 11:57, Yunfei Dong wrote:
> Fix v4l2 capability bus_info value with correct chip name according to compatible.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>  .../platform/mediatek/vcodec/mtk_vcodec_dec.c | 23 ++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> index 52e5d36aa912..ccfa426a34ab 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> @@ -185,11 +185,32 @@ static int vidioc_vdec_dqbuf(struct file *file, void *priv,
>  	return v4l2_m2m_dqbuf(file, ctx->m2m_ctx, buf);
>  }
>  
> +static int mtk_vcodec_dec_get_chip_name(void *priv)
> +{
> +	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
> +	struct device *dev = &ctx->dev->plat_dev->dev;
> +
> +	if (of_device_is_compatible(dev->of_node, "mediatek,mt8173-vcodec-dec"))
> +		return 8173;
> +	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8183-vcodec-dec"))
> +		return 8183;
> +	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8192-vcodec-dec"))
> +		return 8192;
> +	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8195-vcodec-dec"))
> +		return 8195;
> +	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8186-vcodec-dec"))
> +		return 8186;
> +	else
> +		return 8173;
> +}

Nice, but...

> +
>  static int vidioc_vdec_querycap(struct file *file, void *priv,
>  				struct v4l2_capability *cap)
>  {
> +	int platform_name = mtk_vcodec_dec_get_chip_name(priv);
> +
>  	strscpy(cap->driver, MTK_VCODEC_DEC_NAME, sizeof(cap->driver));
> -	strscpy(cap->bus_info, MTK_PLATFORM_STR, sizeof(cap->bus_info));
> +	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:mt%d", platform_name);

...this will result in identical bus_info values for the decoder and encoder
video devices. The bus_info field is supposed to be unique, and that's now
no longer the case.

I suggest changing this to:

	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:mt%d-dec", platform_name);

(and '-enc' for the encoder patch).

Regards,

	Hans

>  	strscpy(cap->card, MTK_PLATFORM_STR, sizeof(cap->card));
>  
>  	return 0;
