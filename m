Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8133E8C4183
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 15:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182A410E784;
	Mon, 13 May 2024 13:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="I32CpzZM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC9910E784
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 13:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1715605867;
 bh=vb6VU8I039xfs50EqqXBhoNIQO7NhR8KG4nRvOrcCHk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=I32CpzZMSeEnyQQCPetjzV9Baf0RaDjXYyWuOQ7GalN+1Snmnyj2y5odmTtvsfEbn
 eY6qK+WoDRvy6NqqRZ1qi3OQw5Wug8y0FrgEwyHAiX3laIbkUf2WolxGx57mvVWnTM
 so1gyFQccRJL6+MiYYOGxyCvGrf3jMVbwuwAsFTB6X6WwIkXOfT/cWZEv+91soz08w
 IXZhG0wH/tSdB5mvWOG0kE0hkl82yBmMTB6PgyuDLcp2mbvajMZ17OflNB9Y0maGww
 Q92JrkYD8782MJcckvuL29IpeF35t5+Xp7JYHiKpfu2tJ8W7Tl6kspnb/EqRAzEQ3B
 kFp+dQgqwr5Hw==
Received: from [IPV6:fd00::2a:39ce] (cola.collaboradmins.com
 [IPv6:2a01:4f8:1c1c:5717::1])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7380A3782139;
 Mon, 13 May 2024 13:11:05 +0000 (UTC)
Message-ID: <ffa57617-3c87-47d7-8882-becfe40abc17@collabora.com>
Date: Mon, 13 May 2024 15:11:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] Add write DP phyd register from parse dts
To: Liankun Yang <liankun.yang@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 chunfeng.yun@mediatek.com, vkoul@kernel.org, kishon@kernel.org,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com, mac.shen@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20240510110523.12524-1-liankun.yang@mediatek.com>
 <20240510110523.12524-2-liankun.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240510110523.12524-2-liankun.yang@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 10/05/24 13:04, Liankun Yang ha scritto:
> During the testing phase, screen flickering is observed when
> using displayport for screen casting. Relevant SSC register parameters
> are set in dts to address the screen flickering issue effectively and
> improve compatibility with different devices by adjusting the SSC gear.
> 
> Obtaining the DPTX node, parsing the dts to obtain PHY register address
> and value can adapt to settings of different manufacturers projects.
> 
> Changeds in v2:
> - Optimized method of writing to DP PHY register
> https://patchwork.kernel.org/project/linux-mediatek/patch/
> 20240403040517.3279-1-liankun.yang@mediatek.com/
> 
> Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>

There's no devicetree support in this driver - infact, it's being probed by
mtk-dp as a platform device.

You keep sending untested stuff. Fourth time in a row.

Please, TEST YOUR COMMITS upstream before sending!

Regards,
Angelo

> ---
>   drivers/phy/mediatek/phy-mtk-dp.c | 37 +++++++++++++++++++++++++++++++
>   1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
> index d7024a144335..ce78112d5938 100644
> --- a/drivers/phy/mediatek/phy-mtk-dp.c
> +++ b/drivers/phy/mediatek/phy-mtk-dp.c
> @@ -28,6 +28,10 @@
>   #define MTK_DP_PHY_DIG_SW_RST		(PHY_OFFSET + 0x38)
>   #define DP_GLB_SW_RST_PHYD		BIT(0)
>   
> +#define MTK_DP_PHY_DIG_GLB_DA_REG_14	(PHY_OFFSET + 0xD8)
> +#define XTP_GLB_TXPLL_SSC_DELTA_RBR_DEFAULT	GENMASK(15, 0)
> +#define XTP_GLB_TXPLL_SSC_DELTA_HBR_DEFAULT	GENMASK(31, 16)
> +
>   #define MTK_DP_LANE0_DRIVING_PARAM_3		(PHY_OFFSET + 0x138)
>   #define MTK_DP_LANE1_DRIVING_PARAM_3		(PHY_OFFSET + 0x238)
>   #define MTK_DP_LANE2_DRIVING_PARAM_3		(PHY_OFFSET + 0x338)
> @@ -78,10 +82,39 @@
>   #define DRIVING_PARAM_8_DEFAULT	(XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT | \
>   				 XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT)
>   
> +#define SSC_SETTING	"dp-ssc-setting"
> +#define RG_XTP_GLB_TXPLL_SSC_DELTA_HBR	"ssc-delta-hbr"
> +
>   struct mtk_dp_phy {
>   	struct regmap *regs;
> +	struct device *dev;
>   };
>   
> +static int mtk_dp_set_ssc_config(struct phy *phy, struct mtk_dp_phy *dp_phy)
> +{
> +	int ret;
> +	u32 read_value = 0, reg_mask = 0;
> +	struct device_node *ssc_node = NULL;
> +
> +	ssc_node = of_find_node_by_name(dp_phy->dev->of_node, SSC_SETTING);
> +	if (!ssc_node) {
> +		dev_err(&phy->dev, "SSC node is NULL\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = of_property_read_u32(ssc_node, RG_XTP_GLB_TXPLL_SSC_DELTA_HBR, &read_value);
> +	if (ret < 0 || !read_value) {
> +		dev_err(&phy->dev, "Read SSC vlaue fail!\n");
> +		return -EINVAL;
> +	}
> +	read_value |= read_value << 16;
> +	reg_mask |= XTP_GLB_TXPLL_SSC_DELTA_HBR_DEFAULT;
> +
> +	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_GLB_DA_REG_14, reg_mask, read_value);
> +
> +	return 0;
> +}
> +
>   static int mtk_dp_phy_init(struct phy *phy)
>   {
>   	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
> @@ -137,6 +170,8 @@ static int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
>   	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_PLL_CTL_1,
>   			   TPLL_SSC_EN, opts->dp.ssc ? TPLL_SSC_EN : 0);
>   
> +	mtk_dp_set_ssc_config(phy, dp_phy);
> +
>   	return 0;
>   }
>   
> @@ -186,6 +221,8 @@ static int mtk_dp_phy_probe(struct platform_device *pdev)
>   	if (!dev->of_node)
>   		phy_create_lookup(phy, "dp", dev_name(dev));
>   
> +	dp_phy->dev = dev;
> +
>   	return 0;
>   }
>   


