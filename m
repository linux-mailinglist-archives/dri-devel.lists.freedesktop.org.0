Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 554C6415923
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 09:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5416ECFE;
	Thu, 23 Sep 2021 07:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620CE6ECF7;
 Thu, 23 Sep 2021 07:35:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10115"; a="203282522"
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="203282522"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 00:35:00 -0700
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="702614115"
Received: from gerardqu-mobl.ger.corp.intel.com (HELO [10.213.243.237])
 ([10.213.243.237])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 00:34:59 -0700
Subject: Re: [PATCH] drm/i915/uncore: fwtable read handlers are now used on
 all forcewake platforms
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20210923003029.2194375-1-matthew.d.roper@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <3fc57b4c-fa5f-47be-6250-c12471ef826d@linux.intel.com>
Date: Thu, 23 Sep 2021 08:34:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923003029.2194375-1-matthew.d.roper@intel.com>
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


On 23/09/2021 01:30, Matt Roper wrote:
> With the recent refactor of the uncore mmio handling, all
> forcewake-based platforms (i.e., graphics version 6 and beyond) now use
> the 'fwtable' read handlers.  Let's pull the assignment out of the
> per-platform if/else ladder to make this more obvious.
> 
> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/intel_uncore.c | 11 ++---------
>   1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index c8e7c71f0896..678a99de07fe 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -2088,49 +2088,42 @@ static int uncore_forcewake_init(struct intel_uncore *uncore)
>   		return ret;
>   	forcewake_early_sanitize(uncore, 0);
>   
> +	ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
> +
>   	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 55)) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __dg2_fw_ranges);
>   		ASSIGN_SHADOW_TABLE(uncore, dg2_shadowed_regs);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
> -		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
>   	} else if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __xehp_fw_ranges);
>   		ASSIGN_SHADOW_TABLE(uncore, gen12_shadowed_regs);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
> -		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
>   	} else if (GRAPHICS_VER(i915) >= 12) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen12_fw_ranges);
>   		ASSIGN_SHADOW_TABLE(uncore, gen12_shadowed_regs);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
> -		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
>   	} else if (GRAPHICS_VER(i915) == 11) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen11_fw_ranges);
>   		ASSIGN_SHADOW_TABLE(uncore, gen11_shadowed_regs);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
> -		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
>   	} else if (IS_GRAPHICS_VER(i915, 9, 10)) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen9_fw_ranges);
>   		ASSIGN_SHADOW_TABLE(uncore, gen8_shadowed_regs);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
> -		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
>   	} else if (IS_CHERRYVIEW(i915)) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __chv_fw_ranges);
>   		ASSIGN_SHADOW_TABLE(uncore, gen8_shadowed_regs);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
> -		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
>   	} else if (GRAPHICS_VER(i915) == 8) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen6_fw_ranges);
>   		ASSIGN_SHADOW_TABLE(uncore, gen8_shadowed_regs);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, fwtable);
> -		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
>   	} else if (IS_VALLEYVIEW(i915)) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __vlv_fw_ranges);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, gen6);
> -		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
>   	} else if (IS_GRAPHICS_VER(i915, 6, 7)) {
>   		ASSIGN_FW_DOMAINS_TABLE(uncore, __gen6_fw_ranges);
>   		ASSIGN_WRITE_MMIO_VFUNCS(uncore, gen6);
> -		ASSIGN_READ_MMIO_VFUNCS(uncore, fwtable);
>   	}
>   
>   	uncore->pmic_bus_access_nb.notifier_call = i915_pmic_bus_access_notifier;
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
