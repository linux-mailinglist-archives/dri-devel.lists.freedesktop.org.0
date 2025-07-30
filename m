Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D80B159A0
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 09:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5185210E413;
	Wed, 30 Jul 2025 07:32:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eo/wi59W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E07310E410;
 Wed, 30 Jul 2025 07:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753860755; x=1785396755;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=iz2SWeE8LniAbjeie9A2UKNLyaylRxyC2gXK4mix4ck=;
 b=Eo/wi59WPqyObKYHR/THXZ2bJcVjsl8HAbTm/2TGoYuNrPiOmfRNoC5l
 I60XMFEDF+hxYXO84kBD6g2Wkn5rmDxAgHnb6CG7BdcC3vEYVkr+pe1z/
 Mbab6T3lMr3Tt18CLsDaw3YOVqSiVHdB3wZ+iN7i+lxNPOrrbWWVq0K/k
 zW4W2Bh1fWy8x6UW3YPxn2DWBMnGbgRFiJvyJrhGsSUB0D25eT1eLswWD
 ClXuv81oEyFFITN2jmRxH41nV9HSuv5NnYBT2XkmMxJ94ID6ns04FOc19
 fyLH3307TaH/AFcxN88hTLFnWfin8wc6X7me54BLAskGfevKJqW45IvJT w==;
X-CSE-ConnectionGUID: 1nnZ0opVQT2TwskD1Q/BZQ==
X-CSE-MsgGUID: WxaFpeuuRPq3jMDMmW7a1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56301856"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="56301856"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 00:32:35 -0700
X-CSE-ConnectionGUID: OF61lDV8RUSDmV31BdhZqA==
X-CSE-MsgGUID: BparOxMKTi299BKd1x9yBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="193761498"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.74])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 00:32:31 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nemesa Garg <nemesa.garg@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>, Ankit Nautiyal
 <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH 02/10] drm/i915/display: Introduce HAS_CASF for
 sharpness support
In-Reply-To: <20250724134544.284371-3-nemesa.garg@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250724134544.284371-1-nemesa.garg@intel.com>
 <20250724134544.284371-3-nemesa.garg@intel.com>
Date: Wed, 30 Jul 2025 10:32:28 +0300
Message-ID: <2c93ca60e6125a9bd1792fb0b00dd01dd6705781@intel.com>
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

On Thu, 24 Jul 2025, Nemesa Garg <nemesa.garg@intel.com> wrote:
> Add HAS_CASF macro to check whether platform supports
> the content adaptive sharpness capability or not.
>
> v2: Update commit message[Ankit]
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_crtc_state_dump.c | 7 +++++++
>  drivers/gpu/drm/i915/display/intel_display_device.h  | 1 +
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> index 0c7f91046996..33ec30123214 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> @@ -373,6 +373,13 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
>  
>  	intel_vdsc_state_dump(&p, 0, pipe_config);
>  
> +	if (HAS_CASF(display)) {
> +		drm_printf(&p, "sharpness strength: %d, sharpness tap size :%d\n sharpness enable :%d\n",

No \n in the middle please.

> +			   pipe_config->hw.casf_params.strength,
> +			   pipe_config->hw.casf_params.win_size,
> +			   pipe_config->hw.casf_params.casf_enable);
> +	}
> +
>  dump_planes:
>  	if (!state)
>  		return;
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
> index 4308822f0415..7f76215195d8 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.h
> @@ -145,6 +145,7 @@ struct intel_display_platforms {
>  #define HAS_ASYNC_FLIPS(__display)	(DISPLAY_VER(__display) >= 5)
>  #define HAS_AS_SDP(__display)		(DISPLAY_VER(__display) >= 13)
>  #define HAS_BIGJOINER(__display)	(DISPLAY_VER(__display) >= 11 && HAS_DSC(__display))
> +#define HAS_CASF(__display)		(DISPLAY_VER(__display) >= 20)
>  #define HAS_CDCLK_CRAWL(__display)	(DISPLAY_INFO(__display)->has_cdclk_crawl)
>  #define HAS_CDCLK_SQUASH(__display)	(DISPLAY_INFO(__display)->has_cdclk_squash)
>  #define HAS_CMRR(__display)		(DISPLAY_VER(__display) >= 20)

-- 
Jani Nikula, Intel
