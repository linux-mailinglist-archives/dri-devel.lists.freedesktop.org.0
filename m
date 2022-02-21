Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FC64BDA3D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 15:32:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE9C10E4B6;
	Mon, 21 Feb 2022 14:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C2B10E4B6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 14:31:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id F39DB1F437D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645453915;
 bh=zZGJS5SaBZAgztJLjnkX4lNVWwzZ/wItC5wvOQSNmTw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nqQ4lt4lvWvehP8t2PBmnEPyjeVD6IzaRJUg9e/ysnY2atQ1kZSM8EM8n5itQlokf
 Yp4vUnIHgdhq/hy+TzZGjMVLLYSK5IF16BUzlZWsk7TSuodm7E+UNIpG3JInNSWSLk
 ZHmC4MqvOE1KS2nTQCvWV4UcOEOdmq+DU9S1oRfR22r3QjyqwtySdRzfbBG76jq6Fb
 fFvF639BOUZn0b8HBAYnIcGNmmBDx3O9u87ETZPQJ8DD1m0oaDlBb1Jf6lakGDnKak
 p/vB/wnLbpvGKsIvNqw72LfVi5rwmo/XKq7bp6CBSTqAddXrrYluntrdaDMvVbCHG7
 khbB3bTa2qXAw==
Message-ID: <bdd867fe-3103-a99b-e9ec-02df6a18d385@collabora.com>
Date: Mon, 21 Feb 2022 15:31:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v8 14/19] phy: phy-mtk-dp: Add driver for DP phy
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com,
 kishon@ti.com, vkoul@kernel.org, deller@gmx.de, ck.hu@mediatek.com,
 jitao.shi@mediatek.com
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-15-granquet@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220218145437.18563-15-granquet@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 18/02/22 15:54, Guillaume Ranquet ha scritto:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This is a new driver that supports the integrated DisplayPort phy for
> mediatek SoCs, especially the mt8195. The phy is integrated into the
> DisplayPort controller and will be created by the mtk-dp driver. This
> driver expects a struct regmap to be able to work on the same registers
> as the DisplayPort controller. It sets the device data to be the struct
> phy so that the DisplayPort controller can easily work with it.
> 
> The driver does not have any devicetree bindings because the datasheet
> does not list the controller and the phy as distinct units.
> 
> The interaction with the controller can be covered by the configure
> callback of the phy framework and its displayport parameters.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>   MAINTAINERS                       |   1 +
>   drivers/phy/mediatek/Kconfig      |   8 ++
>   drivers/phy/mediatek/Makefile     |   1 +
>   drivers/phy/mediatek/phy-mtk-dp.c | 199 ++++++++++++++++++++++++++++++
>   4 files changed, 209 insertions(+)
>   create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fca970a46e77a..33a05d396dd03 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6467,6 +6467,7 @@ L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
>   S:	Supported
>   F:	Documentation/devicetree/bindings/display/mediatek/
>   F:	drivers/gpu/drm/mediatek/
> +F:	drivers/phy/mediatek/phy-mtk-dp.c
>   F:	drivers/phy/mediatek/phy-mtk-hdmi*
>   F:	drivers/phy/mediatek/phy-mtk-mipi*
>   
> diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
> index 55f8e6c048ab3..f7ec860590492 100644
> --- a/drivers/phy/mediatek/Kconfig
> +++ b/drivers/phy/mediatek/Kconfig
> @@ -55,3 +55,11 @@ config PHY_MTK_MIPI_DSI
>   	select GENERIC_PHY
>   	help
>   	  Support MIPI DSI for Mediatek SoCs.
> +
> +config PHY_MTK_DP
> +	tristate "MediaTek DP-PHY Driver"
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on OF
> +	select GENERIC_PHY
> +	help
> +	  Support DisplayPort PHY for Mediatek SoCs.
> diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
> index ace660fbed3a1..4ba1e06504346 100644
> --- a/drivers/phy/mediatek/Makefile
> +++ b/drivers/phy/mediatek/Makefile
> @@ -3,6 +3,7 @@
>   # Makefile for the phy drivers.
>   #
>   
> +obj-$(CONFIG_PHY_MTK_DP)		+= phy-mtk-dp.o
>   obj-$(CONFIG_PHY_MTK_TPHY)		+= phy-mtk-tphy.o
>   obj-$(CONFIG_PHY_MTK_UFS)		+= phy-mtk-ufs.o
>   obj-$(CONFIG_PHY_MTK_XSPHY)		+= phy-mtk-xsphy.o
> diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
> new file mode 100644
> index 0000000000000..2841dd3f22543
> --- /dev/null
> +++ b/drivers/phy/mediatek/phy-mtk-dp.c
> @@ -0,0 +1,199 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*

