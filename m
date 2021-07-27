Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F35C3D7A5A
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 18:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BFA16E872;
	Tue, 27 Jul 2021 16:00:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645FC6E52C;
 Tue, 27 Jul 2021 16:00:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="212462430"
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="212462430"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 09:00:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="498532941"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga001.jf.intel.com with ESMTP; 27 Jul 2021 09:00:19 -0700
Received: from [10.249.141.251] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.141.251])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 16RG0I6W017466; Tue, 27 Jul 2021 17:00:18 +0100
Subject: Re: [PATCH 12/15] drm/i915/guc/slpc: Cache platform frequency limits
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210726190800.26762-1-vinay.belgaumkar@intel.com>
 <20210726190800.26762-13-vinay.belgaumkar@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <416134fd-d688-1feb-cae3-98bcd287e04c@intel.com>
Date: Tue, 27 Jul 2021 18:00:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210726190800.26762-13-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=utf-8
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



On 26.07.2021 21:07, Vinay Belgaumkar wrote:
> Cache rp0, rp1 and rpn platform limits into SLPC structure
> for range checking while setting min/max frequencies.
> 
> Also add "soft" limits which keep track of frequency changes
> made from userland. These are initially set to platform min
> and max.
> 
> v2: Address review comments (Michal W)
> v3: Formatting (Michal W)
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 97 +++++++++++++++++++
>  .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h | 11 +++
>  drivers/gpu/drm/i915/i915_reg.h               |  3 +
>  3 files changed, 111 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index c79dba60b2e6..a98cbf274862 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -94,6 +94,9 @@ static int slpc_shared_data_init(struct intel_guc_slpc *slpc)
>  		return err;
>  	}
>  
> +	slpc->max_freq_softlimit = 0;
> +	slpc->min_freq_softlimit = 0;
> +
>  	return err;
>  }
>  
> @@ -124,6 +127,18 @@ static int guc_action_slpc_set_param(struct intel_guc *guc, u8 id, u32 value)
>  	return ret > 0 ? -EPROTO : ret;
>  }
>  
> +static int guc_action_slpc_unset_param(struct intel_guc *guc, u8 id)
> +{
> +	u32 request[] = {
> +		INTEL_GUC_ACTION_SLPC_REQUEST,
> +		SLPC_EVENT(SLPC_EVENT_PARAMETER_UNSET, 2),
> +		id,
> +	};
> +
> +	return intel_guc_send(guc, request, ARRAY_SIZE(request));
> +}
> +
> +
>  static bool slpc_is_running(struct intel_guc_slpc *slpc)
>  {
>  	return (slpc_get_state(slpc) == SLPC_GLOBAL_STATE_RUNNING);
> @@ -170,6 +185,16 @@ static int slpc_set_param(struct intel_guc_slpc *slpc, u8 id, u32 value)
>  	return guc_action_slpc_set_param(guc, id, value);
>  }
>  
> +static int slpc_unset_param(struct intel_guc_slpc *slpc,
> +				u8 id)
> +{
> +	struct intel_guc *guc = slpc_to_guc(slpc);
> +
> +	GEM_BUG_ON(id >= SLPC_MAX_PARAM);
> +
> +	return guc_action_slpc_unset_param(guc, id);
> +}
> +
>  static const char *slpc_global_state_to_string(enum slpc_global_state state)
>  {
>  	const char *str = NULL;
> @@ -406,6 +431,55 @@ void intel_guc_pm_intrmsk_enable(struct intel_gt *gt)
>  			   GEN6_PMINTRMSK, pm_intrmsk_mbz, 0);
>  }
>  
> +static int intel_guc_slpc_set_softlimits(struct intel_guc_slpc *slpc)

nit: "intel_" prefix not needed for static function

