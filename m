Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2B2945973
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 10:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C80510E9AD;
	Fri,  2 Aug 2024 08:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JOP0dsji";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4333210E9AD
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 08:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722585840; x=1754121840;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ry2/gNu9+kvsWsvpU7s4wvW/tfDDAhedFLhZ9Mpluo0=;
 b=JOP0dsji3QnKLiq4/DfoHxMUlYs2kp0YG9TnXl/TQB/0VUH2lMQ6zsyK
 ZMFahD44HPNmQvULEEc72INLrnYfG57nCWNYcKyCJRTFc8kDbaIuS1Nuo
 3fHIecjzjuebXW/BOqhIH7NKtzXPDA7UEE2W0Td86mUyybKnfj3h4Bv7u
 BaMeA0b966TR5yjgi+lGIi5jjLIZi0qo4Gmw+9yu0I3/3CXqzH4bsyrX9
 b2yyIGCg3hxGhaAxQc10kOXc0ydOy7Tu/8HEXjqQG0c03mwqEGZeCw+0T
 pSwWW2NKxw1NYgLdfi/Hd1zf+zttAyNHU87XOIHKYKWxd9BRfAT/mzCKp A==;
X-CSE-ConnectionGUID: i0Z9gL1GQRi+SHPqK3Ib6A==
X-CSE-MsgGUID: 4SspjtgPQ7adQrhgepeIDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="31964991"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="31964991"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 01:04:00 -0700
X-CSE-ConnectionGUID: H/WLLRB1Ti62YTEmyP16xg==
X-CSE-MsgGUID: b8b/VxaDQjOY0B/0KtNR9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="56094449"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.66])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 01:03:57 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/client: Use common display mode for cloned outputs
In-Reply-To: <20240801130449.104645-1-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240801130449.104645-1-tzimmermann@suse.de>
Date: Fri, 02 Aug 2024 11:03:51 +0300
Message-ID: <878qxf73mg.fsf@intel.com>
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

On Thu, 01 Aug 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> For cloned outputs, don't pick a default resolution of 1024x768 as
> most hardware can do better. Instead look through the modes of all
> connectors to find a common mode for all of them.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_client_modeset.c | 54 +++++++++++++++++-----------
>  1 file changed, 34 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index 31af5cf37a09..67b422dc8e7f 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -266,7 +266,7 @@ static bool drm_client_target_cloned(struct drm_device *dev,
>  {
>  	int count, i, j;
>  	bool can_clone = false;
> -	struct drm_display_mode *dmt_mode, *mode;
> +	struct drm_display_mode *mode, *common_mode = NULL;
>  
>  	/* only contemplate cloning in the single crtc case */
>  	if (dev->mode_config.num_crtc > 1)
> @@ -309,35 +309,49 @@ static bool drm_client_target_cloned(struct drm_device *dev,
>  		return true;
>  	}
>  
> -	/* try and find a 1024x768 mode on each connector */
> -	can_clone = true;
> -	dmt_mode = drm_mode_find_dmt(dev, 1024, 768, 60, false);
> -
> -	if (!dmt_mode)
> -		goto fail;
> +	/* try and find a mode common among connectors */
>  
> +	can_clone = false;
>  	for (i = 0; i < connector_count; i++) {
>  		if (!enabled[i])
>  			continue;
>  
> -		list_for_each_entry(mode, &connectors[i]->modes, head) {
> -			if (drm_mode_match(mode, dmt_mode,
> -					   DRM_MODE_MATCH_TIMINGS |
> -					   DRM_MODE_MATCH_CLOCK |
> -					   DRM_MODE_MATCH_FLAGS |
> -					   DRM_MODE_MATCH_3D_FLAGS))
> -				modes[i] = mode;
> +		list_for_each_entry(common_mode, &connectors[i]->modes, head) {
> +			can_clone = true;
> +
> +			for (j = 1; j < connector_count; j++) {

Should this start from i instead of 1?

Anyway, I have a hard time wrapping my head around this whole thing. I
think it would greatly benefit from a helper function to search for a
mode from an array of connectors.

BR,
Jani.


> +				if (!enabled[i])
> +					continue;
> +
> +				can_clone = false;
> +				list_for_each_entry(mode, &connectors[j]->modes, head) {
> +					can_clone = drm_mode_match(common_mode, mode,
> +								   DRM_MODE_MATCH_TIMINGS |
> +							    DRM_MODE_MATCH_CLOCK |
> +							    DRM_MODE_MATCH_FLAGS |
> +							    DRM_MODE_MATCH_3D_FLAGS);
> +					if (can_clone)
> +						break; // found common mode on connector
> +				}
> +				if (!can_clone)
> +					break; // try next common mode
> +			}
> +			if (can_clone)
> +				break; // found common mode among all connectors
>  		}
> -		if (!modes[i])
> -			can_clone = false;
> +		break;
>  	}
> -	kfree(dmt_mode);
> -
>  	if (can_clone) {
> -		drm_dbg_kms(dev, "can clone using 1024x768\n");
> +		for (i = 0; i < connector_count; i++) {
> +			if (!enabled[i])
> +				continue;
> +			modes[i] = common_mode;
> +
> +		}
> +		drm_dbg_kms(dev, "can clone using" DRM_MODE_FMT "\n", DRM_MODE_ARG(common_mode));
>  		return true;
>  	}
> -fail:
> +
>  	drm_info(dev, "kms: can't enable cloning when we probably wanted to.\n");
>  	return false;
>  }

-- 
Jani Nikula, Intel
