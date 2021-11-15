Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 080A1451078
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 19:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D810D6E874;
	Mon, 15 Nov 2021 18:46:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B586E874;
 Mon, 15 Nov 2021 18:46:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="296933612"
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="296933612"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 10:46:42 -0800
X-IronPort-AV: E=Sophos;i="5.87,237,1631602800"; d="scan'208";a="506043314"
Received: from rakeshr1-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.255.37.176])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2021 10:46:42 -0800
Date: Mon, 15 Nov 2021 13:46:40 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Don't read query SSEU for
 non-existent slice 0 on old platforms
Message-ID: <YZKrEBk9V5IFa9uD@intel.com>
References: <20211112160107.1593906-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112160107.1593906-1-matthew.d.roper@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 12, 2021 at 08:01:07AM -0800, Matt Roper wrote:
> Pre-HSW platforms don't use the gt SSEU structures; this means that
> calling intel_sseu_get_subslices() on slice 0 for these platforms will
> trip a GEM_BUG_ON(slice >= sseu->max_slices) warning.
> 
> Let's move the DSS lookup for a DG2 workaround into a helper function
> that will only get called after we've already decided that we're on a
> DG2 platform.
> 
> Fixes: 645cc0b9d972 ("drm/i915/dg2: Add initial gt/ctx/engine workarounds")
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 51591119da15..a9727447c037 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -2019,11 +2019,18 @@ engine_fake_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  				    CMD_CCTL_MOCS_OVERRIDE(mocs, mocs));
>  	}
>  }
> +
> +static bool needs_wa_1308578152(struct intel_engine_cs *engine)
> +{
> +	u64 dss_mask = intel_sseu_get_subslices(&engine->gt->info.sseu, 0);
> +
> +	return (dss_mask & GENMASK(GEN_DSS_PER_GSLICE - 1, 0)) == 0;
> +}
> +
>  static void
>  rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  {
>  	struct drm_i915_private *i915 = engine->i915;
> -	u64 dss_mask = intel_sseu_get_subslices(&engine->gt->info.sseu, 0);
>  
>  	if (IS_DG2_GRAPHICS_STEP(engine->i915, G11, STEP_A0, STEP_B0)) {
>  		/* Wa_14013392000:dg2_g11 */
> @@ -2057,7 +2064,7 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  
>  	/* Wa_1308578152:dg2_g10 when first gslice is fused off */
>  	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_B0, STEP_C0) &&
> -	    (dss_mask & GENMASK(GEN_DSS_PER_GSLICE - 1, 0)) == 0) {
> +	    needs_wa_1308578152(engine)) {
>  		wa_masked_dis(wal, GEN12_CS_DEBUG_MODE1_CCCSUNIT_BE_COMMON,
>  			      GEN12_REPLAY_MODE_GRANULARITY);
>  	}
> -- 
> 2.33.0
> 
