Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E87143DA8DF
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 18:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968BB6EDEA;
	Thu, 29 Jul 2021 16:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E752E6EDE9;
 Thu, 29 Jul 2021 16:22:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="200135709"
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="200135709"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 09:22:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="438479864"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga007.fm.intel.com with ESMTP; 29 Jul 2021 09:21:53 -0700
Received: from [10.249.142.82] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.142.82])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 16TGLqfF032281; Thu, 29 Jul 2021 17:21:52 +0100
Subject: Re: [Intel-gfx] [PATCH 11/14] drm/i915/guc/slpc: Cache platform
 frequency limits
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210728211144.15322-1-vinay.belgaumkar@intel.com>
 <20210728211144.15322-12-vinay.belgaumkar@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <cd7cc618-05b9-8f1f-7a0a-7417f09f9b12@intel.com>
Date: Thu, 29 Jul 2021 18:21:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210728211144.15322-12-vinay.belgaumkar@intel.com>
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



On 28.07.2021 23:11, Vinay Belgaumkar wrote:
> Cache rp0, rp1 and rpn platform limits into SLPC structure
> for range checking while setting min/max frequencies.
> 
> Also add "soft" limits which keep track of frequency changes
> made from userland. These are initially set to platform min
> and max.
> 
> v2: Address review comments (Michal W)
> v3: Formatting (Michal W)
> v4: Add separate function to parse rp values (Michal W)
> v5: Perform range checking for set min/max (Michal W)
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 115 ++++++++++++++++++
>  .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |   9 ++
>  drivers/gpu/drm/i915/i915_reg.h               |   3 +
>  3 files changed, 127 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index 742918875593..bfd5fb0751fd 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -94,6 +94,9 @@ static int slpc_shared_data_init(struct intel_guc_slpc *slpc)
>  		return err;
>  	}
>  
> +	slpc->max_freq_softlimit = 0;
> +	slpc->min_freq_softlimit = 0;

shouldn't this be in intel_guc_slpc_init() ?

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
> +		GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
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
>  	return slpc_get_state(slpc) == SLPC_GLOBAL_STATE_RUNNING;
> @@ -177,6 +192,16 @@ static int slpc_set_param(struct intel_guc_slpc *slpc, u8 id, u32 value)
>  	return ret;
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
>  	switch (state) {
> @@ -307,6 +332,11 @@ int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val)
>  	intel_wakeref_t wakeref;
>  	int ret;
>  
> +	if ((val < slpc->min_freq) ||
> +	    (val > slpc->rp0_freq) ||
> +	    (val < slpc->min_freq_softlimit))
> +		return -EINVAL;
> +
>  	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>  		ret = slpc_set_param(slpc,
>  			       SLPC_PARAM_GLOBAL_MAX_GT_UNSLICE_FREQ_MHZ,
> @@ -317,6 +347,8 @@ int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val)
>  			ret = -EIO;
>  	}
>  
> +	slpc->max_freq_softlimit = val;
> +
>  	return ret;
>  }
>  
> @@ -363,6 +395,11 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
>  	intel_wakeref_t wakeref;
>  	int ret;
>  
> +	if ((val < slpc->min_freq) ||
> +	    (val > slpc->rp0_freq) ||
> +	    (val > slpc->max_freq_softlimit))
> +		return -EINVAL;
> +
>  	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>  		ret = slpc_set_param(slpc,
>  			       SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
> @@ -373,6 +410,8 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
>  			ret = -EIO;
>  	}
>  
> +	slpc->min_freq_softlimit = val;
> +
>  	return ret;
>  }
>  
> @@ -418,6 +457,71 @@ void intel_guc_pm_intrmsk_enable(struct intel_gt *gt)
>  			   GEN6_PMINTRMSK, pm_intrmsk_mbz, 0);
>  }
>  
> +static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
> +{
> +	int ret = 0;
> +
> +	/*
> +	 * Softlimits are initially equivalent to platform limits
> +	 * unless they have deviated from defaults, in which case,
> +	 * we retain the values and set min/max accordingly.
> +	 */
> +	if (!slpc->max_freq_softlimit)
> +		slpc->max_freq_softlimit = slpc->rp0_freq;
> +	else if (slpc->max_freq_softlimit != slpc->rp0_freq)
> +		ret = intel_guc_slpc_set_max_freq(slpc,
> +					slpc->max_freq_softlimit);

if this fails, shouldn't we reset max_freq_softlimit to platform limit ?
otherwise we could be with some potentially bad value forever

> +
> +	if (!slpc->min_freq_softlimit)
> +		slpc->min_freq_softlimit = slpc->min_freq;
> +	else if (slpc->min_freq_softlimit != slpc->min_freq)
> +		ret = intel_guc_slpc_set_min_freq(slpc,
> +					slpc->min_freq_softlimit);

similar here

> +
> +	return ret;
> +}
> +
> +static void intel_guc_slpc_ignore_eff_freq(struct intel_guc_slpc *slpc, bool ignore)

