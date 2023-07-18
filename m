Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3AF7581DC
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 18:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F252B10E378;
	Tue, 18 Jul 2023 16:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99CCE10E378
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 16:15:43 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-99454855de1so531870566b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 09:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689696940; x=1692288940;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FOXZEpDZYjSWcSferKuM1HRBfRkbjqCewmtI665IoDA=;
 b=BrsQy6y+liQKCOYCUw7ZxksxKj3UomMphkuYR25Q9N7o6uNZw6Jjm5LY+obYEVLFJy
 XKvpRiwnpw95N3d24Gjf6oG9CtTqXodbW61TLlgsHGaaAUvUMeHs1e72lNo+9Bxbvuoy
 9AM64zY+3YwJaeGJIn07Dnw46PX9yCGcSboB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689696940; x=1692288940;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FOXZEpDZYjSWcSferKuM1HRBfRkbjqCewmtI665IoDA=;
 b=SH/FGfAxzJ96d6yqn3CaIEOX8dHgkO9L9gXCWEjRdqfIl1QYY5YHVB/Yymdd6mQx8k
 BoajKVuXnMgO6zGvD1Ekw2rwccxx/E2yS+3JDcQd226cvq/iGzmyk+5HUhjdY3EaHe7I
 vg9AHEjf48+dTmBsagy8OoLf5aTABbkTCO2SqwNNIZDL6inTXEAlNKrYG0ddtu6Fianu
 jedI2B8l3vCDtW9KroR4bOZnFVKoJHuXspJNMAt5mb2x8ZMtx79T7Z/jVIj7sJAsQtn0
 79P0dtq0vkuekkmD+4kUVEbpqwzVUJj8pWWkhG5KVdeKPt37+L3+PtdNMY3s+Nz4X3Du
 yZYQ==
X-Gm-Message-State: ABy/qLYDrsQztO4mm3SQ36fb2+7kVz7ci+S/oNAkvl2hPnWkGPaRLUwN
 ZoYq5eWVoKzMaQoa8IQeZlBgi19iHpmmMgwbIJjwaC9q
X-Google-Smtp-Source: APBJJlHnSp8RHzIC8EEqRZPXE+xfAuQkB5yDcqev2x4MDMTBkygUasfAc1w5QfY04gVC2QIH5dLSFg==
X-Received: by 2002:a17:907:3f22:b0:95e:d3f5:3d47 with SMTP id
 hq34-20020a1709073f2200b0095ed3f53d47mr334423ejc.48.1689696940107; 
 Tue, 18 Jul 2023 09:15:40 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com.
 [209.85.208.53]) by smtp.gmail.com with ESMTPSA id
 x13-20020a1709064a8d00b009883a3edcfcsm1205242eju.171.2023.07.18.09.15.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 09:15:40 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-516500163b2so12608a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 09:15:39 -0700 (PDT)
X-Received: by 2002:a50:c242:0:b0:50b:c48c:8a25 with SMTP id
 t2-20020a50c242000000b0050bc48c8a25mr142797edf.6.1689696939166; Tue, 18 Jul
 2023 09:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230709135231.449636-1-marex@denx.de>
 <CAD=FV=W9qXNaeQ14h8nmvoP3HKhXT8PbAtGikwR4eaQ+svX+ig@mail.gmail.com>
 <a0f83bf2-b125-9474-4316-9df3b6da5ad8@denx.de>
In-Reply-To: <a0f83bf2-b125-9474-4316-9df3b6da5ad8@denx.de>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 18 Jul 2023 09:15:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X1Pt4439OT5xjHcP6+BWbQ7z81_nPB+bOiK3xnYNi_rA@mail.gmail.com>
Message-ID: <CAD=FV=X1Pt4439OT5xjHcP6+BWbQ7z81_nPB+bOiK3xnYNi_rA@mail.gmail.com>
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

