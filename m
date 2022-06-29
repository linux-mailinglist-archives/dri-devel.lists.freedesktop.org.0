Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 769C855F774
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 09:04:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C081122EB;
	Wed, 29 Jun 2022 07:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C370811229F
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 07:03:54 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id q4so23483634qvq.8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 00:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eywFT5Cbr+VM4RLwzIkGWvtXZKRL8hfaceBA9KstOpo=;
 b=aVWwAGvy0iKMzWyydlL5yBZrT0rACT8aSKGjGK1XZftxWFOI6zWV6xLGki5ZQaxemv
 Yd7fdhXCjy4Hcw/gQJTijTbB1jqyw0EtOPY8v9ny2ArfEDs6qMByxzsH8hesc3AtJLqY
 Ywj6bl0NcRvHfdMFaiOZQyTeOYmqNhyHevJucaMXh8Xo0o/FnyXbEqb5GErEX8GQrb0B
 nHuIPtd6OdYRnK6+59AUZWMsxQtPMBkNpy2i0roihioVWVspWdTWDLm/70bGeFn117Dp
 hKYcduIRHJxBU2A8j2LlDlGSSkR11ciNPufCcx6sUNJH09DbNhvn8uKgWYDM3T2nOiwQ
 JWMg==
X-Gm-Message-State: AJIora+al65zVqIBndRDdZGbfySBdnKYEIRe8Sm3iv/MsawF5G/Sc9th
 dXMmJxLuiTHlYIEuEQwlwbIzX3UXz89IFg==
X-Google-Smtp-Source: AGRyM1tm++sHqFfuuFr441ZaJs5+2AYrZF96q4oDPD/aUGC2QZrRtZsFaMQbjOxh0FGogCb5Xr0F1w==
X-Received: by 2002:ac8:5713:0:b0:31a:c706:50ef with SMTP id
 19-20020ac85713000000b0031ac70650efmr1246159qtw.267.1656486233376; 
 Wed, 29 Jun 2022 00:03:53 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com.
 [209.85.128.176]) by smtp.gmail.com with ESMTPSA id
 a186-20020a3766c3000000b006a37c908d33sm12363283qkc.28.2022.06.29.00.03.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jun 2022 00:03:52 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-31c1d580e4bso6978947b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 00:03:52 -0700 (PDT)
X-Received: by 2002:a81:574c:0:b0:317:7c3a:45be with SMTP id
 l73-20020a81574c000000b003177c3a45bemr2177677ywb.316.1656486232303; Wed, 29
 Jun 2022 00:03:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220626102853.124108-1-deller@gmx.de>
 <20220626102853.124108-4-deller@gmx.de>
 <CAMuHMdV5zLoQWi2qd9HpP65WEvCw_q3VTsZ0MnBV1t8xM7KFUw@mail.gmail.com>
 <f3b01426-1cd4-40b9-7dd7-0965c4c0611c@gmx.de>
In-Reply-To: <f3b01426-1cd4-40b9-7dd7-0965c4c0611c@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Jun 2022 09:03:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUz1OMe+opM2b=XyYpQc4ynCyamXGFTjkbnzMr3wFvb8g@mail.gmail.com>
Message-ID: <CAMuHMdUz1OMe+opM2b=XyYpQc4ynCyamXGFTjkbnzMr3wFvb8g@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] fbcon: Prevent that screen size is smaller than
 font size
To: Helge Deller <deller@gmx.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Helge,

On Tue, Jun 28, 2022 at 10:52 PM Helge Deller <deller@gmx.de> wrote:
> On 6/28/22 10:39, Geert Uytterhoeven wrote:
> > On Sun, Jun 26, 2022 at 12:33 PM Helge Deller <deller@gmx.de> wrote:
> >> We need to prevent that users configure a screen size which is smaller than the
> >> currently selected font size. Otherwise rendering chars on the screen will
> >> access memory outside the graphics memory region.
> >>
> >> This patch adds a new function fbcon_modechange_possible() which
> >> implements this check and which later may be extended with other checks
> >> if necessary.  The new function is called from the FBIOPUT_VSCREENINFO
> >> ioctl handler in fbmem.c, which will return -EINVAL if userspace asked
> >> for a too small screen size.
> >>
> >> Signed-off-by: Helge Deller <deller@gmx.de>
> >> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >> Cc: stable@vger.kernel.org # v5.4+
> >
> > Thanks for your patch, which is now commit f0b6a66d33ca6e7e ("fbcon:
> > Prevent that screen size is smaller than font size") in fbdev/for-next

> >> --- a/drivers/video/fbdev/core/fbmem.c
> >> +++ b/drivers/video/fbdev/core/fbmem.c
> >> @@ -1112,7 +1112,9 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
> >>                         return -EFAULT;
> >>                 console_lock();
> >>                 lock_fb_info(info);
> >> -               ret = fb_set_var(info, &var);
> >> +               ret = fbcon_modechange_possible(info, &var);
> >
> > Again, this should be done (if done at all) after the call to
> > fb_ops.check_var(), as it breaks the FBIOPUT_VSCREENINFO rounding rule.
> >
> > What if the user just wants to display graphics, not text?
>
> Yes, I need to go back to an older version here too and check that
> the test is only run on text consoles.
> That check was dropped, due feedback that you could switch
> back from graphics (e.g. X11) to text console at any time....so the
> check for text-only is not correct.
>
> > Can't the text console be disabled instead?
>
> I think the solution is to return failure if switching back to text mode isn't possible if
> fonts are bigger than the screen resolution. That will be another patch.

Isn't the font a per-VC setting? Hence can't you change resolution,
switch to a different VC, and run into this?

I think the only real solution is to set the number of text columns
and/or rows to zero, and make sure that is handled correctly.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
