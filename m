Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3093761069E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 02:03:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D8F10E745;
	Fri, 28 Oct 2022 00:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB6310E741
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 00:03:14 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0144384EF5;
 Fri, 28 Oct 2022 02:03:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1666915392;
 bh=0CNpkQAgEKWBqQnYJGtrCArYNsF/J0mYVa0HZp0w55I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YPsymHUHNm+egp1j/MnLve12XGW1iVKeGXUbfrjSwaByxjIHT8lUORzEdaUC9kclW
 zrTDOaKp8/x9NzgLdeKHNYiEgX9gpLEJ2eVFynE6SM/IBgeytDRVd6Od6r8GOQ+b3F
 zwMdkVrF//jJgShi9pFmuK2EQOI+ZZAgfvSth1WWdZqvgxmyfLmrlB9ZMhTDghB31v
 IMllxYp1lgro0Xl9u/sF0YeN4KyC5M9hkP/QY6hxEqnROAhbmFNKm50fKK8ZpqHzoo
 dVCI+bAA2+BVbZ6B0StRIScMAJa+c0wD5SFEgMHbuNHfrZyBwU/RLl3tqqcgfQROnr
 t2+e8i8mRA7Pg==
Message-ID: <45837065-f231-8c72-4818-d943133d66a5@denx.de>
Date: Fri, 28 Oct 2022 02:03:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] drm: lcdif: Set and enable FIFO Panic threshold
To: Marco Felsch <m.felsch@pengutronix.de>, Liu Ying <victor.liu@nxp.com>
References: <20221026212002.542375-1-marex@denx.de>
 <2e9368bcc1c354ff01e63b9c451d839aa6a7a36f.camel@nxp.com>
 <9bd9ee85-3a20-f13a-3984-017a439e08cd@denx.de>
 <6398adb972ef8623fd594fd573b5ed6838948516.camel@nxp.com>
 <20221027174748.niz6wi7dqwj3nlyr@pengutronix.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221027174748.niz6wi7dqwj3nlyr@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
Cc: Peng Fan <peng.fan@nxp.com>, Martyn Welch <martyn.welch@collabora.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, "jian.li" <jian.li@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/27/22 19:47, Marco Felsch wrote:
> On 22-10-27, Liu Ying wrote:
>> On Thu, 2022-10-27 at 12:03 +0200, Marek Vasut wrote:
>>> On 10/27/22 07:45, Liu Ying wrote:
>>>
>>> Hi,
>>>
>>> [...]
>>>
>>>>> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
>>>>> b/drivers/gpu/drm/mxsfb/lcdif_kms.c
>>>>> index a5302006c02cd..aee7babb5fa5c 100644
>>>>> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
>>>>> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
>>>>> @@ -341,6 +341,18 @@ static void lcdif_enable_controller(struct
>>>>> lcdif_drm_private *lcdif)
>>>>>    	reg = readl(lcdif->base + LCDC_V8_CTRLDESCL0_5);
>>>>>    	reg |= CTRLDESCL0_5_EN;
>>>>>    	writel(reg, lcdif->base + LCDC_V8_CTRLDESCL0_5);
>>>>> +
>>>>> +	/* Set FIFO Panic watermarks, low 1/3, high 2/3 . */
>>>>> +	writel(FIELD_PREP(PANIC0_THRES_LOW_MASK, 1 * PANIC0_THRES_RANGE
>>>>> / 3) |
>>>>> +	       FIELD_PREP(PANIC0_THRES_HIGH_MASK, 2 *
>>>>> PANIC0_THRES_RANGE / 3),
>>>>
>>>> Better to define PANIC0_THRES_{LOW,HIGH}(n) macros in lcdif_regs.h?
>>>>
>>>> Downstream kernel uses the below threshold values:
>>>> a) i.MX8mp EVK board with LPDDR4
>>>> 1/3 and 2/3 for LCDIF{1,2} + DSI/LVDS - default values in driver
>>>> 1/2 and 3/4 for LCDIF3 + HDMI - set in device tree
>>>>
>>>> b) i.MX8mp EVK board with DDR4
>>>> 1/3 and 2/3 for LCDIF{1,2} + DSI/LVDS - default values in driver
>>>> 2/3 and 3/3 for LCDIF3 + HDMI - set in devic tree
>>>>
>>>> Jian told me that LCDIF3 needs different sets of threshold values
>>>> for
>>>> different types of DDR to avoid 4k HDMI display issues and the
>>>> threshold values impact overall DDR/bus utilization(?), so
>>>> downstream
>>>> kernel chooses to get optional threshold value properties from
>>>> LCDIF DT
>>>> node.
>>>>
>>>> Instead of always using 1/3 and 2/3, maybe there are three options:
>>>> 1) Same to downstream kernel, take 1/3 and 2/3 as default values
>>>> and
>>>> get optional threshold values from DT properties - no additional
>>>> properties are acceptable in the existing DT binding doc?
>>>> 2) Check pixel clock rate, and if it is greater than a certain
>>>> value,
>>>> use 2/3 and 3/3.  Otherwise, use 1/3 and 2/3.
>>>> 3) Always use 2/3 and 3/3.
>>>
>>> Why 2/3 and 3/3 instead of 1/3 and 2/3 ?
>>
>> 2/3 and 3/3 trigger panic signal more easily than 1/3 and 2/3.
>>
>>>
>>> Seems like 1/3 and 2/3 provides enough FIFO margin for every
>>> scenario.
>>
>> I didn't tune the threshold values.  What I was told is that some
>> usecases suffer from the FIFO underflows with 1/3 and 2/3.  And, it
>> appears that FIFO doesn't underflow with 1/2 and 3/4 or 2/3 and 3/3 in
>> those usecases.  That's why downstream kernel chooses to use 1/2 and
>> 3/4 or 2/3 and 3/3.
> 
> Hi Liu Marek,
> 
> I thought that: If the PANIC is enabled and the pre-configured
> panic-priority is high enough, nothing should interrupt the LCDIF in
> panic mode since it has the highest prio? So why does it the downstream
> kernel configure it differently for different use-cases?
> 
> Also IMHO the threshold should be taken wisely to not enter panic mode
> to early to not block others from the bus e.g. the GPU.

As far as I understand the PANIC0_THRES, both thresholds are really 
watermarks in the FIFO, 0=EMPTY, 1/3=LOW, 2/3=HIGH, 3/3=FULL. Under 
normal conditions, the FIFO is filled above 1/3. When the FIFO fill 
drops below LOW=1/3, the "PANIC" signal is asserted so the FIFO can be 
refilled faster. When the FIFO fill raises above HIGH=2/3, the "PANIC" 
signal is deasserted so the FIFO refills at normal rate again.

It seems to me the LOW=1/3 and HIGH=2/3 thresholds are the kind of good 
balance. The LOW=2/3 and HIGH=FULL=3/3 seems like it would keep the 
"PANIC" signal asserted much longer, which could indeed block others 
from the bus.

It also seems to me that tuning these thresholds might be related to 
some special use-case of the SoC, and it is most likely not just the 
LCDIF thresholds which have been adjusted in such case, I would expect 
the NOC and GPV NIC priorities to be adjusted at that point too. So 
unless there are further details for that use-case which justify making 
this somehow configurable, then maybe we should just stick to 1/3 and 
2/3 for now. And once there is a valid use-case which does justify 
making this configurable, then we can add the DT properties and all.

What do you think ?
