Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3453A9482
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 09:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE5C6E51B;
	Wed, 16 Jun 2021 07:56:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B12E6E51B
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 07:56:51 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ltQPj-00021L-C4; Wed, 16 Jun 2021 09:56:43 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1ltQPe-0001Yn-4D; Wed, 16 Jun 2021 09:56:38 +0200
Date: Wed, 16 Jun 2021 09:56:37 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 2/2] drm/bridge: ti-sn65dsi86: Implement the pwm_chip
Message-ID: <20210616075637.jtoa25uyhnqkctlu@pengutronix.de>
References: <20210615231828.835164-1-bjorn.andersson@linaro.org>
 <20210615231828.835164-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dlth42nyk4uy6ajp"
Content-Disposition: inline
In-Reply-To: <20210615231828.835164-2-bjorn.andersson@linaro.org>
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
Cc: linux-pwm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Doug Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dlth42nyk4uy6ajp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Bjorn,

On Tue, Jun 15, 2021 at 06:18:28PM -0500, Bjorn Andersson wrote:
> The SN65DSI86 provides the ability to supply a PWM signal on GPIO 4,
> with the primary purpose of controlling the backlight of the attached
> panel. Add an implementation that exposes this using the standard PWM
> framework, to allow e.g. pwm-backlight to expose this to the user.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>=20
> Changes since v1:
> - Rebased ontop of Doug's auxiliary_bus patches
> - Reworked the math, per Uwe's request
> - Added pwm_chip->get_state and made sure it's happy (only tested with a =
few
>   limited periods, such as 1kHz)
>=20
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 298 +++++++++++++++++++++++++-
>  1 file changed, 297 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index 5d712c8c3c3b..8f11c9b2da48 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -4,6 +4,7 @@
>   * datasheet: https://www.ti.com/lit/ds/symlink/sn65dsi86.pdf
>   */
> =20
> +#include <linux/atomic.h>
>  #include <linux/auxiliary_bus.h>
>  #include <linux/bits.h>
>  #include <linux/clk.h>
> @@ -15,6 +16,7 @@
>  #include <linux/module.h>
>  #include <linux/of_graph.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pwm.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
> =20
> @@ -91,6 +93,13 @@
>  #define SN_ML_TX_MODE_REG			0x96
>  #define  ML_TX_MAIN_LINK_OFF			0
>  #define  ML_TX_NORMAL_MODE			BIT(0)
> +#define SN_PWM_PRE_DIV_REG			0xA0
> +#define SN_BACKLIGHT_SCALE_REG			0xA1
> +#define  BACKLIGHT_SCALE_MAX			0xFFFF
> +#define SN_BACKLIGHT_REG			0xA3
> +#define SN_PWM_EN_INV_REG			0xA5
> +#define  SN_PWM_INV_MASK			BIT(0)
> +#define  SN_PWM_EN_MASK				BIT(1)
>  #define SN_AUX_CMD_STATUS_REG			0xF4
>  #define  AUX_IRQ_STATUS_AUX_RPLY_TOUT		BIT(3)
>  #define  AUX_IRQ_STATUS_AUX_SHORT		BIT(5)
> @@ -113,11 +122,14 @@
> =20
>  #define SN_LINK_TRAINING_TRIES		10
> =20
> +#define SN_PWM_GPIO_IDX			3 /* 4th GPIO */
> +
>  /**
>   * struct ti_sn65dsi86 - Platform data for ti-sn65dsi86 driver.
>   * @bridge_aux:   AUX-bus sub device for MIPI-to-eDP bridge functionalit=
y.
>   * @gpio_aux:     AUX-bus sub device for GPIO controller functionality.
>   * @aux_aux:      AUX-bus sub device for eDP AUX channel functionality.
> + * @pwm_aux:      AUX-bus sub device for PWM controller functionality.
>   *
>   * @dev:          Pointer to the top level (i2c) device.
>   * @regmap:       Regmap for accessing i2c.
> @@ -145,11 +157,17 @@
>   *                bitmap so we can do atomic ops on it without an extra
>   *                lock so concurrent users of our 4 GPIOs don't stomp on
>   *                each other's read-modify-write.
> + *
> + * @pchip:        pwm_chip if the PWM is exposed.
> + * @pwm_enabled:  Used to track if the PWM signal is currently enabled.
> + * @pwm_refclk_freq: Cache for the reference clock input to the PWM.
> + * @pwm_pin_busy: Track if GPIO4 is currently requested for GPIO or PWM.
>   */
>  struct ti_sn65dsi86 {
>  	struct auxiliary_device		bridge_aux;
>  	struct auxiliary_device		gpio_aux;
>  	struct auxiliary_device		aux_aux;
> +	struct auxiliary_device		pwm_aux;
> =20
>  	struct device			*dev;
>  	struct regmap			*regmap;
> @@ -172,6 +190,12 @@ struct ti_sn65dsi86 {
>  	struct gpio_chip		gchip;
>  	DECLARE_BITMAP(gchip_output, SN_NUM_GPIOS);
>  #endif
> +#if defined(CONFIG_PWM)
> +	struct pwm_chip			pchip;
> +	bool				pwm_enabled;
> +	unsigned int			pwm_refclk_freq;
> +	atomic_t			pwm_pin_busy;
> +#endif
>  };
> =20
>  static const struct regmap_range ti_sn65dsi86_volatile_ranges[] =3D {
> @@ -190,6 +214,25 @@ static const struct regmap_config ti_sn65dsi86_regma=
p_config =3D {
>  	.cache_type =3D REGCACHE_NONE,
>  };
> =20
> +static int ti_sn65dsi86_read_u16(struct ti_sn65dsi86 *pdata,
> +				 unsigned int reg, u16 *val)
> +{
> +	unsigned int tmp;
> +	int ret;
> +
> +	ret =3D regmap_read(pdata->regmap, reg, &tmp);
> +	if (ret)
> +		return ret;
> +	*val =3D tmp;
> +
> +	ret =3D regmap_read(pdata->regmap, reg + 1, &tmp);
> +	if (ret)
> +		return ret;
> +	*val |=3D tmp << 8;
> +
> +	return 0;
> +}
> +
>  static void ti_sn65dsi86_write_u16(struct ti_sn65dsi86 *pdata,
>  				   unsigned int reg, u16 val)
>  {
> @@ -253,6 +296,14 @@ static void ti_sn_bridge_set_refclk_freq(struct ti_s=
n65dsi86 *pdata)
> =20
>  	regmap_update_bits(pdata->regmap, SN_DPPLL_SRC_REG, REFCLK_FREQ_MASK,
>  			   REFCLK_FREQ(i));
> +
> +#if defined(CONFIG_PWM)
> +	/*
> +	 * The PWM refclk is based on the value written to SN_DPPLL_SRC_REG,
> +	 * regardless of its actual sourcing.
> +	 */
> +	pdata->pwm_refclk_freq =3D ti_sn_bridge_refclk_lut[i];
> +#endif
>  }
> =20
>  static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata)
> @@ -1044,6 +1095,221 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_=
sn65dsi86 *pdata)
>  	return 0;
>  }
> =20
> +#if defined(CONFIG_PWM)
> +static int ti_sn_pwm_pin_request(struct ti_sn65dsi86 *pdata)
> +{
> +	return atomic_xchg(&pdata->pwm_pin_busy, 1) ? -EBUSY : 0;
> +}
> +
> +static void ti_sn_pwm_pin_release(struct ti_sn65dsi86 *pdata)
> +{
> +	atomic_set(&pdata->pwm_pin_busy, 0);
> +}
> +
> +static struct ti_sn65dsi86 *pwm_chip_to_ti_sn_bridge(struct pwm_chip *ch=
ip)
> +{
> +	return container_of(chip, struct ti_sn65dsi86, pchip);
> +}
> +
> +static int ti_sn_pwm_request(struct pwm_chip *chip, struct pwm_device *p=
wm)
> +{
> +	struct ti_sn65dsi86 *pdata =3D pwm_chip_to_ti_sn_bridge(chip);
> +
> +	return ti_sn_pwm_pin_request(pdata);
> +}
> +
> +static void ti_sn_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
> +{
> +	struct ti_sn65dsi86 *pdata =3D pwm_chip_to_ti_sn_bridge(chip);
> +
> +	ti_sn_pwm_pin_release(pdata);
> +}
> +
> +static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> +			   const struct pwm_state *state)
> +{
> +	struct ti_sn65dsi86 *pdata =3D pwm_chip_to_ti_sn_bridge(chip);
> +	unsigned int pwm_en_inv;
> +	unsigned int backlight;
> +	unsigned int pre_div;
> +	unsigned int scale;
> +	int ret;
> +
> +	if (!pdata->pwm_enabled) {
> +		ret =3D pm_runtime_get_sync(pdata->dev);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret =3D regmap_update_bits(pdata->regmap, SN_GPIO_CTRL_REG,
> +				SN_GPIO_MUX_MASK << (2 * SN_PWM_GPIO_IDX),
> +				SN_GPIO_MUX_SPECIAL << (2 * SN_PWM_GPIO_IDX));
> +		if (ret) {
> +			dev_err(pdata->dev, "failed to mux in PWM function\n");
> +			goto out;
> +		}

Do you need to do this even if state->enabled is false? Does this
already modify the output pin?

> +	}
> +
> +	if (state->enabled) {
> +		/*
> +		 * Per the datasheet the PWM frequency is given by:
> +		 *
> +		 *   PWM_FREQ =3D REFCLK_FREQ / (PWM_PRE_DIV * BACKLIGHT_SCALE + 1)
> +		 *
> +		 * which can be rewritten:
> +		 *
> +		 *   T_pwm * REFCLK_FREQ - 1 =3D PWM_PRE_DIV * BACKLIGHT_SCALE
> +		 *
> +		 * In order to keep BACKLIGHT_SCALE within its 16 bits, PWM_PRE_DIV
> +		 * must be:
> +		 *
> +		 *   PWM_PRE_DIV >=3D (T_pwm * REFCLK_FREQ - 1) / BACKLIGHT_SCALE_MAX;
> +		 *
> +		 * To simplify the search and optimize the resolution of the PWM, the
> +		 * lowest possible PWM_PRE_DIV is used. Finally the scale is calculated
> +		 * as:
> +		 *
> +		 *   BACKLIGHT_SCALE =3D (T_pwm * REFCLK_FREQ - 1) / PWM_PRE_DIV
> +		 *
> +		 * Here T_pwm is represented in seconds, so appropriate scaling to
> +		 * nanoseconds is necessary.
> +		 */

Very nice.

> +		pre_div =3D DIV_ROUND_UP((state->period * pdata->pwm_refclk_freq - 1),
> +				       (NSEC_PER_SEC * BACKLIGHT_SCALE_MAX));

		if (pre_div > 0xffff)
			pre_div =3D 0xffff;

is needed here. (Assuming 0xffff is the bigest valid value for PRE_DIV.)

> +		scale =3D (state->period * pdata->pwm_refclk_freq - 1) / (NSEC_PER_SEC=
 * pre_div);

There is something wrong here. Consider:

	pdata->pwm_refclk_freq =3D 3333334
	state->period =3D 100000
	state->duty_cycle =3D 600

then you calculate:

	pre_div =3D 1
	scale =3D 333

which yields an actual period of 100199.98 ns. However you should get a
period less or equal than the requested period.

It took me some time to spot the problem: Only state->period *
pdata->pwm_refclk_freq must be divided by NSEC_PER_SEC, but not the -1.

So the right formula is:

	scale =3D (state->period * pdata->pwm_refclk_freq - NSEC_PER_SEC) / (NSEC_=
PER_SEC * pre_div);

(but you have to pay attention, the dividend might be negative in this
formula).

> +		/*
> +		 * The duty ratio is given as:
> +		 *
> +		 *   duty =3D BACKLIGHT / (BACKLIGHT_SCALE + 1)
> +		 */
> +		backlight =3D state->duty_cycle * (scale + 1) / state->period;

Lets continue the above example with the fixed calculation. So we have:

	pdata->pwm_refclk_freq =3D 3333334
	state->period =3D 100000 [ns]
	state->duty_cycle =3D 600
	scale =3D 332

so the actually emitted period =3D 99899.98002000399 ns

Now you calculate:

	backlight =3D 1

which yields an actual duty_cycle of 299.99994 ns, with backlight =3D 2
you would get an actual duty_cycle of 599.99988 ns, which is better. The
culprit here is that you divide by state->period but instead should
divide by the actual period.

> +
> +		ret =3D regmap_write(pdata->regmap, SN_PWM_PRE_DIV_REG, pre_div);
> +		if (ret) {
> +			dev_err(pdata->dev, "failed to update PWM_PRE_DIV\n");
> +			goto out;
> +		}
> +
> +		ti_sn65dsi86_write_u16(pdata, SN_BACKLIGHT_SCALE_REG, scale);
> +		ti_sn65dsi86_write_u16(pdata, SN_BACKLIGHT_REG, backlight);

How does the output behave between these register writes? Can it happen
that it emits a wave for corresponding to (e.g.) the new pre_div value
but the old scale and backlight?


> +	}
> +
> +	pwm_en_inv =3D FIELD_PREP(SN_PWM_EN_MASK, !!state->enabled) |
> +		     FIELD_PREP(SN_PWM_INV_MASK, state->polarity =3D=3D PWM_POLARITY_I=
NVERSED);
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
> +static void ti_sn_pwm_get_state(struct pwm_chip *chip, struct pwm_device=
 *pwm,
> +				struct pwm_state *state)
> +{
> +	struct ti_sn65dsi86 *pdata =3D pwm_chip_to_ti_sn_bridge(chip);
> +	unsigned int pwm_en_inv;
> +	unsigned int pre_div;
> +	u16 backlight;
> +	u16 scale;
> +	int ret;
> +
> +	ret =3D regmap_read(pdata->regmap, SN_PWM_EN_INV_REG, &pwm_en_inv);
> +	if (ret)
> +		return;
> +
> +	ret =3D ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_SCALE_REG, &scale);
> +	if (ret)
> +		return;
> +
> +	ret =3D ti_sn65dsi86_read_u16(pdata, SN_BACKLIGHT_REG, &backlight);
> +	if (ret)
> +		return;
> +
> +	ret =3D regmap_read(pdata->regmap, SN_PWM_PRE_DIV_REG, &pre_div);
> +	if (ret)
> +		return;
> +
> +	state->enabled =3D FIELD_GET(SN_PWM_EN_MASK, pwm_en_inv);
> +	if (FIELD_GET(SN_PWM_INV_MASK, pwm_en_inv))
> +		state->polarity =3D PWM_POLARITY_INVERSED;
> +	else
> +		state->polarity =3D PWM_POLARITY_NORMAL;
> +
> +	state->period =3D NSEC_PER_SEC * (pre_div * scale + 1) / pdata->pwm_ref=
clk_freq;

round up here please. Then applying the result of .get_state() is
a noop (as it should be).

> +	state->duty_cycle =3D DIV_ROUND_UP(state->period * backlight, scale + 1=
);

I find it surprising that the actual duty_cycle is:

	  state->period * backlight
	  -------------------------
	          scale + 1

          pre_div * scale + 1
	=3D -------------------
	    refclk * scale

where scale occurs twice. Can you confirm this to be right?

> +}
> +
> +static const struct pwm_ops ti_sn_pwm_ops =3D {
> +	.request =3D ti_sn_pwm_request,
> +	.free =3D ti_sn_pwm_free,
> +	.apply =3D ti_sn_pwm_apply,
> +	.get_state =3D ti_sn_pwm_get_state,
> +	.owner =3D THIS_MODULE,
> +};
> +
> +static int ti_sn_pwm_probe(struct auxiliary_device *adev,
> +		const struct auxiliary_device_id *id)
> +{
> +	struct ti_sn65dsi86 *pdata =3D dev_get_drvdata(adev->dev.parent);
> +
> +	pdata->pchip.dev =3D pdata->dev;
> +	pdata->pchip.ops =3D &ti_sn_pwm_ops;
> +	pdata->pchip.base =3D -1;

base shouldn't be set since

	f9a8ee8c8bcd (pwm: Always allocate PWM chip base ID dynamically)

> +	pdata->pchip.npwm =3D 1;
> +	pdata->pchip.of_xlate =3D of_pwm_single_xlate;
> +	pdata->pchip.of_pwm_n_cells =3D 1;
> +
> +	return pwmchip_add(&pdata->pchip);
> +}

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--dlth42nyk4uy6ajp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmDJrrIACgkQwfwUeK3K
7AlNTQgAjitQHaKuhF+J7Nk0RDWZHhLnX4n7Unfk6w3ZVc0NSX967xtJ1HsYvA9b
vCR1u4cr8qGm6pJu0KhL8OL/AUelWqXrRvGq3UjiTLKpGeTcV7F7ZGZ+F+wriNWz
S2f9tiPy1eF3/GVHZ1J3k0a6Yk77bl/GcHP3GqDOe6D0WfRW1Zr5FnL0zwDIGO2N
1mEHNGdjJZgPmNKM6g8ei4T9Sua6804A5DQMSJL1LK2o8pkqkrrclPPBm1IL5Gvp
obbdAEZf3vXzY724U+7iCrvQSLUQBb71VP2H1SIG+H8g+eVgUJGqivk5Gurrox8y
ttnEFrWQZA7reT+dnva8XdOlB/5BdQ==
=x9yG
-----END PGP SIGNATURE-----

--dlth42nyk4uy6ajp--
