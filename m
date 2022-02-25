Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9548C4C4441
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 13:06:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7600B10E11C;
	Fri, 25 Feb 2022 12:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC9A10E11C
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 12:06:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6B3AC1F42522
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645790793;
 bh=bCvONPGPweF9C0iIikhI+xXmgfTZPFzQXLGikPMic4Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NUdBb0+vQZH9FR5rKRZuLNISs3qEAxljfZxyX/wjLatzxAmwaTmRWfJmN854GQnnP
 elhn7SJKFAOyWwiGMiAw7rGokii5TDEQBg9fCuv3L9ofZuZ1zFN+F64J8dP9dYQTlJ
 dcsEF3s1quTSkbShgCbYTkm6yK4R8RAVDKjQI/BV2C3ToBbzXP8/Lh+OPo+U+TDLzB
 TOQSvp5E1tgdUAdbB3rZ9f6gekB+4LKSz3UsPHk6meK51t9YoX0odctJxl76GeijL9
 zNrysxDz9Bv8nxRlUybyWDDYCYDTDhrObaNriQVzfep8rKnf3RxcLPhvK/gH0IDDHF
 8i6+AtMAKSCHQ==
Message-ID: <cca52225-629c-bb18-8d62-7b8f65e88064@collabora.com>
Date: Fri, 25 Feb 2022 13:06:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v8 14/19] phy: phy-mtk-dp: Add driver for DP phy
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, airlied@linux.ie,
 chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, kishon@ti.com,
 maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com,
 mripard@kernel.org, p.zabel@pengutronix.de, robh+dt@kernel.org,
 tzimmermann@suse.de, vkoul@kernel.org
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-15-granquet@baylibre.com>
 <bdd867fe-3103-a99b-e9ec-02df6a18d385@collabora.com>
 <CABnWg9tfutasgiUaLBvb8CxTycLKf8Ry=9PMi2Vtu2JeB4a=dQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CABnWg9tfutasgiUaLBvb8CxTycLKf8Ry=9PMi2Vtu2JeB4a=dQ@mail.gmail.com>
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

Il 25/02/22 12:49, Guillaume Ranquet ha scritto:
> Quoting AngeloGioacchino Del Regno (2022-02-21 15:31:51)
>> Il 18/02/22 15:54, Guillaume Ranquet ha scritto:
>>> From: Markus Schneider-Pargmann <msp@baylibre.com>
>>>
>>> This is a new driver that supports the integrated DisplayPort phy for
>>> mediatek SoCs, especially the mt8195. The phy is integrated into the
>>> DisplayPort controller and will be created by the mtk-dp driver. This
>>> driver expects a struct regmap to be able to work on the same registers
>>> as the DisplayPort controller. It sets the device data to be the struct
>>> phy so that the DisplayPort controller can easily work with it.
>>>
>>> The driver does not have any devicetree bindings because the datasheet
>>> does not list the controller and the phy as distinct units.
>>>
>>> The interaction with the controller can be covered by the configure
>>> callback of the phy framework and its displayport parameters.
>>>
>>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>> ---
>>>    MAINTAINERS                       |   1 +
>>>    drivers/phy/mediatek/Kconfig      |   8 ++
>>>    drivers/phy/mediatek/Makefile     |   1 +
>>>    drivers/phy/mediatek/phy-mtk-dp.c | 199 ++++++++++++++++++++++++++++++
>>>    4 files changed, 209 insertions(+)
>>>    create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c
>>>

..snip..

>>> +static int mtk_dp_phy_reset(struct phy *phy)
>>> +{
>>> +     struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
>>> +
>>> +     regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_SW_RST,
>>> +                        DP_GLB_SW_RST_PHYD, 0);
>>
>> Please, when you add delays/sleeps, add a comment explaining the reason for that.
>>
>> To you.. and to me as well.. the reason is very much known and honestly obvious,
>> but let's be nice with people that don't know the MediaTek platforms :)
>>
> It's sadly not obvious to me, I've asked mediatek engineers mutlple
> times for these
> kind of information, but I'm rather short on information... :-/
> 

Clearly, the PHY needs at least 50uS to perform software reset (SW_RST) of
the digital (controller? my brain doesn't want to cooperate on giving the
right word right now, sorry), so we sleep that time after asserting the
reset bit to comply with this timing.

