Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FFA3CF59D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 09:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B1E6E077;
	Tue, 20 Jul 2021 07:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5DB6E077
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 07:57:03 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id x22so8956849vsq.5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 00:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u76ZFso6QMLrbaHGGcoA+mUtQA4GgwHmW+WhPdmK3Xk=;
 b=Uzydf3nZyS3Yvc1dWNVyLBIMg5bCYXZA5fl66Nfkyhr3UGBDJICYNzcqhYBLtMojo6
 JSMZUzciE6b0pJTQaq5BePpdxjBBaGY0+EUdkDGOTQZE06Gqnr6Sni/sRvK39dfD+sag
 CVESR9nF+OMMXxS1R0wEI+l2T/8QjyGGU1j0jFz6bo/OClgaoLRu81nyK6iNCAZ/W+R+
 p+VSMFQK2WTfbLN+BthBl7YUQzSJRM1+iyYBDY8wvZgDiIfKp1dEwCbTNCX39l1z2EXY
 HONLYP/Q2CR56vwZWwNtXE+uJ6sLV2+txtP1GradZE74YkNJEksvdcBDZdvXTxQSwvUz
 4/7Q==
X-Gm-Message-State: AOAM531mBucA93C2FEAbCcwXc3MUVbup5bzVYfBz/0u4VTWwhX2oRGGh
 tiVfN0cPVzLAG3Y83jB1Xr7awOMYy6oPBYHfpEM=
X-Google-Smtp-Source: ABdhPJyraCkn1488rWpkxZYL7ZH8R1r3G5CQ45R3Arx+9chg4x8zFL4cnxbqoC1QMarh/xMlberMMdgRC4Gq/ndBVro=
X-Received: by 2002:a05:6102:2828:: with SMTP id
 ba8mr28144523vsb.18.1626767823268; 
 Tue, 20 Jul 2021 00:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210714145804.2530727-1-geert@linux-m68k.org>
 <20210714145804.2530727-5-geert@linux-m68k.org>
 <YPXQnlpWUa1QaZKd@ravnborg.org>
In-Reply-To: <YPXQnlpWUa1QaZKd@ravnborg.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jul 2021 09:56:52 +0200
Message-ID: <CAMuHMdVyuzQzXF0X3OA=PH4E4ifaT2TfHs76yGgRKk-XrEbwzw@mail.gmail.com>
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

On Mon, Jul 19, 2021 at 9:21 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> On Wed, Jul 14, 2021 at 04:58:03PM +0200, Geert Uytterhoeven wrote:
> > Currently, each screen update triggers an I2C transfer of all screen
> > data, up to 1 KiB of data for a 128x64 display, which takes at least 20
> > ms in Fast mode.
> >
> > Reduce the amount of transferred data by only updating the rectangle
> > that changed.  Remove the call to ssd1307fb_set_address_range() during
> > initialization, as ssd1307fb_update_rect() now takes care of that.
> >
> > Note that for now the optimized operation is only used for fillrect,
> > copyarea, and imageblit, which are used by fbcon.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

> > --- a/drivers/video/fbdev/ssd1307fb.c
> > +++ b/drivers/video/fbdev/ssd1307fb.c
> > @@ -184,16 +184,18 @@ static int ssd1307fb_set_address_range(struct ssd1307fb_par *par, u8 col_start,
> >       return ssd1307fb_write_cmd(par->client, page_end);
> >  }
> >
> > -static int ssd1307fb_update_display(struct ssd1307fb_par *par)
> > +static int ssd1307fb_update_rect(struct ssd1307fb_par *par, unsigned int x,
> > +                              unsigned int y, unsigned int width,
> > +                              unsigned int height)
> >  {
> >       struct ssd1307fb_array *array;
> >       u8 *vmem = par->info->screen_buffer;
> >       unsigned int line_length = par->info->fix.line_length;
> > -     unsigned int pages = DIV_ROUND_UP(par->height, 8);
> > +     unsigned int pages = DIV_ROUND_UP(height + y % 8, 8);
>
> Add () like this - at least it helps me:
> > +     unsigned int pages = DIV_ROUND_UP((height + y) % 8, 8);

Thanks, that's actually a genuine bug.

> > @@ -226,13 +228,18 @@ static int ssd1307fb_update_display(struct ssd1307fb_par *par)
> >        *  (5) A4 B4 C4 D4 E4 F4 G4 H4
> >        */
> >
> > -     for (i = 0; i < pages; i++) {
> > +     ret = ssd1307fb_set_address_range(par, par->col_offset + x, width,
> > +                                       par->page_offset + y / 8, pages);
> > +     if (ret < 0)
> > +             goto out_free;
> > +
> > +     for (i = y / 8; i < y / 8 + pages; i++) {
> >               int m = 8;
> >
> >               /* Last page may be partial */
> > -             if (i + 1 == pages && par->height % 8)
> > +             if (8 * (i + 1) > par->height)
> >                       m = par->height % 8;
> As before, this looks wrong to me.

Let's sort that out in the other thread...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
