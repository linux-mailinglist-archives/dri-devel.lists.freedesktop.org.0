Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 774624C8CD2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 14:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A17010EBD4;
	Tue,  1 Mar 2022 13:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1CE6510EBD4
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 13:39:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5E3E1042;
 Tue,  1 Mar 2022 05:39:37 -0800 (PST)
Received: from [10.57.39.47] (unknown [10.57.39.47])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D14883F70D;
 Tue,  1 Mar 2022 05:39:35 -0800 (PST)
Message-ID: <5184ecf2-8734-3121-cbbc-5dcfcf0d02f8@arm.com>
Date: Tue, 1 Mar 2022 13:39:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v7 10/24] drm/rockchip: dw_hdmi: Add support for hclk
Content-Language: en-GB
To: Sascha Hauer <s.hauer@pengutronix.de>
References: <20220225075150.2729401-1-s.hauer@pengutronix.de>
 <20220225075150.2729401-11-s.hauer@pengutronix.de>
 <47ddcaf3-4544-2b7c-a2f6-1f6346907f33@gmail.com>
 <20220225104924.GC19585@pengutronix.de>
 <78207d97-b5a1-9792-8ec9-11fcf2e00370@gmail.com>
 <90c61299-f02c-607b-4734-7134852ef0a6@arm.com>
 <20220225131154.GE19585@pengutronix.de>
 <20220228141921.GN19585@pengutronix.de>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220228141921.GN19585@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kernel@pengutronix.de,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 Dmitry Osipenko <digetx@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-02-28 14:19, Sascha Hauer wrote:
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
>>>>>>>       Changes since v5:
>>>>>>>       - Use devm_clk_get_optional rather than devm_clk_get
>>>>>>>
>>>>>>>    drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 16 ++++++++++++++++
>>>>>>>    1 file changed, 16 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>>>>>>> index fe4f9556239ac..c6c00e8779ab5 100644
>>>>>>> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>>>>>>> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>>>>>>> @@ -76,6 +76,7 @@ struct rockchip_hdmi {
>>>>>>>    	const struct rockchip_hdmi_chip_data *chip_data;
>>>>>>>    	struct clk *ref_clk;
>>>>>>>    	struct clk *grf_clk;
>>>>>>> +	struct clk *hclk_clk;
>>>>>>>    	struct dw_hdmi *hdmi;
>>>>>>>    	struct regulator *avdd_0v9;
>>>>>>>    	struct regulator *avdd_1v8;
>>>>>>> @@ -229,6 +230,14 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi *hdmi)
>>>>>>>    		return PTR_ERR(hdmi->grf_clk);
>>>>>>>    	}
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
>>                  reg = <RK3568_PD_VO>;
>>                  clocks = <&cru HCLK_VO>,
>>                           <&cru PCLK_VO>,
>>                           <&cru ACLK_VOP_PRE>;
>>                   pm_qos = <&qos_hdcp>,
>>                            <&qos_vop_m0>,
>>                            <&qos_vop_m1>;
>>                   #power-domain-cells = <0>;
>>          };
> 
> Forget this. The clocks in this node are only enabled during enabling or
> disabling the power domain, they are disabled again immediately afterwards.
> 
> OK, I need HCLK_VO to access the HDMI registers. I verified that by
> disabling HCLK_VO at register level (CRU_GATE_CON(20) BIT(1)). The
> HDMI registers become inaccessible then. This means I'll replace
> HCLK_VOP in the HDMI node with HCLK_VO. Does this sound sane?

Well, it's still a mystery hack overall, and in some ways it seems even 
more suspect to be claiming a whole branch of the clock tree rather than 
a leaf gate with a specific purpose. I'm really starting to think that 
the underlying issue here is a bug in the clock driver, or a hardware 
mishap that should logically be worked around by the clock driver, 
rather than individual the consumers.

Does it work if you hack the clock driver to think that PCLK_VO is a 
child of HCLK_VO? Even if that's not technically true, it would seem to 
effectively match the observed behaviour (i.e. all 3 things whose 
register access apparently *should* be enabled by a gate off PCLK_VO, 
seem to also require HCLK_VO).

Thanks,
Robin.
