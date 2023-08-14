Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F2F77B261
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 09:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3666D10E129;
	Mon, 14 Aug 2023 07:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999A210E077;
 Mon, 14 Aug 2023 07:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691998010; x=1723534010;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=5mB685TMqnywZWJpaoTuMK9CKZJvbZb4EVjI2N4hKMg=;
 b=JzEyz48HAoSqV3VvzT7wQw3RFMZZy5uGLC2vQCDJrowkmbxIPHsfSrZ+
 p5clZ/wmKp3HYYAqHhtsK2Q7Mg7Zss81WVfT6Tb22ParLTSW6utflXEtI
 f24Xb/jeUEjLQVdjb+Xph8qys7ljpB/PLuX4OHj1g54ezcaJuGsdQTLR/
 u28bWO7BHvpg7XGRuZoq1YEkmswJblIQ5E6r0rAHfbyqhAhR7+7JK3yqg
 PN92IYENI1aZDbUTUcGghSLEbwGFr7wBa040FS80G5BMioBqunmZE3z0b
 jojyBgH10HW2RKtS43EirJUfKy/ss/eEPCSWeqWgqmLtnvsM/qiN2OVcM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="356945410"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; d="scan'208";a="356945410"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 00:26:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="856986999"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; d="scan'208";a="856986999"
Received: from pameiner-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.252.51.125])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 00:26:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Wang Jinchao <wangjinchao@xfusion.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915: Fix Kconfig error for CONFIG_DRM_I915
In-Reply-To: <ZNdOoHvIg7HXh7Gg@fedora>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <ZNdOoHvIg7HXh7Gg@fedora>
Date: Mon, 14 Aug 2023 10:26:45 +0300
Message-ID: <87o7jaythm.fsf@intel.com>
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

On Sat, 12 Aug 2023, Wang Jinchao <wangjinchao@xfusion.com> wrote:
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
> However, according to Kconfig, CONFIG_DRM_I915 will select
> BACKLIGHT_CLASS_DEVICE only if ACPI is enabled.
> This led to an error, which can be resolved by removing the
> conditional statements related to ACPI.

The real fix is to use

	depends on BACKLIGHT_CLASS_DEVICE || BACKLIGHT_CLASS_DEVICE=n

but in order to do that, you need to change a lot of places to depend
on, not select BACKLIGHT_CLASS_DEVICE, because otherwise you end up with
other dependency issues.

BR,
Jani.

>
> Signed-off-by: Wang Jinchao <wangjinchao@xfusion.com>
> ---
>  drivers/gpu/drm/i915/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> index 01b5a8272a27..5003de921bf7 100644
> --- a/drivers/gpu/drm/i915/Kconfig
> +++ b/drivers/gpu/drm/i915/Kconfig
> @@ -24,7 +24,7 @@ config DRM_I915
>  	select IRQ_WORK
>  	# i915 depends on ACPI_VIDEO when ACPI is enabled
>  	# but for select to work, need to select ACPI_VIDEO's dependencies, ick
> -	select BACKLIGHT_CLASS_DEVICE if ACPI
> +	select BACKLIGHT_CLASS_DEVICE
>  	select INPUT if ACPI
>  	select X86_PLATFORM_DEVICES if ACPI
>  	select ACPI_WMI if ACPI

-- 
Jani Nikula, Intel Open Source Graphics Center
