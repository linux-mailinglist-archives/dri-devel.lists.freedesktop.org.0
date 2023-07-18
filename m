Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA601758597
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 21:33:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCCA210E3B5;
	Tue, 18 Jul 2023 19:33:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4ED10E3B5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 19:33:32 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fc0aecf15bso60963935e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 12:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689708808; x=1692300808;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=38orYIBQRQR8eQ2IRwN3rZCYhPmOPp7tNUUytr2CK9U=;
 b=CbI0HTV4iXRcyzSSjVgpoXuehjNNBuoDFvj5itMixvIRF0LtVpEsrIG9HTiX6icaVj
 CQ39H4JXQ7sOcpFS+QZDW/zotLGlM5OfzDn7P+hdk30h+LQUHyNrBK6IWX8ZyIFeuIpQ
 3se0rg9N+ldqIUjzqraSB/udeewfsrSUXuHH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689708808; x=1692300808;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=38orYIBQRQR8eQ2IRwN3rZCYhPmOPp7tNUUytr2CK9U=;
 b=BHRKMWFxgUIA+2erxU7Wd9LBnscGE1815MMopSbCULODq76j/SYnk7DFWEYTu/T0lO
 vPA50uUuGGbJxGIMXbmFPu8C4PLT8zzJxwFdM2zjvtQcwwACkKeQIXhKxBlrnH71atcN
 sW0xSn9ynRIeioXg7eJQdpnXuwATif/O6+p1Z6G39RI+z/gYfFtRhZaBOrhPvehsz4N3
 a2OgBbaL2217PZuJAYV7nonIL/HVZcf0fY0mptTx6vc/uqK6FcWthYCTiqeZEPWnhmcr
 n4WUTjcS4GmnTIGH56sqEW7Bq64CH1tDsL2/7frmvShlf2om7uCgBIGZSw2BFQ/wP5Re
 edhg==
X-Gm-Message-State: ABy/qLazMw6cvjxtE8WDhkEAt5wAbRZcjO4xnvhFwta6mHaTpAPaz9vM
 vkVQoMcri2hyRAn0io9Fn1OaW/WCJMmBtO8Jx4IF5F1s
X-Google-Smtp-Source: APBJJlHqOMa36ZtNhtpJF/TNwgISlfypfLiqPS/utWn2swBW3BCePbj42ksDZSs6Jury6ZAohx8j9Q==
X-Received: by 2002:adf:fb4a:0:b0:306:2e62:8d2e with SMTP id
 c10-20020adffb4a000000b003062e628d2emr466953wrs.1.1689708808158; 
 Tue, 18 Jul 2023 12:33:28 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 d23-20020a50fb17000000b0051de1a0af8fsm1622620edq.35.2023.07.18.12.33.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 12:33:27 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-51e24210395so18713a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 12:33:26 -0700 (PDT)
X-Received: by 2002:a50:bae1:0:b0:51e:5e41:a0b2 with SMTP id
 x88-20020a50bae1000000b0051e5e41a0b2mr189780ede.2.1689708806195; Tue, 18 Jul
 2023 12:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230709135231.449636-1-marex@denx.de>
 <CAD=FV=W9qXNaeQ14h8nmvoP3HKhXT8PbAtGikwR4eaQ+svX+ig@mail.gmail.com>
 <a0f83bf2-b125-9474-4316-9df3b6da5ad8@denx.de>
 <CAD=FV=X1Pt4439OT5xjHcP6+BWbQ7z81_nPB+bOiK3xnYNi_rA@mail.gmail.com>
 <34985434-7ee4-d86e-e157-9ad670315315@denx.de>
