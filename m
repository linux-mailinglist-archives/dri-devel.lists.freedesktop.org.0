Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9512D2554
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63316E09A;
	Tue,  8 Dec 2020 08:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A4E6E09A
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 08:04:45 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1kmXz9-0001CZ-Ua; Tue, 08 Dec 2020 09:04:35 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1kmXz7-00047B-Bt; Tue, 08 Dec 2020 09:04:33 +0100
Date: Tue, 8 Dec 2020 09:04:33 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Implement the pwm_chip
Message-ID: <20201208080433.szy7dek2qvn3d4vb@pengutronix.de>
References: <20201208044022.972872-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20201208044022.972872-1-bjorn.andersson@linaro.org>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
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
Cc: linux-pwm@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Doug Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: multipart/mixed; boundary="===============1432507929=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1432507929==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4uvrfzmltgxuhkh5"
Content-Disposition: inline


--4uvrfzmltgxuhkh5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Dec 07, 2020 at 10:40:22PM -0600, Bjorn Andersson wrote:
> The SN65DSI86 provides the ability to supply a PWM signal on GPIO 4,
> with the primary purpose of controlling the backlight of the attached
> panel. Add an implementation that exposes this using the standard PWM
> framework, to allow e.g. pwm-backlight to expose this to the user.
>=20
> Special thanks to Doug Anderson for suggestions related to the involved
> math.

Did you test this with CONFIG_PWM_DEBUG? (I think you didn't, because
otherwise there would be a .get_state callback.)

> @@ -162,6 +171,12 @@ struct ti_sn_bridge {
>  	struct gpio_chip		gchip;
>  	DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
>  #endif
> +#if defined(CONFIG_PWM)

Would it make sense to introduce a separate config symbol for this?
Something like CONFIG_PWM_SN65DSI87?

> +	struct pwm_chip			pchip;
> +	bool				pwm_enabled;
> +	unsigned int			pwm_refclk;
> +	atomic_t			pwm_pin_busy;

struct ti_sn_bridge has a kernel doc comment describing all members,
please add a description of the members you introduced here. Please also
point out that you use pwm_pin_busy to protect against concurrent use of
the pin as PWM and GPIO.

> +#endif
>  };
> =20
>  static const struct regmap_range ti_sn_bridge_volatile_ranges[] =3D {
> @@ -499,6 +514,14 @@ static void ti_sn_bridge_set_refclk_freq(struct ti_s=
n_bridge *pdata)
> =20
>  	regmap_update_bits(pdata->regmap, SN_DPPLL_SRC_REG, REFCLK_FREQ_MASK,
>  			   REFCLK_FREQ(i));
> +
> +#if defined(CONFIG_PWM)
> +	/*
> +	 * The PWM refclk is based on the value written to SN_DPPLL_SRC_REG,
> +	 * regardless of its actual sourcing.
> +	 */
> +	pdata->pwm_refclk =3D ti_sn_bridge_refclk_lut[i];
> +#endif

I don't understand this code. 'i' seems to be something more special
than a counter variable, so I wonder if it should have a better name.
(This is however an issue separate from this patch, but it would be
great to first make the code a bit better understandable. Or is this
only me?)

>  }
> =20
>  static void ti_sn_bridge_set_dsi_rate(struct ti_sn_bridge *pdata)
> @@ -981,6 +1004,161 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_s=
n_bridge *pdata)
>  	return 0;
>  }
> =20
> +#if defined(CONFIG_PWM)
> +static int ti_sn_pwm_pin_request(struct ti_sn_bridge *pdata)
> +{
> +	return atomic_xchg(&pdata->pwm_pin_busy, 1) ? -EBUSY : 0;
> +}
> +
> +static void ti_sn_pwm_pin_release(struct ti_sn_bridge *pdata)
> +{
> +	atomic_set(&pdata->pwm_pin_busy, 0);
> +}
> +
> +static struct ti_sn_bridge *
> +pwm_chip_to_ti_sn_bridge(struct pwm_chip *chip)

All your functions share the same function prefix (which is fine), but
this one doesn't.

