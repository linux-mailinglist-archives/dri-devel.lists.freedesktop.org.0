Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6444E27EC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:41:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBD510E391;
	Mon, 21 Mar 2022 13:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD0A10E376;
 Mon, 21 Mar 2022 13:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647870097; x=1679406097;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nKx674R/UbSLWwjFeVOusJOFQmDBeXIu1XuBfAsJMLY=;
 b=L+DHBccIAS2EuEbF/uCR8dMDNt7aRt3iCD9vcm2NV9aL1d7h67youS8D
 cEMxCAgfYkRNT9WpgX/6uF4sPysML8fIQaDtlwOhJGqh6B0UdAxEJTfMC
 2fgORzyPhcvfSpiqMYP+6wo/dk0g8UsZF34hQyj534TmlP+F9lLZiaCkz
 zitz8bfQLsIUQ+dQXYfdHxwCGG+Lo3vZZUHiYGYtHAjh/mFwk/2soHQCr
 IwRPvVCAC857unxGFX60nV49DtVeLsVlDkv/MwMserxR2/yieOxMFBnpa
 9ADZeWVtV6UzgZ7W6jSLoNOJAYwJpwUxQBRrqHBI+7nnZ3qkREOVp1VI8 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="237496840"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="237496840"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 06:41:37 -0700
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="559874923"
Received: from atnordon-mobl1.ger.corp.intel.com (HELO [10.213.230.67])
 ([10.213.230.67])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 06:41:35 -0700
Message-ID: <be6e5c3c-93df-f664-f7d2-89f4ce0d8c7f@linux.intel.com>
Date: Mon, 21 Mar 2022 13:41:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: avoid concurrent writes to aux_inv
Content-Language: en-US
To: fei.yang@intel.com, intel-gfx@lists.freedesktop.org
References: <20220318180825.3524125-1-fei.yang@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220318180825.3524125-1-fei.yang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 18/03/2022 18:08, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> GPU hangs have been observed when multiple engines write to the
> same aux_inv register at the same time. To avoid this each engine
> should only invalidate its own auxiliary table. The function
> gen12_emit_flush_xcs() currently invalidate the auxiliary table for
> all engines because the rq->engine is not necessarily the engine
> eventually carrying out the request, and potentially the engine
> could even be a virtual one (with engine->instance being -1).
> With the MMIO remap feature, we can actually set bit 17 of MI_LRI
> instruction and let the hardware to figure out the local aux_inv
> register at runtime to avoid invalidating auxiliary table for all
> engines.
> 
> Bspec: 45728
> 
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 44 +++++---------------
>   drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  1 +
>   2 files changed, 11 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 36148887c699..6e83ac06aaf6 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -165,30 +165,6 @@ static u32 preparser_disable(bool state)
>   	return MI_ARB_CHECK | 1 << 8 | state;
>   }
>   
> -static i915_reg_t aux_inv_reg(const struct intel_engine_cs *engine)
> -{
> -	static const i915_reg_t vd[] = {
> -		GEN12_VD0_AUX_NV,
> -		GEN12_VD1_AUX_NV,
> -		GEN12_VD2_AUX_NV,
> -		GEN12_VD3_AUX_NV,
> -	};
> -
> -	static const i915_reg_t ve[] = {
> -		GEN12_VE0_AUX_NV,
> -		GEN12_VE1_AUX_NV,
> -	};
> -
> -	if (engine->class == VIDEO_DECODE_CLASS)
> -		return vd[engine->instance];
> -
> -	if (engine->class == VIDEO_ENHANCEMENT_CLASS)
> -		return ve[engine->instance];
> -
> -	GEM_BUG_ON("unknown aux_inv reg\n");
> -	return INVALID_MMIO_REG;
> -}
> -
>   static u32 *gen12_emit_aux_table_inv(const i915_reg_t inv_reg, u32 *cs)
>   {
>   	*cs++ = MI_LOAD_REGISTER_IMM(1);
> @@ -293,10 +269,12 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
>   	if (mode & EMIT_INVALIDATE) {
>   		cmd += 2;
>   
> -		if (!HAS_FLAT_CCS(rq->engine->i915)) {
> +		if (!HAS_FLAT_CCS(rq->engine->i915) &&
> +		    (rq->engine->class == VIDEO_DECODE_CLASS ||
> +		     rq->engine->class == VIDEO_ENHANCEMENT_CLASS)) {
>   			aux_inv = rq->engine->mask & ~BIT(BCS0);
>   			if (aux_inv)
> -				cmd += 2 * hweight32(aux_inv) + 2;
> +				cmd += 4;
>   		}
>   	}
>   
> @@ -329,14 +307,12 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
>   	*cs++ = 0; /* value */
>   
>   	if (aux_inv) { /* hsdes: 1809175790 */
> -		struct intel_engine_cs *engine;
> -		unsigned int tmp;
> -
> -		*cs++ = MI_LOAD_REGISTER_IMM(hweight32(aux_inv));
> -		for_each_engine_masked(engine, rq->engine->gt, aux_inv, tmp) {
> -			*cs++ = i915_mmio_reg_offset(aux_inv_reg(engine));
> -			*cs++ = AUX_INV;
> -		}
> +		*cs++ = MI_LOAD_REGISTER_IMM(1) | MI_LRI_MMIO_REMAP_EN;
> +		if (rq->engine->class == VIDEO_DECODE_CLASS)
> +			*cs++ = i915_mmio_reg_offset(GEN12_VD0_AUX_NV);
> +		else
> +			*cs++ = i915_mmio_reg_offset(GEN12_VE0_AUX_NV);
> +		*cs++ = AUX_INV;
>   		*cs++ = MI_NOOP;
>   	}
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> index d112ffd56418..4243be030bc1 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> @@ -144,6 +144,7 @@
>   #define MI_LOAD_REGISTER_IMM(x)	MI_INSTR(0x22, 2*(x)-1)
>   /* Gen11+. addr = base + (ctx_restore ? offset & GENMASK(12,2) : offset) */
>   #define   MI_LRI_LRM_CS_MMIO		REG_BIT(19)
> +#define   MI_LRI_MMIO_REMAP_EN		REG_BIT(17)
>   #define   MI_LRI_FORCE_POSTED		(1<<12)
>   #define MI_LOAD_REGISTER_IMM_MAX_REGS (126)
>   #define MI_STORE_REGISTER_MEM        MI_INSTR(0x24, 1)

LGTM.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Affects igpus from TGL onwards? If so:

Cc: stable@vger.kernel.org # v5.7+

?

Backporting might end up fun..

Regards,

Tvrtko
