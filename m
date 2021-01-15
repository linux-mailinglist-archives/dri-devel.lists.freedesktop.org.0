Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BD92F7CFF
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 14:46:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B606E0BE;
	Fri, 15 Jan 2021 13:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255B56E0BE;
 Fri, 15 Jan 2021 13:46:11 +0000 (UTC)
IronPort-SDR: PKKpfvzgRQzj0CD3PDABbo2D/2sojJ23MESHAeOP0vLceouMa3GVqTNO95ZXxCygZLjoJiMTn0
 I5AZmRKJQVnQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="157727627"
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; d="scan'208";a="157727627"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2021 05:46:08 -0800
IronPort-SDR: tvnwY7Tprm/gkMt3tAoPPW1Gn+Gyh9zGQAS/cbFBDrqnDmEp5EU5rN1vw01Ip645B1ty9eKfsl
 IU9PwlVnI1ig==
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; d="scan'208";a="382667627"
Received: from bmkierna-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.213.221.58])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2021 05:46:00 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 2/5] drm/i915: Keep track of pwm-related backlight
 hooks separately
In-Reply-To: <20210114221709.2261452-3-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210114221709.2261452-1-lyude@redhat.com>
 <20210114221709.2261452-3-lyude@redhat.com>
Date: Fri, 15 Jan 2021 15:45:57 +0200
Message-ID: <875z3ypb3e.fsf@intel.com>
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
 Anshuman Gupta <anshuman.gupta@intel.com>, David Airlie <airlied@linux.ie>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 Jan 2021, Lyude Paul <lyude@redhat.com> wrote:
