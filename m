Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB5F1431D1
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 19:48:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631156EAF1;
	Mon, 20 Jan 2020 18:48:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F23156EAF1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 18:48:09 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 726E220023;
 Mon, 20 Jan 2020 19:48:06 +0100 (CET)
Date: Mon, 20 Jan 2020 19:48:04 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v1 2/5] pardata: new bus for parallel data access
Message-ID: <20200120184804.GA7630@ravnborg.org>
References: <20180802193909.GA11443@ravnborg.org>
 <20180802194536.10820-2-sam@ravnborg.org>
 <CAMuHMdVP4UwGYuNcOphPO9F2pSCaHS1j-ODxYrv_LNOoo_4coA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVP4UwGYuNcOphPO9F2pSCaHS1j-ODxYrv_LNOoo_4coA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=WVoohQUBmtK7-yx5X7kA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert.

On Mon, Jan 20, 2020 at 11:10:37AM +0100, Geert Uytterhoeven wrote:
> Hi Sam,
> 
> (stumbled on this accidentally)
> 
> On Thu, Aug 2, 2018 at 9:46 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> > The pardata supports implement a simple bus for devices
> > that are connected using a parallel bus driven by GPIOs.
> > The is often used in combination with simple displays
> > that is often seen in older embedded designs.
> > There is a demand for this support also in the linux
> > kernel for HW designs that uses these kind of displays.
> >
> > The pardata bus uses a platfrom_driver that when probed
> > creates devices for all child nodes in the DT,
> > which are then supposed to be handled by pardata_drivers.
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> 
> > --- /dev/null
> > +++ b/Documentation/driver-api/pardata.rst
> > @@ -0,0 +1,60 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +=========================
> > +Parallel Data Bus/Drivers
> > +=========================
> > +
> > +Displays may be connected using a simple parallel bus.
> > +This is often seen in embedded systems with a simple MCU, but is also
> > +used in Linux based systems to a small extent.
> > +
> > +The bus looks like this:
> > +
> > +.. code-block:: none
> > +
> > +       ----+
> > +           |  DB0-DB7 or DB4-DB7      +----
> > +           ===/========================
> > +           |  E - enable              |  D
> > +           ----------------------------  I
> > +        C  |  Reset                   |  S
> > +        P  ----------------------------  P
> > +        U  |  Read/Write (one or two) |  L
> > +           ----------------------------  A
> > +           |  RS - instruction/data   |  Y
> > +           ----------------------------
> > +           |                          +----
> > +       ----+
> 
> Oh, cool!  Looks like this can be used by the hd44780 driver.
> 
>     Documentation/devicetree/bindings/auxdisplay/hit,hd44780.txt
>     drivers/auxdisplay/hd44780.c

This patchset was from a time when I knew next to nothing about DRM.
Now I am just confused on a different level :-)

It is on my TODO list to make a mipi-dbi driver that in the future
replaces the auxdisplay driver for hd44780.
But that TODO list have a growing tendency.
It seems that pretending to be co-maintainer on panel/ stuff
alone can take up most of my DRM time.

I hope Paul will contribute the i8080 support to drm_mipi_dbi,
at least he mentioned he planned to work on this.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
