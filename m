Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EFE3B0EB9
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 22:30:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 765E76E1ED;
	Tue, 22 Jun 2021 20:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (unknown
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925556E1BC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 20:29:58 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lvn1g-0005iy-Rz; Tue, 22 Jun 2021 22:29:40 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1lvn1e-0003x7-Cp; Tue, 22 Jun 2021 22:29:38 +0200
Date: Tue, 22 Jun 2021 22:29:35 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 2/2] drm/bridge: ti-sn65dsi86: Implement the pwm_chip
Message-ID: <20210622202935.lbghwelbiwgufycd@pengutronix.de>
References: <20210622030948.966748-1-bjorn.andersson@linaro.org>
 <20210622030948.966748-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mzgq4grk55i2lpza"
Content-Disposition: inline
In-Reply-To: <20210622030948.966748-2-bjorn.andersson@linaro.org>
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


--mzgq4grk55i2lpza
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 21, 2021 at 10:09:48PM -0500, Bjorn Andersson wrote:
> The SN65DSI86 provides the ability to supply a PWM signal on GPIO 4,
> with the primary purpose of controlling the backlight of the attached
> panel. Add an implementation that exposes this using the standard PWM
> framework, to allow e.g. pwm-backlight to expose this to the user.
>=20
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>=20
> Changes since v2:
> - Corrected calculation of scale, to include a 1 instead of 1/NSEC_TO_SEC=
 and
