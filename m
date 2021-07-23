Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDB83D3870
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 12:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F8716EA1E;
	Fri, 23 Jul 2021 10:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A876EA1E
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 10:15:15 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id t17so1802791wrq.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 03:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gWZLVkLeqiIzTgA1yTsmCWAmxaZF0chvlAf5OlNj5WI=;
 b=jaig5EExjQqcy0uRokhpYHMvvQot+nxu8Vl063VaZqXGNRrhdmKp1KItQIKBiHGWyK
 6BcN2tpmGnEOjSzvQl9n97yU4VN02QTK4L7LiFH7ByBGZR4nWvspQfK9kWyGyztELTGE
 jCi6pvqzc6HbeLqBsrINyU/XvE7onV7odohZtH4fI9Cw094483S0LN6IaLS9fuAYYjvE
 WPwdQ/yV5XlyTUrzsSMYQjyi5GSc1M/St8KMKTpJZX0CWs/7Ixpmkscpa6t4qV4CBl0c
 QCplYxWZcaP7B0yX5H/a7eQn6m1Wz/x0n9s4iseIz1u2T2u+lxXAxRA6qwin7B+3RjKO
 Evyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gWZLVkLeqiIzTgA1yTsmCWAmxaZF0chvlAf5OlNj5WI=;
 b=Wp6/Indoc2mWgm2ZxossKZg0/v7iMZ/vuSXMVnwe0UrBNenuD0oyS/HYo6okPpDTNL
 71rr91A0mQeZaaoKFhMgTthClxJyE9GT+0XZnoINngR2lAzoIgsFOxyTwd6jCS8+4EKa
 6sPsR/iufBN08DA5tHdoRZRNoqTIQReBN+EXPRJNa/+xY5y4nYcJSKMwF6hKthhBqODv
 4EKOMIarT+ofy43paflVD+8J9LRktz04p7Fzdt+EBe6rbg3UJrLQAzaCg0P8P5HbT+KM
 EbJFt+lhudiDyDtvjcksKhL980xtw49k/ZU/VktUmAteZqoNdlJTUhzI8SGyJSUW4hBS
 JN3A==
X-Gm-Message-State: AOAM532m6kLqv2XKsFxEc2JH2YUoCvGPR8VVbGgL8oPCpNxr89eaz6mR
 JrtEeoIIMhit742Ixj7HSdQqDA==
X-Google-Smtp-Source: ABdhPJxaINxX8qbrYB3mz1rfxUXspdpTMlELm5zKgjNAokK6QKq2Gh125hhBBgsP3wuBZuvFVSyypw==
X-Received: by 2002:a5d:528d:: with SMTP id c13mr4526377wrv.343.1627035313649; 
 Fri, 23 Jul 2021 03:15:13 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id p22sm3478844wmq.44.2021.07.23.03.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 03:15:12 -0700 (PDT)
Date: Fri, 23 Jul 2021 11:15:10 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] backlight: pwm_bl: Avoid backlight flicker if backlight
 control GPIO is input
Message-ID: <20210723101510.r2xz4rlzvgkhxtw3@maple.lan>
References: <20210718211415.143709-1-marex@denx.de>
 <20210719112202.4fvmn57ibgy3yesa@maple.lan>
 <bbaad78e-91c7-0787-fa72-b5cfabcc6dbd@denx.de>
 <20210721104914.4difos6w3ysjelnv@maple.lan>
 <fee1ad9e-ae70-1644-5444-6c894473b48e@denx.de>
 <20210721161249.gehnwkscto2hlh7s@maple.lan>
 <298f6a35-2120-60a6-598a-87b141118bfa@denx.de>
 <20210722112824.z5s2fst2q3vrblcr@maple.lan>
 <dd372ddc-0137-2f1c-8493-4bd38762384c@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd372ddc-0137-2f1c-8493-4bd38762384c@denx.de>
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

On Thu, Jul 22, 2021 at 09:02:04PM +0200, Marek Vasut wrote:
> On 7/22/21 1:28 PM, Daniel Thompson wrote:
> > On Wed, Jul 21, 2021 at 08:46:42PM +0200, Marek Vasut wrote:
> > > On 7/21/21 6:12 PM, Daniel Thompson wrote:
> > > > On Wed, Jul 21, 2021 at 05:09:57PM +0200, Marek Vasut wrote:
> > > > > On 7/21/21 12:49 PM, Daniel Thompson wrote:
> > > > [...]
> > > > This sails very close to the
> > > > edge of what is in-scope for DT (at least it does it we can read
> > > > the inherited state directly from the hardware).
> > > 
> > > The problem with reading it out of hardware is that the hardware might be in
> > > undefined state and expects Linux to define that state, so that does not
> > > always work. Hence my initial suggestion to add a DT property to define the
> > > state up front, instead of using these fragile heuristics.
> > 
> > To achieve a flicker-free boot we must know the initial state of the
> > backlight (not just the enable pin).
> 
> The backlight hardware might be in uninitialized state and then Linux should
> set the state, likely based on something in DT, because there is no previous
> state to read.

