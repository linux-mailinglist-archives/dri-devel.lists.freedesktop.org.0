Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C2B12E447
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 10:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7193189DA7;
	Thu,  2 Jan 2020 09:14:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17DE589DA7;
 Thu,  2 Jan 2020 09:14:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jan 2020 01:14:12 -0800
X-IronPort-AV: E=Sophos;i="5.69,386,1571727600"; d="scan'208";a="214099775"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Jan 2020 01:14:09 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, Lee Jones <lee.jones@linaro.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/5] drm/i915/dsi: Init panel-enable GPIO to low when
 the LCD is initially off (v2)
In-Reply-To: <20191216205122.1850923-4-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191216205122.1850923-1-hdegoede@redhat.com>
 <20191216205122.1850923-4-hdegoede@redhat.com>
Date: Thu, 02 Jan 2020 11:14:06 +0200
Message-ID: <871rsiuso1.fsf@intel.com>
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
Cc: Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 16 Dec 2019, Hans de Goede <hdegoede@redhat.com> wrote:
> When the LCD has not been turned on by the firmware/GOP, because e.g. the
> device was booted with an external monitor connected over HDMI, we should
> not turn on the panel-enable GPIO when we request it.
>
> Turning on the panel-enable GPIO when we request it, means we turn it on
> too early in the init-sequence, which causes some panels to not correctly
> light up.
>
> This commits adds a panel_is_on parameter to intel_dsi_vbt_gpio_init()
> and makes intel_dsi_vbt_gpio_init() set the initial GPIO value accordingly.
>
> This fixes the panel not lighting up on a Thundersoft TST168 tablet when
> booted with an external monitor connected over HDMI.
>
> Changes in v2:
> - Call intel_dsi_get_hw_state() to check if the panel is on instead of
>   relying on the current_mode pointer
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dsi.h     | 2 +-
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 7 +++----
>  drivers/gpu/drm/i915/display/vlv_dsi.c       | 4 +++-
>  3 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dsi.h b/drivers/gpu/drm/i915/display/intel_dsi.h
> index de7e51cd3460..675771ea91aa 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi.h
> +++ b/drivers/gpu/drm/i915/display/intel_dsi.h
> @@ -203,7 +203,7 @@ void bxt_dsi_reset_clocks(struct intel_encoder *encoder, enum port port);
>  
>  /* intel_dsi_vbt.c */
>  bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id);
> -void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi);
> +void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on);
>  void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi);
>  void intel_dsi_vbt_exec_sequence(struct intel_dsi *intel_dsi,
>  				 enum mipi_seq seq_id);
> diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> index 8be7d6c507aa..4210f449553e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> @@ -688,17 +688,16 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id)
>   * On some BYT/CHT devs some sequences are incomplete and we need to manually
>   * control some GPIOs.
>   */
> -void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi)
> +void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
>  {
>  	struct drm_device *dev = intel_dsi->base.base.dev;
>  	struct drm_i915_private *dev_priv = to_i915(dev);
>  	struct mipi_config *mipi_config = dev_priv->vbt.dsi.config;
> +	enum gpiod_flags flags = panel_is_on ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
>  
>  	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
>  	    mipi_config->pwm_blc == PPS_BLC_PMIC) {
> -		intel_dsi->gpio_panel =
> -			gpiod_get(dev->dev, "panel", GPIOD_OUT_HIGH);
> -
> +		intel_dsi->gpio_panel = gpiod_get(dev->dev, "panel", flags);
>  		if (IS_ERR(intel_dsi->gpio_panel)) {
>  			DRM_ERROR("Failed to own gpio for panel control\n");
>  			intel_dsi->gpio_panel = NULL;
> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
> index c1edd8857af0..d0efee09c593 100644
> --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
> +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
> @@ -1759,6 +1759,7 @@ void vlv_dsi_init(struct drm_i915_private *dev_priv)
>  	struct drm_connector *connector;
>  	struct drm_display_mode *current_mode, *fixed_mode;
>  	enum port port;
> +	enum pipe pipe;
>  
>  	DRM_DEBUG_KMS("\n");
>  
> @@ -1857,7 +1858,8 @@ void vlv_dsi_init(struct drm_i915_private *dev_priv)
>  
>  	vlv_dphy_param_init(intel_dsi);
>  
> -	intel_dsi_vbt_gpio_init(intel_dsi);
> +	intel_dsi_vbt_gpio_init(intel_dsi,
> +				intel_dsi_get_hw_state(intel_encoder, &pipe));

Feels a bit scary to call into the hooks before everything is
initialized, but this seems safe. Fingers crossed.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>  
>  	drm_connector_init(dev, connector, &intel_dsi_connector_funcs,
>  			   DRM_MODE_CONNECTOR_DSI);

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
