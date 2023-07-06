Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 634F374995E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 12:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAA510E4D3;
	Thu,  6 Jul 2023 10:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C475210E4CC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 10:26:56 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 98A23660585C;
 Thu,  6 Jul 2023 11:26:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1688639215;
 bh=6CgHdMHanq24fvS8FaBS8qQ0RlrA+kGzfVHRX7V3k+U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=m5giy2mCP/OsIEhQ87ulCwEghPPvsIuwbA3Q+mBAn7Jb9MxcTPtx5AtNq1BITdAZr
 nA/Fb0ZmF6helJOemGYvB+JWK00bYzDbOu5JO1rBNhp638s3pQe6tvofWEaJ4SCMDi
 4YoQJhQtuRhtemc6+DBW8lM0QEndAgAhYRvwEjMmZIYN6gdqiGJwzkMqonjkd5aOKn
 6OzwQVzoYzgkeKE3lYMxwmdwcC1p+UyA0vels2urvwoOGV7bZrenay6YqK8wWBWB4B
 EvQ7qp5SriPvb1RbAIcGOeSQRsyzDntlgKQvuJ8hV/CmqKHaDAKhqL1A3qwO7r603d
 Ek6uHcPF9qOog==
Message-ID: <7b8d221f-107f-3352-d851-a0cb40008c1a@collabora.com>
Date: Thu, 6 Jul 2023 12:26:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2,2/2] drm/mediatek: dp: Add the audio control to
 mtk_dp_data struct
Content-Language: en-US
To: Shuijing Li <shuijing.li@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com
References: <20230706021425.31735-1-shuijing.li@mediatek.com>
 <20230706021425.31735-3-shuijing.li@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230706021425.31735-3-shuijing.li@mediatek.com>
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

