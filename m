Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B90A641352E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 16:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D59BB6E9A3;
	Tue, 21 Sep 2021 14:18:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2406E9A3;
 Tue, 21 Sep 2021 14:18:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10113"; a="221481374"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="221481374"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 06:54:58 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="556939560"
Received: from ekyne-mobl.ger.corp.intel.com (HELO [10.213.200.64])
 ([10.213.200.64])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 06:54:57 -0700
Subject: Re: [Intel-gfx] [PATCH v2 3/6] drm/i915/uncore: Replace gen8 write
 functions with general fwtable
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
References: <20210910201030.3436066-1-matthew.d.roper@intel.com>
 <20210910201030.3436066-4-matthew.d.roper@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <3a468336-6215-b413-6cb2-eba3ac4fc6dc@linux.intel.com>
Date: Tue, 21 Sep 2021 14:54:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210910201030.3436066-4-matthew.d.roper@intel.com>
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
> Now that we have both a standard forcewake table (albeit a single-entry
> table) and the shadow table stored in the uncore, we can drop the
> gen8-specific write handlers in favor of the general fwtable version.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/intel_uncore.c | 13 +------------
>   1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index 5fa2bf26a948..4c6898746d10 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -1046,16 +1046,6 @@ gen6_reg_write_fw_domains(struct intel_uncore *uncore, i915_reg_t reg)
>   	return FORCEWAKE_RENDER;
>   }
>   
> -#define __gen8_reg_write_fw_domains(uncore, offset) \
> -({ \
> -	enum forcewake_domains __fwd; \
> -	if (NEEDS_FORCE_WAKE(offset) && !is_shadowed(uncore, offset)) \
> -		__fwd = FORCEWAKE_RENDER; \
> -	else \
> -		__fwd = 0; \
> -	__fwd; \
> -})
> -
>   static const struct intel_forcewake_range __gen6_fw_ranges[] = {
>   	GEN_FW_RANGE(0x0, 0x3ffff, FORCEWAKE_RENDER),
>   };
> @@ -1711,7 +1701,6 @@ __gen_write(func, 32)
>   __gen_reg_write_funcs(gen12_fwtable);
>   __gen_reg_write_funcs(gen11_fwtable);
>   __gen_reg_write_funcs(fwtable);
> -__gen_reg_write_funcs(gen8);
>   
>   #undef __gen_reg_write_funcs
>   #undef GEN6_WRITE_FOOTER
> @@ -2121,7 +2110,7 @@ static int uncore_forcewake_init(struct intel_uncore *uncore)
>   	} else if (GRAPHICS_VER(i915) == 8) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen6_fw_ranges);
>   		ASSIGN_SHADOW_TABLE(uncore, gen8_shadowed_regs);
> -		ASSIGN_WRITE_MMIO_VFUNCS(uncore, gen8);
> +		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
>   		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
>   	} else if (IS_VALLEYVIEW(i915)) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __vlv_fw_ranges);
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
