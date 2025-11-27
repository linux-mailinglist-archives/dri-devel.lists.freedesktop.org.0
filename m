Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E67C8E3CA
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 13:23:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CCAF10E040;
	Thu, 27 Nov 2025 12:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SGA8J0aY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CF610E698
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 12:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764246205; x=1795782205;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=SgrqE/lksvcXyQ4h0VxOiyfuc1N3ILpvkWKXV5myEvo=;
 b=SGA8J0aYHKuDTQJRRLzA7sGc+uZrozQ5aeZQzNL3vqHpwITRBZjvaqp7
 gXZjROv8cU6kjM3/2bim3rZKMobtVldpX2+1x/v8j2lI0ZEKB0zP5MG5K
 j4S9Kv/Y8oqiNBbSMUkEjH8kWjHR1JFKfjl7lIjWsmABOoNw227fz0acI
 dn7cBgb4CdQ8TPYYo/0Tfm3vvEtkFQop/crdVQyQtgVaP4T/lvl0EYeEb
 20JJ6ll9C74WzZUzM138BzAbVkzbGxXvasWeXNfDpoWb9zdV7Ttuj9Wg+
 PDQp7BZUUYkECOnJ7bhx1UmbLyHwODZhlYbrvSGdV4XUUOTQI/1XxMm1R A==;
X-CSE-ConnectionGUID: shZqjKPtSE+1axwKeYMiWA==
X-CSE-MsgGUID: BmydehlHQVadzLGNrOprSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77395314"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="77395314"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 04:23:25 -0800
X-CSE-ConnectionGUID: wAxvX7otSbuq2mt7gsmwGg==
X-CSE-MsgGUID: O1FISIMcR2eTtsgE21vy6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="193023023"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.43])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 04:23:22 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, Javier Martinez Canillas
 <javierm@redhat.com>
Subject: Re: [PATCH] drm/panic: Report invalid or unsupported panic modes
In-Reply-To: <20251127090349.92717-1-tvrtko.ursulin@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251127090349.92717-1-tvrtko.ursulin@igalia.com>
Date: Thu, 27 Nov 2025 14:23:20 +0200
Message-ID: <baca752c83558cac83be9008e1da072588f6997d@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 27 Nov 2025, Tvrtko Ursulin <tvrtko.ursulin@igalia.com> wrote:
> Currently the user can write anything into the drm.panic_screen modparam,
> either at runtime via sysfs, or as a kernel boot time argument. Invalid
> strings will be silently accepted and ignored at use time by defaulting to
> the 'user' panic mode.
>
> Let instead add some validation in order to have immediate feedback when
> something has been mistyped, or not compiled in.
>
> For example during kernel boot:
>
>  Booting kernel: `bsod' invalid for parameter `drm.panic_screen'
>
> Or at runtime:
>
>  # echo -n bsod > /sys/module/drm/parameters/panic_screen
>  -bash: echo: write error: Invalid argument
>
> Change of behavior is that when invalid mode is attempted to be
> configured, currently the code will default to the 'user' mode, while with
> this change the code will ignore it, and default to the mode set at kernel
> build time via CONFIG_DRM_PANIC_SCREEN.
>
> While at it lets also fix the module parameter description to include all
> compiled in modes.

I've tried to add a convenient way to use enum module parameters on two
occasions [1][2] but it went nowhere. Maybe I should've pushed harder.

In a perfect world we'd use device specific parameters, here too, but in
the imperfect world we still use module parameters. And use cases like
this would be a soooo nice with that.

Want to take over and fight the fight? ;)


BR,
Jani.


[1] https://lore.kernel.org/r/20190611141701.7432-1-jani.nikula@intel.com
[2] https://lore.kernel.org/r/20220414123033.654198-1-jani.nikula@intel.com


