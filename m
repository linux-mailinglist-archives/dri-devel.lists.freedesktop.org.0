Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5343B41351A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 16:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9AD76E991;
	Tue, 21 Sep 2021 14:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2D76E990;
 Tue, 21 Sep 2021 14:14:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="220173584"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="220173584"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 06:54:05 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="556939078"
Received: from ekyne-mobl.ger.corp.intel.com (HELO [10.213.200.64])
 ([10.213.200.64])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 06:54:04 -0700
Subject: Re: [Intel-gfx] [PATCH v2 2/6] drm/i915/uncore: Associate shadow
 table with uncore
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
References: <20210910201030.3436066-1-matthew.d.roper@intel.com>
 <20210910201030.3436066-3-matthew.d.roper@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <7257164d-c9a8-5859-8526-31782e99da01@linux.intel.com>
Date: Tue, 21 Sep 2021 14:54:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210910201030.3436066-3-matthew.d.roper@intel.com>
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
> Store a reference to a platform's shadow table inside the uncore, the
> same as we do with the forcewake table.  This will allow us to use a
> single set of functions that operate on the shadow table reference
> rather than generating lots of nearly-identical functions via macros
> that differ only in terms of the table that they reference.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/intel_uncore.c | 40 ++++++++++++++++++++---------
>   drivers/gpu/drm/i915/intel_uncore.h |  7 +++++
>   2 files changed, 35 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index 8c09af1e9f7a..5fa2bf26a948 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -1026,17 +1026,19 @@ static int mmio_range_cmp(u32 key, const struct i915_range *range)
>   		return 0;
>   }
>   
> -#define __is_X_shadowed(x) \
> -static bool is_##x##_shadowed(u32 offset) \
> -{ \
> -	const struct i915_range *regs = x##_shadowed_regs; \
> -	return BSEARCH(offset, regs, ARRAY_SIZE(x##_shadowed_regs), \
> +static bool
> +is_shadowed(struct intel_uncore *uncore, u32 offset)

Fits in one line if you want.

> +{
> +	if (drm_WARN_ON(&uncore->i915->drm, !uncore->shadowed_reg_table))
> +		return false;
> +
> +	return BSEARCH(offset,
> +		       uncore->shadowed_reg_table,
> +		       uncore->shadowed_reg_table_entries,
>   		       mmio_range_cmp); \
>   }
>   
> -__is_X_shadowed(gen8)
> -__is_X_shadowed(gen11)
> -__is_X_shadowed(gen12)
> +

If you want to tidy.

>   
>   static enum forcewake_domains
>   gen6_reg_write_fw_domains(struct intel_uncore *uncore, i915_reg_t reg)
> @@ -1047,7 +1049,7 @@ gen6_reg_write_fw_domains(struct intel_uncore *uncore, i915_reg_t reg)
>   #define __gen8_reg_write_fw_domains(uncore, offset) \
>   ({ \
>   	enum forcewake_domains __fwd; \
> -	if (NEEDS_FORCE_WAKE(offset) && !is_gen8_shadowed(offset)) \
> +	if (NEEDS_FORCE_WAKE(offset) && !is_shadowed(uncore, offset)) \
>   		__fwd = FORCEWAKE_RENDER; \
>   	else \
>   		__fwd = 0; \
> @@ -1081,7 +1083,7 @@ static const struct intel_forcewake_range __chv_fw_ranges[] = {
>   #define __fwtable_reg_write_fw_domains(uncore, offset) \
>   ({ \
>   	enum forcewake_domains __fwd = 0; \
> -	if (NEEDS_FORCE_WAKE((offset)) && !is_gen8_shadowed(offset)) \
> +	if (NEEDS_FORCE_WAKE((offset)) && !is_shadowed(uncore, offset)) \
>   		__fwd = find_fw_domain(uncore, offset); \
>   	__fwd; \
>   })
> @@ -1090,7 +1092,7 @@ static const struct intel_forcewake_range __chv_fw_ranges[] = {
>   ({ \
>   	enum forcewake_domains __fwd = 0; \
>   	const u32 __offset = (offset); \
> -	if (!is_gen11_shadowed(__offset)) \
> +	if (!is_shadowed(uncore, __offset)) \
>   		__fwd = find_fw_domain(uncore, __offset); \
>   	__fwd; \
>   })
> @@ -1099,7 +1101,7 @@ static const struct intel_forcewake_range __chv_fw_ranges[] = {
>   ({ \
>   	enum forcewake_domains __fwd = 0; \
>   	const u32 __offset = (offset); \
> -	if (!is_gen12_shadowed(__offset)) \
> +	if (!is_shadowed(uncore, __offset)) \
>   		__fwd = find_fw_domain(uncore, __offset); \
>   	__fwd; \
>   })
> @@ -1705,6 +1707,7 @@ __gen_write(func, 8) \
>   __gen_write(func, 16) \
>   __gen_write(func, 32)
>   
> +

Ditto.

>   __gen_reg_write_funcs(gen12_fwtable);
>   __gen_reg_write_funcs(gen11_fwtable);
>   __gen_reg_write_funcs(fwtable);
> @@ -1969,6 +1972,12 @@ static int intel_uncore_fw_domains_init(struct intel_uncore *uncore)
>   	(uncore)->fw_domains_table_entries = ARRAY_SIZE((d)); \
>   }
>   
> +#define ASSIGN_SHADOW_TABLE(uncore, d) \
> +{ \
> +	(uncore)->shadowed_reg_table = d; \
> +	(uncore)->shadowed_reg_table_entries = ARRAY_SIZE((d)); \
> +}
> +
>   static int i915_pmic_bus_access_notifier(struct notifier_block *nb,
>   					 unsigned long action, void *data)
>   {
> @@ -2081,30 +2090,37 @@ static int uncore_forcewake_init(struct intel_uncore *uncore)
>   
>   	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 55)) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __dg2_fw_ranges);
> +		ASSIGN_SHADOW_TABLE(uncore, gen12_shadowed_regs);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, gen12_fwtable);
>   		ASSIGN_READ_MMIO_VFUNCS(uncore, gen11_fwtable);
>   	} else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __xehp_fw_ranges);
> +		ASSIGN_SHADOW_TABLE(uncore, gen12_shadowed_regs);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, gen12_fwtable);
>   		ASSIGN_READ_MMIO_VFUNCS(uncore, gen11_fwtable);
>   	} else if (GRAPHICS_VER(i915) >= 12) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen12_fw_ranges);
> +		ASSIGN_SHADOW_TABLE(uncore, gen12_shadowed_regs);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, gen12_fwtable);
>   		ASSIGN_READ_MMIO_VFUNCS(uncore, gen11_fwtable);
>   	} else if (GRAPHICS_VER(i915) == 11) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen11_fw_ranges);
> +		ASSIGN_SHADOW_TABLE(uncore, gen11_shadowed_regs);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, gen11_fwtable);
>   		ASSIGN_READ_MMIO_VFUNCS(uncore, gen11_fwtable);
>   	} else if (IS_GRAPHICS_VER(i915, 9, 10)) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen9_fw_ranges);
> +		ASSIGN_SHADOW_TABLE(uncore, gen8_shadowed_regs);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
>   		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
>   	} else if (IS_CHERRYVIEW(i915)) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __chv_fw_ranges);
> +		ASSIGN_SHADOW_TABLE(uncore, gen8_shadowed_regs);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
>   		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
>   	} else if (GRAPHICS_VER(i915) == 8) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen6_fw_ranges);
> +		ASSIGN_SHADOW_TABLE(uncore, gen8_shadowed_regs);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, gen8);
>   		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);

Note for later - I think by the end of the series all "assign read" in 
this block become fwtable so you could consolidate them if wanted.

>   	} else if (IS_VALLEYVIEW(i915)) {
> diff --git a/drivers/gpu/drm/i915/intel_uncore.h b/drivers/gpu/drm/i915/intel_uncore.h
> index 531665b08039..2f31c50eeae2 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.h
> +++ b/drivers/gpu/drm/i915/intel_uncore.h
> @@ -142,6 +142,13 @@ struct intel_uncore {
>   	const struct intel_forcewake_range *fw_domains_table;
>   	unsigned int fw_domains_table_entries;
>   
> +	/*
> +	 * Shadowed registers are special cases where we can safely write
> +	 * to the register *without* grabbing forcewake.
> +	 */
> +	const struct i915_range *shadowed_reg_table;
> +	unsigned int shadowed_reg_table_entries;
> +
>   	struct notifier_block pmic_bus_access_nb;
>   	struct intel_uncore_funcs funcs;
>   
> 

Looks fine and all tidies are optional.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
