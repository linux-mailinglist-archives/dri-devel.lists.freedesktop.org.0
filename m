Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFB248749D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 10:23:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D7C11B38F;
	Fri,  7 Jan 2022 09:23:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A00611B397
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 09:23:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id DD0E51F40A55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641547414;
 bh=wj1ZDK4lkn/iSMxOoGczIJTSg6wOxjiARPaZ2r2OUWw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=c7TocaBKZAHN+HhlzCoPRaklI+aiWQMse7sjTJ3DD/6JaFoxtqSb0Y2088RnnaH+1
 qGzWIPCWvRqUwaKIxDUIMGG/+RRw2vcdj5w2TAGVlWYjdb5UL5gQuhC4bsR76YevUE
 qcMPJQCdnQs/owVWkwDW/Ho5IzM/W26Vhr+gydewcZtoP6z/9EWyAiNnOc8mBRducK
 AiIqupciZFfnW+cJVeoB5ewBy+ibo1+k38gKmZWv51xuAylIQvj9KENrXjw4YISQ0z
 HoeVrMnHircsrRPFaXXEs3kjaClm73RQwu5zSPcefzAapyeG/yyldEDraJqoFz8cLR
 0iqNsArtWAg9g==
Subject: Re: [PATCH 3/3] phy: mediatek: phy-mtk-mipi-dsi: Simplify with
 dev_err_probe()
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, chunkuang.hu@kernel.org
References: <20220103145324.48008-1-angelogioacchino.delregno@collabora.com>
 <20220103145324.48008-3-angelogioacchino.delregno@collabora.com>
 <4d7195c3ac9bc63a5f980548f0c880484403346d.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <ba6c0163-fc5f-2a5f-560d-240e5fe2c3c4@collabora.com>
Date: Fri, 7 Jan 2022 10:23:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <4d7195c3ac9bc63a5f980548f0c880484403346d.camel@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kishon@ti.com, linux-phy@lists.infradead.org, vkoul@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 06/01/22 10:13, Chunfeng Yun ha scritto:
> On Mon, 2022-01-03 at 15:53 +0100, AngeloGioacchino Del Regno wrote:
>> Use the dev_err_probe() helper to simplify error handling during
>> probe.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/phy/mediatek/phy-mtk-mipi-dsi.c | 29 +++++++++------------
>> ----
>>   1 file changed, 10 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
>> b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
>> index 6f7425b0bf5b..4b77508f5241 100644
>> --- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
>> +++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
>> @@ -148,11 +148,9 @@ static int mtk_mipi_tx_probe(struct
>> platform_device *pdev)
>>   		return PTR_ERR(mipi_tx->regmap);
>>   
>>   	ref_clk = devm_clk_get(dev, NULL);
>> -	if (IS_ERR(ref_clk)) {
>> -		ret = PTR_ERR(ref_clk);
>> -		dev_err(dev, "Failed to get reference clock: %d\n",
>> ret);
>> -		return ret;
>> -	}
>> +	if (IS_ERR(ref_clk))
>> +		return dev_err_probe(dev, PTR_ERR(ref_clk),
>> +				     "Failed to get reference
>> clock\n");
>>   
>>   	ret = of_property_read_u32(dev->of_node, "drive-strength-
>> microamp",
>>   				   &mipi_tx->mipitx_drive);
>> @@ -172,27 +170,20 @@ static int mtk_mipi_tx_probe(struct
>> platform_device *pdev)
>>   
>>   	ret = of_property_read_string(dev->of_node, "clock-output-
>> names",
>>   				      &clk_init.name);
>> -	if (ret < 0) {
>> -		dev_err(dev, "Failed to read clock-output-names: %d\n",
>> ret);
>> -		return ret;
>> -	}
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "Failed to read clock-
>> output-names\n");
> Seems no need change it here. (no EPROBE_DEFER error)
> 

Hello Chunfeng,

pasting from kernel driver-api infrastructure guidelines:

[...]Note that it is deemed acceptable to use this function for error prints during 
probe even if the err is known to never be -EPROBE_DEFER. The benefit compared to a 
normal dev_err() is the standardized format of the error code and the fact that the 
error code is returned.

https://www.kernel.org/doc/html/latest/driver-api/infrastructure.html

Regards,
- Angelo

> Thanks
>>   
>>   	clk_init.ops = mipi_tx->driver_data->mipi_tx_clk_ops;
>>   
>>   	mipi_tx->pll_hw.init = &clk_init;
>>   	mipi_tx->pll = devm_clk_register(dev, &mipi_tx->pll_hw);
>> -	if (IS_ERR(mipi_tx->pll)) {
>> -		ret = PTR_ERR(mipi_tx->pll);
>> -		dev_err(dev, "Failed to register PLL: %d\n", ret);
>> -		return ret;
>> -	}
>> +	if (IS_ERR(mipi_tx->pll))
>> +		return dev_err_probe(dev, PTR_ERR(mipi_tx->pll),
>> "Cannot register PLL\n");
>>   
>>   	phy = devm_phy_create(dev, NULL, &mtk_mipi_tx_ops);
>> -	if (IS_ERR(phy)) {
>> -		ret = PTR_ERR(phy);
>> -		dev_err(dev, "Failed to create MIPI D-PHY: %d\n", ret);
>> -		return ret;
>> -	}
>> +	if (IS_ERR(phy))
>> +		return dev_err_probe(dev, PTR_ERR(phy), "Failed to
>> create MIPI D-PHY\n");
>> +
>>   	phy_set_drvdata(phy, mipi_tx);
>>   
>>   	phy_provider = devm_of_phy_provider_register(dev,
>> of_phy_simple_xlate);
> 

