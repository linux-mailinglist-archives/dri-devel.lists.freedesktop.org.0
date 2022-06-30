Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 238D35622F3
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 21:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD6510E3AC;
	Thu, 30 Jun 2022 19:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4959D113C37
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 19:18:53 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id b24so14429700qkn.4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D7pML6UMsrO1AGKh9xvcZgROuleHW3uaJmPAn03Yhfg=;
 b=USeUOyJrLXpSXnbmz/6pcNugvDIzsLBEDwrgJL3j8E7f6VNybwVFRmD+exxjLMyoWA
 nQF75kz3lvdmd93/LWpvS+REL3dr+LxQUUXlF2s6WSIviVEy4//nN5VskhZDAy1KtzOG
 w6B895FQ7ZBeTizGnLsPRICRlpo13Tcu2MKVtcXnZ+sNo+sg6+EqKzalRAc3CElARHG7
 LsV3t9FFQsN9XKMGs7QctLpCkXOLNtoKXXiLsxRbEP8ANDU8JAkdORiRZeKt6k6AhcNw
 vMq7CEjuyHEeqJ8LXEaYNEovZwezYrnofa6ChODMIoH3p+2YSAvacyT7Pb2R6CFU1yYe
 knfQ==
X-Gm-Message-State: AJIora/CPPTOpnJIA+NABVGuaoQL/SGaCSKJe/bylHzwJeTeP8hIL78/
 cSLBpX+o9tz3AnXifzKp7xNDTRUdhF5RaA==
X-Google-Smtp-Source: AGRyM1sStSRNuYwL0uFNRRNiTUkYnJhLhWLnnpQvveNBp9EQXK8HuBTgsZdRHq8haiqRewqzUZZ8vw==
X-Received: by 2002:a05:620a:854:b0:6af:306c:faff with SMTP id
 u20-20020a05620a085400b006af306cfaffmr7574866qku.641.1656616731964; 
 Thu, 30 Jun 2022 12:18:51 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179]) by smtp.gmail.com with ESMTPSA id
 k1-20020a05620a414100b006af039ff090sm17719176qko.97.2022.06.30.12.18.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 12:18:51 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id i7so84934ybe.11
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:18:51 -0700 (PDT)
X-Received: by 2002:a25:2b48:0:b0:668:3b7d:326c with SMTP id
 r69-20020a252b48000000b006683b7d326cmr10859442ybr.380.1656616731229; Thu, 30
 Jun 2022 12:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220629200024.187187-1-deller@gmx.de>
 <20220629200024.187187-4-deller@gmx.de>
 <CAMuHMdWVe3TPCpEiNks2p1AAc-7KXx8fnEa8J=Qsvc0d+WTL+w@mail.gmail.com>
In-Reply-To: <CAMuHMdWVe3TPCpEiNks2p1AAc-7KXx8fnEa8J=Qsvc0d+WTL+w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jun 2022 21:18:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU2pFR9NGjSBsyZn7KbV1yeGaS4v-Q8QnckHfFO18K=rg@mail.gmail.com>
Message-ID: <CAMuHMdU2pFR9NGjSBsyZn7KbV1yeGaS4v-Q8QnckHfFO18K=rg@mail.gmail.com>
Subject: Re: [PATCH 3/5] fbcon: Prevent that screen size is smaller than font
 size
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

On Thu, Jun 30, 2022 at 9:09 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Jun 29, 2022 at 10:00 PM Helge Deller <deller@gmx.de> wrote:
> > We need to prevent that users configure a screen size which is smaller than the
> > currently selected font size. Otherwise rendering chars on the screen will
> > access memory outside the graphics memory region.
> > This patch adds a new function fbcon_modechange_possible() which
> > implements this check and which later may be extended with other checks
> > if necessary.  The new function is called from the FBIOPUT_VSCREENINFO
> > ioctl handler in fbmem.c, which will return -EINVAL if userspace asked
> > for a too small screen size.
> >
> > Signed-off-by: Helge Deller <deller@gmx.de>
> > Cc: stable@vger.kernel.org # v5.4+
>
> Thanks for your patch!
>
> > --- a/drivers/video/fbdev/core/fbcon.c
> > +++ b/drivers/video/fbdev/core/fbcon.c
> > @@ -2736,6 +2736,34 @@ void fbcon_update_vcs(struct fb_info *info, bool all)
> >  }
> >  EXPORT_SYMBOL(fbcon_update_vcs);
> >
> > +/* let fbcon check if it supports a new screen resolution */
> > +int fbcon_modechange_possible(struct fb_info *info, struct fb_var_screeninfo *var)
> > +{
> > +       struct fbcon_ops *ops = info->fbcon_par;
> > +       struct vc_data *vc;
> > +       int i;
> > +
> > +       WARN_CONSOLE_UNLOCKED();
> > +
> > +       if (!ops || ops->currcon < 0)
> > +               return -EINVAL;
>
> So if the virtual console is _not_ used as a text console, we refuse
> mode changes?
>
> > +
> > +       /* prevent setting a screen size which is smaller than font size */
> > +       for (i = first_fb_vc; i <= last_fb_vc; i++) {
> > +               vc = vc_cons[i].d;
> > +               if (!vc || vc->vc_mode != KD_TEXT ||
> > +                          registered_fb[con2fb_map[i]] != info)

Looks like registered_fb[] is wrong since commit cad564ca557f8d3b
("fbcon: Fix boundary checks for fbcon=vc:n1-n2 parameters")?

> > +                       continue;
> > +
> > +               if (vc->vc_font.width  > FBCON_SWAP(var->rotate, var->xres, var->yres) ||
> > +                   vc->vc_font.height > FBCON_SWAP(var->rotate, var->yres, var->xres))
> > +                       return -EINVAL;
> > +       }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