There is always a previous state. The kernel doesn't care whether that
previous state was imposed by a power-on reset, the bootloader or a
kexec.

For the driver to come up flicker-free in all the different cases we
need to know whether the backlight is currently emitting light or not
and, if it is emitting light, then we need to know what the duty cycle
is (currently we inherit require the PWM driver to correctly inherit the
duty cycle from the hardware).

So far, the previous state has been observable by the lower level
drivers (GPIO, PWM, regulator). I remain reluctant to provide
workarounds for cases where it is not observable without motivating
hardware. I certainly wouldn't want to make such bindings mandatory
since observable hardware registers are a far more reliable source of
truth than what the DT tells us about what it thinks the bootloader
(or power-on reset) actually did ;-).


> > > > Overall I have fairly grave concerns that this simply moves
> > > > fragility into the bootloader rather then reducing it.
> > > 
> > > Wait a minute, I think we disconnected somewhere. I would rather prefer to
> > > remove the fragility and bootloader dependency altogether, exactly to avoid
> > > depending on the state the bootloader left the hardware in.
> > 
> > The two fully flicker-free cases we support in pwm_bl are:
> > 
> > 1. Backlight off after bootloader has completed. Backlight must be
> >     off after the probe completes (and never flicker on/off during the
> >     probe). This allows the display to put a splash image on the screen
> >     before lighting up the backlight (this avoids a flicker if there are
> >     a few frames between backlight coming on and the splash image being
> >     drawn). Naturally this requires help from the display system (and
> >     that the display system is aware of the backlight to be able to start
> >     it).
> > 
> > 2. Backlight on with a splash image after bootloader has completed.
> >     Backlight must be on after the probe completes (and never flicker
> >     off/on during the probe). This also requires that the display system
> >     can take over the frame buffer without a flicker but that is
> >     completely independent of backlight.
> > 
> > There is also a simpler case which is not "flicker-free" since the
> > backlight may change level during the boot and may light up before
> > there is an image on the screen (although we'd still to minimise
> > flicker by ensuring there is only one change of backlight state/level
> > during the probe (something your work will see fixed?):
> 
> Actually no, my usecase is the backlight is not initialized by the
> bootloader at all, the pins are just strapped to default to the right
> values, the init is left to the kernel to do.

It doesn't matter to us who established the initial state. In this case
the backlight is off at handover. That means you are either case #1
(display system will unblank" the backlight automatically when the reset
of the display unblanks) or #3 (BL driver will "unblank" the backlight
during the probe).

Your changes should result in a fix to both these cases!


> > 3. Backlight is on after the probe completes. This is default if
> >     we don't know the display system will activate the backlight.
> >     This is an important legacy case since few userspaces know how
> >     to change the backlight power-state at boot.
> > 
> > One oddity here is that #3 *also* needs to know the state of the
> > backlight (on/off) to turn the backlight on without flickering
> > (so it can figure out how to handle power_pwm_on_delay correctly)
> > even though the final state is unconditionally on. That is the main
> > reason I proposed an alternative to your patch (since this is
> > currently broken).
> > 
> > The other oddity is that the difference between #1 and #3 is due to
> > *software* (which driver ends up responsible for unmuting the display)
> > meaning that the bootloader/DT has no business discriminating between
> > these two cases.
> > 
> > Thus pwm_bl.c is based on making #2/#3 (which are similar) the default
> > and switching to case #1 if there is a display driver to do the unblank
> > (software) *and* that the backlight is currently off (currently read
> > from hardware). Note that this is intentionally designed to that
> > if the logic does go wrong we should get a small bug (a flicker) rather
> > than a big one (a black screen).
> > 
> > Wow! That is *way* longer than I intended when I started writing it.
> > Anyhow I suspect any disconnect comes about due to the difference in
> > backlight state *after* probe being, in part, to software structure
> > rather than purely a hardware property.
> 
> Maybe this should be added to documentation.

I'll see what I can do.


Daniel.
