Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6549E21C28C
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 08:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2914C6E29A;
	Sat, 11 Jul 2020 06:32:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF076E29A
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jul 2020 06:32:30 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ju93i-0005t5-0o; Sat, 11 Jul 2020 08:32:26 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1ju93f-0005IS-VH; Sat, 11 Jul 2020 08:32:23 +0200
Date: Sat, 11 Jul 2020 08:32:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 16/16] drm/i915: panel: Use atomic PWM API for devs
 with an external PWM controller
Message-ID: <20200711063223.czly2ftjraomuxz6@pengutronix.de>
References: <20200708211432.28612-1-hdegoede@redhat.com>
 <20200708211432.28612-17-hdegoede@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200708211432.28612-17-hdegoede@redhat.com>
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
Cc: linux-pwm@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Type: multipart/mixed; boundary="===============1168645086=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1168645086==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5toxfcg27avm6ah7"
Content-Disposition: inline


--5toxfcg27avm6ah7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 08, 2020 at 11:14:32PM +0200, Hans de Goede wrote:
> Now that the PWM drivers which we use have been converted to the atomic
> PWM API, we can move the i915 panel code over to using the atomic PWM API.
>=20
> The removes a long standing FIXME and this removes a flicker where
> the backlight brightness would jump to 100% when i915 loads even if
> using the fastset path.
>=20
> Note that this commit also simplifies pwm_disable_backlight(), by dropping
> the intel_panel_actually_set_backlight(..., 0) call. This call sets the
> PWM to 0% duty-cycle. I believe that this call was only present as a
> workaround for a bug in the pwm-crc.c driver where it failed to clear the
> PWM_OUTPUT_ENABLE bit. This is fixed by an earlier patch in this series.
>=20
> After the dropping of this workaround, the usleep call, which seems
> unnecessary to begin with, has no useful effect anymore, so drop that too.
>=20
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v4:
> - Add a note to the commit message about the dropping of the
>   intel_panel_actually_set_backlight() and usleep() calls from
>   pwm_disable_backlight()
> - Use the pwm_set/get_relative_duty_cycle() helpers instead of using DIY =
code
>   for this
> ---
>  .../drm/i915/display/intel_display_types.h    |  3 +-
>  drivers/gpu/drm/i915/display/intel_panel.c    | 71 +++++++++----------
>  2 files changed, 34 insertions(+), 40 deletions(-)
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
> index cb28b9908ca4..3d97267c8238 100644
> --- a/drivers/gpu/drm/i915/display/intel_panel.c
> +++ b/drivers/gpu/drm/i915/display/intel_panel.c
> @@ -592,10 +592,10 @@ static u32 bxt_get_backlight(struct intel_connector=
 *connector)
