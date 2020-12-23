Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0232E1FB3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 18:06:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58A16E0A5;
	Wed, 23 Dec 2020 17:06:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574D76E06E;
 Wed, 23 Dec 2020 17:06:09 +0000 (UTC)
IronPort-SDR: SodAhCjGFSsgnf3jJ/DGTcvVQPCqiX4OWFZzQ1eQTuexvI1JonT2QuPX0JX76tovvUJoK9M1ke
 mzuHOD0PjQhg==
X-IronPort-AV: E=McAfee;i="6000,8403,9844"; a="163101248"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; d="scan'208";a="163101248"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2020 09:06:03 -0800
IronPort-SDR: n6P+kmEWtHTzARgMYIsyL65q0SvGGhpIGsw5IsZS3BCqR68dVHil9gbUMorHAbn0UiGD3fsAtj
 /8heN5zPc7pg==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; d="scan'208";a="417279175"
Received: from odonov3x-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.250.144])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2020 09:05:56 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@gmail.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 7/9] drm/i915/dp: Enable Intel's HDR backlight
 interface (only SDR for now)
In-Reply-To: <20201204223603.249878-8-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201204223603.249878-1-lyude@redhat.com>
 <20201204223603.249878-8-lyude@redhat.com>
Date: Wed, 23 Dec 2020 19:05:52 +0200
Message-ID: <87wnx8mozz.fsf@intel.com>
MIME-Version: 1.0
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
Cc: thaytan@noraisin.net, Arnd Bergmann <arnd@arndb.de>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 David Airlie <airlied@linux.ie>, Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 =?utf-8?Q?Jos=C3=A9?= Roberto de Souza <jose.souza@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Sean Paul <seanpaul@chromium.org>, Dave Airlie <airlied@redhat.com>,
 Manasi Navare <manasi.d.navare@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 04 Dec 2020, Lyude Paul <lyude@redhat.com> wrote:
