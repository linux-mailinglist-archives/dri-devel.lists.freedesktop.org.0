Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E87F621990A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90DA26E9BE;
	Thu,  9 Jul 2020 07:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A55D6E8BF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 12:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1594212595; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zJgXrPQbTCw4B+qoOg8RvsVZilgOorE6px/+ERvmk9Q=;
 b=o3eJ92fPiI/fKzNEbyvPpbZYPsIu/vctuSeitkZTxIASS3rzWRY+ZtK8QuZZP9oZ3S49lq
 yKXPyS6JUW1rrWb3pDGavs29w5P7mIoqJWSUwGsSpB9GDrW2ay3+twXC75Gwj5Mhopy46F
 9A4aOpfaoO43GeYekExr9VSLl89TSyI=
Date: Wed, 08 Jul 2020 14:49:45 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [RFC PATCH 0/4] DSI/DBI and TinyDRM driver
To: Daniel Vetter <daniel@ffwll.ch>
Message-Id: <XAI5DQ.YLQ3GE6QLLH1@crapouillou.net>
In-Reply-To: <20200708072311.GH3278063@phenom.ffwll.local>
References: <20200607133832.1730288-1-paul@crapouillou.net>
 <c20796dd-d4d2-a989-ba58-7c3c71c15dc2@tronnes.org>
 <20200703172606.GA161457@ravnborg.org>
 <6de49852-bf93-e480-1a1e-6485391bf56c@tronnes.org>
 <20200708072311.GH3278063@phenom.ffwll.local>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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
Cc: od@zcrc.me, Greg KH <gregkh@linuxfoundation.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 dillon min <dillon.minfei@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Le mer. 8 juil. 2020 =E0 9:23, Daniel Vetter <daniel@ffwll.ch> a =E9crit :
> On Tue, Jul 07, 2020 at 04:32:25PM +0200, Noralf Tr=F8nnes wrote:
>>  (cc Dillon)
>> =

>>  Den 03.07.2020 19.26, skrev Sam Ravnborg:
>>  > Hi Noralf/Paul.
>>  >
>>  > Trying to stir up this discussion again.
>>  >
>>  > On Sun, Jun 14, 2020 at 06:36:22PM +0200, Noralf Tr=F8nnes wrote:
>>  >>
>>  >>
>>  >> Den 07.06.2020 15.38, skrev Paul Cercueil:
>>  >>> Hi,
>>  >>>
>>  >>> Here's a follow-up on the previous discussion about the current =

>> state of
>>  >>> DSI/DBI panel drivers, TinyDRM, and the need of a cleanup.
>>  >>>
>>  >>> This patchset introduces the following:
>>  >>> * It slightly tweaks the MIPI DSI code so that it supports MIPI =

>> DBI over
>>  >>>   various buses. This patch has been tested with a non-upstream =

>> DRM
>>  >>>   panel driver for a ILI9331 DBI/8080 panel, written with the =

