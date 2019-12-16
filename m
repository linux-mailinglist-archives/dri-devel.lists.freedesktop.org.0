Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDCF120802
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 15:04:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7266E58A;
	Mon, 16 Dec 2019 14:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4ACF6E58A;
 Mon, 16 Dec 2019 14:04:42 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 06:04:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,321,1571727600"; d="scan'208";a="227122473"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 16 Dec 2019 06:04:28 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 16 Dec 2019 16:04:27 +0200
Date: Mon, 16 Dec 2019 16:04:27 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 5/5] drm/i915/dsi: Control panel and backlight enable
 GPIOs on BYT
Message-ID: <20191216140427.GT1208@intel.com>
References: <20191215163810.52356-1-hdegoede@redhat.com>
 <20191215163810.52356-6-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191215163810.52356-6-hdegoede@redhat.com>
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

On Sun, Dec 15, 2019 at 05:38:10PM +0100, Hans de Goede wrote:
> On Bay Trail devices the MIPI power on/off sequences for DSI LCD panels
> do not control the LCD panel- and backlight-enable GPIOs. So far, when
> the VBT indicates we should use the SoC for backlight control, we have
> been relying on these GPIOs being configured as output and driven high by
> the Video BIOS (GOP) when it initializes the panel.
> =

> This does not work when the device is booted with a HDMI monitor connected
> as then the GOP will initialize the HDMI instead of the panel, leaving the
> panel black, even though the i915 driver tries to output an image to it.
> =

> Likewise on some device-models when the GOP does not initialize the DSI
> panel it also leaves the mux of the PWM0 pin in generic GPIO mode instead
> of muxing it to the PWM controller.
> =

> This commit makes the DSI code control the SoC GPIOs for panel- and
> backlight-enable on BYT, when the VBT indicates the SoC should be used
> =

> for backlight control. It also ensures that the PWM0 pin is muxed to the
> PWM controller in this case.
> =

> This fixes the LCD panel not lighting up on various devices when booted
> with a HDMI monitor connected. This has been tested to fix this on the
> following devices:
> =

