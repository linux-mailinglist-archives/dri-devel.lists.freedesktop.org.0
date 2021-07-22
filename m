Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 274483D2C40
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 21:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0666EA51;
	Thu, 22 Jul 2021 19:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4676EA51
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 19:02:07 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A7B4E82BDF;
 Thu, 22 Jul 2021 21:02:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1626980525;
 bh=yJypZUtDzhOHmWGk0d+sOpBGy5S0csKo2oM/FRT684Y=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ttZXBnu/cjkcYs+QxeMIFz1/1YTzecY7LraEWXPWivku3aiUupwGewVRRSIXbY70P
 uWj4r+l4Js9JsYY7qumXrIoS4DV6s1WHz9ODchVPIRNBMEL9ydiyGpBc29yw0WYpoY
 PlUOjc4smBdLVi9UOOruEgdY3xl6Rn1c3WY9GWPYx86N43UlCpmSmE0yerOYk7XDK7
 PHpAXE71yzbRjjq/MQR+t1Vtw6Mp1yejuXvlNYr8UWMuVY7ir7CKlLH7/tfwM0TAyh
 EioRtAJR0hHwf0ygaOX7TIilTKphDTu483A9NWNjAhY/um8aBcI82TROM1RTlcl71m
 NcnqONFOwTk6w==
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
From: Marek Vasut <marex@denx.de>
Message-ID: <dd372ddc-0137-2f1c-8493-4bd38762384c@denx.de>
Date: Thu, 22 Jul 2021 21:02:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210722112824.z5s2fst2q3vrblcr@maple.lan>
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

On 7/22/21 1:28 PM, Daniel Thompson wrote:
> On Wed, Jul 21, 2021 at 08:46:42PM +0200, Marek Vasut wrote:
>> On 7/21/21 6:12 PM, Daniel Thompson wrote:
>>> On Wed, Jul 21, 2021 at 05:09:57PM +0200, Marek Vasut wrote:
>>>> On 7/21/21 12:49 PM, Daniel Thompson wrote:
>>>>>> I'm not sure that's correct, we can simply say that any new uses of the
>>>>>> pwm-backlight should specify the initial GPIO configuration, and for the
>>>>>> legacy ones, use whatever is in the code now.
>>>>>
>>>>> I'm not 100% against the idea... however if we still have to get the
>>>>> code to read state from the hardware right for legacy cases that means
>>>>> we have to do the same work but with fewer people testing it.
>>>>
>>>> We can do something like this:
>>>>
>>>> if (of_property_read_bool(np, "enable-active-high"))
>>>>     gpiod_direction_output(pb->enable_gpio, 1);
>>>> else if (of_property_read_bool(np, "enable-active-low"))
>>>>     gpiod_direction_output(pb->enable_gpio, 0);
>>>> else {
>>>>     WARN_ON_ONCE("Fix your DT"); // or some such notification
>>>>     ... legacy code path ...
>>>> }
>>>>
>>>> Note that I picked the same DT prop names as drivers/gpio/gpiolib-of.c
>>>> of_gpio_flags_quirks() uses, because we are headed into similar mess here
>>>> I'm afraid.
>>>
>>> I don't quite understand what you mean here. We are using gpiolib so
>>> for us there is no concept of active-high or active-low. The only
>>> concept for us is whether enable_gpio is asserted or not.
>>
>> It would look the same -- just substitute in "enable-on-boot" and
>> "disable-on-boot" DT property.
>>
>>> What the DT property would be describing is purely whether the
>>> bootloader left the backlight on or off.
>>
>> Rather, it would simply control what is the default state of the backlight
>> enable GPIO (enabled/disabled).
> 
> What do you mean by default state? The current value of the pin or the
> desired state when the probe completes?

I think that would be the later.

>>> This sails very close to the
>>> edge of what is in-scope for DT (at least it does it we can read
>>> the inherited state directly from the hardware).
>>
>> The problem with reading it out of hardware is that the hardware might be in
>> undefined state and expects Linux to define that state, so that does not
>> always work. Hence my initial suggestion to add a DT property to define the
>> state up front, instead of using these fragile heuristics.
> 
> To achieve a flicker-free boot we must know the initial state of the
> backlight (not just the enable pin).

