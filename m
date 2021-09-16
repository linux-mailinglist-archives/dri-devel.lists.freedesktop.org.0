Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A09440E1C6
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 19:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D506EBB7;
	Thu, 16 Sep 2021 17:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2D56EBB7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 17:08:20 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id p80so2160672iod.10
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 10:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kYMlWhMWuy4ezwiyEISjGOPG2Tpg02MXtGhpcC6x5jo=;
 b=Bjxl2kjQCmg31G/NCUver1eYiLHkGB/1Y1w9waW7LSegF9Z14kd+xODw3WPIMAO+Ey
 qBbY3WC0dJdZxz9noKgAgH98Cnhd9dtdTCjlejvY04B54CJHEu7WwrFAZ70dkwUeObeH
 6ocuojYwUz03+nMzS0NxUmRVIghZ7nj1WWnGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kYMlWhMWuy4ezwiyEISjGOPG2Tpg02MXtGhpcC6x5jo=;
 b=poZHYgKAj8EpReKuWETM6eJ2vQ3KinavuHU0eYRThlmDz/KyQLq/RykEd9/9jRqARe
 GqK7pj8YLxeFxINdsKiOmOUICGc420tvqQ6If/q6iPSSap24bg3uyMqun7SztD8qnGAU
 GpCByHyNiBKLkLEsvNz7GBwX0zuMhaFSG+QKKmRjfcwZBVOnrW8TRTj3bJFV9eg4RR+4
 gjgf14gHS6A/WdoToxjerFBkLA1lc4N4IMKSiOmjh7VLHez3Ew7GSoR5G0Q91eAcKaaW
 xbjXmH0jiHwMcIbdCW2WnuQ5K93Sgqxyi4YripxfA9R4iiwOxNKCLY82z8GDCSGTgKuM
 i47A==
X-Gm-Message-State: AOAM5315z3R3U1+D4OzFdWZBSdzyw1/oONV87VAW8V/MNfjK/SzonZVG
 2raYa6k3VAzzC+QBnW4kbPYfDI+1PwfLbA==
X-Google-Smtp-Source: ABdhPJwdSFziVqHXeZLIds2uY3/YlOWiF2w4NKjA2OAZwbCCPUkSbzNl4ZKfCVSYEyuqpP24fmdsrg==
X-Received: by 2002:a5d:9da4:: with SMTP id ay36mr5328852iob.153.1631812098775; 
 Thu, 16 Sep 2021 10:08:18 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com.
 [209.85.166.48])
 by smtp.gmail.com with ESMTPSA id b12sm656725ioj.55.2021.09.16.10.08.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 10:08:17 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id j18so8706391ioj.8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 10:08:16 -0700 (PDT)
X-Received: by 2002:a6b:6a14:: with SMTP id x20mr5042916iog.177.1631812096362; 
 Thu, 16 Sep 2021 10:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210908135356.18689-1-macroalpha82@gmail.com>
 <2719341.5nTrVeAVQv@diego>
In-Reply-To: <2719341.5nTrVeAVQv@diego>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 16 Sep 2021 10:08:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VhOu7v5s0Jx1ATA62LJbFJgtpHNiPUDo9+sxarsef3dw@mail.gmail.com>
Message-ID: <CAD=FV=VhOu7v5s0Jx1ATA62LJbFJgtpHNiPUDo9+sxarsef3dw@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: Update crtc fixup to account for fractional
 clk change
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, 
 Chris Morgan <macroalpha82@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Sandy Huang <hjc@rock-chips.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 zhangqing <zhangqing@rock-chips.com>, 
 Chris Morgan <macromorgan@hotmail.com>, Brian Norris <briannorris@chromium.org>,
 Chen-Yu Tsai <wenst@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Sep 14, 2021 at 4:14 AM Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Hi,
