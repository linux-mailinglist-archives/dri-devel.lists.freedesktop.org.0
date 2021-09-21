Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4352241351F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 16:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE946E992;
	Tue, 21 Sep 2021 14:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F6E6E990;
 Tue, 21 Sep 2021 14:16:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="221480319"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="221480319"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 06:50:43 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="556937634"
Received: from ekyne-mobl.ger.corp.intel.com (HELO [10.213.200.64])
 ([10.213.200.64])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 06:50:42 -0700
Subject: Re: [PATCH v2 1/6] drm/i915/uncore: Convert gen6/gen7 read operations
 to fwtable
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
References: <20210910201030.3436066-1-matthew.d.roper@intel.com>
 <20210910201030.3436066-2-matthew.d.roper@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <150ae0be-796a-ebf4-4c6a-fcd672693ef8@linux.intel.com>
Date: Tue, 21 Sep 2021 14:50:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210910201030.3436066-2-matthew.d.roper@intel.com>
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
> On gen6-gen8 (except vlv/chv) we don't use a forcewake lookup table; we
> simply check whether the register offset is < 0x40000, and return
> FORCEWAKE_RENDER if it is.  To prepare for upcoming refactoring, let's
> define a single-entry forcewake table from [0x0, 0x3ffff] and switch
> these platforms over to use the fwtable reader functions.
> 
> v2:
>   - Drop __gen6_reg_read_fw_domains which is no longer used.  (Tvrtko)
> 
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/intel_uncore.c | 21 ++++++++-------------
>   1 file changed, 8 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index f9767054dbdf..8c09af1e9f7a 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -853,16 +853,6 @@ void assert_forcewakes_active(struct intel_uncore *uncore,
>   /* We give fast paths for the really cool registers */
>   #define NEEDS_FORCE_WAKE(reg) ((reg) < 0x40000)
>   
> -#define __gen6_reg_read_fw_domains(uncore, offset) \
> -({ \
> -	enum forcewake_domains __fwd; \
> -	if (NEEDS_FORCE_WAKE(offset)) \
> -		__fwd = FORCEWAKE_RENDER; \
> -	else \
> -		__fwd = 0; \
> -	__fwd; \
> -})
> -
>   static int fw_range_cmp(u32 offset, const struct intel_forcewake_range *entry)
>   {
>   	if (offset < entry->start)
> @@ -1064,6 +1054,10 @@ gen6_reg_write_fw_domains(struct intel_uncore *uncore, i915_reg_t reg)
>   	__fwd; \
>   })
>   
> +static const struct intel_forcewake_range __gen6_fw_ranges[] = {
> +	GEN_FW_RANGE(0x0, 0x3ffff, FORCEWAKE_RENDER),
> +};
> +
>   /* *Must* be sorted by offset ranges! See intel_fw_table_check(). */
>   static const struct intel_forcewake_range __chv_fw_ranges[] = {
>   	GEN_FW_RANGE(0x2000, 0x3fff, FORCEWAKE_RENDER),
> @@ -1623,7 +1617,6 @@ __gen_read(func, 64)
>   
>   __gen_reg_read_funcs(gen11_fwtable);
>   __gen_reg_read_funcs(fwtable);
> -__gen_reg_read_funcs(gen6);
>   
>   #undef __gen_reg_read_funcs
>   #undef GEN6_READ_FOOTER
> @@ -2111,15 +2104,17 @@ static int uncore_forcewake_init(struct intel_uncore *uncore)
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
>   		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
>   	} else if (GRAPHICS_VER(i915) == 8) {
> +		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen6_fw_ranges);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, gen8);
> -		ASSIGN_READ_MMIO_VFUNCS(uncore, gen6);
> +		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
>   	} else if (IS_VALLEYVIEW(i915)) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __vlv_fw_ranges);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, gen6);
>   		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
>   	} else if (IS_GRAPHICS_VER(i915, 6, 7)) {
> +		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen6_fw_ranges);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, gen6);
> -		ASSIGN_READ_MMIO_VFUNCS(uncore, gen6);
> +		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
>   	}
>   
>   	uncore->pmic_bus_access_nb.notifier_call = i915_pmic_bus_access_notifier;
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
