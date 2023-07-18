Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B18E3757F42
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 16:18:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C284810E038;
	Tue, 18 Jul 2023 14:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E95810E038
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 14:17:58 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-316f4abb1e1so3130244f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 07:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689689877; x=1692281877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2W4dR24c19kAt25OyB0L8k3CKwN6UFOw7qkV51KbPMA=;
 b=WVycvojzcZ29Ys/wipEl9MK66kgsq0aiRlRs3wJzFOz0tblqQwhh1w/VKr7jZksnL2
 Kzu1UwZGd5YrkBSJV/fC73Ve+NztJXQuoD4HToIbO64pJqXJgw62gOsjczwMJulVb910
 5vL0cnWIX5D79jcAS+AQjg2nUEBPjA3dTivB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689689877; x=1692281877;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2W4dR24c19kAt25OyB0L8k3CKwN6UFOw7qkV51KbPMA=;
 b=i/+1i1+QLLyeRCIOx4ksjwe0cXftimmqsgg/f4Kcm3q5RzCDa6KPHcrG65KiLSdjb+
 GrEELJK5paxxUlc03K98Q6YlaFK4N7v/ZVFQeJ8HI8ucPGdiYFSQgiOa8jf/4VgAvmYF
 iFC3IKc9/knDdqxQ03owElyPdHxuP8slNkbLO5bSkFFThfe3sXGvOTtTDNALx480SAqX
 0dIgHDJzdVx6nQO9VsXYH7lnJ2ccMcTcc7l8l3RdSaRuHIsUwD13VCQ56YGeL8vmRg6r
 DSRYDc8uO7+Hng8k4MoUcv06/c6/WSt2yOiEEmtHUU6kaOY6b8posz7xOD6c4CZOP3wB
 jsDA==
X-Gm-Message-State: ABy/qLZuPiSnuNLq/C4h1wBJwrKh7IkzFaLvTCrKOBfEDXO5pXKSMzuh
 LMKJbK1V1r25r1NiUH+1tvEvm2mrcLXTAcQqLiKfkugG
X-Google-Smtp-Source: APBJJlFUdEZ4G6EqsU3gtyQOrY0EU4k69tC2LzBAc8gDeSGD3n8UdblncEB4txo4q74ubBM9YXmSNg==
X-Received: by 2002:adf:f386:0:b0:314:77a:c2b2 with SMTP id
 m6-20020adff386000000b00314077ac2b2mr12963350wro.32.1689689876567; 
 Tue, 18 Jul 2023 07:17:56 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com.
 [209.85.208.51]) by smtp.gmail.com with ESMTPSA id
 pw6-20020a17090720a600b00989257be620sm1056981ejb.200.2023.07.18.07.17.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 07:17:56 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-516500163b2so10282a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 07:17:55 -0700 (PDT)
X-Received: by 2002:a50:a6c6:0:b0:514:92e4:ab9f with SMTP id
 f6-20020a50a6c6000000b0051492e4ab9fmr92247edc.7.1689689875566; Tue, 18 Jul
 2023 07:17:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230709135231.449636-1-marex@denx.de>
In-Reply-To: <20230709135231.449636-1-marex@denx.de>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 18 Jul 2023 07:17:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W9qXNaeQ14h8nmvoP3HKhXT8PbAtGikwR4eaQ+svX+ig@mail.gmail.com>
Message-ID: <CAD=FV=W9qXNaeQ14h8nmvoP3HKhXT8PbAtGikwR4eaQ+svX+ig@mail.gmail.com>
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

On Sun, Jul 9, 2023 at 6:52=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> The unprepared_time has to be initialized during probe to probe time
> ktime, otherwise panel_simple_resume() panel_simple_wait() call may
> wait too short time, or no time at all, which would violate the panel
> timing specification. Initializing the unprepared_time() to probe time
> ktime assures the delay is at least what the panel requires from the
> time kernel started. The unprepared_time is then updated every time
> the panel is suspended in panel_simple_suspend() too.
>
> Fixes: e5e30dfcf3db ("drm: panel: simple: Defer unprepare delay till next=
 prepare to shorten it")
> Signed-off-by: Marek Vasut <marex@denx.de>

Can you talk in more detail about the problem you're seeing? Your
patch will likely cause boot speed regressions. While correctness
trumps performance, I'd like to make sure this is right before landing
it.

Specifically, I think your patch is nearly the opposite as what I did
in commit 691c1fcda535 ("regulator: core: Shorten off-on-delay-us for
always-on/boot-on by time since booted"). I think many of the same
arguments I made in that commit message argue against your patch.

...however, I guess in the case of the panel, things could be
different because regulators aren't directly controlled by the panel
code. Thus, I could imagine that your situation is this:

1. Bootloader runs and leaves the panel powered on.

2. Linux boots. Time starts at 0.

3. Simple fixed regulator (GPIO-based) probes and doesn't know GPIO
state of regulator, so turns it off. We'll call this time "a"

4. Panel probes at time "b" and tries to turn the panel on.

With the existing code, when we try to turn the panel code on for the
first time we'll wait "min(unprepared_time, b)". In other words, if
the panel's probe was called so early at boot that it was shorter than
unprepared_time then we'd delay. Otherwise we wouldn't. In the case
described above, this is obviously a violation.

The more correct delay would be to wait "min(unprepared_time, b-a)".
In other words, make sure the regulator is off for a certain amount of
time.

Your patch would make us always wait "unprepared_time", which is still
correct but less performant.

Did I describe your situation correctly? If so, then IMO a more
correct fix than this is actually:

a) Don't rely on the panel code to enforce your regulator constraints.
It's OK for the panel code to have this logic as a failsafe, but it's
actually better to specify "off-on-delay-us" for the regulator itself.
This means that the regulator framework can handle things correctly.
It'll work better for deferred probes and shared regulator rails,
among other things. Note that "off-on-delay-us" is currently only
implemented for fixed regulators, but IMO it would be an easy sell to
make it generic.

b) Assuming your panel is OK with it, consider using
"regulator-boot-on" to optimize your boot speed.

...one further note is that, I believe, not all regulator drivers will
force regulators off at probe time. If your regulator is backed by a
PMIC instead of a simple fixed regulator and the bootloader left the
regulator on then I believe you could end up with a situation very
similar to the "regulator-boot-on" case.

-Doug