>  static u32 pwm_get_backlight(struct intel_connector *connector)
>  {
>  	struct intel_panel *panel =3D &connector->panel;
> -	int duty_ns;
> +	struct pwm_state state;
> =20
> -	duty_ns =3D pwm_get_duty_cycle(panel->backlight.pwm);
> -	return DIV_ROUND_UP(duty_ns * 100, panel->backlight.pwm_period_ns);
> +	pwm_get_state(panel->backlight.pwm, &state);
> +	return pwm_get_relative_duty_cycle(&state, 100);

Here you introduce a slight difference: pwm_get_relative_duty_cycle uses
round-closest while you replace a round-up. Is this relevant?

>  }
> =20
>  static void lpt_set_backlight(const struct drm_connector_state *conn_sta=
te, u32 level)
> @@ -669,10 +669,9 @@ static void bxt_set_backlight(const struct drm_conne=
ctor_state *conn_state, u32
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
> +	pwm_set_relative_duty_cycle(&panel->backlight.pwm_state, level, 100);
> +	pwm_apply_state(panel->backlight.pwm, &panel->backlight.pwm_state);

Similar here: The function used to use round-up but
pwm_set_relative_duty_cycle() used round-closest.

>  }
> =20
>  static void
> @@ -841,10 +840,8 @@ static void pwm_disable_backlight(const struct drm_c=
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
>  }
> =20
>  void intel_panel_disable_backlight(const struct drm_connector_state *old=
_conn_state)
> @@ -1176,9 +1173,12 @@ static void pwm_enable_backlight(const struct inte=
l_crtc_state *crtc_state,
>  {
>  	struct intel_connector *connector =3D to_intel_connector(conn_state->co=
nnector);
>  	struct intel_panel *panel =3D &connector->panel;
> +	int level =3D panel->backlight.level;
> =20
> -	pwm_enable(panel->backlight.pwm);
> -	intel_panel_actually_set_backlight(conn_state, panel->backlight.level);
> +	level =3D intel_panel_compute_brightness(connector, level);
> +	pwm_set_relative_duty_cycle(&panel->backlight.pwm_state, level, 100);
> +	panel->backlight.pwm_state.enabled =3D true;
> +	pwm_apply_state(panel->backlight.pwm, &panel->backlight.pwm_state);
>  }
> =20
>  static void __intel_panel_enable_backlight(const struct intel_crtc_state=
 *crtc_state,
> @@ -1897,8 +1897,7 @@ static int pwm_setup_backlight(struct intel_connect=
or *connector,
>  	struct drm_i915_private *dev_priv =3D to_i915(dev);
>  	struct intel_panel *panel =3D &connector->panel;
>  	const char *desc;
> -	u32 level, ns;
> -	int retval;
> +	u32 level;
> =20
>  	/* Get the right PWM chip for DSI backlight according to VBT */
>  	if (dev_priv->vbt.dsi.config->pwm_blc =3D=3D PPS_BLC_PMIC) {
> @@ -1916,36 +1915,30 @@ static int pwm_setup_backlight(struct intel_conne=
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

What would pwm_is_enabled(panel->backlight.pwm) =3D=3D true &&
pwm_get_period(panel->backlight.pwm) =3D=3D 0 mean? I hope this doesn't
happen?!

> +		/* PWM is already enabled, use existing settings */
> +		pwm_get_state(panel->backlight.pwm, &panel->backlight.pwm_state);
> +
> +		level =3D pwm_get_relative_duty_cycle(&panel->backlight.pwm_state,
> +						    100);
> +		level =3D intel_panel_compute_brightness(connector, level);
> +		panel->backlight.level =3D clamp(level, panel->backlight.min,
> +					       panel->backlight.max);
> +		panel->backlight.enabled =3D true;
> +
> +		drm_dbg_kms(&dev_priv->drm, "PWM already enabled at freq %ld, VBT freq=
 %d, level %d\n",
> +			    NSEC_PER_SEC / panel->backlight.pwm_state.period,

=2Eperiod becomes a u64 soon, so be prepared to fixup here.

> +			    get_vbt_pwm_freq(dev_priv), level);
> +	} else {
> +		/* Set period from VBT frequency, leave other settings at 0. */
> +		panel->backlight.pwm_state.period =3D
> +			NSEC_PER_SEC / get_vbt_pwm_freq(dev_priv);
>  	}
> =20
> -	level =3D DIV_ROUND_UP(pwm_get_duty_cycle(panel->backlight.pwm) * 100,
> -			     panel->backlight.pwm_period_ns);
> -	level =3D intel_panel_compute_brightness(connector, level);
> -	panel->backlight.level =3D clamp(level, panel->backlight.min,
> -				       panel->backlight.max);
> -	panel->backlight.enabled =3D panel->backlight.level !=3D 0;
> -
>  	drm_info(&dev_priv->drm, "Using %s PWM for LCD backlight control\n",
>  		 desc);
>  	return 0;

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--5toxfcg27avm6ah7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl8JXPQACgkQwfwUeK3K
7AmARgf/Yqf9yllKAKgBwSL+hvteJGX6FSkCgkGUsjLUFVOlHpiQPwc7pcXEj1Qi
uVBpgJ5V2va8/qdPxHAzX2VySzwg15FSOezxtLbXjpETnZYPKnLEqVGXJ2JXU1vw
6CiMBFCtqvYpDtF0sA1EWtM/tqZw9o3yXy3YIqYtGH+I6VaoU1BWpHxUFy3PquRA
JCJQ38L5hlpdnabIVEmXLMX+XHRF+liYlkOGVXMMYJ3Y/hDHL2WUza1fzB4d94vk
xhQT80cFvgw9QWWTapn6Y+gywQCCGEXuKgQk+44yIwfR7yUJZMvfPqYU15PWL0IK
0xyyoFbTHR6D4+HwoNaXi17GKVwDUg==
=QXcV
-----END PGP SIGNATURE-----

--5toxfcg27avm6ah7--

--===============1168645086==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1168645086==--