> Peaq C1010
> Point of View MOBII TAB-P800W
> Point of View MOBII TAB-P1005W
> Terra Pad 1061
> Yours Y8W81
> =

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dsi.h     |  3 +-
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 63 ++++++++++++++++++++
>  2 files changed, 65 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/i915/display/intel_dsi.h b/drivers/gpu/drm/i=
915/display/intel_dsi.h
> index 675771ea91aa..7481a5aa3084 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi.h
> +++ b/drivers/gpu/drm/i915/display/intel_dsi.h
> @@ -45,8 +45,9 @@ struct intel_dsi {
>  	struct intel_dsi_host *dsi_hosts[I915_MAX_PORTS];
>  	intel_wakeref_t io_wakeref[I915_MAX_PORTS];
>  =

> -	/* GPIO Desc for CRC based Panel control */
> +	/* GPIO Desc for panel and backlight control */
>  	struct gpio_desc *gpio_panel;
> +	struct gpio_desc *gpio_backlight;
>  =

>  	struct intel_connector *attached_connector;
>  =

> diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/d=
rm/i915/display/intel_dsi_vbt.c
> index 847f04eec2a1..bd007d4f86e2 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> @@ -27,6 +27,8 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/gpio/machine.h>
>  #include <linux/mfd/intel_soc_pmic.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/pinctrl/machine.h>
>  #include <linux/slab.h>
>  =

>  #include <asm/intel-mid.h>
> @@ -525,11 +527,15 @@ void intel_dsi_vbt_exec_sequence(struct intel_dsi *=
intel_dsi,
>  {
>  	if (seq_id =3D=3D MIPI_SEQ_POWER_ON && intel_dsi->gpio_panel)
>  		gpiod_set_value_cansleep(intel_dsi->gpio_panel, 1);
> +	if (seq_id =3D=3D MIPI_SEQ_BACKLIGHT_ON && intel_dsi->gpio_backlight)
> +		gpiod_set_value_cansleep(intel_dsi->gpio_backlight, 1);
>  =

>  	intel_dsi_vbt_exec(intel_dsi, seq_id);
>  =

>  	if (seq_id =3D=3D MIPI_SEQ_POWER_OFF && intel_dsi->gpio_panel)
>  		gpiod_set_value_cansleep(intel_dsi->gpio_panel, 0);
> +	if (seq_id =3D=3D MIPI_SEQ_BACKLIGHT_OFF && intel_dsi->gpio_backlight)
> +		gpiod_set_value_cansleep(intel_dsi->gpio_backlight, 0);
>  }
>  =

>  void intel_dsi_msleep(struct intel_dsi *intel_dsi, int msec)
> @@ -688,6 +694,8 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, =
u16 panel_id)
>  /*
>   * On some BYT/CHT devs some sequences are incomplete and we need to man=
ually
>   * control some GPIOs. We need to add a GPIO lookup table before we get =
these.
> + * If the GOP did not initialize the panel (HDMI inserted) we may need t=
o also
> + * change the pinmux for the SoC's PWM0 pin from GPIO to PWM.
>   */
>  static struct gpiod_lookup_table pmic_panel_gpio_table =3D {
>  	/* Intel GFX is consumer */
> @@ -699,23 +707,68 @@ static struct gpiod_lookup_table pmic_panel_gpio_ta=
ble =3D {
>  	},
>  };
>  =

> +static struct gpiod_lookup_table soc_panel_gpio_table =3D {
> +	.dev_id =3D "0000:00:02.0",
> +	.table =3D {
> +	  GPIO_LOOKUP("INT33FC:01", 10, "backlight", GPIO_ACTIVE_HIGH),
> +	  GPIO_LOOKUP("INT33FC:01", 11, "panel", GPIO_ACTIVE_HIGH),
> +	  { },

Some kind of indent fail here.

> +	},
> +};
> +
> +static const struct pinctrl_map soc_pwm_pinctrl_map[] =3D {
> +	PIN_MAP_MUX_GROUP("0000:00:02.0", "soc_pwm0", "INT33FC:00",
> +			  "pwm0_grp", "pwm"),
> +};
> +
>  void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_=
on)
>  {
>  	struct drm_device *dev =3D intel_dsi->base.base.dev;
>  	struct drm_i915_private *dev_priv =3D to_i915(dev);
>  	struct mipi_config *mipi_config =3D dev_priv->vbt.dsi.config;
>  	enum gpiod_flags flags =3D panel_is_on ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
> +	bool want_backlight_gpio =3D false;
> +	bool want_panel_gpio =3D false;
> +	struct pinctrl *pinctrl;
> +	int ret;
>  =

>  	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
>  	    (mipi_config->pwm_blc =3D=3D PPS_BLC_PMIC)) {
>  		gpiod_add_lookup_table(&pmic_panel_gpio_table);
> +		want_panel_gpio =3D true;
> +	}
> +
> +	if (IS_VALLEYVIEW(dev_priv) && mipi_config->pwm_blc =3D=3D PPS_BLC_SOC)=
 {
> +		gpiod_add_lookup_table(&soc_panel_gpio_table);
> +		want_panel_gpio =3D true;
> +		want_backlight_gpio =3D true;
>  =

> +		/* Ensure PWM0 pin is muxed as PWM instead of GPIO */
> +		ret =3D pinctrl_register_mappings(soc_pwm_pinctrl_map, 1);

ARRAY_SIZE()?

> +		if (ret)
> +			DRM_ERROR("Failed to register pwm0 pinmux mapping\n");
> +
> +		pinctrl =3D devm_pinctrl_get_select(dev->dev, "soc_pwm0");
> +		if (IS_ERR(pinctrl))
> +			DRM_ERROR("Failed to set pinmux to PWM\n");
> +	}
> +
> +	if (want_panel_gpio) {
>  		intel_dsi->gpio_panel =3D gpiod_get(dev->dev, "panel", flags);
>  		if (IS_ERR(intel_dsi->gpio_panel)) {
>  			DRM_ERROR("Failed to own gpio for panel control\n");
>  			intel_dsi->gpio_panel =3D NULL;
>  		}
>  	}
> +
> +	if (want_backlight_gpio) {
> +		intel_dsi->gpio_backlight =3D
> +			gpiod_get(dev->dev, "backlight", flags);
> +		if (IS_ERR(intel_dsi->gpio_backlight)) {
> +			DRM_ERROR("Failed to own gpio for backlight control\n");
> +			intel_dsi->gpio_backlight =3D NULL;
> +		}
> +	}
>  }
>  =

>  void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi)
> @@ -729,7 +782,17 @@ void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *in=
tel_dsi)
>  		intel_dsi->gpio_panel =3D NULL;
>  	}
>  =

> +	if (intel_dsi->gpio_backlight) {
> +		gpiod_put(intel_dsi->gpio_backlight);
> +		intel_dsi->gpio_backlight =3D NULL;
> +	}
> +
>  	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
>  	    (mipi_config->pwm_blc =3D=3D PPS_BLC_PMIC))
>  		gpiod_remove_lookup_table(&pmic_panel_gpio_table);
> +
> +	if (IS_VALLEYVIEW(dev_priv) && mipi_config->pwm_blc =3D=3D PPS_BLC_SOC)=
 {

Slightly annoying to have these checks duplicated. Might be cleaner to
have a few helpers that return the correct tables and just use those in
both init and cleanup. OTOH those want_*_gpio flags and the pwm stuff is
would still be a sticking point I suppose. So maybe not cleaner in the
end after all.

Looks all right to me:
Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>


> +		pinctrl_unregister_mappings(soc_pwm_pinctrl_map);
> +		gpiod_remove_lookup_table(&soc_panel_gpio_table);
> +	}
>  }
> -- =

> 2.23.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