The backlight hardware might be in uninitialized state and then Linux 
should set the state, likely based on something in DT, because there is 
no previous state to read.

>>> What it also means decisions about the DT bindings are more about
>>> whether, if the backlight is lit up, the bootloader should also disclose
>>> what it thinks it has established as the PWM duty cycle as well.
>>
>> Please also consider the case where bootloader configures total minimum of
>> the hardware to start Linux as soon as possible, i.e. it puts Linux in DRAM
>> and jumps to Linux.
> 
> I think I have been. I understood that preventing a flicker when booting
> with an unconfigured (and off) backlight[1] was the purpose of your patch!
> 
> However that is a relatively easy case when considering flicker-free
> handover from bootloader since we don't have to inherit the duty cycle.
> 
> 
> [1] I guessed that the difference between your platform and the other
>      pwm_bl users is that, for you, an uninitialized PWM looks like a
>      100% duty cycle hence you get a full-brightness flicker when we change
>      the state of the enable_gpio pin before we have established the
>      correct PWM duty cycle. Was I right?

Right, that. In my case the enable GPIO is input (default) with pull 
resistor.

>>> Overall I have fairly grave concerns that this simply moves
>>> fragility into the bootloader rather then reducing it.
>>
>> Wait a minute, I think we disconnected somewhere. I would rather prefer to
>> remove the fragility and bootloader dependency altogether, exactly to avoid
>> depending on the state the bootloader left the hardware in.
> 
> The two fully flicker-free cases we support in pwm_bl are:
> 
> 1. Backlight off after bootloader has completed. Backlight must be
>     off after the probe completes (and never flicker on/off during the
>     probe). This allows the display to put a splash image on the screen
>     before lighting up the backlight (this avoids a flicker if there are
>     a few frames between backlight coming on and the splash image being
>     drawn). Naturally this requires help from the display system (and
>     that the display system is aware of the backlight to be able to start
>     it).
> 
> 2. Backlight on with a splash image after bootloader has completed.
>     Backlight must be on after the probe completes (and never flicker
>     off/on during the probe). This also requires that the display system
>     can take over the frame buffer without a flicker but that is
>     completely independent of backlight.
> 
> There is also a simpler case which is not "flicker-free" since the
> backlight may change level during the boot and may light up before
> there is an image on the screen (although we'd still to minimise
> flicker by ensuring there is only one change of backlight state/level
> during the probe (something your work will see fixed?):

Actually no, my usecase is the backlight is not initialized by the 
bootloader at all, the pins are just strapped to default to the right 
values, the init is left to the kernel to do.

> 3. Backlight is on after the probe completes. This is default if
>     we don't know the display system will activate the backlight.
>     This is an important legacy case since few userspaces know how
>     to change the backlight power-state at boot.
> 
> One oddity here is that #3 *also* needs to know the state of the
> backlight (on/off) to turn the backlight on without flickering
> (so it can figure out how to handle power_pwm_on_delay correctly)
> even though the final state is unconditionally on. That is the main
> reason I proposed an alternative to your patch (since this is
> currently broken).
> 
> The other oddity is that the difference between #1 and #3 is due to
> *software* (which driver ends up responsible for unmuting the display)
> meaning that the bootloader/DT has no business discriminating between
> these two cases.
> 
> Thus pwm_bl.c is based on making #2/#3 (which are similar) the default
> and switching to case #1 if there is a display driver to do the unblank
> (software) *and* that the backlight is currently off (currently read
> from hardware). Note that this is intentionally designed to that
> if the logic does go wrong we should get a small bug (a flicker) rather
> than a big one (a black screen).
> 
> Wow! That is *way* longer than I intended when I started writing it.
> Anyhow I suspect any disconnect comes about due to the difference in
> backlight state *after* probe being, in part, to software structure
> rather than purely a hardware property.

Maybe this should be added to documentation.