>
> Am Mittwoch, 8. September 2021, 15:53:56 CEST schrieb Chris Morgan:
> > From: Chris Morgan <macromorgan@hotmail.com>
> >
> > After commit 928f9e268611 ("clk: fractional-divider: Hide
> > clk_fractional_divider_ops from wide audience") was merged it appears
> > that the DSI panel on my Odroid Go Advance stopped working. Upon closer
> > examination of the problem, it looks like it was the fixup in the
> > rockchip_drm_vop.c file was causing the issue. The changes made to the
> > clk driver appear to change some assumptions made in the fixup.
> >
> > After debugging the working 5.14 kernel and the no-longer working
> > 5.15 kernel, it looks like this was broken all along but still
> > worked, whereas after the fractional clock change it stopped
> > working despite the issue (it went from sort-of broken to very broken).
> >
> > In the 5.14 kernel the dclk_vopb_frac was being requested to be set to
> > 17000999 on my board. The clock driver was taking the value of the
> > parent clock and attempting to divide the requested value from it
> > (17000000/17000999 =3D 0), then subtracting 1 from it (making it -1),
> > and running it through fls_long to get 64. It would then subtract
> > the value of fd->mwidth from it to get 48, and then bit shift
> > 17000999 to the left by 48, coming up with a very large number of
> > 7649082492112076800. This resulted in a numerator of 65535 and a
> > denominator of 1 from the clk driver. The driver seemingly would
> > try again and get a correct 1:1 value later, and then move on.
> >
> > Output from my 5.14 kernel (with some printfs for good measure):
> > [    2.830066] rockchip-drm display-subsystem: bound ff460000.vop (ops =
vop_component_ops)
> > [    2.839431] rockchip-drm display-subsystem: bound ff450000.dsi (ops =
dw_mipi_dsi_rockchip_ops)
> > [    2.855980] Clock is dclk_vopb_frac
> > [    2.856004] Scale 64, Rate 7649082492112076800, Oldrate 17000999, Pa=
rent Rate 17000000, Best Numerator 65535, Best Denominator 1, fd->mwidth 16
> > [    2.903529] Clock is dclk_vopb_frac
> > [    2.903556] Scale 0, Rate 17000000, Oldrate 17000000, Parent Rate 17=
000000, Best Numerator 1, Best Denominator 1, fd->mwidth 16
> > [    2.903579] Clock is dclk_vopb_frac
> > [    2.903583] Scale 0, Rate 17000000, Oldrate 17000000, Parent Rate 17=
000000, Best Numerator 1, Best Denominator 1, fd->mwidth 16
> >
> > Contrast this with 5.15 after the clk change where the rate of 17000999
> > was getting passed and resulted in numerators/denomiators of 17001/
> > 17000.
> >
> > Output from my 5.15 kernel (with some printfs added for good measure):
> > [    2.817571] rockchip-drm display-subsystem: bound ff460000.vop (ops =
vop_component_ops)
> > [    2.826975] rockchip-drm display-subsystem: bound ff450000.dsi (ops =
dw_mipi_dsi_rockchip_ops)
> > [    2.843430] Rate 17000999, Parent Rate 17000000, Best Numerator 1701=
8, Best Denominator 17017
> > [    2.891073] Rate 17001000, Parent Rate 17000000, Best Numerator 1700=
1, Best Denominator 17000
> > [    2.891269] Rate 17001000, Parent Rate 17000000, Best Numerator 1700=
1, Best Denominator 17000
> > [    2.891281] Rate 17001000, Parent Rate 17000000, Best Numerator 1700=
1, Best Denominator 17000
> >
> > After tracing through the code it appeared that this function here was
> > adding a 999 to the requested frequency because of how the clk driver
> > was rounding/accepting those frequencies. I believe after the changes
> > made in the commit listed above the assumptions listed in this driver
> > are no longer true. When I remove the + 999 from the driver the DSI
> > panel begins to work again.
> >
> > Output from my 5.15 kernel with 999 removed (printfs added):
> > [    2.852054] rockchip-drm display-subsystem: bound ff460000.vop (ops =
vop_component_ops)
> > [    2.864483] rockchip-drm display-subsystem: bound ff450000.dsi (ops =
dw_mipi_dsi_rockchip_ops)
> > [    2.880869] Clock is dclk_vopb_frac
> > [    2.880892] Rate 17000000, Parent Rate 17000000, Best Numerator 1, B=
est Denominator 1
> > [    2.928521] Clock is dclk_vopb_frac
> > [    2.928551] Rate 17000000, Parent Rate 17000000, Best Numerator 1, B=
est Denominator 1
> > [    2.928570] Clock is dclk_vopb_frac
> > [    2.928574] Rate 17000000, Parent Rate 17000000, Best Numerator 1, B=
est Denominator 1
> >
> > I have tested the change extensively on my Odroid Go Advance (Rockchip
> > RK3326) and it appears to work well. However, this change will affect
> > all Rockchip SoCs that use this driver so I believe further testing
> > is warranted. Please note that without this change I can confirm
> > at least all PX30s with DSI panels will stop working with the 5.15
> > kernel.
> >
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
>
> With 5.15-rc1 on:
> - rk3288-pinky+eDP (was working -> still working)
> - rk3399-kevin+eDP (was working -> still working)
> - px30-minievb (was broken -> working again)
>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
>
>
> I've also added Doug, maybe he remembers some historic artifact
> to keep in mind about the original patch.

So when you say "was working" -> "still working", how did you test
that? Did you just confirm that something was showing up on the
screen, or did you check debugfs and make sure that the PLLs were all
being set correctly? Also, I can't quite remember if the problems here
were related to the internal display (and on which rockchip device) or
HDMI where we could have a whole lot more possible pixel clocks. I can
dig if need be. ...but I'm fairly certain that we can't just delete
the "+ 999" and expect everything to work. All of the stuff in the
comment above the "+ 999" is still as true today as it was when I
wrote it. DRM is still in kHz and the Rockchip clock driver still
rounds down.

I suspect that the problem here is that the logic I wrote up just
doesn't work great if your display clock is made by a "frac" clock.
That's pretty much what I was saying when I wrote the comment:

> NOTE: if the PLL (maybe through a divider) could actually make
> a clock rate 999 Hz higher instead of the one we want then this
> could be a problem.

Maybe we can come up with a solution, though.

So one thing is that I'd suspect that the problem is actually a bug
with the fractional clock driver. "Best Numerator 17001, Best
Denominator 17000" is probably not a valid thing to set and the clock
driver should know this and seek out a different rate. I haven't dug
through your code paths but, for instance, the comments above
rockchip_fractional_approximation() say that denominator must be 20x
the numerator if you want a good clock. That's clearly not the case
here. There could also be maximum values of the numerator /
denominator that are being ignored. I would sorta bet that if the frac
clock driver was fixed that a clock anywhere between 17000000 and
17000999 would work just fine for you.

In any case, despite the clock driver being screwy, probably this
would fix it for you (untested) and is a better solution I think:

rate =3D clk_round_rate(vop->dclk, adjusted_mode->clock * 1000);
if (rate / 1000 !=3D adjusted_mode->clock)
  rate =3D clk_round_rate(vop->dclk, adjusted_mode->clock * 1000 + 999);

Basically: if we can happen to make the rate exactly then we're good.
Otherwise then try bumping up by 999.


> > ---
> >  drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 21 +++------------------
> >  1 file changed, 3 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/=
drm/rockchip/rockchip_drm_vop.c
> > index ba9e14da41b4..bfef4f52dce6 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> > @@ -1169,31 +1169,16 @@ static bool vop_crtc_mode_fixup(struct drm_crtc=
 *crtc,
> >        *
> >        * - DRM works in in kHz.
> >        * - Clock framework works in Hz.
> > -      * - Rockchip's clock driver picks the clock rate that is the
> > -      *   same _OR LOWER_ than the one requested.
> >        *
> >        * Action plan:
> >        *
> > -      * 1. When DRM gives us a mode, we should add 999 Hz to it.  That=
 way
> > -      *    if the clock we need is 60000001 Hz (~60 MHz) and DRM tells=
 us to
> > -      *    make 60000 kHz then the clock framework will actually give =
us
> > -      *    the right clock.
> > -      *
> > -      *    NOTE: if the PLL (maybe through a divider) could actually m=
ake
> > -      *    a clock rate 999 Hz higher instead of the one we want then =
this
> > -      *    could be a problem.  Unfortunately there's not much we can =
do
> > -      *    since it's baked into DRM to use kHz.  It shouldn't matter =
in
> > -      *    practice since Rockchip PLLs are controlled by tables and
> > -      *    even if there is a divider in the middle I wouldn't expect =
PLL
> > -      *    rates in the table that are just a few kHz different.
> > -      *
> > -      * 2. Get the clock framework to round the rate for us to tell us
> > +      * 1. Get the clock framework to round the rate for us to tell us
> >        *    what it will actually make.
> >        *
> > -      * 3. Store the rounded up rate so that we don't need to worry ab=
out
> > +      * 2. Store the rounded up rate so that we don't need to worry ab=
out
> >        *    this in the actual clk_set_rate().
> >        */
> > -     rate =3D clk_round_rate(vop->dclk, adjusted_mode->clock * 1000 + =
999);
> > +     rate =3D clk_round_rate(vop->dclk, adjusted_mode->clock * 1000);
> >       adjusted_mode->clock =3D DIV_ROUND_UP(rate, 1000);
> >
> >       return true;
> >
>
>
>
>