On Tue, Jul 18, 2023 at 8:36=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> On 7/18/23 16:17, Doug Anderson wrote:
> > Hi,
>
> Hi,
>
> > On Sun, Jul 9, 2023 at 6:52=E2=80=AFAM Marek Vasut <marex@denx.de> wrot=
e:
> >>
> >> The unprepared_time has to be initialized during probe to probe time
> >> ktime, otherwise panel_simple_resume() panel_simple_wait() call may
> >> wait too short time, or no time at all, which would violate the panel
> >> timing specification. Initializing the unprepared_time() to probe time
> >> ktime assures the delay is at least what the panel requires from the
> >> time kernel started. The unprepared_time is then updated every time
> >> the panel is suspended in panel_simple_suspend() too.
> >>
> >> Fixes: e5e30dfcf3db ("drm: panel: simple: Defer unprepare delay till n=
ext prepare to shorten it")
> >> Signed-off-by: Marek Vasut <marex@denx.de>
> >
> > Can you talk in more detail about the problem you're seeing? Your
> > patch will likely cause boot speed regressions. While correctness
> > trumps performance, I'd like to make sure this is right before landing
> > it.
>
> With AUO T215HVN01 panel, connected to LT9211 DSI-to-LVDS bridge,
> connected to MX8M Mini DSIM , the panel just would not come up correctly
> because this unprepare_time is not observed. The panel would only show
> blue stripe on the left side, instead of actual image.
>
> > Specifically, I think your patch is nearly the opposite as what I did
> > in commit 691c1fcda535 ("regulator: core: Shorten off-on-delay-us for
> > always-on/boot-on by time since booted"). I think many of the same
> > arguments I made in that commit message argue against your patch.
>
> You cannot guarantee in which state the panel is after boot/reboot,

Agreed. To the best extent possible, whatever solution we arrive at
should work regardless of how the bootloader left things.


> so
> I believe the kernel has to shut it down, and then bring it up, with the
> correct timings.

If that's required for your panel then the driver should do what it
needs to do to ensure this. As indicated by my other comments, I
actually don't think your patch currently does in all cases. If the
panel is powered by a PMIC and the bootloader left the power on, your
patch series _won't_ shut it down and bring it back up, will it?

In any case, if your panel requires extra delays, it would be ideal if
this didn't inflict a penalty on all panels. I haven't personally
worked on any panels currently serviced by panel-simple, but for most
eDP panels the only strong timing requirement is that once you turn
off the main power rail that you don't turn it on again for ~500ms.
For most panels it's OK to turn it on early (like as soon as the
regulator proves) and also OK if the main power rail stays on between
the bootloader and the kernel. For eDP the one exception I've seen was
the "samsung-atna33xc20" panel and that panel has its own driver
specifically to deal with quirks like this. I talk about this a little
bit in commit 23ff866987de ("arm64: dts: qcom: sc7180: Start the
trogdor eDP/touchscreen regulator on") since homestar uses
"samsung-atna33xc20"


> > ...however, I guess in the case of the panel, things could be
> > different because regulators aren't directly controlled by the panel
> > code. Thus, I could imagine that your situation is this:
> >
> > 1. Bootloader runs and leaves the panel powered on.
>
> Bootloader does not touch the panel at all.

Huh, then I'm pretty confused. Where is the timing violation then? If
the panel was off when the device started booting and the bootloader
didn't touch the panel, then the existing code should work fine. The
current code will make sure that we delay at least "unprepare" ms
since the kernel booted and so no specs should be violated.

Are you sure you aren't running into something like a case of
-EPROBE_DEFER where panel-simple powers the regulator on, then
un-probes, and then tries probing again? ...or maybe the default state
of the regulator at bootup _is_ powered on and that's the problem? In
either case, it feels like the regulator "off-on-delay" constraint
might be better here.


> > 2. Linux boots. Time starts at 0.
> >
> > 3. Simple fixed regulator (GPIO-based) probes and doesn't know GPIO
> > state of regulator, so turns it off. We'll call this time "a"
> >
> > 4. Panel probes at time "b" and tries to turn the panel on.
> >
> > With the existing code, when we try to turn the panel code on for the
> > first time we'll wait "min(unprepared_time, b)". In other words, if
> > the panel's probe was called so early at boot that it was shorter than
> > unprepared_time then we'd delay. Otherwise we wouldn't. In the case
> > described above, this is obviously a violation.
> >
> > The more correct delay would be to wait "min(unprepared_time, b-a)".
> > In other words, make sure the regulator is off for a certain amount of
> > time.
> >
> > Your patch would make us always wait "unprepared_time", which is still
> > correct but less performant.
> >
> > Did I describe your situation correctly?
>
> Partly.
>
> I believe the better approach would be to fix this such that we do not
> operate panels out of specification right now, since panel vendors are
> very sensitive about that, and any sort of optimization is a topic for
> separate patch.
>
> But please do keep in mind that depending on the state of the system in
> which bootloader left it is likely a bad idea.

Right that we want to match the panel spec and right that we should
work regardless of if the bootloader left the panel off or left it on.
If you look at my commit message in commit 691c1fcda535 ("regulator:
core: Shorten off-on-delay-us for always-on/boot-on by time since
booted") you can see that I made sure to consider both situations.


> > If so, then IMO a more
> > correct fix than this is actually:
> >
> > a) Don't rely on the panel code to enforce your regulator constraints.
> > It's OK for the panel code to have this logic as a failsafe, but it's
> > actually better to specify "off-on-delay-us" for the regulator itself.
> > This means that the regulator framework can handle things correctly.
> > It'll work better for deferred probes and shared regulator rails,
> > among other things. Note that "off-on-delay-us" is currently only
> > implemented for fixed regulators, but IMO it would be an easy sell to
> > make it generic.
> >
> > b) Assuming your panel is OK with it, consider using
> > "regulator-boot-on" to optimize your boot speed.
>
> This is dangerous, since the panel has power sequencing requirements
> which must be observed, i.e. which supplies get flipped on in specific
> order with various delays between each step. That very much rules out
> any such regulator-boot-on shenanigans.

Right. This is why I said for b) "assuming your panel is OK with it"
and "consider using". :-) Most eDP panels can handle this. If your
panel can't, then the correct solution is a) without b).