>   rounded the period up in get_state, to make sure its idempotent
> - Changed duty_cycle calculation to make sure it idempotent over my teste=
d period
> - Documented "Limitations"
> - Documented muxing operation after pm_runtime_get_sync()
>=20
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 335 +++++++++++++++++++++++++-
>  1 file changed, 334 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/brid=
ge/ti-sn65dsi86.c
> index 5d712c8c3c3b..0eabbdad1830 100644
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
> @@ -1044,6 +1095,258 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_=
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
> +/*
> + * Limitations:
> + * - The PWM signal is not driven when the chip is powered down, or in i=
ts
> + *   reset state and the driver does not implement the "suspend state"
> + *   described in the documentation. In order to save power, state->enab=
led is
> + *   interpreted as denoting if the signal is expected to be valid, and =
is used to keep
> + *   the determine if the chip needs to be kept powered.
> + * - Changing both period and duty_cycle is not done atomically, so the =
output
> + *   might briefly be a mix of the two settings.
> + */
> +static int ti_sn_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> +			   const struct pwm_state *state)
> +{
> +	struct ti_sn65dsi86 *pdata =3D pwm_chip_to_ti_sn_bridge(chip);
> +	unsigned int pwm_en_inv;
> +	unsigned int backlight;
> +	unsigned int pre_div;
> +	unsigned int scale;
> +	u64 tick;
> +	int ret;
> +
> +	if (!pdata->pwm_enabled) {
> +		ret =3D pm_runtime_get_sync(pdata->dev);
> +		if (ret < 0)
> +			return ret;
> +
> +		/*
> +		 * The chip might have been powered down while we didn't hold a
> +		 * PM runtime reference, so mux in the PWM function on the GPIO
> +		 * pin again.
> +		 */
> +		ret =3D regmap_update_bits(pdata->regmap, SN_GPIO_CTRL_REG,
> +				SN_GPIO_MUX_MASK << (2 * SN_PWM_GPIO_IDX),
> +				SN_GPIO_MUX_SPECIAL << (2 * SN_PWM_GPIO_IDX));
> +		if (ret) {
> +			dev_err(pdata->dev, "failed to mux in PWM function\n");
> +			goto out;
> +		}

In reply to your v2 I requested to short-cut the case !pdata->pwm_enabled
&& !state->enabled without enabling stuff.

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
> +		 * In order to keep BACKLIGHT_SCALE within its 16 bits,
> +		 * PWM_PRE_DIV must be:
> +		 *
> +		 *   PWM_PRE_DIV >=3D (T_pwm * REFCLK_FREQ - 1) / BACKLIGHT_SCALE_MAX;
> +		 *
> +		 * To simplify the search and optimize the resolution of the
> +		 * PWM, the lowest possible PWM_PRE_DIV is used. Finally the
> +		 * scale is calculated as:
> +		 *
> +		 *   BACKLIGHT_SCALE =3D (T_pwm * REFCLK_FREQ - 1) / PWM_PRE_DIV
> +		 *
> +		 * Here T_pwm is represented in seconds, so appropriate scaling
> +		 * to nanoseconds is necessary.
> +		 */
> +
> +		/* Minimum T_pwm is (1 * 1 + 1) / REFCLK_FREQ */
> +		if (state->period * pdata->pwm_refclk_freq <=3D 2 * NSEC_PER_SEC) {
> +			ret =3D -EINVAL;
> +			goto out;
> +		}
> +
> +		pre_div =3D DIV_ROUND_UP((state->period * pdata->pwm_refclk_freq - NSE=
C_PER_SEC),
> +				       (NSEC_PER_SEC * BACKLIGHT_SCALE_MAX));
> +		if (pre_div > 0xff)
> +			pre_div =3D 0xff;
> +
> +		scale =3D (state->period * pdata->pwm_refclk_freq - NSEC_PER_SEC) / (N=
SEC_PER_SEC * pre_div);

Please consider this multiplication to overflow. Something like:

	if (state->period > $someterm)
		period =3D $someterm;
	else
		period =3D state->period;

is usually appropriate. Also NSEC_PER_SEC * pre_div might overflow.
Moreover to divide a u64 you must not rely on / but need do_div() or
some variant of it.

> +
> +		/*
> +		 * PWM duty cycle is given as:
> +		 *
> +		 *   duty =3D BACKLIGHT / (BACKLIGHT_SCALE + 1)
> +		 *
> +		 * The documentation is however inconsistent in its examples,
> +		 * so the interpretation used here is that the duty cycle is
> +		 * the period of BACKLIGHT * PRE_DIV / REFCLK_FREQ.

I don't understand this.

> +		 *
> +		 * The ratio PRE_DIV / REFCLK_FREQ is rounded up to whole
> +		 * nanoseconds in order to ensure that the calculations are
> +		 * idempotent and gives results that are smaller than the
> +		 * requested value.
> +		 */
> +		tick =3D DIV_ROUND_UP(NSEC_PER_SEC * pre_div, pdata->pwm_refclk_freq);
> +		backlight =3D state->duty_cycle / tick;

You're loosing precision here by dividing by the result of a division.

> +		if (backlight > scale)
> +			backlight =3D scale;
> +
> +		ret =3D regmap_write(pdata->regmap, SN_PWM_PRE_DIV_REG, pre_div);
> +		if (ret) {
> +			dev_err(pdata->dev, "failed to update PWM_PRE_DIV\n");
> +			goto out;
> +		}
> +
> +		ti_sn65dsi86_write_u16(pdata, SN_BACKLIGHT_SCALE_REG, scale);
> +		ti_sn65dsi86_write_u16(pdata, SN_BACKLIGHT_REG, backlight);
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
> +	state->period =3D DIV_ROUND_UP(NSEC_PER_SEC * (pre_div * scale + 1), pd=
ata->pwm_refclk_freq);
> +	state->duty_cycle =3D backlight * DIV_ROUND_UP(NSEC_PER_SEC * pre_div, =
pdata->pwm_refclk_freq);

If you use

	state->duty_cycle =3D DIV_ROUND_UP(backlight * NSEC_PER_SEC * pre_div, pda=
ta->pwm_refclk_freq);

instead (with a cast to u64 to not yield an overflow) the result is more
exact.

I still find this surprising, I'd expect that SCALE also matters for the
duty_cycle. With the assumption implemented here modifying SCALE only
affects the period. This should be easy to verify?! I would expect that
changing SCALE doesn't affect the relative duty_cycle, so the brightness
of an LED is unaffected (unless the period gets too big of course).

I didn't spend much cycles to verify that the logic in .apply() matches
=2Eget_state(). I'd keep that check for the next iteration.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--mzgq4grk55i2lpza
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmDSSCsACgkQwfwUeK3K
7Al+YAf9FcccAJZE2O7rOUkFYkbzs1v+ehqUHVHjCUSRaxlAUJHF/jXJh75najf4
3xp2eNCi2Fh35w5SDb9m9N+0TYoYmJTjoFT3r8vDecaV7TPlN1Vj5uqrrZOetJ56
AwJTkbOo2GzK19TTV0A2EZBiNXyoQj3WOpZRuID9BH1WruVf0F9UvjS60x9pxNBr
NklIx9d2Z3fO7EJmr6DdY6S2qUwltryWkitM/Y/qTg83x2tmV59/7YacbXFQt6cb
fDVT2EwGiBGzeOu11EUzGmAsFCfnt2Wqu9J2dSxluBCzmfucRDyW023/RBYcyS53
IXfx3hkjvo/dWuKBU0JQSpK2Izje1A==
=8II7
-----END PGP SIGNATURE-----

--mzgq4grk55i2lpza--