> So-recently a bunch of laptops on the market have started using DPCD
> backlight controls instead of the traditional DDI backlight controls.
> Originally we thought we had this handled by adding VESA backlight
> control support to i915, but the story ended up being a lot more
> complicated then that.
>
> Simply put-there's two main backlight interfaces Intel can see in the
> wild. Intel's proprietary HDR backlight interface, and the standard VESA
> backlight interface. Note that many panels have been observed to report
> support for both backlight interfaces, but testing has shown far more
> panels work with the Intel HDR backlight interface at the moment.
> Additionally, the VBT appears to be capable of reporting support for the
> VESA backlight interface but not the Intel HDR interface which needs to
> be probed by setting the right magic OUI.
>
> On top of that however, there's also actually two different variants of
> the Intel HDR backlight interface. The first uses the AUX channel for
> controlling the brightness of the screen in both SDR and HDR mode, and
> the second only uses the AUX channel for setting the brightness level in
> HDR mode - relying on PWM for setting the brightness level in SDR mode.
>
> For the time being we've been using EDIDs to maintain a list of quirks
> for panels that safely do support the VESA backlight interface. Adding
> support for Intel's HDR backlight interface in addition however, should
> finally allow us to auto-detect eDP backlight controls properly so long
> as we probe like so:
>
> * If the panel's VBT reports VESA backlight support, assume it really
>   does support it
> * If the panel's VBT reports DDI backlight controls:
>   * First probe for Intel's HDR backlight interface
>   * If that fails, probe for VESA's backlight interface
>   * If that fails, assume no DPCD backlight control
> * If the panel's VBT reports any other backlight type: just assume it
>   doesn't have DPCD backlight controls
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: thaytan@noraisin.net
> Cc: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  .../drm/i915/display/intel_display_types.h    |   9 +-
>  .../drm/i915/display/intel_dp_aux_backlight.c | 244 ++++++++++++++++--
>  drivers/gpu/drm/i915/display/intel_panel.c    |  34 ++-
>  drivers/gpu/drm/i915/display/intel_panel.h    |   4 +
>  4 files changed, 263 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 47ee565c49a2..889b6f9c1aa9 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -261,7 +261,14 @@ struct intel_panel {
>  		struct pwm_state pwm_state;
>  
>  		/* DPCD backlight */
> -		u8 pwmgen_bit_count;
> +		union {
> +			struct {
> +				u8 pwmgen_bit_count;
> +			} vesa;
> +			struct {
> +				bool sdr_uses_aux;
> +			} intel;
> +		} edp;
>  
>  		struct backlight_device *device;
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 9775f33d1aac..9a3ff3ffc158 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -22,8 +22,26 @@
>   *
>   */
>  
> +/*
> + * Laptops with Intel GPUs which have panels that support controlling the
> + * backlight through DP AUX can actually use two different interfaces: Intel's
> + * proprietary DP AUX backlight interface, and the standard VESA backlight
> + * interface. Unfortunately, at the time of writing this a lot of laptops will
> + * advertise support for the standard VESA backlight interface when they
> + * don't properly support it. However, on these systems the Intel backlight
> + * interface generally does work properly. Additionally, these systems will
> + * usually just indicate that they use PWM backlight controls in their VBIOS
> + * for some reason.
> + */
> +
>  #include "intel_display_types.h"
>  #include "intel_dp_aux_backlight.h"
> +#include "intel_panel.h"
> +
> +/* TODO:
> + * Implement HDR, right now we just implement the bare minimum to bring us back into SDR mode so we
> + * can make people's backlights work in the mean time
> + */
>  
>  /*
>   * DP AUX registers for Intel's proprietary HDR backlight interface. We define
> @@ -77,6 +95,175 @@
>  
>  #define INTEL_EDP_BRIGHTNESS_OPTIMIZATION_1                            0x359
>  
> +/* Intel EDP backlight callbacks */
> +static bool
> +intel_dp_aux_supports_hdr_backlight(struct intel_connector *connector)
> +{
> +	struct drm_device *dev = connector->base.dev;

Nitpick, as a convention we usually prefer having struct
drm_i915_private *i915 around instead, and use &i915->drm when we need
the drm device. Typically we'll need to access i915 for other reasons
anyway, and only having one seems neater. Not a blocker here, just FYI.

> +	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
> +	struct drm_dp_aux *aux = &intel_dp->aux;
> +	struct intel_panel *panel = &connector->panel;
> +	int ret;
> +	u8 tcon_cap[4];
> +
> +	ret = drm_dp_dpcd_read(aux, INTEL_EDP_HDR_TCON_CAP0, tcon_cap, sizeof(tcon_cap));
> +	if (ret < 0)
> +		return false;
> +
> +	if (!(tcon_cap[1] & INTEL_EDP_HDR_TCON_BRIGHTNESS_NITS_CAP))
> +		return false;
> +
> +	if (tcon_cap[0] >= 1) {
> +		drm_dbg_kms(dev, "Detected Intel HDR backlight interface version %d\n",
> +			    tcon_cap[0]);
> +	} else {
> +		drm_dbg_kms(dev, "Detected unsupported HDR backlight interface version %d\n",
> +			    tcon_cap[0]);
> +		return false;
> +	}
> +
> +	panel->backlight.edp.intel.sdr_uses_aux =
> +		tcon_cap[2] & INTEL_EDP_SDR_TCON_BRIGHTNESS_AUX_CAP;
> +
> +	return true;
> +}
> +
> +static u32
> +intel_dp_aux_hdr_get_backlight(struct intel_connector *connector)
> +{
> +	struct drm_device *dev = connector->base.dev;
> +	struct intel_panel *panel = &connector->panel;
> +	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
> +	u8 tmp;
> +	u8 buf[2] = { 0 };
> +
> +	if (drm_dp_dpcd_readb(&intel_dp->aux, INTEL_EDP_HDR_GETSET_CTRL_PARAMS, &tmp) < 0)
> +		drm_err(dev, "Failed to read current backlight mode from DPCD\n");

Now what, tmp could be uninitialized? Return?

> +
> +	if (!(tmp & INTEL_EDP_HDR_TCON_BRIGHTNESS_AUX_ENABLE)) {
> +		if (panel->backlight.edp.intel.sdr_uses_aux) {
> +			/* Assume 100% brightness if backlight controls aren't enabled yet */
> +			return panel->backlight.max;
> +		} else {
> +			u32 pwm_level = panel->backlight.pwm_funcs->get(connector);

This is exactly what I meant with having pwm_ prefixes for levels in the
"pwm domain" for clarity, in reply to another patch. +1

> +
> +			return intel_panel_backlight_level_from_pwm(connector, pwm_level);
> +		}
> +	}
> +
> +	if (drm_dp_dpcd_read(&intel_dp->aux, INTEL_EDP_BRIGHTNESS_NITS_LSB, buf, sizeof(buf)) < 0) {
> +		drm_err(dev, "Failed to read brightness from DPCD\n");
> +		return 0;
> +	}
> +
> +	return (buf[1] << 8 | buf[0]);
> +}
> +
> +static void
> +intel_dp_aux_hdr_set_aux_backlight(const struct drm_connector_state *conn_state, u32 level)
> +{
> +	struct intel_connector *connector = to_intel_connector(conn_state->connector);
> +	struct drm_device *dev = connector->base.dev;
> +	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
> +	uint8_t buf[4] = { 0 };

Nitpick, u8.

> +
> +	buf[0] = level & 0xFF;
> +	buf[1] = (level & 0xFF00) >> 8;
> +
> +	if (drm_dp_dpcd_write(&intel_dp->aux, INTEL_EDP_BRIGHTNESS_NITS_LSB, buf, 4) < 0)
> +		drm_err(dev, "Failed to write brightness level to DPCD\n");
> +}
> +
> +static void
> +intel_dp_aux_hdr_set_backlight(const struct drm_connector_state *conn_state, u32 level)
> +{
> +	struct intel_connector *connector = to_intel_connector(conn_state->connector);
> +	struct intel_panel *panel = &connector->panel;
> +
> +	if (panel->backlight.edp.intel.sdr_uses_aux) {
> +		intel_dp_aux_hdr_set_aux_backlight(conn_state, level);
> +	} else {
> +		const u32 pwm_level = intel_panel_backlight_level_to_pwm(connector, level);
> +		intel_panel_set_pwm_level(conn_state, pwm_level);
> +	}
> +}
> +
> +static void
> +intel_dp_aux_hdr_enable_backlight(const struct intel_crtc_state *crtc_state,
> +				  const struct drm_connector_state *conn_state, u32 level)
> +{
> +	struct intel_connector *connector = to_intel_connector(conn_state->connector);
> +	struct intel_panel *panel = &connector->panel;
> +	struct drm_device *dev = connector->base.dev;
> +	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
> +	int ret;
> +	u8 old_ctrl, ctrl;
> +
> +	ret = drm_dp_dpcd_readb(&intel_dp->aux, INTEL_EDP_HDR_GETSET_CTRL_PARAMS, &old_ctrl);
> +	if (ret < 0) {
> +		drm_err(dev, "Failed to read current backlight control mode: %d\n", ret);
> +		return;
> +	}
> +
> +	ctrl = old_ctrl;
> +	if (panel->backlight.edp.intel.sdr_uses_aux) {
> +		ctrl |= INTEL_EDP_HDR_TCON_BRIGHTNESS_AUX_ENABLE;
> +		intel_dp_aux_hdr_set_aux_backlight(conn_state, level);
> +	} else {
> +		u32 pwm_level = intel_panel_backlight_level_to_pwm(connector, level);
> +		panel->backlight.pwm_funcs->enable(crtc_state, conn_state, pwm_level);
> +
> +		ctrl &= ~(INTEL_EDP_HDR_TCON_BRIGHTNESS_AUX_ENABLE);

Nitpick, unnecessary braces.

> +	}
> +
> +	if (ctrl != old_ctrl)
> +		if (drm_dp_dpcd_writeb(&intel_dp->aux, INTEL_EDP_HDR_GETSET_CTRL_PARAMS, ctrl) < 0)
> +			drm_err(dev, "Failed to configure DPCD brightness controls\n");
> +}
> +
> +static void
> +intel_dp_aux_hdr_disable_backlight(const struct drm_connector_state *conn_state, u32 level)
> +{
> +	struct intel_connector *connector = to_intel_connector(conn_state->connector);
> +	struct intel_panel *panel = &connector->panel;
> +
> +	/* Nothing to do for AUX based backlight controls */
> +	if (panel->backlight.edp.intel.sdr_uses_aux)
> +		return;
> +
> +	/* Note we want the actual pwm_level to be 0, regardless of pwm_min */
> +	panel->backlight.pwm_funcs->disable(conn_state,
> +					    intel_panel_sanitize_pwm_level(connector, 0));
> +}
> +
> +static int
> +intel_dp_aux_hdr_setup_backlight(struct intel_connector *connector, enum pipe pipe)
> +{
> +	struct drm_device *dev = connector->base.dev;
> +	struct intel_panel *panel = &connector->panel;
> +	int ret;
> +
> +	if (panel->backlight.edp.intel.sdr_uses_aux) {
> +		drm_dbg_kms(dev, "SDR backlight is controlled through DPCD\n");
> +	} else {
> +		drm_dbg_kms(dev, "SDR backlight is controlled through PWM\n");
> +
> +		ret = panel->backlight.pwm_funcs->setup(connector, pipe);
> +		if (ret < 0) {
> +			drm_err(dev, "Failed to setup SDR backlight controls through PWM: %d\n",
> +				ret);
> +			return ret;
> +		}
> +	}
> +
> +	panel->backlight.max = 512;
> +	panel->backlight.min = 0;
> +	panel->backlight.level = intel_dp_aux_hdr_get_backlight(connector);
> +	panel->backlight.enabled = panel->backlight.level != 0;
> +
> +	return 0;
> +}
> +
>  /* VESA backlight callbacks */
>  static void set_vesa_backlight_enable(struct intel_dp *intel_dp, bool enable)
>  {
> @@ -195,7 +382,7 @@ static bool intel_dp_aux_vesa_set_pwm_freq(struct intel_connector *connector)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
>  	struct intel_dp *intel_dp = intel_attached_dp(connector);
> -	const u8 pn = connector->panel.backlight.pwmgen_bit_count;
> +	const u8 pn = connector->panel.backlight.edp.vesa.pwmgen_bit_count;
>  	int freq, fxp, f, fxp_actual, fxp_min, fxp_max;
>  
>  	freq = dev_priv->vbt.backlight.pwm_freq_hz;
> @@ -236,6 +423,7 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  	struct intel_panel *panel = &connector->panel;
>  	u8 dpcd_buf, new_dpcd_buf, edp_backlight_mode;
> +	u8 pwmgen_bit_count = panel->backlight.edp.vesa.pwmgen_bit_count;
>  
>  	if (drm_dp_dpcd_readb(&intel_dp->aux,
>  			DP_EDP_BACKLIGHT_MODE_SET_REGISTER, &dpcd_buf) != 1) {
> @@ -256,7 +444,7 @@ intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
>  
>  		if (drm_dp_dpcd_writeb(&intel_dp->aux,
>  				       DP_EDP_PWMGEN_BIT_COUNT,
> -				       panel->backlight.pwmgen_bit_count) < 0)
> +				       pwmgen_bit_count) < 0)
>  			drm_dbg_kms(&i915->drm,
>  				    "Failed to write aux pwmgen bit count\n");
>  
> @@ -364,7 +552,7 @@ static u32 intel_dp_aux_vesa_calc_max_backlight(struct intel_connector *connecto
>  			    "Failed to write aux pwmgen bit count\n");
>  		return max_backlight;
>  	}
> -	panel->backlight.pwmgen_bit_count = pn;
> +	panel->backlight.edp.vesa.pwmgen_bit_count = pn;
>  
>  	max_backlight = (1 << pn) - 1;
>  
> @@ -405,6 +593,14 @@ intel_dp_aux_supports_vesa_backlight(struct intel_connector *connector)
>  	return false;
>  }
>  
> +static const struct intel_panel_bl_funcs intel_dp_hdr_bl_funcs = {
> +	.setup = intel_dp_aux_hdr_setup_backlight,
> +	.enable = intel_dp_aux_hdr_enable_backlight,
> +	.disable = intel_dp_aux_hdr_disable_backlight,
> +	.set = intel_dp_aux_hdr_set_backlight,
> +	.get = intel_dp_aux_hdr_get_backlight,
> +};
> +
>  static const struct intel_panel_bl_funcs intel_dp_vesa_bl_funcs = {
>  	.setup = intel_dp_aux_vesa_setup_backlight,
>  	.enable = intel_dp_aux_vesa_enable_backlight,
> @@ -413,36 +609,34 @@ static const struct intel_panel_bl_funcs intel_dp_vesa_bl_funcs = {
>  	.get = intel_dp_aux_vesa_get_backlight,
>  };
>  
> -int intel_dp_aux_init_backlight_funcs(struct intel_connector *intel_connector)
> +int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
>  {
> -	struct intel_panel *panel = &intel_connector->panel;
> -	struct intel_dp *intel_dp = enc_to_intel_dp(intel_connector->encoder);
> +	struct drm_device *dev = connector->base.dev;
> +	struct intel_panel *panel = &connector->panel;
> +	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  
> -	if (i915->params.enable_dpcd_backlight == 0 ||
> -	    !intel_dp_aux_supports_vesa_backlight(intel_connector))
> +	if (i915->params.enable_dpcd_backlight == 0)
>  		return -ENODEV;
>  
>  	/*
> -	 * There are a lot of machines that don't advertise the backlight
> -	 * control interface to use properly in their VBIOS, :\
> +	 * A lot of eDP panels in the wild will report supporting both the
> +	 * Intel proprietary backlight control interface, and the VESA
> +	 * backlight control interface. Many of these panels are liars though,
> +	 * and will only work with the Intel interface. So, always probe for
> +	 * that first.
>  	 */
> -	if (i915->vbt.backlight.type !=
> -	    INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE &&

I do wonder about dropping this out. I see it gets added back in the
next patch, but this just means it's, I think, necessary to merge the
two patches back to back.

Despite the nitpicks, this is the only concern I have, really. I didn't
review all the hdr hooks in detail, and if it works, it anyway trumps me
checking the code against some crappy powerpoint of a spec I got.

Overall,

Acked-by: Jani Nikula <jani.nikula@intel.com>

with or without the nitpicks fixed.

> -	    i915->params.enable_dpcd_backlight != 1 &&
> -	    !drm_dp_has_quirk(&intel_dp->desc, intel_dp->edid_quirks,
> -			      DP_QUIRK_FORCE_DPCD_BACKLIGHT)) {
> -		drm_info(&i915->drm,
> -			 "Panel advertises DPCD backlight support, but "
> -			 "VBT disagrees. If your backlight controls "
> -			 "don't work try booting with "
> -			 "i915.enable_dpcd_backlight=1. If your machine "
> -			 "needs this, please file a _new_ bug report on "
> -			 "drm/i915, see " FDO_BUG_URL " for details.\n");
> -		return -ENODEV;
> +	if (intel_dp_aux_supports_hdr_backlight(connector)) {
> +		drm_dbg(dev, "Using Intel proprietary eDP backlight controls\n");

Nitpick, drm_debug_kms, ditto below.

> +		panel->backlight.funcs = &intel_dp_hdr_bl_funcs;
> +		return 0;
>  	}
>  
> -	panel->backlight.funcs = &intel_dp_vesa_bl_funcs;
> +	if (intel_dp_aux_supports_vesa_backlight(connector)) {
> +		drm_dbg(dev, "Using VESA eDP backlight controls\n");
> +		panel->backlight.funcs = &intel_dp_vesa_bl_funcs;
> +		return 0;
> +	}
>  
> -	return 0;
> +	return -ENODEV;
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
> index 41f0d2b2c627..c48aa13b0b90 100644
> --- a/drivers/gpu/drm/i915/display/intel_panel.c
> +++ b/drivers/gpu/drm/i915/display/intel_panel.c
> @@ -511,7 +511,7 @@ static u32 scale_hw_to_user(struct intel_connector *connector,
>  		     0, user_max);
>  }
>  
> -static u32 intel_panel_sanitize_pwm_level(struct intel_connector *connector, u32 val)
> +u32 intel_panel_sanitize_pwm_level(struct intel_connector *connector, u32 val)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
>  	struct intel_panel *panel = &connector->panel;
> @@ -529,7 +529,7 @@ static u32 intel_panel_sanitize_pwm_level(struct intel_connector *connector, u32
>  	return val;
>  }
>  
> -static void intel_panel_set_pwm_level(const struct drm_connector_state *conn_state, u32 val)
> +void intel_panel_set_pwm_level(const struct drm_connector_state *conn_state, u32 val)
>  {
>  	struct intel_connector *connector = to_intel_connector(conn_state->connector);
>  	struct drm_i915_private *i915 = to_i915(connector->base.dev);
> @@ -539,6 +539,36 @@ static void intel_panel_set_pwm_level(const struct drm_connector_state *conn_sta
>  	panel->backlight.pwm_funcs->set(conn_state, val);
>  }
>  
> +u32 intel_panel_backlight_level_to_pwm(struct intel_connector *connector, u32 val)
> +{
> +	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
> +	struct intel_panel *panel = &connector->panel;
> +
> +	drm_WARN_ON_ONCE(&dev_priv->drm,
> +			 panel->backlight.max == 0 || panel->backlight.pwm_max == 0);
> +
> +	val = scale(val, panel->backlight.min, panel->backlight.max,
> +		    panel->backlight.pwm_min, panel->backlight.pwm_max);
> +
> +	return intel_panel_sanitize_pwm_level(connector, val);
> +}
> +
> +u32 intel_panel_backlight_level_from_pwm(struct intel_connector *connector, u32 val)
> +{
> +	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
> +	struct intel_panel *panel = &connector->panel;
> +
> +	drm_WARN_ON_ONCE(&dev_priv->drm,
> +			 panel->backlight.max == 0 || panel->backlight.pwm_max == 0);
> +
> +	if (dev_priv->params.invert_brightness > 0 ||
> +	    (dev_priv->params.invert_brightness == 0 && dev_priv->quirks & QUIRK_INVERT_BRIGHTNESS))
> +		val = panel->backlight.pwm_max - (val - panel->backlight.pwm_min);
> +
> +	return scale(val, panel->backlight.pwm_min, panel->backlight.pwm_max,
> +		     panel->backlight.min, panel->backlight.max);
> +}
> +
>  static u32 lpt_get_backlight(struct intel_connector *connector)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
> diff --git a/drivers/gpu/drm/i915/display/intel_panel.h b/drivers/gpu/drm/i915/display/intel_panel.h
> index 5b813fe90557..a548347a975f 100644
> --- a/drivers/gpu/drm/i915/display/intel_panel.h
> +++ b/drivers/gpu/drm/i915/display/intel_panel.h
> @@ -49,6 +49,10 @@ struct drm_display_mode *
>  intel_panel_edid_fixed_mode(struct intel_connector *connector);
>  struct drm_display_mode *
>  intel_panel_vbt_fixed_mode(struct intel_connector *connector);
> +void intel_panel_set_pwm_level(const struct drm_connector_state *conn_state, u32 level);
> +u32 intel_panel_sanitize_pwm_level(struct intel_connector *connector, u32 level);
> +u32 intel_panel_backlight_level_to_pwm(struct intel_connector *connector, u32 level);
> +u32 intel_panel_backlight_level_from_pwm(struct intel_connector *connector, u32 val);
>  
>  #if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
>  int intel_backlight_device_register(struct intel_connector *connector);

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
