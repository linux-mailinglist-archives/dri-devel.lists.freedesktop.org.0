Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3718548E3BF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 06:32:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E91F10E58E;
	Fri, 14 Jan 2022 05:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D97910E1FB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 05:32:10 +0000 (UTC)
X-UUID: 11fe67c9e55a486b91cdd833dd270086-20220114
X-UUID: 11fe67c9e55a486b91cdd833dd270086-20220114
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 207998095; Fri, 14 Jan 2022 13:32:05 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 14 Jan 2022 13:32:04 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 14 Jan 2022 13:32:03 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Jan 2022 13:32:02 +0800
Message-ID: <6e75de8187b276f54c8673ccd708b299614bc5c3.camel@mediatek.com>
Subject: Re: [PATCH 3/3] phy: mediatek: phy-mtk-mipi-dsi: Simplify with
 dev_err_probe()
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>
Date: Fri, 14 Jan 2022 13:32:02 +0800
In-Reply-To: <ba6c0163-fc5f-2a5f-560d-240e5fe2c3c4@collabora.com>
References: <20220103145324.48008-1-angelogioacchino.delregno@collabora.com>
 <20220103145324.48008-3-angelogioacchino.delregno@collabora.com>
 <4d7195c3ac9bc63a5f980548f0c880484403346d.camel@mediatek.com>
 <ba6c0163-fc5f-2a5f-560d-240e5fe2c3c4@collabora.com>
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

On Fri, 2022-01-07 at 10:23 +0100, AngeloGioacchino Del Regno wrote:
> Il 06/01/22 10:13, Chunfeng Yun ha scritto:
> > On Mon, 2022-01-03 at 15:53 +0100, AngeloGioacchino Del Regno
> > wrote:
> > > Use the dev_err_probe() helper to simplify error handling during
> > > probe.
> > > 
> > > Signed-off-by: AngeloGioacchino Del Regno <
> > > angelogioacchino.delregno@collabora.com>
> > > ---
> > >   drivers/phy/mediatek/phy-mtk-mipi-dsi.c | 29 +++++++++---------
> > > ---
> > > ----
> > >   1 file changed, 10 insertions(+), 19 deletions(-)
> > > 
> > > diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> > > b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> > > index 6f7425b0bf5b..4b77508f5241 100644
> > > --- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> > > +++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> > > @@ -148,11 +148,9 @@ static int mtk_mipi_tx_probe(struct
> > > platform_device *pdev)
> > >   		return PTR_ERR(mipi_tx->regmap);
> > >   
> > >   	ref_clk = devm_clk_get(dev, NULL);
> > > -	if (IS_ERR(ref_clk)) {
> > > -		ret = PTR_ERR(ref_clk);
> > > -		dev_err(dev, "Failed to get reference clock: %d\n",
> > > ret);
> > > -		return ret;
> > > -	}
> > > +	if (IS_ERR(ref_clk))
> > > +		return dev_err_probe(dev, PTR_ERR(ref_clk),
> > > +				     "Failed to get reference
> > > clock\n");
> > >   
> > >   	ret = of_property_read_u32(dev->of_node, "drive-
> > > strength-
> > > microamp",
> > >   				   &mipi_tx->mipitx_drive);
> > > @@ -172,27 +170,20 @@ static int mtk_mipi_tx_probe(struct
> > > platform_device *pdev)
> > >   
> > >   	ret = of_property_read_string(dev->of_node, "clock-
> > > output-
> > > names",
> > >   				      &clk_init.name);
> > > -	if (ret < 0) {
> > > -		dev_err(dev, "Failed to read clock-output-names: %d\n",
> > > ret);
> > > -		return ret;
> > > -	}
> > > +	if (ret < 0)
> > > +		return dev_err_probe(dev, ret, "Failed to read clock-
> > > output-names\n");
> > 
> > Seems no need change it here. (no EPROBE_DEFER error)
> > 
> 
> Hello Chunfeng,
> 
> pasting from kernel driver-api infrastructure guidelines:
> 
> [...]Note that it is deemed acceptable to use this function for error
> prints during 
> probe even if the err is known to never be -EPROBE_DEFER. The benefit
> compared to a 
> normal dev_err() is the standardized format of the error code and the
> fact that the 
> error code is returned.
> 
> https://www.kernel.org/doc/html/latest/driver-api/infrastructure.html
> 
Got it, thanks a lot:)

> Regards,
> - Angelo
> 
> > Thanks
> > >   
> > >   	clk_init.ops = mipi_tx->driver_data->mipi_tx_clk_ops;
> > >   
> > >   	mipi_tx->pll_hw.init = &clk_init;
> > >   	mipi_tx->pll = devm_clk_register(dev, &mipi_tx-
> > > >pll_hw);
> > > -	if (IS_ERR(mipi_tx->pll)) {
> > > -		ret = PTR_ERR(mipi_tx->pll);
> > > -		dev_err(dev, "Failed to register PLL: %d\n", ret);
> > > -		return ret;
> > > -	}
> > > +	if (IS_ERR(mipi_tx->pll))
> > > +		return dev_err_probe(dev, PTR_ERR(mipi_tx->pll),
> > > "Cannot register PLL\n");
> > >   
> > >   	phy = devm_phy_create(dev, NULL, &mtk_mipi_tx_ops);
> > > -	if (IS_ERR(phy)) {
> > > -		ret = PTR_ERR(phy);
> > > -		dev_err(dev, "Failed to create MIPI D-PHY: %d\n", ret);
> > > -		return ret;
> > > -	}
> > > +	if (IS_ERR(phy))
> > > +		return dev_err_probe(dev, PTR_ERR(phy), "Failed to
> > > create MIPI D-PHY\n");
> > > +
> > >   	phy_set_drvdata(phy, mipi_tx);
> > >   
> > >   	phy_provider = devm_of_phy_provider_register(dev,
> > > of_phy_simple_xlate);
> 
> 

