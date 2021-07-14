Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EB13C8434
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 14:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1822E6E226;
	Wed, 14 Jul 2021 12:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C87AE6E226
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 12:03:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21097D6E;
 Wed, 14 Jul 2021 05:03:09 -0700 (PDT)
Received: from [10.57.36.240] (unknown [10.57.36.240])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E03B53F694;
 Wed, 14 Jul 2021 05:03:06 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] dt-bindings: display: rockchip: Add compatible for
 rk3568 HDMI
To: Michael Riesch <michael.riesch@wolfvision.net>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, hjc@rock-chips.com,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 algea.cao@rock-chips.com, andy.yan@rock-chips.com
References: <20210707120323.401785-1-benjamin.gaignard@collabora.com>
 <20210707120323.401785-2-benjamin.gaignard@collabora.com>
 <1bd64284-0a20-12e3-e2e7-19cdfdbf1a25@wolfvision.net>
 <3865833.Ac65pObt5d@diego>
 <33532a38-52e6-179a-9ed9-76bbb9618168@wolfvision.net>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <f7722b3d-4432-ce14-e4c8-4759496ff65f@arm.com>
Date: Wed, 14 Jul 2021 13:02:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <33532a38-52e6-179a-9ed9-76bbb9618168@wolfvision.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-14 10:19, Michael Riesch wrote:
> Hello Heiko,
> 
> On 7/13/21 10:49 AM, Heiko Stübner wrote:
>> Hi Michael,
>>
>> Am Dienstag, 13. Juli 2021, 10:44:00 CEST schrieb Michael Riesch:
>>> The HDMI TX block in the RK3568 requires two power supplies, which have
>>> to be enabled in some cases (at least on the RK3568 EVB1 the voltages
>>> VDDA0V9_IMAGE and VCCA1V8_IMAGE are disabled by default). It would be
>>> great if this was considered by the driver and the device tree binding.
>>> I am not sure, though, whether this is a RK3568 specific or
>>> rockchip_dw_hdmi specific thing. Maybe it can even enter the Synopsis DW
>>> HDMI driver.
>>
>> I do remember that this discussion happened many years back already.
>> And yes the supplies are needed for all but back then there was opposition
>> as these are supposedly phy-related supplies, not for the dw-hdmi itself.
>> [There are variants with an external phy, like on the rk3328]
>>
>> See discussion on [0]
>>
>> [0] https://dri-devel.freedesktop.narkive.com/pen2zWo1/patch-v3-1-2-drm-bridge-dw-hdmi-support-optional-supply-regulators
> 
> Thanks for the pointer. My summary of this discussion would be the
> following:
> 
>   - There was no consensus on how to handle the issue. The voltages still
> have to be enabled from the outside of the driver.
>   - Open question: rockchip-specific or general solution? (one may detect
> a tendency towards a rockchip-specific solution)
>   - Open question: separation of the phy from the dw_hdmi IP core?
> 
> First of all, IMHO the driver should enable those voltages, otherwise we
> will have the same discussion again in 5-6 years :-)
> 
> Then, the rockchip,dw-hdmi binding features a property "phys",
> presumably to handle external phys (e.g., for the RK3328). This fact and
> the referenced discussion suggest a rockchip-specific solution.

FWIW I've long thought that cleaning up the phy situation in dw-hdmi 
would be a good idea. It's always seemed a bit sketchy that on RK3328 we 
still validate modes against the tables for the Synopsys phy which isn't 
relevant, and if that does allow a clock rate through that the actual 
phy rejects then things just go horribly wrong and the display breaks.

> In the Rockchip documentation (at least for RK3328, RK3399 and RK3568),
> there are two extra voltages denoted as "HDMI PHY analog power". It
> would be tempting to add the internal phy to the device tree and glue it
> to the dw-hdmi using the "phys" property. However, as pointed out in the
> referenced discussion, the configuration registers of the phy are
> somewhat interleaved with the dw-hdmi registers and a clear separation
> may be tricky.

Conceptually I don't think there's any issue with the HDMI node being 
its own phy provider where appropriate. At the DT level it should simply 
be a case of having both sets of properties, e.g.:

	&hdmi {
		#phy-cells = <0>;
		phys = <&hdmi>;
	};

And at the driver level AFAICS it's pretty much just a case of dw-hdmi 
additionally registering itself as a phy provider if the internal phy is 
present - the only difference then should be that it can end up calling 
back into itself via the common phy API rather than directly via 
internal special-cases.

Robin.

> As a more pragmatic alternative, we could add optional supplies to the
> rockchip,dw-hdmi binding and evaluate the "phys" property. If the latter
> is not specified, the internal phy is used and the supplies must be
> enabled. Would such an approach be acceptable?
> 
> Best regards,
> Michael
> 
>>> On 7/7/21 2:03 PM, Benjamin Gaignard wrote:
>>>> Define a new compatible for rk3568 HDMI.
>>>> This version of HDMI hardware block needs two new clocks hclk_vio and hclk
>>>> to provide phy reference clocks.
>>>>
>>>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>>>> ---
>>>> version 2:
>>>> - Add the clocks needed for the phy.
>>>>
>>>>   .../bindings/display/rockchip/rockchip,dw-hdmi.yaml         | 6 +++++-
>>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
>>>> index 75cd9c686e985..cb8643b3a8b84 100644
>>>> --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-hdmi.yaml
>>>> @@ -23,6 +23,7 @@ properties:
>>>>         - rockchip,rk3288-dw-hdmi
>>>>         - rockchip,rk3328-dw-hdmi
>>>>         - rockchip,rk3399-dw-hdmi
>>>> +      - rockchip,rk3568-dw-hdmi
>>>>   
>>>>     reg-io-width:
>>>>       const: 4
>>>> @@ -51,8 +52,11 @@ properties:
>>>>             - vpll
>>>>         - enum:
>>>>             - grf
>>>> +          - hclk_vio
>>>> +          - vpll
>>>> +      - enum:
>>>> +          - hclk
>>>>             - vpll
>>>> -      - const: vpll
>>>
>>> The description and documentation of the clocks are somewhat misleading
>>> IMHO. This is not caused by your patches, of course. But maybe this is a
>>> chance to clean them up a bit.
>>>
>>> It seems that the CEC clock is an optional clock of the dw-hdmi driver.
>>> Shouldn't it be documented in the synopsys,dw-hdmi.yaml?
>>>
>>> Also, it would be nice if the clocks hclk_vio and hclk featured a
>>> description in the binding.
>>>
>>> BTW, I am not too familiar with the syntax here, but shouldn't items in
>>> clocks and items in clock-names be aligned (currently, there is a plain
>>> list vs. an enum structure)?
>>>
>>> Best regards,
>>> Michael
>>>
>>>>   
>>>>     ddc-i2c-bus:
>>>>       $ref: /schemas/types.yaml#/definitions/phandle
>>>>
>>>
>>
>>
>>
>>
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 
