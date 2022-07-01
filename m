Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9043563622
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 16:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E71111A355;
	Fri,  1 Jul 2022 14:50:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895E611A05F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 14:50:06 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id ay10so563084qtb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 07:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gNmMPejZxFSddU5yd/bVeRCt+NvlGBtVWJ+UptuK+EM=;
 b=XO0lGJnWs4atvg+QXZLolXXl81Cm7muGn/+LbB9ZQ/QhloPPgvtBWC4XIRPFr/JSrJ
 GLg2w56zRLQ/nyeAXUqFBMDYKiJnif2Q8SqFgEJwjYpwj9kACDgBe01KLNn3uBm5LFoh
 5L3/2R3Hk/7f8kw2CiSYIeeL3jh+5Y7qn34CpuB92xSQVov93SrpzAo745ZQcVppBs7w
 Mwghdsu84hJQr4YLeZsULi8vP5v8QLisjqljzSxih7PjIZpAv1Iiwy+A8Gjsf6dl5jW6
 IBL0dzVNwS3vS7YcqDE3U0PPNWbWhf8e2bIaWGTjMDXyRlVzAh26FLTVXoGGBKdrgFN1
 FV7g==
X-Gm-Message-State: AJIora+4nMIKct61vjwYpu5upcUrstQ7u9FP9pH9zRB6/o82GwUX1H3W
 llUOTGYfLubhAJx7U0lfTs1aKjO5zAL4YA==
X-Google-Smtp-Source: AGRyM1vwwmE0wqhXo7jtsOZSyWQk3g50PnbJI9kpznHmhdvkIrT43w3nxw+7PlhuyvGWGmM/HqvKHA==
X-Received: by 2002:a05:622a:610:b0:307:c8bc:2e2d with SMTP id
 z16-20020a05622a061000b00307c8bc2e2dmr12624917qta.321.1656687005304; 
 Fri, 01 Jul 2022 07:50:05 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com.
 [209.85.128.175]) by smtp.gmail.com with ESMTPSA id
 a5-20020ac85b85000000b00307cb34aa8asm16002940qta.47.2022.07.01.07.50.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Jul 2022 07:50:05 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-31780ad7535so25906277b3.8
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 07:50:04 -0700 (PDT)
X-Received: by 2002:a81:a092:0:b0:318:5c89:a935 with SMTP id
 x140-20020a81a092000000b003185c89a935mr17867481ywg.383.1656687004729; Fri, 01
 Jul 2022 07:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220629200024.187187-1-deller@gmx.de>
 <20220629200024.187187-5-deller@gmx.de>
 <CAMuHMdVJ0PsDyTdGoOHPOKdaR7AffG2FpFmw6fxoNdXx9y-J4A@mail.gmail.com>
 <1ba5f6d6-1c31-a8fb-867b-e2a7fda7da56@gmx.de>
 <CAMuHMdVMp-ywWmDevdZTwHHhdiHnsFhze376guTEMd1T=tb-Pg@mail.gmail.com>
In-Reply-To: <CAMuHMdVMp-ywWmDevdZTwHHhdiHnsFhze376guTEMd1T=tb-Pg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 1 Jul 2022 16:49:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVs1J0kvA2Kinx121vF=35dUEY+1Jrx3sjF3NHoD=wMfQ@mail.gmail.com>
Message-ID: <CAMuHMdVs1J0kvA2Kinx121vF=35dUEY+1Jrx3sjF3NHoD=wMfQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] fbmem: Prevent invalid virtual screen sizes in
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

On Thu, Jun 30, 2022 at 9:38 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Jun 30, 2022 at 9:17 PM Helge Deller <deller@gmx.de> wrote:
> > On 6/30/22 21:11, Geert Uytterhoeven wrote:
> > > On Wed, Jun 29, 2022 at 10:00 PM Helge Deller <deller@gmx.de> wrote:
> > >> Prevent that drivers configure a virtual screen resolution smaller than
> > >> the physical screen resolution.  This is important, because otherwise we
> > >> may access memory outside of the graphics memory area.
> > >>
> > >> Signed-off-by: Helge Deller <deller@gmx.de>
> > >> Cc: stable@vger.kernel.org # v5.4+
> > >
> > > Thanks for your patch!
> > >
> > >> --- a/drivers/video/fbdev/core/fbmem.c
> > >> +++ b/drivers/video/fbdev/core/fbmem.c
> > >> @@ -1006,6 +1006,12 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
> > >>         if (var->xres < 8 || var->yres < 8)
> > >>                 return -EINVAL;
> > >>
> > >> +       /* make sure virtual resolution >= physical resolution */
> > >> +       if (WARN_ON(var->xres_virtual < var->xres))
> > >> +               var->xres_virtual = var->xres;
> > >> +       if (WARN_ON(var->yres_virtual < var->yres))
> > >> +               var->yres_virtual = var->yres;
> > >
> > > This should be moved below the call to info->fbops->fb_check_var(),
> > > so the WARN_ON() catches buggy fbdev drivers, not userspace fuzzers.
> >
> > Yes, makes sense.
>
> And print the name of the frame buffer device driver, so people know
> who to blame.

Or better, do not continue, but return with a failure:

    if (WARN(var->xres_virtual < var->xres || var->yres_virtual < var->yres,
        "%ps for %s is broken\n", info->fbops->fb_check_var, info->fix.id)
            return -EINVAL;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
