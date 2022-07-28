Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56651583D6B
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 13:30:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647DD92809;
	Thu, 28 Jul 2022 11:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1588FF1C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 11:30:00 +0000 (UTC)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi
 [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 768BE56D;
 Thu, 28 Jul 2022 13:29:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1659007799;
 bh=cP7pleNw1IEJNxqLv102NYVM6Rzxz1YMyqyFlCsJvzw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=I8fru3S4A8nF8uztplND+Vd90cCCGl4Uia+LTzNb1QkXsjPsZBDNtCzsec/xdy31D
 I3fhXwSM4KUyYmpMqGMPcyDpEhJ/vsa5JKzMNFM9lTEcAjqPsNyXMQR8pGEoxYqu3f
 /y4G8/Ja1dBaSURQRn9mZiVc7mO+2eMYKNm6n+t8=
Message-ID: <ddb4cffd-bf0e-2a5e-2922-9c1ee12cfd25@ideasonboard.com>
Date: Thu, 28 Jul 2022 14:29:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 8/8] drm/tidss: Enable Dual and Duplicate Modes for OLDI
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>
References: <20220719080845.22122-1-a-bhatia1@ti.com>
 <20220719080845.22122-9-a-bhatia1@ti.com>
 <83df99ee-1304-121f-97e6-85ca416aef1f@ideasonboard.com>
 <c72e64b5-fbf0-0605-1d50-5b1f9b99eacf@ideasonboard.com>
 <0d9f4301-8af5-4497-8e59-affdc0541285@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <0d9f4301-8af5-4497-8e59-affdc0541285@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Darren Etheridge <detheridge@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, Rahul T R <r-ravikumar@ti.com>,
 Krunal Bhargav <k-bhargav@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/07/2022 11:49, Aradhya Bhatia wrote:
