Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F6B53308B
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 20:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08D810FB73;
	Tue, 24 May 2022 18:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A9310FB6A;
 Tue, 24 May 2022 18:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653417465; x=1684953465;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=cmtstLFtMjQjnYCVDkCYe2CLLbbe1UdeGBpS1g5JhJE=;
 b=k4Er3QZ0Sp9jWhQhsDhiHSh2/ZGpmaK5+/f2aRwIlCV4oyJoL/Fkwpmw
 OQc0wKPvneR2ZCUochTlelnNhIrhrjI4cSArYYwmy097AfTMx/G6xz0uo
 HWhpzfoJWqgVqKI5F8kzrQD5IIRPn1uUx8GEOa+IhOAzDgIqi/U5j8xf5
 gqFHX+EzkxaczsvDdc12Fcpox9kov4APrGiA9W/z+tSe4uplIX3B/176g
 TzbBWG30Acuok9oqglhpGFvUitZ+k7mbph8D5zlVQOJqkAlwqUWPo1+KN
 gWNU6d1OeoctbA/rR30ngZnAYnvcRwi6WAM9pxu7YK/zffgDjcdD0jkRe w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10357"; a="272442830"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="272442830"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 11:37:45 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="526528722"
Received: from iucastil-mobl1.amr.corp.intel.com (HELO msatwood-mobl)
 ([10.212.91.173])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 11:37:44 -0700
Date: Tue, 24 May 2022 11:37:42 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v3 3/5] drm/i915/pvc: Remove additional 3D
 flags from PIPE_CONTROL
Message-ID: <Yo0l9naZKE97B2Uj@msatwood-mobl>
References: <20220511060228.1179450-1-matthew.d.roper@intel.com>
 <20220511060228.1179450-4-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220511060228.1179450-4-matthew.d.roper@intel.com>
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

