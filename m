Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7B7BAF80E
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 09:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8874010E6A4;
	Wed,  1 Oct 2025 07:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ckfrfQ8i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B320610E6AA
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 07:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759305242; x=1790841242;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+fqcsqXVumu144RbGaow8424+JXYn7J23/u6ccj13RY=;
 b=ckfrfQ8i+989Y46cO5Uu/x5Iv7J2weBTaKAZu/69iqQBdEFLjsUfne+k
 t7uDeAx5h3aXXTyDkWBEAn4MkOnsEZzw0w5trzjeUDIqNov89tlQQQJqh
 eSBIV85gX7V5jBZjiHGOJ1PQBWVHX0OghCtp2zryhZrB+AcLKuu7GGDiL
 bRLQV9ynVB5i9xODqTpoLbNpiREERC3juzZm9KsZ79UDUPnt/Se8pfNF6
 L/tV8H+V2YMuqhQCEuwJYRQfRAID+gSJaBE1hMaJMwBb2PYpjQYhs1tkN
 gSq7Nv/JblrohZC00iEfWxeY+9Ik6JitYx0zmi5dSThm2Zffid9iNAsWj w==;
X-CSE-ConnectionGUID: V0ukL1QZTQeFqkLC6haxkw==
X-CSE-MsgGUID: 9gjZ2HDNS4OLzOX6nXk7Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61464971"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="61464971"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 00:54:02 -0700
X-CSE-ConnectionGUID: xa0gG89tQcyHKg/gZCjklA==
X-CSE-MsgGUID: kenNaGzOSSO2op0BfxQkQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="178680787"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.217])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 00:53:58 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 matthew.auld@intel.com, himal.prasad.ghimiray@intel.com,
 matthew.brost@intel.com
Subject: Re: [PATCH] drm: Add drm_mode_display_size helper function
In-Reply-To: <20250930212654.146694-2-jonathan.cavitt@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250930212654.146694-2-jonathan.cavitt@intel.com>
Date: Wed, 01 Oct 2025 10:53:56 +0300
Message-ID: <f21e9a9eeec721cd52ee403a10690912c9efdff2@intel.com>
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

On Tue, 30 Sep 2025, Jonathan Cavitt <jonathan.cavitt@intel.com> wrote:
> Add a helper function that computes the product of hdisplay and
> vdisplay.
>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 2 +-
>  drivers/gpu/drm/drm_mipi_dbi.c        | 2 +-
>  include/drm/drm_modes.h               | 5 +++++
>  3 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 90760d0ca071..4ac71c34f4c6 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -967,7 +967,7 @@ drm_vram_helper_mode_valid_internal(struct drm_device *dev,
>  
>  	max_fbpages = (vmm->vram_size / 2) >> PAGE_SHIFT;
>  
> -	fbsize = mode->hdisplay * mode->vdisplay * max_bpp;
> +	fbsize = drm_mode_display_size(mode) * max_bpp;
>  	fbpages = DIV_ROUND_UP(fbsize, PAGE_SIZE);
>  
>  	if (fbpages > max_fbpages)
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index e33c78fc8fbd..54212bf85160 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -691,7 +691,7 @@ int mipi_dbi_dev_init(struct mipi_dbi_dev *dbidev,
>  		      const struct drm_simple_display_pipe_funcs *funcs,
>  		      const struct drm_display_mode *mode, unsigned int rotation)
>  {
> -	size_t bufsize = mode->vdisplay * mode->hdisplay * sizeof(u16);
> +	size_t bufsize = drm_mode_display_size(mode) * sizeof(u16);
>  
>  	dbidev->drm.mode_config.preferred_depth = 16;
>  
> diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
> index b9bb92e4b029..775c94c55cda 100644
> --- a/include/drm/drm_modes.h
> +++ b/include/drm/drm_modes.h
> @@ -572,4 +572,9 @@ struct drm_display_mode *
>  drm_mode_create_from_cmdline_mode(struct drm_device *dev,
>  				  struct drm_cmdline_mode *cmd);
>  
> +static inline u32 drm_mode_display_size(const struct drm_display_mode *mode)
> +{
> +	return mode->hdisplay * mode->vdisplay;
> +}

All functions here need kernel-doc.

I wonder if "size" is specific enough.


BR,
Jani.



> +
>  #endif /* __DRM_MODES_H__ */

-- 
Jani Nikula, Intel
