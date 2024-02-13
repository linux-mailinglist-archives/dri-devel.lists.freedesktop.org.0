Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4C88533BD
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 15:55:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B46810E756;
	Tue, 13 Feb 2024 14:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B8m62KN2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF7E10E756;
 Tue, 13 Feb 2024 14:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707836148; x=1739372148;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=q304uAOx53FlEDf4SDhx/Xc+la95RUjvdxKUGemT/0Y=;
 b=B8m62KN21AIP2QDsJOzoOkKtUrIph7DHN3y86b4ecW02Uc8fFpe1tiF7
 hB+jYqiVW6lClEnj2GzkiPOF7C++7cGsGGDsLbJvF6VP5Xq26UEbK4Oyu
 ZOUHC9mmMuZRbqyDzXAKdCJSVOKh2Zpg3usjRhmq/rOh0R+ds2JsuWGfI
 fXhG2LmuUJ6IQKKJ8VFvBA1V6Pbx3TVZI77cNcikGPRXE+4yU8mRj5jcW
 1UlsfLOPwvVyWW7XlQTGniFmneQ6leNkRFcrixm5EOg2OFTA9FR0CRpsT
 y9z+M9L88zwYseZDAm/dFpYDpA/s4FNFyhWZBZT63qGYF77WL3k+bJdEX A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1983528"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="1983528"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 06:55:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="7544964"
Received: from snasibli-mobl2.ccr.corp.intel.com (HELO localhost)
 ([10.252.44.50])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 06:55:42 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Riana Tauro <riana.tauro@intel.com>, Daniele
 Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/xe: skip building debugfs code for CONFIG_DEBUG_FS=n
In-Reply-To: <20240213134817.3347574-1-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240213134817.3347574-1-arnd@kernel.org>
Date: Tue, 13 Feb 2024 16:55:39 +0200
Message-ID: <877cj88lck.fsf@intel.com>
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

On Tue, 13 Feb 2024, Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Some of the debugfs functions are stubbed out in these configurations,
> so trying to build the .c file with the definition fails:
>
> In file included from include/uapi/linux/posix_types.h:5,
>                  from drivers/gpu/drm/i915/display/intel_pipe_crc.c:27:
> drivers/gpu/drm/i915/display/intel_pipe_crc.c: At top level:
> include/linux/stddef.h:8:16: error: expected identifier or '(' before 'void'
>     8 | #define NULL ((void *)0)
>       |                ^~~~
> drivers/gpu/drm/i915/display/intel_pipe_crc.c:549:20: note: in expansion of macro 'intel_crtc_get_crc_sources'
>   549 | const char *const *intel_crtc_get_crc_sources(struct drm_crtc *crtc,
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Stop trying to build them by making the Makefile entries conditional,
> same as for the i915 driver.

Already fixed by commit 439987f6f471 ("drm/xe: don't build debugfs files
when CONFIG_DEBUG_FS=n") in drm-xe-next.

Maybe that needs to be picked up for -fixes?

BR,
Jani.

>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/xe/Makefile | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index efcf0ab7a1a6..7c10ffdb7809 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -213,8 +213,6 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>  	i915-display/intel_ddi.o \
>  	i915-display/intel_ddi_buf_trans.o \
>  	i915-display/intel_display.o \
> -	i915-display/intel_display_debugfs.o \
> -	i915-display/intel_display_debugfs_params.o \
>  	i915-display/intel_display_device.o \
>  	i915-display/intel_display_driver.o \
>  	i915-display/intel_display_irq.o \
> @@ -258,7 +256,6 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>  	i915-display/intel_modeset_setup.o \
>  	i915-display/intel_modeset_verify.o \
>  	i915-display/intel_panel.o \
> -	i915-display/intel_pipe_crc.o \
>  	i915-display/intel_pmdemand.o \
>  	i915-display/intel_pps.o \
>  	i915-display/intel_psr.o \
> @@ -275,6 +272,13 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>  	i915-display/skl_universal_plane.o \
>  	i915-display/skl_watermark.o
>  
> +ifdef CONFIG_DEBUG_FS
> +xe-$(CONFIG_DRM_XE_DISPLAY) += \
> +	i915-display/intel_display_debugfs.o \
> +	i915-display/intel_display_debugfs_params.o \
> +	i915-display/intel_pipe_crc.o
> +endif
> +
>  ifeq ($(CONFIG_ACPI),y)
>  	xe-$(CONFIG_DRM_XE_DISPLAY) += \
>  		i915-display/intel_acpi.o \

-- 
Jani Nikula, Intel
