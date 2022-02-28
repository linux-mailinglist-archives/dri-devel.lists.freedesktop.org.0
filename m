Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF8A4C84D3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 08:19:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D5910E553;
	Tue,  1 Mar 2022 07:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0B310E49A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 22:57:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 3042A1F423B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646089023;
 bh=tDw4/9z1BWN6uQ1DtFf3OuzY4gvXbQTpmRSQj18ThTk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jdt+ei0FRFhky8k2CoBDWEhaMiwgX1P5OLn4fNp4PXsGVCniC4TQ5nJ+ISqWKgqFS
 6iGxkpeCQDa4YoyJAGnngj1VnBVN3tlRJL5WkpsB+f6TnZCzIxA0TsbVPHR+NvXKMy
 LQaOTEbEzgz+Uqe6+v+yNpHt5qCuHD8qcuVAGog1cF574gPY1JuEoy1PyO8cmbnYSF
 g3iy3aPcLwLzSZsZyN8EE+g2gro3AdY7xcVTbNjAY3lhtWUMNAz1y3BQg/72FG8LDA
 YZ2p++yhi6099uCOJT1LWsCKDS+CIpeKDKpX51QzGDT7sxYUEepTOFrbKgUOvOuvU3
 lCtpQuC05Aqxg==
Message-ID: <43eb78d9-4252-938e-aaaa-8d353730314a@collabora.com>
Date: Tue, 1 Mar 2022 01:56:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v7 10/24] drm/rockchip: dw_hdmi: Add support for hclk
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>, Robin Murphy <robin.murphy@arm.com>
References: <20220225075150.2729401-1-s.hauer@pengutronix.de>
 <20220225075150.2729401-11-s.hauer@pengutronix.de>
 <47ddcaf3-4544-2b7c-a2f6-1f6346907f33@gmail.com>
 <20220225104924.GC19585@pengutronix.de>
 <78207d97-b5a1-9792-8ec9-11fcf2e00370@gmail.com>
 <90c61299-f02c-607b-4734-7134852ef0a6@arm.com>
 <20220225131154.GE19585@pengutronix.de>
 <20220228141921.GN19585@pengutronix.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220228141921.GN19585@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 01 Mar 2022 07:18:19 +0000
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, Dmitry Osipenko <digetx@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/28/22 17:19, Sascha Hauer wrote:
> On Fri, Feb 25, 2022 at 02:11:54PM +0100, Sascha Hauer wrote:
>> On Fri, Feb 25, 2022 at 12:41:23PM +0000, Robin Murphy wrote:
>>> On 2022-02-25 11:10, Dmitry Osipenko wrote:
>>>> 25.02.2022 13:49, Sascha Hauer пишет:
>>>>> On Fri, Feb 25, 2022 at 01:26:14PM +0300, Dmitry Osipenko wrote:
>>>>>> 25.02.2022 10:51, Sascha Hauer пишет:
>>>>>>> The rk3568 HDMI has an additional clock that needs to be enabled for the
>>>>>>> HDMI controller to work. The purpose of that clock is not clear. It is
>>>>>>> named "hclk" in the downstream driver, so use the same name.
>>>>>>>
>>>>>>> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
>>>>>>> ---
>>>>>>>
>>>>>>> Notes:
>>>>>>>      Changes since v5:
>>>>>>>      - Use devm_clk_get_optional rather than devm_clk_get
>>>>>>>
>>>>>>>   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 16 ++++++++++++++++
>>>>>>>   1 file changed, 16 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>>>>>>> index fe4f9556239ac..c6c00e8779ab5 100644
>>>>>>> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>>>>>>> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>>>>>>> @@ -76,6 +76,7 @@ struct rockchip_hdmi {
>>>>>>>   	const struct rockchip_hdmi_chip_data *chip_data;
>>>>>>>   	struct clk *ref_clk;
>>>>>>>   	struct clk *grf_clk;
>>>>>>> +	struct clk *hclk_clk;
>>>>>>>   	struct dw_hdmi *hdmi;
>>>>>>>   	struct regulator *avdd_0v9;
>>>>>>>   	struct regulator *avdd_1v8;
>>>>>>> @@ -229,6 +230,14 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
>>>>>>>   		return PTR_ERR(hdmi->grf_clk);
>>>>>>>   	}
>>>>>>> +	hdmi->hclk_clk = devm_clk_get_optional(hdmi->dev, "hclk");
>>>>>>> +	if (PTR_ERR(hdmi->hclk_clk) == -EPROBE_DEFER) {
>>>>>>
>>>>>> Have you tried to investigate the hclk? I'm still thinking that's not
>>>>>> only HDMI that needs this clock and then the hardware description
>>>>>> doesn't look correct.
>>>>>
>>>>> I am still not sure what you mean. Yes, it's not only the HDMI that
>>>>> needs this clock. The VOP2 needs it as well and the driver handles that.
>>>>
>>>> I'm curious whether DSI/DP also need that clock to be enabled. If they
>>>> do, then you aren't modeling h/w properly AFAICS.
>>>
>>> Assuming nobody at Rockchip decided to make things needlessly inconsistent
>>> with previous SoCs, HCLK_VOP should be the clock for the VOP's AHB slave
>>> interface. Usually, if that affected anything other than accessing VOP
>>> registers, indeed it would smell of something being wrong in the clock tree,
>>> but in this case I'd also be suspicious of whether it might have ended up
>>> clocking related GRF registers as well (either directly, or indirectly via
>>> some gate that the clock driver hasn't modelled yet).
>>
>> Ok, I am beginning to understand. I verified that hdmi, mipi and dp are
>> hanging when HCLK_VOP is disabled by disabling that clock via sysfs
>> using CLOCK_ALLOW_WRITE_DEBUGFS. When it's disabled then the registers
>> of that units can't be accessed. However, when I disable HCLK_VOP by
>> directly writing to the gate bit RK3568_CLKGATE_CON(20) then only
>> accessing VOP registers hangs, the other units stay functional.
>> So it seems it must be the parent clock which must be enabled. The
>> parent clock is hclk_vo. This clock should be handled as part of the
>> RK3568_PD_VO power domain:
>>
>> 	power-domain@RK3568_PD_VO {
>>                 reg = <RK3568_PD_VO>;
>>                 clocks = <&cru HCLK_VO>,
>>                          <&cru PCLK_VO>,
>>                          <&cru ACLK_VOP_PRE>;
>>                  pm_qos = <&qos_hdcp>,
>>                           <&qos_vop_m0>,
>>                           <&qos_vop_m1>;
>>                  #power-domain-cells = <0>;
>>         };
> 
> Forget this. The clocks in this node are only enabled during enabling or
> disabling the power domain, they are disabled again immediately afterwards.
> 
> OK, I need HCLK_VO to access the HDMI registers. I verified that by
> disabling HCLK_VO at register level (CRU_GATE_CON(20) BIT(1)). The
> HDMI registers become inaccessible then. This means I'll replace
> HCLK_VOP in the HDMI node with HCLK_VO. Does this sound sane?

The RK3568_PD_VO already has HCLK_VO and the domain should be
auto-enabled before HDMI registers are accessed, hence you should do the
opposite and remove the HCLK_VO/P clock from the HDMI DT, not add it. If
the HCLK_VO clock isn't enabled by the domain driver, then you need to
check why. Or am I missing something?

What about DSI and DP? Don't they depend on RK3568_PD_VO as well?
