Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3242972EF4
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 11:48:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C320110E75D;
	Tue, 10 Sep 2024 09:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ZVFUfUYg";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="GjOT2vS+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1048 seconds by postgrey-1.36 at gabe;
 Tue, 10 Sep 2024 09:48:25 UTC
Received: from a7-47.smtp-out.eu-west-1.amazonses.com
 (a7-47.smtp-out.eu-west-1.amazonses.com [54.240.7.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C6210E754
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 09:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725960655;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=f1VEHlFlmCeLFmqgFruvrVklSfh+GU0nyzOSNnOJfig=;
 b=ZVFUfUYgj1wJmA1P3gUlc18tT+rYh5UOioOt8HIDDNtuU49woyor7OaXQOwGm0pq
 xfI3hWv+4JpGSrnuuq4lU6sQFN10cNPnK+gw5OQi0bEz1t6/2Luu8DZtUFzYjXAb6/N
 bYoM3DIvMISQqwD86Om1nt+AjdO+hviUBvhLtUNz42/hbvAGQ0d3tt/MfbojhnyauCr
 d5Q5THtJ3yBSAPWquIZ74T26h+9BlwLIUUxU0w1eb3GwJ7i3YiGxvewlw/13gPPrME7
 JxNJIatLr+WbS4xobWDqrgoR3puv59oxNI2/w1g3/cTN38flf/o1LaqGKpjMnZcZj+f
 RiTHrck1WQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725960655;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
 bh=f1VEHlFlmCeLFmqgFruvrVklSfh+GU0nyzOSNnOJfig=;
 b=GjOT2vS+KrNPn0WrkVByfdmmPv2HsKvGywOUQfldmcipYC/k+skpZs6VL+GJ8CDH
 wFoPDVrtG4gplIyhywfMJpzZITG3mtioh+utqGx9HBNorLtYHlHIq0RW7srTaUt2C61
 G12VXzDOLfKCES3cY6h7+/XX+aA18glST8sq6iew=
Message-ID: <01020191db45928b-bcb6d066-e490-41ff-aefd-f274d03da21e-000000@eu-west-1.amazonses.com>
Date: Tue, 10 Sep 2024 09:30:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] drm/mediatek: Fix get efuse issue for MT8188 DPTX
To: Liankun Yang <liankun.yang@mediatek.com>, chunkuang.hu@kernel.org, 
 p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
 matthias.bgg@gmail.com, ck.hu@mediatek.com, shuijing.li@mediatek.com, 
 jitao.shi@mediatek.com, mac.shen@mediatek.com, peng.liu@mediatek.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240905124041.3658-1-liankun.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240905124041.3658-1-liankun.yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.10-54.240.7.47
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

Il 05/09/24 14:40, Liankun Yang ha scritto:
> Update efuse data for MT8188 displayport.
> 
> The DP monitor can not display when DUT connected to USB-c to DP dongle.
> Analysis view is invalid DP efuse data.
> 
> Fixes: 350c3fe907fb ("drm/mediatek: dp: Add support MT8188 dp/edp function")
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> Changes in V4:
> - Remove excess newlines.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240903121028.20689-1-liankun.yang@mediatek.com/
> 
> Changes in V3
> - Update change log position in commit message.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240902133736.16461-1-liankun.yang@mediatek.com/
> 
> Changes in V2
> - Add Fixes tag.
> - Update the commit title.
> - Update the commit description.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240510061716.31103-1-liankun.yang@mediatek.com/
> ---
>   drivers/gpu/drm/mediatek/mtk_dp.c | 85 ++++++++++++++++++++++++++++++-
>   1 file changed, 84 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index d8796a904eca..f2bee617f063 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -145,6 +145,89 @@ struct mtk_dp_data {
>   	u16 audio_m_div2_bit;
>   };
>   
> +static const struct mtk_dp_efuse_fmt mt8188_dp_efuse_fmt[MTK_DP_CAL_MAX] = {
> +	[MTK_DP_CAL_GLB_BIAS_TRIM] = {
> +		.idx = 0,
> +		.shift = 10,
> +		.mask = 0x1f,
> +		.min_val = 1,
> +		.max_val = 0x1e,
> +		.default_val = 0xf,
> +	},
> +	[MTK_DP_CAL_CLKTX_IMPSE] = {
> +		.idx = 0,
> +		.shift = 15,
> +		.mask = 0xf,
> +		.min_val = 1,
> +		.max_val = 0xe,
> +		.default_val = 0x8,
> +	},
> +	[MTK_DP_CAL_LN_TX_IMPSEL_PMOS_0] = {
> +		.idx = 1,
> +		.shift = 0,
> +		.mask = 0xf,
> +		.min_val = 1,
> +		.max_val = 0xe,
> +		.default_val = 0x8,
> +	},
> +	[MTK_DP_CAL_LN_TX_IMPSEL_PMOS_1] = {
> +		.idx = 1,
> +		.shift = 8,
> +		.mask = 0xf,
> +		.min_val = 1,
> +		.max_val = 0xe,
> +		.default_val = 0x8,
> +	},
> +	[MTK_DP_CAL_LN_TX_IMPSEL_PMOS_2] = {
> +		.idx = 1,
> +		.shift = 16,
> +		.mask = 0xf,
> +		.min_val = 1,
> +		.max_val = 0xe,
> +		.default_val = 0x8,
> +	},
> +	[MTK_DP_CAL_LN_TX_IMPSEL_PMOS_3] = {
> +		.idx = 1,
> +		.shift = 24,
> +		.mask = 0xf,
> +		.min_val = 1,
> +		.max_val = 0xe,
> +		.default_val = 0x8,
> +	},
> +	[MTK_DP_CAL_LN_TX_IMPSEL_NMOS_0] = {
> +		.idx = 1,
> +		.shift = 4,
> +		.mask = 0xf,
> +		.min_val = 1,
> +		.max_val = 0xe,
> +		.default_val = 0x8,
> +	},
> +	[MTK_DP_CAL_LN_TX_IMPSEL_NMOS_1] = {
> +		.idx = 1,
> +		.shift = 12,
> +		.mask = 0xf,
> +		.min_val = 1,
> +		.max_val = 0xe,
> +		.default_val = 0x8,
> +	},
> +	[MTK_DP_CAL_LN_TX_IMPSEL_NMOS_2] = {
> +		.idx = 1,
> +		.shift = 20,
> +		.mask = 0xf,
> +		.min_val = 1,
> +		.max_val = 0xe,
> +		.default_val = 0x8,
> +	},
> +	[MTK_DP_CAL_LN_TX_IMPSEL_NMOS_3] = {
> +		.idx = 1,
> +		.shift = 28,
> +		.mask = 0xf,
> +		.min_val = 1,
> +		.max_val = 0xe,
> +		.default_val = 0x8,
> +	},
> +};
> +
>   static const struct mtk_dp_efuse_fmt mt8195_edp_efuse_fmt[MTK_DP_CAL_MAX] = {
>   	[MTK_DP_CAL_GLB_BIAS_TRIM] = {
>   		.idx = 3,
> @@ -2771,7 +2854,7 @@ static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_suspend, mtk_dp_resume);
>   static const struct mtk_dp_data mt8188_dp_data = {
>   	.bridge_type = DRM_MODE_CONNECTOR_DisplayPort,
>   	.smc_cmd = MTK_DP_SIP_ATF_VIDEO_UNMUTE,
> -	.efuse_fmt = mt8195_dp_efuse_fmt,
> +	.efuse_fmt = mt8188_dp_efuse_fmt,
>   	.audio_supported = true,
>   	.audio_pkt_in_hblank_area = true,
>   	.audio_m_div2_bit = MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,

