Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 572DC5BA8E7
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 11:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18ABD10ECF4;
	Fri, 16 Sep 2022 09:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BBB10E3EC;
 Fri, 16 Sep 2022 09:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663318956; x=1694854956;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UI78dWtik+awUPgqod85zQx+ya6kzz+leZfdHAMZJfo=;
 b=QESsksE30UMQcE9QyPnalGqFiwLytGj5QnopIbW2Uz+Z81ToJifjh/rV
 wbUHIDJxwtaSxcJhj2Y3c3arAVYDfNeqp+gIHmyei1CiT11wQLW0h935C
 1jPLHHbjNS7I68BNncVdzTRY5crU/+6Ap1VSkkcjohA1fCLDbUqsZx0A3
 H4nh3gKClvd1TFpqgdtxfh5Zgj7EjQdWysZ8lTTRqBDBJAtkTYy/fPpLJ
 UwqO6m4HiEhUQXc3n62wwtO99wuI3kjGP1G1+nDI7j4o7dGogQpfxigkY
 i609UWew37NmgBoAa9gLt/pti2BiBpSJ4f3gTj5VEFQ2MrGqSv51lBaOb Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="360689267"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="360689267"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 02:02:35 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="620023911"
Received: from agiridha-mobl1.ger.corp.intel.com (HELO [10.213.204.25])
 ([10.213.204.25])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 02:02:34 -0700
Message-ID: <e5e70c4f-93af-a903-9bf0-df283b6e7eb9@linux.intel.com>
Date: Fri, 16 Sep 2022 10:02:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Split GAM and MSLICE steering
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220916014345.3317739-1-matthew.d.roper@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220916014345.3317739-1-matthew.d.roper@intel.com>
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


On 16/09/2022 02:43, Matt Roper wrote:
> Although the bspec lists several MMIO ranges as "MSLICE," it turns out
> that a subset of these are of a "GAM" subclass that has unique rules and
> doesn't followed regular mslice steering behavior.
> 
>   * Xe_HP SDV:  GAM ranges must always be steered to 0,0.  These
>     registers share the regular steering control register (0xFDC) with
>     other steering types
> 
>   * DG2:  GAM ranges must always be steered to 1,0.  GAM registers have a
>     dedicated steering control register (0xFE0) so we can set the value
>     once at startup and rely on implicit steering.  Technically the
>     hardware default should already be set to 1,0 properly, but it never
>     hurts to ensure that in the driver.

Do you have any data on whether the "technically should" holds in 
practice? What would be the consequences of some platform/machine 
surprising us here?

Regards,

Tvrtko