Would be nice to add:

  * phy-mtk-dp.c - MediaTek DisplayPort PHY driver
  *

> + * Copyright (c) 2021 BayLibre
> + * Author: Markus Schneider-Pargmann <msp@baylibre.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#define PHY_OFFSET 0x1000
> +
> +#define MTK_DP_PHY_DIG_PLL_CTL_1		(PHY_OFFSET + 0x014)
> +#define TPLL_SSC_EN					BIT(3)
> +
> +#define MTK_DP_PHY_DIG_BIT_RATE		(PHY_OFFSET + 0x03C)
> +#define BIT_RATE_RBR				0
> +#define BIT_RATE_HBR				1
> +#define BIT_RATE_HBR2				2
> +#define BIT_RATE_HBR3				3
> +
> +#define MTK_DP_PHY_DIG_SW_RST		(PHY_OFFSET + 0x038)
> +#define DP_GLB_SW_RST_PHYD			BIT(0)
> +
> +#define MTK_DP_LANE0_DRIVING_PARAM_3		(PHY_OFFSET + 0x138)
> +#define MTK_DP_LANE1_DRIVING_PARAM_3		(PHY_OFFSET + 0x238)
> +#define MTK_DP_LANE2_DRIVING_PARAM_3		(PHY_OFFSET + 0x338)
> +#define MTK_DP_LANE3_DRIVING_PARAM_3		(PHY_OFFSET + 0x438)
> +#define XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT	0x10

BIT(4)

> +#define XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT	(0x14 << 8)
> +#define XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT	(0x18 << 16)
> +#define XTP_LN_TX_LCTXC0_SW0_PRE3_DEFAULT	(0x20 << 24)

Please use the GENMASK() macro for these definitions.

> +#define DRIVING_PARAM_3_DEFAULT		(XTP_LN_TX_LCTXC0_SW0_PRE0_DEFAULT | \
> +						 XTP_LN_TX_LCTXC0_SW0_PRE1_DEFAULT | \
> +						 XTP_LN_TX_LCTXC0_SW0_PRE2_DEFAULT | \
> +						 XTP_LN_TX_LCTXC0_SW0_PRE3_DEFAULT)
> +
> +#define XTP_LN_TX_LCTXC0_SW1_PRE0_DEFAULT	0x18
> +#define XTP_LN_TX_LCTXC0_SW1_PRE1_DEFAULT	(0x1e << 8)
> +#define XTP_LN_TX_LCTXC0_SW1_PRE2_DEFAULT	(0x24 << 16)
> +#define XTP_LN_TX_LCTXC0_SW2_PRE0_DEFAULT	(0x20 << 24)
> +#define DRIVING_PARAM_4_DEFAULT		(XTP_LN_TX_LCTXC0_SW1_PRE0_DEFAULT | \
> +						 XTP_LN_TX_LCTXC0_SW1_PRE1_DEFAULT | \
> +						 XTP_LN_TX_LCTXC0_SW1_PRE2_DEFAULT | \
> +						 XTP_LN_TX_LCTXC0_SW2_PRE0_DEFAULT)
> +
> +#define XTP_LN_TX_LCTXC0_SW2_PRE1_DEFAULT	0x28
> +#define XTP_LN_TX_LCTXC0_SW3_PRE0_DEFAULT	(0x30 << 8)
> +#define DRIVING_PARAM_5_DEFAULT		(XTP_LN_TX_LCTXC0_SW2_PRE1_DEFAULT | \
> +						 XTP_LN_TX_LCTXC0_SW3_PRE0_DEFAULT)
> +
> +#define XTP_LN_TX_LCTXCP1_SW0_PRE0_DEFAULT	0x00

