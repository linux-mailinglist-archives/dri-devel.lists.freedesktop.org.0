Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E17134645
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 16:32:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8C86E8AF;
	Wed,  8 Jan 2020 15:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD976E8AE;
 Wed,  8 Jan 2020 15:32:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2020 07:32:35 -0800
X-IronPort-AV: E=Sophos;i="5.69,410,1571727600"; d="scan'208";a="215983554"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2020 07:32:29 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] i915: fix backlight configuration issue
In-Reply-To: <20200108140227.3976563-1-arnd@arndb.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200108140227.3976563-1-arnd@arndb.de>
Date: Wed, 08 Jan 2020 17:32:26 +0200
Message-ID: <87o8veotf9.fsf@intel.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Alexander Shiyan <shc_work@mail.ru>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 08 Jan 2020, Arnd Bergmann <arnd@arndb.de> wrote:
> The i915 driver can use the backlight subsystem as an option, and usually
> selects it when CONFIG_ACPI is set. However it is possible to configure
> a kernel with modular backlight classdev support and a built-in i915
> driver, which leads to a linker error:
>
> drivers/gpu/drm/i915/display/intel_panel.o: In function `intel_backlight_device_register':
> intel_panel.c:(.text+0x2f58): undefined reference to `backlight_device_register'
> drivers/gpu/drm/i915/display/intel_panel.o: In function `intel_backlight_device_unregister':
> intel_panel.c:(.text+0x2fe4): undefined reference to `backlight_device_unregister'
>
> Add another Kconfig option to ensure the driver only tries to use
> the backlight support when it can in fact be linked that way. The
> new option is on by default to keep the existing behavior.
>
> This is roughly what other drivers like nouveau do as well.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I've had this one lying around for a long time, it is still needed
> but I am not sure which solution is best here. This version is
> probably the least invasive, but it does not solve the bigger
> problem around too many 'select' statements in drm

This is just another hack that's only required because backlight is
selected instead of depended on throughout the kernel. (*)

i915 (and most drm drivers, with some variations) could easily handle
this with:

	depends on (ACPI && ACPI_VIDEO) || ACPI=n
	depends on BACKLIGHT_CLASS_DEVICE || BACKLIGHT_CLASS_DEVICE=n

Those two lines express the allowed configurations. It's just that we
can't do that in i915 *alone*. The combinations of depends and selects
lead to impossible configurations. It's all or nothing.

I am not amused by adding more hacks, and I am really *not* interested
in adding another useless i915 config option to "solve" this issue.

So thanks, but no thanks. I'm not taking this patch.


BR,
Jani.


(*) The deeper issue is that people as well as the kconfig tools ignore
the warnings in Documentation/kbuild/kconfig-language.rst:

	select should be used with care. select will force
	a symbol to a value without visiting the dependencies.
	By abusing select you are able to select a symbol FOO even
	if FOO depends on BAR that is not set.
	In general use select only for non-visible symbols
	(no prompts anywhere) and for symbols with no dependencies.
	That will limit the usefulness but on the other hand avoid
	the illegal configurations all over.

I don't think we can, uh, fix the people, but it might be possible to
warn about selecting visible symbols or symbols with dependencies.

> ---
>  drivers/gpu/drm/i915/Kconfig               | 11 ++++++++++-
>  drivers/gpu/drm/i915/display/intel_panel.c |  4 ++--
>  drivers/gpu/drm/i915/display/intel_panel.h |  6 +++---
>  3 files changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index ba9595960bbe..81d956040d18 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -16,7 +16,7 @@ config DRM_I915
>  	select IRQ_WORK
>  	# i915 depends on ACPI_VIDEO when ACPI is enabled
>  	# but for select to work, need to select ACPI_VIDEO's dependencies, ick
> -	select BACKLIGHT_CLASS_DEVICE if ACPI
> +	select DRM_I915_BACKLIGHT if ACPI
>  	select INPUT if ACPI
>  	select ACPI_VIDEO if ACPI
>  	select ACPI_BUTTON if ACPI
> @@ -68,6 +68,15 @@ config DRM_I915_FORCE_PROBE
>  
>  	  Use "*" to force probe the driver for all known devices.
>  
> +config DRM_I915_BACKLIGHT
> +	tristate "Control backlight support"
> +	depends on DRM_I915
> +	default DRM_I915
> +	select BACKLIGHT_CLASS_DEVICE
> +	help
> +          Say Y here if you want to control the backlight of your display
> +          (e.g. a laptop panel).
> +
>  config DRM_I915_CAPTURE_ERROR
>  	bool "Enable capturing GPU state following a hang"
>  	depends on DRM_I915
> diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
> index 7b3ec6eb3382..e2fe7a50dcbf 100644
> --- a/drivers/gpu/drm/i915/display/intel_panel.c
> +++ b/drivers/gpu/drm/i915/display/intel_panel.c
> @@ -1203,7 +1203,7 @@ void intel_panel_enable_backlight(const struct intel_crtc_state *crtc_state,
>  	mutex_unlock(&dev_priv->backlight_lock);
>  }
>  
> -#if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
> +#if IS_ENABLED(CONFIG_DRM_I915_BACKLIGHT)
>  static u32 intel_panel_get_backlight(struct intel_connector *connector)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
> @@ -1370,7 +1370,7 @@ void intel_backlight_device_unregister(struct intel_connector *connector)
>  		panel->backlight.device = NULL;
>  	}
>  }
> -#endif /* CONFIG_BACKLIGHT_CLASS_DEVICE */
> +#endif /* CONFIG_DRM_I915_BACKLIGHT */
>  
>  /*
>   * CNP: PWM clock frequency is 19.2 MHz or 24 MHz.
> diff --git a/drivers/gpu/drm/i915/display/intel_panel.h b/drivers/gpu/drm/i915/display/intel_panel.h
> index cedeea443336..e6e81268b7ed 100644
> --- a/drivers/gpu/drm/i915/display/intel_panel.h
> +++ b/drivers/gpu/drm/i915/display/intel_panel.h
> @@ -49,10 +49,10 @@ intel_panel_edid_fixed_mode(struct intel_connector *connector);
>  struct drm_display_mode *
>  intel_panel_vbt_fixed_mode(struct intel_connector *connector);
>  
> -#if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
> +#if IS_ENABLED(CONFIG_DRM_I915_BACKLIGHT)
>  int intel_backlight_device_register(struct intel_connector *connector);
>  void intel_backlight_device_unregister(struct intel_connector *connector);
> -#else /* CONFIG_BACKLIGHT_CLASS_DEVICE */
> +#else /* CONFIG_DRM_I915_BACKLIGHT */
>  static inline int intel_backlight_device_register(struct intel_connector *connector)
>  {
>  	return 0;
> @@ -60,6 +60,6 @@ static inline int intel_backlight_device_register(struct intel_connector *connec
>  static inline void intel_backlight_device_unregister(struct intel_connector *connector)
>  {
>  }
> -#endif /* CONFIG_BACKLIGHT_CLASS_DEVICE */
> +#endif /* CONFIG_DRM_I915_BACKLIGHT */
>  
>  #endif /* __INTEL_PANEL_H__ */

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