>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/gpu/drm/drm_panic.c | 77 ++++++++++++++++++++++++++++++-------
>  1 file changed, 63 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index d4b6ea42db0f..f42be7f1d8c2 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -39,12 +39,6 @@ MODULE_AUTHOR("Jocelyn Falempe");
>  MODULE_DESCRIPTION("DRM panic handler");
>  MODULE_LICENSE("GPL");
>  
> -static char drm_panic_screen[16] = CONFIG_DRM_PANIC_SCREEN;
> -module_param_string(panic_screen, drm_panic_screen, sizeof(drm_panic_screen), 0644);
> -MODULE_PARM_DESC(panic_screen,
> -		 "Choose what will be displayed by drm_panic, 'user' or 'kmsg' [default="
> -		 CONFIG_DRM_PANIC_SCREEN "]");
> -
>  /**
>   * DOC: overview
>   *
> @@ -813,15 +807,60 @@ static void draw_panic_static_qr_code(struct drm_scanout_buffer *sb)
>  		draw_panic_static_user(sb);
>  }
>  #else
> -static void draw_panic_static_qr_code(struct drm_scanout_buffer *sb)
> -{
> -	draw_panic_static_user(sb);
> -}
> -
>  static void drm_panic_qr_init(void) {};
>  static void drm_panic_qr_exit(void) {};
>  #endif
>  
> +enum drm_panic_type {
> +	DRM_PANIC_TYPE_KMSG,
> +	DRM_PANIC_TYPE_USER,
> +	DRM_PANIC_TYPE_QR,
> +};
> +
> +static enum drm_panic_type drm_panic_type = -1;
> +
> +static const char *drm_panic_type_map[] = {
> +	[DRM_PANIC_TYPE_KMSG] = "kmsg",
> +	[DRM_PANIC_TYPE_USER] = "user",
> +#if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> +	[DRM_PANIC_TYPE_QR] = "qr",
> +#endif
> +};
> +
> +static int drm_panic_type_set(const char *val, const struct kernel_param *kp)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(drm_panic_type_map); i++) {
> +		if (!strcmp(val, drm_panic_type_map[i])) {
> +			drm_panic_type = i;
> +			return 0;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int drm_panic_type_get(char *buffer, const struct kernel_param *kp)
> +{
> +	return scnprintf(buffer, PAGE_SIZE, "%s\n",
> +			 drm_panic_type_map[drm_panic_type]);
> +}
> +
> +static const struct kernel_param_ops drm_panic_ops = {
> +	.set = drm_panic_type_set,
> +	.get = drm_panic_type_get,
> +};
> +
> +module_param_cb(panic_screen, &drm_panic_ops, NULL, 0644);
> +MODULE_PARM_DESC(panic_screen,
> +#if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> +		 "Choose what will be displayed by drm_panic, 'user', 'kmsg' or 'qr' [default="
> +#else
> +		 "Choose what will be displayed by drm_panic, 'user' or 'kmsg' [default="
> +#endif
> +		 CONFIG_DRM_PANIC_SCREEN "]");
> +
>  /*
>   * drm_panic_is_format_supported()
>   * @format: a fourcc color code
> @@ -838,11 +877,19 @@ static bool drm_panic_is_format_supported(const struct drm_format_info *format)
>  
>  static void draw_panic_dispatch(struct drm_scanout_buffer *sb)
>  {
> -	if (!strcmp(drm_panic_screen, "kmsg")) {
> +	switch (drm_panic_type) {
> +	case DRM_PANIC_TYPE_KMSG:
>  		draw_panic_static_kmsg(sb);
> -	} else if (!strcmp(drm_panic_screen, "qr_code")) {
> +		break;
> +
> +#if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> +	case DRM_PANIC_TYPE_QR:
>  		draw_panic_static_qr_code(sb);
> -	} else {
> +		break;
> +#endif
> +
> +	case DRM_PANIC_TYPE_USER:
> +	default:
>  		draw_panic_static_user(sb);
>  	}
>  }
> @@ -1025,6 +1072,8 @@ void drm_panic_unregister(struct drm_device *dev)
>   */
>  void __init drm_panic_init(void)
>  {
> +	if (drm_panic_type == -1)
> +		drm_panic_type_set(CONFIG_DRM_PANIC_SCREEN, NULL);
>  	drm_panic_qr_init();
>  }

-- 
Jani Nikula, Intel
