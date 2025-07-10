Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7B3B00CF8
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 22:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D78110E958;
	Thu, 10 Jul 2025 20:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iqEe7rhy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8375D10E958;
 Thu, 10 Jul 2025 20:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752178910; x=1783714910;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=K/yhfCgUgABPoCJPuBJ+UbX2lrV0p65AARYdN9T9u8g=;
 b=iqEe7rhyTxgExNGfVOszyP3SmWAxMyrgoZMF26pVgeEW6z2omTejelpy
 gXNYvVXraxWQ6Npjv2WMqTYrgKYyQbK3heguLdBhQMy37Xfr8mlP5Dvh4
 Rgp6cUX8sbSCKy/sK1olmxiSVVTGpVa8XqwMoBsat4WztMYFBld8VzI9P
 EpTlYkIHzh7i0RmmngXfi401M3LZPeEFoqiTklFfsPuDZ8gjemEVsz3id
 an7XVQJGcJSctIGDWUbSZYXRI/+NZ9A46CWHn8AHTJCNONW/dEdJCgJ3J
 uaE8S5D5yNvUKUs381wNnEzk+lx5+clPJz9CBwq1xk5ZGFIq5yq9Kk2H6 g==;
X-CSE-ConnectionGUID: oSmDpukrRaaiIV6IcyYxOg==
X-CSE-MsgGUID: lkiYna/cSYqfBsHjaiWFeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54444812"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="54444812"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 13:21:49 -0700
X-CSE-ConnectionGUID: kmB09muuRZGANspQ9cr88A==
X-CSE-MsgGUID: lGFPJGJBQAW4AG/IyZO4Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="161878267"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO stinkbox)
 ([10.245.244.160])
 by orviesa005.jf.intel.com with SMTP; 10 Jul 2025 13:21:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Jul 2025 23:21:44 +0300
Date: Thu, 10 Jul 2025 23:21:44 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Naveen Kumar <naveen1.kumar@intel.com>
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, xaver.hugl@kde.org,
 mdaenzer@redhat.com, sebastian.wick@redhat.com, jadahl@gmail.com
Subject: Re: [PATCH] drm/i915/display: Allow async flips on planes with no
 framebuffer changes
Message-ID: <aHAg2J-uFLLWINqp@intel.com>
References: <20250707154121.74969-1-naveen1.kumar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250707154121.74969-1-naveen1.kumar@intel.com>
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

On Mon, Jul 07, 2025 at 03:41:20PM +0000, Naveen Kumar wrote:
> Allow asynchronous page flips on planes that either lack a framebuffer or
> retain the same framebuffer, as long as no plane properties are modified.
> 
> This avoids unnecessary failures in async flip paths when the update is
> effectively a no-op, improving compatibility with some compositors.

IMO what we want to do is make the drm core filter out all the garbage
from the commit. That way the driver would only see the planes that are
supposed to actually participate in the async flip.

> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834
> Signed-off-by: Naveen Kumar <naveen1.kumar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 18 +++++++++------
>  drivers/gpu/drm/i915/display/intel_plane.c   | 24 ++++++++++++++++++++
>  2 files changed, 35 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 456fc4b04cda..e0eb0de62ff4 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -5970,18 +5970,21 @@ static int intel_async_flip_check_uapi(struct intel_atomic_state *state,
>  		 * this(vlv/chv and icl+) should be added when async flip is
>  		 * enabled in the atomic IOCTL path.
>  		 */
> -		if (!plane->async_flip) {
> +		if (!plane->async_flip && new_plane_state->uapi.fb) {
>  			drm_dbg_kms(display->drm,
>  				    "[PLANE:%d:%s] async flip not supported\n",
>  				    plane->base.base.id, plane->base.name);
>  			return -EINVAL;
>  		}
>  
> -		if (!old_plane_state->uapi.fb || !new_plane_state->uapi.fb) {
> -			drm_dbg_kms(display->drm,
> -				    "[PLANE:%d:%s] no old or new framebuffer\n",
> -				    plane->base.base.id, plane->base.name);
> -			return -EINVAL;
> +		if (plane->base.type != DRM_PLANE_TYPE_CURSOR &&
> +		    plane->base.type != DRM_PLANE_TYPE_OVERLAY) {
> +			if (!old_plane_state->uapi.fb || !new_plane_state->uapi.fb) {
> +				drm_dbg_kms(display->drm,
> +					    "[PLANE:%d:%s] no old or new framebuffer\n",
> +					    plane->base.base.id, plane->base.name);
> +				return -EINVAL;
> +			}
>  		}
>  	}
>  
> @@ -6034,7 +6037,8 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
>  		 * an async flip. We should never get this far otherwise.
>  		 */
>  		if (drm_WARN_ON(display->drm,
> -				new_crtc_state->do_async_flip && !plane->async_flip))
> +				new_crtc_state->do_async_flip && !plane->async_flip &&
> +				new_plane_state->hw.fb))
>  			return -EINVAL;
>  
>  		/*
> diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
> index 36fb07471deb..434be91b57df 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane.c
> @@ -1425,9 +1425,33 @@ static int intel_get_scanout_buffer(struct drm_plane *plane,
>  	return 0;
>  }
>  
> +static int
> +intel_plane_atomic_async_check(struct drm_plane *plane,
> +			       struct drm_atomic_state *_state, bool flip)
> +{
> +	struct intel_atomic_state *state = to_intel_atomic_state(_state);
> +	struct intel_plane *intel_plane;
> +	const struct intel_plane_state *old_plane_state;
> +	struct intel_plane_state *new_plane_state;
> +	int i;
> +
> +	for_each_oldnew_intel_plane_in_state(state, intel_plane, old_plane_state,
> +					     new_plane_state, i) {
> +		if (intel_plane->id != to_intel_plane(plane)->id)
> +			continue;
> +
> +		/* no old or new framebuffer */
> +		if (flip && !old_plane_state->uapi.fb && !new_plane_state->uapi.fb)
> +			return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  static const struct drm_plane_helper_funcs intel_plane_helper_funcs = {
>  	.prepare_fb = intel_prepare_plane_fb,
>  	.cleanup_fb = intel_cleanup_plane_fb,
> +	.atomic_async_check = intel_plane_atomic_async_check,
>  };
>  
>  static const struct drm_plane_helper_funcs intel_primary_plane_helper_funcs = {
> -- 
> 2.48.1

-- 
Ville Syrjälä
Intel