>>> +     usleep_range(50, 200);
>>> +     regmap_update_bits(dp_phy->regs, MTK_DP_PHY_DIG_SW_RST,
>>> +                        DP_GLB_SW_RST_PHYD, 1);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static const struct phy_ops mtk_dp_phy_dev_ops = {
>>> +     .init = mtk_dp_phy_init,
>>> +     .configure = mtk_dp_phy_configure,
>>> +     .reset = mtk_dp_phy_reset,
>>> +     .owner = THIS_MODULE,
>>> +};
>>> +
>>> +static int mtk_dp_phy_probe(struct platform_device *pdev)
>>> +{
>>> +     struct device *dev = &pdev->dev;
>>> +     struct mtk_dp_phy *dp_phy;
>>> +     struct phy *phy;
>>
>>          struct regmap *regs = (blah);
>>
>>          if (!dp_phy->regs)
>>                  return -EINVAL;
>>
>> Doing that before allocating the dp_phy struct seems sensible as, even
>> if it's unlikely that this platform data is not passed, we'd be sparing
>> some time around.
>>
>> Besides - I think that the error message is not necessary here, but, if
>> you really want to keep it, please return dev_err_probe(): using it in
>> these cases is also allowed.
>>
> You are right, it's logical to return as early as possible.
> 
>>> +
>>> +     dp_phy = devm_kzalloc(dev, sizeof(*dp_phy), GFP_KERNEL);
>>> +     if (!dp_phy)
>>> +             return -ENOMEM;
>>> +
>>> +     dp_phy->regs = *(struct regmap **)dev->platform_data;
>>> +     if (!dp_phy->regs) {
>>> +             dev_err(dev, "No data passed, requires struct regmap**\n");
>>> +             return -EINVAL;
>>> +     }
>>> +
>>> +     phy = devm_phy_create(dev, NULL, &mtk_dp_phy_dev_ops);
>>
>>          if (IS_ERR(phy))
>>                  return dev_err_probe(dev, PTR_ERR(phy), "Cannot create DP PHY\n");
>>
>>> +     if (IS_ERR(phy)) {
>>> +             dev_err(dev, "Failed to create DP PHY: %ld\n", PTR_ERR(phy));
>>> +             return PTR_ERR(phy);
>>> +     }
>>> +     phy_set_drvdata(phy, dp_phy);
>>> +
>>> +     if (!dev->of_node)
>>
>> This will never happen if you use DT to probe this driver - and please do!
>>
>> An example device-tree binding would be:
>>
>> dp_phy: phy@somewhere {
>>          compatible = "mediatek,mt8195-dp-phy", "mediatek,dp-phy";
>>          reg = <...>;
>>          #phy-cells = <0>;
>> };
>>
>> mtk_dp: displayport-controller@somewhere_else {
>>          compatible = "mediatek,mt8195-edp-tx", "mediatek,edp-tx";
>>          reg = <....>;
>>          other-properties;
>>
>>          phys = <&dp_phy>;
>>          phy-names = "dp";
>> };
>>
>> Also, remember: since you're nicely using regmap, if you - for any reason - need
>> to share the same iospace between the two drivers, you can always use a
>> syscon node for that purpose.
>>
> Sadly, I'm not using DT to prove this driver... and this driver will
> probably never
> be used with DT.
> This phy is actually an integral part of the dp ip, this driver is
> only a "logical"
> separation between the DP/phy functionnalities.
> It's probed from the DP driver with a call to `platform_register_device()`.
> Both the DP and phy driver share the same regmap struct.
> 
> Markus tried to explain that in the commit message, please tell me if this needs
> a reword?
> The original discussion is here:
> https://lore.kernel.org/all/CAAOTY__cJMqcAieEraJ2sz4gi0Zs-aiNXz38_x7dPQea6HvYEg@mail.gmail.com/
> 

I understand the fact that the PHY is part of the entire block, but you cannot
guarantee that the next block will have an entirely different PHY and also an
entirely different port IP.

I will pretty much oversimplify this as to make sure that you understand the
strategy and concerns that I have in mind, and why I think that this should
still be probed separately with its own device-tree compatible:

1. The DisplayPort IP that we have in MT8195 is composed of
A - DisplayPort PHY, let's give it a fantasy version V1.0
B - DisplayPort "port" IP, also fantasy version V1.0

2. DisplayPort IP in a future MT9988 chip may be composed of
A - DisplayPort PHY, V1.0
B - DisplayPort "port" IP, V1.1, maybe in a different iospace

3. Of course, it may happen that MT9999 chip may have a variant of the one in 9988
A - DisplayPort PHY, V1.01, maybe in a different iospace
B - DisplayPort "port" IP, V1.1

In cases 2, 3, having both drivers probed as I suggest, will allow to not only
specify a different iospace (which may not be contiguous anymore!), but also to
avoid specifying a different compatible string for one of the two components
which are not carrying any variation in the register layout and/or management.

This, in turn, will also make it easier for developers reading the SoC device
trees to get more immediate knowledge of the hardware, but of course this is not
a primary reason, but more like a side-benefit.

> I didn't know about syscon, I'll have a look... but it's definitively what
> I'm doing here...
> 

P.S.: As for "holes in the middle", remember that device-tree supports "ranges"!

>>> +             phy_create_lookup(phy, "dp", dev_name(dev));
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +struct platform_driver mtk_dp_phy_driver = {
>>> +     .probe = mtk_dp_phy_probe,
>>> +     .driver = {
>>> +             .name = "mediatek-dp-phy",
>>> +     },
>>> +};
>>> +module_platform_driver(mtk_dp_phy_driver);
>>> +
>>> +MODULE_AUTHOR("Markus Schneider-Pargmann <msp@baylibre.com>");
>>> +MODULE_DESCRIPTION("MediaTek DP PHY Driver");
>>> +MODULE_LICENSE("GPL v2");
>>