In-Reply-To: <34985434-7ee4-d86e-e157-9ad670315315@denx.de>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 18 Jul 2023 12:33:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XAk423Z34ebiooHO874GmUf5BgssyQm4_HieCGhs7E_A@mail.gmail.com>
Message-ID: <CAD=FV=XAk423Z34ebiooHO874GmUf5BgssyQm4_HieCGhs7E_A@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: simple: Initialize unprepared_time in probe
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Tue, Jul 18, 2023 at 10:37=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> On 7/18/23 18:15, Doug Anderson wrote:
> > Hi,
>
> Hi,
>
> > On Tue, Jul 18, 2023 at 8:36=E2=80=AFAM Marek Vasut <marex@denx.de> wro=
te:
> >>
> >> On 7/18/23 16:17, Doug Anderson wrote:
> >>> Hi,
> >>
> >> Hi,
> >>
> >>> On Sun, Jul 9, 2023 at 6:52=E2=80=AFAM Marek Vasut <marex@denx.de> wr=
ote:
> >>>>
> >>>> The unprepared_time has to be initialized during probe to probe time
> >>>> ktime, otherwise panel_simple_resume() panel_simple_wait() call may
> >>>> wait too short time, or no time at all, which would violate the pane=
l
> >>>> timing specification. Initializing the unprepared_time() to probe ti=
me
> >>>> ktime assures the delay is at least what the panel requires from the
> >>>> time kernel started. The unprepared_time is then updated every time
> >>>> the panel is suspended in panel_simple_suspend() too.
> >>>>
> >>>> Fixes: e5e30dfcf3db ("drm: panel: simple: Defer unprepare delay till=
 next prepare to shorten it")
> >>>> Signed-off-by: Marek Vasut <marex@denx.de>
> >>>
> >>> Can you talk in more detail about the problem you're seeing? Your
> >>> patch will likely cause boot speed regressions. While correctness
> >>> trumps performance, I'd like to make sure this is right before landin=
g
> >>> it.
> >>
> >> With AUO T215HVN01 panel, connected to LT9211 DSI-to-LVDS bridge,
> >> connected to MX8M Mini DSIM , the panel just would not come up correct=
ly
> >> because this unprepare_time is not observed. The panel would only show
> >> blue stripe on the left side, instead of actual image.
> >>
> >>> Specifically, I think your patch is nearly the opposite as what I did
> >>> in commit 691c1fcda535 ("regulator: core: Shorten off-on-delay-us for
> >>> always-on/boot-on by time since booted"). I think many of the same
> >>> arguments I made in that commit message argue against your patch.
> >>
> >> You cannot guarantee in which state the panel is after boot/reboot,
> >
> > Agreed. To the best extent possible, whatever solution we arrive at
> > should work regardless of how the bootloader left things.
> >
> >
> >> so
> >> I believe the kernel has to shut it down, and then bring it up, with t=
he
> >> correct timings.
> >
> > If that's required for your panel then the driver should do what it
> > needs to do to ensure this.
>
> The panel-simple driver used to do it. Now it no longer does, which
> means the kernel is now running this AUO and possibly other panels out
> of specification.

OK, I think the more I read this thread the more confused I get. :(
Hopefully we can arrive at some clarity.

1. I guess first off, nothing about the old kernel would have ensured
that the regulator would have been shut off. Looking at the old code
(before e5e30dfcf3db, the commit yous "Fixes") the panel-simple driver
just did:

regulator_get()
regulator_enable()

If the regulator was left on by the bootloader and managed by a
regulator driver that can read back initial regulator states then the
old driver would have done nothing at all to guarantee that a
regulator went off. If you want some proof of this, it's even
documented in `Documentation/power/regulator/consumer.rst`:

NOTE:
  The supply may already be enabled before regulator_enabled() is called.
  This may happen if the consumer shares the regulator or the regulator has=
 been
  previously enabled by bootloader or kernel board initialization code.

If you really need to make sure that your regulator was disabled at
boot, you could probably do something like this psuedocode:

supply =3D regulator_get(...)
if (regulator_is_enabled(supply)) {
  /* Enable and disable and that should sync it up */
  regulator_enable(supply);
  regulator_disable(supply);
  if (regulator_is_enabled(supply)) {
    pr_err("Crud, we couldn't disable\n");
    return -E_LIFESUCKS;
  }
}


2. Looking more closely at the commit you're fixing, though, I'm even
more confused.

I _think_ your assertion here is that the longer delay is needed on
the first power on of the panel at bootup. Is that correct? This is
why you need to initialize "unprepared_time" in the probe() function.
However, when I go back to the old code (before e5e30dfcf3db, the
commit yours "Fixes") you can actually see that there was no delay at
all before the first power on of the panel. The only delay was if you
turned the panel off and then turned it back on again. ...so the only
thing that the commit should have broken would have been the power-ons
of the panel _after_ the first. ...but your patch only affects the
delay for the first power on.

Huh?


> > As indicated by my other comments, I
> > actually don't think your patch currently does in all cases. If the
> > panel is powered by a PMIC and the bootloader left the power on, your
> > patch series _won't_ shut it down and bring it back up, will it?
>
> That depends on the regulator configuration. That itself is a separate
> issue however, one which has been present even before any of this boot
> time optimization attempt.
>
> > In any case, if your panel requires extra delays, it would be ideal if
> > this didn't inflict a penalty on all panels. I haven't personally
> > worked on any panels currently serviced by panel-simple, but for most
> > eDP panels the only strong timing requirement is that once you turn
> > off the main power rail that you don't turn it on again for ~500ms.
>
> The extra delay is actually only inflicted on panels which do set delay
> { .unprepare =3D ... } constraint in their timing specification, and thos=
e
> panels most certainly do need those extra delays to operate correctly.
>
> > For most panels it's OK to turn it on early (like as soon as the
> > regulator proves) and also OK if the main power rail stays on between
> > the bootloader and the kernel.
>
> I would debate the "most" part, as that is not my experience with DPI
> and LVDS panels, which, if they are not correctly power sequenced, can
> go all kinds of weird and that weirdness is often very subtle. Or worse,
> those panels start failing in deployment.
>
> > For eDP the one exception I've seen was
> > the "samsung-atna33xc20" panel and that panel has its own driver
> > specifically to deal with quirks like this. I talk about this a little
> > bit in commit 23ff866987de ("arm64: dts: qcom: sc7180: Start the
> > trogdor eDP/touchscreen regulator on") since homestar uses
> > "samsung-atna33xc20"
>
> I seldom work with eDP panels, so I cannot comment on that part.
>
> It is well possible the more complex electronics of the panel hides a
> lot of the power sequencing details, I wouldn't be surprised by that.
>
> >>> ...however, I guess in the case of the panel, things could be
> >>> different because regulators aren't directly controlled by the panel
> >>> code. Thus, I could imagine that your situation is this:
> >>>
> >>> 1. Bootloader runs and leaves the panel powered on.
> >>
> >> Bootloader does not touch the panel at all.
> >
> > Huh, then I'm pretty confused. Where is the timing violation then? If
> > the panel was off when the device started booting and the bootloader
> > didn't touch the panel, then the existing code should work fine. The
> > current code will make sure that we delay at least "unprepare" ms
> > since the kernel booted and so no specs should be violated.
> >
> > Are you sure you aren't running into something like a case of
> > -EPROBE_DEFER where panel-simple powers the regulator on, then
> > un-probes, and then tries probing again? ...or maybe the default state
> > of the regulator at bootup _is_ powered on and that's the problem?
>
> Have a look at panel_simple_resume() panel_simple_wait(), this is where
> the extra delay is needed. You cannot predict how long the bootloader
> took to reach the kernel time t=3D0 and you cannot know what happened
> before the bootloader started (maybe abrupt sysrq reset), not on all
> platforms anyway, so the best you can do is assume the worst, i.e. full
> unprepare delay.

I feel like there is a confusion here. With the old code,
"unprepared_time" was implicitly set to 0 (because the whole structure
was zero initialized). 0 is actually a valid time and represents the
time that the kernel booted (well, more correctly when ktime finished
initting, but that's pretty early).

Let's look at a few concerte cases. In this example I'll go with what
I think you've said is happening in your system: the bootloader
doesn't touch the panel and the panels power rails are off at bootup.


Case 1: everything boots absurdly fast and "unprepared_time" is 1000 ms.

1. CPU resets and starts executing the bootloader. Panel is fully powered o=
ff.

2. Let's imagine the bootloader finishes in an absurdly fast 10 ms and
starts Linux.

3. Linux starts and inits its clock. It does this in 10 ms. Kernel
time is 0 now and it's been 20 ms since CPU reset.

4. Linux gets to panel init code after another 10 ms. Kernel time is
10 ms and it's been 20 ms since CPU reset.

5. We try to turn the panel on after another 10 ms. Kernel time is 20
ms and it's been 30 ms since CPU reset.

6. We look at kernel time (30 ms) and the unprepare delay (1000 ms)
and we'll delay 970 ms.

7. After the delay, kernel time will be 1000 ms and it will have been
1010 ms since CPU reset.

...so if the panel was truly untouched by the bootloader and the
panel's power truly initted to off at bootup then we should be fine
since it's been at least 1010 ms since the panel was powered off.


Case 2: everything boots absurdly slowly and "unprepared_time" is 1000 ms.

1. CPU resets and starts executing the bootloader. Panel is fully powered o=
ff.

2. Let's imagine the bootloader finishes in an absurdly slow 2000 ms
and starts Linux.

3. Linux starts and inits its clock. It does this in 2000 ms. Kernel
time is 0 now and it's been 4000 ms since CPU reset.

4. Linux gets to panel init code after another 2000 ms. Kernel time is
2000 ms and it's been 6000 ms since CPU reset.

5. We try to turn the panel on after another 2000 ms. Kernel time is
4000 ms and it's been 8000 ms since CPU reset.

6. We look at kernel time (4000 ms) and the unprepare delay (1000 ms)
and we'll delay 0 ms (no delay)

...so if the panel was truly untouched by the bootloader and the
panel's power truly initted to off at bootup then we should be fine
since it's been at least 8000 ms since the panel was powered off.


Since the existing code should be correctly honoring the delay in both
of the two cases, I'd like to find out what assumption is wrong.

> > In
> > either case, it feels like the regulator "off-on-delay" constraint
> > might be better here.
>
> Please stop suggesting that we should work around the existing defect of
> this driver, which does not correctly honor the .delay.unprepare time of
> a panel and causes actual failures on existing panels, instead of fixing
> it properly, only because this impedes boot time. Sure, it does, but
> correctly bringing up the panel is more important than reducing boot
> time at all costs, because if I only see blue stripe on the left side of
> the panel, I do not care if the kernel booted 100ms faster, I care about
> the non-working panel .
>
> This could be a good optimization, but it certainly is not a fix for the
> issue at hand.

There are simply too many things about the problem that don't add up.
The reason I keep pushing the off-on-delay is that it has more to do
with the root cause of the problem here.

-Doug
