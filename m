Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8832167CA
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 09:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E0A6E0C8;
	Tue,  7 Jul 2020 07:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8497F6E0C8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 07:51:01 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1jsiNV-0001Qv-5P; Tue, 07 Jul 2020 09:50:57 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1jsiNU-0008Q4-I7; Tue, 07 Jul 2020 09:50:56 +0200
Date: Tue, 7 Jul 2020 09:50:56 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 15/15] drm/i915: panel: Use atomic PWM API for devs
 with an external PWM controller
Message-ID: <20200707075056.22w5kzi7qwhkctsn@pengutronix.de>
References: <20200620121758.14836-1-hdegoede@redhat.com>
 <20200620121758.14836-16-hdegoede@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200620121758.14836-16-hdegoede@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============2096871241=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2096871241==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3nm7jggltwdbequ7"
Content-Disposition: inline


--3nm7jggltwdbequ7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Hans,

On Sat, Jun 20, 2020 at 02:17:58PM +0200, Hans de Goede wrote:
> Now that the PWM drivers which we use have been converted to the atomic
> PWM API, we can move the i915 panel code over to using the atomic PWM API.

Note that there is no hard dependency, the atomic API should work just
fine even with a non-converted driver. (Of course a converted driver
behaves better, but the i915 using the atomic API with a non-converted
driver is just as good as the legacy API with the same driver.)