> +{
> +	int ret = 0;
> +
> +	/* Softlimits are initially equivalent to platform limits
> +	 * unless they have deviated from defaults, in which case,
> +	 * we retain the values and set min/max accordingly.
> +	 */

fix style for multi-line comment

> +	if (!slpc->max_freq_softlimit)
> +		slpc->max_freq_softlimit = slpc->rp0_freq;
> +	else if (slpc->max_freq_softlimit != slpc->rp0_freq)
> +		ret = intel_guc_slpc_set_max_freq(slpc,
> +					slpc->max_freq_softlimit);
> +
> +	if (!slpc->min_freq_softlimit)
> +		slpc->min_freq_softlimit = slpc->min_freq;
> +	else if (slpc->min_freq_softlimit != slpc->min_freq)
> +		ret = intel_guc_slpc_set_min_freq(slpc,
> +					slpc->min_freq_softlimit);
> +
> +	return ret;
> +}
> +
> +static void intel_guc_slpc_ignore_eff_freq(struct intel_guc_slpc *slpc, bool ignore)
> +{
> +	if (ignore) {
> +		/* A failure here does not affect the algorithm in a fatal way */

is this comment just for "ignore" case or whole function ? (as you don't
check for errors in "else" case anyway)

> +		slpc_set_param(slpc,
> +		   SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
> +		   ignore);
> +		slpc_set_param(slpc,
> +		   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
> +		   slpc->min_freq);
> +	} else {
> +		slpc_unset_param(slpc,
> +		   SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY);
> +		slpc_unset_param(slpc,
> +		   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ);
> +	}
> +}
> +
> +static void intel_guc_slpc_use_fused_rp0(struct intel_guc_slpc *slpc)
> +{
> +	/* Force slpc to used platform rp0 */

s/slpc/SLPC

> +	slpc_set_param(slpc,
> +	   SLPC_PARAM_GLOBAL_MAX_GT_UNSLICE_FREQ_MHZ,
> +	   slpc->rp0_freq);

hmm, likely indent is wrong, did you run checkpatch.pl ?

> +}
> +
>  /*
>   * intel_guc_slpc_enable() - Start SLPC
>   * @slpc: pointer to intel_guc_slpc.
> @@ -423,6 +497,7 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>  {
>  	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>  	struct slpc_shared_data *data;
> +	u32 rp_state_cap;
>  	int ret;
>  
>  	GEM_BUG_ON(!slpc->vma);
> @@ -460,6 +535,28 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>  			slpc_decode_min_freq(slpc),
>  			slpc_decode_max_freq(slpc));
>  
> +	rp_state_cap = intel_uncore_read(i915->gt.uncore, GEN6_RP_STATE_CAP);

shouldn't this be slpc_to_gt()->uncore ?

> +
> +	slpc->rp0_freq = REG_FIELD_GET(RP0_CAP_MASK, rp_state_cap) *
> +					GT_FREQUENCY_MULTIPLIER;
> +	slpc->rp1_freq = REG_FIELD_GET(RP1_CAP_MASK, rp_state_cap) *
> +					GT_FREQUENCY_MULTIPLIER;
> +	slpc->min_freq = REG_FIELD_GET(RPN_CAP_MASK, rp_state_cap) *
> +					GT_FREQUENCY_MULTIPLIER;

maybe worth to move "rp" read/parse to small helper function ?

> +
> +	/* Ignore efficient freq and set min/max to platform min/max */
> +	intel_guc_slpc_ignore_eff_freq(slpc, true);
> +	intel_guc_slpc_use_fused_rp0(slpc);
> +
> +	ret = intel_guc_slpc_set_softlimits(slpc);
> +	if (ret)
> +		drm_err(&i915->drm, "Failed to set SLPC softlimits (%pe)\n",
> +					ERR_PTR(ret));
> +
> +	drm_info(&i915->drm,
> +		 "Platform fused frequency values - min: %u Mhz, max: %u Mhz\n",
> +		 slpc->min_freq,
> +		 slpc->rp0_freq);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> index f14f81821a51..16dec703db43 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> @@ -6,11 +6,22 @@
>  #ifndef _INTEL_GUC_SLPC_TYPES_H_
>  #define _INTEL_GUC_SLPC_TYPES_H_
>  
> +#include <linux/types.h>
> +
>  #define SLPC_RESET_TIMEOUT_MS 5
>  
>  struct intel_guc_slpc {
>  	struct i915_vma *vma;
>  	struct slpc_shared_data *vaddr;
> +
> +	/* platform frequency limits */
> +	u32 min_freq;
> +	u32 rp0_freq;
> +	u32 rp1_freq;
> +
> +	/* frequency softlimits */
> +	u32 min_freq_softlimit;
> +	u32 max_freq_softlimit;
all frequencies are from 0Hz to 4GHz ?
or different units/range ?

Thanks,
Michal

>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 5603377e06ca..f3a445f79a36 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -4109,6 +4109,9 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
>  #define BXT_GT_PERF_STATUS      _MMIO(MCHBAR_MIRROR_BASE_SNB + 0x7070)
>  #define GEN6_RP_STATE_LIMITS	_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5994)
>  #define GEN6_RP_STATE_CAP	_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5998)
> +#define   RP0_CAP_MASK		REG_GENMASK(7, 0)
> +#define   RP1_CAP_MASK		REG_GENMASK(15, 8)
> +#define   RPN_CAP_MASK		REG_GENMASK(23, 16)
>  #define BXT_RP_STATE_CAP        _MMIO(0x138170)
>  #define GEN9_RP_STATE_LIMITS	_MMIO(0x138148)
>  
> 
