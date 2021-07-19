Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD3E3CCEEC
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 09:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6635989F2D;
	Mon, 19 Jul 2021 07:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C422389F2D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 07:53:41 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id z3so3050511uao.9
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 00:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UFrHGkePZup1taj30Rt41mFp0n9XCiwOIs/xt1tbnaw=;
 b=cyHXH8mT8MJMb9WHSTU6G/ZLGKC7I/iRsdq25fVfZ+RCEFqy4Mc7Q99CbnNjJENrN4
 +IWh5rEmxsHNVrpeohyf2lBr5lbvnqC6bvdk+J6F0o0+sSQ8xQWttNbZ2db69Sd07fNH
 u+s1QngmmGbIQ4+ZPxl3iw6HF1n9gY/BQMiwsv4e1DIzB6SnGF0+yox1hR4iw8nyxSNB
 iut5Shh3F4tlvONzdX1tnM4XFIsJ+6oXMT6DBWB1Mqz8Q2NsFK5TPaDFbH5Okjf++k/1
 tLBAuAgeiH9hBSBEIxBsu4rIljZg6/9WYSXeC5CNR5rr0N2xk9GXpz3oRiU26rJkeneL
 igSw==
X-Gm-Message-State: AOAM531PZSFlCDIeIcXWxU3Eb5XAHfAzq/sqqP8S3gHWX16ZgrNt54YL
 2p8JunxeIIDX8h0My+NVpOEyWOSV/AAq7CS0myQ=
X-Google-Smtp-Source: ABdhPJzXmKaiICvApSnCr48W0kVIIhAe0HClSDvRY/+X8t7EqH9YSmdjsOer92Kdg8iWZJTvPkJd3JyN+8IpVFrQ92Y=
X-Received: by 2002:a9f:3f0d:: with SMTP id h13mr24866271uaj.100.1626681220672; 
 Mon, 19 Jul 2021 00:53:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210718133920.15825-1-len.baker@gmx.com>
 <CAHp75VeEA0=KFsfdjCnBm-b9+F+NnFWJ38nkh+qtb85XdXVWog@mail.gmail.com>
In-Reply-To: <CAHp75VeEA0=KFsfdjCnBm-b9+F+NnFWJ38nkh+qtb85XdXVWog@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Jul 2021 09:53:29 +0200
Message-ID: <CAMuHMdXnhzumSrr=MAkv5nwY2o8xCa4s5zKa9meJTuo0r9yABw@mail.gmail.com>
Subject: Re: [PATCH] staging/fbtft: Remove all strcpy() uses
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
Cc: "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Phil Reid <preid@electromag.com.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Len Baker <len.baker@gmx.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 18, 2021 at 9:43 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Sun, Jul 18, 2021 at 4:43 PM Len Baker <len.baker@gmx.com> wrote:
> > strcpy() performs no bounds checking on the destination buffer. This
> > could result in linear overflows beyond the end of the buffer, leading
> > to all kinds of misbehaviors. The safe replacement is strscpy() but in
> > this case it is simpler to add NULL to the first position since we want

"NULL" is a pointer value, "NUL" is the character with value zero.

> > to empty the string.
>
> > This is a previous step in the path to remove the strcpy() function.
>
> Any document behind this (something to read on the site(s) more or
> less affiliated with what is going to happen in the kernel) to read
> background?
>
> ...
>
> >                 case -1:
> >                         i++;
> >                         /* make debug message */
> > -                       strcpy(msg, "");

While this strcpy() is provably safe at compile-time, and will probably
be replaced by an assignment to zero by the compiler...

> > +                       msg[0] = 0;
>
> Strictly speaking it should be '\0'.
>
> >                         j = i + 1;
> >                         while (par->init_sequence[j] >= 0) {
> >                                 sprintf(str, "0x%02X ", par->init_sequence[j]);

... the real danger is the

        strcat(msg, str);

on the next line.
Fortunately this whole debug printing block (including the strcpy)
can (and should) be rewritten to just use "%*ph".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