This is just 0

> +#define XTP_LN_TX_LCTXCP1_SW0_PRE1_DEFAULT	(0x04 << 8)
> +#define XTP_LN_TX_LCTXCP1_SW0_PRE2_DEFAULT	(0x08 << 16)
> +#define XTP_LN_TX_LCTXCP1_SW0_PRE3_DEFAULT	(0x10 << 24)
> +#define DRIVING_PARAM_6_DEFAULT		(XTP_LN_TX_LCTXCP1_SW0_PRE0_DEFAULT | \
> +						 XTP_LN_TX_LCTXCP1_SW0_PRE1_DEFAULT | \
> +						 XTP_LN_TX_LCTXCP1_SW0_PRE2_DEFAULT | \
> +						 XTP_LN_TX_LCTXCP1_SW0_PRE3_DEFAULT)
> +
> +#define XTP_LN_TX_LCTXCP1_SW1_PRE0_DEFAULT	0x00

...just 0 again

> +#define XTP_LN_TX_LCTXCP1_SW1_PRE1_DEFAULT	(0x06 << 8)
> +#define XTP_LN_TX_LCTXCP1_SW1_PRE2_DEFAULT	(0x0c << 16)
> +#define XTP_LN_TX_LCTXCP1_SW2_PRE0_DEFAULT	(0x00 << 24)

zero shifted by a million bits is still zero, so this statement does not make sense

> +#define DRIVING_PARAM_7_DEFAULT		(XTP_LN_TX_LCTXCP1_SW1_PRE0_DEFAULT | \
> +						 XTP_LN_TX_LCTXCP1_SW1_PRE1_DEFAULT | \
> +						 XTP_LN_TX_LCTXCP1_SW1_PRE2_DEFAULT | \
> +						 XTP_LN_TX_LCTXCP1_SW2_PRE0_DEFAULT)
> +
> +#define XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT	0x08
> +#define XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT	(0x00 << 8)

Same here.

> +#define DRIVING_PARAM_8_DEFAULT		(XTP_LN_TX_LCTXCP1_SW2_PRE1_DEFAULT | \
> +						 XTP_LN_TX_LCTXCP1_SW3_PRE0_DEFAULT)
> +
> +struct mtk_dp_phy {
> +	struct regmap *regs;
> +};
> +
> +static int mtk_dp_phy_init(struct phy *phy)
> +{
> +	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
> +	u32 driving_params[] = {
> +		DRIVING_PARAM_3_DEFAULT,
> +		DRIVING_PARAM_4_DEFAULT,
> +		DRIVING_PARAM_5_DEFAULT,
> +		DRIVING_PARAM_6_DEFAULT,
> +		DRIVING_PARAM_7_DEFAULT,
> +		DRIVING_PARAM_8_DEFAULT
> +	};
> +
> +	regmap_bulk_write(dp_phy->regs, MTK_DP_LANE0_DRIVING_PARAM_3,
> +			  driving_params, ARRAY_SIZE(driving_params));
> +	regmap_bulk_write(dp_phy->regs, MTK_DP_LANE1_DRIVING_PARAM_3,
> +			  driving_params, ARRAY_SIZE(driving_params));
> +	regmap_bulk_write(dp_phy->regs, MTK_DP_LANE2_DRIVING_PARAM_3,
> +			  driving_params, ARRAY_SIZE(driving_params));
> +	regmap_bulk_write(dp_phy->regs, MTK_DP_LANE3_DRIVING_PARAM_3,
> +			  driving_params, ARRAY_SIZE(driving_params));
> +
> +	return 0;
> +}
> +
> +static int mtk_dp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
> +{
> +	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
> +	u32 val;
> +
> +	if (opts->dp.set_rate) {
> +		switch (opts->dp.link_rate) {
> +		default:
> +			dev_err(&phy->dev,
> +				"Implementation error, unknown linkrate %x\n",
> +				opts->dp.link_rate);
> +			return -EINVAL;
> +		case 1620:
> +			val = BIT_RATE_RBR;
> +			break;
> +		case 2700:
> +			val = BIT_RATE_HBR;
> +			break;
> +		case 5400:
> +			val = BIT_RATE_HBR2;
> +			break;
> +		case 8100:
> +			val = BIT_RATE_HBR3;
> +			break;
> +		}
> +		regmap_write(dp_phy->regs, MTK_DP_PHY_DIG_BIT_RATE, val);
> +	}
> +
> +	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_PLL_CTL_1,
> +			   TPLL_SSC_EN, opts->dp.ssc ? TPLL_SSC_EN : 0);
> +
> +	return 0;
> +}
> +
> +static int mtk_dp_phy_reset(struct phy *phy)
> +{
> +	struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
> +
> +	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_SW_RST,
> +			   DP_GLB_SW_RST_PHYD, 0);

