Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 634BD7CF396
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 11:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66D710E4A2;
	Thu, 19 Oct 2023 09:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0ADB10E4A2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 09:10:11 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 447F46607322;
 Thu, 19 Oct 2023 10:10:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697706610;
 bh=6NkwFDgWb/X/jYOH8bEds6VmnsGIsFGtiEKSMzCUZYY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Y/7g/d7dL9TZcG3/BQm1YCsHmANvQhFhrsYk0HkfUkSBmpTeJXt1DxN2itG6BUQJT
 Let4OzWB82X6Y4F7gQ8HcpnUS1rHwZFWejXoGmNnemPihgPKntGLGWlxLuWV+LMTcY
 Bsde1Wptf5usUVAjD1iEWHPLrIPeRDVKeXKctKX88q/Yzk7GxtXdZhcGLiITl35r02
 P7nk4zcCmW/8rSGHt+ntGsRtd+opQ8DVjBJQvoDDtml4ZPp8B/Ja/nnwW9ttfXUTdA
 yslzYhQ/XtnC+cyf83ydPthWd7vvyeZWmA+rvRky1UScwl9pEReOBxyp5U2qC8x22O
 tZMN9vHxlEfyA==
Message-ID: <0a3b0755-73e3-4698-9a3a-be38578ceb3f@collabora.com>
Date: Thu, 19 Oct 2023 11:10:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 20/24] drm/mediatek: Add Padding to OVL adaptor
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20231019055619.19358-1-shawn.sung@mediatek.com>
 <20231019055619.19358-21-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231019055619.19358-21-shawn.sung@mediatek.com>
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Moudy Ho <moudy.ho@mediatek.com>, Fei Shao <fshao@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Sean Paul <sean@poorly.run>,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 19/10/23 07:56, Hsiao Chien Sung ha scritto:
> Add MT8188 Padding to OVL adaptor to probe the driver.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>   .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 26 +++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> index f46ca1c68610..f693b47745ba 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> @@ -29,6 +29,7 @@ enum mtk_ovl_adaptor_comp_type {
>   	OVL_ADAPTOR_TYPE_ETHDR,
>   	OVL_ADAPTOR_TYPE_MDP_RDMA,
>   	OVL_ADAPTOR_TYPE_MERGE,
> +	OVL_ADAPTOR_TYPE_PADDING,
>   	OVL_ADAPTOR_TYPE_NUM,
>   };
>   
> @@ -46,6 +47,14 @@ enum mtk_ovl_adaptor_comp_id {
>   	OVL_ADAPTOR_MERGE1,
>   	OVL_ADAPTOR_MERGE2,
>   	OVL_ADAPTOR_MERGE3,
> +	OVL_ADAPTOR_PADDING0,
> +	OVL_ADAPTOR_PADDING1,
> +	OVL_ADAPTOR_PADDING2,
> +	OVL_ADAPTOR_PADDING3,
> +	OVL_ADAPTOR_PADDING4,
> +	OVL_ADAPTOR_PADDING5,
> +	OVL_ADAPTOR_PADDING6,
> +	OVL_ADAPTOR_PADDING7,
>   	OVL_ADAPTOR_ID_MAX
>   };
>   
> @@ -66,6 +75,7 @@ static const char * const private_comp_stem[OVL_ADAPTOR_TYPE_NUM] = {
>   	[OVL_ADAPTOR_TYPE_ETHDR]	= "ethdr",
>   	[OVL_ADAPTOR_TYPE_MDP_RDMA]	= "vdo1-rdma",
>   	[OVL_ADAPTOR_TYPE_MERGE]	= "merge",
> +	[OVL_ADAPTOR_TYPE_PADDING]	= "padding",
>   };
>   
>   static const struct mtk_ddp_comp_funcs ethdr = {
> @@ -80,6 +90,13 @@ static const struct mtk_ddp_comp_funcs merge = {
>   	.clk_disable = mtk_merge_clk_disable,
>   };
>   
> +static const struct mtk_ddp_comp_funcs padding = {
> +	.clk_enable = mtk_padding_clk_enable,
> +	.clk_disable = mtk_padding_clk_disable,
> +	.start = mtk_padding_start,
> +	.stop = mtk_padding_stop,
> +};
> +
>   static const struct mtk_ddp_comp_funcs rdma = {
>   	.power_on = mtk_mdp_rdma_power_on,
>   	.power_off = mtk_mdp_rdma_power_off,
> @@ -101,6 +118,14 @@ static const struct ovl_adaptor_comp_match comp_matches[OVL_ADAPTOR_ID_MAX] = {
>   	[OVL_ADAPTOR_MERGE1] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE2, 2, &merge },
>   	[OVL_ADAPTOR_MERGE2] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE3, 3, &merge },
>   	[OVL_ADAPTOR_MERGE3] = { OVL_ADAPTOR_TYPE_MERGE, DDP_COMPONENT_MERGE4, 4, &merge },
> +	[OVL_ADAPTOR_PADDING0] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_PADDING0, 0, &padding },
> +	[OVL_ADAPTOR_PADDING1] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_PADDING1, 1, &padding },
> +	[OVL_ADAPTOR_PADDING2] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_PADDING2, 2, &padding },
> +	[OVL_ADAPTOR_PADDING3] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_PADDING3, 3, &padding },
> +	[OVL_ADAPTOR_PADDING4] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_PADDING4, 4, &padding },
> +	[OVL_ADAPTOR_PADDING5] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_PADDING5, 5, &padding },
> +	[OVL_ADAPTOR_PADDING6] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_PADDING6, 6, &padding },
> +	[OVL_ADAPTOR_PADDING7] = { OVL_ADAPTOR_TYPE_PADDING, DDP_COMPONENT_PADDING7, 7, &padding },
>   };
>   
>   void mtk_ovl_adaptor_layer_config(struct device *dev, unsigned int idx,
> @@ -436,6 +461,7 @@ static int ovl_adaptor_comp_get_id(struct device *dev, struct device_node *node,
>   }
>   
>   static const struct of_device_id mtk_ovl_adaptor_comp_dt_ids[] = {
> +	{ .compatible = "mediatek,mt8188-padding", .data = (void *)OVL_ADAPTOR_TYPE_PADDING },

Uhm, for consistency I'd call this "mediatek,mt8188-disp-padding" (you don't have
to drop Reviewed-by tags for such a change, not here and not in the yaml commit),
but it's fine if you have reasons against that.

So, regardless of this being changed or not

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

>   	{ .compatible = "mediatek,mt8195-disp-ethdr", .data = (void *)OVL_ADAPTOR_TYPE_ETHDR },
>   	{ .compatible = "mediatek,mt8195-disp-merge", .data = (void *)OVL_ADAPTOR_TYPE_MERGE },
>   	{ .compatible = "mediatek,mt8195-vdo1-rdma", .data = (void *)OVL_ADAPTOR_TYPE_MDP_RDMA },