So regarding your plan to get this series in soon: There is no hard need
to halt the efforts for the drm part if the pwm patches take a bit
longer (or vice versa).
=20
> The removes a long standing FIXME and this removes a flicker where
> the backlight brightness would jump to 100% when i915 loads even if
> using the fastset path.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../drm/i915/display/intel_display_types.h    |  3 +-
>  drivers/gpu/drm/i915/display/intel_panel.c    | 73 +++++++++----------
>  2 files changed, 37 insertions(+), 39 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers=
/gpu/drm/i915/display/intel_display_types.h
> index de32f9efb120..4bd9981e70a1 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -28,6 +28,7 @@
> =20
>  #include <linux/async.h>
>  #include <linux/i2c.h>
> +#include <linux/pwm.h>
>  #include <linux/sched/clock.h>
> =20
>  #include <drm/drm_atomic.h>
> @@ -223,7 +224,7 @@ struct intel_panel {
>  		bool util_pin_active_low;	/* bxt+ */
>  		u8 controller;		/* bxt+ only */
>  		struct pwm_device *pwm;
> -		int pwm_period_ns;
> +		struct pwm_state pwm_state;
> =20
>  		/* DPCD backlight */
>  		u8 pwmgen_bit_count;
> diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm=
/i915/display/intel_panel.c
> index cb28b9908ca4..a0f76343f381 100644
> --- a/drivers/gpu/drm/i915/display/intel_panel.c
> +++ b/drivers/gpu/drm/i915/display/intel_panel.c
> @@ -592,10 +592,11 @@ static u32 bxt_get_backlight(struct intel_connector=
 *connector)
>  static u32 pwm_get_backlight(struct intel_connector *connector)
>  {
>  	struct intel_panel *panel =3D &connector->panel;
> -	int duty_ns;
> +	int duty_ns, period_ns;
> =20
>  	duty_ns =3D pwm_get_duty_cycle(panel->backlight.pwm);
> -	return DIV_ROUND_UP(duty_ns * 100, panel->backlight.pwm_period_ns);
> +	period_ns =3D pwm_get_period(panel->backlight.pwm);

The transformation is correct, but using

	pwm_get_state(pwm, &state);
	duty_ns =3D state.duty_cycle;
	period_ns =3D state.period;

is a bit more effective as it calls pwm_get_state() only once.

There is a function pwm_get_relative_duty_cycle which is similar (with
scale =3D 100) just used different rounding.

> +	return DIV_ROUND_UP(duty_ns * 100, period_ns);
>  }
> =20
>  static void lpt_set_backlight(const struct drm_connector_state *conn_sta=
te, u32 level)
> @@ -669,10 +670,10 @@ static void bxt_set_backlight(const struct drm_conn=
ector_state *conn_state, u32
>  static void pwm_set_backlight(const struct drm_connector_state *conn_sta=
te, u32 level)
>  {
>  	struct intel_panel *panel =3D &to_intel_connector(conn_state->connector=
)->panel;
> -	int duty_ns =3D DIV_ROUND_UP(level * panel->backlight.pwm_period_ns, 10=
0);
> =20
> -	pwm_config(panel->backlight.pwm, duty_ns,
> -		   panel->backlight.pwm_period_ns);
> +	panel->backlight.pwm_state.duty_cycle =3D
> +		DIV_ROUND_UP(level * panel->backlight.pwm_state.period, 100);
> +	pwm_apply_state(panel->backlight.pwm, &panel->backlight.pwm_state);
>  }
> =20
>  static void
> @@ -841,10 +842,8 @@ static void pwm_disable_backlight(const struct drm_c=
onnector_state *old_conn_sta
>  	struct intel_connector *connector =3D to_intel_connector(old_conn_state=
->connector);
>  	struct intel_panel *panel =3D &connector->panel;
> =20
> -	/* Disable the backlight */
> -	intel_panel_actually_set_backlight(old_conn_state, 0);
> -	usleep_range(2000, 3000);
> -	pwm_disable(panel->backlight.pwm);
> +	panel->backlight.pwm_state.enabled =3D false;
> +	pwm_apply_state(panel->backlight.pwm, &panel->backlight.pwm_state);

Did you drop intel_panel_actually_set_backlight and the sleep on purpose?

>  }
> =20
>  void intel_panel_disable_backlight(const struct drm_connector_state *old=
_conn_state)
> [...]
> @@ -1916,36 +1919,30 @@ static int pwm_setup_backlight(struct intel_conne=
ctor *connector,
>  		return -ENODEV;
>  	}
> =20
> -	panel->backlight.pwm_period_ns =3D NSEC_PER_SEC /
> -					 get_vbt_pwm_freq(dev_priv);
> -
> -	/*
> -	 * FIXME: pwm_apply_args() should be removed when switching to
> -	 * the atomic PWM API.
> -	 */
> -	pwm_apply_args(panel->backlight.pwm);
> -
>  	panel->backlight.max =3D 100; /* 100% */
>  	panel->backlight.min =3D get_backlight_min_vbt(connector);
> -	level =3D intel_panel_compute_brightness(connector, 100);
> -	ns =3D DIV_ROUND_UP(level * panel->backlight.pwm_period_ns, 100);
> =20
> -	retval =3D pwm_config(panel->backlight.pwm, ns,
> -			    panel->backlight.pwm_period_ns);
> -	if (retval < 0) {
> -		drm_err(&dev_priv->drm, "Failed to configure the pwm chip\n");
> -		pwm_put(panel->backlight.pwm);
> -		panel->backlight.pwm =3D NULL;
> -		return retval;
> +	if (pwm_is_enabled(panel->backlight.pwm) &&
> +	    pwm_get_period(panel->backlight.pwm)) {
> +		/* PWM is already enabled, use existing settings */
> +		pwm_get_state(panel->backlight.pwm, &panel->backlight.pwm_state);
> +
> +		level =3D DIV_ROUND_UP(panel->backlight.pwm_state.duty_cycle *
> +					100, panel->backlight.pwm_state.period);
> +		level =3D intel_panel_compute_brightness(connector, level);

In pwm_enable_backlight() the order of these two steps is reversed
compared to here. Maybe this calculation can be moved into
intel_panel_compute_brightness()?

> +		panel->backlight.level =3D clamp(level, panel->backlight.min,
> +					       panel->backlight.max);
> +		panel->backlight.enabled =3D true;
> +

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--3nm7jggltwdbequ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl8EKV0ACgkQwfwUeK3K
7AkhIAf/bQSYXCRy/ubZ8YgFo1OABj1iStigerYaBipn5+Aq76CcYfbXHCEzEJ0L
hHdOogbiKAyWpKtgaATLM3JA99zVgq2w8BkpnFnE7Y4wWzlGrOMZjwLafjK3nfS9
kMGPuYZkH1t66X3oGN6mMQOFHpTSSY6treiRS5m5q6MNbF6WyXVKRmsO3i7TPp2v
+a9V4HfUg6k4y/ZMPTr4bxfz6U6ZTJUWk0+YMyLrxE0Zc7/nncF9/Yw0yluqQ6QH
28sV8m9OTA2sN/2OGIrPsQJObhhFpMar7idJK3wdKnjO5hHhZSQLLKI6O0Mbu1YB
zqtRqwdTgRG21N/wvuR7cWW59zKGOw==
=xGNU
-----END PGP SIGNATURE-----

--3nm7jggltwdbequ7--

--===============2096871241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2096871241==--
