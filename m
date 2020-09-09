Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0A326301E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 17:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2336EB98;
	Wed,  9 Sep 2020 15:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0AC6EB98
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 15:03:50 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id 185so2640091oie.11
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Sep 2020 08:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XqgUisCv6O6AIe2HSHhoMaBFAHa4ETHNWOlkQljBJ8A=;
 b=BRT9Vi4VBHt950UmvglmwImZSM4kL3ilDGd58qK07Eo89lRCG7hrMJ5v2fKeNK8UXZ
 mZLdMBMk12yoKK2uXeOkGlvQeQJvJZmzdNJ04oJpSZucuLlQMSslsP/qVgoNsYapeaEy
 3wpaj+nh0NeqwJlRpoCiPfrIGDoCd7GLIzy/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XqgUisCv6O6AIe2HSHhoMaBFAHa4ETHNWOlkQljBJ8A=;
 b=XH56YnX6Nef6VL1hGATbKKN8704h8jN28B0T2n4S45F3INuX9bn5LQUoaXPVMi3Gz0
 uHa/ziZar4jt/HuHrkQZec/nr3/cWKJfCZ6X+GPKy7N1Bi2/dVv/c1xCqEt0Mx/YfkQN
 R/+9/hoxcJCDcocd67x44Fyi3uosee5VALgC0N8f/k1G9bVFnOXBVzoLMMhotM5NnBoU
 KMuDQwmBui5Fi9drcjB54ao9TiCqK1lPRFO6DegxZBZLbXebam1Wi0+F3l05qUqJwVdI
 mTJnBpywRmkGeTqBjOuLmq6KVTmTLeAYPGQEGmp/O1s6hJ7kLXEffqM91qi9jvh5bi56
 RRzw==
X-Gm-Message-State: AOAM533V5k0ho1bCbMZL0ULvZOLPdKZbBG5p89qppVadGq9fcmwz7Isg
 2SAFWkZiG+PIh5sUO4lPZaluzAzb8fSZpMVsX86H4w==
X-Google-Smtp-Source: ABdhPJzV6KFL4kNw0JMMTwGtLRSVvE2e3kcoWpzF0VGT7IKBd/vRbzuUSWeECw2RPuAZ9KHggkot6bIzZex5xMKydis=
X-Received: by 2002:aca:5106:: with SMTP id f6mr875834oib.101.1599663828682;
 Wed, 09 Sep 2020 08:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200721042522.2403410-1-amstan@chromium.org>
 <20200720212502.2.Iab4d2192e4cf50226e0a58d58df7d90ef92713ce@changeid>
 <20200904113822.xoyt4w5x7vwvh7cr@holly.lan>
 <20200907075018.GM2352366@phenom.ffwll.local>
 <20200909144537.daq2exfihhxm6bai@holly.lan>
In-Reply-To: <20200909144537.daq2exfihhxm6bai@holly.lan>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 9 Sep 2020 17:03:37 +0200
Message-ID: <CAKMK7uEK5afDHT9n0s+eDYA1Qztf9Xxibz_rZDzy5F6G9EOEVw@mail.gmail.com>
Subject: Re: [PATCH 2/3] backlight: pwm_bl: Artificially add 0% during
 interpolation
To: Daniel Thompson <daniel.thompson@linaro.org>
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
Cc: linux-pwm <linux-pwm@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Alexandru Stan <amstan@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>, Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 9, 2020 at 4:45 PM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Mon, Sep 07, 2020 at 09:50:18AM +0200, Daniel Vetter wrote:
> > On Fri, Sep 04, 2020 at 12:38:22PM +0100, Daniel Thompson wrote:
> > > On Mon, Jul 20, 2020 at 09:25:21PM -0700, Alexandru Stan wrote:
> > > > Some displays need the low end of the curve cropped in order to make
> > > > them happy. In that case we still want to have the 0% point, even though
> > > > anything between 0% and 5%(example) would be skipped.
> > >
> > > For backlights it is not defined that 0 means off and, to be honest, 0
> > > means off is actually rather weird for anything except transflexive
> > > or front lit reflective displays[1]. There is a problem on several
> > > systems that when the backlight slider is reduced to zero you can't
> > > see the screen properly to turn it back up. This patch looks like it
> > > would make that problem worse by hurting systems with will written
> > > device trees.
> > >
> > > There is some nasty legacy here: some backlight displays that are off
> > > at zero and that sucks because userspace doesn't know whether zero is
> > > off or lowest possible setting.
> > >
> > > Nevertheless perhaps a better way to handle this case is for 0 to map to
> > > 5% power and for the userspace to turn the backlight on/off as final
> > > step in an animated backlight fade out (and one again for a fade in).
> >
> > Afaik chromeos encodes "0 means off" somewhere in there stack. We've
> > gotten similar patches for the i915 backlight driver when we started
> > obeying the panel's lower limit in our pwm backlight driver thing that's
> > sometimes used instead of acpi.
>
> Out of interest... were they accepted?
>
> I did took a quick look at intel_panel.c and didn't see anything
> that appeared to be special casing zero but I thought I might double
> check.

I don't think so. Just figured I bring this up since it might explain
why this is coming back again from an @chromium.com address.
-Daniel

>
>
> Daniel.
>
>
> > There's also the problem that with fancy panels with protocol (dsi, edp,
> > ...) shutting of the backlight completely out of the proper power sequence
> > hangs the panel (for some panels at least), so providing a backlight off
> > that doesn't go through the drm modeset sequence isn't always possible.
> >
> > It's a bit a mess indeed :-/
> > -Daniel
> >
> > >
> > >
> > > Daniel.
> > >
> > > >
> > > > Signed-off-by: Alexandru Stan <amstan@chromium.org>
> > > > ---
> > > >
> > > >  drivers/video/backlight/pwm_bl.c | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > >
> > > > diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
> > > > index 5193a72305a2..b24711ddf504 100644
> > > > --- a/drivers/video/backlight/pwm_bl.c
> > > > +++ b/drivers/video/backlight/pwm_bl.c
> > > > @@ -349,6 +349,14 @@ static int pwm_backlight_parse_dt(struct device *dev,
> > > >                   /* Fill in the last point, since no line starts here. */
> > > >                   table[x2] = y2;
> > > >
> > > > +                 /*
> > > > +                  * If we don't start at 0 yet we're increasing, assume
> > > > +                  * the dts wanted to crop the low end of the range, so
> > > > +                  * insert a 0 to provide a display off mode.
> > > > +                  */
> > > > +                 if (table[0] > 0 && table[0] < table[num_levels - 1])
> > > > +                         table[0] = 0;
> > > > +
> > > >                   /*
> > > >                    * As we use interpolation lets remove current
> > > >                    * brightness levels table and replace for the
> > > > --
> > > > 2.27.0
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