>> DSI
>>  >>>   framework (and doesn't include <drm/drm_mipi_dbi.h>), and =

>> non-upstream
>>  >>>   DSI/DBI host driver for the Ingenic SoCs.
>>  >>>
>>  >>> * A SPI DBI host driver, using the current MIPI DSI framework. =

>> It allows
>>  >>>   MIPI DSI/DBI drivers to be written with the DSI framework, =

>> even if
>>  >>>   they are connected over SPI, instead of registering as SPI =

>> device
>>  >>>   drivers. Since most of these panels can be connected over =

>> various
>>  >>>   buses, it permits to reuse the same driver independently of =

>> the bus
>>  >>>   used.
>>  >>>
>>  >>> * A TinyDRM driver for DSI/DBI panels, once again independent =

>> of the bus
>>  >>>   used; the only dependency (currently) being that the panel =

>> must
>>  >>>   understand DCS commands.
>>  >>>
>>  >>> * A DRM panel driver to test the stack. This driver controls =

>> Ilitek
>>  >>>   ILI9341 based DBI panels, like the Adafruit YX240QV29-T =

>> 320x240 2.4"
>>  >>>   TFT LCD panel. This panel was converted from
>>  >>>   drivers/gpu/drm/tiny/ili9341.c.
>>  >>>
>>  >>> I would like to emphasize that while it has been =

>> compile-tested, I did
>>  >>> not test it with real hardware since I do not have any DBI panel
>>  >>> connected over SPI. I did runtime-test the code, just without =

>> any panel
>>  >>> connected.
>>  >>>
>>  >>> Another thing to note, is that it does not break Device Tree =

>> ABI. The
>>  >>> display node stays the same:
>>  >>>
>>  >>> display@0 {
>>  >>> 	compatible =3D "adafruit,yx240qv29", "ilitek,ili9341";
>>  >>> 	reg =3D <0>;
>>  >>> 	spi-max-frequency =3D <32000000>;
>>  >>> 	dc-gpios =3D <&gpio0 9 GPIO_ACTIVE_HIGH>;
>>  >>> 	reset-gpios =3D <&gpio0 8 GPIO_ACTIVE_HIGH>;
>>  >>> 	rotation =3D <270>;
>>  >>> 	backlight =3D <&backlight>;
>>  >>> };
>>  >>>
>>  >>> The reason it works, is that the "adafruit,yx240qv29" device is =

>> probed
>>  >>> on the SPI bus, so it will match with the SPI/DBI host driver. =

>> This will
>>  >>> in turn register the very same node with the DSI bus, and the =

>> ILI9341
>>  >>> DRM panel driver will probe. The driver will detect that no =

>> controller
>>  >>> is linked to the panel, and eventually register the DBI/DSI =

>> TinyDRM
>>  >>> driver.
>>  >>>
>>  >>> I can't stress it enough that this is a RFC, so it still has =

>> very rough
>>  >>> edges.
>>  >>>
>>  >>
>>  >> I don't know bridge and dsi drivers so I can't comment on that, =

>> but one
>>  >> thing I didn't like is that the DT compatible string has to be =

>> added to
>>  >> 2 different modules.
>>  >>
>>  >> As an example, a MI0283QT panel (ILI9341) supports these =

>> interface options:
>>  >>
>>  >> 1. SPI
>>  >>    Panel setup/control and framebuffer upload over SPI
>>  >>
>>  >> 2. SPI + DPI
>>  >>    Panel setup/control over SPI, framebuffer scanout over DPI
>>  >>
>>  >> 3. Parallel bus
>>  >>    Panel setup/control and framebuffer upload over parallel bus
>>  >
>>  > To continue the configurations we should support:
>>  > - Panels where the chip can be configured to SPI, SPI+DPI, =

>> Parallel bus
>>  >   (as detailed by Noralf above)
>>  > - Panels that supports only 6800 or 8080 - connected via GPIO =

>> pins or
>>  >   memory mapped (maybe behind some special IP to support this)
>>  >   Command set is often special.
>>  >
>>  > We will see a number of chips with many different types of =

>> displays.
>>  > So the drivers should be chip specific with configuration =

>> depending on
>>  > the connected display.
>>  >
>>  > What I hope we can find a solution for is a single file/driver =

>> that can
>>  > support all the relevant interface types for a chip.
>>  > So we would end up with a single file that included the necessary
>>  > support for ili9341 in all interface configurations with the =

>> necessary
>>  > support for the relevant displays.
>>  >
>>  > I do not know how far we are from this as I have not dived into =

>> the
>>  > details of any of the proposals.
>> =

>>  In an ideal world I would have liked to see the MIPI DBI parallel
>>  interface implemented using a new Linux parallel bus type. It could =

>> have
>>  drivers for gpio bitbanging and mmio in addition to other hw =

>> specific
>>  drivers. Now we could have a drm_mipi_dbi DRM driver that registers =

>> as a
>>  SPI client driver and a Parallel bus client driver. Or it can be a
>>  component driver for the existing DRM driver on the SoC.
>> =

>>  I had plans to do this and made a prototype, but dropped it since it
>>  would probably require a lot of work getting in a new Linux bus =

>> type.
> =

> Channelling my inner Greg KH:
> =

> Please just create a new bus, it should be quite easy and boilerplate =

> is
> manageable.

The bus is already here, it's "mipi-dsi". DBI and DSI are basically the =

same thing, just that one is parallel and the other is serial.

-Paul

> Greg, did I get this right? Maybe any recommendations for a simple
> parallel bus with perhaps different register access paths depending =

> upon
> how it's all wired up exactly?
> -Daniel
> =

>>  However if we're going to treat this parallel bus only as a MIPI DBI
>>  display interface but support gpio bitbanging and mmio as well, =

>> then we
>>  could add DRM drivers for each MIPI DBI bus (that don't have special
>>  parallel bus hw):
>>  - mipi-dbi-spi
>>  - mipi-dbi-gpio
>>  - mipi-dbi-mmio
>> =

>>  These drivers will register as a mipi_dsi_host adapted like Paul =

>> suggested.
>> =

>>  The panel drivers will be mipi_dsi_drivers. Now the panels should =

>> work
>>  regardless of bus type. They probably need to know about the bus =

>> type,
>>  at least whether the parallell bus is 8-bit or 16-bit wide.
>> =

>>  The current MIPI DBI SPI drivers (drm/tiny) will need to be treated
>>  specially to keep working with old Device Trees when moved over to
>>  drm/panel.
>> =

>>  Noralf.
>> =

>> =

>>  >>
>>  >> My suggestion is to have one panel driver module that can =

>> support all of
>>  >> these like this:
>>  > So I think we agree here.
>>  >
>>  >>
>>  >> For 1. and 2. a SPI driver is registered and if I understand your
>>  >> example correctly of_graph_get_port_by_id() can be used during =

>> probe to
>>  >> distinguish between the 2 options and register a full DRM driver =

>> for 1.
>>  >> and add a DRM panel for 2.
>>  >>
>>  >> For 3. a DSI driver is registered (adapted for DBI use like =

>> you're
>>  >> suggesting).
>>  >>
>>  >> Note that the interface part of the controller initialization =

>> will
>>  >> differ between these, the panel side init will be the same I =

>> assume.
>>  >
>>  > 	Sam
>>  >
> =

> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
