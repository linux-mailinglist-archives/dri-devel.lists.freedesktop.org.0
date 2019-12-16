Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC1F1207B0
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 14:56:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8D06E580;
	Mon, 16 Dec 2019 13:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47E16E580;
 Mon, 16 Dec 2019 13:56:32 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 05:56:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,321,1571727600"; d="scan'208";a="227118511"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 16 Dec 2019 05:56:28 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 16 Dec 2019 15:56:27 +0200
Date: Mon, 16 Dec 2019 15:56:27 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 4/5] drm/i915/dsi: Move Crystal Cove PMIC panel GPIO
 lookup from mfd to the i915 driver
Message-ID: <20191216135627.GS1208@intel.com>
References: <20191215163810.52356-1-hdegoede@redhat.com>
 <20191215163810.52356-5-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191215163810.52356-5-hdegoede@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lee Jones <lee.jones@linaro.org>, intel-gfx <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 15, 2019 at 05:38:09PM +0100, Hans de Goede wrote:
> Move the Crystal Cove PMIC panel GPIO lookup-table from
> drivers/mfd/intel_soc_pmic_core.c to the i915 driver.
> =

> The moved looked-up table is adding a GPIO lookup to the i915 PCI
> device and the GPIO subsys allows only one lookup table per device,
> =

> The intel_soc_pmic_core.c code only adds lookup-table entries for the
> PMIC panel GPIO (as it deals only with the PMIC), but we also need to be
> able to access some GPIOs on the SoC itself, which requires entries for
> these GPIOs in the lookup-table.
> =

> Since the lookup-table is attached to the i915 PCI device it really
> should be part of the i915 driver, this will also allow us to extend
> it with GPIOs from other sources when necessary.
> =

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 23 +++++++++++++++++++-
>  drivers/mfd/intel_soc_pmic_core.c            | 19 ----------------
>  2 files changed, 22 insertions(+), 20 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/d=
rm/i915/display/intel_dsi_vbt.c
> index 027970348b22..847f04eec2a1 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> @@ -25,6 +25,7 @@
>   */
>  =

>  #include <linux/gpio/consumer.h>
> +#include <linux/gpio/machine.h>
>  #include <linux/mfd/intel_soc_pmic.h>
>  #include <linux/slab.h>
>  =

> @@ -686,8 +687,18 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi,=
 u16 panel_id)
>  =

>  /*
>   * On some BYT/CHT devs some sequences are incomplete and we need to man=
ually
> - * control some GPIOs.
> + * control some GPIOs. We need to add a GPIO lookup table before we get =
these.
>   */
> +static struct gpiod_lookup_table pmic_panel_gpio_table =3D {
> +	/* Intel GFX is consumer */
> +	.dev_id =3D "0000:00:02.0",
> +	.table =3D {
> +		/* Panel EN/DISABLE */
> +		GPIO_LOOKUP("gpio_crystalcove", 94, "panel", GPIO_ACTIVE_HIGH),
> +		{ },
> +	},
> +};

Feels like a failure in abstraction to have these irrelevant details
exposed on the consumer side. Also slightly concerned that someone
refactoring things in the pmic driver could now break this without
realizing it. But if people want it done this way I can live with it.

> +
>  void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_=
on)
>  {
>  	struct drm_device *dev =3D intel_dsi->base.base.dev;
> @@ -697,6 +708,8 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_=
dsi, bool panel_is_on)
>  =

>  	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
>  	    (mipi_config->pwm_blc =3D=3D PPS_BLC_PMIC)) {
> +		gpiod_add_lookup_table(&pmic_panel_gpio_table);
> +
>  		intel_dsi->gpio_panel =3D gpiod_get(dev->dev, "panel", flags);
>  		if (IS_ERR(intel_dsi->gpio_panel)) {
>  			DRM_ERROR("Failed to own gpio for panel control\n");
> @@ -707,8 +720,16 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel=
_dsi, bool panel_is_on)
>  =

>  void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi)
>  {
> +	struct drm_device *dev =3D intel_dsi->base.base.dev;
> +	struct drm_i915_private *dev_priv =3D to_i915(dev);
> +	struct mipi_config *mipi_config =3D dev_priv->vbt.dsi.config;
> +
>  	if (intel_dsi->gpio_panel) {
>  		gpiod_put(intel_dsi->gpio_panel);
>  		intel_dsi->gpio_panel =3D NULL;
>  	}
> +
> +	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
> +	    (mipi_config->pwm_blc =3D=3D PPS_BLC_PMIC))

Needless parens here as well.

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> +		gpiod_remove_lookup_table(&pmic_panel_gpio_table);
>  }
> diff --git a/drivers/mfd/intel_soc_pmic_core.c b/drivers/mfd/intel_soc_pm=
ic_core.c
> index 47188df3080d..ddd64f9e3341 100644
> --- a/drivers/mfd/intel_soc_pmic_core.c
> +++ b/drivers/mfd/intel_soc_pmic_core.c
> @@ -9,8 +9,6 @@
>   */
>  =

>  #include <linux/acpi.h>
> -#include <linux/gpio/consumer.h>
> -#include <linux/gpio/machine.h>
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
> @@ -25,17 +23,6 @@
>  #define BYT_CRC_HRV		2
>  #define CHT_CRC_HRV		3
>  =

> -/* Lookup table for the Panel Enable/Disable line as GPIO signals */
> -static struct gpiod_lookup_table panel_gpio_table =3D {
> -	/* Intel GFX is consumer */
> -	.dev_id =3D "0000:00:02.0",
> -	.table =3D {
> -		/* Panel EN/DISABLE */
> -		GPIO_LOOKUP("gpio_crystalcove", 94, "panel", GPIO_ACTIVE_HIGH),
> -		{ },
> -	},
> -};
> -
>  /* PWM consumed by the Intel GFX */
>  static struct pwm_lookup crc_pwm_lookup[] =3D {
>  	PWM_LOOKUP("crystal_cove_pwm", 0, "0000:00:02.0", "pwm_pmic_backlight",=
 0, PWM_POLARITY_NORMAL),
> @@ -96,9 +83,6 @@ static int intel_soc_pmic_i2c_probe(struct i2c_client *=
i2c,
>  	if (ret)
>  		dev_warn(dev, "Can't enable IRQ as wake source: %d\n", ret);
>  =

> -	/* Add lookup table binding for Panel Control to the GPIO Chip */
> -	gpiod_add_lookup_table(&panel_gpio_table);
> -
>  	/* Add lookup table for crc-pwm */
>  	pwm_add_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
>  =

> @@ -121,9 +105,6 @@ static int intel_soc_pmic_i2c_remove(struct i2c_clien=
t *i2c)
>  =

>  	regmap_del_irq_chip(pmic->irq, pmic->irq_chip_data);
>  =

> -	/* Remove lookup table for Panel Control from the GPIO Chip */
> -	gpiod_remove_lookup_table(&panel_gpio_table);
> -
>  	/* remove crc-pwm lookup table */
>  	pwm_remove_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
>  =

> -- =

> 2.23.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
