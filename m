Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A330160259C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 09:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102D510EEB0;
	Tue, 18 Oct 2022 07:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF3F10EEB1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 07:22:37 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1okgvr-0006SP-2v; Tue, 18 Oct 2022 09:22:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1okgvp-002ESx-St; Tue, 18 Oct 2022 09:22:33 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1okgvo-008kKv-VO; Tue, 18 Oct 2022 09:22:32 +0200
Date: Tue, 18 Oct 2022 09:22:32 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] fbdev: da8xx-fb: Fix error handling in .remove()
Message-ID: <20221018072232.uodlzz3tzcugl2bo@pengutronix.de>
References: <20221017195250.1425468-1-u.kleine-koenig@pengutronix.de>
 <7469c557-388a-4917-9810-90b1f341292d@gmx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wvwcnhrbkl5tpywx"
Content-Disposition: inline
In-Reply-To: <7469c557-388a-4917-9810-90b1f341292d@gmx.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: linux-fbdev@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>,
 dri-devel@lists.freedesktop.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Cai Huoqing <cai.huoqing@linux.dev>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wvwcnhrbkl5tpywx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 18, 2022 at 08:08:49AM +0200, Helge Deller wrote:
> On 10/17/22 21:52, Uwe Kleine-K=F6nig wrote:
> > Even in the presence of problems (here: regulator_disable() might fail),
> > it's important to unregister all resources acquired during .probe() and
> > disable the device (i.e. DMA activity) because even if .remove() returns
> > an error code, the device is removed and the .remove() callback is never
> > called again later to catch up.
> >=20
> > This is a preparation for making platform remove callbacks return void.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> applied.

Great. If you want a Fixes: line, that's:

Fixes: 611097d5daea ("fbdev: da8xx: add support for a regulator")

(expanded Cc: a bit with the people involved there.)

Best regards
Uwe

> > ---
> >   drivers/video/fbdev/da8xx-fb.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/video/fbdev/da8xx-fb.c b/drivers/video/fbdev/da8xx=
-fb.c
> > index ae76a2111c77..11922b009ed7 100644
> > --- a/drivers/video/fbdev/da8xx-fb.c
> > +++ b/drivers/video/fbdev/da8xx-fb.c
> > @@ -1076,7 +1076,8 @@ static int fb_remove(struct platform_device *dev)
> >   	if (par->lcd_supply) {
> >   		ret =3D regulator_disable(par->lcd_supply);
> >   		if (ret)
> > -			return ret;
> > +			dev_warn(&dev->dev, "Failed to disable regulator (%pe)\n",
> > +				 ERR_PTR(ret));
> >   	}
> >=20
> >   	lcd_disable_raster(DA8XX_FRAME_WAIT);
> >=20
> > base-commit: 4fe89d07dcc2804c8b562f6c7896a45643d34b2f
>=20
>=20
>=20

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--wvwcnhrbkl5tpywx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmNOVDYACgkQwfwUeK3K
7Anw8Qf7Bp3WWPZoWZ3eqaIlidOS99XbrVGpK7/YocK8uv4ayqpeqyD2cDpU7hKD
L7RAj6VJYPJ1QkkGkJYADpQvN3rrko6nkJnXjuIBKoXz53wQ8XBl9v4YxZSU1YPa
BDFJs/3PZmXnwnGg/z8nOMULLOTVAJTf+3CuZJy4hUf26SROoWmjk1iogmUpnw9T
UcmLZKSMg3jpbrqcNDpVn88X5JJ3nsV4znqcCU8ylFqyh/FXA1ZQzDKybnYAYeuJ
UNj63Hh5QdkyDZFkmwh5R5emAbpiy7Y1tYD/JqXmKZHi8E/Ul4vrscjDF67sjx6m
Zulbf2F9Ob6NTOcuHal0/8IleXxatQ==
=f4lH
-----END PGP SIGNATURE-----

--wvwcnhrbkl5tpywx--
