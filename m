Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92124D561D
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2019 14:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD2C6E0ED;
	Sun, 13 Oct 2019 12:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from atrey.karlin.mff.cuni.cz (atrey.karlin.mff.cuni.cz
 [195.113.26.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13AF6E0ED
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2019 12:10:00 +0000 (UTC)
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
 id 43A738023D; Sun, 13 Oct 2019 14:09:41 +0200 (CEST)
Date: Sun, 13 Oct 2019 14:09:52 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [PATCH v9 3/5] leds: Add managed API to get a LED from a device
 driver
Message-ID: <20191013120952.GL5653@amd>
References: <20191007124437.20367-1-jjhiblot@ti.com>
 <20191007124437.20367-4-jjhiblot@ti.com>
MIME-Version: 1.0
In-Reply-To: <20191007124437.20367-4-jjhiblot@ti.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: mark.rutland@arm.com, daniel.thompson@linaro.org, tomi.valkeinen@ti.com,
 sre@kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, dmurphy@ti.com
Content-Type: multipart/mixed; boundary="===============0504244152=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0504244152==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zH41lVBEV8cLJnCl"
Content-Disposition: inline


--zH41lVBEV8cLJnCl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> If the LED is acquired by a consumer device with devm_led_get(), it is
> automatically released when the device is detached.
>=20
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> Acked-by: Pavel Machek <pavel@ucw.cz>
> ---
>  drivers/leds/led-class.c | 49 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/leds.h     |  2 ++
>  2 files changed, 51 insertions(+)
>=20
> diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
> index 1d1f1d546dc7..639224392ffa 100644
> --- a/drivers/leds/led-class.c
> +++ b/drivers/leds/led-class.c
> @@ -264,6 +264,55 @@ void led_put(struct led_classdev *led_cdev)
>  }
>  EXPORT_SYMBOL_GPL(led_put);
> =20
> +static void devm_led_release(struct device *dev, void *res)
> +{
> +	struct led_classdev **p =3D res;
> +
> +	led_put(*p);
> +}
> +
> +/**
> + * devm_of_led_get - Resource-managed request of a LED device
> + * @dev:	LED consumer
> + * @index:	index of the LED to obtain in the consumer
> + *
> + * The device node of the device is parse to find the request LED device.
> + * The LED device returned from this function is automatically released
> + * on driver detach.
> + *
> + * @return a pointer to a LED device or ERR_PTR(errno) on failure.
> + */
> +struct led_classdev *__must_check devm_of_led_get(struct device *dev,
> +						  int index)
> +{
> +	struct led_classdev *led;
> +	struct led_classdev **dr;
> +
> +	if (!dev)
> +		return ERR_PTR(-EINVAL);
> +
> +	/* Consummer not using device tree? */

Typo "consumer". I may fix it before applying the patch.

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--zH41lVBEV8cLJnCl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl2jFBAACgkQMOfwapXb+vLi0ACghzv7nZ4xe3dVsGeLJ7I8UIbL
ZHoAoLAAx5gbRTPv4Bm9i1/pPNfJgf7j
=R/Sy
-----END PGP SIGNATURE-----

--zH41lVBEV8cLJnCl--

--===============0504244152==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0504244152==--