> Hi Tomi,
> 
> On 28-Jul-22 12:16, Tomi Valkeinen wrote:
>> On 27/07/2022 16:22, Tomi Valkeinen wrote:
>>> Hi,
>>>
>>> On 19/07/2022 11:08, Aradhya Bhatia wrote:
>>>> The AM625 DSS peripheral supports 2 OLDI TXes which can work to 
>>>> enable 2
>>>> duplicated displays of smaller resolutions or enable a single Dual-Link
>>>> display with a higher resolution (1920x1200).
>>>>
>>>> Configure the necessary register to enable the different modes.
>>>>
>>>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>>>> ---
>>>>   drivers/gpu/drm/tidss/tidss_dispc.c | 44 
>>>> +++++++++++++++++++++++++++--
>>>>   1 file changed, 41 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c 
>>>> b/drivers/gpu/drm/tidss/tidss_dispc.c
>>>> index 0b9689453ee8..28cb61259471 100644
>>>> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
>>>> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
>>>> @@ -1021,8 +1021,8 @@ static void dispc_enable_oldi(struct 
>>>> dispc_device *dispc, u32 hw_videoport,
>>>>       int count = 0;
>>>>       /*
>>>> -     * For the moment DUALMODESYNC, MASTERSLAVE, MODE, and SRC
>>>> -     * bits of DISPC_VP_DSS_OLDI_CFG are set statically to 0.
>>>> +     * For the moment MASTERSLAVE, and SRC bits of 
>>>> DISPC_VP_DSS_OLDI_CFG are
>>>> +     * set statically to 0.
>>>>        */
>>>>       if (fmt->data_width == 24)
>>>> @@ -1039,7 +1039,45 @@ static void dispc_enable_oldi(struct 
>>>> dispc_device *dispc, u32 hw_videoport,
>>>>       oldi_cfg |= BIT(0); /* ENABLE */
>>>> -    dispc_vp_write(dispc, hw_videoport, DISPC_VP_DSS_OLDI_CFG, 
>>>> oldi_cfg);
>>>> +    /*
>>>> +     * As per all the current implementations of DSS, the OLDI TXes 
>>>> are present only on
>>>> +     * hw_videoport = 0 (OLDI TX 0). However, the config register 
>>>> for 2nd OLDI TX (OLDI TX 1)
>>>> +     * is present in the address space of hw_videoport = 1. Hence, 
>>>> using "hw_videoport + 1" to
>>>> +     * configure OLDI TX 1.
>>>> +     */
>>>> +
>>>> +    switch (dispc->oldi_mode) {
>>>> +    case OLDI_MODE_OFF:
>>>> +        oldi_cfg &= ~BIT(0); /* DISABLE */
>>>> +        dispc_vp_write(dispc, hw_videoport, DISPC_VP_DSS_OLDI_CFG, 
>>>> oldi_cfg);
>>>> +        dispc_vp_write(dispc, hw_videoport + 1, 
>>>> DISPC_VP_DSS_OLDI_CFG, oldi_cfg);
>>>> +        break;
>>>> +
>>>> +    case OLDI_SINGLE_LINK_SINGLE_MODE_0:
>>>> +        dispc_vp_write(dispc, hw_videoport, DISPC_VP_DSS_OLDI_CFG, 
>>>> oldi_cfg);
>>>> +        break;
>>>> +
>>>> +    case OLDI_SINGLE_LINK_SINGLE_MODE_1:
>>>> +        dispc_vp_write(dispc, hw_videoport + 1, 
>>>> DISPC_VP_DSS_OLDI_CFG, oldi_cfg);
>>>> +        break;
>>>> +
>>>> +    case OLDI_SINGLE_LINK_DUPLICATE_MODE:
>>>> +        oldi_cfg |= BIT(5); /* DUPLICATE MODE */
>>>> +        dispc_vp_write(dispc, hw_videoport, DISPC_VP_DSS_OLDI_CFG, 
>>>> oldi_cfg);
>>>> +        dispc_vp_write(dispc, hw_videoport + 1, 
>>>> DISPC_VP_DSS_OLDI_CFG, oldi_cfg);
>>>> +        break;
>>>> +
>>>> +    case OLDI_DUAL_LINK:
>>>> +        oldi_cfg |= BIT(11); /* DUALMODESYNC */
>>>> +        dispc_vp_write(dispc, hw_videoport, DISPC_VP_DSS_OLDI_CFG, 
>>>> oldi_cfg);
>>>> +        dispc_vp_write(dispc, hw_videoport + 1, 
>>>> DISPC_VP_DSS_OLDI_CFG, oldi_cfg);
>>>> +        break;
>>>> +
>>>> +    default:
>>>> +        dev_warn(dispc->dev, "%s: Incorrect oldi mode. Returning.\n",
>>>> +             __func__);
>>>> +        return;
>>>> +    }
>>>>       while (!(oldi_reset_bit & dispc_read(dispc, DSS_SYSSTATUS)) &&
>>>>              count < 10000)
>>>
>>> This feels a bit hacky:
>>>
>>> - The function is dispc_enable_oldi, but the above code also disables 
>>> oldi. We have code in dispc_vp_unprepare() which disables OLDI at the 
>>> moment.
>>>
>>> - The function takes hw_videoport as a parameter, and is designed to 
>>> work on that videoport. The above operates on two videoports. Isn't 
>>> the function also called for hw_videoport +1, which would result in 
>>> reg writes to hw_videoport + 2?
>>>
>>> - No matching code in dispc_vp_unprepare
>>>
>>> Obviously the duplicate mode (I presume that's "cloning") and the 
>>> dual link complicate things here, and I have to say I haven't worked 
>>> with such setups. But I think somehow this should be restructured so 
>>> that common configuration (common to the OLDIs) is done somewhere else.
>>>
>>> I would guess that there are other drivers that support cloning and 
>>> dual mode. Did you have a look how they handle things?
>>
>> Oh, I see now... There's just one dss video port for OLDI, the same as 
>> in am65x, but that single video port is now connected to two OLDI 
>> TXes. And thus this function will only be called for the single video 
>> port.
>> > But... The registers for the second OLDI are part of the second video
>> port (DPI) register block?
> 
> Yes! The config register for the second OLDI TX has been (incorrectly)
> added in the register space for the DPI video port. 'dispc_vp_prepare'
> is the only function calling 'dispc_enable_oldi', and
> 'dispc_enable_oldi' would not be called for hw_videoports = 1 (DPI)
> because of the conditional check.
> 
> Hence, to activate both the OLDI-TXes connected to the OLDI video port,
> I had to use the (hw_videoport + 1) way.

I think this should be highlighted in the comment more clearly. Also, I 
don't think hw_videoport + 1 usage is good. While in this case the 
registers are in vp + 1, it's, in a way, a coincidence.

Instead, have a new variable for the VP register block which contains 
the OLDI TX 1 registers, and just set that to 1 with a comment 
clarifying that the registers for OLDI 1 are in VP1 register block, even 
if OLDI 1 is connected to VP0.

And then use that variable when calling dispc_vp_write().

  Tomi