Il 06/07/23 04:14, Shuijing Li ha scritto:
> Mainly add the following two flag:
> 
> 1.The audio packet arrangement function is to only arrange audio
> packets into the Hblanking area. In order to align with the HW
> default setting of g1200, this function needs to be turned off.
> 
> 2.Due to the difference of HW, different dividers need to be set.
> 
> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
> Changes in v2:
> - change the variables' name to be more descriptive
> - add a comment that describes the function of mtk_dp_audio_sample_arrange
> - reduce indentation by doing the inverse check
> - add a definition of some bits
> - add support for mediatek, mt8188-edp-tx
> per suggestion from the previous thread:
> https://lore.kernel.org/lkml/ac0fcec9-a2fe-06cc-c727-189ef7babe9c@collabora.com/
> ---
>   drivers/gpu/drm/mediatek/mtk_dp.c     | 47 ++++++++++++++++++++++++++-
>   drivers/gpu/drm/mediatek/mtk_dp_reg.h |  6 ++++
>   2 files changed, 52 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
> index 64eee77452c0..8e1a13ab2ba2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -139,6 +139,8 @@ struct mtk_dp_data {
>   	unsigned int smc_cmd;
>   	const struct mtk_dp_efuse_fmt *efuse_fmt;
>   	bool audio_supported;
> +	bool audio_pkt_in_hblank_area;
> +	u16 audio_m_div2_bit;
>   };
>   
>   static const struct mtk_dp_efuse_fmt mt8195_edp_efuse_fmt[MTK_DP_CAL_MAX] = {
> @@ -647,7 +649,7 @@ static void mtk_dp_audio_sdp_asp_set_channels(struct mtk_dp *mtk_dp,
>   static void mtk_dp_audio_set_divider(struct mtk_dp *mtk_dp)
>   {
>   	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_30BC,
> -			   AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
> +			   mtk_dp->data->audio_m_div2_bit,
>   			   AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MASK);
>   }
>   
> @@ -1362,6 +1364,18 @@ static void mtk_dp_sdp_set_down_cnt_init_in_hblank(struct mtk_dp *mtk_dp)
>   			   SDP_DOWN_CNT_INIT_IN_HBLANK_DP_ENC1_P0_MASK);
>   }
>   
> +static void mtk_dp_audio_sample_arrange(struct mtk_dp *mtk_dp)
> +{
> +	/* arrange audio packets into the Hblanking and Vblanking area */
> +	if (!mtk_dp->data->audio_pkt_in_hblank_area)
> +		return;

There's only one remaining question: why is this done for MT8188 but *not* for
MT8195?

Thanks,
Angelo

> +
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3374, 0,
> +			   SDP_ASP_INSERT_IN_HBLANK_DP_ENC1_P0_MASK);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC1_P0_3374, 0,
> +			   SDP_DOWN_ASP_CNT_INIT_DP_ENC1_P0_MASK);
> +}
> +
>   static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
>   {
>   	u32 sram_read_start = min_t(u32, MTK_DP_TBC_BUF_READ_START_ADDR,
> @@ -1371,6 +1385,7 @@ static void mtk_dp_setup_tu(struct mtk_dp *mtk_dp)
>   				    MTK_DP_PIX_PER_ADDR);
>   	mtk_dp_set_sram_read_start(mtk_dp, sram_read_start);
>   	mtk_dp_setup_encoder(mtk_dp);
> +	mtk_dp_audio_sample_arrange(mtk_dp);
>   	mtk_dp_sdp_set_down_cnt_init_in_hblank(mtk_dp);
>   	mtk_dp_sdp_set_down_cnt_init(mtk_dp, sram_read_start);
>   }
> @@ -2616,11 +2631,31 @@ static int mtk_dp_resume(struct device *dev)
>   
>   static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_suspend, mtk_dp_resume);
>   
> +static const struct mtk_dp_data mt8188_edp_data = {
> +	.bridge_type = DRM_MODE_CONNECTOR_eDP,
> +	.smc_cmd = MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE,
> +	.efuse_fmt = mt8195_edp_efuse_fmt,
> +	.audio_supported = false,
> +	.audio_pkt_in_hblank_area = false,
> +	.audio_m_div2_bit = MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
> +};
> +
> +static const struct mtk_dp_data mt8188_dp_data = {
> +	.bridge_type = DRM_MODE_CONNECTOR_DisplayPort,
> +	.smc_cmd = MTK_DP_SIP_ATF_VIDEO_UNMUTE,
> +	.efuse_fmt = mt8195_dp_efuse_fmt,
> +	.audio_supported = true,
> +	.audio_pkt_in_hblank_area = true,
> +	.audio_m_div2_bit = MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
> +};
> +
>   static const struct mtk_dp_data mt8195_edp_data = {
>   	.bridge_type = DRM_MODE_CONNECTOR_eDP,
>   	.smc_cmd = MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE,
>   	.efuse_fmt = mt8195_edp_efuse_fmt,
>   	.audio_supported = false,
> +	.audio_pkt_in_hblank_area = false,
> +	.audio_m_div2_bit = AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
>   };
>   
>   static const struct mtk_dp_data mt8195_dp_data = {
> @@ -2628,9 +2663,19 @@ static const struct mtk_dp_data mt8195_dp_data = {
>   	.smc_cmd = MTK_DP_SIP_ATF_VIDEO_UNMUTE,
>   	.efuse_fmt = mt8195_dp_efuse_fmt,
>   	.audio_supported = true,
> +	.audio_pkt_in_hblank_area = false,
> +	.audio_m_div2_bit = AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2,
>   };
>   
>   static const struct of_device_id mtk_dp_of_match[] = {
> +	{
> +		.compatible = "mediatek,mt8188-edp-tx",
> +		.data = &mt8188_edp_data,
> +	},
> +	{
> +		.compatible = "mediatek,mt8188-dp-tx",
> +		.data = &mt8188_dp_data,
> +	},
>   	{
>   		.compatible = "mediatek,mt8195-edp-tx",
>   		.data = &mt8195_edp_data,
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> index 84e38cef03c2..6d7f0405867e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> +++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> @@ -162,6 +162,7 @@
>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_2	(1 << 8)
>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_4	(2 << 8)
>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_MUL_8	(3 << 8)
> +#define MT8188_AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2	(4 << 8)
>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_2	(5 << 8)
>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_4	(6 << 8)
>   #define AUDIO_M_CODE_MULT_DIV_SEL_DP_ENC0_P0_DIV_8	(7 << 8)
> @@ -228,6 +229,11 @@
>   							 VIDEO_STABLE_CNT_THRD_DP_ENC1_P0 | \
>   							 SDP_DP13_EN_DP_ENC1_P0 | \
>   							 BS2BS_MODE_DP_ENC1_P0)
> +
> +#define MTK_DP_ENC1_P0_3374			0x3374
> +#define SDP_ASP_INSERT_IN_HBLANK_DP_ENC1_P0_MASK	BIT(12)
> +#define SDP_DOWN_ASP_CNT_INIT_DP_ENC1_P0_MASK		GENMASK(11, 0)
> +
>   #define MTK_DP_ENC1_P0_33F4			0x33f4
>   #define DP_ENC_DUMMY_RW_1_AUDIO_RST_EN			BIT(0)
>   #define DP_ENC_DUMMY_RW_1				BIT(9)



