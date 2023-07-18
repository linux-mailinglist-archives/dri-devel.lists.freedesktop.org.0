Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C92AD75839F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 19:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C81910E3B3;
	Tue, 18 Jul 2023 17:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271B110E3B3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 17:37:31 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 232D9866C9;
 Tue, 18 Jul 2023 19:37:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1689701849;
 bh=YEtNzm1euuxnUFtbYvHqJq+s7z6mvIW8puTN8pzlSCg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AQGA58q6DELDWhWDOQRAB6WluERs9eCVS0fvvtXvIdqIb6BnWwLE0snMKT/3NeIiU
 HBKJXVuZ58leqL4niI3Iio5cnJgTDmWHBJ5gn+M5wvcPp0Nmc0vWYvyXxXhMxOVxKb
 CeWDLNow2UCvu5baLrrxhQpgUf4VKSjMrGhsvD095JLUGnCt1B3Pxgm52k5YS+p1sO
 nMJqRUIurTlpZMUzrlsNMaOp2Z0vH0HaDGusSLHlHtMDQQyrHpTrBETufTp7QIsfpK
 cXqiffWjQPZvQjNjd2h3dRibsiCIx7RzTMgGl1sgiXMlQdSAj6MzeivaZy0U4e/Tir
 b+sgeRPKfoKlg==
Message-ID: <34985434-7ee4-d86e-e157-9ad670315315@denx.de>
Date: Tue, 18 Jul 2023 19:37:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/panel: simple: Initialize unprepared_time in probe
To: Doug Anderson <dianders@chromium.org>
References: <20230709135231.449636-1-marex@denx.de>
 <CAD=FV=W9qXNaeQ14h8nmvoP3HKhXT8PbAtGikwR4eaQ+svX+ig@mail.gmail.com>
 <a0f83bf2-b125-9474-4316-9df3b6da5ad8@denx.de>
 <CAD=FV=X1Pt4439OT5xjHcP6+BWbQ7z81_nPB+bOiK3xnYNi_rA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAD=FV=X1Pt4439OT5xjHcP6+BWbQ7z81_nPB+bOiK3xnYNi_rA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/18/23 18:15, Doug Anderson wrote:
> Hi,

Hi,

> On Tue, Jul 18, 2023 at 8:36 AM Marek Vasut <marex@denx.de> wrote:
>>
>> On 7/18/23 16:17, Doug Anderson wrote:
>>> Hi,
>>
>> Hi,
>>
>>> On Sun, Jul 9, 2023 at 6:52 AM Marek Vasut <marex@denx.de> wrote:
>>>>
>>>> The unprepared_time has to be initialized during probe to probe time
>>>> ktime, otherwise panel_simple_resume() panel_simple_wait() call may
>>>> wait too short time, or no time at all, which would violate the panel
>>>> timing specification. Initializing the unprepared_time() to probe time
>>>> ktime assures the delay is at least what the panel requires from the
>>>> time kernel started. The unprepared_time is then updated every time
>>>> the panel is suspended in panel_simple_suspend() too.
>>>>
>>>> Fixes: e5e30dfcf3db ("drm: panel: simple: Defer unprepare delay till next prepare to shorten it")
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>
>>> Can you talk in more detail about the problem you're seeing? Your
>>> patch will likely cause boot speed regressions. While correctness
>>> trumps performance, I'd like to make sure this is right before landing
>>> it.
>>
>> With AUO T215HVN01 panel, connected to LT9211 DSI-to-LVDS bridge,
>> connected to MX8M Mini DSIM , the panel just would not come up correctly
>> because this unprepare_time is not observed. The panel would only show
>> blue stripe on the left side, instead of actual image.
>>
>>> Specifically, I think your patch is nearly the opposite as what I did
>>> in commit 691c1fcda535 ("regulator: core: Shorten off-on-delay-us for
>>> always-on/boot-on by time since booted"). I think many of the same
>>> arguments I made in that commit message argue against your patch.
>>
>> You cannot guarantee in which state the panel is after boot/reboot,
> 
> Agreed. To the best extent possible, whatever solution we arrive at
> should work regardless of how the bootloader left things.
> 
> 
>> so
>> I believe the kernel has to shut it down, and then bring it up, with the
>> correct timings.
> 
> If that's required for your panel then the driver should do what it
> needs to do to ensure this.

The panel-simple driver used to do it. Now it no longer does, which 
means the kernel is now running this AUO and possibly other panels out 
of specification.

> As indicated by my other comments, I
> actually don't think your patch currently does in all cases. If the
> panel is powered by a PMIC and the bootloader left the power on, your
> patch series _won't_ shut it down and bring it back up, will it?

That depends on the regulator configuration. That itself is a separate 
issue however, one which has been present even before any of this boot 
time optimization attempt.

> In any case, if your panel requires extra delays, it would be ideal if
> this didn't inflict a penalty on all panels. I haven't personally
> worked on any panels currently serviced by panel-simple, but for most
> eDP panels the only strong timing requirement is that once you turn
> off the main power rail that you don't turn it on again for ~500ms.

The extra delay is actually only inflicted on panels which do set delay 
{ .unprepare = ... } constraint in their timing specification, and those 
panels most certainly do need those extra delays to operate correctly.

> For most panels it's OK to turn it on early (like as soon as the
> regulator proves) and also OK if the main power rail stays on between
> the bootloader and the kernel.

