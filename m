Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 008633CFC82
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 16:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360EF6E40A;
	Tue, 20 Jul 2021 14:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81AD86E40A
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 14:41:14 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 88b76b19-e968-11eb-9082-0050568c148b;
 Tue, 20 Jul 2021 14:41:14 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id B9164194B81;
 Tue, 20 Jul 2021 16:41:27 +0200 (CEST)
Date: Tue, 20 Jul 2021 16:41:10 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH resend 2/5] video: fbdev: ssd1307fb: Simplify
 ssd1307fb_update_display()
Message-ID: <YPbghruIuCIZFe1o@ravnborg.org>
References: <20210714145804.2530727-1-geert@linux-m68k.org>
 <20210714145804.2530727-3-geert@linux-m68k.org>
 <YPXM8AXNje7GXf+i@ravnborg.org>
 <CAMuHMdXgKkJeTstLdwh9h8ywe0a5=77izAW4eYyaOtk8ktSjWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXgKkJeTstLdwh9h8ywe0a5=77izAW4eYyaOtk8ktSjWg@mail.gmail.com>
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

Hi Geert,

On Tue, Jul 20, 2021 at 09:43:22AM +0200, Geert Uytterhoeven wrote:
> Hi Sam,
> 
> On Mon, Jul 19, 2021 at 9:05 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > On Wed, Jul 14, 2021 at 04:58:01PM +0200, Geert Uytterhoeven wrote:
> > > Simplify the nested loops to handle conversion from linear frame buffer
> > > to ssd1307 page layout:
> > >   1. Move last page handling one level up, as the value of "m" is the
> > >      same inside a page,
> > >   2. array->data[] is filled linearly, so there is no need to
> > >      recalculate array_idx over and over again; a simple increment is
> > >      sufficient.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > ---
> > >  drivers/video/fbdev/ssd1307fb.c | 17 ++++++++++-------
> > >  1 file changed, 10 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
> > > index e6b6263e3bef847f..6d7bd025bca1a175 100644
> > > --- a/drivers/video/fbdev/ssd1307fb.c
> > > +++ b/drivers/video/fbdev/ssd1307fb.c
> > > @@ -158,6 +158,7 @@ static int ssd1307fb_update_display(struct ssd1307fb_par *par)
> > >       u8 *vmem = par->info->screen_buffer;
> > >       unsigned int line_length = par->info->fix.line_length;
> > >       unsigned int pages = DIV_ROUND_UP(par->height, 8);
> > > +     u32 array_idx = 0;
> > >       int ret, i, j, k;
> > >
> > >       array = ssd1307fb_alloc_array(par->width * pages, SSD1307FB_DATA);
> > > @@ -194,19 +195,21 @@ static int ssd1307fb_update_display(struct ssd1307fb_par *par)
> > >        */
> > >
> > >       for (i = 0; i < pages; i++) {
> > > +             int m = 8;
> > > +
> > > +             /* Last page may be partial */
> > > +             if (i + 1 == pages && par->height % 8)
> > > +                     m = par->height % 8;
> > >               for (j = 0; j < par->width; j++) {
> > > -                     int m = 8;
> > > -                     u32 array_idx = i * par->width + j;
> > > -                     array->data[array_idx] = 0;
> > > -                     /* Last page may be partial */
> > > -                     if (i + 1 == pages && par->height % 8)
> > > -                             m = par->height % 8;
> > > +                     u8 data = 0;
> > > +
> > >                       for (k = 0; k < m; k++) {
> > If the last page is partial then m will be less than 8 for all bytes in
> > j = 0..par-width - but m should only be less than 8 for the last
> > iteration of the loop.
> >
> > Do I miss something or is the code buggy?
> 
> "the loop" is the j-loop?
> If m is less than 8 for the last page, it should be less than 8 for
> all iterations of j, as all last bytes in each "line" (visible
> row) are partial, cfr. the comments above the code, explaining the
> representation of the screen.
OK, then the code works as intended. I had not read the comments and
just assume it was only the last byte that was in need of a special
treatment.
So code is fine:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> 
> > >                               u8 byte = vmem[(8 * i + k) * line_length +
> > >                                              j / 8];
> > >                               u8 bit = (byte >> (j % 8)) & 1;
> > > -                             array->data[array_idx] |= bit << k;
> > > +                             data |= bit << k;
> > >                       }
> > > +                     array->data[array_idx++] = data;
> > >               }
> > >       }
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
