Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F472030EB
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74AB6E12A;
	Mon, 22 Jun 2020 07:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728BC6E12A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 07:57:35 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1jnHKc-0001oP-PG; Mon, 22 Jun 2020 09:57:30 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1jnHKc-0002V0-Ec; Mon, 22 Jun 2020 09:57:30 +0200
Date: Mon, 22 Jun 2020 09:57:30 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 11/15] pwm: crc: Implement get_state() method
Message-ID: <20200622075730.lenaflptqnemagff@taurus.defre.kleine-koenig.org>
References: <20200620121758.14836-1-hdegoede@redhat.com>
 <20200620121758.14836-12-hdegoede@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200620121758.14836-12-hdegoede@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============0673925937=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0673925937==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mw6jshimogmdgtin"
Content-Disposition: inline


--mw6jshimogmdgtin
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 20, 2020 at 02:17:54PM +0200, Hans de Goede wrote:
> Implement the pwm_ops.get_state() method to complete the support for the
> new atomic PWM API.
>=20
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v3:
> - Add Andy's Reviewed-by tag
> - Remove extra whitespace to align some code after assignments (requested=
 by
>   Uwe Kleine-K=F6nig)
> ---
>  drivers/pwm/pwm-crc.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/drivers/pwm/pwm-crc.c b/drivers/pwm/pwm-crc.c
> index 8a7f4707279c..b311354d40a3 100644
> --- a/drivers/pwm/pwm-crc.c
> +++ b/drivers/pwm/pwm-crc.c
> @@ -119,8 +119,37 @@ static int crc_pwm_apply(struct pwm_chip *chip, stru=
ct pwm_device *pwm,
>  	return 0;
>  }
> =20
> +static void crc_pwm_get_state(struct pwm_chip *chip, struct pwm_device *=
pwm,
> +			       struct pwm_state *state)
> +{
> +	struct crystalcove_pwm *crc_pwm =3D to_crc_pwm(chip);
> +	struct device *dev =3D crc_pwm->chip.dev;
> +	unsigned int clk_div, clk_div_reg, duty_cycle_reg;
> +	int error;
> +
> +	error =3D regmap_read(crc_pwm->regmap, PWM0_CLK_DIV, &clk_div_reg);
> +	if (error) {
> +		dev_err(dev, "Error reading PWM0_CLK_DIV %d\n", error);
> +		return;
> +	}
> +
> +	error =3D regmap_read(crc_pwm->regmap, PWM0_DUTY_CYCLE, &duty_cycle_reg=
);
> +	if (error) {
> +		dev_err(dev, "Error reading PWM0_DUTY_CYCLE %d\n", error);
> +		return;
> +	}
> +
> +	clk_div =3D (clk_div_reg & ~PWM_OUTPUT_ENABLE) + 1;
> +
> +	state->period =3D clk_div * NSEC_PER_USEC * 256 / PWM_BASE_CLK_MHZ;
> +	state->duty_cycle =3D duty_cycle_reg * state->period / PWM_MAX_LEVEL;

Please round up here.

> +	state->polarity =3D PWM_POLARITY_NORMAL;
> +	state->enabled =3D !!(clk_div_reg & PWM_OUTPUT_ENABLE);
> +}
> +

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--mw6jshimogmdgtin
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl7wZGcACgkQwfwUeK3K
7AnHYQf/UHqz0iNoAxOSBKo9y/pZht9suxpbM0Dp6bl4N2KZwBFN1vRfXlrVWMJG
qWIz+M0A3GBYongVW69fl0CauYETSXE5fovQEmBVi6f+XcWHgH5LcktEXfBKPkY/
x0ZoDxdgT8/8ON4bLXxOmC0GaNV8/Ba5adw3mLO02RMYkTwOlL/v9uyS/++yXv6u
XrJla8RQxooyswhJAQHMrN8es6OrlHb3C2/kEr7Bk4Zdhr6JSmL6jcLKyGXmcwpv
fcc3RiYvvDU06sWU1Gw3W3qUqvoNRtFofHL7ocfsLzxqdAzWZqoQRSuLuHaxP/9n
jAO635ahwfhHvpPtCa1nnE5Gm8HRug==
=DPSI
-----END PGP SIGNATURE-----

--mw6jshimogmdgtin--

--===============0673925937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0673925937==--
