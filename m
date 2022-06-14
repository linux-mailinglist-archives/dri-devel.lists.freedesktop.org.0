Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B74554B2D2
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 16:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361C7112448;
	Tue, 14 Jun 2022 14:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 447 seconds by postgrey-1.36 at gabe;
 Tue, 14 Jun 2022 14:14:02 UTC
Received: from mx3.securetransport.de (mx3.securetransport.de
 [IPv6:2a01:4f8:c0c:92be::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EE3112448
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 14:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
 s=dhelectronicscom; t=1655215552;
 bh=kZWe6Zc/bv5y1c1ZqXyxmMpzmoXjoTrNmG4TQBrLGXc=;
 h=From:To:CC:Subject:Date:From;
 b=Bn6KL59vtQ2XwQWrgwfpvmx+vrRJxkE38aajl1hPEdhFiqEfkWlhgnmx452oispNt
 7CCHu+dCo5jfaDDgoRAZ0A8s2m92ta8ZXGXf8aMp6cYOBpyaz6+zX9/mCjz6Y2G/NQ
 CThsZmMojAiGBWDGYT5rmU9utEsTfI8j3AfbomUfsCq4ESfRChN7ZvtBl8qlqx/5gb
 bW6B3Met3wMCKUItB4UPLIRlm1+UKoWBygcfAHlZloKg6Ho1QEHMTh8Nut7xqrerL3
 EOqKzJnjXG8FatzxDWfJLtOv6r+7VfDSgt0BGgOpECnBsnuEw0NFXsXzFT272JDMT8
 5cfDLXHZ+IS1A==
X-secureTransport-forwarded: yes
From: Dominik Kierner <dkierner@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v6 3/6] drm: Add driver for Solomon SSD130x OLED displays
Thread-Topic: [PATCH v6 3/6] drm: Add driver for Solomon SSD130x OLED displays
Thread-Index: Adh/98yd/bFLOXDpTTiVpWIDbnNb5w==
Date: Tue, 14 Jun 2022 14:05:36 +0000
Message-ID: <4dfc32123d1d4e38ae1afdd3f33109a9@dh-electronics.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
Cc: "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "noralf@tronnes.org" <noralf@tronnes.org>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "maxime@cerno.tech" <maxime@cerno.tech>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Javier

On 6/14/22 13:39, Javier Martinez Canillas wrote:

> > I always understood regulator_get_optional() as a way of not having to =
rely on a dummy,
> > when a regulator is not present, but please correct me, if I am wrong o=
n this.
> > The dummies would only be necessary for the mandatory supplies VCC and =
VDD.
> >
>=20
> Yes, that's what I tried to say. That's regulator_get() and not _optional=
()
> the function that will provide a dummy regulator if isn't physically pres=
ent:
>=20
> https://elixir.bootlin.com/linux/latest/source/drivers/regulator/core.c#L=
2067
>=20
> > You mean this part of the documentation of regulator_get_optional(), co=
rrect?:
> >
> >> * This is intended for use by consumers for devices which can have
> >> * some supplies unconnected in normal use, such as some MMC devices.
> >> * It can allow the regulator core to provide stub supplies for other
> >> * supplies requested using normal regulator_get() calls without
> >> * disrupting the operation of drivers that can handle absent
> >> * supplies.
> >
> >
> So for example when you just use a voltage rail in let's say a board pin =
header
> then you will need to define supply nodes with compatible =3D "regulator-
> fixed" ?

Exactly.

> That is indeed more accurate from a hardware description point of view bu=
t I'm
> not convinced that this is something worth to break DT backward compatibi=
lity.

> You also mentioned (IIUC) that the regulators could be made optional and =
their
> presence be used as an indication that an atomic charge pump configuratio=
n can
> be made instead of using the current ssd130x->display_settings.use_charge=
_pump.
>=20
> I think that would prefer that the latter option, but will let others to =
chime
> in since maybe I'm not correct on the preferred approach.

Yes, here the reference for the former approach:
Chapter 2 "Charge Pump Regulator" on Page 62 of the SSD1306 datasheet:
https://cdn-shop.adafruit.com/datasheets/SSD1306.pdf

Just a TL;DR of the former approach for easier discussion:
The logic supply VDD would always be mandatory.
The low voltage supply VBAT would be optional and probed first.
If found, it would supersede the "high" voltage driving supply VCC and
the charge pump would be enabled. If VBAT is not found, then VCC is
mandatory and the charge pump will not be enabled.


--
Best regards

Dominik Kierner
Research & Development
DH electronics