> +{
> +	return container_of(chip, struct ti_sn_bridge, pchip);
> +}
> [...]
> +	if (state->enabled) {
> +		/*
> +		 * Per the datasheet the PWM frequency is given by:
> +		 *
> +		 * PWM_FREQ =3D REFCLK_FREQ / (PWM_PRE_DIV * BACKLIGHT_SCALE + 1)
> +		 *
> +		 * In order to find the PWM_FREQ that best suits the requested
> +		 * state->period, the PWM_PRE_DIV is calculated with the
> +		 * maximum possible number of steps (BACKLIGHT_SCALE_MAX). The
> +		 * actual BACKLIGHT_SCALE is then adjusted down to match the
> +		 * requested period.
> +		 *
> +		 * The BACKLIGHT value is then calculated against the
> +		 * BACKLIGHT_SCALE, based on the requested duty_cycle and
> +		 * period.
> +		 */
> +		pwm_freq =3D NSEC_PER_SEC / state->period;

Here you should better have some range checking. Consider for example
state->period being > NSEC_PER_SEC. (Hint: This makes pwm_freq =3D 0 and
in the next line you divide by pwm_freq.)

> +		pre_div =3D DIV_ROUND_UP(pdata->pwm_refclk / pwm_freq - 1, BACKLIGHT_S=
CALE_MAX);
> +		scale =3D (pdata->pwm_refclk / pwm_freq - 1) / pre_div;

I'm still trying to wrap my head around this calculation, but dividing
by the result of a division is always loosing precision. This is really
involved and I'm willing to bet this can be done easier and with more
precision.

=2E.. some time later ...

You wrote "PWM_FREQ =3D REFCLK_FREQ / (PWM_PRE_DIV * BACKLIGHT_SCALE + 1)",
so (I think) that means you have:

	period =3D (PWM_PRE_DIV * BACKLIGHT_SCALE + 1) / refclk

right? I deduce from your formula how the duty_cycle is defined and I
think it's:

	duty_cycle =3D (PWM_PRE_DIV * BACKLIGHT + 1) / refclk

is this right? And now your idea to "best suite the requested period" is
to select a small divider such that you can still use a big value in
SCALE to define the period and so have a fine separation for the
duty_cycle, right?

I will stop doing maths here now until you confirm my steps up to now
are right.

> +		backlight =3D scale * state->duty_cycle / state->period;

This is an u64 division, you must use do_div for that. Also you're
losing precision here.

> +		ret =3D regmap_write(pdata->regmap, SN_PWM_PRE_DIV_REG, pre_div);
> +		if (ret) {
> +			dev_err(pdata->dev, "failed to update PWM_PRE_DIV\n");
> +			goto out;
> +		}
> +
> +		ti_sn_bridge_write_u16(pdata, SN_BACKLIGHT_SCALE_REG, scale);
> +		ti_sn_bridge_write_u16(pdata, SN_BACKLIGHT_REG, backlight);

How does the PWM behave in between these writes? Are the register values
shadowed until the third write happens (which would be the optimum), or
does this result in (maybe) emitting an output wave that doesn't
correspond to the requested setting (assuming the PWM is already enabled
of course)?

What happens if the value written to SN_BACKLIGHT_SCALE_REG is less than
the previous value in SN_BACKLIGHT_REG? ti_sn_bridge_write_u16 wraps two
regmap writes, is there a race, too?

> +	}
> +
> +	pwm_en_inv =3D FIELD_PREP(BIT(1), !!state->enabled) |
> +		     FIELD_PREP(BIT(0), state->polarity =3D=3D PWM_POLARITY_INVERSED);

Please introduce symbolic names for BIT(1) and BIT(0) here.

How does the hardware behave with the enable bit unset? Does it emit the
inactive level according to the polarity bit?

> +	ret =3D regmap_write(pdata->regmap, SN_PWM_EN_INV_REG, pwm_en_inv);
> +	if (ret) {
> +		dev_err(pdata->dev, "failed to update PWM_EN/PWM_INV\n");
> +		goto out;
> +	}
> +
> +	pdata->pwm_enabled =3D !!state->enabled;
> +out:
> +
> +	if (!pdata->pwm_enabled)
> +		pm_runtime_put_sync(pdata->dev);
> +
> +	return ret;
> +}
> +
> [...]
> +static struct pwm_device *ti_sn_pwm_of_xlate(struct pwm_chip *pc,
> +					     const struct of_phandle_args *args)
> +{
> +	struct pwm_device *pwm;
> +
> +	if (args->args_count !=3D 1)
> +		return ERR_PTR(-EINVAL);
> +
> +	pwm =3D pwm_request_from_chip(pc, 0, NULL);
> +	if (IS_ERR(pwm))
> +		return pwm;
> +
> +	pwm->args.period =3D args->args[0];
> +
> +	return pwm;
> +}

This is done to optimise away the 0 needed in each phandle to implement
the "usual" pwm binding. IMHO this function should either move into the
pwm core, or you should stick to the usual binding.

Apropos binding: Is there already a binding document for the hardware?
You should expand it to describe your additions.

> @@ -1282,6 +1476,12 @@ static int ti_sn_bridge_probe(struct i2c_client *c=
lient,
>  		return ret;
>  	}
> =20
> +	ret =3D ti_sn_setup_pwmchip(pdata);
> +	if (ret)  {
> +		pm_runtime_disable(pdata->dev);
> +		return ret;
> +	}

I'm not sure about the purpose of the containing hardware, but I wonder
if it would be saner to not break probing of the device if adding the
PWM functionality fails. Ideally the driver would provide an mfd driver
that allows its components to be probed independently.

>  	i2c_set_clientdata(client, pdata);
> =20
>  	pdata->aux.name =3D "ti-sn65dsi86-aux";
> @@ -1320,6 +1520,8 @@ static int ti_sn_bridge_remove(struct i2c_client *c=
lient)
> =20
>  	drm_bridge_remove(&pdata->bridge);
> =20
> +	ti_sn_remove_pwmchip(pdata);
> +
>  	return 0;

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4uvrfzmltgxuhkh5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl/PM44ACgkQwfwUeK3K
7Ak/Pgf+Ipt5/DvWkzrssAOU7xprddf4muXBxkoYz10o7JzCGWZM1fqHoRli0Ntr
sky7x0riw2EMVjWiOwVQsNdRdQuPqBqSTXL7UstjgPa5tSFV4jzu8HrHv+hpIE4K
K4R71AeaTfLTQKrQEkvf4Ob/R4/9qnBnhgLVMfPFNHMuBRFsaGmOInE9mgTWMyIC
OIPLoX7xYvzB/6T7gE/ZsUOIr7ZR9TKkCQaWNAT7ngXgQXl23abirY+ZXeARubJX
Vsz3BIX50Hd6NAkbl+TcOQjhE+L3K+mmWcjN/cZ2zN+/5F+e3HfxHqAT+sjz5uIn
FIUufFqHxCbr5oKHStsT2tMvrY3SxQ==
=rExz
-----END PGP SIGNATURE-----

--4uvrfzmltgxuhkh5--

--===============1432507929==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1432507929==--