I would debate the "most" part, as that is not my experience with DPI 
and LVDS panels, which, if they are not correctly power sequenced, can 
go all kinds of weird and that weirdness is often very subtle. Or worse, 
those panels start failing in deployment.

> For eDP the one exception I've seen was
> the "samsung-atna33xc20" panel and that panel has its own driver
> specifically to deal with quirks like this. I talk about this a little
> bit in commit 23ff866987de ("arm64: dts: qcom: sc7180: Start the
> trogdor eDP/touchscreen regulator on") since homestar uses
> "samsung-atna33xc20"

I seldom work with eDP panels, so I cannot comment on that part.

It is well possible the more complex electronics of the panel hides a 
lot of the power sequencing details, I wouldn't be surprised by that.

>>> ...however, I guess in the case of the panel, things could be
>>> different because regulators aren't directly controlled by the panel
>>> code. Thus, I could imagine that your situation is this:
>>>
>>> 1. Bootloader runs and leaves the panel powered on.
>>
>> Bootloader does not touch the panel at all.
> 
> Huh, then I'm pretty confused. Where is the timing violation then? If
> the panel was off when the device started booting and the bootloader
> didn't touch the panel, then the existing code should work fine. The
> current code will make sure that we delay at least "unprepare" ms
> since the kernel booted and so no specs should be violated.
> 
> Are you sure you aren't running into something like a case of
> -EPROBE_DEFER where panel-simple powers the regulator on, then
> un-probes, and then tries probing again? ...or maybe the default state
> of the regulator at bootup _is_ powered on and that's the problem?

Have a look at panel_simple_resume() panel_simple_wait(), this is where 
the extra delay is needed. You cannot predict how long the bootloader 
took to reach the kernel time t=0 and you cannot know what happened 
before the bootloader started (maybe abrupt sysrq reset), not on all 
platforms anyway, so the best you can do is assume the worst, i.e. full 
unprepare delay.

> In
> either case, it feels like the regulator "off-on-delay" constraint
> might be better here.

Please stop suggesting that we should work around the existing defect of 
this driver, which does not correctly honor the .delay.unprepare time of 
a panel and causes actual failures on existing panels, instead of fixing 
it properly, only because this impedes boot time. Sure, it does, but 
correctly bringing up the panel is more important than reducing boot 
time at all costs, because if I only see blue stripe on the left side of 
the panel, I do not care if the kernel booted 100ms faster, I care about 
the non-working panel .

This could be a good optimization, but it certainly is not a fix for the 
issue at hand.

>>> 2. Linux boots. Time starts at 0.
>>>
>>> 3. Simple fixed regulator (GPIO-based) probes and doesn't know GPIO
>>> state of regulator, so turns it off. We'll call this time "a"
>>>
>>> 4. Panel probes at time "b" and tries to turn the panel on.
>>>
>>> With the existing code, when we try to turn the panel code on for the
>>> first time we'll wait "min(unprepared_time, b)". In other words, if
>>> the panel's probe was called so early at boot that it was shorter than
>>> unprepared_time then we'd delay. Otherwise we wouldn't. In the case
>>> described above, this is obviously a violation.
>>>
>>> The more correct delay would be to wait "min(unprepared_time, b-a)".
>>> In other words, make sure the regulator is off for a certain amount of
>>> time.
>>>
>>> Your patch would make us always wait "unprepared_time", which is still
>>> correct but less performant.
>>>
>>> Did I describe your situation correctly?
>>
>> Partly.
>>
>> I believe the better approach would be to fix this such that we do not
>> operate panels out of specification right now, since panel vendors are
>> very sensitive about that, and any sort of optimization is a topic for
>> separate patch.
>>
>> But please do keep in mind that depending on the state of the system in
>> which bootloader left it is likely a bad idea.
> 
> Right that we want to match the panel spec and right that we should
> work regardless of if the bootloader left the panel off or left it on.
> If you look at my commit message in commit 691c1fcda535 ("regulator:
> core: Shorten off-on-delay-us for always-on/boot-on by time since
> booted") you can see that I made sure to consider both situations.

This all talks about 'off-on-delay-us' DT property, I don't like how 
this is being posed as an alternative, because it does not really fix 
the problem with this driver now failing to respect the .delay.unprepare 
delay in panel description .

>>> If so, then IMO a more
>>> correct fix than this is actually:
>>>
>>> a) Don't rely on the panel code to enforce your regulator constraints.
>>> It's OK for the panel code to have this logic as a failsafe, but it's
>>> actually better to specify "off-on-delay-us" for the regulator itself.
>>> This means that the regulator framework can handle things correctly.
>>> It'll work better for deferred probes and shared regulator rails,
>>> among other things. Note that "off-on-delay-us" is currently only
>>> implemented for fixed regulators, but IMO it would be an easy sell to
>>> make it generic.
>>>
>>> b) Assuming your panel is OK with it, consider using
>>> "regulator-boot-on" to optimize your boot speed.
>>
>> This is dangerous, since the panel has power sequencing requirements
>> which must be observed, i.e. which supplies get flipped on in specific
>> order with various delays between each step. That very much rules out
>> any such regulator-boot-on shenanigans.
> 
> Right. This is why I said for b) "assuming your panel is OK with it"
> and "consider using". :-) Most eDP panels can handle this. If your
> panel can't, then the correct solution is a) without b).

Please see above, I really don't think that 'off-on-delay-us' is 
relevant to fixing this issue. It is a nice optimization, but it is 
separate topic.