Please, when you add delays/sleeps, add a comment explaining the reason for that.

To you.. and to me as well.. the reason is very much known and honestly obvious,
but let's be nice with people that don't know the MediaTek platforms :)

> +	usleep_range(50, 200);
> +	regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_SW_RST,
> +			   DP_GLB_SW_RST_PHYD, 1);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops mtk_dp_phy_dev_ops = {
> +	.init = mtk_dp_phy_init,
> +	.configure = mtk_dp_phy_configure,
> +	.reset = mtk_dp_phy_reset,
> +	.owner = THIS_MODULE,
> +};
> +
> +static int mtk_dp_phy_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_dp_phy *dp_phy;
> +	struct phy *phy;

	struct regmap *regs = (blah);

	if (!dp_phy->regs)
		return -EINVAL;

Doing that before allocating the dp_phy struct seems sensible as, even
if it's unlikely that this platform data is not passed, we'd be sparing
some time around.

Besides - I think that the error message is not necessary here, but, if
you really want to keep it, please return dev_err_probe(): using it in
these cases is also allowed.

> +
> +	dp_phy = devm_kzalloc(dev, sizeof(*dp_phy), GFP_KERNEL);
> +	if (!dp_phy)
> +		return -ENOMEM;
> +
> +	dp_phy->regs = *(struct regmap **)dev->platform_data;
> +	if (!dp_phy->regs) {
> +		dev_err(dev, "No data passed, requires struct regmap**\n");
> +		return -EINVAL;
> +	}
> +
> +	phy = devm_phy_create(dev, NULL, &mtk_dp_phy_dev_ops);

	if (IS_ERR(phy))
		return dev_err_probe(dev, PTR_ERR(phy), "Cannot create DP PHY\n");

> +	if (IS_ERR(phy)) {
> +		dev_err(dev, "Failed to create DP PHY: %ld\n", PTR_ERR(phy));
> +		return PTR_ERR(phy);
> +	}
> +	phy_set_drvdata(phy, dp_phy);
> +
> +	if (!dev->of_node)

This will never happen if you use DT to probe this driver - and please do!

An example device-tree binding would be:

dp_phy: phy@somewhere {
	compatible = "mediatek,mt8195-dp-phy", "mediatek,dp-phy";
	reg = <...>;
	#phy-cells = <0>;
};

mtk_dp: displayport-controller@somewhere_else {
	compatible = "mediatek,mt8195-edp-tx", "mediatek,edp-tx";
	reg = <....>;
	other-properties;

	phys = <&dp_phy>;
	phy-names = "dp";
};

Also, remember: since you're nicely using regmap, if you - for any reason - need
to share the same iospace between the two drivers, you can always use a
syscon node for that purpose.

> +		phy_create_lookup(phy, "dp", dev_name(dev));
> +
> +	return 0;
> +}
> +
> +struct platform_driver mtk_dp_phy_driver = {
> +	.probe = mtk_dp_phy_probe,
> +	.driver = {
> +		.name = "mediatek-dp-phy",
> +	},
> +};
> +module_platform_driver(mtk_dp_phy_driver);
> +
> +MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylibre.com>");
> +MODULE_DESCRIPTION("MediaTek DP PHY Driver");
> +MODULE_LICENSE("GPL v2");

