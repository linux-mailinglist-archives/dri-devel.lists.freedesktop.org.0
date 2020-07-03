Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC54213E89
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 19:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF20E6EB88;
	Fri,  3 Jul 2020 17:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6526EB88
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 17:26:10 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id CD5C32002D;
 Fri,  3 Jul 2020 19:26:07 +0200 (CEST)
Date: Fri, 3 Jul 2020 19:26:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [RFC PATCH 0/4] DSI/DBI and TinyDRM driver
Message-ID: <20200703172606.GA161457@ravnborg.org>
References: <20200607133832.1730288-1-paul@crapouillou.net>
 <c20796dd-d4d2-a989-ba58-7c3c71c15dc2@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c20796dd-d4d2-a989-ba58-7c3c71c15dc2@tronnes.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=8nJEP1OIZ-IA:10 a=tNABQns5bdWSQWw5byUA:9 a=wPNLvfGTeEIA:10
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
Cc: Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 Emil Velikov <emil.l.velikov@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Noralf/Paul.

Trying to stir up this discussion again.

On Sun, Jun 14, 2020 at 06:36:22PM +0200, Noralf Tr=F8nnes wrote:
> =

> =

> Den 07.06.2020 15.38, skrev Paul Cercueil:
> > Hi,
> > =

> > Here's a follow-up on the previous discussion about the current state of
> > DSI/DBI panel drivers, TinyDRM, and the need of a cleanup.
> > =

> > This patchset introduces the following:
> > * It slightly tweaks the MIPI DSI code so that it supports MIPI DBI over
> >   various buses. This patch has been tested with a non-upstream DRM
> >   panel driver for a ILI9331 DBI/8080 panel, written with the DSI
> >   framework (and doesn't include <drm/drm_mipi_dbi.h>), and non-upstream
> >   DSI/DBI host driver for the Ingenic SoCs.
> > =

> > * A SPI DBI host driver, using the current MIPI DSI framework. It allows
> >   MIPI DSI/DBI drivers to be written with the DSI framework, even if
> >   they are connected over SPI, instead of registering as SPI device
> >   drivers. Since most of these panels can be connected over various
> >   buses, it permits to reuse the same driver independently of the bus
> >   used.
> > =

> > * A TinyDRM driver for DSI/DBI panels, once again independent of the bus
> >   used; the only dependency (currently) being that the panel must
> >   understand DCS commands.
> > =

> > * A DRM panel driver to test the stack. This driver controls Ilitek
> >   ILI9341 based DBI panels, like the Adafruit YX240QV29-T 320x240 2.4"
> >   TFT LCD panel. This panel was converted from
> >   drivers/gpu/drm/tiny/ili9341.c.
> > =

> > I would like to emphasize that while it has been compile-tested, I did
> > not test it with real hardware since I do not have any DBI panel
> > connected over SPI. I did runtime-test the code, just without any panel
> > connected.
> > =

> > Another thing to note, is that it does not break Device Tree ABI. The
> > display node stays the same:
> > =

> > display@0 {
> > 	compatible =3D "adafruit,yx240qv29", "ilitek,ili9341";
> > 	reg =3D <0>;
> > 	spi-max-frequency =3D <32000000>;
> > 	dc-gpios =3D <&gpio0 9 GPIO_ACTIVE_HIGH>;
> > 	reset-gpios =3D <&gpio0 8 GPIO_ACTIVE_HIGH>;
> > 	rotation =3D <270>;
> > 	backlight =3D <&backlight>;
> > };
> > =

> > The reason it works, is that the "adafruit,yx240qv29" device is probed
> > on the SPI bus, so it will match with the SPI/DBI host driver. This will
> > in turn register the very same node with the DSI bus, and the ILI9341
> > DRM panel driver will probe. The driver will detect that no controller
> > is linked to the panel, and eventually register the DBI/DSI TinyDRM
> > driver.
> > =

> > I can't stress it enough that this is a RFC, so it still has very rough
> > edges.
> > =

> =

> I don't know bridge and dsi drivers so I can't comment on that, but one
> thing I didn't like is that the DT compatible string has to be added to
> 2 different modules.
> =

> As an example, a MI0283QT panel (ILI9341) supports these interface option=
s:
> =

> 1. SPI
>    Panel setup/control and framebuffer upload over SPI
> =

> 2. SPI + DPI
>    Panel setup/control over SPI, framebuffer scanout over DPI
> =

> 3. Parallel bus
>    Panel setup/control and framebuffer upload over parallel bus

To continue the configurations we should support:
- Panels where the chip can be configured to SPI, SPI+DPI, Parallel bus
  (as detailed by Noralf above)
- Panels that supports only 6800 or 8080 - connected via GPIO pins or
  memory mapped (maybe behind some special IP to support this)
  Command set is often special.

We will see a number of chips with many different types of displays.
So the drivers should be chip specific with configuration depending on
the connected display.

What I hope we can find a solution for is a single file/driver that can
support all the relevant interface types for a chip.
So we would end up with a single file that included the necessary
support for ili9341 in all interface configurations with the necessary
support for the relevant displays.

I do not know how far we are from this as I have not dived into the
details of any of the proposals.
> =

> My suggestion is to have one panel driver module that can support all of
> these like this:
So I think we agree here.

> =

> For 1. and 2. a SPI driver is registered and if I understand your
> example correctly of_graph_get_port_by_id() can be used during probe to
> distinguish between the 2 options and register a full DRM driver for 1.
> and add a DRM panel for 2.
> =

> For 3. a DSI driver is registered (adapted for DBI use like you're
> suggesting).
> =

> Note that the interface part of the controller initialization will
> differ between these, the panel side init will be the same I assume.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
