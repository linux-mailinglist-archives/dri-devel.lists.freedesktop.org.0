Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3138A32EB2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 19:30:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17BF10E957;
	Wed, 12 Feb 2025 18:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oao+/UuO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58EC510E0D5;
 Wed, 12 Feb 2025 18:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739385005; x=1770921005;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=AEFla9owDkjEJ7y2eXWoOBJBURK7rTK4rilO3uvDUyM=;
 b=Oao+/UuOAe2H34H0Hjp15XGbkFB4epu1zvPnHsAZ/+RbE0IF77R8hYpc
 ZO+BSLop/zwRRYN4ZMhkQ6F+Nv0EG6WSp3Yl5ULOUUa3tSDKUPF7w+OYZ
 XBKuMSqJ+TXDoWeMXSuwu3k6d11PMQVZRk50Tz/BY9qk1IRMi4R6dkULs
 7FVOJ6MRFn6B5CES14kE8xQsG8Ya1/MnxV0vaeJ8SQ39cRqCLmVQI4FBi
 T9qNo7/Wjg74YpVNfNkawJKcGXPIx0Ulf/JUBpOEXZUJ1SmitAszmbbVi
 iPNG/9EgqMusqz/5Of/ashE09Q2U3wxxLa+U5CwboiY7aTOstVyBMUwus w==;
X-CSE-ConnectionGUID: 0YONy9SAQaSKu4MHr/fKxA==
X-CSE-MsgGUID: yu8SC0UaRvmE/bvgI65iDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39983215"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="39983215"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 10:30:05 -0800
X-CSE-ConnectionGUID: efGdiZmuTfmDeZ24gLH0tw==
X-CSE-MsgGUID: fs8P1rv8QtC32hwTEVU9nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="113100338"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 12 Feb 2025 10:30:01 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 12 Feb 2025 20:30:00 +0200
Date: Wed, 12 Feb 2025 20:30:00 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Vinod Govindapillai <vinod.govindapillai@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ville.syrjala@intel.com,
 santhosh.reddy.guddati@intel.com, jani.saarinen@intel.com
Subject: Re: [PATCH v7 5/7] drm/i915/xe3: avoid calling fbc activate if fbc
 is active
Message-ID: <Z6zoqILXcOM0YKEc@intel.com>
References: <20250212131420.60026-1-vinod.govindapillai@intel.com>
 <20250212131420.60026-6-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250212131420.60026-6-vinod.govindapillai@intel.com>
X-Patchwork-Hint: comment
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

On Wed, Feb 12, 2025 at 03:14:18PM +0200, Vinod Govindapillai wrote:
> If FBC is already active, we don't need to call FBC activate
> routine again. This is more relevant in case of dirty rect
> support in FBC. Xe doesn't support legacy fences. Hence fence
> programming also not required as part of this fbc_hw_activate.
> Any FBC related register updates done after enabling the dirty
> rect support in xe3 will trigger nuke by FBC HW. So avoid
> calling fbc activate routine again if the FBC is already active.
> 
> The front buffer rendering sequence will call intel_fbc_flush()
> and which will call intel_fbc_nuke() or intel_fbc_activate()
> based on FBC status explicitly and won't get impacted by this
> change.
> 
> v2: use HAS_FBC_DIRTY_RECT()
>     move this functionality within intel_fbc_activate()
> 
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_fbc.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
> index df05904bac8a..951dc81b7b97 100644
> --- a/drivers/gpu/drm/i915/display/intel_fbc.c
> +++ b/drivers/gpu/drm/i915/display/intel_fbc.c
> @@ -739,8 +739,19 @@ static void intel_fbc_nuke(struct intel_fbc *fbc)
>  
>  static void intel_fbc_activate(struct intel_fbc *fbc)
>  {
> +	struct intel_display *display = fbc->display;
> +
>  	lockdep_assert_held(&fbc->lock);
>  
> +	/*
> +	 * When dirty rectangle is enabled, any updates to FBC registers will
> +	 * trigger nuke. So avoid calling intel_fbc_activate if fbc is already
> +	 * active and for XE3 cases. Xe doesn't support legacy fences. So
> +	 * no need to update the fences as well.

I have no idea what XE3 and Xe here mean. I would just state
that platforms which have dirty rect don't have fences.

> +	 */
> +	if (HAS_FBC_DIRTY_RECT(display) && fbc->active)
> +		return;

I don't quite like the assumptions being made here.

Since only the fence can change upon flip nuke we should
probably check for intel_fbc_has_fences() instead of
HAS_DIRTY_RECT() and thus just skip this on all platforms
that don't have fences. That also increases our testing
coverage for this short circuit path, which is a good thing.

Ideally I guess we should check if the fence is actually
changing or not, but we don't have the old state around
anymore so can't do it right now.

So I guess we could do something like:
/* only the fence can change for a flip nuke */
if (fbc->active && !has_fences())
	return;

/*
 * the explanation about the FBC register write
 * nuke vs. dirty rect stuff.
 */
drm_WARN_ON(fbc->active && HAS_DIRTY_RECT());

> +
>  	intel_fbc_hw_activate(fbc);
>  	intel_fbc_nuke(fbc);
>  
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
