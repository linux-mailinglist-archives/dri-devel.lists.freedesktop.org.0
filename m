Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2923CF586
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 09:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25366E22F;
	Tue, 20 Jul 2021 07:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB906E2D7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 07:51:44 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id r18so10770329vsa.4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 00:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DZMv92PNWEyH/QL4ILLkJC90/ugfFVFAmOpTreas0WA=;
 b=SrjItpoO8uvdyuTryUZ6NxdnQVD2oiF4llY/5JBB3WHSb9/OidL5hXS2zD5/k77nxL
 E8yu3plUjVbRG2YX0o56kcJfm+ACr2TbdRX/oN7TBGVpsSSfUGz9MiRaI4OFuFaQWkJ6
 5ttNTuXFYkQ/fvoVxu/9SyHsn+Zjp4bRau4tFHerLfz3QOFpfoEKV9KlFdf8UdHxGDEB
 6z+mutY7yTgHWzwsA9YUBGO14pE2bfe+I8LF5PPZLBymdsq17wjmBK9ml6LrdS6D/w8B
 g2ddOQEU0ZbEos3bh8t5ihcijtrgDHoPWagYT+1ViOEjkgwFGAGEg7TGHUQTIiPIT3rB
 HFRg==
X-Gm-Message-State: AOAM530kMrpt/rQ+eCCMfc185/sCj2ongMqa5BqOnqsnmMw/cQaGIzV0
 3M6+q+Ly2Fu77YJYx7dq1wOMf5dwZ1ARVQn0X94=
X-Google-Smtp-Source: ABdhPJy5ykCKOa7GH2xtwasEaNh2q+NOLASUypUGJI2+3KRHExc/ycIzEpJaXbEHJmfx54Z9yxO7Ae8R7oW52MzL2T8=
X-Received: by 2002:a05:6102:321c:: with SMTP id
 r28mr28150910vsf.40.1626767503947; 
 Tue, 20 Jul 2021 00:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210714145804.2530727-1-geert@linux-m68k.org>
 <20210714145804.2530727-4-geert@linux-m68k.org>
 <YPXNdJNpYoPSpxSb@ravnborg.org>
In-Reply-To: <YPXNdJNpYoPSpxSb@ravnborg.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jul 2021 09:51:32 +0200
Message-ID: <CAMuHMdUJsLMErGYkr8M3y+yGtVd1YhHAmir2_FEOC7n3=9-yfA@mail.gmail.com>
Subject: Re: [PATCH resend 3/5] video: fbdev: ssd1307fb: Extract
 ssd1307fb_set_address_range()
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

On Mon, Jul 19, 2021 at 9:07 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> On Wed, Jul 14, 2021 at 04:58:02PM +0200, Geert Uytterhoeven wrote:
> > Extract the code to set the column and page ranges into a helper
> > function.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> >  drivers/video/fbdev/ssd1307fb.c | 61 +++++++++++++++++++--------------
> >  1 file changed, 36 insertions(+), 25 deletions(-)
> >
> > diff --git a/drivers/video/fbdev/ssd1307fb.c b/drivers/video/fbdev/ssd1307fb.c
> > index 6d7bd025bca1a175..cfa27ea0feab4f01 100644
> > --- a/drivers/video/fbdev/ssd1307fb.c
> > +++ b/drivers/video/fbdev/ssd1307fb.c
> > @@ -152,6 +152,38 @@ static inline int ssd1307fb_write_cmd(struct i2c_client *client, u8 cmd)
> >       return ret;
> >  }
> >
> > +static int ssd1307fb_set_address_range(struct ssd1307fb_par *par, u8 col_start,
> > +                                    u8 cols, u8 page_start, u8 pages)
> > +{
> Bikeshedding, but I think a dedicated function for col_range and another
> for page_range had been simpler to read.

I agree.
Originally, before I removed the call during initialization, there were
two calls to this function, so it made sense to have a single function.

> With or wihout this change:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
