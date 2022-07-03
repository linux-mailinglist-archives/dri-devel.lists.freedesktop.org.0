Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA8C565B33
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F1110E524;
	Mon,  4 Jul 2022 16:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A5710E010
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jul 2022 14:42:08 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id q16so6549057qtn.5
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Jul 2022 07:42:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UMzCVrrwT3NphyyJJjToVfwqHb66h1iNReM+vSAJnLg=;
 b=Eeed7tIe6GMaR5dwjE1lrEAAkTQIn1YYzRU2rZesM/517JYLXcPkDd2F/LCQ3pg01l
 72tMyQFXa94euinWs9ELPMMZb/C+yjiNMI3rjHK9p/zsQTmHo+MahKJ/tXV5jKkwbwgw
 trBCqACJsntEEjuIzK6MUAWWPc2PBYILjYnVheB3bQ/qyvDw1Re3yImkU7TIL6ysQY/b
 VNCjuvw+ZNeMxTIV5FxpWJkw1Yc1RebCNOQFAT6KnI4liZ2SHbx72Q3R5kQFYPKIPraz
 SUp2t3GnfTgRIxW1tGMQdc0nw8IcqFm5WT0D8iBqTQ1/V7YP3WmGxU32BvOjQaU6GTAj
 eRvg==
X-Gm-Message-State: AJIora9uvzowBT9GpdDDscRTTVlv79tPLF1+80t6qivKXhE5zqFRnb1o
 vHGPLo4k5VXm+pa5fOrCYeh0NQDHsc9YkA==
X-Google-Smtp-Source: AGRyM1vfg3uAeRhx/5KXxdRM3fWM+Fuqg70XNlh6aMSAH0JAiQzZdVvP4MZ+wpXsqdAjriwm8PN4NA==
X-Received: by 2002:a05:622a:1441:b0:31d:2a48:250 with SMTP id
 v1-20020a05622a144100b0031d2a480250mr17023128qtx.98.1656859327128; 
 Sun, 03 Jul 2022 07:42:07 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com.
 [209.85.128.171]) by smtp.gmail.com with ESMTPSA id
 d71-20020a379b4a000000b006a6a1e4aec2sm22092584qke.49.2022.07.03.07.42.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jul 2022 07:42:06 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-31bf3656517so61129217b3.12
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Jul 2022 07:42:06 -0700 (PDT)
X-Received: by 2002:a81:98d:0:b0:31c:921c:9783 with SMTP id
 135-20020a81098d000000b0031c921c9783mr1929402ywj.316.1656859326344; Sun, 03
 Jul 2022 07:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220701202352.559808-1-deller@gmx.de>
 <20220701202352.559808-4-deller@gmx.de>
 <CAMuHMdUTwM+y+yi5ASY9hQLgJD-4pjtStGA9m82853LmbdywOA@mail.gmail.com>
 <YsGfdEO4lU+y2004@p100>
In-Reply-To: <YsGfdEO4lU+y2004@p100>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 3 Jul 2022 16:41:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdULPGmK_K3QeyEpBbO5Dr9_WEszHXDGLzvdv7f3Y2O7vw@mail.gmail.com>
Message-ID: <CAMuHMdULPGmK_K3QeyEpBbO5Dr9_WEszHXDGLzvdv7f3Y2O7vw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] fbmem: Prevent invalid virtual screen sizes in
 fb_set_var()
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

On Sun, Jul 3, 2022 at 3:54 PM Helge Deller <deller@gmx.de> wrote:
> * Geert Uytterhoeven <geert@linux-m68k.org>:
> > > --- a/drivers/video/fbdev/core/fbmem.c
> > > +++ b/drivers/video/fbdev/core/fbmem.c
> > > @@ -1016,6 +1016,18 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
> > >         if (ret)
> > >                 return ret;
> > >
> > > +       /* make sure virtual resolution >= physical resolution */
> > > +       if (WARN_ON(var->xres_virtual < var->xres)) {
> >
> > WARN_ON_ONCE()?
> > This does mean we would miss two or more buggy drivers in a single system.
> >
> > > +               pr_warn("fbcon: Fix up invalid xres %d for %s\n",
> >
> > xres_virtual?
> >
> > > +                       var->xres_virtual, info->fix.id);
> > > +               var->xres_virtual = var->xres;
> >
> > I think it's better to not fix this up, but return -EINVAL instead.
> > After all if we get here, we have a buggy driver that needs to be fixed.
> >
> > > +       }
> > > +       if (WARN_ON(var->yres_virtual < var->yres)) {
> > > +               pr_warn("fbcon: Fix up invalid yres %d for %s\n",
> > > +                       var->yres_virtual, info->fix.id);
> > > +               var->yres_virtual = var->yres;
> > > +       }
> >
> > Same for yres.
>
> Geert, thanks for your valuable feedback!
>
> In general I don't like for this case any of the WARN_ON* functions.
> They don't provide any useful info for us, dumps unneccessarily the
> stack backtrace and would annoy existing users.

Without the stack trace, most people won't notice...

> We know, that DRM drivers can't change the resolution. If we would leave
> in any kind of warning, all DRM users will ask back - and we don't have
> a solution for them. It's also no regression, because it didn't worked
> before either.

The warning will only be triggered when the requested virtual
resolution is smaller than the requested physical resolution.  As
long as the requested virtual and physical resolution match what
was returned by FBIOGET_VSCREENINFO before, the warning won't
be triggered.  So in normal use cases, the user won't be impacted.
Fuzzers will see the warning, but the kernel will no longer crash
on invalid values.

> But we want to detect fbdev drivers which behave badly - so we should
> print that info with the driver name.
>
> Below is a new patch which addresses this. The search for drm drivers
> looks somewhat hackish - maybe someone can propose a better approach?
>
> Thoughts?
>
> Helge
>
>
> From 0f33e2a3730342ab85df372f80b4f61762fb1130 Mon Sep 17 00:00:00 2001
> From: Helge Deller <deller@gmx.de>
> Date: Wed, 29 Jun 2022 15:53:55 +0200
> Subject: [PATCH] fbmem: Check virtual screen sizes in fb_set_var()
>
> Verify that the fbdev or drm driver correctly adjusted the virtual screen
> sizes. On failure report (in case of fbdev drivers) the failing driver.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
> Cc: stable@vger.kernel.org # v5.4+
>
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 160389365a36..9b75aa4405ee 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -1016,6 +1016,21 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
>         if (ret)
>                 return ret;
>
> +       /* verify that virtual resolution >= physical resolution */
> +       if (var->xres_virtual < var->xres ||
> +           var->yres_virtual < var->yres) {
> +               /* drm drivers don't support mode changes yet. Do not report. */
> +               if (strstr(info->fix.id, "drm"))
> +                       return -ENOTSUPP;
> +
> +               pr_warn("WARNING: fbcon: Driver %s missed to adjust virtual"
> +                       " screen size (%dx%d vs. %dx%d)\n",
> +                       info->fix.id,
> +                       var->xres_virtual, var->yres_virtual,
> +                       var->xres, var->yres);
> +               return -EINVAL;
> +       }
> +
>         if ((var->activate & FB_ACTIVATE_MASK) != FB_ACTIVATE_NOW)
>                 return 0;

Hence I think there is no need for ignoring drm.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
