Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 686CE782437
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 09:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FEA110E1F7;
	Mon, 21 Aug 2023 07:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2226D10E1F7;
 Mon, 21 Aug 2023 07:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692602012; x=1724138012;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=av4oCu9sjI/1tXAcnOs+Fnjxj3bZRnRW6Vu6VY0dHhA=;
 b=cu9WaeHEpPI9o50AtqKQzwjBVyxYUbrDxbU2Hk7phpoLfV/o7WnzdCMw
 vposX+lBt9lyLZEQmg8Alg/A2cg3KhHRH8N9HYz9Yl43aJY7SfFTV5qCF
 /3O73q4Hd5j6jnO7TAJKmqm9KqSO8dp4zc859zym6iOngBz5AW/FtgmUE
 A5dbDWilycjLMNAL6WLEgrevjXUY3RMeXs94GAuaP0TqfLZ0CXr7h7Zwj
 uRbgvBEZUfnOwGMt9z7jnRdsIS4sIkXhyfGIZc1j65onOabnMNTaDnuo5
 aWEUAMmqi+7TfjHkNAYHXwMhblQ0Dbnsypc1KlS2diXJMU1SjZnBovULA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="437437552"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; d="scan'208";a="437437552"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 00:13:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="738801231"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; d="scan'208";a="738801231"
Received: from hpabst-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.190])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 00:13:17 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: ZNdOoHvIg7HXh7Gg@fedora, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915: Fix Kconfig error for
 CONFIG_DRM_I915
In-Reply-To: <ZOII3e9nsnmRjTN+@fedora>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <ZOII3e9nsnmRjTN+@fedora>
Date: Mon, 21 Aug 2023 10:13:15 +0300
Message-ID: <87wmxo7tro.fsf@intel.com>
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
Cc: stone.xulei@xfusion.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 20 Aug 2023, Wang Jinchao <wangjinchao@xfusion.com> wrote:
> When CONFIG_DRM_I915 is set to 'y' and CONFIG_BACKLIGHT_CLASS_DEVICE
> is set to 'm', we encountered an ld.lld error during the build process:
>
> 	ld.lld: error: undefined symbol: backlight_device_get_by_name
> 	>>> referenced by intel_backlight.c:955
> 	>>>               vmlinux.o:(intel_backlight_device_register)
>
> 	ld.lld: error: undefined symbol: backlight_device_register
> 	>>> referenced by intel_backlight.c:971
> 	>>>               vmlinux.o:(intel_backlight_device_register)
>
> 	ld.lld: error: undefined symbol: backlight_device_unregister
> 	>>> referenced by intel_backlight.c:999
> 	>>>               vmlinux.o:(intel_backlight_device_unregister)
>
> This issue occurred because intel_backlight_device_register and
> intel_backlight_device_unregister were enclosed within
> \#if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE) and #endif directives.
> However, according to Kconfig, CONFIG_DRM_I915 will select
> BACKLIGHT_CLASS_DEVICE only if ACPI is enabled.
> This led to an error when ACPI is not enabled.
> Change IS_ENABLED to IS_REACHABLE and use IS_REACHABLE to encompass
> the implementation of intel_connector_register() to solve this issue.

I told you in [1] what the real fix is.

The IS_REACHABLE() solution has been suggested a number of times, but I
think it's creating an unexpected and silent failure configuration. I
think IS_REACHABLE() is the wrong thing to do in most cases.

BR,
Jani.


[1] https://lore.kernel.org/r/87o7jaythm.fsf@intel.com


>
> Signed-off-by: Wang Jinchao <wangjinchao@xfusion.com>
> ---
>  drivers/gpu/drm/i915/display/intel_backlight.c | 2 +-
>  drivers/gpu/drm/i915/display/intel_backlight.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_backlight.c b/drivers/gpu/drm/i915/display/intel_backlight.c
> index 2e8f17c04522..d812cdc74a84 100644
> --- a/drivers/gpu/drm/i915/display/intel_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_backlight.c
> @@ -795,7 +795,7 @@ void intel_backlight_enable(const struct intel_crtc_state *crtc_state,
>  	mutex_unlock(&i915->display.backlight.lock);
>  }
>  
> -#if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
> +#if IS_REACHABLE(CONFIG_BACKLIGHT_CLASS_DEVICE)
>  static u32 intel_panel_get_backlight(struct intel_connector *connector)
>  {
>  	struct drm_i915_private *i915 = to_i915(connector->base.dev);
> diff --git a/drivers/gpu/drm/i915/display/intel_backlight.h b/drivers/gpu/drm/i915/display/intel_backlight.h
> index 339643f63897..207fe1c613d8 100644
> --- a/drivers/gpu/drm/i915/display/intel_backlight.h
> +++ b/drivers/gpu/drm/i915/display/intel_backlight.h
> @@ -36,7 +36,7 @@ u32 intel_backlight_invert_pwm_level(struct intel_connector *connector, u32 leve
>  u32 intel_backlight_level_to_pwm(struct intel_connector *connector, u32 level);
>  u32 intel_backlight_level_from_pwm(struct intel_connector *connector, u32 val);
>  
> -#if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
> +#if IS_REACHABLE(CONFIG_BACKLIGHT_CLASS_DEVICE)
>  int intel_backlight_device_register(struct intel_connector *connector);
>  void intel_backlight_device_unregister(struct intel_connector *connector);
>  #else /* CONFIG_BACKLIGHT_CLASS_DEVICE */

-- 
Jani Nikula, Intel Open Source Graphics Center
