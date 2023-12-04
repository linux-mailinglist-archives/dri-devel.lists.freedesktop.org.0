Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCDE802EF4
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 10:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B9C510E314;
	Mon,  4 Dec 2023 09:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3371F10E2E7;
 Mon,  4 Dec 2023 09:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701682939; x=1733218939;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7SK1zfK4UqJjdJhKiWkmwSqNVp1yeuolxUrDpBE6fOM=;
 b=VGaPBMSIydllMK12ItTQP/Rpqyst3yIVKe+kHpW1WUjbkz2NAvhUfqXV
 u3rLpiG8gQOagHy6EtUwR/H5C3YcR4dv6l6HQTLi4zl7GFFCPTDEKmhSQ
 VGvL9eYPmQyEPshn1AWv1QAAjoyjOrte60SW6mfGoBoKGAwmjItGPNxRz
 GjuMW9cpAC4uK0xLb8Ihh9LSqRZX4b9Kni7+stt3Omc0OE3qZa+CGHF03
 g8PzMZlw5NJgSJ7Mf/OlaJ4xcqqwbC/W6wyl9Kc3fD/oaCxz4kG5oUFDR
 AHKb9slnfEX4aFr7vva6dkYcYbUJYzXUZXG5I+Syk1Zq9Vy5fzAECUaeP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="6996729"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="6996729"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 01:42:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="861319095"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="861319095"
Received: from shahmoha-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.45.180])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 01:42:15 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Ville =?utf-8?B?U3lyasOk?=
 =?utf-8?B?bMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/i915/dsi: Use devm_gpiod_get() for all GPIOs
In-Reply-To: <20231201161130.23976-1-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231201161130.23976-1-hdegoede@redhat.com>
Date: Mon, 04 Dec 2023 11:42:13 +0200
Message-ID: <87zfyq2tje.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 01 Dec 2023, Hans de Goede <hdegoede@redhat.com> wrote:
> soc_gpio_set_value() already uses devm_gpiod_get(), lets be consistent
> and use devm_gpiod_get() for all GPIOs.
>
> This allows removing the intel_dsi_vbt_gpio_cleanup() function,
> which only function was to put the GPIO-descriptors.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Jani Nikula <jani.nikula@intel.com>


> ---
> Note this applies on top of Andy's recent GPIO rework series which
> has just landed in drm-intel-next
> ---
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 17 ++---------------
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.h |  1 -
>  drivers/gpu/drm/i915/display/vlv_dsi.c       | 10 +---------
>  3 files changed, 3 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> index 275d0218394c..a5d7fc8418c9 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> @@ -922,7 +922,7 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
>  		gpiod_add_lookup_table(gpiod_lookup_table);
>  
>  	if (want_panel_gpio) {
> -		intel_dsi->gpio_panel = gpiod_get(dev->dev, "panel", flags);
> +		intel_dsi->gpio_panel = devm_gpiod_get(dev->dev, "panel", flags);
>  		if (IS_ERR(intel_dsi->gpio_panel)) {
>  			drm_err(&dev_priv->drm,
>  				"Failed to own gpio for panel control\n");
> @@ -932,7 +932,7 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
>  
>  	if (want_backlight_gpio) {
>  		intel_dsi->gpio_backlight =
> -			gpiod_get(dev->dev, "backlight", flags);
> +			devm_gpiod_get(dev->dev, "backlight", flags);
>  		if (IS_ERR(intel_dsi->gpio_backlight)) {
>  			drm_err(&dev_priv->drm,
>  				"Failed to own gpio for backlight control\n");
> @@ -943,16 +943,3 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
>  	if (gpiod_lookup_table)
>  		gpiod_remove_lookup_table(gpiod_lookup_table);
>  }
> -
> -void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi)
> -{
> -	if (intel_dsi->gpio_panel) {
> -		gpiod_put(intel_dsi->gpio_panel);
> -		intel_dsi->gpio_panel = NULL;
> -	}
> -
> -	if (intel_dsi->gpio_backlight) {
> -		gpiod_put(intel_dsi->gpio_backlight);
> -		intel_dsi->gpio_backlight = NULL;
> -	}
> -}
> diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.h b/drivers/gpu/drm/i915/display/intel_dsi_vbt.h
> index 468d873fab1a..3462fcc760e6 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.h
> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.h
> @@ -13,7 +13,6 @@ struct intel_dsi;
>  
>  bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id);
>  void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on);
> -void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi);
>  void intel_dsi_vbt_exec_sequence(struct intel_dsi *intel_dsi,
>  				 enum mipi_seq seq_id);
>  void intel_dsi_log_params(struct intel_dsi *intel_dsi);
> diff --git a/drivers/gpu/drm/i915/display/vlv_dsi.c b/drivers/gpu/drm/i915/display/vlv_dsi.c
> index 5bda97c96810..9b33b8a74d64 100644
> --- a/drivers/gpu/drm/i915/display/vlv_dsi.c
> +++ b/drivers/gpu/drm/i915/display/vlv_dsi.c
> @@ -1532,16 +1532,8 @@ static void intel_dsi_unprepare(struct intel_encoder *encoder)
>  	}
>  }
>  
> -static void intel_dsi_encoder_destroy(struct drm_encoder *encoder)
> -{
> -	struct intel_dsi *intel_dsi = enc_to_intel_dsi(to_intel_encoder(encoder));
> -
> -	intel_dsi_vbt_gpio_cleanup(intel_dsi);
> -	intel_encoder_destroy(encoder);
> -}
> -
>  static const struct drm_encoder_funcs intel_dsi_funcs = {
> -	.destroy = intel_dsi_encoder_destroy,
> +	.destroy = intel_encoder_destroy,
>  };
>  
>  static enum drm_mode_status vlv_dsi_mode_valid(struct drm_connector *connector,

-- 
Jani Nikula, Intel
