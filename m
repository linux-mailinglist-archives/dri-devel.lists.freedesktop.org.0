Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0725A3CF56E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 09:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752D96E28B;
	Tue, 20 Jul 2021 07:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E641F6E28B
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 07:43:34 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id a66so10755873vsd.10
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 00:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HkbFPSCh7E2GNVgDLGmZQaSXqDJjyX+benlbPIfM6pQ=;
 b=NYcnqq/cbV3gpLZN6AXjfFbOp8B28+vVBo644DiF4wZpoAR64b2UrYHjVOGNRoIXdc
 xYctD/eW4uR0KzqYRB845t7fOvf3AifsiCtQYfre8e/2fX7OhIuUfTvS10t8Bn87wVo5
 mvzp3xHAKGD/MosvyjuKEuk7T6uwm8yqMz1xnyp8MmEdDxn7F4YqR1jhSXLxE7gGt4cW
 B/HMr8HKf3uwkFJ77Uef0nIFq80XPabiQkwThAzXCYOqijbIPh2BIIbUARbdZUSSL8A0
 vThBQy/FHMyYt2bReNj7qiyUfp7/DBOCu5K9blCrqqcZKYJZPpGtZdzolJ25ZmVrFX30
 Y3BA==
X-Gm-Message-State: AOAM530m8Q54d/IMSqB6iX8b1q00h9DXkQ1vdKVtu/EmLDo9JJHPeNbO
 TsdI4x36hjPVWMml7igpzVANcuHjsRhr2ZEIuJk=
X-Google-Smtp-Source: ABdhPJyYlmc3X5ogaM2YCN+ZHjp31T159xYrBHR1iUCbkq8Cwh9HpbKTX06IJtME6LP+AGswyxAbmP74MJhqkDc7akg=
X-Received: by 2002:a05:6102:321c:: with SMTP id
 r28mr28139380vsf.40.1626767013827; 
 Tue, 20 Jul 2021 00:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210714145804.2530727-1-geert@linux-m68k.org>
 <20210714145804.2530727-3-geert@linux-m68k.org>
 <YPXM8AXNje7GXf+i@ravnborg.org>
In-Reply-To: <YPXM8AXNje7GXf+i@ravnborg.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jul 2021 09:43:22 +0200
Message-ID: <CAMuHMdXgKkJeTstLdwh9h8ywe0a5=77izAW4eYyaOtk8ktSjWg@mail.gmail.com>
Subject: Re: [PATCH resend 2/5] video: fbdev: ssd1307fb: Simplify
 ssd1307fb_update_display()
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

On Mon, Jul 19, 2021 at 9:05 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> On Wed, Jul 14, 2021 at 04:58:01PM +0200, Geert Uytterhoeven wrote:
> > Simplify the nested loops to handle conversion from linear frame buffer
> > to ssd1307 page layout:
> >   1. Move last page handling one level up, as the value of "m" is the
> >      same inside a page,
> >   2. array->data[] is filled linearly, so there is no need to
> >      recalculate array_idx over and over again; a simple increment is
> >      sufficient.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> >  drivers/video/fbdev/ssd1307fb.c | 17 ++++++++++-------
> >  1 file changed, 10 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
> > index e6b6263e3bef847f..6d7bd025bca1a175 100644
> > --- a/drivers/video/fbdev/ssd1307fb.c
> > +++ b/drivers/video/fbdev/ssd1307fb.c
> > @@ -158,6 +158,7 @@ static int ssd1307fb_update_display(struct ssd1307fb_par *par)
> >       u8 *vmem = par->info->screen_buffer;
> >       unsigned int line_length = par->info->fix.line_length;
> >       unsigned int pages = DIV_ROUND_UP(par->height, 8);
> > +     u32 array_idx = 0;
> >       int ret, i, j, k;
> >
> >       array = ssd1307fb_alloc_array(par->width * pages, SSD1307FB_DATA);
> > @@ -194,19 +195,21 @@ static int ssd1307fb_update_display(struct ssd1307fb_par *par)
> >        */
> >
> >       for (i = 0; i < pages; i++) {
> > +             int m = 8;
> > +
> > +             /* Last page may be partial */
> > +             if (i + 1 == pages && par->height % 8)
> > +                     m = par->height % 8;
> >               for (j = 0; j < par->width; j++) {
> > -                     int m = 8;
> > -                     u32 array_idx = i * par->width + j;
> > -                     array->data[array_idx] = 0;
> > -                     /* Last page may be partial */
> > -                     if (i + 1 == pages && par->height % 8)
> > -                             m = par->height % 8;
> > +                     u8 data = 0;
> > +
> >                       for (k = 0; k < m; k++) {
> If the last page is partial then m will be less than 8 for all bytes in
> j = 0..par-width - but m should only be less than 8 for the last
> iteration of the loop.
>
> Do I miss something or is the code buggy?

"the loop" is the j-loop?
If m is less than 8 for the last page, it should be less than 8 for
all iterations of j, as all last bytes in each "line" (visible
row) are partial, cfr. the comments above the code, explaining the
representation of the screen.

> >                               u8 byte = vmem[(8 * i + k) * line_length +
> >                                              j / 8];
> >                               u8 bit = (byte >> (j % 8)) & 1;
> > -                             array->data[array_idx] |= bit << k;
> > +                             data |= bit << k;
> >                       }
> > +                     array->data[array_idx++] = data;
> >               }
> >       }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
