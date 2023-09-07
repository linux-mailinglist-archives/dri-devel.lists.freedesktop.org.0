Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A42579714A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 11:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C0A10E223;
	Thu,  7 Sep 2023 09:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FAF810E223;
 Thu,  7 Sep 2023 09:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694079369; x=1725615369;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=FSQ7vuGo6AwUt3MAO0J06RwhL1Zs4K+W4r9Ms0Ij0ts=;
 b=TZhPV74dE4tPU1Gx+yF4FOMmWj49o6Mj8NXP25Oyb/02Lh9zME35Vz+b
 ksHy9kUHKidXgkqeXErpgveBrWzdntedpapR/pcPezkZLeQcFIs+pLTw0
 Ss+gydvppNXbmqjdSGMVVsnfPS4cNDkm49vOV2J4Bp+R7VyKLgDV/o+YA
 ujoKufqjBC0I+WBYjbkpwrbus8p3MrH6jV8/VZnPZ7F7J+ZASxkOWtnlx
 9pFvZAHWoDHOa5E/2NIpZssEBgSqw8ZzndhAwAnkmTtqQirjO4x6b7B1e
 GtxvHMCtAV3yhM8TKxwmYchkcCsyy8ORrmvEnA+OU6FEHROMOhscpfkW3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="443691159"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="443691159"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 02:35:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="865561582"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="865561582"
Received: from iraduica-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.61.21])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 02:35:54 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm: Add Wrapper Functions for ELD SAD Extraction
In-Reply-To: <20230821160004.2821445-3-mitulkumar.ajitkumar.golani@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230821160004.2821445-1-mitulkumar.ajitkumar.golani@intel.com>
 <20230821160004.2821445-3-mitulkumar.ajitkumar.golani@intel.com>
Date: Thu, 07 Sep 2023 12:35:52 +0300
Message-ID: <87h6o6gwav.fsf@intel.com>
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
Cc: ankit.k.nautiyal@intel.com,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 21 Aug 2023, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com> wrote:
> Add wrapper functions to facilitate extracting Short Audio
> Descriptor (SAD) information from EDID-Like Data (ELD) pointers
> with different constness requirements.
>
> 1. `drm_eld_sad`: This function returns a constant `uint8_t`
> pointer and wraps the main extraction function, allowing access
> to SAD information while maintaining const correctness.
>
> 2. `drm_extract_sad_from_eld`: This function returns a mutable
> `uint8_t` pointer and implements the core logic for extracting
> SAD from the provided ELD pointer. It performs version and
> maximum channel checks to ensure proper extraction.
>
> These wrapper functions provide flexibility to the codebase,
> allowing users to access SAD information while adhering to
> const correctness when needed and modifying the pointer when
> required.

I've considered this, and in the end I think it's better to *not* make
it easier for drivers to modify the ELD buffer directly.

To that end, I wrote some helpers to modify the SADs using the existing
struct cea_sad abstraction [1]. Please have a look. It should make your
changes better focus on what you need to do here, instead of getting
distracted with ELD parsing details.

BR,
Jani.


[1] https://patchwork.freedesktop.org/series/123384/


>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>  include/drm/drm_edid.h | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 48e93f909ef6..626bc0d542eb 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -418,11 +418,7 @@ static inline int drm_eld_mnl(const uint8_t *eld)
>  	return (eld[DRM_ELD_CEA_EDID_VER_MNL] & DRM_ELD_MNL_MASK) >> DRM_ELD_MNL_SHIFT;
>  }
>  
> -/**
> - * drm_eld_sad - Get ELD SAD structures.
> - * @eld: pointer to an eld memory structure with sad_count set
> - */
> -static inline const uint8_t *drm_eld_sad(const uint8_t *eld)
> +static uint8_t *drm_extract_sad_from_eld(uint8_t *eld)
>  {
>  	unsigned int ver, mnl;
>  
> @@ -437,6 +433,15 @@ static inline const uint8_t *drm_eld_sad(const uint8_t *eld)
>  	return eld + DRM_ELD_CEA_SAD(mnl, 0);
>  }
>  
> +/**
> + * drm_eld_sad - Get ELD SAD structures.
> + * @eld: pointer to an eld memory structure with sad_count set
> + */
> +static inline const uint8_t *drm_eld_sad(const uint8_t *eld)
> +{
> +	return drm_extract_sad_from_eld((uint8_t *)eld);
> +}
> +
>  /**
>   * drm_eld_sad_count - Get ELD SAD count.
>   * @eld: pointer to an eld memory structure with sad_count set

-- 
Jani Nikula, Intel Open Source Graphics Center
