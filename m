Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D32123CF6B3
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 11:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990766E196;
	Tue, 20 Jul 2021 09:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2D76E196
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 09:16:39 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id a22so10943379vso.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 02:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pGK4Y9q1wNdkFd2qkEzt4SoJHeKZj51kb/6+Vc2cCrE=;
 b=LbDyt8JZdn9BGK+RfSH+kYB3yUBrfza94JP09eUfMUlZwNg2kajE1tE2klOcY/Vy/L
 YxTG1NM1RzEkBhsYp8m/EaTDr6Ge4XDSD3IRx20Dcs2At8tvkkc1V8ArlZ10+GtIwYy0
 Xc26XtRHrlaY2/0oL8rCvC1RmAgKgC95eifVsJXD/E/C3ogbMVw2z9e5xz2ofA8CHmxQ
 4Zm+d0AfvyzsKjbNXCxOXtcbPDovNc3uFwqqidGQU+x0cEty3XSLMx3dlEr75NsVEXAx
 V8dMCWf3j8dqaBWwBpl49Wa0y1UNjGB0J2Mfu5GBc2zVPpSHhqv92MJsWRg0IZP+5j1W
 4pUQ==
X-Gm-Message-State: AOAM530dMiC9O1QbJsKgG8+nVJawa8oj3PfRBI5U6opitmZLxp2PqcHn
 cscpIGghtcI6uD0lQ0IiJxxoUQ/Y1ivoGdp2V1Q=
X-Google-Smtp-Source: ABdhPJwoXV/bWgXqVc9IJcEEctt4YRmAEI9f2fx6tde3GwJo5sjH+AcIOE8BcMkUYIB6TTzpfyMnpZ0rvcI6B2cggsM=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr27684696vsd.42.1626772598880; 
 Tue, 20 Jul 2021 02:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210714145804.2530727-1-geert@linux-m68k.org>
 <20210714145804.2530727-5-geert@linux-m68k.org>
 <YPXQnlpWUa1QaZKd@ravnborg.org>
 <CAMuHMdVyuzQzXF0X3OA=PH4E4ifaT2TfHs76yGgRKk-XrEbwzw@mail.gmail.com>
In-Reply-To: <CAMuHMdVyuzQzXF0X3OA=PH4E4ifaT2TfHs76yGgRKk-XrEbwzw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jul 2021 11:16:27 +0200
Message-ID: <CAMuHMdVpxVJx8=aGasrop6soO011gby8Xxotr+Yomi9oBOTrpA@mail.gmail.com>
Subject: Re: [PATCH resend 4/5] video: fbdev: ssd1307fb: Optimize screen
 updates
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Tue, Jul 20, 2021 at 9:56 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Jul 19, 2021 at 9:21 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > On Wed, Jul 14, 2021 at 04:58:03PM +0200, Geert Uytterhoeven wrote:
> > > Currently, each screen update triggers an I2C transfer of all screen
> > > data, up to 1 KiB of data for a 128x64 display, which takes at least 20
> > > ms in Fast mode.
> > >
> > > Reduce the amount of transferred data by only updating the rectangle
> > > that changed.  Remove the call to ssd1307fb_set_address_range() during
> > > initialization, as ssd1307fb_update_rect() now takes care of that.
> > >
> > > Note that for now the optimized operation is only used for fillrect,
> > > copyarea, and imageblit, which are used by fbcon.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> > > --- a/drivers/video/fbdev/ssd1307fb.c
> > > +++ b/drivers/video/fbdev/ssd1307fb.c
> > > @@ -184,16 +184,18 @@ static int ssd1307fb_set_address_range(struct ssd1307fb_par *par, u8 col_start,
> > >       return ssd1307fb_write_cmd(par->client, page_end);
> > >  }
> > >
> > > -static int ssd1307fb_update_display(struct ssd1307fb_par *par)
> > > +static int ssd1307fb_update_rect(struct ssd1307fb_par *par, unsigned int x,
> > > +                              unsigned int y, unsigned int width,
> > > +                              unsigned int height)
> > >  {
> > >       struct ssd1307fb_array *array;
> > >       u8 *vmem = par->info->screen_buffer;
> > >       unsigned int line_length = par->info->fix.line_length;
> > > -     unsigned int pages = DIV_ROUND_UP(par->height, 8);
> > > +     unsigned int pages = DIV_ROUND_UP(height + y % 8, 8);
> >
> > Add () like this - at least it helps me:
> > > +     unsigned int pages = DIV_ROUND_UP((height + y) % 8, 8);
>
> Thanks, that's actually a genuine bug.

No it's not "(height + y) % 8" is wrong.

Better if I reorder the operands like below?

    unsigned int pages = DIV_ROUND_UP(y % 8 + height, 8);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