On Tue, May 10, 2022 at 11:02:26PM -0700, Matt Roper wrote:
> From: Stuart Summers <stuart.summers@intel.com>
> 
> Although we already strip 3D-specific flags from PIPE_CONTROL
> instructions when submitting to a compute engine, there are some
> additional flags that need to be removed when the platform as a whole
> lacks a 3D pipeline.  Add those restrictions here.
> 
> v2:
>  - Replace LACKS_3D_PIPELINE checks with !HAS_3D_PIPELINE and add
>    has_3d_pipeline to all platforms except PVC.  (Lucas)
> 
> Bspec: 47112
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 18 ++++++++++++------
>  drivers/gpu/drm/i915/gt/intel_gpu_commands.h | 15 +++++++++++++--
>  drivers/gpu/drm/i915/i915_drv.h              |  2 ++
>  drivers/gpu/drm/i915/i915_pci.c              | 10 ++++++++++
>  drivers/gpu/drm/i915/intel_device_info.h     |  1 +
>  5 files changed, 38 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index daa1a61972f4..98645797962f 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -197,8 +197,10 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>  
>  		flags |= PIPE_CONTROL_CS_STALL;
>  
> -		if (engine->class == COMPUTE_CLASS)
> -			flags &= ~PIPE_CONTROL_3D_FLAGS;
> +		if (!HAS_3D_PIPELINE(engine->i915))
> +			flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
> +		else if (engine->class == COMPUTE_CLASS)
> +			flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
>  
>  		cs = intel_ring_begin(rq, 6);
>  		if (IS_ERR(cs))
> @@ -227,8 +229,10 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>  
>  		flags |= PIPE_CONTROL_CS_STALL;
>  
> -		if (engine->class == COMPUTE_CLASS)
> -			flags &= ~PIPE_CONTROL_3D_FLAGS;
> +		if (!HAS_3D_PIPELINE(engine->i915))
> +			flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
> +		else if (engine->class == COMPUTE_CLASS)
> +			flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
>  
>  		if (!HAS_FLAT_CCS(rq->engine->i915))
>  			count = 8 + 4;
> @@ -717,8 +721,10 @@ u32 *gen12_emit_fini_breadcrumb_rcs(struct i915_request *rq, u32 *cs)
>  		/* Wa_1409600907 */
>  		flags |= PIPE_CONTROL_DEPTH_STALL;
>  
> -	if (rq->engine->class == COMPUTE_CLASS)
> -		flags &= ~PIPE_CONTROL_3D_FLAGS;
> +	if (!HAS_3D_PIPELINE(rq->engine->i915))
> +		flags &= ~PIPE_CONTROL_3D_ARCH_FLAGS;
> +	else if (rq->engine->class == COMPUTE_CLASS)
> +		flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
>  
>  	cs = gen12_emit_ggtt_write_rcs(cs,
>  				       rq->fence.seqno,
> diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> index 556bca3be804..964fe376c7fa 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> @@ -288,8 +288,11 @@
>  #define   PIPE_CONTROL_DEPTH_CACHE_FLUSH		(1<<0)
>  #define   PIPE_CONTROL_GLOBAL_GTT (1<<2) /* in addr dword */
>  
> -/* 3D-related flags can't be set on compute engine */
> -#define PIPE_CONTROL_3D_FLAGS (\
> +/*
> + * 3D-related flags that can't be set on _engines_ that lack access to the 3D
> + * pipeline (i.e., CCS engines).
> + */
> +#define PIPE_CONTROL_3D_ENGINE_FLAGS (\
>  		PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH | \
>  		PIPE_CONTROL_DEPTH_CACHE_FLUSH | \
>  		PIPE_CONTROL_TILE_CACHE_FLUSH | \
> @@ -300,6 +303,14 @@
>  		PIPE_CONTROL_VF_CACHE_INVALIDATE | \
>  		PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET)
>  
> +/* 3D-related flags that can't be set on _platforms_ that lack a 3D pipeline */
> +#define PIPE_CONTROL_3D_ARCH_FLAGS ( \
> +		PIPE_CONTROL_3D_ENGINE_FLAGS | \
> +		PIPE_CONTROL_INDIRECT_STATE_DISABLE | \
> +		PIPE_CONTROL_FLUSH_ENABLE | \
> +		PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE | \
> +		PIPE_CONTROL_DC_FLUSH_ENABLE)
> +
>  #define MI_MATH(x)			MI_INSTR(0x1a, (x) - 1)
>  #define MI_MATH_INSTR(opcode, op1, op2) ((opcode) << 20 | (op1) << 10 | (op2))
>  /* Opcodes for MI_MATH_INSTR */
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 10f273800645..54e9c2a5493d 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1405,6 +1405,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  
>  #define HAS_MBUS_JOINING(i915) (IS_ALDERLAKE_P(i915))
>  
> +#define HAS_3D_PIPELINE(i915)	(INTEL_INFO(i915)->has_3d_pipeline)
> +
>  /* i915_gem.c */
>  void i915_gem_init_early(struct drm_i915_private *dev_priv);
>  void i915_gem_cleanup_early(struct drm_i915_private *dev_priv);
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index d8d893bafa51..de44dc04c27f 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -171,6 +171,7 @@
>  	.display.overlay_needs_physical = 1, \
>  	.display.has_gmch = 1, \
>  	.gpu_reset_clobbers_display = true, \
> +	.has_3d_pipeline = 1, \
>  	.hws_needs_physical = 1, \
>  	.unfenced_needs_alignment = 1, \
>  	.platform_engine_mask = BIT(RCS0), \
> @@ -190,6 +191,7 @@
>  	.display.has_overlay = 1, \
>  	.display.overlay_needs_physical = 1, \
>  	.display.has_gmch = 1, \
> +	.has_3d_pipeline = 1, \
>  	.gpu_reset_clobbers_display = true, \
>  	.hws_needs_physical = 1, \
>  	.unfenced_needs_alignment = 1, \
> @@ -232,6 +234,7 @@ static const struct intel_device_info i865g_info = {
>  	.display.has_gmch = 1, \
>  	.gpu_reset_clobbers_display = true, \
>  	.platform_engine_mask = BIT(RCS0), \
> +	.has_3d_pipeline = 1, \
>  	.has_snoop = true, \
>  	.has_coherent_ggtt = true, \
>  	.dma_mask_size = 32, \
> @@ -323,6 +326,7 @@ static const struct intel_device_info pnv_m_info = {
>  	.display.has_gmch = 1, \
>  	.gpu_reset_clobbers_display = true, \
>  	.platform_engine_mask = BIT(RCS0), \
> +	.has_3d_pipeline = 1, \
>  	.has_snoop = true, \
>  	.has_coherent_ggtt = true, \
>  	.dma_mask_size = 36, \
> @@ -374,6 +378,7 @@ static const struct intel_device_info gm45_info = {
>  	.display.cpu_transcoder_mask = BIT(TRANSCODER_A) | BIT(TRANSCODER_B), \
>  	.display.has_hotplug = 1, \
>  	.platform_engine_mask = BIT(RCS0) | BIT(VCS0), \
> +	.has_3d_pipeline = 1, \
>  	.has_snoop = true, \
>  	.has_coherent_ggtt = true, \
>  	.dma_mask_size = 36, \
> @@ -403,6 +408,7 @@ static const struct intel_device_info ilk_m_info = {
>  	.display.has_hotplug = 1, \
>  	.display.fbc_mask = BIT(INTEL_FBC_A), \
>  	.platform_engine_mask = BIT(RCS0) | BIT(VCS0) | BIT(BCS0), \
> +	.has_3d_pipeline = 1, \
>  	.has_coherent_ggtt = true, \
>  	.has_llc = 1, \
>  	.has_rc6p = 1, \
> @@ -453,6 +459,7 @@ static const struct intel_device_info snb_m_gt2_info = {
>  	.display.has_hotplug = 1, \
>  	.display.fbc_mask = BIT(INTEL_FBC_A), \
>  	.platform_engine_mask = BIT(RCS0) | BIT(VCS0) | BIT(BCS0), \
> +	.has_3d_pipeline = 1, \
>  	.has_coherent_ggtt = true, \
>  	.has_llc = 1, \
>  	.has_rc6p = 1, \
> @@ -679,6 +686,7 @@ static const struct intel_device_info skl_gt4_info = {
>  	.display.cpu_transcoder_mask = BIT(TRANSCODER_A) | BIT(TRANSCODER_B) | \
>  		BIT(TRANSCODER_C) | BIT(TRANSCODER_EDP) | \
>  		BIT(TRANSCODER_DSI_A) | BIT(TRANSCODER_DSI_C), \
> +	.has_3d_pipeline = 1, \
>  	.has_64bit_reloc = 1, \
>  	.display.has_fpga_dbg = 1, \
>  	.display.fbc_mask = BIT(INTEL_FBC_A), \
> @@ -982,6 +990,7 @@ static const struct intel_device_info adl_p_info = {
>  	.graphics.rel = 50, \
>  	XE_HP_PAGE_SIZES, \
>  	.dma_mask_size = 46, \
> +	.has_3d_pipeline = 1, \
>  	.has_64bit_reloc = 1, \
>  	.has_flat_ccs = 1, \
>  	.has_global_mocs = 1, \
> @@ -1050,6 +1059,7 @@ static const struct intel_device_info ats_m_info = {
>  #define XE_HPC_FEATURES \
>  	XE_HP_FEATURES, \
>  	.dma_mask_size = 52, \
> +	.has_3d_pipeline = 0, \
>  	.has_l3_ccs_read = 1
>  
>  __maybe_unused
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> index 60fc35ae81df..415f028d8970 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -142,6 +142,7 @@ enum intel_ppgtt_type {
>  	func(has_64k_pages); \
>  	func(needs_compact_pt); \
>  	func(gpu_reset_clobbers_display); \
> +	func(has_3d_pipeline); \
>  	func(has_4tile); \
>  	func(has_flat_ccs); \
>  	func(has_global_mocs); \
> -- 
> 2.35.1
> 
