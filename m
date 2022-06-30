Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 310B1562352
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 21:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5944010E182;
	Thu, 30 Jun 2022 19:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA73D112794
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 19:38:59 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id b125so15177373qkg.11
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rkKYgFZp/qSKYESmXqwsAioaMLByN2eEJsgXebEsRR0=;
 b=7jgm7r/43iR17r2txOksZKMyRLvVNcFCmlVOVH3raunnjBLsJcAiRiD/eB2oswYmZL
 KTjKxin+kgIPlvCoDYNgzTlsGstYFLNGcrZvPVuAzU05F/acQTTfEbf8HI93UufLIdal
 QiDiPOYL/pIUi1uTyyjF//nm07xZppRuOHZA+BkSlFliKEMwBGDn/i8H1muXYAPGZIVY
 zYu87Z2ScrNjVMSJXp0yVuqGK+uyCt19DzcVoIacnzqUMZboKUBc6LFtzTcoxJgvDkFT
 TgWNR3UuVXNZqrb9SsaYMShzG9gQc/EfSPPWq3jr+OFwQ8KmcSSS6uOwZCXiZF3L/+5D
 W6Fw==
X-Gm-Message-State: AJIora98R3I56H3yIvNZ3FTFfttfu4myahWJdKHJpwupKpUN1JSU/PNL
 M3G9sn7RorIWMDZKsLEF8yX8CV8zD2cdEw==
X-Google-Smtp-Source: AGRyM1sizVkB5hDCp8y8bvFwOSuB10D9CcfGGZGnzH0E6PJrWDFNwK6/nfcwORiiuup7TxK/r+1raQ==
X-Received: by 2002:a05:620a:4e9:b0:6a7:8357:303d with SMTP id
 b9-20020a05620a04e900b006a78357303dmr7913550qkh.105.1656617938717; 
 Thu, 30 Jun 2022 12:38:58 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com.
 [209.85.128.179]) by smtp.gmail.com with ESMTPSA id
 t15-20020ac865cf000000b0031aaf05420fsm7991352qto.57.2022.06.30.12.38.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 12:38:58 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-318889e6a2cso3710797b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:38:58 -0700 (PDT)
X-Received: by 2002:a81:574c:0:b0:317:7c3a:45be with SMTP id
 l73-20020a81574c000000b003177c3a45bemr12091300ywb.316.1656617938226; Thu, 30
 Jun 2022 12:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220629200024.187187-1-deller@gmx.de>
 <20220629200024.187187-5-deller@gmx.de>
 <CAMuHMdVJ0PsDyTdGoOHPOKdaR7AffG2FpFmw6fxoNdXx9y-J4A@mail.gmail.com>
 <1ba5f6d6-1c31-a8fb-867b-e2a7fda7da56@gmx.de>
In-Reply-To: <1ba5f6d6-1c31-a8fb-867b-e2a7fda7da56@gmx.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jun 2022 21:38:47 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMp-ywWmDevdZTwHHhdiHnsFhze376guTEMd1T=tb-Pg@mail.gmail.com>
Message-ID: <CAMuHMdVMp-ywWmDevdZTwHHhdiHnsFhze376guTEMd1T=tb-Pg@mail.gmail.com>
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

On Thu, Jun 30, 2022 at 9:17 PM Helge Deller <deller@gmx.de> wrote:
> On 6/30/22 21:11, Geert Uytterhoeven wrote:
> > On Wed, Jun 29, 2022 at 10:00 PM Helge Deller <deller@gmx.de> wrote:
> >> Prevent that drivers configure a virtual screen resolution smaller than
> >> the physical screen resolution.  This is important, because otherwise we
> >> may access memory outside of the graphics memory area.
> >>
> >> Signed-off-by: Helge Deller <deller@gmx.de>
> >> Cc: stable@vger.kernel.org # v5.4+
> >
> > Thanks for your patch!
> >
> >> --- a/drivers/video/fbdev/core/fbmem.c
> >> +++ b/drivers/video/fbdev/core/fbmem.c
> >> @@ -1006,6 +1006,12 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
> >>         if (var->xres < 8 || var->yres < 8)
> >>                 return -EINVAL;
> >>
> >> +       /* make sure virtual resolution >= physical resolution */
> >> +       if (WARN_ON(var->xres_virtual < var->xres))
> >> +               var->xres_virtual = var->xres;
> >> +       if (WARN_ON(var->yres_virtual < var->yres))
> >> +               var->yres_virtual = var->yres;
> >
> > This should be moved below the call to info->fbops->fb_check_var(),
> > so the WARN_ON() catches buggy fbdev drivers, not userspace fuzzers.
>
> Yes, makes sense.

And print the name of the frame buffer device driver, so people know
who to blame.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
