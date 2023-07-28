Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3945C766681
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 10:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2767C10E68A;
	Fri, 28 Jul 2023 08:11:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5748D10E687
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 08:11:11 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3EA5E660716B;
 Fri, 28 Jul 2023 09:11:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690531870;
 bh=EkunT6qAlkxVx2kwaXu/dTKwauLQQrcXBadtGCTRZEs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PQUfV85PpvBErXe+c+hvH0w/WQAUI3Dle9FXOpG/oVyKN5g2n6zRN9h4EVvvklnTM
 TWcthWyAutv6fk5UD2vuqcYaNCVr7U+NBZpbTW3Z3imE/MRuhQc+WxD2jY+GgiDjZi
 rb8BZma2PX3hsOuPOachVx4Iv0sg6l6WjEHariGaYdfFUQNh3ur6Zan0uIqLVmDR30
 T3FjM5lQsoRKa7t58PKFUeQQUn9RmRm4WNQCKPvkdC8STgE700ZwcpI+Og41YWRxoF
 s9a0Du+eFVFkffjigHItMUvWDEmzUaJ7rS52WauB3+WiPBJ6F4J0/NciA7Z2hub5ku
 hNtpK7W42hI3g==
Message-ID: <7ba4f465-6910-8b23-e950-98598547e8d9@collabora.com>
Date: Fri, 28 Jul 2023 10:11:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 3/4] drm/mediatek: Add ability to support dynamic
 connector selection
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20230727164114.20638-1-jason-jh.lin@mediatek.com>
 <20230727164114.20638-4-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230727164114.20638-4-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 27/07/23 18:41, Jason-JH.Lin ha scritto:
> 1. Move output drm connector from each ddp_path array to connector array.
> 2. Add dynamic select available connector flow in crtc create and enable.
> 
> Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  1 +
>   drivers/gpu/drm/mediatek/mtk_dpi.c          |  9 +++
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 75 ++++++++++++++++++++-
>   drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  5 +-
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 26 +++++++
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  8 +++
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c      | 20 ++++--
>   drivers/gpu/drm/mediatek/mtk_drm_drv.h      |  7 ++
>   8 files changed, 145 insertions(+), 6 deletions(-)
> 

..snip..

> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index f114da4d36a9..bc7b0a0c20db 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -304,6 +304,7 @@ static const struct mtk_ddp_comp_funcs ddp_dither = {
>   static const struct mtk_ddp_comp_funcs ddp_dpi = {
>   	.start = mtk_dpi_start,
>   	.stop = mtk_dpi_stop,
> +	.encoder_index = mtk_dpi_encoder_index,
>   };
>   
>   static const struct mtk_ddp_comp_funcs ddp_dsc = {
> @@ -507,6 +508,25 @@ static bool mtk_drm_find_comp_in_ddp(struct device *dev,
>   	return false;
>   }
>   
> +static int mtk_drm_find_comp_in_ddp_conn_path(struct device *dev,
> +					      const struct mtk_drm_route *routes,
> +					      unsigned int routes_num,

`num_routes` would be more readable.

> +					      struct mtk_ddp_comp *ddp_comp)
> +{
> +	unsigned int i;
> +
> +	if (!routes)
> +		return 0;

if (!routes)
	return -EINVAL;

> +
> +	for (i = 0; i < routes_num; i++)
> +		if (dev == ddp_comp[routes[i].route_ddp].dev)
> +			return BIT(routes[i].crtc_id);
> +
> +	DRM_INFO("Failed to find comp in ddp connector table\n");

This print is redundant.

> +
> +	return 0;

return -ENODEV;

> +}
> +
>   int mtk_ddp_comp_get_id(struct device_node *node,
>   			enum mtk_ddp_comp_type comp_type)
>   {
> @@ -538,6 +558,12 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
>   					  private->data->third_len, private->ddp_comp))
>   		ret = BIT(2);
>   	else
> +		ret = mtk_drm_find_comp_in_ddp_conn_path(dev,
> +							 private->data->conn_routes,
> +							 private->data->num_conn_routes,
> +							 private->ddp_comp);
> +
> +	if (ret == 0)

if (ret < 0)

>   		DRM_INFO("Failed to find comp in ddp table\n");
>   
>   	return ret;

Regards,
Angelo



