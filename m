Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2ED44E57D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 12:19:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD15A6E4CD;
	Fri, 12 Nov 2021 11:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA0E6E4C4;
 Fri, 12 Nov 2021 11:19:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="233063201"
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; d="scan'208";a="233063201"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 03:19:29 -0800
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; d="scan'208";a="670622386"
Received: from thrakatuluk.fi.intel.com (HELO thrakatuluk) ([10.237.72.185])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 03:19:27 -0800
Received: from platvala by thrakatuluk with local (Exim 4.94)
 (envelope-from <petri.latvala@intel.com>)
 id 1mlUZX-0002j5-RS; Fri, 12 Nov 2021 13:18:19 +0200
Date: Fri, 12 Nov 2021 13:18:19 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/3] drm/i915/dg2: Add initial gt/ctx/engine
 workarounds
Message-ID: <YY5Ne7HtlWFcVHp1@platvala-desk.ger.corp.intel.com>
References: <20211102222511.534310-1-matthew.d.roper@intel.com>
 <20211102222511.534310-3-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102222511.534310-3-matthew.d.roper@intel.com>
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
Cc: tomi.p.sarvela@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 02, 2021 at 03:25:10PM -0700, Matt Roper wrote:
> Bspec: 54077,68173,54833
> Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_workarounds.c | 278 +++++++++++++++++++-
>  drivers/gpu/drm/i915/i915_reg.h             |  94 +++++--
>  drivers/gpu/drm/i915/intel_pm.c             |  21 +-
>  3 files changed, 372 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 4aaa210fc003..37fd541a9719 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -644,6 +644,42 @@ static void dg1_ctx_workarounds_init(struct intel_engine_cs *engine,
>  		     DG1_HZ_READ_SUPPRESSION_OPTIMIZATION_DISABLE);
>  }
>  
> +static void dg2_ctx_workarounds_init(struct intel_engine_cs *engine,
> +				     struct i915_wa_list *wal)
> +{
> +	gen12_ctx_gt_tuning_init(engine, wal);
> +
> +	/* Wa_16011186671:dg2_g11 */
> +	if (IS_DG2_GRAPHICS_STEP(engine->i915, G11, STEP_A0, STEP_B0)) {
> +		wa_masked_dis(wal, VFLSKPD, DIS_MULT_MISS_RD_SQUASH);
> +		wa_masked_en(wal, VFLSKPD, DIS_OVER_FETCH_CACHE);
> +	}
> +
> +	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_B0)) {
> +		/* Wa_14010469329:dg2_g10 */
> +		wa_masked_en(wal, GEN11_COMMON_SLICE_CHICKEN3,
> +			     XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE);
> +
> +		/*
> +		 * Wa_22010465075:dg2_g10
> +		 * Wa_22010613112:dg2_g10
> +		 * Wa_14010698770:dg2_g10
> +		 */
> +		wa_masked_en(wal, GEN11_COMMON_SLICE_CHICKEN3,
> +			     GEN12_DISABLE_CPS_AWARE_COLOR_PIPE);
> +	}
> +
> +	/* Wa_16013271637:dg2 */
> +	wa_masked_en(wal, SLICE_COMMON_ECO_CHICKEN1,
> +		     MSC_MSAA_REODER_BUF_BYPASS_DISABLE);
> +
> +	/* Wa_22012532006:dg2 */
> +	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_C0) ||
> +	    IS_DG2_GRAPHICS_STEP(engine->i915, G11, STEP_A0, STEP_B0))
> +		wa_masked_en(wal, GEN9_HALF_SLICE_CHICKEN7,
> +			     DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA);
> +}
> +
>  static void fakewa_disable_nestedbb_mode(struct intel_engine_cs *engine,
>  					 struct i915_wa_list *wal)
>  {
> @@ -730,7 +766,9 @@ __intel_engine_init_ctx_wa(struct intel_engine_cs *engine,
>  	if (engine->class != RENDER_CLASS)
>  		goto done;
>  
> -	if (IS_XEHPSDV(i915))
> +	if (IS_DG2(i915))
> +		dg2_ctx_workarounds_init(engine, wal);
> +	else if (IS_XEHPSDV(i915))
>  		; /* noop; none at this time */
>  	else if (IS_DG1(i915))
>  		dg1_ctx_workarounds_init(engine, wal);
> @@ -1343,12 +1381,117 @@ xehpsdv_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>  		    GLOBAL_INVALIDATION_MODE);
>  }
>  
> +static void
> +dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
> +{
> +	struct intel_engine_cs *engine;
> +	int id;
> +
> +	xehp_init_mcr(gt, wal);
> +
> +	/* Wa_14011060649:dg2 */
> +	wa_14011060649(gt, wal);
> +
> +	/*
> +	 * Although there are per-engine instances of these registers,
> +	 * they technically exist outside the engine itself and are not
> +	 * impacted by engine resets.  Furthermore, they're part of the
> +	 * GuC blacklist so trying to treat them as engine workarounds
> +	 * will result in GuC initialization failure and a wedged GPU.
> +	 */
> +	for_each_engine(engine, gt, id) {
> +		if (engine->class != VIDEO_DECODE_CLASS)
> +			continue;
> +
> +		/* Wa_16010515920:dg2_g10 */
> +		if (IS_DG2_GRAPHICS_STEP(gt->i915, G10, STEP_A0, STEP_B0))
> +			wa_write_or(wal, VDBOX_CGCTL3F18(engine->mmio_base),
> +				    ALNUNIT_CLKGATE_DIS);
> +	}
> +
> +	if (IS_DG2_G10(gt->i915)) {
> +		/* Wa_22010523718:dg2 */
> +		wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE,
> +			    CG3DDISCFEG_CLKGATE_DIS);
> +
> +		/* Wa_14011006942:dg2 */
> +		wa_write_or(wal, SUBSLICE_UNIT_LEVEL_CLKGATE,
> +			    DSS_ROUTER_CLKGATE_DIS);
> +	}
> +
> +	if (IS_DG2_GRAPHICS_STEP(gt->i915, G10, STEP_A0, STEP_B0)) {
> +		/* Wa_14010680813:dg2_g10 */
> +		wa_write_or(wal, GEN12_GAMSTLB_CTRL, CONTROL_BLOCK_CLKGATE_DIS |
> +			    EGRESS_BLOCK_CLKGATE_DIS | TAG_BLOCK_CLKGATE_DIS);
> +
> +		/* Wa_14010948348:dg2_g10 */
> +		wa_write_or(wal, UNSLCGCTL9430, MSQDUNIT_CLKGATE_DIS);
> +
> +		/* Wa_14011037102:dg2_g10 */
> +		wa_write_or(wal, UNSLCGCTL9444, LTCDD_CLKGATE_DIS);
> +
> +		/* Wa_14011371254:dg2_g10 */
> +		wa_write_or(wal, SLICE_UNIT_LEVEL_CLKGATE, NODEDSS_CLKGATE_DIS);
> +
> +		/* Wa_14011431319:dg2_g10 */
> +		wa_write_or(wal, UNSLCGCTL9440, GAMTLBOACS_CLKGATE_DIS |
> +			    GAMTLBVDBOX7_CLKGATE_DIS |
> +			    GAMTLBVDBOX6_CLKGATE_DIS |
> +			    GAMTLBVDBOX5_CLKGATE_DIS |
> +			    GAMTLBVDBOX4_CLKGATE_DIS |
> +			    GAMTLBVDBOX3_CLKGATE_DIS |
> +			    GAMTLBVDBOX2_CLKGATE_DIS |
> +			    GAMTLBVDBOX1_CLKGATE_DIS |
> +			    GAMTLBVDBOX0_CLKGATE_DIS |
> +			    GAMTLBKCR_CLKGATE_DIS |
> +			    GAMTLBGUC_CLKGATE_DIS |
> +			    GAMTLBBLT_CLKGATE_DIS);
> +		wa_write_or(wal, UNSLCGCTL9444, GAMTLBGFXA0_CLKGATE_DIS |
> +			    GAMTLBGFXA1_CLKGATE_DIS |
> +			    GAMTLBCOMPA0_CLKGATE_DIS |
> +			    GAMTLBCOMPA1_CLKGATE_DIS |
> +			    GAMTLBCOMPB0_CLKGATE_DIS |
> +			    GAMTLBCOMPB1_CLKGATE_DIS |
> +			    GAMTLBCOMPC0_CLKGATE_DIS |
> +			    GAMTLBCOMPC1_CLKGATE_DIS |
> +			    GAMTLBCOMPD0_CLKGATE_DIS |
> +			    GAMTLBCOMPD1_CLKGATE_DIS |
> +			    GAMTLBMERT_CLKGATE_DIS   |
> +			    GAMTLBVEBOX3_CLKGATE_DIS |
> +			    GAMTLBVEBOX2_CLKGATE_DIS |
> +			    GAMTLBVEBOX1_CLKGATE_DIS |
> +			    GAMTLBVEBOX0_CLKGATE_DIS);
> +
> +		/* Wa_14010569222:dg2_g10 */
> +		wa_write_or(wal, UNSLICE_UNIT_LEVEL_CLKGATE,
> +			    GAMEDIA_CLKGATE_DIS);
> +
> +		/* Wa_14011028019:dg2_g10 */
> +		wa_write_or(wal, SSMCGCTL9530, RTFUNIT_CLKGATE_DIS);
> +	}
> +
> +	if (IS_DG2_GRAPHICS_STEP(gt->i915, G10, STEP_A0, STEP_B0) ||
> +	    IS_DG2_GRAPHICS_STEP(gt->i915, G11, STEP_A0, STEP_B0)) {
> +		/* Wa_14012362059:dg2 */
> +		wa_write_or(wal, GEN12_MERT_MOD_CTRL, FORCE_MISS_FTLB);
> +	}
> +
> +	/* Wa_1509235366:dg2 */
> +	wa_write_or(wal, GEN12_GAMCNTRL_CTRL, INVALIDATION_BROADCAST_MODE_DIS |
> +		    GLOBAL_INVALIDATION_MODE);
> +
> +	/* Wa_14014830051:dg2 */
> +	wa_write_clr(wal, SARB_CHICKEN1, COMP_CKN_IN);
> +}
> +
>  static void
>  gt_init_workarounds(struct intel_gt *gt, struct i915_wa_list *wal)
>  {
>  	struct drm_i915_private *i915 = gt->i915;
>  
> -	if (IS_XEHPSDV(i915))
> +	if (IS_DG2(i915))
> +		dg2_gt_workarounds_init(gt, wal);
> +	else if (IS_XEHPSDV(i915))
>  		xehpsdv_gt_workarounds_init(gt, wal);
>  	else if (IS_DG1(i915))
>  		dg1_gt_workarounds_init(gt, wal);
> @@ -1739,6 +1882,34 @@ static void xehpsdv_whitelist_build(struct intel_engine_cs *engine)
>  	allow_read_ctx_timestamp(engine);
>  }
>  
> +static void dg2_whitelist_build(struct intel_engine_cs *engine)
> +{
> +	struct i915_wa_list *w = &engine->whitelist;
> +
> +	allow_read_ctx_timestamp(engine);
> +
> +	switch (engine->class) {
> +	case RENDER_CLASS:
> +		/*
> +		 * Wa_1507100340:dg2_g10
> +		 *
> +		 * This covers 4 registers which are next to one another :
> +		 *   - PS_INVOCATION_COUNT
> +		 *   - PS_INVOCATION_COUNT_UDW
> +		 *   - PS_DEPTH_COUNT
> +		 *   - PS_DEPTH_COUNT_UDW
> +		 */
> +		if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_B0))
> +			whitelist_reg_ext(w, PS_INVOCATION_COUNT,
> +					  RING_FORCE_TO_NONPRIV_ACCESS_RD |
> +					  RING_FORCE_TO_NONPRIV_RANGE_4);
> +
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
>  void intel_engine_init_whitelist(struct intel_engine_cs *engine)
>  {
>  	struct drm_i915_private *i915 = engine->i915;
> @@ -1746,7 +1917,9 @@ void intel_engine_init_whitelist(struct intel_engine_cs *engine)
>  
>  	wa_init_start(w, "whitelist", engine->name);
>  
> -	if (IS_XEHPSDV(i915))
> +	if (IS_DG2(i915))
> +		dg2_whitelist_build(engine);
> +	else if (IS_XEHPSDV(i915))
>  		xehpsdv_whitelist_build(engine);
>  	else if (IS_DG1(i915))
>  		dg1_whitelist_build(engine);
> @@ -1826,6 +1999,105 @@ static void
>  rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
>  {
>  	struct drm_i915_private *i915 = engine->i915;
> +	u64 dss_mask = intel_sseu_get_subslices(&engine->gt->info.sseu, 0);

fi-snb-2600:

https://paste.debian.net/1219275

[    4.348876] intel_sseu_get_subslices:39 GEM_BUG_ON(slice >= sseu->max_slices)



-- 
Petri Latvala



> +
> +	if (IS_DG2_GRAPHICS_STEP(engine->i915, G11, STEP_A0, STEP_B0)) {
> +		/* Wa_14013392000:dg2_g11 */
> +		wa_masked_en(wal, GEN7_ROW_CHICKEN2, GEN12_ENABLE_LARGE_GRF_MODE);
> +
> +		/* Wa_16011620976:dg2_g11 */
> +		wa_write_or(wal, LSC_CHICKEN_BIT_0_UDW, DIS_CHAIN_2XSIMD8);
> +	}
> +
> +	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_B0) ||
> +	    IS_DG2_GRAPHICS_STEP(engine->i915, G11, STEP_A0, STEP_B0)) {
> +		/* Wa_14012419201:dg2 */
> +		wa_masked_en(wal, GEN9_ROW_CHICKEN4,
> +			     GEN12_DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX);
> +	}
> +
> +	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_B0, STEP_C0) ||
> +	    IS_DG2_G11(engine->i915)) {
> +		/*
> +		 * Wa_22012826095:dg2
> +		 * Wa_22013059131:dg2
> +		 */
> +		wa_write_clr_set(wal, LSC_CHICKEN_BIT_0_UDW,
> +				 MAXREQS_PER_BANK,
> +				 REG_FIELD_PREP(MAXREQS_PER_BANK, 2));
> +
> +		/* Wa_22013059131:dg2 */
> +		wa_write_or(wal, LSC_CHICKEN_BIT_0,
> +			    FORCE_1_SUB_MESSAGE_PER_FRAGMENT);
> +	}
> +
> +	/* Wa_1308578152:dg2_g10 when first gslice is fused off */
> +	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_B0, STEP_C0) &&
> +	    (dss_mask & GENMASK(GEN_DSS_PER_GSLICE - 1, 0)) == 0) {
> +		wa_masked_dis(wal, GEN12_CS_DEBUG_MODE1_CCCSUNIT_BE_COMMON,
> +			      GEN12_REPLAY_MODE_GRANULARITY);
> +	}
> +
> +	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_B0, STEP_FOREVER) ||
> +	    IS_DG2_G11(engine->i915)) {
> +		/* Wa_22013037850:dg2 */
> +		wa_write_or(wal, LSC_CHICKEN_BIT_0_UDW,
> +			    DISABLE_128B_EVICTION_COMMAND_UDW);
> +
> +		/* Wa_22012856258:dg2 */
> +		wa_masked_en(wal, GEN7_ROW_CHICKEN2,
> +			     GEN12_DISABLE_READ_SUPPRESSION);
> +
> +		/*
> +		 * Wa_22010960976:dg2
> +		 * Wa_14013347512:dg2
> +		 */
> +		wa_masked_dis(wal, GEN12_HDC_CHICKEN0,
> +			      LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK);
> +	}
> +
> +	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_B0)) {
> +		/*
> +		 * Wa_1608949956:dg2_g10
> +		 * Wa_14010198302:dg2_g10
> +		 */
> +		wa_masked_en(wal, GEN8_ROW_CHICKEN,
> +			     MDQ_ARBITRATION_MODE | UGM_BACKUP_MODE);
> +
> +		/*
> +		 * Wa_14010918519:dg2_g10
> +		 *
> +		 * LSC_CHICKEN_BIT_0 always reads back as 0 is this stepping,
> +		 * so ignoring verification.
> +		 */
> +		wa_add(wal, LSC_CHICKEN_BIT_0_UDW, 0,
> +		       FORCE_SLM_FENCE_SCOPE_TO_TILE | FORCE_UGM_FENCE_SCOPE_TO_TILE,
> +		       0, false);
> +	}
> +
> +	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_B0)) {
> +		/* Wa_22010430635:dg2 */
> +		wa_masked_en(wal,
> +			     GEN9_ROW_CHICKEN4,
> +			     GEN12_DISABLE_GRF_CLEAR);
> +
> +		/* Wa_14010648519:dg2 */
> +		wa_write_or(wal, XEHP_L3NODEARBCFG, XEHP_LNESPARE);
> +	}
> +
> +	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_A0, STEP_C0) ||
> +	    IS_DG2_G11(engine->i915)) {
> +		/* Wa_22012654132:dg2 */
> +		wa_add(wal, GEN10_CACHE_MODE_SS, 0,
> +		       _MASKED_BIT_ENABLE(ENABLE_PREFETCH_INTO_IC),
> +		       0 /* write-only, so skip validation */,
> +		       true);
> +	}
> +
> +	/* Wa_14013202645:dg2 */
> +	if (IS_DG2_GRAPHICS_STEP(engine->i915, G10, STEP_B0, STEP_C0) ||
> +	    IS_DG2_GRAPHICS_STEP(engine->i915, G11, STEP_A0, STEP_B0))
> +		wa_write_or(wal, RT_CTRL, DIS_NULL_QUERY);
>  
>  	if (IS_DG1_GRAPHICS_STEP(i915, STEP_A0, STEP_B0) ||
>  	    IS_TGL_UY_GRAPHICS_STEP(i915, STEP_A0, STEP_B0)) {
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index b806ad4bdeca..ee39d6bd0f3c 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -502,6 +502,11 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
>  #define   INVALIDATION_BROADCAST_MODE_DIS	REG_BIT(12)
>  #define   GLOBAL_INVALIDATION_MODE		REG_BIT(2)
>  
> +#define GEN12_GAMSTLB_CTRL		_MMIO(0xcf4c)
> +#define   CONTROL_BLOCK_CLKGATE_DIS	REG_BIT(12)
> +#define   EGRESS_BLOCK_CLKGATE_DIS	REG_BIT(11)
> +#define   TAG_BLOCK_CLKGATE_DIS		REG_BIT(7)
> +
>  #define GEN12_MERT_MOD_CTRL		_MMIO(0xcf28)
>  #define   FORCE_MISS_FTLB		REG_BIT(3)
>  
> @@ -777,6 +782,9 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
>  #define EU_PERF_CNTL5	    _MMIO(0xe55c)
>  #define EU_PERF_CNTL6	    _MMIO(0xe65c)
>  
> +#define RT_CTRL			_MMIO(0xe530)
> +#define  DIS_NULL_QUERY		REG_BIT(10)
> +
>  /*
>   * OA Boolean state
>   */
> @@ -2781,6 +2789,9 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
>  #define VDBOX_CGCTL3F10(base)		_MMIO((base) + 0x3f10)
>  #define   IECPUNIT_CLKGATE_DIS		REG_BIT(22)
>  
> +#define VDBOX_CGCTL3F18(base)		_MMIO((base) + 0x3f18)
> +#define   ALNUNIT_CLKGATE_DIS		REG_BIT(13)
> +
>  #define ERROR_GEN6	_MMIO(0x40a0)
>  #define GEN7_ERR_INT	_MMIO(0x44040)
>  #define   ERR_INT_POISON		(1 << 31)
> @@ -3124,7 +3135,8 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
>  #define GEN9_RCS_FE_FSM2 _MMIO(0x22a4)
>  
>  #define GEN10_CACHE_MODE_SS			_MMIO(0xe420)
> -#define   FLOAT_BLEND_OPTIMIZATION_ENABLE	(1 << 4)
> +#define   ENABLE_PREFETCH_INTO_IC		REG_BIT(3)
> +#define   FLOAT_BLEND_OPTIMIZATION_ENABLE	REG_BIT(4)
>  
>  /* Fuse readout registers for GT */
>  #define HSW_PAVP_FUSE1			_MMIO(0x911C)
> @@ -4333,18 +4345,25 @@ enum {
>  #define  SARBUNIT_CLKGATE_DIS		(1 << 5)
>  #define  RCCUNIT_CLKGATE_DIS		(1 << 7)
>  #define  MSCUNIT_CLKGATE_DIS		(1 << 10)
> +#define  NODEDSS_CLKGATE_DIS		REG_BIT(12)
>  #define  L3_CLKGATE_DIS			REG_BIT(16)
>  #define  L3_CR2X_CLKGATE_DIS		REG_BIT(17)
>  
>  #define SUBSLICE_UNIT_LEVEL_CLKGATE	_MMIO(0x9524)
> -#define  GWUNIT_CLKGATE_DIS		(1 << 16)
> +#define   DSS_ROUTER_CLKGATE_DIS	REG_BIT(28)
> +#define   GWUNIT_CLKGATE_DIS		REG_BIT(16)
>  
>  #define SUBSLICE_UNIT_LEVEL_CLKGATE2	_MMIO(0x9528)
>  #define  CPSSUNIT_CLKGATE_DIS		REG_BIT(9)
>  
> +#define SSMCGCTL9530			_MMIO(0x9530)
> +#define   RTFUNIT_CLKGATE_DIS		REG_BIT(18)
> +
>  #define UNSLICE_UNIT_LEVEL_CLKGATE	_MMIO(0x9434)
>  #define   VFUNIT_CLKGATE_DIS		REG_BIT(20)
> -#define   TSGUNIT_CLKGATE_DIS		REG_BIT(17)
> +#define   TSGUNIT_CLKGATE_DIS		REG_BIT(17) /* XEHPSDV */
> +#define   CG3DDISCFEG_CLKGATE_DIS	REG_BIT(17) /* DG2 */
> +#define   GAMEDIA_CLKGATE_DIS		REG_BIT(11)
>  #define   HSUNIT_CLKGATE_DIS		REG_BIT(8)
>  #define   VSUNIT_CLKGATE_DIS		REG_BIT(3)
>  
> @@ -8404,6 +8423,9 @@ enum {
>  #define GEN9_CTX_PREEMPT_REG		_MMIO(0x2248)
>  #define   GEN12_DISABLE_POSH_BUSY_FF_DOP_CG REG_BIT(11)
>  
> +#define GEN12_CS_DEBUG_MODE1_CCCSUNIT_BE_COMMON		_MMIO(0x20EC)
> +#define   GEN12_REPLAY_MODE_GRANULARITY			REG_BIT(0)
> +
>  #define GEN8_CS_CHICKEN1		_MMIO(0x2580)
>  #define GEN9_PREEMPT_3D_OBJECT_LEVEL		(1 << 0)
>  #define GEN9_PREEMPT_GPGPU_LEVEL(hi, lo)	(((hi) << 2) | ((lo) << 1))
> @@ -8427,9 +8449,10 @@ enum {
>    #define GEN8_ERRDETBCTRL (1 << 9)
>  
>  #define GEN11_COMMON_SLICE_CHICKEN3			_MMIO(0x7304)
> -  #define DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN	REG_BIT(12)
> -  #define GEN11_BLEND_EMB_FIX_DISABLE_IN_RCC		REG_BIT(11)
> -  #define GEN12_DISABLE_CPS_AWARE_COLOR_PIPE		REG_BIT(9)
> +#define   DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN	REG_BIT(12)
> +#define   XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE		REG_BIT(12)
> +#define   GEN11_BLEND_EMB_FIX_DISABLE_IN_RCC		REG_BIT(11)
> +#define   GEN12_DISABLE_CPS_AWARE_COLOR_PIPE		REG_BIT(9)
>  
>  #define HIZ_CHICKEN					_MMIO(0x7018)
>  # define CHV_HZ_8X8_MODE_IN_1X				REG_BIT(15)
> @@ -8493,6 +8516,12 @@ enum {
>  #define  HDC_FORCE_NON_COHERENT			(1 << 4)
>  #define  HDC_BARRIER_PERFORMANCE_DISABLE	(1 << 10)
>  
> +#define GEN12_HDC_CHICKEN0					_MMIO(0xE5F0)
> +#define   LSC_L1_FLUSH_CTL_3D_DATAPORT_FLUSH_EVENTS_MASK	REG_GENMASK(13, 11)
> +
> +#define SARB_CHICKEN1				_MMIO(0xe90c)
> +#define   COMP_CKN_IN				REG_GENMASK(30, 29)
> +
>  #define GEN8_HDC_CHICKEN1			_MMIO(0x7304)
>  
>  /* GEN9 chicken */
> @@ -8523,6 +8552,10 @@ enum {
>  #define   PIXEL_ROUNDING_TRUNC_FB_PASSTHRU 	(1 << 15)
>  #define   PER_PIXEL_ALPHA_BYPASS_EN		(1 << 7)
>  
> +#define VFLSKPD				_MMIO(0x62a8)
> +#define   DIS_OVER_FETCH_CACHE		REG_BIT(1)
> +#define   DIS_MULT_MISS_RD_SQUASH	REG_BIT(0)
> +
>  #define FF_MODE2			_MMIO(0x6604)
>  #define   FF_MODE2_GS_TIMER_MASK	REG_GENMASK(31, 24)
>  #define   FF_MODE2_GS_TIMER_224		REG_FIELD_PREP(FF_MODE2_GS_TIMER_MASK, 224)
> @@ -9346,6 +9379,9 @@ enum {
>  #define   GEN8_SDEUNIT_CLOCK_GATE_DISABLE	(1 << 14)
>  #define   GEN8_HDCUNIT_CLOCK_GATE_DISABLE_HDCREQ (1 << 28)
>  
> +#define UNSLCGCTL9430				_MMIO(0x9430)
> +#define   MSQDUNIT_CLKGATE_DIS			REG_BIT(3)
> +
>  #define GEN6_GFXPAUSE				_MMIO(0xA000)
>  #define GEN6_RPNSWREQ				_MMIO(0xA008)
>  #define   GEN6_TURBO_DISABLE			(1 << 31)
> @@ -9661,24 +9697,39 @@ enum {
>  #define   GEN9_CCS_TLB_PREFETCH_ENABLE	(1 << 3)
>  
>  #define GEN8_ROW_CHICKEN		_MMIO(0xe4f0)
> -#define   FLOW_CONTROL_ENABLE		(1 << 15)
> -#define   PARTIAL_INSTRUCTION_SHOOTDOWN_DISABLE	(1 << 8)
> -#define   STALL_DOP_GATING_DISABLE		(1 << 5)
> -#define   THROTTLE_12_5				(7 << 2)
> -#define   DISABLE_EARLY_EOT			(1 << 1)
> +#define   FLOW_CONTROL_ENABLE			REG_BIT(15)
> +#define   UGM_BACKUP_MODE			REG_BIT(13)
> +#define   MDQ_ARBITRATION_MODE			REG_BIT(12)
> +#define   PARTIAL_INSTRUCTION_SHOOTDOWN_DISABLE	REG_BIT(8)
> +#define   STALL_DOP_GATING_DISABLE		REG_BIT(5)
> +#define   THROTTLE_12_5				REG_GENMASK(4, 2)
> +#define   DISABLE_EARLY_EOT			REG_BIT(1)
>  
>  #define GEN7_ROW_CHICKEN2			_MMIO(0xe4f4)
> +#define   GEN12_DISABLE_READ_SUPPRESSION	REG_BIT(15)
>  #define   GEN12_DISABLE_EARLY_READ		REG_BIT(14)
> +#define   GEN12_ENABLE_LARGE_GRF_MODE		REG_BIT(12)
>  #define   GEN12_PUSH_CONST_DEREF_HOLD_DIS	REG_BIT(8)
>  
> +#define LSC_CHICKEN_BIT_0			_MMIO(0xe7c8)
> +#define   FORCE_1_SUB_MESSAGE_PER_FRAGMENT	REG_BIT(15)
> +#define LSC_CHICKEN_BIT_0_UDW			_MMIO(0xe7c8 + 4)
> +#define   DIS_CHAIN_2XSIMD8			REG_BIT(55 - 32)
> +#define   FORCE_SLM_FENCE_SCOPE_TO_TILE		REG_BIT(42 - 32)
> +#define   FORCE_UGM_FENCE_SCOPE_TO_TILE		REG_BIT(41 - 32)
> +#define   MAXREQS_PER_BANK			REG_GENMASK(39 - 32, 37 - 32)
> +#define   DISABLE_128B_EVICTION_COMMAND_UDW	REG_BIT(36 - 32)
> +
>  #define GEN7_ROW_CHICKEN2_GT2		_MMIO(0xf4f4)
>  #define   DOP_CLOCK_GATING_DISABLE	(1 << 0)
>  #define   PUSH_CONSTANT_DEREF_DISABLE	(1 << 8)
>  #define   GEN11_TDL_CLOCK_GATING_FIX_DISABLE	(1 << 1)
>  
> -#define GEN9_ROW_CHICKEN4		_MMIO(0xe48c)
> -#define   GEN12_DISABLE_TDL_PUSH	REG_BIT(9)
> -#define   GEN11_DIS_PICK_2ND_EU		REG_BIT(7)
> +#define GEN9_ROW_CHICKEN4				_MMIO(0xe48c)
> +#define   GEN12_DISABLE_GRF_CLEAR			REG_BIT(13)
> +#define   GEN12_DISABLE_TDL_PUSH			REG_BIT(9)
> +#define   GEN11_DIS_PICK_2ND_EU				REG_BIT(7)
> +#define   GEN12_DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX	REG_BIT(4)
>  
>  #define HSW_ROW_CHICKEN3		_MMIO(0xe49c)
>  #define  HSW_ROW_CHICKEN3_L3_GLOBAL_ATOMICS_DISABLE    (1 << 6)
> @@ -9693,9 +9744,10 @@ enum {
>  #define   GEN8_SAMPLER_POWER_BYPASS_DIS	(1 << 1)
>  
>  #define GEN9_HALF_SLICE_CHICKEN7	_MMIO(0xe194)
> -#define   GEN9_SAMPLER_HASH_COMPRESSED_READ_ADDR	(1 << 8)
> -#define   GEN9_ENABLE_YV12_BUGFIX	(1 << 4)
> -#define   GEN9_ENABLE_GPGPU_PREEMPTION	(1 << 2)
> +#define   DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA	REG_BIT(15)
> +#define   GEN9_SAMPLER_HASH_COMPRESSED_READ_ADDR	REG_BIT(8)
> +#define   GEN9_ENABLE_YV12_BUGFIX			REG_BIT(4)
> +#define   GEN9_ENABLE_GPGPU_PREEMPTION			REG_BIT(2)
>  
>  /* Audio */
>  #define G4X_AUD_VID_DID			_MMIO(DISPLAY_MMIO_BASE(dev_priv) + 0x62020)
> @@ -12519,12 +12571,17 @@ enum skl_power_gate {
>  #define   PMFLUSH_GAPL3UNBLOCK		(1 << 21)
>  #define   PMFLUSHDONE_LNEBLK		(1 << 22)
>  
> +#define XEHP_L3NODEARBCFG		_MMIO(0xb0b4)
> +#define   XEHP_LNESPARE			REG_BIT(19)
> +
>  #define GEN12_GLOBAL_MOCS(i)	_MMIO(0x4000 + (i) * 4) /* Global MOCS regs */
>  
>  #define GEN12_GSMBASE			_MMIO(0x108100)
>  #define GEN12_DSMBASE			_MMIO(0x1080C0)
>  
>  #define XEHP_CLOCK_GATE_DIS		_MMIO(0x101014)
> +#define   SGSI_SIDECLK_DIS		REG_BIT(17)
> +#define   SGGI_DIS			REG_BIT(15)
>  #define   SGR_DIS			REG_BIT(13)
>  
>  /* gamt regs */
> @@ -12903,4 +12960,7 @@ enum skl_power_gate {
>  #define CLKGATE_DIS_MISC			_MMIO(0x46534)
>  #define  CLKGATE_DIS_MISC_DMASC_GATING_DIS	REG_BIT(21)
>  
> +#define SLICE_COMMON_ECO_CHICKEN1		_MMIO(0x731C)
> +#define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE	REG_BIT(14)
> +
>  #endif /* _I915_REG_H_ */
> diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
> index 16fa3306d83d..a1d9a6ac3e49 100644
> --- a/drivers/gpu/drm/i915/intel_pm.c
> +++ b/drivers/gpu/drm/i915/intel_pm.c
> @@ -7486,6 +7486,22 @@ static void xehpsdv_init_clock_gating(struct drm_i915_private *dev_priv)
>  		intel_uncore_rmw(&dev_priv->uncore, XEHP_CLOCK_GATE_DIS, 0, SGR_DIS);
>  }
>  
> +static void dg2_init_clock_gating(struct drm_i915_private *i915)
> +{
> +	/* Wa_22010954014:dg2_g10 */
> +	if (IS_DG2_G10(i915))
> +		intel_uncore_rmw(&i915->uncore, XEHP_CLOCK_GATE_DIS, 0,
> +				 SGSI_SIDECLK_DIS);
> +
> +	/*
> +	 * Wa_14010733611:dg2_g10
> +	 * Wa_22010146351:dg2_g10
> +	 */
> +	if (IS_DG2_GRAPHICS_STEP(i915, G10, STEP_A0, STEP_B0))
> +		intel_uncore_rmw(&i915->uncore, XEHP_CLOCK_GATE_DIS, 0,
> +				 SGR_DIS | SGGI_DIS);
> +}
> +
>  static void cnp_init_clock_gating(struct drm_i915_private *dev_priv)
>  {
>  	if (!HAS_PCH_CNP(dev_priv))
> @@ -7896,6 +7912,7 @@ static const struct drm_i915_clock_gating_funcs platform##_clock_gating_funcs =
>  	.init_clock_gating = platform##_init_clock_gating,		\
>  }
>  
> +CG_FUNCS(dg2);
>  CG_FUNCS(xehpsdv);
>  CG_FUNCS(adlp);
>  CG_FUNCS(dg1);
> @@ -7933,7 +7950,9 @@ CG_FUNCS(nop);
>   */
>  void intel_init_clock_gating_hooks(struct drm_i915_private *dev_priv)
>  {
> -	if (IS_XEHPSDV(dev_priv))
> +	if (IS_DG2(dev_priv))
> +		dev_priv->clock_gating_funcs = &dg2_clock_gating_funcs;
> +	else if (IS_XEHPSDV(dev_priv))
>  		dev_priv->clock_gating_funcs = &xehpsdv_clock_gating_funcs;
>  	else if (IS_ALDERLAKE_P(dev_priv))
>  		dev_priv->clock_gating_funcs = &adlp_clock_gating_funcs;
> -- 
> 2.33.0
> 
