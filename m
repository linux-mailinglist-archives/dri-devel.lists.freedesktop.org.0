Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E18647588
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 19:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FFE10E4D4;
	Thu,  8 Dec 2022 18:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8992410E15E;
 Thu,  8 Dec 2022 18:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670524165; x=1702060165;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BrovPg0LL/KLUxlnRswu3h/UHCPi/lj+n+pMhW+mLLU=;
 b=mzZcD9FWm+Tj4kp6DpRI5zaCRlVt6QOIN4u7zGOuZbpawstExeIgDIDc
 kQ9QP0wPQaJUy+vc4pq6vKpI7ebAzzMMuvsSxsoxag6Wog8dQrZIkjHvS
 kvSKaj9OLpq5cahe/bISoKvnBLPg5nRvmftFOmH9y5qgRMs8i8G/B5vUy
 Kwsu5z0W213YkzQp1AF5riaPDA+bedMNAAm1s+EnNZlknSpl/UW9+AlJI
 pvN+XE0uSkgwkQRu789GULiTiPCjcVqS6lSfBIv0xYaibRuq1Sn39rhVy
 4AtNQJX4PdaeDPc4gE2/Dv2DGJurhK1DRmq5BAkolBcIdgLsf80G/KUXN g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="300681853"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="300681853"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 10:29:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="715714921"
X-IronPort-AV: E=Sophos;i="5.96,227,1665471600"; d="scan'208";a="715714921"
Received: from mdnavare-mobl1.jf.intel.com ([10.165.21.203])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2022 10:29:23 -0800
Date: Thu, 8 Dec 2022 10:29:40 -0800
From: "Navare, Manasi" <manasi.d.navare@intel.com>
To: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Subject: Re: [PATCH 5/6] drm/i915: Extract VESA DSC bpp alignment to separate
 function
Message-ID: <20221208182940.GA1345314@mdnavare-mobl1.jf.intel.com>
References: <20221103132146.12759-1-stanislav.lisovskiy@intel.com>
 <20221123100551.29080-1-stanislav.lisovskiy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221123100551.29080-1-stanislav.lisovskiy@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 jani.saarinen@intel.com, dri-devel@lists.freedesktop.org,
 vinod.govindapillai@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 23, 2022 at 12:05:51PM +0200, Stanislav Lisovskiy wrote:
> We might to use that function separately from intel_dp_dsc_compute_config
> for DP DSC over MST case, because allocating bandwidth in that
> case can be a bit more tricky. So in order to avoid code copy-pasta
> lets extract this to separate function and reuse it for both SST
> and MST cases.
> 
> v2: Removed multiple blank lines
> v3: Rename intel_dp_dsc_nearest_vesa_bpp to intel_dp_dsc_nearest_valid_bpp
>     to reflect its meaning more properly.
>     (Manasi Navare)
> 
> Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

Looks good now,

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>

Manasi

> ---
>  drivers/gpu/drm/i915/display/intel_dp.c     | 50 +++++++++++++--------
>  drivers/gpu/drm/i915/display/intel_dp.h     |  1 +
>  drivers/gpu/drm/i915/display/intel_dp_mst.c |  1 -
>  3 files changed, 32 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 44e2424a54c0..d78216fba0a2 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -672,6 +672,36 @@ small_joiner_ram_size_bits(struct drm_i915_private *i915)
>  		return 6144 * 8;
>  }
>  
> +u32 intel_dp_dsc_nearest_valid_bpp(struct drm_i915_private *i915, u32 bpp, u32 pipe_bpp)
> +{
> +	u32 bits_per_pixel = bpp;
> +	int i;
> +
> +	/* Error out if the max bpp is less than smallest allowed valid bpp */
> +	if (bits_per_pixel < valid_dsc_bpp[0]) {
> +		drm_dbg_kms(&i915->drm, "Unsupported BPP %u, min %u\n",
> +			    bits_per_pixel, valid_dsc_bpp[0]);
> +		return 0;
> +	}
> +
> +	/* From XE_LPD onwards we support from bpc upto uncompressed bpp-1 BPPs */
> +	if (DISPLAY_VER(i915) >= 13) {
> +		bits_per_pixel = min(bits_per_pixel, pipe_bpp - 1);
> +	} else {
> +		/* Find the nearest match in the array of known BPPs from VESA */
> +		for (i = 0; i < ARRAY_SIZE(valid_dsc_bpp) - 1; i++) {
> +			if (bits_per_pixel < valid_dsc_bpp[i + 1])
> +				break;
> +		}
> +		drm_dbg_kms(&i915->drm, "Set dsc bpp from %d to VESA %d\n",
> +			    bits_per_pixel, valid_dsc_bpp[i]);
> +
> +		bits_per_pixel = valid_dsc_bpp[i];
> +	}
> +
> +	return bits_per_pixel;
> +}
> +
>  u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
>  				u32 link_clock, u32 lane_count,
>  				u32 mode_clock, u32 mode_hdisplay,
> @@ -680,7 +710,6 @@ u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
>  				u32 timeslots)
>  {
>  	u32 bits_per_pixel, max_bpp_small_joiner_ram;
> -	int i;
>  
>  	/*
>  	 * Available Link Bandwidth(Kbits/sec) = (NumberOfLanes)*
> @@ -713,24 +742,7 @@ u16 intel_dp_dsc_get_output_bpp(struct drm_i915_private *i915,
>  		bits_per_pixel = min(bits_per_pixel, max_bpp_bigjoiner);
>  	}
>  
> -	/* Error out if the max bpp is less than smallest allowed valid bpp */
> -	if (bits_per_pixel < valid_dsc_bpp[0]) {
> -		drm_dbg_kms(&i915->drm, "Unsupported BPP %u, min %u\n",
> -			    bits_per_pixel, valid_dsc_bpp[0]);
> -		return 0;
> -	}
> -
> -	/* From XE_LPD onwards we support from bpc upto uncompressed bpp-1 BPPs */
> -	if (DISPLAY_VER(i915) >= 13) {
> -		bits_per_pixel = min(bits_per_pixel, pipe_bpp - 1);
> -	} else {
> -		/* Find the nearest match in the array of known BPPs from VESA */
> -		for (i = 0; i < ARRAY_SIZE(valid_dsc_bpp) - 1; i++) {
> -			if (bits_per_pixel < valid_dsc_bpp[i + 1])
> -				break;
> -		}
> -		bits_per_pixel = valid_dsc_bpp[i];
> -	}
> +	bits_per_pixel = intel_dp_dsc_nearest_valid_bpp(i915, bits_per_pixel, pipe_bpp);
>  
>  	/*
>  	 * Compressed BPP in U6.4 format so multiply by 16, for Gen 11,
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
> index c6539a6915e9..e4faccf87370 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> @@ -120,6 +120,7 @@ static inline unsigned int intel_dp_unused_lane_mask(int lane_count)
>  }
>  
>  u32 intel_dp_mode_to_fec_clock(u32 mode_clock);
> +u32 intel_dp_dsc_nearest_valid_bpp(struct drm_i915_private *i915, u32 bpp, u32 pipe_bpp);
>  
>  void intel_ddi_update_pipe(struct intel_atomic_state *state,
>  			   struct intel_encoder *encoder,
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 59f80af8d17d..b4f01c01dc1c 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -115,7 +115,6 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struct intel_encoder *encoder,
>  	return slots;
>  }
>  
> -
>  static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
>  					    struct intel_crtc_state *crtc_state,
>  					    struct drm_connector_state *conn_state,
> -- 
> 2.37.3
> 