> Currently, every different type of backlight hook that i915 supports is
> pretty straight forward - you have a backlight, probably through PWM
> (but maybe DPCD), with a single set of platform-specific hooks that are
> used for controlling it.
>
> HDR backlights, in particular VESA and Intel's HDR backlight
> implementations, can end up being more complicated. With Intel's
> proprietary interface, HDR backlight controls always run through the
> DPCD. When the backlight is in SDR backlight mode however, the driver
> may need to bypass the TCON and control the backlight directly through
> PWM.
>
> So, in order to support this we'll need to split our backlight callbacks
> into two groups: a set of high-level backlight control callbacks in
> intel_panel, and an additional set of pwm-specific backlight control
> callbacks. This also implies a functional changes for how these
> callbacks are used:
>
> * We now keep track of two separate backlight level ranges, one for the
>   high-level backlight, and one for the pwm backlight range
> * We also keep track of backlight enablement and PWM backlight
>   enablement separately
> * Since the currently set backlight level might not be the same as the
>   currently programmed PWM backlight level, we stop setting
>   panel->backlight.level with the currently programmed PWM backlight
>   level in panel->backlight.pwm_funcs->setup(). Instead, we rely
>   on the higher level backlight control functions to retrieve the
>   current PWM backlight level (in this case, intel_pwm_get_backlight()).
>   Note that there are still a few PWM backlight setup callbacks that
>   do actually need to retrieve the current PWM backlight level, although
>   we no longer save this value in panel->backlight.level like before.
>
> Additionally, we drop the call to lpt_get_backlight() in
> lpt_setup_backlight(), and avoid unconditionally writing the PWM value that
> we get from it and only write it back if we're in CPU mode, and switching
> to PCH mode. The reason for this is because in the original codepath for
> this, it was expected that the intel_panel_bl_funcs->setup() hook would be
> responsible for fetching the initial backlight level. On lpt systems, the
> only time we could ever be in PCH backlight mode is during the initial
> driver load - meaning that outside of the setup() hook, lpt_get_backlight()
> will always be the callback used for retrieving the current backlight
> level. After this patch we still need to fetch and write-back the PCH
> backlight value if we're switching from CPU mode to PCH, but because
> intel_pwm_setup_backlight() will retrieve the backlight level after setup()
> using the get() hook, which always ends up being lpt_get_backlight(). Thus
> - an additional call to lpt_get_backlight() in lpt_setup_backlight() is
> made redundant.
>
> v8:
> * Go back to getting initial brightness level with
>   intel_pwm_get_backlight(), the other fix we had was definitely wrong.
> v7:
> * Use panel->backlight.pwm_funcs->get() to get the backlight level in
>   intel_pwm_setup_backlight(), lest we upset lockdep
> * Rebase
> * Rename intel_panel_sanitize_pwm_level() to intel_panel_invert_pwm_level()
> v6:
> * Make sure to grab connection_mutex before calling
>   intel_pwm_get_backlight() in intel_pwm_setup_backlight()
> v5:
> * Fix indenting warnings from checkpatch
> v4:
> * Fix commit message
> * Remove outdated comment in intel_panel.c
> * Rename pwm_(min|max) to pwm_level_(min|max)
> * Use intel_pwm_get_backlight() in intel_pwm_setup_backlight() instead of
>   indirection
> * Don't move intel_dp_aux_init_bcklight_funcs() call to bottom of
>   intel_panel_init_backlight_funcs() quite yet
> v3:
> * Reuse intel_panel_bl_funcs() for pwm_funcs
> * Explain why we drop lpt_get_backlight()
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> Cc: thaytan@noraisin.net
> Cc: Vasily Khoruzhick <anarsoul@gmail.com>
>
> squash! drm/i915: Keep track of pwm-related backlight hooks separately
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  .../drm/i915/display/intel_display_types.h    |   4 +
>  drivers/gpu/drm/i915/display/intel_panel.c    | 331 ++++++++++--------
>  2 files changed, 188 insertions(+), 147 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index b1f4ec144207..ee23cc1518df 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -252,6 +252,9 @@ struct intel_panel {
>  		bool alternate_pwm_increment;	/* lpt+ */
>  
>  		/* PWM chip */
> +		u32 pwm_level_min;
> +		u32 pwm_level_max;
> +		bool pwm_enabled;
>  		bool util_pin_active_low;	/* bxt+ */
>  		u8 controller;		/* bxt+ only */
>  		struct pwm_device *pwm;
> @@ -263,6 +266,7 @@ struct intel_panel {
>  		struct backlight_device *device;
>  
>  		const struct intel_panel_bl_funcs *funcs;
> +		const struct intel_panel_bl_funcs *pwm_funcs;
>  		void (*power)(struct intel_connector *, bool enable);
>  	} backlight;
>  };
> diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
> index 7587aaefc7a0..cc2386ef6219 100644
> --- a/drivers/gpu/drm/i915/display/intel_panel.c
> +++ b/drivers/gpu/drm/i915/display/intel_panel.c
> @@ -511,25 +511,34 @@ static u32 scale_hw_to_user(struct intel_connector *connector,
>  		     0, user_max);
>  }
>  
> -static u32 intel_panel_compute_brightness(struct intel_connector *connector,
> -					  u32 val)
> +static u32 intel_panel_invert_pwm_level(struct intel_connector *connector, u32 val)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
>  	struct intel_panel *panel = &connector->panel;
>  
> -	drm_WARN_ON(&dev_priv->drm, panel->backlight.max == 0);
> +	drm_WARN_ON(&dev_priv->drm, panel->backlight.pwm_level_max == 0);
>  
>  	if (dev_priv->params.invert_brightness < 0)
>  		return val;
>  
>  	if (dev_priv->params.invert_brightness > 0 ||
>  	    dev_priv->quirks & QUIRK_INVERT_BRIGHTNESS) {
> -		return panel->backlight.max - val + panel->backlight.min;
> +		return panel->backlight.pwm_level_max - val + panel->backlight.pwm_level_min;
>  	}
>  
>  	return val;
>  }
>  
> +void intel_panel_set_pwm_level(const struct drm_connector_state *conn_state, u32 val)
> +{
> +	struct intel_connector *connector = to_intel_connector(conn_state->connector);
> +	struct drm_i915_private *i915 = to_i915(connector->base.dev);
> +	struct intel_panel *panel = &connector->panel;
> +
> +	drm_dbg_kms(&i915->drm, "set backlight PWM = %d\n", val);
> +	panel->backlight.pwm_funcs->set(conn_state, val);
> +}
> +
>  static u32 lpt_get_backlight(struct intel_connector *connector, enum pipe unused)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
> @@ -618,12 +627,12 @@ static void i9xx_set_backlight(const struct drm_connector_state *conn_state, u32
>  	struct intel_panel *panel = &connector->panel;
>  	u32 tmp, mask;
>  
> -	drm_WARN_ON(&dev_priv->drm, panel->backlight.max == 0);
> +	drm_WARN_ON(&dev_priv->drm, panel->backlight.pwm_level_max == 0);
>  
>  	if (panel->backlight.combination_mode) {
>  		u8 lbpc;
>  
> -		lbpc = level * 0xfe / panel->backlight.max + 1;
> +		lbpc = level * 0xfe / panel->backlight.pwm_level_max + 1;
>  		level /= lbpc;
>  		pci_write_config_byte(dev_priv->drm.pdev, LBPC, lbpc);
>  	}
> @@ -675,9 +684,8 @@ intel_panel_actually_set_backlight(const struct drm_connector_state *conn_state,
>  	struct drm_i915_private *i915 = to_i915(connector->base.dev);
>  	struct intel_panel *panel = &connector->panel;
>  
> -	drm_dbg_kms(&i915->drm, "set backlight PWM = %d\n", level);
> +	drm_dbg_kms(&i915->drm, "set backlight level = %d\n", level);
>  
> -	level = intel_panel_compute_brightness(connector, level);
>  	panel->backlight.funcs->set(conn_state, level);
>  }
>  
> @@ -726,7 +734,7 @@ static void lpt_disable_backlight(const struct drm_connector_state *old_conn_sta
>  	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
>  	u32 tmp;
>  
> -	intel_panel_actually_set_backlight(old_conn_state, level);
> +	intel_panel_set_pwm_level(old_conn_state, level);
>  
>  	/*
>  	 * Although we don't support or enable CPU PWM with LPT/SPT based
> @@ -754,7 +762,7 @@ static void pch_disable_backlight(const struct drm_connector_state *old_conn_sta
>  	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
>  	u32 tmp;
>  
> -	intel_panel_actually_set_backlight(old_conn_state, val);
> +	intel_panel_set_pwm_level(old_conn_state, val);
>  
>  	tmp = intel_de_read(dev_priv, BLC_PWM_CPU_CTL2);
>  	intel_de_write(dev_priv, BLC_PWM_CPU_CTL2, tmp & ~BLM_PWM_ENABLE);
> @@ -765,7 +773,7 @@ static void pch_disable_backlight(const struct drm_connector_state *old_conn_sta
>  
>  static void i9xx_disable_backlight(const struct drm_connector_state *old_conn_state, u32 val)
>  {
> -	intel_panel_actually_set_backlight(old_conn_state, val);
> +	intel_panel_set_pwm_level(old_conn_state, val);
>  }
>  
>  static void i965_disable_backlight(const struct drm_connector_state *old_conn_state, u32 val)
> @@ -773,7 +781,7 @@ static void i965_disable_backlight(const struct drm_connector_state *old_conn_st
>  	struct drm_i915_private *dev_priv = to_i915(old_conn_state->connector->dev);
>  	u32 tmp;
>  
> -	intel_panel_actually_set_backlight(old_conn_state, val);
> +	intel_panel_set_pwm_level(old_conn_state, val);
>  
>  	tmp = intel_de_read(dev_priv, BLC_PWM_CTL2);
>  	intel_de_write(dev_priv, BLC_PWM_CTL2, tmp & ~BLM_PWM_ENABLE);
> @@ -786,7 +794,7 @@ static void vlv_disable_backlight(const struct drm_connector_state *old_conn_sta
>  	enum pipe pipe = to_intel_crtc(old_conn_state->crtc)->pipe;
>  	u32 tmp;
>  
> -	intel_panel_actually_set_backlight(old_conn_state, val);
> +	intel_panel_set_pwm_level(old_conn_state, val);
>  
>  	tmp = intel_de_read(dev_priv, VLV_BLC_PWM_CTL2(pipe));
>  	intel_de_write(dev_priv, VLV_BLC_PWM_CTL2(pipe),
> @@ -800,7 +808,7 @@ static void bxt_disable_backlight(const struct drm_connector_state *old_conn_sta
>  	struct intel_panel *panel = &connector->panel;
>  	u32 tmp;
>  
> -	intel_panel_actually_set_backlight(old_conn_state, val);
> +	intel_panel_set_pwm_level(old_conn_state, val);
>  
>  	tmp = intel_de_read(dev_priv,
>  			    BXT_BLC_PWM_CTL(panel->backlight.controller));
> @@ -821,7 +829,7 @@ static void cnp_disable_backlight(const struct drm_connector_state *old_conn_sta
>  	struct intel_panel *panel = &connector->panel;
>  	u32 tmp;
>  
> -	intel_panel_actually_set_backlight(old_conn_state, val);
> +	intel_panel_set_pwm_level(old_conn_state, val);
>  
>  	tmp = intel_de_read(dev_priv,
>  			    BXT_BLC_PWM_CTL(panel->backlight.controller));
> @@ -900,7 +908,7 @@ static void lpt_enable_backlight(const struct intel_crtc_state *crtc_state,
>  		intel_de_write(dev_priv, SOUTH_CHICKEN1, schicken);
>  	}
>  
> -	pch_ctl2 = panel->backlight.max << 16;
> +	pch_ctl2 = panel->backlight.pwm_level_max << 16;
>  	intel_de_write(dev_priv, BLC_PWM_PCH_CTL2, pch_ctl2);
>  
>  	pch_ctl1 = 0;
> @@ -917,7 +925,7 @@ static void lpt_enable_backlight(const struct intel_crtc_state *crtc_state,
>  		       pch_ctl1 | BLM_PCH_PWM_ENABLE);
>  
>  	/* This won't stick until the above enable. */
> -	intel_panel_actually_set_backlight(conn_state, level);
> +	intel_panel_set_pwm_level(conn_state, level);
>  }
>  
>  static void pch_enable_backlight(const struct intel_crtc_state *crtc_state,
> @@ -952,9 +960,9 @@ static void pch_enable_backlight(const struct intel_crtc_state *crtc_state,
>  	intel_de_write(dev_priv, BLC_PWM_CPU_CTL2, cpu_ctl2 | BLM_PWM_ENABLE);
>  
>  	/* This won't stick until the above enable. */
> -	intel_panel_actually_set_backlight(conn_state, level);
> +	intel_panel_set_pwm_level(conn_state, level);
>  
> -	pch_ctl2 = panel->backlight.max << 16;
> +	pch_ctl2 = panel->backlight.pwm_level_max << 16;
>  	intel_de_write(dev_priv, BLC_PWM_PCH_CTL2, pch_ctl2);
>  
>  	pch_ctl1 = 0;
> @@ -981,7 +989,7 @@ static void i9xx_enable_backlight(const struct intel_crtc_state *crtc_state,
>  		intel_de_write(dev_priv, BLC_PWM_CTL, 0);
>  	}
>  
> -	freq = panel->backlight.max;
> +	freq = panel->backlight.pwm_level_max;
>  	if (panel->backlight.combination_mode)
>  		freq /= 0xff;
>  
> @@ -995,7 +1003,7 @@ static void i9xx_enable_backlight(const struct intel_crtc_state *crtc_state,
>  	intel_de_posting_read(dev_priv, BLC_PWM_CTL);
>  
>  	/* XXX: combine this into above write? */
> -	intel_panel_actually_set_backlight(conn_state, level);
> +	intel_panel_set_pwm_level(conn_state, level);
>  
>  	/*
>  	 * Needed to enable backlight on some 855gm models. BLC_HIST_CTL is
> @@ -1022,7 +1030,7 @@ static void i965_enable_backlight(const struct intel_crtc_state *crtc_state,
>  		intel_de_write(dev_priv, BLC_PWM_CTL2, ctl2);
>  	}
>  
> -	freq = panel->backlight.max;
> +	freq = panel->backlight.pwm_level_max;
>  	if (panel->backlight.combination_mode)
>  		freq /= 0xff;
>  
> @@ -1038,7 +1046,7 @@ static void i965_enable_backlight(const struct intel_crtc_state *crtc_state,
>  	intel_de_posting_read(dev_priv, BLC_PWM_CTL2);
>  	intel_de_write(dev_priv, BLC_PWM_CTL2, ctl2 | BLM_PWM_ENABLE);
>  
> -	intel_panel_actually_set_backlight(conn_state, level);
> +	intel_panel_set_pwm_level(conn_state, level);
>  }
>  
>  static void vlv_enable_backlight(const struct intel_crtc_state *crtc_state,
> @@ -1057,11 +1065,11 @@ static void vlv_enable_backlight(const struct intel_crtc_state *crtc_state,
>  		intel_de_write(dev_priv, VLV_BLC_PWM_CTL2(pipe), ctl2);
>  	}
>  
> -	ctl = panel->backlight.max << 16;
> +	ctl = panel->backlight.pwm_level_max << 16;
>  	intel_de_write(dev_priv, VLV_BLC_PWM_CTL(pipe), ctl);
>  
>  	/* XXX: combine this into above write? */
> -	intel_panel_actually_set_backlight(conn_state, level);
> +	intel_panel_set_pwm_level(conn_state, level);
>  
>  	ctl2 = 0;
>  	if (panel->backlight.active_low_pwm)
> @@ -1110,9 +1118,9 @@ static void bxt_enable_backlight(const struct intel_crtc_state *crtc_state,
>  
>  	intel_de_write(dev_priv,
>  		       BXT_BLC_PWM_FREQ(panel->backlight.controller),
> -		       panel->backlight.max);
> +		       panel->backlight.pwm_level_max);
>  
> -	intel_panel_actually_set_backlight(conn_state, level);
> +	intel_panel_set_pwm_level(conn_state, level);
>  
>  	pwm_ctl = 0;
>  	if (panel->backlight.active_low_pwm)
> @@ -1146,9 +1154,9 @@ static void cnp_enable_backlight(const struct intel_crtc_state *crtc_state,
>  
>  	intel_de_write(dev_priv,
>  		       BXT_BLC_PWM_FREQ(panel->backlight.controller),
> -		       panel->backlight.max);
> +		       panel->backlight.pwm_level_max);
>  
> -	intel_panel_actually_set_backlight(conn_state, level);
> +	intel_panel_set_pwm_level(conn_state, level);
>  
>  	pwm_ctl = 0;
>  	if (panel->backlight.active_low_pwm)
> @@ -1168,7 +1176,6 @@ static void ext_pwm_enable_backlight(const struct intel_crtc_state *crtc_state,
>  	struct intel_connector *connector = to_intel_connector(conn_state->connector);
>  	struct intel_panel *panel = &connector->panel;
>  
> -	level = intel_panel_compute_brightness(connector, level);
>  	pwm_set_relative_duty_cycle(&panel->backlight.pwm_state, level, 100);
>  	panel->backlight.pwm_state.enabled = true;
>  	pwm_apply_state(panel->backlight.pwm, &panel->backlight.pwm_state);
> @@ -1226,10 +1233,8 @@ static u32 intel_panel_get_backlight(struct intel_connector *connector)
>  
>  	mutex_lock(&dev_priv->backlight_lock);
>  
> -	if (panel->backlight.enabled) {
> +	if (panel->backlight.enabled)
>  		val = panel->backlight.funcs->get(connector, intel_connector_get_pipe(connector));
> -		val = intel_panel_compute_brightness(connector, val);
> -	}
>  
>  	mutex_unlock(&dev_priv->backlight_lock);
>  
> @@ -1560,13 +1565,13 @@ static u32 get_backlight_max_vbt(struct intel_connector *connector)
>  	u16 pwm_freq_hz = get_vbt_pwm_freq(dev_priv);
>  	u32 pwm;
>  
> -	if (!panel->backlight.funcs->hz_to_pwm) {
> +	if (!panel->backlight.pwm_funcs->hz_to_pwm) {
>  		drm_dbg_kms(&dev_priv->drm,
>  			    "backlight frequency conversion not supported\n");
>  		return 0;
>  	}
>  
> -	pwm = panel->backlight.funcs->hz_to_pwm(connector, pwm_freq_hz);
> +	pwm = panel->backlight.pwm_funcs->hz_to_pwm(connector, pwm_freq_hz);
>  	if (!pwm) {
>  		drm_dbg_kms(&dev_priv->drm,
>  			    "backlight frequency conversion failed\n");
> @@ -1585,7 +1590,7 @@ static u32 get_backlight_min_vbt(struct intel_connector *connector)
>  	struct intel_panel *panel = &connector->panel;
>  	int min;
>  
> -	drm_WARN_ON(&dev_priv->drm, panel->backlight.max == 0);
> +	drm_WARN_ON(&dev_priv->drm, panel->backlight.pwm_level_max == 0);
>  
>  	/*
>  	 * XXX: If the vbt value is 255, it makes min equal to max, which leads
> @@ -1602,7 +1607,7 @@ static u32 get_backlight_min_vbt(struct intel_connector *connector)
>  	}
>  
>  	/* vbt value is a coefficient in range [0..255] */
> -	return scale(min, 0, 255, 0, panel->backlight.max);
> +	return scale(min, 0, 255, 0, panel->backlight.pwm_level_max);
>  }
>  
>  static int lpt_setup_backlight(struct intel_connector *connector, enum pipe unused)
> @@ -1622,29 +1627,28 @@ static int lpt_setup_backlight(struct intel_connector *connector, enum pipe unus
>  	panel->backlight.active_low_pwm = pch_ctl1 & BLM_PCH_POLARITY;
>  
>  	pch_ctl2 = intel_de_read(dev_priv, BLC_PWM_PCH_CTL2);
> -	panel->backlight.max = pch_ctl2 >> 16;
> +	panel->backlight.pwm_level_max = pch_ctl2 >> 16;
>  
>  	cpu_ctl2 = intel_de_read(dev_priv, BLC_PWM_CPU_CTL2);
>  
> -	if (!panel->backlight.max)
> -		panel->backlight.max = get_backlight_max_vbt(connector);
> +	if (!panel->backlight.pwm_level_max)
> +		panel->backlight.pwm_level_max = get_backlight_max_vbt(connector);
>  
> -	if (!panel->backlight.max)
> +	if (!panel->backlight.pwm_level_max)
>  		return -ENODEV;
>  
> -	panel->backlight.min = get_backlight_min_vbt(connector);
> +	panel->backlight.pwm_level_min = get_backlight_min_vbt(connector);
>  
> -	panel->backlight.enabled = pch_ctl1 & BLM_PCH_PWM_ENABLE;
> +	panel->backlight.pwm_enabled = pch_ctl1 & BLM_PCH_PWM_ENABLE;
>  
> -	cpu_mode = panel->backlight.enabled && HAS_PCH_LPT(dev_priv) &&
> +	cpu_mode = panel->backlight.pwm_enabled && HAS_PCH_LPT(dev_priv) &&
>  		   !(pch_ctl1 & BLM_PCH_OVERRIDE_ENABLE) &&
>  		   (cpu_ctl2 & BLM_PWM_ENABLE);
> -	if (cpu_mode)
> -		val = pch_get_backlight(connector, unused);
> -	else
> -		val = lpt_get_backlight(connector, unused);
>  
>  	if (cpu_mode) {
> +		val = intel_panel_invert_pwm_level(connector,
> +						   pch_get_backlight(connector, unused));
> +

I think the above should be just:

		val = pch_get_backlight(connector, unused);

>  		drm_dbg_kms(&dev_priv->drm,
>  			    "CPU backlight register was enabled, switching to PCH override\n");
>  
> @@ -1657,7 +1661,7 @@ static int lpt_setup_backlight(struct intel_connector *connector, enum pipe unus
>  			       cpu_ctl2 & ~BLM_PWM_ENABLE);
>  	}
>  

And all of the below should be removed:

> -	val = intel_panel_compute_brightness(connector, val);
> +	val = intel_panel_invert_pwm_level(connector, val);
>  	panel->backlight.level = clamp(val, panel->backlight.min,
>  				       panel->backlight.max);

With that,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>  
> @@ -1668,29 +1672,24 @@ static int pch_setup_backlight(struct intel_connector *connector, enum pipe unus
>  {
>  	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
>  	struct intel_panel *panel = &connector->panel;
> -	u32 cpu_ctl2, pch_ctl1, pch_ctl2, val;
> +	u32 cpu_ctl2, pch_ctl1, pch_ctl2;
>  
>  	pch_ctl1 = intel_de_read(dev_priv, BLC_PWM_PCH_CTL1);
>  	panel->backlight.active_low_pwm = pch_ctl1 & BLM_PCH_POLARITY;
>  
>  	pch_ctl2 = intel_de_read(dev_priv, BLC_PWM_PCH_CTL2);
> -	panel->backlight.max = pch_ctl2 >> 16;
> +	panel->backlight.pwm_level_max = pch_ctl2 >> 16;
>  
> -	if (!panel->backlight.max)
> -		panel->backlight.max = get_backlight_max_vbt(connector);
> +	if (!panel->backlight.pwm_level_max)
> +		panel->backlight.pwm_level_max = get_backlight_max_vbt(connector);
>  
> -	if (!panel->backlight.max)
> +	if (!panel->backlight.pwm_level_max)
>  		return -ENODEV;
>  
> -	panel->backlight.min = get_backlight_min_vbt(connector);
> -
> -	val = pch_get_backlight(connector, unused);
> -	val = intel_panel_compute_brightness(connector, val);
> -	panel->backlight.level = clamp(val, panel->backlight.min,
> -				       panel->backlight.max);
> +	panel->backlight.pwm_level_min = get_backlight_min_vbt(connector);
>  
>  	cpu_ctl2 = intel_de_read(dev_priv, BLC_PWM_CPU_CTL2);
> -	panel->backlight.enabled = (cpu_ctl2 & BLM_PWM_ENABLE) &&
> +	panel->backlight.pwm_enabled = (cpu_ctl2 & BLM_PWM_ENABLE) &&
>  		(pch_ctl1 & BLM_PCH_PWM_ENABLE);
>  
>  	return 0;
> @@ -1710,27 +1709,26 @@ static int i9xx_setup_backlight(struct intel_connector *connector, enum pipe unu
>  	if (IS_PINEVIEW(dev_priv))
>  		panel->backlight.active_low_pwm = ctl & BLM_POLARITY_PNV;
>  
> -	panel->backlight.max = ctl >> 17;
> +	panel->backlight.pwm_level_max = ctl >> 17;
>  
> -	if (!panel->backlight.max) {
> -		panel->backlight.max = get_backlight_max_vbt(connector);
> -		panel->backlight.max >>= 1;
> +	if (!panel->backlight.pwm_level_max) {
> +		panel->backlight.pwm_level_max = get_backlight_max_vbt(connector);
> +		panel->backlight.pwm_level_max >>= 1;
>  	}
>  
> -	if (!panel->backlight.max)
> +	if (!panel->backlight.pwm_level_max)
>  		return -ENODEV;
>  
>  	if (panel->backlight.combination_mode)
> -		panel->backlight.max *= 0xff;
> +		panel->backlight.pwm_level_max *= 0xff;
>  
> -	panel->backlight.min = get_backlight_min_vbt(connector);
> +	panel->backlight.pwm_level_min = get_backlight_min_vbt(connector);
>  
>  	val = i9xx_get_backlight(connector, unused);
> -	val = intel_panel_compute_brightness(connector, val);
> -	panel->backlight.level = clamp(val, panel->backlight.min,
> -				       panel->backlight.max);
> +	val = intel_panel_invert_pwm_level(connector, val);
> +	val = clamp(val, panel->backlight.pwm_level_min, panel->backlight.pwm_level_max);
>  
> -	panel->backlight.enabled = val != 0;
> +	panel->backlight.pwm_enabled = val != 0;
>  
>  	return 0;
>  }
> @@ -1739,32 +1737,27 @@ static int i965_setup_backlight(struct intel_connector *connector, enum pipe unu
>  {
>  	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
>  	struct intel_panel *panel = &connector->panel;
> -	u32 ctl, ctl2, val;
> +	u32 ctl, ctl2;
>  
>  	ctl2 = intel_de_read(dev_priv, BLC_PWM_CTL2);
>  	panel->backlight.combination_mode = ctl2 & BLM_COMBINATION_MODE;
>  	panel->backlight.active_low_pwm = ctl2 & BLM_POLARITY_I965;
>  
>  	ctl = intel_de_read(dev_priv, BLC_PWM_CTL);
> -	panel->backlight.max = ctl >> 16;
> +	panel->backlight.pwm_level_max = ctl >> 16;
>  
> -	if (!panel->backlight.max)
> -		panel->backlight.max = get_backlight_max_vbt(connector);
> +	if (!panel->backlight.pwm_level_max)
> +		panel->backlight.pwm_level_max = get_backlight_max_vbt(connector);
>  
> -	if (!panel->backlight.max)
> +	if (!panel->backlight.pwm_level_max)
>  		return -ENODEV;
>  
>  	if (panel->backlight.combination_mode)
> -		panel->backlight.max *= 0xff;
> +		panel->backlight.pwm_level_max *= 0xff;
>  
> -	panel->backlight.min = get_backlight_min_vbt(connector);
> +	panel->backlight.pwm_level_min = get_backlight_min_vbt(connector);
>  
> -	val = i9xx_get_backlight(connector, unused);
> -	val = intel_panel_compute_brightness(connector, val);
> -	panel->backlight.level = clamp(val, panel->backlight.min,
> -				       panel->backlight.max);
> -
> -	panel->backlight.enabled = ctl2 & BLM_PWM_ENABLE;
> +	panel->backlight.pwm_enabled = ctl2 & BLM_PWM_ENABLE;
>  
>  	return 0;
>  }
> @@ -1773,7 +1766,7 @@ static int vlv_setup_backlight(struct intel_connector *connector, enum pipe pipe
>  {
>  	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
>  	struct intel_panel *panel = &connector->panel;
> -	u32 ctl, ctl2, val;
> +	u32 ctl, ctl2;
>  
>  	if (drm_WARN_ON(&dev_priv->drm, pipe != PIPE_A && pipe != PIPE_B))
>  		return -ENODEV;
> @@ -1782,22 +1775,17 @@ static int vlv_setup_backlight(struct intel_connector *connector, enum pipe pipe
>  	panel->backlight.active_low_pwm = ctl2 & BLM_POLARITY_I965;
>  
>  	ctl = intel_de_read(dev_priv, VLV_BLC_PWM_CTL(pipe));
> -	panel->backlight.max = ctl >> 16;
> +	panel->backlight.pwm_level_max = ctl >> 16;
>  
> -	if (!panel->backlight.max)
> -		panel->backlight.max = get_backlight_max_vbt(connector);
> +	if (!panel->backlight.pwm_level_max)
> +		panel->backlight.pwm_level_max = get_backlight_max_vbt(connector);
>  
> -	if (!panel->backlight.max)
> +	if (!panel->backlight.pwm_level_max)
>  		return -ENODEV;
>  
> -	panel->backlight.min = get_backlight_min_vbt(connector);
> +	panel->backlight.pwm_level_min = get_backlight_min_vbt(connector);
>  
> -	val = vlv_get_backlight(connector, pipe);
> -	val = intel_panel_compute_brightness(connector, val);
> -	panel->backlight.level = clamp(val, panel->backlight.min,
> -				       panel->backlight.max);
> -
> -	panel->backlight.enabled = ctl2 & BLM_PWM_ENABLE;
> +	panel->backlight.pwm_enabled = ctl2 & BLM_PWM_ENABLE;
>  
>  	return 0;
>  }
> @@ -1822,24 +1810,18 @@ bxt_setup_backlight(struct intel_connector *connector, enum pipe unused)
>  	}
>  
>  	panel->backlight.active_low_pwm = pwm_ctl & BXT_BLC_PWM_POLARITY;
> -	panel->backlight.max =
> -		intel_de_read(dev_priv,
> -			      BXT_BLC_PWM_FREQ(panel->backlight.controller));
> +	panel->backlight.pwm_level_max =
> +		intel_de_read(dev_priv, BXT_BLC_PWM_FREQ(panel->backlight.controller));
>  
> -	if (!panel->backlight.max)
> -		panel->backlight.max = get_backlight_max_vbt(connector);
> +	if (!panel->backlight.pwm_level_max)
> +		panel->backlight.pwm_level_max = get_backlight_max_vbt(connector);
>  
> -	if (!panel->backlight.max)
> +	if (!panel->backlight.pwm_level_max)
>  		return -ENODEV;
>  
> -	panel->backlight.min = get_backlight_min_vbt(connector);
> +	panel->backlight.pwm_level_min = get_backlight_min_vbt(connector);
>  
> -	val = bxt_get_backlight(connector, unused);
> -	val = intel_panel_compute_brightness(connector, val);
> -	panel->backlight.level = clamp(val, panel->backlight.min,
> -				       panel->backlight.max);
> -
> -	panel->backlight.enabled = pwm_ctl & BXT_BLC_PWM_ENABLE;
> +	panel->backlight.pwm_enabled = pwm_ctl & BXT_BLC_PWM_ENABLE;
>  
>  	return 0;
>  }
> @@ -1849,7 +1831,7 @@ cnp_setup_backlight(struct intel_connector *connector, enum pipe unused)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
>  	struct intel_panel *panel = &connector->panel;
> -	u32 pwm_ctl, val;
> +	u32 pwm_ctl;
>  
>  	/*
>  	 * CNP has the BXT implementation of backlight, but with only one
> @@ -1862,24 +1844,18 @@ cnp_setup_backlight(struct intel_connector *connector, enum pipe unused)
>  				BXT_BLC_PWM_CTL(panel->backlight.controller));
>  
>  	panel->backlight.active_low_pwm = pwm_ctl & BXT_BLC_PWM_POLARITY;
> -	panel->backlight.max =
> -		intel_de_read(dev_priv,
> -			      BXT_BLC_PWM_FREQ(panel->backlight.controller));
> +	panel->backlight.pwm_level_max =
> +		intel_de_read(dev_priv, BXT_BLC_PWM_FREQ(panel->backlight.controller));
>  
> -	if (!panel->backlight.max)
> -		panel->backlight.max = get_backlight_max_vbt(connector);
> +	if (!panel->backlight.pwm_level_max)
> +		panel->backlight.pwm_level_max = get_backlight_max_vbt(connector);
>  
> -	if (!panel->backlight.max)
> +	if (!panel->backlight.pwm_level_max)
>  		return -ENODEV;
>  
> -	panel->backlight.min = get_backlight_min_vbt(connector);
> -
> -	val = bxt_get_backlight(connector, unused);
> -	val = intel_panel_compute_brightness(connector, val);
> -	panel->backlight.level = clamp(val, panel->backlight.min,
> -				       panel->backlight.max);
> +	panel->backlight.pwm_level_min = get_backlight_min_vbt(connector);
>  
> -	panel->backlight.enabled = pwm_ctl & BXT_BLC_PWM_ENABLE;
> +	panel->backlight.pwm_enabled = pwm_ctl & BXT_BLC_PWM_ENABLE;
>  
>  	return 0;
>  }
> @@ -1909,8 +1885,8 @@ static int ext_pwm_setup_backlight(struct intel_connector *connector,
>  		return -ENODEV;
>  	}
>  
> -	panel->backlight.max = 100; /* 100% */
> -	panel->backlight.min = get_backlight_min_vbt(connector);
> +	panel->backlight.pwm_level_max = 100; /* 100% */
> +	panel->backlight.pwm_level_min = get_backlight_min_vbt(connector);
>  
>  	if (pwm_is_enabled(panel->backlight.pwm)) {
>  		/* PWM is already enabled, use existing settings */
> @@ -1918,10 +1894,8 @@ static int ext_pwm_setup_backlight(struct intel_connector *connector,
>  
>  		level = pwm_get_relative_duty_cycle(&panel->backlight.pwm_state,
>  						    100);
> -		level = intel_panel_compute_brightness(connector, level);
> -		panel->backlight.level = clamp(level, panel->backlight.min,
> -					       panel->backlight.max);
> -		panel->backlight.enabled = true;
> +		level = intel_panel_invert_pwm_level(connector, level);
> +		panel->backlight.pwm_enabled = true;
>  
>  		drm_dbg_kms(&dev_priv->drm, "PWM already enabled at freq %ld, VBT freq %d, level %d\n",
>  			    NSEC_PER_SEC / (unsigned long)panel->backlight.pwm_state.period,
> @@ -1937,6 +1911,58 @@ static int ext_pwm_setup_backlight(struct intel_connector *connector,
>  	return 0;
>  }
>  
> +static void intel_pwm_set_backlight(const struct drm_connector_state *conn_state, u32 level)
> +{
> +	struct intel_connector *connector = to_intel_connector(conn_state->connector);
> +	struct intel_panel *panel = &connector->panel;
> +
> +	panel->backlight.pwm_funcs->set(conn_state,
> +				       intel_panel_invert_pwm_level(connector, level));
> +}
> +
> +static u32 intel_pwm_get_backlight(struct intel_connector *connector, enum pipe pipe)
> +{
> +	struct intel_panel *panel = &connector->panel;
> +
> +	return intel_panel_invert_pwm_level(connector,
> +					    panel->backlight.pwm_funcs->get(connector, pipe));
> +}
> +
> +static void intel_pwm_enable_backlight(const struct intel_crtc_state *crtc_state,
> +				       const struct drm_connector_state *conn_state, u32 level)
> +{
> +	struct intel_connector *connector = to_intel_connector(conn_state->connector);
> +	struct intel_panel *panel = &connector->panel;
> +
> +	panel->backlight.pwm_funcs->enable(crtc_state, conn_state,
> +					   intel_panel_invert_pwm_level(connector, level));
> +}
> +
> +static void intel_pwm_disable_backlight(const struct drm_connector_state *conn_state, u32 level)
> +{
> +	struct intel_connector *connector = to_intel_connector(conn_state->connector);
> +	struct intel_panel *panel = &connector->panel;
> +
> +	panel->backlight.pwm_funcs->disable(conn_state,
> +					    intel_panel_invert_pwm_level(connector, level));
> +}
> +
> +static int intel_pwm_setup_backlight(struct intel_connector *connector, enum pipe pipe)
> +{
> +	struct intel_panel *panel = &connector->panel;
> +	int ret = panel->backlight.pwm_funcs->setup(connector, pipe);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	panel->backlight.min = panel->backlight.pwm_level_min;
> +	panel->backlight.max = panel->backlight.pwm_level_max;
> +	panel->backlight.level = intel_pwm_get_backlight(connector, pipe);
> +	panel->backlight.enabled = panel->backlight.pwm_enabled;
> +
> +	return 0;
> +}
> +
>  void intel_panel_update_backlight(struct intel_atomic_state *state,
>  				  struct intel_encoder *encoder,
>  				  const struct intel_crtc_state *crtc_state,
> @@ -2010,7 +2036,7 @@ static void intel_panel_destroy_backlight(struct intel_panel *panel)
>  	panel->backlight.present = false;
>  }
>  
> -static const struct intel_panel_bl_funcs bxt_funcs = {
> +static const struct intel_panel_bl_funcs bxt_pwm_funcs = {
>  	.setup = bxt_setup_backlight,
>  	.enable = bxt_enable_backlight,
>  	.disable = bxt_disable_backlight,
> @@ -2019,7 +2045,7 @@ static const struct intel_panel_bl_funcs bxt_funcs = {
>  	.hz_to_pwm = bxt_hz_to_pwm,
>  };
>  
> -static const struct intel_panel_bl_funcs cnp_funcs = {
> +static const struct intel_panel_bl_funcs cnp_pwm_funcs = {
>  	.setup = cnp_setup_backlight,
>  	.enable = cnp_enable_backlight,
>  	.disable = cnp_disable_backlight,
> @@ -2028,7 +2054,7 @@ static const struct intel_panel_bl_funcs cnp_funcs = {
>  	.hz_to_pwm = cnp_hz_to_pwm,
>  };
>  
> -static const struct intel_panel_bl_funcs lpt_funcs = {
> +static const struct intel_panel_bl_funcs lpt_pwm_funcs = {
>  	.setup = lpt_setup_backlight,
>  	.enable = lpt_enable_backlight,
>  	.disable = lpt_disable_backlight,
> @@ -2037,7 +2063,7 @@ static const struct intel_panel_bl_funcs lpt_funcs = {
>  	.hz_to_pwm = lpt_hz_to_pwm,
>  };
>  
> -static const struct intel_panel_bl_funcs spt_funcs = {
> +static const struct intel_panel_bl_funcs spt_pwm_funcs = {
>  	.setup = lpt_setup_backlight,
>  	.enable = lpt_enable_backlight,
>  	.disable = lpt_disable_backlight,
> @@ -2046,7 +2072,7 @@ static const struct intel_panel_bl_funcs spt_funcs = {
>  	.hz_to_pwm = spt_hz_to_pwm,
>  };
>  
> -static const struct intel_panel_bl_funcs pch_funcs = {
> +static const struct intel_panel_bl_funcs pch_pwm_funcs = {
>  	.setup = pch_setup_backlight,
>  	.enable = pch_enable_backlight,
>  	.disable = pch_disable_backlight,
> @@ -2063,7 +2089,7 @@ static const struct intel_panel_bl_funcs ext_pwm_funcs = {
>  	.get = ext_pwm_get_backlight,
>  };
>  
> -static const struct intel_panel_bl_funcs vlv_funcs = {
> +static const struct intel_panel_bl_funcs vlv_pwm_funcs = {
>  	.setup = vlv_setup_backlight,
>  	.enable = vlv_enable_backlight,
>  	.disable = vlv_disable_backlight,
> @@ -2072,7 +2098,7 @@ static const struct intel_panel_bl_funcs vlv_funcs = {
>  	.hz_to_pwm = vlv_hz_to_pwm,
>  };
>  
> -static const struct intel_panel_bl_funcs i965_funcs = {
> +static const struct intel_panel_bl_funcs i965_pwm_funcs = {
>  	.setup = i965_setup_backlight,
>  	.enable = i965_enable_backlight,
>  	.disable = i965_disable_backlight,
> @@ -2081,7 +2107,7 @@ static const struct intel_panel_bl_funcs i965_funcs = {
>  	.hz_to_pwm = i965_hz_to_pwm,
>  };
>  
> -static const struct intel_panel_bl_funcs i9xx_funcs = {
> +static const struct intel_panel_bl_funcs i9xx_pwm_funcs = {
>  	.setup = i9xx_setup_backlight,
>  	.enable = i9xx_enable_backlight,
>  	.disable = i9xx_disable_backlight,
> @@ -2090,6 +2116,14 @@ static const struct intel_panel_bl_funcs i9xx_funcs = {
>  	.hz_to_pwm = i9xx_hz_to_pwm,
>  };
>  
> +static const struct intel_panel_bl_funcs pwm_bl_funcs = {
> +	.setup = intel_pwm_setup_backlight,
> +	.enable = intel_pwm_enable_backlight,
> +	.disable = intel_pwm_disable_backlight,
> +	.set = intel_pwm_set_backlight,
> +	.get = intel_pwm_get_backlight,
> +};
> +
>  /* Set up chip specific backlight functions */
>  static void
>  intel_panel_init_backlight_funcs(struct intel_panel *panel)
> @@ -2107,27 +2141,30 @@ intel_panel_init_backlight_funcs(struct intel_panel *panel)
>  		return;
>  
>  	if (IS_GEN9_LP(dev_priv)) {
> -		panel->backlight.funcs = &bxt_funcs;
> +		panel->backlight.pwm_funcs = &bxt_pwm_funcs;
>  	} else if (INTEL_PCH_TYPE(dev_priv) >= PCH_CNP) {
> -		panel->backlight.funcs = &cnp_funcs;
> +		panel->backlight.pwm_funcs = &cnp_pwm_funcs;
>  	} else if (INTEL_PCH_TYPE(dev_priv) >= PCH_LPT) {
>  		if (HAS_PCH_LPT(dev_priv))
> -			panel->backlight.funcs = &lpt_funcs;
> +			panel->backlight.pwm_funcs = &lpt_pwm_funcs;
>  		else
> -			panel->backlight.funcs = &spt_funcs;
> +			panel->backlight.pwm_funcs = &spt_pwm_funcs;
>  	} else if (HAS_PCH_SPLIT(dev_priv)) {
> -		panel->backlight.funcs = &pch_funcs;
> +		panel->backlight.pwm_funcs = &pch_pwm_funcs;
>  	} else if (IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) {
>  		if (connector->base.connector_type == DRM_MODE_CONNECTOR_DSI) {
> -			panel->backlight.funcs = &ext_pwm_funcs;
> +			panel->backlight.pwm_funcs = &ext_pwm_funcs;
>  		} else {
> -			panel->backlight.funcs = &vlv_funcs;
> +			panel->backlight.pwm_funcs = &vlv_pwm_funcs;
>  		}
>  	} else if (IS_GEN(dev_priv, 4)) {
> -		panel->backlight.funcs = &i965_funcs;
> +		panel->backlight.pwm_funcs = &i965_pwm_funcs;
>  	} else {
> -		panel->backlight.funcs = &i9xx_funcs;
> +		panel->backlight.pwm_funcs = &i9xx_pwm_funcs;
>  	}
> +
> +	/* We're using a standard PWM backlight interface */
> +	panel->backlight.funcs = &pwm_bl_funcs;
>  }
>  
>  enum drm_connector_status

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