> 
> Bspec: 66534
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_mcr.c      | 24 +++++++++++++++++++--
>   drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  1 +
>   drivers/gpu/drm/i915/gt/intel_gt_types.h    |  1 +
>   drivers/gpu/drm/i915/gt/intel_workarounds.c | 10 +++++++++
>   4 files changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> index e79405a45312..a2047a68ea7a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> @@ -40,6 +40,7 @@ static const char * const intel_steering_types[] = {
>   	"L3BANK",
>   	"MSLICE",
>   	"LNCF",
> +	"GAM",
>   	"INSTANCE 0",
>   };
>   
> @@ -48,14 +49,23 @@ static const struct intel_mmio_range icl_l3bank_steering_table[] = {
>   	{},
>   };
>   
> +/*
> + * Although the bspec lists more "MSLICE" ranges than shown here, some of those
> + * are of a "GAM" subclass that has special rules.  Thus we use a separate
> + * GAM table farther down for those.
> + */
>   static const struct intel_mmio_range xehpsdv_mslice_steering_table[] = {
> -	{ 0x004000, 0x004AFF },
> -	{ 0x00C800, 0x00CFFF },
>   	{ 0x00DD00, 0x00DDFF },
>   	{ 0x00E900, 0x00FFFF }, /* 0xEA00 - OxEFFF is unused */
>   	{},
>   };
>   
> +static const struct intel_mmio_range xehpsdv_gam_steering_table[] = {
> +	{ 0x004000, 0x004AFF },
> +	{ 0x00C800, 0x00CFFF },
> +	{},
> +};
> +
>   static const struct intel_mmio_range xehpsdv_lncf_steering_table[] = {
>   	{ 0x00B000, 0x00B0FF },
>   	{ 0x00D800, 0x00D8FF },
> @@ -114,9 +124,15 @@ void intel_gt_mcr_init(struct intel_gt *gt)
>   	} else if (IS_DG2(i915)) {
>   		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
>   		gt->steering_table[LNCF] = dg2_lncf_steering_table;
> +		/*
> +		 * No need to hook up the GAM table since it has a dedicated
> +		 * steering control register on DG2 and can use implicit
> +		 * steering.
> +		 */
>   	} else if (IS_XEHPSDV(i915)) {
>   		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
>   		gt->steering_table[LNCF] = xehpsdv_lncf_steering_table;
> +		gt->steering_table[GAM] = xehpsdv_gam_steering_table;
>   	} else if (GRAPHICS_VER(i915) >= 11 &&
>   		   GRAPHICS_VER_FULL(i915) < IP_VER(12, 50)) {
>   		gt->steering_table[L3BANK] = icl_l3bank_steering_table;
> @@ -351,6 +367,10 @@ static void get_nonterminated_steering(struct intel_gt *gt,
>   		*group = __ffs(gt->info.mslice_mask) << 1;
>   		*instance = 0;	/* unused */
>   		break;
> +	case GAM:
> +		*group = IS_DG2(gt->i915) ? 1 : 0;
> +		*instance = 0;
> +		break;
>   	case INSTANCE0:
>   		/*
>   		 * There are a lot of MCR types for which instance (0, 0)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 2275ee47da95..2343b26e0e21 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -42,6 +42,7 @@
>   #define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
>   #define SF_MCR_SELECTOR				_MMIO(0xfd8)
>   #define GEN8_MCR_SELECTOR			_MMIO(0xfdc)
> +#define GAM_MCR_SELECTOR			_MMIO(0xfe0)
>   #define   GEN8_MCR_SLICE(slice)			(((slice) & 3) << 26)
>   #define   GEN8_MCR_SLICE_MASK			GEN8_MCR_SLICE(3)
>   #define   GEN8_MCR_SUBSLICE(subslice)		(((subslice) & 3) << 24)
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> index f19c2de77ff6..30003d68fd51 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -59,6 +59,7 @@ enum intel_steering_type {
>   	L3BANK,
>   	MSLICE,
>   	LNCF,
> +	GAM,
>   
>   	/*
>   	 * On some platforms there are multiple types of MCR registers that
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 6d2003d598e6..d04652a3b4e5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -1181,6 +1181,9 @@ xehp_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
>   		gt->steering_table[MSLICE] = NULL;
>   	}
>   
> +	if (IS_XEHPSDV(gt->i915) && slice_mask & BIT(0))
> +		gt->steering_table[GAM] = NULL;
> +
>   	slice = __ffs(slice_mask);
>   	subslice = intel_sseu_find_first_xehp_dss(sseu, GEN_DSS_PER_GSLICE, slice) %
>   		GEN_DSS_PER_GSLICE;
> @@ -1198,6 +1201,13 @@ xehp_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
>   	 */
>   	__set_mcr_steering(wal, MCFG_MCR_SELECTOR, 0, 2);
>   	__set_mcr_steering(wal, SF_MCR_SELECTOR, 0, 2);
> +
> +	/*
> +	 * On DG2, GAM registers have a dedicated steering control register
> +	 * and must always be programmed to a hardcoded groupid of "1."
> +	 */
> +	if (IS_DG2(gt->i915))
> +		__set_mcr_steering(wal, GAM_MCR_SELECTOR, 1, 0);
>   }
>   
>   static void