static functions don't need "intel_guc" prefix

slpc_ignore_eff_freq

> +{
> +	/* A failure here does not affect the algorithm in a fatal way */
> +	if (ignore) {
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

indents are likely wrong

> +	}
> +}
> +
> +static void intel_guc_slpc_use_fused_rp0(struct intel_guc_slpc *slpc)

slpc_use_fused_rp0

> +{
> +	/* Force SLPC to used platform rp0 */
> +	slpc_set_param(slpc,
> +			SLPC_PARAM_GLOBAL_MAX_GT_UNSLICE_FREQ_MHZ,
> +			slpc->rp0_freq);
> +}
> +
> +static void slpc_get_rp_values(struct intel_guc_slpc *slpc)
> +{
> +	u32 rp_state_cap;
> +
> +	rp_state_cap = intel_uncore_read(slpc_to_gt(slpc)->uncore,
> +					 GEN6_RP_STATE_CAP);
> +
> +	slpc->rp0_freq = REG_FIELD_GET(RP0_CAP_MASK, rp_state_cap) *
> +					GT_FREQUENCY_MULTIPLIER;
> +	slpc->rp1_freq = REG_FIELD_GET(RP1_CAP_MASK, rp_state_cap) *
> +					GT_FREQUENCY_MULTIPLIER;
> +	slpc->min_freq = REG_FIELD_GET(RPN_CAP_MASK, rp_state_cap) *
> +					GT_FREQUENCY_MULTIPLIER;
> +}
> +
>  /*
>   * intel_guc_slpc_enable() - Start SLPC
>   * @slpc: pointer to intel_guc_slpc.
> @@ -453,6 +557,17 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>  
>  	intel_guc_pm_intrmsk_enable(&i915->gt);
>  
> +	slpc_get_rp_values(slpc);
> +
> +	/* Ignore efficient freq and set min/max to platform min/max */
> +	intel_guc_slpc_ignore_eff_freq(slpc, true);
> +	intel_guc_slpc_use_fused_rp0(slpc);
> +
> +	ret = slpc_set_softlimits(slpc);
> +	if (ret)
> +		drm_err(&i915->drm, "Failed to set SLPC softlimits (%pe)\n",
> +					ERR_PTR(ret));

indent ?

> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> index 3cefe19b17b2..41d13527666f 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> @@ -15,6 +15,15 @@ struct intel_guc_slpc {
>  	struct slpc_shared_data *vaddr;
>  	bool supported;
>  	bool selected;
> +
> +	/* platform frequency limits */
> +	u32 min_freq;
> +	u32 rp0_freq;
> +	u32 rp1_freq;
> +
> +	/* frequency softlimits */
> +	u32 min_freq_softlimit;
> +	u32 max_freq_softlimit;
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
