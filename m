Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC023CFC6D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 16:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853C06E167;
	Tue, 20 Jul 2021 14:39:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5286E167
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 14:39:43 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 58f26455-e968-11eb-8d1a-0050568cd888;
 Tue, 20 Jul 2021 14:39:54 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 1891E194B81;
 Tue, 20 Jul 2021 16:39:57 +0200 (CEST)
Date: Tue, 20 Jul 2021 16:39:39 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH resend 4/5] video: fbdev: ssd1307fb: Optimize screen
 updates
Message-ID: <YPbgK2t34MlT9THR@ravnborg.org>
References: <20210714145804.2530727-1-geert@linux-m68k.org>
 <20210714145804.2530727-5-geert@linux-m68k.org>
 <YPXQnlpWUa1QaZKd@ravnborg.org>
 <CAMuHMdVyuzQzXF0X3OA=PH4E4ifaT2TfHs76yGgRKk-XrEbwzw@mail.gmail.com>
 <CAMuHMdVpxVJx8=aGasrop6soO011gby8Xxotr+Yomi9oBOTrpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVpxVJx8=aGasrop6soO011gby8Xxotr+Yomi9oBOTrpA@mail.gmail.com>
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

On Tue, Jul 20, 2021 at 11:16:27AM +0200, Geert Uytterhoeven wrote:
> Hi Sam,
> 
> On Tue, Jul 20, 2021 at 9:56 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Mon, Jul 19, 2021 at 9:21 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > > On Wed, Jul 14, 2021 at 04:58:03PM +0200, Geert Uytterhoeven wrote:
> > > > Currently, each screen update triggers an I2C transfer of all screen
> > > > data, up to 1 KiB of data for a 128x64 display, which takes at least 20
> > > > ms in Fast mode.
> > > >
> > > > Reduce the amount of transferred data by only updating the rectangle
> > > > that changed.  Remove the call to ssd1307fb_set_address_range() during
> > > > initialization, as ssd1307fb_update_rect() now takes care of that.
> > > >
> > > > Note that for now the optimized operation is only used for fillrect,
> > > > copyarea, and imageblit, which are used by fbcon.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >
> > > > --- a/drivers/video/fbdev/ssd1307fb.c
> > > > +++ b/drivers/video/fbdev/ssd1307fb.c
> > > > @@ -184,16 +184,18 @@ static int ssd1307fb_set_address_range(struct ssd1307fb_par *par, u8 col_start,
> > > >       return ssd1307fb_write_cmd(par->client, page_end);
> > > >  }
> > > >
> > > > -static int ssd1307fb_update_display(struct ssd1307fb_par *par)
> > > > +static int ssd1307fb_update_rect(struct ssd1307fb_par *par, unsigned int x,
> > > > +                              unsigned int y, unsigned int width,
> > > > +                              unsigned int height)
> > > >  {
> > > >       struct ssd1307fb_array *array;
> > > >       u8 *vmem = par->info->screen_buffer;
> > > >       unsigned int line_length = par->info->fix.line_length;
> > > > -     unsigned int pages = DIV_ROUND_UP(par->height, 8);
> > > > +     unsigned int pages = DIV_ROUND_UP(height + y % 8, 8);
> > >
> > > Add () like this - at least it helps me:
> > > > +     unsigned int pages = DIV_ROUND_UP((height + y) % 8, 8);
> >
> > Thanks, that's actually a genuine bug.
> 
> No it's not "(height + y) % 8" is wrong.
> 
> Better if I reorder the operands like below?
> 
>     unsigned int pages = DIV_ROUND_UP(y % 8 + height, 8);

Yep, then I would not be fooled so easy.

	Sam
