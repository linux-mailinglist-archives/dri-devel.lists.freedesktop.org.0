Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B215143200
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 20:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E294C6EA75;
	Mon, 20 Jan 2020 19:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C126EA75
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 19:12:45 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id c16so348907oic.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 11:12:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jjq97LN7paeiNndMMU1ClIoeahA1RUutU+l84dotge4=;
 b=GBZ6XZu01olAW3OTt+4j6GJS4S78Wd/5bB6jMSbpC+BgCuDvpwDzOJGjQIyazdwXTM
 5UBT7Xv3B97eiDXaHzx1H89yFGbOlv0Hg9QEwyf3C0V2vl9/01bVtdajlrkcN0B/HJAz
 TC309LHGBJmwucnVum/rUVQ2NcFkFBxqmyLsQ54k0L1HuFH7FO2Yj47Xg1aYErTgkvs1
 BSDY3mB8KwBL2O39+iB2OV3BrTGKSV8sKoqmE0nmgoi6Maw48QwsMtZEkWnDYPt38HVs
 5cDxm3Rc1yULbmFzF0uE3JvqKRYtxsw52qeCwxZthmCneVDWE+wl9ZOakYmGreJ0kf7s
 VG/A==
X-Gm-Message-State: APjAAAWv+ZOzn0UmmGz6JdkS/1pF0yHjDBhZR9GXsD8kjfd9h8kfSKjf
 Gr5mJqTHqZYYRogFJdzEy4I1OfSyRSEV4otQW44=
X-Google-Smtp-Source: APXvYqx+QeBZerMZYsQXGnGVyHkqjvt/cNaN/+PihgCyBaDh1UaA25j/U0wI+4upj1pGyuPi7vWximhYHGkwDegIB+8=
X-Received: by 2002:aca:5905:: with SMTP id n5mr287272oib.54.1579547564535;
 Mon, 20 Jan 2020 11:12:44 -0800 (PST)
MIME-Version: 1.0
References: <20180802193909.GA11443@ravnborg.org>
 <20180802194536.10820-2-sam@ravnborg.org>
 <CAMuHMdVP4UwGYuNcOphPO9F2pSCaHS1j-ODxYrv_LNOoo_4coA@mail.gmail.com>
 <20200120184804.GA7630@ravnborg.org>
In-Reply-To: <20200120184804.GA7630@ravnborg.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Jan 2020 20:12:23 +0100
Message-ID: <CAMuHMdWR-EY+yBaOu_pL=5mfwi=ra76YwTt5d+GZ3Qy-e7Evzw@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] pardata: new bus for parallel data access
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Mon, Jan 20, 2020 at 7:48 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> On Mon, Jan 20, 2020 at 11:10:37AM +0100, Geert Uytterhoeven wrote:
> > On Thu, Aug 2, 2018 at 9:46 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > > The pardata supports implement a simple bus for devices
> > > that are connected using a parallel bus driven by GPIOs.
> > > The is often used in combination with simple displays
> > > that is often seen in older embedded designs.
> > > There is a demand for this support also in the linux
> > > kernel for HW designs that uses these kind of displays.
> > >
> > > The pardata bus uses a platfrom_driver that when probed
> > > creates devices for all child nodes in the DT,
> > > which are then supposed to be handled by pardata_drivers.
> > >
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> >
> > > --- /dev/null
> > > +++ b/Documentation/driver-api/pardata.rst
> > > @@ -0,0 +1,60 @@
> > > +.. SPDX-License-Identifier: GPL-2.0
> > > +
> > > +=========================
> > > +Parallel Data Bus/Drivers
> > > +=========================
> > > +
> > > +Displays may be connected using a simple parallel bus.
> > > +This is often seen in embedded systems with a simple MCU, but is also
> > > +used in Linux based systems to a small extent.
> > > +
> > > +The bus looks like this:
> > > +
> > > +.. code-block:: none
> > > +
> > > +       ----+
> > > +           |  DB0-DB7 or DB4-DB7      +----
> > > +           ===/========================
> > > +           |  E - enable              |  D
> > > +           ----------------------------  I
> > > +        C  |  Reset                   |  S
> > > +        P  ----------------------------  P
> > > +        U  |  Read/Write (one or two) |  L
> > > +           ----------------------------  A
> > > +           |  RS - instruction/data   |  Y
> > > +           ----------------------------
> > > +           |                          +----
> > > +       ----+
> >
> > Oh, cool!  Looks like this can be used by the hd44780 driver.
> >
> >     Documentation/devicetree/bindings/auxdisplay/hit,hd44780.txt
> >     drivers/auxdisplay/hd44780.c
>
> This patchset was from a time when I knew next to nothing about DRM.
> Now I am just confused on a different level :-)

The more you know, the more you realize what you don't know ;-)

> It is on my TODO list to make a mipi-dbi driver that in the future
> replaces the auxdisplay driver for hd44780.

Please note that hd44780 is a character controller.

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
