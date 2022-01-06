Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD914486201
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 10:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6784910E872;
	Thu,  6 Jan 2022 09:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C7A10E7D6
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 09:20:27 +0000 (UTC)
X-UUID: 5b426ca88863486097a4b926f03b43eb-20220106
X-UUID: 5b426ca88863486097a4b926f03b43eb-20220106
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <chunfeng.yun@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1492587014; Thu, 06 Jan 2022 17:20:24 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Jan 2022 17:20:23 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 6 Jan 2022 17:20:23 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 Jan 2022 17:20:22 +0800
Message-ID: <78652a88b24bb4c4660d7c7fa31d4dd7b9fe5a46.camel@mediatek.com>
Subject: Re: [PATCH 4/4] phy: mediatek: phy-mtk-hdmi: Simplify with
 dev_err_probe()
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>
Date: Thu, 6 Jan 2022 17:20:22 +0800
In-Reply-To: <20220103153055.50473-4-angelogioacchino.delregno@collabora.com>
References: <20220103153055.50473-1-angelogioacchino.delregno@collabora.com>
 <20220103153055.50473-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kishon@ti.com, linux-phy@lists.infradead.org, vkoul@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-01-03 at 16:30 +0100, AngeloGioacchino Del Regno wrote:
> Use the dev_err_probe() helper to simplify error handling during
> probe.
> 
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/phy/mediatek/phy-mtk-hdmi.c | 50 +++++++++++--------------
> ----
>  1 file changed, 19 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c
> b/drivers/phy/mediatek/phy-mtk-hdmi.c
> index e037fa89696c..4f40a6eea004 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
> @@ -104,20 +104,16 @@ static int mtk_hdmi_phy_probe(struct
> platform_device *pdev)
>  		return PTR_ERR(hdmi_phy->regmap);
>  
>  	ref_clk = devm_clk_get(dev, "pll_ref");
> -	if (IS_ERR(ref_clk)) {
> -		ret = PTR_ERR(ref_clk);
> -		dev_err(&pdev->dev, "Failed to get PLL reference clock:
> %d\n",
> -			ret);
> -		return ret;
> -	}
> +	if (IS_ERR(ref_clk))
> +		return dev_err_probe(dev, PTR_ERR(ref_clk),
> +				     "Failed to get PLL reference
> clock\n");
> +
>  	ref_clk_name = __clk_get_name(ref_clk);
>  
>  	ret = of_property_read_string(dev->of_node, "clock-output-
> names",
>  				      &clk_init.name);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to read clock-output-names: %d\n",
> ret);
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to read clock-
> output-names\n");
Seems no need change it if no EPROBE_DEFER happens

>  
>  	hdmi_phy->dev = dev;
>  	hdmi_phy->conf =
> @@ -125,25 +121,19 @@ static int mtk_hdmi_phy_probe(struct
> platform_device *pdev)
>  	mtk_hdmi_phy_clk_get_data(hdmi_phy, &clk_init);
>  	hdmi_phy->pll_hw.init = &clk_init;
>  	hdmi_phy->pll = devm_clk_register(dev, &hdmi_phy->pll_hw);
> -	if (IS_ERR(hdmi_phy->pll)) {
> -		ret = PTR_ERR(hdmi_phy->pll);
> -		dev_err(dev, "Failed to register PLL: %d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(hdmi_phy->pll))
> +		return dev_err_probe(dev, PTR_ERR(hdmi_phy->pll),
> +				    "Failed to register PLL\n");
>  
>  	ret = of_property_read_u32(dev->of_node, "mediatek,ibias",
>  				   &hdmi_phy->ibias);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "Failed to get ibias: %d\n", ret);
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to get
> ibias\n");
ditto

Thanks
>  
>  	ret = of_property_read_u32(dev->of_node, "mediatek,ibias_up",
>  				   &hdmi_phy->ibias_up);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "Failed to get ibias up: %d\n",
> ret);
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to get
> ibias_up\n");
>  
>  	dev_info(dev, "Using default TX DRV impedance: 4.2k/36\n");
>  	hdmi_phy->drv_imp_clk = 0x30;
> @@ -152,17 +142,15 @@ static int mtk_hdmi_phy_probe(struct
> platform_device *pdev)
>  	hdmi_phy->drv_imp_d0 = 0x30;
>  
>  	phy = devm_phy_create(dev, NULL,
> mtk_hdmi_phy_dev_get_ops(hdmi_phy));
> -	if (IS_ERR(phy)) {
> -		dev_err(dev, "Failed to create HDMI PHY\n");
> -		return PTR_ERR(phy);
> -	}
> +	if (IS_ERR(phy))
> +		return dev_err_probe(dev, PTR_ERR(phy), "Cannot create
> HDMI PHY\n");
> +
>  	phy_set_drvdata(phy, hdmi_phy);
>  
>  	phy_provider = devm_of_phy_provider_register(dev,
> of_phy_simple_xlate);
> -	if (IS_ERR(phy_provider)) {
> -		dev_err(dev, "Failed to register HDMI PHY\n");
> -		return PTR_ERR(phy_provider);
> -	}
> +	if (IS_ERR(phy_provider))
> +		return dev_err_probe(dev, PTR_ERR(phy_provider),
> +				     "Failed to register HDMI PHY\n");
>  
>  	if (hdmi_phy->conf->pll_default_off)
>  		hdmi_phy->conf->hdmi_phy_disable_tmds(hdmi_phy);

