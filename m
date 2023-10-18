Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D499D7CE9B7
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 23:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F34010E027;
	Wed, 18 Oct 2023 21:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5335F10E027
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 21:07:47 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtDlW-0006yC-NC; Wed, 18 Oct 2023 23:07:42 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtDlV-002dWq-Uy; Wed, 18 Oct 2023 23:07:41 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qtDlV-001Fj5-L5; Wed, 18 Oct 2023 23:07:41 +0200
Date: Wed, 18 Oct 2023 23:07:41 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] backlight: pwm_bl: Avoid backlight flicker applying
 initial PWM state
Message-ID: <20231018210741.6t3yfj6qgmpwhhlo@pengutronix.de>
References: <20230608-backlight-pwm-avoid-flicker-v1-1-afd380d50174@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uwavnvilwrar6zje"
Content-Disposition: inline
In-Reply-To: <20230608-backlight-pwm-avoid-flicker-v1-1-afd380d50174@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Cc: linux-pwm@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--uwavnvilwrar6zje
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Philipp,

On Thu, Jun 08, 2023 at 04:11:14PM +0200, Philipp Zabel wrote:
> The initial PWM state returned by pwm_init_state() has a duty cycle
> of 0 ns.

This is only true for drivers without a .get_state() callback, isn't it?

> To avoid backlight flicker when taking over an enabled
> display from the bootloader, skip the initial pwm_apply_state()
> and leave the PWM be until backlight_update_state() will apply the
> state with the desired brightness.
>=20
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> With a PWM driver that allows to inherit PWM state from the bootloader,
> postponing the initial pwm_apply_state() with 0 ns duty cycle allows to
> set the desired duty cycle before the PWM is set, avoiding a short flicker
> if the backlight was previously enabled and will be enabled again.
> ---
>  drivers/video/backlight/pwm_bl.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/p=
wm_bl.c
> index fce412234d10..47a917038f58 100644
> --- a/drivers/video/backlight/pwm_bl.c
> +++ b/drivers/video/backlight/pwm_bl.c
> @@ -531,12 +531,10 @@ static int pwm_backlight_probe(struct platform_devi=
ce *pdev)
>  	if (!state.period && (data->pwm_period_ns > 0))
>  		state.period =3D data->pwm_period_ns;
> =20
> -	ret =3D pwm_apply_state(pb->pwm, &state);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to apply initial PWM state: %d\n",
> -			ret);
> -		goto err_alloc;
> -	}
> +	/*
> +	 * No need to apply initial state, except in the error path.

Why do you want to modify the PWM in the error path? I would have
expected not touching it at all in .probe() is fine?!

> +	 * State will be applied by backlight_update_status() on success.
> +	 */
> =20
>  	memset(&props, 0, sizeof(struct backlight_properties));
> =20

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--uwavnvilwrar6zje
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUwSRwACgkQj4D7WH0S
/k4IYQgAqdMfaMxID6OyAlObAmlCPzwo9zZSaixG39XE1UfAxDEGF29uEKbIY5Uz
9c48ihdHh++fpxWt7xKhA4KXjtEoSPwWUCnaXCUJ0KVfXDh/xA0+IzDEtr1Z6Lyx
NoyUwxiH40HE2XcxVVSl3GqHh1WZJeEcL2UbPhqE9NS/gE75N4EZbP7I+ysmRZeD
fbM0KLMfTpUi+uPaujjQxKJRG+z0GpQ8sHrOv2kfdcnKRRqy80Uua1/QRgo12NFr
50BVmVIlqMsa/N4YtulbGIipw67/u5i2TvBZzyinZg2MlENQgbbS62RLy9eqf/Su
0W9LfKkRn2M5ZBr97rt15Opoa/ejYw==
=IXwW
-----END PGP SIGNATURE-----

--uwavnvilwrar6zje--
