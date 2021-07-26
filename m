Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0198F3D6A2A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 01:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF096E99F;
	Mon, 26 Jul 2021 23:21:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76E86E99F;
 Mon, 26 Jul 2021 23:21:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="234194480"
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="234194480"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 16:21:24 -0700
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="579925201"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 16:21:20 -0700
Date: Mon, 26 Jul 2021 16:21:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 23/30] drm/i915/gt: remove explicit CNL handling from
 intel_sseu.c
Message-ID: <20210726232119.GW1556418@mdroper-desk1.amr.corp.intel.com>
References: <20210724001114.249295-1-lucas.demarchi@intel.com>
 <20210724001114.249295-24-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210724001114.249295-24-lucas.demarchi@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, Jose Souza <jose.souza@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 05:11:07PM -0700, Lucas De Marchi wrote:
> CNL is the only platform with GRAPHICS_VER == 10. With its removal we
> don't need to handle that version anymore.
> 
> Also we can now reduce the max number of slices: the call to
> intel_sseu_set_info() with the highest number of slices comes from SKL
> and BDW with 3 slices. Recent platforms actually increase the
> number of subslices so the number of slices remain 1.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_sseu.c | 79 ----------------------------
>  drivers/gpu/drm/i915/gt/intel_sseu.h |  2 +-
>  2 files changed, 1 insertion(+), 80 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
> index 367fd44b81c8..9542c3f3822a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_sseu.c
> +++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
> @@ -188,83 +188,6 @@ static void gen11_sseu_info_init(struct intel_gt *gt)
>  	sseu->has_eu_pg = 1;
>  }
>  
> -static void gen10_sseu_info_init(struct intel_gt *gt)
> -{
> -	struct intel_uncore *uncore = gt->uncore;
> -	struct sseu_dev_info *sseu = &gt->info.sseu;
> -	const u32 fuse2 = intel_uncore_read(uncore, GEN8_FUSE2);
> -	const int eu_mask = 0xff;
> -	u32 subslice_mask, eu_en;
> -	int s, ss;
> -
> -	intel_sseu_set_info(sseu, 6, 4, 8);
> -
> -	sseu->slice_mask = (fuse2 & GEN10_F2_S_ENA_MASK) >>
> -		GEN10_F2_S_ENA_SHIFT;
> -
> -	/* Slice0 */
> -	eu_en = ~intel_uncore_read(uncore, GEN8_EU_DISABLE0);
> -	for (ss = 0; ss < sseu->max_subslices; ss++)
> -		sseu_set_eus(sseu, 0, ss, (eu_en >> (8 * ss)) & eu_mask);
> -	/* Slice1 */
> -	sseu_set_eus(sseu, 1, 0, (eu_en >> 24) & eu_mask);
> -	eu_en = ~intel_uncore_read(uncore, GEN8_EU_DISABLE1);
> -	sseu_set_eus(sseu, 1, 1, eu_en & eu_mask);
> -	/* Slice2 */
> -	sseu_set_eus(sseu, 2, 0, (eu_en >> 8) & eu_mask);
> -	sseu_set_eus(sseu, 2, 1, (eu_en >> 16) & eu_mask);
> -	/* Slice3 */
> -	sseu_set_eus(sseu, 3, 0, (eu_en >> 24) & eu_mask);
> -	eu_en = ~intel_uncore_read(uncore, GEN8_EU_DISABLE2);
> -	sseu_set_eus(sseu, 3, 1, eu_en & eu_mask);
> -	/* Slice4 */
> -	sseu_set_eus(sseu, 4, 0, (eu_en >> 8) & eu_mask);
> -	sseu_set_eus(sseu, 4, 1, (eu_en >> 16) & eu_mask);
> -	/* Slice5 */
> -	sseu_set_eus(sseu, 5, 0, (eu_en >> 24) & eu_mask);
> -	eu_en = ~intel_uncore_read(uncore, GEN10_EU_DISABLE3);
> -	sseu_set_eus(sseu, 5, 1, eu_en & eu_mask);
> -
> -	subslice_mask = (1 << 4) - 1;
> -	subslice_mask &= ~((fuse2 & GEN10_F2_SS_DIS_MASK) >>
> -			   GEN10_F2_SS_DIS_SHIFT);
> -
> -	for (s = 0; s < sseu->max_slices; s++) {
> -		u32 subslice_mask_with_eus = subslice_mask;
> -
> -		for (ss = 0; ss < sseu->max_subslices; ss++) {
> -			if (sseu_get_eus(sseu, s, ss) == 0)
> -				subslice_mask_with_eus &= ~BIT(ss);
> -		}
> -
> -		/*
> -		 * Slice0 can have up to 3 subslices, but there are only 2 in
> -		 * slice1/2.
> -		 */
> -		intel_sseu_set_subslices(sseu, s, s == 0 ?
> -					 subslice_mask_with_eus :
> -					 subslice_mask_with_eus & 0x3);
> -	}
> -
> -	sseu->eu_total = compute_eu_total(sseu);
> -
> -	/*
> -	 * CNL is expected to always have a uniform distribution
> -	 * of EU across subslices with the exception that any one
> -	 * EU in any one subslice may be fused off for die
> -	 * recovery.
> -	 */
> -	sseu->eu_per_subslice =
> -		intel_sseu_subslice_total(sseu) ?
> -		DIV_ROUND_UP(sseu->eu_total, intel_sseu_subslice_total(sseu)) :
> -		0;
> -
> -	/* No restrictions on Power Gating */
> -	sseu->has_slice_pg = 1;
> -	sseu->has_subslice_pg = 1;
> -	sseu->has_eu_pg = 1;
> -}
> -
>  static void cherryview_sseu_info_init(struct intel_gt *gt)
>  {
>  	struct sseu_dev_info *sseu = &gt->info.sseu;
> @@ -592,8 +515,6 @@ void intel_sseu_info_init(struct intel_gt *gt)
>  		bdw_sseu_info_init(gt);
>  	else if (GRAPHICS_VER(i915) == 9)
>  		gen9_sseu_info_init(gt);
> -	else if (GRAPHICS_VER(i915) == 10)
> -		gen10_sseu_info_init(gt);
>  	else if (GRAPHICS_VER(i915) == 11)
>  		gen11_sseu_info_init(gt);
>  	else if (GRAPHICS_VER(i915) >= 12)
> diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.h b/drivers/gpu/drm/i915/gt/intel_sseu.h
> index 4cd1a8a7298a..8d85ec05f610 100644
> --- a/drivers/gpu/drm/i915/gt/intel_sseu.h
> +++ b/drivers/gpu/drm/i915/gt/intel_sseu.h
> @@ -15,7 +15,7 @@ struct drm_i915_private;
>  struct intel_gt;
>  struct drm_printer;
>  
> -#define GEN_MAX_SLICES		(6) /* CNL upper bound */
> +#define GEN_MAX_SLICES		(3) /* SKL upper bound */
>  #define GEN_MAX_SUBSLICES	(8) /* ICL upper bound */
>  #define GEN_SSEU_STRIDE(max_entries) DIV_ROUND_UP(max_entries, BITS_PER_BYTE)
>  #define GEN_MAX_SUBSLICE_STRIDE GEN_SSEU_STRIDE(GEN_MAX_SUBSLICES)
> -- 
> 2.31.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
