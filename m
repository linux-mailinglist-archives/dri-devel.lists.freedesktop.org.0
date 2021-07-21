Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F09AA3D16A1
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 20:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D666F6E25B;
	Wed, 21 Jul 2021 18:46:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3EC6E25B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 18:46:44 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A726781BC0;
 Wed, 21 Jul 2021 20:46:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1626893203;
 bh=FTSTkGX+tDvHXth2Qra7oYplcQ9wA4ZICxhqhW27y2g=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=MDzBHX/GMiiT8kDkjrvNdAA6yAwuSu8ZmVhGFAGMKwWbmVDs7IOmyIAFuoeQzf834
 MVJdf2xE/nuVdUNN8G9i+fWTN7AVAezd0RC2uGFm70uVaoSyUczXPi4JaErH9i0WKe
 xmneCQtH+JwNT+9gMnerR1MGIoplgYubLegM3ZTCSvCkozvQx57GIDNt5c+pWuCo3Z
 RtMprbftkFAH8rJGuKwgqvqYybdtgqS4IiKhUSQSlB4a3miYb/W4t/KH8vpBQSdxIo
 aphD8iByIJcLlX79bQIeYQqV5HMSvF6kNHPtukoV735C705HjE0o4H6JFwD0TZ1Uip
 JHZ70y7GIPD9A==
Subject: Re: [PATCH] backlight: pwm_bl: Avoid backlight flicker if backlight
 control GPIO is input
To: Daniel Thompson <daniel.thompson@linaro.org>
References: <20210718211415.143709-1-marex@denx.de>
 <20210719112202.4fvmn57ibgy3yesa@maple.lan>
 <bbaad78e-91c7-0787-fa72-b5cfabcc6dbd@denx.de>
 <20210721104914.4difos6w3ysjelnv@maple.lan>
 <fee1ad9e-ae70-1644-5444-6c894473b48e@denx.de>
 <20210721161249.gehnwkscto2hlh7s@maple.lan>
From: Marek Vasut <marex@denx.de>
Message-ID: <298f6a35-2120-60a6-598a-87b141118bfa@denx.de>
Date: Wed, 21 Jul 2021 20:46:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210721161249.gehnwkscto2hlh7s@maple.lan>
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

On 7/21/21 6:12 PM, Daniel Thompson wrote:
> On Wed, Jul 21, 2021 at 05:09:57PM +0200, Marek Vasut wrote:
>> On 7/21/21 12:49 PM, Daniel Thompson wrote:
>>>> I'm not sure that's correct, we can simply say that any new uses of the
>>>> pwm-backlight should specify the initial GPIO configuration, and for the
>>>> legacy ones, use whatever is in the code now.
>>>
>>> I'm not 100% against the idea... however if we still have to get the
>>> code to read state from the hardware right for legacy cases that means
>>> we have to do the same work but with fewer people testing it.
>>
>> We can do something like this:
>>
>> if (of_property_read_bool(np, "enable-active-high"))
>>    gpiod_direction_output(pb->enable_gpio, 1);
>> else if (of_property_read_bool(np, "enable-active-low"))
>>    gpiod_direction_output(pb->enable_gpio, 0);
>> else {
>>    WARN_ON_ONCE("Fix your DT"); // or some such notification
>>    ... legacy code path ...
>> }
>>
>> Note that I picked the same DT prop names as drivers/gpio/gpiolib-of.c
>> of_gpio_flags_quirks() uses, because we are headed into similar mess here
>> I'm afraid.
> 
> I don't quite understand what you mean here. We are using gpiolib so
> for us there is no concept of active-high or active-low. The only
> concept for us is whether enable_gpio is asserted or not.

It would look the same -- just substitute in "enable-on-boot" and 
"disable-on-boot" DT property.

> What the DT property would be describing is purely whether the
> bootloader left the backlight on or off.

Rather, it would simply control what is the default state of the 
backlight enable GPIO (enabled/disabled).

> This sails very close to the
> edge of what is in-scope for DT (at least it does it we can read
> the inherited state directly from the hardware).

The problem with reading it out of hardware is that the hardware might 
be in undefined state and expects Linux to define that state, so that 
does not always work. Hence my initial suggestion to add a DT property 
to define the state up front, instead of using these fragile heuristics.

> What it also means decisions about the DT bindings are more about
> whether, if the backlight is lit up, the bootloader should also disclose
> what it thinks it has established as the PWM duty cycle as well.

Please also consider the case where bootloader configures total minimum 
of the hardware to start Linux as soon as possible, i.e. it puts Linux 
in DRAM and jumps to Linux.

> Overall I have fairly grave concerns that this simply moves
> fragility into the bootloader rather then reducing it.

Wait a minute, I think we disconnected somewhere. I would rather prefer 
to remove the fragility and bootloader dependency altogether, exactly to 
avoid depending on the state the bootloader left the hardware in.
