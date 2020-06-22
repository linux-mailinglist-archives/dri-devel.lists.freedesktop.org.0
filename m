Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5550A2030B1
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24096E07B;
	Mon, 22 Jun 2020 07:36:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0F36E241
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 07:35:59 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1jnGzj-0008NC-4z; Mon, 22 Jun 2020 09:35:55 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1jnGzi-0001qp-He; Mon, 22 Jun 2020 09:35:54 +0200
Date: Mon, 22 Jun 2020 09:35:54 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 04/15] pwm: lpss: Add range limit check for the
 base_unit register value
Message-ID: <20200622073554.wf3smq3tvnr6t2xy@taurus.defre.kleine-koenig.org>
References: <20200620121758.14836-1-hdegoede@redhat.com>
 <20200620121758.14836-5-hdegoede@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200620121758.14836-5-hdegoede@redhat.com>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
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
Cc: linux-pwm@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Type: multipart/mixed; boundary="===============1093208636=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1093208636==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3nik46a6rq5z5thx"
Content-Disposition: inline


--3nik46a6rq5z5thx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 20, 2020 at 02:17:47PM +0200, Hans de Goede wrote:
> When the user requests a high enough period ns value, then the
> calculations in pwm_lpss_prepare() might result in a base_unit value of 0.
>=20
> But according to the data-sheet the way the PWM controller works is that
> each input clock-cycle the base_unit gets added to a N bit counter and
> that counter overflowing determines the PWM output frequency. Adding 0
> to the counter is a no-op. The data-sheet even explicitly states that
> writing 0 to the base_unit bits will result in the PWM outputting a
> continuous 0 signal.
>=20
> When the user requestes a low enough period ns value, then the
> calculations in pwm_lpss_prepare() might result in a base_unit value
> which is bigger then base_unit_range - 1. Currently the codes for this
> deals with this by applying a mask:
>=20
> 	base_unit &=3D (base_unit_range - 1);
>=20
> But this means that we let the value overflow the range, we throw away the
> higher bits and store whatever value is left in the lower bits into the
> register leading to a random output frequency, rather then clamping the
> output frequency to the highest frequency which the hardware can do.
>=20
> This commit fixes both issues by clamping the base_unit value to be
> between 1 and (base_unit_range - 1).
>=20
> Fixes: 684309e5043e ("pwm: lpss: Avoid potential overflow of base_unit")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v3:
> - Change upper limit of clamp to (base_unit_range - 1)
> - Add Fixes tag
> ---
>  drivers/pwm/pwm-lpss.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pwm/pwm-lpss.c b/drivers/pwm/pwm-lpss.c
> index 43b1fc634af1..80d0f9c64f9d 100644
> --- a/drivers/pwm/pwm-lpss.c
> +++ b/drivers/pwm/pwm-lpss.c
> @@ -97,6 +97,9 @@ static void pwm_lpss_prepare(struct pwm_lpss_chip *lpwm=
, struct pwm_device *pwm,
>  	freq *=3D base_unit_range;
> =20
>  	base_unit =3D DIV_ROUND_CLOSEST_ULL(freq, c);

DIV_ROUND_CLOSEST_ULL is most probably wrong, too. But I didn't spend
the time to actually confirm that.

> +	/* base_unit must not be 0 and we also want to avoid overflowing it */
> +	base_unit =3D clamp_t(unsigned long long, base_unit, 1,
> +			    base_unit_range - 1);

=2Eget_state seems to handle base_unit =3D=3D 0 just fine?! Though this
doesn't look right either ...

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--3nik46a6rq5z5thx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl7wX1cACgkQwfwUeK3K
7Am6pgf+LZYdX7YSA1rjdiVHR5CjuJtlaTqB/zfk154cZ2lA23x+VoRVohrY8BC+
sL2Fxd7onOI+3egd/oXNi2v/bMRY6/QTKIPHbUYPW/JXlfzZGMquIsUyClztkj0o
1NRG0/PtyAotWCHSFrDfYn+e1cw93ttKHxUsDPOmxzZ1agY5jHT9D/xfEiHc4LXN
cadb8NRRI2MCohgFnKDtSRZYYVynhRJecgBz3gOdK96pYzLS/HrBCRCK2wLgGQ7e
DXHHO3byDe5nNLYIwgWvdgjGSpbjzsmmLA3hyjoK7oBas7vrpoF5/ODRz5CT2QbP
AWu5Pa5tDEQ8ZzEx2J+3qsKdYJnM3A==
=OE7m
-----END PGP SIGNATURE-----

--3nik46a6rq5z5thx--

--===============1093208636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1093208636==--
