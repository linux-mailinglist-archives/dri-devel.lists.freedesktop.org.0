Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E21296E46BA
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 13:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C2010E44F;
	Mon, 17 Apr 2023 11:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFA410E44F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 11:45:02 +0000 (UTC)
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1D6FA66031F1;
 Mon, 17 Apr 2023 12:45:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681731900;
 bh=rc5sSx+YYAGFEa3FY87Igi7HBmh/hyzSbmpQbdwi+y0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Um5p9+brAQ6SHqAXekne7HyJj0Eq7yT6g1y55LmbVItRhaGWaluW2ZcfTtzRpNMHP
 lnCePxAGv0WPC/y8Rdu7cy/zEth2V2VntcQHbhIKhLOiWKDBuag6XJbe+J5C2Do7eL
 FkA2WY5ePKom214x1Jhfa3JkuHPaDVCd5ATlDrsJby0yEdAy35iODggx+QQOw+hMcZ
 TvsZsfSA2po+V24o8ASPUX7oU1cKk0t9RzieaxpSFWmccAEiIEigvdFiecF06Gbj39
 qFiGGjSv8V8QLB7xya/u/TeQYUNSjsnVrY2RXDbxOZqAK/lrYLgUHIcmcuW9zCXlLz
 0aghy4R1wV+yg==
Message-ID: <ac0fcec9-a2fe-06cc-c727-189ef7babe9c@collabora.com>
Date: Mon, 17 Apr 2023 13:44:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/2] drm/mediatek: dp: Add the audio control to
 mtk_dp_data struct
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com
References: <1681358785-6930-1-git-send-email-xinlei.lee@mediatek.com>
 <1681358785-6930-3-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1681358785-6930-3-git-send-email-xinlei.lee@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 13/04/23 06:06, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Mainly add the following two flag:
> 
> 1.The audio packet arrangement function is to only arrange audio
> packets into the Hblanking area. In order to align with the HW
> default setting of g1200, this function needs to be turned off.
> 
> 2.Due to the difference of HW, different dividers need to be set.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dp.c     | 32 ++++++++++++++++++++++++++-
>   drivers/gpu/drm/mediatek/mtk_dp_reg.h |  5 +++++
>   2 files changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index 767b71da31a4..65a9984eac81 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -139,6 +139,8 @@ struct mtk_dp_data {
>   	unsigned int smc_cmd;
>   	const struct mtk_dp_efuse_fmt *efuse_fmt;
>   	bool audio_supported;
> +	const bool arrange;

bool audio_pkt_in_hblank_area

> +	const u8 audio_m_div2;

u16 audio_m_div2_bit would be more descriptive, and would allow you to store
the bit for later use as-it-is.

P.S.: This structure is always declared as const, so it's useless to declare
each of its members as const.

>   };
>   
>   static const struct mtk_dp_efuse_fmt mt8195_edp_efuse_fmt[MTK_DP_CAL_MAX] = {
> @@ -646,8 +648,10 @@ static void mtk_dp_audio_sdp_asp_set_channels(struct mtk_dp *mtk_dp,
>   
>   static void mtk_dp_audio_set_divider(struct mtk_dp *mtk_dp)
>   {
> +	u8 div2_id = mtk_dp->data->audio_m_div2;
> +
>   	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30BC,
> -			   AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
> +			   div2_id << AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_SHIFT,

So, if you do it like I've suggested, this becomes

	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30BC
			   mtk_dp->data->audio_m_div2_bit,
			   AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MASK);

>   			   AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MASK);
>   }
>   
> @@ -1362,6 +1366,14 @@ static void mtk_dp_sdp_set_down_cnt_init_in_hblank(struct mtk_dp *mtk_dp)
>   			   SDP_DOWN_CNT_INIT_IN_HBLANK_DP_ENC1_P0_MASK);
>   }
>   
> +static void mtk_dp_audio_sample_arrange(struct mtk_dp *mtk_dp)

Since your register names are not human readable (I know that this is not your
fault, don't worry), please add a comment that describes this function, saying
that this arranges the audio packets into the Hblank area, similarly to how you
described the same into the commit description.

This would otherwise be a nightmare to understand for the "random reader" :-)

> +{
> +	if (mtk_dp->data->arrange) {

You can reduce indentation, if you need to do so (after adding the definitions)
with doing the inverse check like so:

	if (!mtk_dp->data->audio_pkt_in_hblank_area)
		return;

> +		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3374, 0, BIT(12));

Add a definition for this bit....

> +		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3374, 0, 0xFFF);

....and for this mask; please define this one as GENMASK(11, 0).

> +	}
> +}
> +
>   static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
>   {
>   	u32 sram_read_start = min_t(u32, MTK_DP_TBC_BUF_READ_START_ADDR,
> @@ -1371,6 +1383,7 @@ static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
>   				    MTK_DP_PIX_PER_ADDR);
>   	mtk_dp_set_sram_read_start(mtk_dp, sram_read_start);
>   	mtk_dp_setup_encoder(mtk_dp);
> +	mtk_dp_audio_sample_arrange(mtk_dp);
>   	mtk_dp_sdp_set_down_cnt_init_in_hblank(mtk_dp);
>   	mtk_dp_sdp_set_down_cnt_init(mtk_dp, sram_read_start);
>   }
> @@ -2615,11 +2628,22 @@ static int mtk_dp_resume(struct device *dev)
>   
>   static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_suspend, mtk_dp_resume);
>   
> +static const struct mtk_dp_data mt8188_dp_data = {
> +	.bridge_type = DRM_MODE_CONNECTOR_DisplayPort,
> +	.smc_cmd = MTK_DP_SIP_ATF_VIDEO_UNMUTE,
> +	.efuse_fmt = mt8195_dp_efuse_fmt,
> +	.audio_supported = true,
> +	.arrange = true,
> +	.audio_m_div2 = 4,

	.audio_m_div2_bit = MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,

> +};
> +
>   static const struct mtk_dp_data mt8195_edp_data = {
>   	.bridge_type = DRM_MODE_CONNECTOR_eDP,
>   	.smc_cmd = MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE,
>   	.efuse_fmt = mt8195_edp_efuse_fmt,
>   	.audio_supported = false,
> +	.arrange = false,
> +	.audio_m_div2 = 5,

	.audio_m_div2_bit = AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,

>   };
>   
>   static const struct mtk_dp_data mt8195_dp_data = {
> @@ -2627,9 +2651,15 @@ static const struct mtk_dp_data mt8195_dp_data = {
>   	.smc_cmd = MTK_DP_SIP_ATF_VIDEO_UNMUTE,
>   	.efuse_fmt = mt8195_dp_efuse_fmt,
>   	.audio_supported = true,
> +	.arrange = false,
> +	.audio_m_div2 = 5,

	.audio_m_div2_bit = AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,

>   };
>   
>   static const struct of_device_id mtk_dp_of_match[] = {
> +	{
> +		.compatible = "mediatek,mt8188-dp-tx",
> +		.data = &mt8188_dp_data,
> +	},

Please also add support for mediatek,mt8188-edp-tx.

Regards,
Angelo

