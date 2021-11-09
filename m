Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FC544B41C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 21:39:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0056E427;
	Tue,  9 Nov 2021 20:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492DA6E424
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 20:39:16 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9F1F4835BA;
 Tue,  9 Nov 2021 21:39:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1636490354;
 bh=8W0JONxB0rRvMFnYE1rujFbtEAs08HWvg67Vs+00nug=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=AM4IA4NJP/Ilq9jKsRKB8VYyfox9TfmxQEZeVQbk4DgnaI0Adf49Z1cTg+sEcbPOV
 gyN0ihs2LSJel9KwIydMMbbqEXK6qtPiaVqUDiJQMEHoTTsc/exxhFJHMomISdB5xl
 FVg6aC7HdO18qQptUKZChdJCm97P+7DkJyZPW8iCLjwV/jh1+93Zu5ut1kAf41Ak53
 Re/yOeGisLaPbGBfkzGmFgbmr+sX9mndVts17Cqlm8+qJVXsCdaCKTaZYkIr4+sEKd
 Tg9rqOPyDOOfwUoZTqhmL2iym8E5xavgzn3R8UTdhIX0YKIrhALrA3lEgguika8vHH
 eFlPwJ8YH5+aA==
Subject: Re: [RFC] arm64: dts: imx8mm: Add MIPI and LCDIF nodes
To: Adam Ford <aford173@gmail.com>, Tim Harvey <tharvey@gateworks.com>
References: <20211109173357.780-1-tharvey@gateworks.com>
 <CAHCN7xJAW40xvLpBttWRfbv=Pz=HeCbX+g2uZa6CabiqLqG3PA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <aa73406a-7007-0d66-40ba-dd1d71780249@denx.de>
Date: Tue, 9 Nov 2021 21:39:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHCN7xJAW40xvLpBttWRfbv=Pz=HeCbX+g2uZa6CabiqLqG3PA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/9/21 8:35 PM, Adam Ford wrote:

[...]

>> diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
>> index 208a0ed840f4..195dcbff7058 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
>> @@ -188,6 +188,12 @@
>>                  clock-output-names = "clk_ext4";
>>          };
>>
>> +       mipi_phy: mipi-video-phy {
>> +               compatible = "fsl,imx8mm-mipi-video-phy";
>> +               syscon = <&disp_blk_ctrl>;
>> +               #phy-cells = <1>;
>> +       };
>> +
>>          psci {
>>                  compatible = "arm,psci-1.0";
>>                  method = "smc";
>> @@ -1068,6 +1074,68 @@
>>                          #size-cells = <1>;
>>                          ranges = <0x32c00000 0x32c00000 0x400000>;
>>
>> +                       lcdif: lcdif@32e00000 {
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               compatible = "fsl,imx8mm-lcdif", "fsl,imx6sx-lcdif";
> 
> The compatible "imx6sx-lcdif" implies MXSFB_V6.  FWICT, it is like
> MXSFB_V4, but with overlays and those overlays have more registers
> configured in the mxsfb_kms driver.  Have you tried using imx28-lcdif
> to see if it makes a difference?

Indeed, MX6SX has AS overlay plane support, MX{2,}8 does not.

LCDIFv3 (as NXP calls it) in MX8MP is like LCDIFv6 (in MX6SX) with 
slightly reordered register bits, but nothing like LCDIF rev3 (in MX23) 
... just to make sure there is no confusion.

[...]

>> +                       mipi_dsi: mipi_dsi@32e10000 {
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               compatible = "fsl,imx8mm-mipi-dsim";
>> +                               reg = <0x32e10000 0x400>;
>> +                               clocks = <&clk IMX8MM_CLK_DSI_CORE>,
>> +                                        <&clk IMX8MM_CLK_DSI_PHY_REF>;
>> +                               clock-names = "bus_clk", "sclk_mipi";
>> +                               assigned-clocks = <&clk IMX8MM_CLK_DSI_CORE>,
>> +                                                 <&clk IMX8MM_VIDEO_PLL1_OUT>,
>> +                                                 <&clk IMX8MM_CLK_DSI_PHY_REF>;
>> +                               assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_266M>,
>> +                                                        <&clk IMX8MM_VIDEO_PLL1_BYPASS>,
>> +                                                        <&clk IMX8MM_VIDEO_PLL1_OUT>;
>> +                               assigned-clock-rates = <266000000>, <594000000>, <27000000>;
>> +                               interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
>> +                               phys = <&mipi_phy 0>;
>> +                               phy-names = "dsim";
>> +                               power-domains = <&disp_blk_ctrl IMX8MM_DISPBLK_PD_MIPI_DSI>;
>> +                               samsung,burst-clock-frequency = <891000000>;
>> +                               samsung,esc-clock-frequency = <54000000>;
>> +                               samsung,pll-clock-frequency = <27000000>;

This 27 MHz is really IMX8MM_CLK_DSI_PHY_REF and 
samsung,burst-clock-frequency is really the DSI link clock which is 
panel/bridge specific ... but, why do we need to specify such policy in 
DT rather than have the panel/bridge drivers negotiate the best clock 
settings with DSIM bridge driver ? This should be something which should 
be implemented in the DRM subsystem, not hard-coded in DT. These ad-hoc 
samsung,*-clock-frequency properties shouldn't even be needed then.

Also, are the DSIM bindings stable now ?
