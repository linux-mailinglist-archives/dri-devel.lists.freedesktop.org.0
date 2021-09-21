Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA08413584
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 16:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF2F6E9C5;
	Tue, 21 Sep 2021 14:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07F206E9C3;
 Tue, 21 Sep 2021 14:40:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="221492268"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="221492268"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 07:40:16 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="556965355"
Received: from ekyne-mobl.ger.corp.intel.com (HELO [10.213.200.64])
 ([10.213.200.64])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 07:40:14 -0700
Subject: Re: [PATCH v2 5/6] drm/i915/uncore: Drop gen11 mmio read handlers
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
References: <20210910201030.3436066-1-matthew.d.roper@intel.com>
 <20210910201030.3436066-6-matthew.d.roper@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <e7268aa1-727e-82b6-de7d-50e0827acd07@linux.intel.com>
Date: Tue, 21 Sep 2021 15:40:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210910201030.3436066-6-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/09/2021 21:10, Matt Roper wrote:
> Consolidate down to just a single 'fwtable' implementation.  For reads
> we don't need to worry about shadow tables.  Also, the
> NEEDS_FORCE_WAKE() check we previously had in the fwtable implementation
> can be dropped --- if a register is outside that range on one of the old
> platforms, then it won't belong to any forcewake range and 0 will be
> returned anyway.
> 
> v2:
>   - Restore NEEDS_FORCE_WAKE() check.  (Chris, Tvrtko)

I started liking rewording the commit message when the revision log 
starts contradicting it, but it is just a suggestion.

> 
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/intel_uncore.c | 40 ++++++++++++-----------------
>   1 file changed, 17 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index bfb2a6337f9d..10f124297e7c 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -935,9 +935,6 @@ static const struct intel_forcewake_range __vlv_fw_ranges[] = {
>   	__fwd; \
>   })
>   
> -#define __gen11_fwtable_reg_read_fw_domains(uncore, offset) \
> -	find_fw_domain(uncore, offset)
> -
>   /* *Must* be sorted by offset! See intel_shadow_table_check(). */
>   static const struct i915_range gen8_shadowed_regs[] = {
>   	{ .start =  0x2030, .end =  0x2030 },
> @@ -1570,33 +1567,30 @@ static inline void __force_wake_auto(struct intel_uncore *uncore,
>   		___force_wake_auto(uncore, fw_domains);
>   }
>   
> -#define __gen_read(func, x) \
> +#define __gen_fwtable_read(x) \
>   static u##x \
> -func##_read##x(struct intel_uncore *uncore, i915_reg_t reg, bool trace) { \
> +fwtable_read##x(struct intel_uncore *uncore, i915_reg_t reg, bool trace) \
> +{ \
>   	enum forcewake_domains fw_engine; \
>   	GEN6_READ_HEADER(x); \
> -	fw_engine = __##func##_reg_read_fw_domains(uncore, offset); \
> +	fw_engine = __fwtable_reg_read_fw_domains(uncore, offset); \
>   	if (fw_engine) \
>   		__force_wake_auto(uncore, fw_engine); \
>   	val = __raw_uncore_read##x(uncore, reg); \
>   	GEN6_READ_FOOTER; \
>   }
>   
> -#define __gen_reg_read_funcs(func) \
> -static enum forcewake_domains \
> -func##_reg_read_fw_domains(struct intel_uncore *uncore, i915_reg_t reg) { \
> -	return __##func##_reg_read_fw_domains(uncore, i915_mmio_reg_offset(reg)); \
> -} \
> -\
> -__gen_read(func, 8) \
> -__gen_read(func, 16) \
> -__gen_read(func, 32) \
> -__gen_read(func, 64)
> +static enum forcewake_domains
> +fwtable_reg_read_fw_domains(struct intel_uncore *uncore, i915_reg_t reg) {
> +	return __fwtable_reg_read_fw_domains(uncore, i915_mmio_reg_offset(reg));
> +}
>   
> -__gen_reg_read_funcs(gen11_fwtable);
> -__gen_reg_read_funcs(fwtable);
> +__gen_fwtable_read(8)
> +__gen_fwtable_read(16)
> +__gen_fwtable_read(32)
> +__gen_fwtable_read(64)
>   
> -#undef __gen_reg_read_funcs
> +#undef __gen_fwtable_read
>   #undef GEN6_READ_FOOTER
>   #undef GEN6_READ_HEADER
>   
> @@ -2062,22 +2056,22 @@ static int uncore_forcewake_init(struct intel_uncore *uncore)
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __dg2_fw_ranges);
>   		ASSIGN_SHADOW_TABLE(uncore, gen12_shadowed_regs);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
> -		ASSIGN_READ_MMIO_VFUNCS(uncore, gen11_fwtable);
> +		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
>   	} else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __xehp_fw_ranges);
>   		ASSIGN_SHADOW_TABLE(uncore, gen12_shadowed_regs);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
> -		ASSIGN_READ_MMIO_VFUNCS(uncore, gen11_fwtable);
> +		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
>   	} else if (GRAPHICS_VER(i915) >= 12) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen12_fw_ranges);
>   		ASSIGN_SHADOW_TABLE(uncore, gen12_shadowed_regs);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
> -		ASSIGN_READ_MMIO_VFUNCS(uncore, gen11_fwtable);
> +		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
>   	} else if (GRAPHICS_VER(i915) == 11) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen11_fw_ranges);
>   		ASSIGN_SHADOW_TABLE(uncore, gen11_shadowed_regs);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
> -		ASSIGN_READ_MMIO_VFUNCS(uncore, gen11_fwtable);
> +		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
>   	} else if (IS_GRAPHICS_VER(i915, 9, 10)) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen9_fw_ranges);
>   		ASSIGN_SHADOW_TABLE(uncore, gen8_shadowed_regs);
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
