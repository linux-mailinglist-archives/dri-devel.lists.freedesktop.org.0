Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2911A6A61B2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 22:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE83B10E0D0;
	Tue, 28 Feb 2023 21:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 407 seconds by postgrey-1.36 at gabe;
 Tue, 28 Feb 2023 21:46:55 UTC
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1AD610E0D0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 21:46:55 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 172871C0AAC; Tue, 28 Feb 2023 22:40:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1677620405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zqOoqxAGPYyAfPZSQwIAbK0Pu/uIpu/fhL/ijqWx87s=;
 b=dmk+ElYHIxWewmkSlGPShEF7n2ouLRoxTMUZuJtl5apj5AodSn1w6Fdth+Evv5kuAvnLCx
 xHiE/2s0n62GJHLW4GqzpxYglHXCQzQqPVFH/lKAdNtAAgjn/PO8VN3HM04tXGTfod67cq
 xelHHDL7aY41VWAgH6PBnJGu6TReOF0=
Date: Tue, 28 Feb 2023 22:40:04 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Martin Kurbanov <mmkurbanov@sberdevices.ru>, ojeda@kernel.org
Subject: AUXdisplay for LED arrays, keyboards with per-key LEDs -- was Re:
 [PATCH v2 2/2] leds: add aw20xx driver
Message-ID: <Y/50tKxpNVZO4Hfb@duo.ucw.cz>
References: <20230228211046.109693-1-mmkurbanov@sberdevices.ru>
 <20230228211046.109693-3-mmkurbanov@sberdevices.ru>
 <Y/5xBGFC3b9Chdtb@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="Lf/YZ9BrM6XcCIJb"
Content-Disposition: inline
In-Reply-To: <Y/5xBGFC3b9Chdtb@duo.ucw.cz>
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
Cc: devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, kernel@sberdevices.ru,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Lf/YZ9BrM6XcCIJb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > +config LEDS_AW200XX
> > +	tristate "LED support for Awinic AW20036/AW20054/AW20072"
> > +	depends on LEDS_CLASS
> > +	depends on I2C
> > +	help
> > +	  This option enables support for the AW20036/AW20054/AW20072 LED dri=
ver.
> > +	  It is a 3x12/6x9/6x12 matrix LED driver programmed via
> > +	  an I2C interface, up to 36/54/72 LEDs or 12/18/24 RGBs,
> > +	  3 pattern controllers for auto breathing or group dimming control.
>=20
> I'm afraid this should be handled as a display, not as an array of
> individual LEDs.

You probably want to see

AUXILIARY DISPLAY DRIVERS
M:      Miguel Ojeda <ojeda@kernel.org>
S:      Maintained
F:      Documentation/devicetree/bindings/auxdisplay/
F:      drivers/auxdisplay/
F:      include/linux/cfag12864b.h

And this brings another question...

=2E..sooner or later we'll see LED displays with around 100 pixels in
almost rectangular grid. Minority of the pixels will have funny
shapes. How will we handle those? Pretend it is regular display with
some pixels missing? How do we handle cellphone displays with rounded
corners and holes for front camera?

And yes, such crazy displays are being manufactured -- it is called
keyboard with per-key backlight...=20

https://www.reddit.com/r/MechanicalKeyboards/comments/8dtvgo/keyboard_with_=
individually_programmable_leds/

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--Lf/YZ9BrM6XcCIJb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCY/50tAAKCRAw5/Bqldv6
8p38AKC6zleFfBQhWzpHoEUJaT9vyIFVLwCaA+GnS49YUrJhe1ZsoXnIFJOi3cQ=
=DMLD
-----END PGP SIGNATURE-----

--Lf/YZ9BrM6XcCIJb--
