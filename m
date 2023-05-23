Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5679270DD6C
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 15:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC8B10E438;
	Tue, 23 May 2023 13:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B372A10E42F;
 Tue, 23 May 2023 13:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684848398; x=1716384398;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=mlzsDVTQ49ZT9Ot+UB3j8Va0JllC8yQ20xKDPFFUyu0=;
 b=aaR+XTjFDtlQuSKDfNHwoq/O+x1dKQiJC4zjSFaiAcWVWbok63CLwybi
 /6H4syiWaUePyQAquaQFif1htGU/i18exiIeQyRVjc/ZHQuks/uFkBkn8
 gis/rm+XyvyjVYo32HDvSBpIq1877t9ZBzPSx7u3Et7U8hnVS4jv0YN/d
 Pzcxf23WX/ZO5p14DFPrybvF1Ke9HjONxGDXrhSL+X+xGtWmubzM1pciW
 CVwjseVNLT9KtkcMQer8uXwXFnjelZigBCkohP59+3ewAzIlEElcCcRAU
 fJFyenEj1WmBy65kz5AoJ9SdWqO+xyrRUx2Uyg9in1dYYHybWwgCGM5LK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="342693229"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; d="scan'208";a="342693229"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 06:26:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="878204268"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; d="scan'208";a="878204268"
Received: from chauvina-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.53.70])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 06:26:32 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tom Rix <trix@redhat.com>, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@gmail.com,
 daniel@ffwll.ch, nathan@kernel.org, ndesaulniers@google.com,
 ville.syrjala@linux.intel.com, imre.deak@intel.com,
 arun.r.murthy@intel.com, lucas.demarchi@intel.com
Subject: Re: [PATCH] drm/i915: simplify switch to if-elseif
In-Reply-To: <20230523125116.1669057-1-trix@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230523125116.1669057-1-trix@redhat.com>
Date: Tue, 23 May 2023 16:26:29 +0300
Message-ID: <874jo3kwl6.fsf@intel.com>
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
Cc: Tom Rix <trix@redhat.com>, intel-gfx@lists.freedesktop.org,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 23 May 2023, Tom Rix <trix@redhat.com> wrote:
> clang with W=1 reports
> drivers/gpu/drm/i915/display/intel_display.c:6012:3: error: unannotated
>   fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
>                 case I915_FORMAT_MOD_X_TILED:
>                 ^
>
> Only one case and the default does anything in this switch, so it should
> be changed to an if-elseif.

Thanks for the patch.

If I wanted to fix this quickly, I'd just add the break in there.

If I wanted to fix this properly, I'd add a function
modifier_supports_async_flips() or something, and replace the switch
with:

	if (!modifier_supports_async_flips(i915, new_plane_state->hw.fb->modifier)) {
		drm_dbg_kms(&i915->drm, "[PLANE:%d:%s] Modifier does not support async flips\n",
			plane->base.base.id, plane->base.name);
		return -EINVAL;
	}

But I wouldn't just replace the switch with if-elseif. It doesn't help
with the overall feeling that intel_async_flip_check_hw() is too long.

BR,
Jani.


>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 0490c6412ab5..1f852e49fc20 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -5994,8 +5994,7 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
>  		 * Need to verify this for all gen9 platforms to enable
>  		 * this selectively if required.
>  		 */
> -		switch (new_plane_state->hw.fb->modifier) {
> -		case DRM_FORMAT_MOD_LINEAR:
> +		if (new_plane_state->hw.fb->modifier == DRM_FORMAT_MOD_LINEAR) {
>  			/*
>  			 * FIXME: Async on Linear buffer is supported on ICL as
>  			 * but with additional alignment and fbc restrictions
> @@ -6008,13 +6007,10 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
>  					    plane->base.base.id, plane->base.name);
>  				return -EINVAL;
>  			}
> -
> -		case I915_FORMAT_MOD_X_TILED:
> -		case I915_FORMAT_MOD_Y_TILED:
> -		case I915_FORMAT_MOD_Yf_TILED:
> -		case I915_FORMAT_MOD_4_TILED:
> -			break;
> -		default:
> +		} else if (!(new_plane_state->hw.fb->modifier == I915_FORMAT_MOD_X_TILED ||
> +			     new_plane_state->hw.fb->modifier == I915_FORMAT_MOD_Y_TILED ||
> +			     new_plane_state->hw.fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
> +			     new_plane_state->hw.fb->modifier == I915_FORMAT_MOD_4_TILED)) {
>  			drm_dbg_kms(&i915->drm,
>  				    "[PLANE:%d:%s] Modifier does not support async flips\n",
>  				    plane->base.base.id, plane->base.name);

-- 
Jani Nikula, Intel Open Source Graphics Center
