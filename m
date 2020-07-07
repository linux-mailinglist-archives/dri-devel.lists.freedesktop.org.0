Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BD821675B
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 09:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6FE6E50E;
	Tue,  7 Jul 2020 07:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81A36E50E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 07:26:50 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1jsi06-0007JH-4T; Tue, 07 Jul 2020 09:26:46 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1jsi05-0007ka-H3; Tue, 07 Jul 2020 09:26:45 +0200
Date: Tue, 7 Jul 2020 09:26:45 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 09/15] pwm: crc: Enable/disable PWM output on
 enable/disable
Message-ID: <20200707072645.yslit4azu2wsxzpj@pengutronix.de>
References: <20200620121758.14836-1-hdegoede@redhat.com>
 <20200620121758.14836-10-hdegoede@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200620121758.14836-10-hdegoede@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============0750474172=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0750474172==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tov2tovhwcblij4z"
Content-Disposition: inline


--tov2tovhwcblij4z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, Jun 20, 2020 at 02:17:52PM +0200, Hans de Goede wrote:
> The pwm-crc code is using 2 different enable bits:
> 1. bit 7 of the PWM0_CLK_DIV (PWM_OUTPUT_ENABLE)
> 2. bit 0 of the BACKLIGHT_EN register
>=20
> So far we've kept the PWM_OUTPUT_ENABLE bit set when disabling the PWM,
> this commit makes crc_pwm_disable() clear it on disable and makes
> crc_pwm_enable() set it again on re-enable.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v3:
> - Remove paragraph about tri-stating the output from the commit message,
>   we don't have a datasheet so this was just an unfounded guess
> ---
>  drivers/pwm/pwm-crc.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/pwm/pwm-crc.c b/drivers/pwm/pwm-crc.c
> index 81232da0c767..b72008c9b072 100644
> --- a/drivers/pwm/pwm-crc.c
> +++ b/drivers/pwm/pwm-crc.c
> @@ -54,7 +54,9 @@ static int crc_pwm_calc_clk_div(int period_ns)
>  static int crc_pwm_enable(struct pwm_chip *c, struct pwm_device *pwm)
>  {
>  	struct crystalcove_pwm *crc_pwm =3D to_crc_pwm(c);
> +	int div =3D crc_pwm_calc_clk_div(pwm_get_period(pwm));
> =20
> +	regmap_write(crc_pwm->regmap, PWM0_CLK_DIV, div | PWM_OUTPUT_ENABLE);
>  	regmap_write(crc_pwm->regmap, BACKLIGHT_EN, 1);
> =20
>  	return 0;
> @@ -63,8 +65,10 @@ static int crc_pwm_enable(struct pwm_chip *c, struct p=
wm_device *pwm)
>  static void crc_pwm_disable(struct pwm_chip *c, struct pwm_device *pwm)
>  {
>  	struct crystalcove_pwm *crc_pwm =3D to_crc_pwm(c);
> +	int div =3D crc_pwm_calc_clk_div(pwm_get_period(pwm));
> =20
>  	regmap_write(crc_pwm->regmap, BACKLIGHT_EN, 0);
> +	regmap_write(crc_pwm->regmap, PWM0_CLK_DIV, div);
>  }
> =20
>  static int crc_pwm_config(struct pwm_chip *c, struct pwm_device *pwm,

In the absence of documentation this looks reasonable.

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--tov2tovhwcblij4z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl8EI7IACgkQwfwUeK3K
7AkPpwf+Mmfir4POt5sx+VtMudgcnCKCoep/ieXA+8/WK9XBngE3pU2Dktmt8ntH
KNnX6jDmGNgQ2+SXPTPxJrxrssIe0gmuKB9YmyJK+zAM51vx9RgYRGUUDlrdArDq
hel8X6qRPKY6ZOoyIQXc5orPuOfce/xu84ykPyGO1GtcX40GhuwjeQ/gbcljMSQS
NaZ23cQDxdDuA3/or0SL0AAw1nAUyLnn+9QZg38Cpq3EgZ+2Wk5U3AL5jkSmWWc3
5jWCiT3BmmL/p+zx1MIxvd1BYa0kKcPheuFBApE00jrgB+wGjy6mM2/Hoz6qdkOd
+go7zQmPTsLUvefpGuLfH/VHxmFwWA==
=41Bs
-----END PGP SIGNATURE-----

--tov2tovhwcblij4z--

--===============0750474172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0750474172==--
