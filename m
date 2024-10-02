Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF6698D295
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 13:55:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B340E10E700;
	Wed,  2 Oct 2024 11:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mi6DfuF8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E08A10E209;
 Wed,  2 Oct 2024 11:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727870098; x=1759406098;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=RO8vC8TCS/iUL9rHuDguHrV6gLsXsNWqd9L6WJN9LfQ=;
 b=Mi6DfuF8ybevm5PmMKWfOi1tMaGTJyzqTTtE07dQttN1cmnL8UiKeypR
 l6fiGZ007HjwFlp4LcFT6d9w4sO3AfZHDDAvqzPA80hwvjdgju9so2h5X
 irZdpY9JhNPfQzreNnNUEHNfbG78uLWdpGcndfRrKOnCrYYDHDx69N1a3
 7u7Z/PqDjKpuXbAon9EpAys6e/ukFE4Yfyohh4admUtxR37Fb38crRoOG
 3vOe4XCYr0UL2+yV7DxfQDarthdzKO8yeR079Kfb2/vQn9E29+eORbryS
 AUIIAGZhwo3J3r03AOs8J2RkMyMkg9kusMWltLT2bp6+xcYun6mrPhd6L A==;
X-CSE-ConnectionGUID: /4Jn1YYjRs+Gm0ETbFsJtQ==
X-CSE-MsgGUID: Id0Jt1IMT76y62bPF7EvXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="26910756"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="26910756"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 04:54:57 -0700
X-CSE-ConnectionGUID: V42bzqWVQpOzL9fZ8VPhbA==
X-CSE-MsgGUID: w829c22VR2SIooILxlC4EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="77992893"
Received: from lbogdanm-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.49])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 04:54:52 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Thomas
 Zimmermann <tzimmermann@suse.de>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH 07/28] drm/i915: Use video aperture helpers
In-Reply-To: <20240930130921.689876-8-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240930130921.689876-1-tzimmermann@suse.de>
 <20240930130921.689876-8-tzimmermann@suse.de>
Date: Wed, 02 Oct 2024 14:54:49 +0300
Message-ID: <87a5fmu3cm.fsf@intel.com>
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

On Mon, 30 Sep 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> DRM's aperture functions have long been implemented as helpers
> under drivers/video/ for use with fbdev. Avoid the DRM wrappers by
> calling the video functions directly.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>

Acked-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/i915/i915_driver.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index b3eb35fa5ff8..365329ff8a07 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -27,6 +27,7 @@
>   *
>   */
>  
> +#include <linux/aperture.h>
>  #include <linux/acpi.h>
>  #include <linux/device.h>
>  #include <linux/module.h>
> @@ -39,7 +40,6 @@
>  #include <linux/vga_switcheroo.h>
>  #include <linux/vt.h>
>  
> -#include <drm/drm_aperture.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_ioctl.h>
>  #include <drm/drm_managed.h>
> @@ -485,7 +485,7 @@ static int i915_driver_hw_probe(struct drm_i915_private *dev_priv)
>  	if (ret)
>  		goto err_perf;
>  
> -	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, dev_priv->drm.driver);
> +	ret = aperture_remove_conflicting_pci_devices(pdev, dev_priv->drm.driver->name);
>  	if (ret)
>  		goto err_ggtt;

-- 
Jani Nikula, Intel
