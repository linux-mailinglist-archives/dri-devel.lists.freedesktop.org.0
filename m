Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F96B25F44D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 09:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 480C96E2B2;
	Mon,  7 Sep 2020 07:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954236E2B2
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 07:50:22 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id k15so14661689wrn.10
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 00:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=lgdO+wcLjjr5/DOIRw2FqQVZyOMD3aT5rG4YxEdLkHI=;
 b=GkPf9CMa12TsOMNNJBhObX69nm4V7Y0Xa2p/7XNbxitfct8Q1DryNblIAOzMbOxw6Y
 jcADz/kmPW8+B5VhR/JqxzVB1RSEADWmflOJPo4Tccb7Tmo5ZpoXPvUNtijUtv9TPuD/
 +vMwTwyBQWCEbnbF69nTs4adshQcK3+J52FkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=lgdO+wcLjjr5/DOIRw2FqQVZyOMD3aT5rG4YxEdLkHI=;
 b=ZimtN70zp80gW/CRRylhmGku9P8XgGMDY/1e00UZ38y7bJeEfRS2a5Ra7YFCz1y79Z
 ODBcluZHYD6CZL4Z3hX90dgaHGeUlkNTUv0ajzRjGejW6+86K4cqFCZ/9IZhS5+HqQAP
 kQpas8EgsVLQ048cZxBonZDUjJv5OtLadoITx1WlP2DAY2hGfVsSAmNDjXUqAIximEl6
 ofjFOQ85WULGTr5g+i/ucH2lu37tKhR5Atcfo8Cllj/NiXvphX8aun09cRPJztTlpJZ8
 gswqvSKy7BkPGcuft2j1/PddJTa11ilEICt/+GXflYzHkCyPIh/s1C/lQWNw5HkaYAcZ
 hBkw==
X-Gm-Message-State: AOAM531rKHoG5an+8gqGRsemqT5RJz/JvVOgJ9qjgrmCExxlqKMvxO3E
 gXcK8/+kdBehEhQ6WwMQKzze1g==
X-Google-Smtp-Source: ABdhPJz2hCEhRCwXanS9ojpHGz4IM7r4firNCEytShrviFkem7VHOQUejqamyg5Ug83QblsoT0n85Q==
X-Received: by 2002:a5d:5111:: with SMTP id s17mr20057301wrt.70.1599465021254; 
 Mon, 07 Sep 2020 00:50:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 70sm27928097wme.15.2020.09.07.00.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 00:50:20 -0700 (PDT)
Date: Mon, 7 Sep 2020 09:50:18 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH 2/3] backlight: pwm_bl: Artificially add 0% during
 interpolation
Message-ID: <20200907075018.GM2352366@phenom.ffwll.local>
Mail-Followup-To: Daniel Thompson <daniel.thompson@linaro.org>,
 Alexandru Stan <amstan@chromium.org>, linux-pwm@vger.kernel.org,
 linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>,
 Matthias Kaehlcke <mka@chromium.org>
References: <20200721042522.2403410-1-amstan@chromium.org>
 <20200720212502.2.Iab4d2192e4cf50226e0a58d58df7d90ef92713ce@changeid>
 <20200904113822.xoyt4w5x7vwvh7cr@holly.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200904113822.xoyt4w5x7vwvh7cr@holly.lan>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
 Alexandru Stan <amstan@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>, Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 04, 2020 at 12:38:22PM +0100, Daniel Thompson wrote:
> On Mon, Jul 20, 2020 at 09:25:21PM -0700, Alexandru Stan wrote:
> > Some displays need the low end of the curve cropped in order to make
> > them happy. In that case we still want to have the 0% point, even though
> > anything between 0% and 5%(example) would be skipped.
> 
> For backlights it is not defined that 0 means off and, to be honest, 0
> means off is actually rather weird for anything except transflexive
> or front lit reflective displays[1]. There is a problem on several
> systems that when the backlight slider is reduced to zero you can't
> see the screen properly to turn it back up. This patch looks like it
> would make that problem worse by hurting systems with will written
> device trees.
> 
> There is some nasty legacy here: some backlight displays that are off
> at zero and that sucks because userspace doesn't know whether zero is
> off or lowest possible setting.
> 
> Nevertheless perhaps a better way to handle this case is for 0 to map to
> 5% power and for the userspace to turn the backlight on/off as final
> step in an animated backlight fade out (and one again for a fade in).

Afaik chromeos encodes "0 means off" somewhere in there stack. We've
gotten similar patches for the i915 backlight driver when we started
obeying the panel's lower limit in our pwm backlight driver thing that's
sometimes used instead of acpi.

There's also the problem that with fancy panels with protocol (dsi, edp,
...) shutting of the backlight completely out of the proper power sequence
hangs the panel (for some panels at least), so providing a backlight off
that doesn't go through the drm modeset sequence isn't always possible.

It's a bit a mess indeed :-/
-Daniel

> 
> 
> Daniel.
> 
> > 
> > Signed-off-by: Alexandru Stan <amstan@chromium.org>
> > ---
> > 
> >  drivers/video/backlight/pwm_bl.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
> > index 5193a72305a2..b24711ddf504 100644
> > --- a/drivers/video/backlight/pwm_bl.c
> > +++ b/drivers/video/backlight/pwm_bl.c
> > @@ -349,6 +349,14 @@ static int pwm_backlight_parse_dt(struct device *dev,
> >  			/* Fill in the last point, since no line starts here. */
> >  			table[x2] = y2;
> >  
> > +			/*
> > +			 * If we don't start at 0 yet we're increasing, assume
> > +			 * the dts wanted to crop the low end of the range, so
> > +			 * insert a 0 to provide a display off mode.
> > +			 */
> > +			if (table[0] > 0 && table[0] < table[num_levels - 1])
> > +				table[0] = 0;
> > +
> >  			/*
> >  			 * As we use interpolation lets remove current
> >  			 * brightness levels table and replace for the
> > -- 
> > 2.27.0
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
