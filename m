Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE58D3D3A2E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 14:27:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA03B6F4D9;
	Fri, 23 Jul 2021 12:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6576F4D9
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 12:27:30 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DB68082AC8;
 Fri, 23 Jul 2021 14:27:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1627043248;
 bh=BMRi2GxUriRwmcdG1cPsCeoz19yB61hstpeYO9lGmf8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QHpexctG4cy8oTIP3vXAQ6VUcBbCQtbRsM3SxwvxPcsYtg+DUjwCwka9DrPykqSY2
 GB/GNwxtJW/xl82Mol36Cjwh0ft+h8MaTAgWMNgnKGIAlv/NAkmT14mmPyyiQaWB8s
 8D7b+5Osu6kdVNIuxhRVCHgVu07GYkmP8qlMKdhOhlyoSQm9nx/zXpFwJyu8y55qcF
 pJD9XgJ6Nmft2Taizxr/bes5O+Cy6ckO9CiVRgolFqsr/AFo5/olQt7qoWnbD32poV
 9FLj5n71FAK5bYEYAV6oZITtrHx6zYEspcqgPckflUl/aOuOCBiAK3RoEb0sTzJtof
 syPqsehfugsJQ==
Subject: Re: [PATCH] backlight: pwm_bl: Avoid backlight flicker if backlight
 control GPIO is input
To: Daniel Thompson <daniel.thompson@linaro.org>
References: <20210718211415.143709-1-marex@denx.de>
 <20210719112202.4fvmn57ibgy3yesa@maple.lan>
 <bbaad78e-91c7-0787-fa72-b5cfabcc6dbd@denx.de>
 <20210721104914.4difos6w3ysjelnv@maple.lan>
 <fee1ad9e-ae70-1644-5444-6c894473b48e@denx.de>
 <20210721161249.gehnwkscto2hlh7s@maple.lan>
 <298f6a35-2120-60a6-598a-87b141118bfa@denx.de>
 <20210722112824.z5s2fst2q3vrblcr@maple.lan>
 <dd372ddc-0137-2f1c-8493-4bd38762384c@denx.de>
 <20210723101510.r2xz4rlzvgkhxtw3@maple.lan>
 <20210723111724.q4yu2ocgn5fdzge6@maple.lan>
From: Marek Vasut <marex@denx.de>
Message-ID: <50dc41ab-cbeb-693e-01f1-fecb1ed3b048@denx.de>
Date: Fri, 23 Jul 2021 14:27:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210723111724.q4yu2ocgn5fdzge6@maple.lan>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/23/21 1:17 PM, Daniel Thompson wrote:
> On Fri, Jul 23, 2021 at 11:15:10AM +0100, Daniel Thompson wrote:
>> On Thu, Jul 22, 2021 at 09:02:04PM +0200, Marek Vasut wrote:
>>> On 7/22/21 1:28 PM, Daniel Thompson wrote:
>>>> On Wed, Jul 21, 2021 at 08:46:42PM +0200, Marek Vasut wrote:
>>>>> On 7/21/21 6:12 PM, Daniel Thompson wrote:
>>>>>> On Wed, Jul 21, 2021 at 05:09:57PM +0200, Marek Vasut wrote:
>>>>>>> On 7/21/21 12:49 PM, Daniel Thompson wrote:
>>>>>> [...]
>>>>>> This sails very close to the
>>>>>> edge of what is in-scope for DT (at least it does it we can read
>>>>>> the inherited state directly from the hardware).
>>>>>
>>>>> The problem with reading it out of hardware is that the hardware might be in
>>>>> undefined state and expects Linux to define that state, so that does not
>>>>> always work. Hence my initial suggestion to add a DT property to define the
>>>>> state up front, instead of using these fragile heuristics.
>>>>
>>>> To achieve a flicker-free boot we must know the initial state of the
>>>> backlight (not just the enable pin).
>>>
>>> The backlight hardware might be in uninitialized state and then Linux should
>>> set the state, likely based on something in DT, because there is no previous
>>> state to read.
>>
>> There is always a previous state. The kernel doesn't care whether that
>> previous state was imposed by a power-on reset, the bootloader or a
>> kexec.
>>
>> For the driver to come up flicker-free in all the different cases we
>> need to know whether the backlight is currently emitting light or not
>> and, if it is emitting light, then we need to know what the duty cycle
>> is (currently we inherit require the PWM driver to correctly inherit the
>> duty cycle from the hardware).
> 
> Oops... this is wrong (I think it is cross-talk from an old patch). We
> do not currently inherit the duty cycle.

There is that, and if you did, you would be telling PWM drivers not to 
reset/reinit the hardware in probe. I'm not sure whether that is a good 
idea.

>> So far, the previous state has been observable by the lower level
>> drivers (GPIO, PWM, regulator). I remain reluctant to provide
>> workarounds for cases where it is not observable without motivating
>> hardware. I certainly wouldn't want to make such bindings mandatory
>> since observable hardware registers are a far more reliable source of
>> truth than what the DT tells us about what it thinks the bootloader
>> (or power-on reset) actually did ;-).
> 
> Which makes conclusion badly reasoned.
> 
> However, until we can clearly articulate whether the problem we want to
> solve is describing the initial backlight state or specifying the default
> (post-probe) power state for the legacy cases I'm still content not to
> change things ;-).

For me, it was always about specifying well defined default state of the 
backlight.

>>>> [...]
>>>> Wow! That is *way* longer than I intended when I started writing it.
>>>> Anyhow I suspect any disconnect comes about due to the difference in
>>>> backlight state *after* probe being, in part, to software structure
>>>> rather than purely a hardware property.
>>>
>>> Maybe this should be added to documentation.
>>
>> I'll see what I can do.
> 
> Done, see v3. I think it is better explained than the e-mail version.

Thanks
