Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 220281F8F93
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D58489FF6;
	Mon, 15 Jun 2020 07:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC35089F07
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 18:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1592160312; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nNx9FEgFzl5gt4Wt06FhGkEd6Voy9fzWaPxnnz0XX3w=;
 b=v814cFoJZcW+NZF+rNw66UkZIp4k0cRuCt4mjxGQHKcAGvgH4O3O3xuoq0x7Mhhc+9rNn/
 7mzceIs3xwtPBVk/FZ9bASGkWiPMSuffk3+ngUa39r4rGwcnvyCev+yyRfBwTg/DIGjYXA
 2RNBvpC2g1J2t2VWDrnQZV66pu9hXp8=
Date: Sun, 14 Jun 2020 20:45:01 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [RFC PATCH 0/4] DSI/DBI and TinyDRM driver
To: Noralf =?iso-8859-1?q?Tr=F8nnes?= <noralf@tronnes.org>
Message-Id: <1RIXBQ.4P44ILM1QELP2@crapouillou.net>
In-Reply-To: <c20796dd-d4d2-a989-ba58-7c3c71c15dc2@tronnes.org>
References: <20200607133832.1730288-1-paul@crapouillou.net>
 <c20796dd-d4d2-a989-ba58-7c3c71c15dc2@tronnes.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: Sam Ravnborg <sam@ravnborg.org>, od@zcrc.me,
 Emil Velikov <emil.l.velikov@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Noralf,


Le dim. 14 juin 2020 =E0 18:36, Noralf Tr=F8nnes <noralf@tronnes.org> a =

=E9crit :
> =

> =

> Den 07.06.2020 15.38, skrev Paul Cercueil:
>>  Hi,
>> =

>>  Here's a follow-up on the previous discussion about the current =

>> state of
>>  DSI/DBI panel drivers, TinyDRM, and the need of a cleanup.
>> =

>>  This patchset introduces the following:
>>  * It slightly tweaks the MIPI DSI code so that it supports MIPI DBI =

>> over
>>    various buses. This patch has been tested with a non-upstream DRM
>>    panel driver for a ILI9331 DBI/8080 panel, written with the DSI
>>    framework (and doesn't include <drm/drm_mipi_dbi.h>), and =

>> non-upstream
>>    DSI/DBI host driver for the Ingenic SoCs.
>> =

>>  * A SPI DBI host driver, using the current MIPI DSI framework. It =

>> allows
>>    MIPI DSI/DBI drivers to be written with the DSI framework, even if
>>    they are connected over SPI, instead of registering as SPI device
>>    drivers. Since most of these panels can be connected over various
>>    buses, it permits to reuse the same driver independently of the =

>> bus
>>    used.
>> =

>>  * A TinyDRM driver for DSI/DBI panels, once again independent of =

>> the bus
>>    used; the only dependency (currently) being that the panel must
>>    understand DCS commands.
>> =

>>  * A DRM panel driver to test the stack. This driver controls Ilitek
>>    ILI9341 based DBI panels, like the Adafruit YX240QV29-T 320x240 =

>> 2.4"
>>    TFT LCD panel. This panel was converted from
>>    drivers/gpu/drm/tiny/ili9341.c.
>> =

>>  I would like to emphasize that while it has been compile-tested, I =

>> did
>>  not test it with real hardware since I do not have any DBI panel
>>  connected over SPI. I did runtime-test the code, just without any =

>> panel
>>  connected.
>> =

>>  Another thing to note, is that it does not break Device Tree ABI. =

>> The
>>  display node stays the same:
>> =

>>  display@0 {
>>  	compatible =3D "adafruit,yx240qv29", "ilitek,ili9341";
>>  	reg =3D <0>;
>>  	spi-max-frequency =3D <32000000>;
>>  	dc-gpios =3D <&gpio0 9 GPIO_ACTIVE_HIGH>;
>>  	reset-gpios =3D <&gpio0 8 GPIO_ACTIVE_HIGH>;
>>  	rotation =3D <270>;
>>  	backlight =3D <&backlight>;
>>  };
>> =

>>  The reason it works, is that the "adafruit,yx240qv29" device is =

>> probed
>>  on the SPI bus, so it will match with the SPI/DBI host driver. This =

>> will
>>  in turn register the very same node with the DSI bus, and the =

>> ILI9341
>>  DRM panel driver will probe. The driver will detect that no =

>> controller
>>  is linked to the panel, and eventually register the DBI/DSI TinyDRM
>>  driver.
>> =

>>  I can't stress it enough that this is a RFC, so it still has very =

>> rough
>>  edges.
>> =

> =

> I don't know bridge and dsi drivers so I can't comment on that, but =

> one
> thing I didn't like is that the DT compatible string has to be added =

> to
> 2 different modules.

That's a minimal drawback for a perfectly architectured design ;)

> As an example, a MI0283QT panel (ILI9341) supports these interface =

> options:
> =

> 1. SPI
>    Panel setup/control and framebuffer upload over SPI
> =

> 2. SPI + DPI
>    Panel setup/control over SPI, framebuffer scanout over DPI
> =

> 3. Parallel bus
>    Panel setup/control and framebuffer upload over parallel bus
> =

> My suggestion is to have one panel driver module that can support all =

> of
> these like this:
> =

> For 1. and 2. a SPI driver is registered and if I understand your
> example correctly of_graph_get_port_by_id() can be used during probe =

> to
> distinguish between the 2 options and register a full DRM driver for =

> 1.
> and add a DRM panel for 2.
> =

> For 3. a DSI driver is registered (adapted for DBI use like you're
> suggesting).

That means basically having two entry points per DBI driver, one as DSI =

device and one as SPI device, the latter doing the job of the current =

DBI-SPI bridge. I think i would be cleaner to just have duplicated =

strings with the DBI-SPI bridge.

Cheers,
-Paul

> Note that the interface part of the controller initialization will
> differ between these, the panel side init will be the same I assume.

> Noralf.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
