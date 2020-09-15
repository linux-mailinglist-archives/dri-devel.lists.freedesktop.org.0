Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9775626AD58
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 21:19:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7166E8FA;
	Tue, 15 Sep 2020 19:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704B96E8F8;
 Tue, 15 Sep 2020 19:18:58 +0000 (UTC)
IronPort-SDR: AOL5K68qtA6f4qcEdctjU9jU31z9tiRI//t1BngGtLxNBhYl6SZ/HkFFQoWX2pCLA7t/Ako+WX
 k6L9OTjCWnmg==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="156720733"
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="156720733"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 12:18:56 -0700
IronPort-SDR: 9JU1lnlYRSVBnb9JqOXUkkZd+LDdncoH6kBk0zAz+yF6WQ+l9IrpylADoeAlvAxE/dciRfAZHr
 h2/MeJ3kO1CQ==
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="302277861"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.201])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 12:18:56 -0700
Date: Tue, 15 Sep 2020 15:21:15 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [RFC 4/5] drm/i915: Enable Intel's HDR backlight interface (only
 SDR for now)
Message-ID: <20200915192115.GE503362@intel.com>
References: <20200915172939.2810538-1-lyude@redhat.com>
 <20200915172939.2810538-5-lyude@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915172939.2810538-5-lyude@redhat.com>
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
Cc: thaytan@noraisin.net, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Sean Paul <seanpaul@chromium.org>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 15, 2020 at 01:29:38PM -0400, Lyude Paul wrote:
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
> Note as well that in order for us to make Intel's HDR backlight
> interface appear, we need to start programming the appropriate source
> OUI on the eDP panel as early as possible in the probing process. Note
> that this technically could be done at any time before setting up
> backlight controls, but this way allows us to avoid re-writing it
> multiple times in case we need to use other source-OUI enabled features
> in the future.
> 
> Finally, we also make sure to document the registers for this backlight
> interface since eventually, we want to actually implement the full
> interface instead of keeping it in SDR mode.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: thaytan@noraisin.net
> Cc: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  .../drm/i915/display/intel_display_types.h    |   9 +-
>  .../drm/i915/display/intel_dp_aux_backlight.c | 384 +++++++++++++++---
>  drivers/gpu/drm/i915/display/intel_panel.c    |  34 +-
>  drivers/gpu/drm/i915/display/intel_panel.h    |   4 +
>  drivers/gpu/drm/i915/i915_params.c            |   2 +-
>  5 files changed, 381 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 52a6543df842a..9d540368bac89 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -230,7 +230,14 @@ struct intel_panel {
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
>  		struct {
>  			int (*setup)(struct intel_connector *connector, enum pipe pipe);
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index acbd7eb66cbe3..aa1429302db70 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -22,10 +22,251 @@
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
> +
> +/*
> + * DP AUX registers for Intel's proprietary HDR backlight interface. We define
> + * them here since we'll likely be the only driver to ever use these.
> + */
> +#define INTEL_EDP_HDR_TCON_CAP0                                        0x340
> +
> +#define INTEL_EDP_HDR_TCON_CAP1                                        0x341
> +# define INTEL_EDP_HDR_TCON_2084_DECODE_CAP                           BIT(0)
> +# define INTEL_EDP_HDR_TCON_2020_GAMUT_CAP                            BIT(1)
> +# define INTEL_EDP_HDR_TCON_TONE_MAPPING_CAP                          BIT(2)
> +# define INTEL_EDP_HDR_TCON_SEGMENTED_BACKLIGHT_CAP                   BIT(3)
> +# define INTEL_EDP_HDR_TCON_BRIGHTNESS_NITS_CAP                       BIT(4)
> +# define INTEL_EDP_HDR_TCON_OPTIMIZATION_CAP                          BIT(5)
> +# define INTEL_EDP_HDR_TCON_SDP_COLORIMETRY_CAP                       BIT(6)
> +# define INTEL_EDP_HDR_TCON_SRGB_TO_PANEL_GAMUT_CONVERSION_CAP        BIT(7)
> +
> +#define INTEL_EDP_HDR_TCON_CAP2                                        0x342
> +# define INTEL_EDP_SDR_TCON_BRIGHTNESS_AUX_CAP                        BIT(0)
> +
> +#define INTEL_EDP_HDR_TCON_CAP3                                        0x343
> +
> +#define INTEL_EDP_HDR_GETSET_CTRL_PARAMS                               0x344
> +# define INTEL_EDP_HDR_TCON_2084_DECODE_ENABLE                        BIT(0)
> +# define INTEL_EDP_HDR_TCON_2020_GAMUT_ENABLE                         BIT(1)
> +# define INTEL_EDP_HDR_TCON_TONE_MAPPING_ENABLE                       BIT(2) /* Pre-TGL+ */
> +# define INTEL_EDP_HDR_TCON_SEGMENTED_BACKLIGHT_ENABLE                BIT(3)
> +# define INTEL_EDP_HDR_TCON_BRIGHTNESS_AUX_ENABLE                     BIT(4)
> +# define INTEL_EDP_HDR_TCON_SRGB_TO_PANEL_GAMUT_ENABLE                BIT(5)
> +/* Bit 6 is reserved */
> +# define INTEL_EDP_HDR_TCON_SDP_COLORIMETRY_ENABLE                    BIT(7)
> +
> +#define INTEL_EDP_HDR_CONTENT_LUMINANCE                                0x346 /* Pre-TGL+ */
> +#define INTEL_EDP_HDR_PANEL_LUMINANCE_OVERRIDE                         0x34A
> +#define INTEL_EDP_SDR_LUMINANCE_LEVEL                                  0x352
> +#define INTEL_EDP_BRIGHTNESS_NITS_LSB                                  0x354
> +#define INTEL_EDP_BRIGHTNESS_NITS_MSB                                  0x355
> +#define INTEL_EDP_BRIGHTNESS_DELAY_FRAMES                              0x356
> +#define INTEL_EDP_BRIGHTNESS_PER_FRAME_STEPS                           0x357
> +
> +#define INTEL_EDP_BRIGHTNESS_OPTIMIZATION_0                            0x358
> +# define INTEL_EDP_TCON_USAGE_MASK                             GENMASK(0, 3)
> +# define INTEL_EDP_TCON_USAGE_UNKNOWN                                    0x0
> +# define INTEL_EDP_TCON_USAGE_DESKTOP                                    0x1
> +# define INTEL_EDP_TCON_USAGE_FULL_SCREEN_MEDIA                          0x2
> +# define INTEL_EDP_TCON_USAGE_FULL_SCREEN_GAMING                         0x3
> +# define INTEL_EDP_TCON_POWER_MASK                                    BIT(4)
> +# define INTEL_EDP_TCON_POWER_DC                                    (0 << 4)
> +# define INTEL_EDP_TCON_POWER_AC                                    (1 << 4)
> +# define INTEL_EDP_TCON_OPTIMIZATION_STRENGTH_MASK             GENMASK(5, 7)
> +
> +#define INTEL_EDP_BRIGHTNESS_OPTIMIZATION_1                            0x359

it would be good if we could split this patch into multiple patches to ease the
review. adding registers, renaming the vesa mode, adding intel mode, adding
the parameter....

if you at least split the definitions above fell free to send with my reviewed-by...
I had already reviewed against the spec I have here and it is accurate.

> +
> +/* Intel EDP backlight callbacks */
> +static bool
> +intel_dp_aux_supports_hdr_backlight(struct intel_connector *connector)
> +{
> +	struct drm_device *dev = connector->base.dev;
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
>  
> -static void set_aux_backlight_enable(struct intel_dp *intel_dp, bool enable)
> +	if (!(tmp & INTEL_EDP_HDR_TCON_BRIGHTNESS_AUX_ENABLE)) {
> +		if (panel->backlight.edp.intel.sdr_uses_aux) {
> +			/* Assume 100% brightness if backlight controls aren't enabled yet */
> +			return panel->backlight.max;
> +		} else {
> +			u32 pwm_level = panel->backlight.pwm_funcs.get(connector);
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
> +				  const struct drm_connector_state *conn_state)
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
> +		intel_dp_aux_hdr_set_aux_backlight(conn_state, panel->backlight.level);
> +	} else {
> +		u32 pwm_level = intel_panel_backlight_level_to_pwm(connector,
> +								   panel->backlight.level);
> +		panel->backlight.pwm_funcs.enable(crtc_state, conn_state, pwm_level);
> +
> +		ctrl &= ~(INTEL_EDP_HDR_TCON_BRIGHTNESS_AUX_ENABLE);
> +	}
> +
> +	if (ctrl != old_ctrl)
> +		if (drm_dp_dpcd_writeb(&intel_dp->aux, INTEL_EDP_HDR_GETSET_CTRL_PARAMS, ctrl) < 0)
> +			drm_err(dev, "Failed to configure DPCD brightness controls\n");
> +}
> +
> +static void
> +intel_dp_aux_hdr_disable_backlight(const struct drm_connector_state *conn_state)
> +{
> +	struct intel_connector *connector = to_intel_connector(conn_state->connector);
> +	struct intel_panel *panel = &connector->panel;
> +
> +	/* Nothing to do for AUX based backlight controls */
> +	if (panel->backlight.edp.intel.sdr_uses_aux)
> +		return;
> +
> +	/* Note we want the actual pwm_level to be 0, regardless of pwm_min */
> +	panel->backlight.pwm_funcs.disable(conn_state,
> +					   intel_panel_sanitize_pwm_level(connector, 0));
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
> +		ret = panel->backlight.pwm_funcs.setup(connector, pipe);
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
> +/* VESA backlight callbacks */
> +static void set_vesa_backlight_enable(struct intel_dp *intel_dp, bool enable)
>  {
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  	u8 reg_val = 0;
> @@ -56,7 +297,7 @@ static void set_aux_backlight_enable(struct intel_dp *intel_dp, bool enable)
>   * Read the current backlight value from DPCD register(s) based
>   * on if 8-bit(MSB) or 16-bit(MSB and LSB) values are supported
>   */
> -static u32 intel_dp_aux_get_backlight(struct intel_connector *connector)
> +static u32 intel_dp_aux_vesa_get_backlight(struct intel_connector *connector)
>  {
>  	struct intel_dp *intel_dp = intel_attached_dp(connector);
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> @@ -99,7 +340,8 @@ static u32 intel_dp_aux_get_backlight(struct intel_connector *connector)
>   * 8-bit or 16 bit value (MSB and LSB)
>   */
>  static void
> -intel_dp_aux_set_backlight(const struct drm_connector_state *conn_state, u32 level)
> +intel_dp_aux_vesa_set_backlight(const struct drm_connector_state *conn_state,
> +				u32 level)
>  {
>  	struct intel_connector *connector = to_intel_connector(conn_state->connector);
>  	struct intel_dp *intel_dp = intel_attached_dp(connector);
> @@ -129,11 +371,11 @@ intel_dp_aux_set_backlight(const struct drm_connector_state *conn_state, u32 lev
>   * - Where P = 2^Pn, where Pn is the value programmed by field 4:0 of the
>   *             EDP_PWMGEN_BIT_COUNT register (DPCD Address 00724h)
>   */
> -static bool intel_dp_aux_set_pwm_freq(struct intel_connector *connector)
> +static bool intel_dp_aux_vesa_set_pwm_freq(struct intel_connector *connector)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
>  	struct intel_dp *intel_dp = intel_attached_dp(connector);
> -	const u8 pn = connector->panel.backlight.pwmgen_bit_count;
> +	const u8 pn = connector->panel.backlight.edp.vesa.pwmgen_bit_count;
>  	int freq, fxp, f, fxp_actual, fxp_min, fxp_max;
>  
>  	freq = dev_priv->vbt.backlight.pwm_freq_hz;
> @@ -165,14 +407,15 @@ static bool intel_dp_aux_set_pwm_freq(struct intel_connector *connector)
>  	return true;
>  }
>  
> -static void intel_dp_aux_enable_backlight(const struct intel_crtc_state *crtc_state,
> -					  const struct drm_connector_state *conn_state)
> +static void intel_dp_aux_vesa_enable_backlight(const struct intel_crtc_state *crtc_state,
> +					       const struct drm_connector_state *conn_state)
>  {
>  	struct intel_connector *connector = to_intel_connector(conn_state->connector);
>  	struct intel_dp *intel_dp = intel_attached_dp(connector);
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
>  	struct intel_panel *panel = &connector->panel;
>  	u8 dpcd_buf, new_dpcd_buf, edp_backlight_mode;
> +	u8 pwmgen_bit_count = panel->backlight.edp.vesa.pwmgen_bit_count;
>  
>  	if (drm_dp_dpcd_readb(&intel_dp->aux,
>  			DP_EDP_BACKLIGHT_MODE_SET_REGISTER, &dpcd_buf) != 1) {
> @@ -193,7 +436,7 @@ static void intel_dp_aux_enable_backlight(const struct intel_crtc_state *crtc_st
>  
>  		if (drm_dp_dpcd_writeb(&intel_dp->aux,
>  				       DP_EDP_PWMGEN_BIT_COUNT,
> -				       panel->backlight.pwmgen_bit_count) < 0)
> +				       pwmgen_bit_count) < 0)
>  			drm_dbg_kms(&i915->drm,
>  				    "Failed to write aux pwmgen bit count\n");
>  
> @@ -206,7 +449,7 @@ static void intel_dp_aux_enable_backlight(const struct intel_crtc_state *crtc_st
>  	}
>  
>  	if (intel_dp->edp_dpcd[2] & DP_EDP_BACKLIGHT_FREQ_AUX_SET_CAP)
> -		if (intel_dp_aux_set_pwm_freq(connector))
> +		if (intel_dp_aux_vesa_set_pwm_freq(connector))
>  			new_dpcd_buf |= DP_EDP_BACKLIGHT_FREQ_AUX_SET_ENABLE;
>  
>  	if (new_dpcd_buf != dpcd_buf) {
> @@ -217,18 +460,18 @@ static void intel_dp_aux_enable_backlight(const struct intel_crtc_state *crtc_st
>  		}
>  	}
>  
> -	intel_dp_aux_set_backlight(conn_state,
> -				   connector->panel.backlight.level);
> -	set_aux_backlight_enable(intel_dp, true);
> +	intel_dp_aux_vesa_set_backlight(conn_state,
> +					connector->panel.backlight.level);
> +	set_vesa_backlight_enable(intel_dp, true);
>  }
>  
> -static void intel_dp_aux_disable_backlight(const struct drm_connector_state *old_conn_state)
> +static void intel_dp_aux_vesa_disable_backlight(const struct drm_connector_state *old_conn_state)
>  {
> -	set_aux_backlight_enable(enc_to_intel_dp(to_intel_encoder(old_conn_state->best_encoder)),
> -				 false);
> +	set_vesa_backlight_enable(enc_to_intel_dp(to_intel_encoder(old_conn_state->best_encoder)),
> +				  false);
>  }
>  
> -static u32 intel_dp_aux_calc_max_backlight(struct intel_connector *connector)
> +static u32 intel_dp_aux_vesa_calc_max_backlight(struct intel_connector *connector)
>  {
>  	struct drm_i915_private *i915 = to_i915(connector->base.dev);
>  	struct intel_dp *intel_dp = intel_attached_dp(connector);
> @@ -301,31 +544,31 @@ static u32 intel_dp_aux_calc_max_backlight(struct intel_connector *connector)
>  			    "Failed to write aux pwmgen bit count\n");
>  		return max_backlight;
>  	}
> -	panel->backlight.pwmgen_bit_count = pn;
> +	panel->backlight.edp.vesa.pwmgen_bit_count = pn;
>  
>  	max_backlight = (1 << pn) - 1;
>  
>  	return max_backlight;
>  }
>  
> -static int intel_dp_aux_setup_backlight(struct intel_connector *connector,
> -					enum pipe pipe)
> +static int intel_dp_aux_vesa_setup_backlight(struct intel_connector *connector,
> +					     enum pipe pipe)
>  {
>  	struct intel_panel *panel = &connector->panel;
>  
> -	panel->backlight.max = intel_dp_aux_calc_max_backlight(connector);
> +	panel->backlight.max = intel_dp_aux_vesa_calc_max_backlight(connector);
>  	if (!panel->backlight.max)
>  		return -ENODEV;
>  
>  	panel->backlight.min = 0;
> -	panel->backlight.level = intel_dp_aux_get_backlight(connector);
> +	panel->backlight.level = intel_dp_aux_vesa_get_backlight(connector);
>  	panel->backlight.enabled = panel->backlight.level != 0;
>  
>  	return 0;
>  }
>  
>  static bool
> -intel_dp_aux_display_control_capable(struct intel_connector *connector)
> +intel_dp_aux_supports_vesa_backlight(struct intel_connector *connector)
>  {
>  	struct intel_dp *intel_dp = intel_attached_dp(connector);
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> @@ -342,40 +585,85 @@ intel_dp_aux_display_control_capable(struct intel_connector *connector)
>  	return false;
>  }
>  
> -int intel_dp_aux_init_backlight_funcs(struct intel_connector *intel_connector)
> +enum intel_dp_aux_backlight_modparam {
> +	INTEL_DP_AUX_BACKLIGHT_AUTO = -1,
> +	INTEL_DP_AUX_BACKLIGHT_OFF = 0,
> +	INTEL_DP_AUX_BACKLIGHT_ON = 1,
> +	INTEL_DP_AUX_BACKLIGHT_FORCE_VESA = 2,
> +	INTEL_DP_AUX_BACKLIGHT_FORCE_INTEL = 3,
> +};
> +
> +int intel_dp_aux_init_backlight_funcs(struct intel_connector *connector)
>  {
> -	struct intel_panel *panel = &intel_connector->panel;
> -	struct intel_dp *intel_dp = enc_to_intel_dp(intel_connector->encoder);
> +	struct drm_device *dev = connector->base.dev;
> +	struct intel_panel *panel = &connector->panel;
> +	struct intel_dp *intel_dp = enc_to_intel_dp(connector->encoder);
>  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
> +	bool try_intel_interface = false, try_vesa_interface = false;
>  
> -	if (i915->params.enable_dpcd_backlight == 0 ||
> -	    !intel_dp_aux_display_control_capable(intel_connector))
> +	/* Check the VBT and user's module parameters to figure out which
> +	 * interfaces to probe
> +	 */
> +	switch (i915->params.enable_dpcd_backlight) {
> +	case INTEL_DP_AUX_BACKLIGHT_OFF:
>  		return -ENODEV;
> +	case INTEL_DP_AUX_BACKLIGHT_AUTO:
> +		switch (i915->vbt.backlight.type) {
> +		case INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE:
> +			try_vesa_interface = true;
> +			break;
> +		case INTEL_BACKLIGHT_DISPLAY_DDI:
> +			try_intel_interface = true;
> +			try_vesa_interface = true;
> +			break;
> +		default:
> +			return -ENODEV;
> +		}
> +		break;
> +	case INTEL_DP_AUX_BACKLIGHT_ON:
> +		if (i915->vbt.backlight.type != INTEL_BACKLIGHT_VESA_EDP_AUX_INTERFACE)
> +			try_intel_interface = true;
> +
> +		try_vesa_interface = true;
> +		break;
> +	case INTEL_DP_AUX_BACKLIGHT_FORCE_VESA:
> +		try_vesa_interface = true;
> +		break;
> +	case INTEL_DP_AUX_BACKLIGHT_FORCE_INTEL:
> +		try_intel_interface = true;
> +		break;
> +	}
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
> +	if (try_intel_interface && intel_dp_aux_supports_hdr_backlight(connector)) {
> +		drm_dbg(dev, "Using Intel proprietary eDP backlight controls\n");
> +
> +		panel->backlight.setup = intel_dp_aux_hdr_setup_backlight;
> +		panel->backlight.enable = intel_dp_aux_hdr_enable_backlight;
> +		panel->backlight.disable = intel_dp_aux_hdr_disable_backlight;
> +		panel->backlight.set = intel_dp_aux_hdr_set_backlight;
> +		panel->backlight.get = intel_dp_aux_hdr_get_backlight;
> +
> +		return 0;
>  	}
>  
> -	panel->backlight.setup = intel_dp_aux_setup_backlight;
> -	panel->backlight.enable = intel_dp_aux_enable_backlight;
> -	panel->backlight.disable = intel_dp_aux_disable_backlight;
> -	panel->backlight.set = intel_dp_aux_set_backlight;
> -	panel->backlight.get = intel_dp_aux_get_backlight;
> +	if (try_vesa_interface && intel_dp_aux_supports_vesa_backlight(connector)) {
> +		drm_dbg(dev, "Using VESA eDP backlight controls\n");
>  
> -	return 0;
> +		panel->backlight.setup = intel_dp_aux_vesa_setup_backlight;
> +		panel->backlight.enable = intel_dp_aux_vesa_enable_backlight;
> +		panel->backlight.disable = intel_dp_aux_vesa_disable_backlight;
> +		panel->backlight.set = intel_dp_aux_vesa_set_backlight;
> +		panel->backlight.get = intel_dp_aux_vesa_get_backlight;
> +
> +		return 0;
> +	}
> +
> +	return -ENODEV;
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
> index 6d3e9d51d069c..75aca9f2ffeb2 100644
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
>  	panel->backlight.pwm_funcs.set(conn_state, val);
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
> index 5b813fe90557c..a548347a975f5 100644
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
> diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
> index 7f139ea4a90b2..6939634e56ed6 100644
> --- a/drivers/gpu/drm/i915/i915_params.c
> +++ b/drivers/gpu/drm/i915/i915_params.c
> @@ -185,7 +185,7 @@ i915_param_named_unsafe(inject_probe_failure, uint, 0400,
>  
>  i915_param_named(enable_dpcd_backlight, int, 0400,
>  	"Enable support for DPCD backlight control"
> -	"(-1=use per-VBT LFP backlight type setting [default], 0=disabled, 1=enabled)");
> +	"(-1=use per-VBT LFP backlight type setting [default], 0=disabled, 1=enable, 2=force VESA interface, 3=force Intel interface)");
>  
>  #if IS_ENABLED(CONFIG_DRM_I915_GVT)
>  i915_param_named(enable_gvt, bool, 0400,
> -- 
> 2.26.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
