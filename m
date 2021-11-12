Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C15C644E81C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 15:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2427F6EC49;
	Fri, 12 Nov 2021 14:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30B26EC49
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 14:05:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="230596610"
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; d="scan'208";a="230596610"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 06:05:56 -0800
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; d="scan'208";a="504900797"
Received: from sbacanu-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.217.145])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 06:05:53 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/6] drm: Decouple nomodeset from CONFIG_VGA_CONSOLE
In-Reply-To: <20211112133230.1595307-5-javierm@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211112133230.1595307-1-javierm@redhat.com>
 <20211112133230.1595307-5-javierm@redhat.com>
Date: Fri, 12 Nov 2021 16:05:50 +0200
Message-ID: <87zgq931vl.fsf@intel.com>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 12 Nov 2021, Javier Martinez Canillas <javierm@redhat.com> wrote:
> This relationship was only for historical reasons and the nomodeset option
> should be available even on platforms that don't enable CONFIG_VGA_CONSOLE.
>
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> ---
>
> (no changes since v1)
>
>  drivers/gpu/drm/Kconfig  | 6 ++++++
>  drivers/gpu/drm/Makefile | 2 +-
>  include/drm/drm_drv.h    | 4 ----
>  3 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git drivers/gpu/drm/Kconfig drivers/gpu/drm/Kconfig
> index fb144617055b..483d534eb074 100644
> --- drivers/gpu/drm/Kconfig
> +++ drivers/gpu/drm/Kconfig
> @@ -8,6 +8,7 @@
>  menuconfig DRM
>  	tristate "Direct Rendering Manager (XFree86 4.1.0 and higher DRI support)"
>  	depends on (AGP || AGP=n) && !EMULATED_CMPXCHG && HAS_DMA
> +	select DRM_NOMODESET
>  	select DRM_PANEL_ORIENTATION_QUIRKS
>  	select HDMI
>  	select FB_CMDLINE
> @@ -493,6 +494,11 @@ config DRM_EXPORT_FOR_TESTS
>  config DRM_PANEL_ORIENTATION_QUIRKS
>  	tristate
>  
> +# Separate option because nomodeset parameter is global and expected built-in
> +config DRM_NOMODESET
> +	bool
> +	default n
> +
>  config DRM_LIB_RANDOM
>  	bool
>  	default n
> diff --git drivers/gpu/drm/Makefile drivers/gpu/drm/Makefile
> index c74810c285af..fa16d3e0bbdc 100644
> --- drivers/gpu/drm/Makefile
> +++ drivers/gpu/drm/Makefile
> @@ -33,7 +33,7 @@ drm-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen.o drm_privacy_screen_x86.
>  
>  obj-$(CONFIG_DRM_DP_AUX_BUS) += drm_dp_aux_bus.o
>  
> -obj-$(CONFIG_VGA_CONSOLE) += drm_nomodeset.o
> +obj-$(CONFIG_DRM_NOMODESET) += drm_nomodeset.o
>  
>  drm_cma_helper-y := drm_gem_cma_helper.o
>  obj-$(CONFIG_DRM_GEM_CMA_HELPER) += drm_cma_helper.o
> diff --git include/drm/drm_drv.h include/drm/drm_drv.h
> index 89e26a732175..da0c836fe8e1 100644
> --- include/drm/drm_drv.h
> +++ include/drm/drm_drv.h
> @@ -601,10 +601,6 @@ static inline bool drm_drv_uses_atomic_modeset(struct drm_device *dev)
>  
>  int drm_dev_set_unique(struct drm_device *dev, const char *name);
>  
> -#ifdef CONFIG_VGA_CONSOLE
>  extern bool drm_firmware_drivers_only(void);

I'm not bikeshedding this series anymore, but please follow up with a
patch removing the extern keyword. It's useless.

BR,
Jani.


> -#else
> -static inline bool drm_firmware_drivers_only(void) { return false; }
> -#endif
>  
>  #endif

-- 
Jani Nikula, Intel Open Source Graphics Center
