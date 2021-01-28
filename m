Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F83A3072F9
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 10:43:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A41F66E0DC;
	Thu, 28 Jan 2021 09:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EFD6E0DC
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 09:43:07 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id h192so5402742oib.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 01:43:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0UQD5rzLUItAad2Pj4MS3WUwxXLDc49HJgM9YhC9w4E=;
 b=XSOTuHKDFSxCnX694Ro7XpRYEhH9/jcMarxNSK6sMH8G9oPI0EKt9TWWmZHqUvkJrb
 IwnYX4EHnmyOb+vdExZCS1GSgbIsFnWvj925Ya+y/E95vdc8nm4lFOsZ4LbbRfwO3JxN
 R5Rqa4emVcZnJ0cgbrpXPdoNlgcIo5TIL6Ycr3iJ7ZIKfsZlA2nRQ0TrD1Yef/EyXysn
 m9TYSmzrmE/6qEROw6cOcdmPyHOXV0VaUr//XGYMZunur6Avcr0OwjNrLKdh2rs+KZ4n
 /JdovSrpDb+Pqfb88SB8rTfESA+gVPmuUX7z6dov1Ecaw5dGhKWTWmac5MXX2cwTRVqp
 0wOA==
X-Gm-Message-State: AOAM530FnNJn1eZA+hoZXyAOm8wz4LEFly6Db/VtSsx9x2vsFwsJALmr
 bUDXAWehAJ57kD+Saue6Q3NHgl+O6Ug5ZUQWP2s=
X-Google-Smtp-Source: ABdhPJxoZOzI4xZTWdYHcsO/prgFXGQqxvTaD/BSBKbTP3NgRRBKa973/1xtxNzdsgrR5mdE52PMmLLYLmNTUlRGhEM=
X-Received: by 2002:aca:1219:: with SMTP id 25mr6108127ois.54.1611826986355;
 Thu, 28 Jan 2021 01:43:06 -0800 (PST)
MIME-Version: 1.0
References: <1611754972-151016-1-git-send-email-zhangxuezhi3@gmail.com>
 <20210127223222.3lavtl3roc4cabso@kari-VirtualBox>
 <20210128094258.000012c3@gmail.com>
 <20210128065233.ji4b7ea54ihyu2l5@kari-VirtualBox>
In-Reply-To: <20210128065233.ji4b7ea54ihyu2l5@kari-VirtualBox>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 28 Jan 2021 10:42:54 +0100
Message-ID: <CAMuHMdWK0wbMVJNwSW=pafsyjDVg14h2AX=haJeAkyivehP=JQ@mail.gmail.com>
Subject: Re: [PATCH v10] staging: fbtft: add tearing signal detect
To: Kari Argillander <kari.argillander@gmail.com>
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
Cc: driverdevel <devel@driverdev.osuosl.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 mh12gx2825@gmail.com, Greg KH <gregkh@linuxfoundation.org>,
 oliver.graute@kococonnector.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Stefano Brivio <sbrivio@redhat.com>, carlis <zhangxuezhi3@gmail.com>,
 Colin King <colin.king@canonical.com>, zhangxuezhi1@yulong.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kari,

On Thu, Jan 28, 2021 at 7:53 AM Kari Argillander
<kari.argillander@gmail.com> wrote:
> On Thu, Jan 28, 2021 at 09:42:58AM +0800, carlis wrote:
> > On Thu, 28 Jan 2021 00:32:22 +0200
> > Kari Argillander <kari.argillander@gmail.com> wrote:
> > > >  #include "fbtft.h"
> > > >
> > > >  #define DRVNAME "fb_st7789v"
> > > > @@ -66,6 +69,32 @@ enum st7789v_command {
> > > >  #define MADCTL_MX BIT(6) /* bitmask for column address order */
> > > >  #define MADCTL_MY BIT(7) /* bitmask for page address order */
> > > >
> > > > +#define SPI_PANEL_TE_TIMEOUT     400 /* msecs */
> > > > +static struct mutex te_mutex;/* mutex for set te gpio irq status
> > > > */
> > >
> > > Space after ;
> > hi, i have fix it in the patch v11
> > >
>
> Yeah sorry. I accidentally review wrong patch. But mostly stuff are
> still relevant.
>
> > > > @@ -82,6 +111,33 @@ enum st7789v_command {
> > > >   */
> > > >  static int init_display(struct fbtft_par *par)
> > > >  {
> > > > + int rc;
> > > > + struct device *dev = par->info->device;
> > > > +
> > > > + par->gpio.te = devm_gpiod_get_index_optional(dev, "te", 0,
> > > > GPIOD_IN);
> > > > + if (IS_ERR(par->gpio.te)) {
> > > > +         rc = PTR_ERR(par->gpio.te);
> > > > +         dev_err(par->info->device, "Failed to request te
> > > > gpio: %d\n", rc);
> > > > +         return rc;
> > > > + }
> > >
> > > You request with optinal and you still want to error out? We could
> > > just continue and not care about that error. User will be happier if
> > > device still works somehow.

devm_gpiod_get_index_optional() returns NULL, not an error, if the
GPIO is not found.  So if IS_ERR() is the right check.

And checks for -EPROBE_DEFER can be handled automatically
by using dev_err_probe() instead of dev_err().

> > You mean i just delete this dev_err print ?!
> > like this:
> >       par->gpio.te = devm_gpiod_get_index_optional(dev, "te",
> > 0,GPIOD_IN);
> >         if (IS_ERR(par->gpio.te))
> >               return PTR_ERR(par->gpio.te);
>
> Not exactly. I'm suggesting something like this.
>
> if (IS_ERR(par->gpio.te) == -EPROBE_DEFER) {
>         return -EPROBE_DEFER;
>
> if (IS_ERR(par->gpio.te))
>         par-gpio.te = NULL;
>
> This like beginning of your patch series but the difference is that if
> EPROBE_DEFER then we will try again later. Any other error and we will
> just ignore TE gpio. But this is up to you what you want to do. To me
> this just seems place where this kind of logic can work.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
