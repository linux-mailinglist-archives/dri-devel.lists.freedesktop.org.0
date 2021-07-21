Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CFD3D15EC
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 20:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDE36E093;
	Wed, 21 Jul 2021 18:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D366E093;
 Wed, 21 Jul 2021 18:09:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="233295351"
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="233295351"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 11:09:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="576773826"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga001.fm.intel.com with ESMTP; 21 Jul 2021 11:09:36 -0700
Received: from [10.249.140.99] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.140.99])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 16LI9Zf0010251; Wed, 21 Jul 2021 19:09:35 +0100
Subject: Re: [PATCH 11/14] drm/i915/guc/slpc: Cache platform frequency limits
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210721161120.24610-1-vinay.belgaumkar@intel.com>
 <20210721161120.24610-12-vinay.belgaumkar@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <ea6a0786-c21b-f916-a44a-8139b41da954@intel.com>
Date: Wed, 21 Jul 2021 20:09:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210721161120.24610-12-vinay.belgaumkar@intel.com>
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



On 21.07.2021 18:11, Vinay Belgaumkar wrote:
> Cache rp0, rp1 and rpn platform limits into SLPC structure
> for range checking while setting min/max frequencies.
> 
> Also add "soft" limits which keep track of frequency changes
> made from userland. These are initially set to platform min
> and max.
> 
> v2: Address review comments (Michal W)
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 98 +++++++++++++++++++
>  .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |  9 ++
>  drivers/gpu/drm/i915/i915_reg.h               |  3 +
>  3 files changed, 110 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index 8796a8929d89..134c57ca10b7 100644
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
> @@ -121,6 +124,19 @@ static int guc_action_slpc_set_param(struct intel_guc *guc, u8 id, u32 value)
>   	return intel_guc_send(guc, request, ARRAY_SIZE(request));
>  }
>  
> +static int guc_action_slpc_unset_param(struct intel_guc *guc,
> +					u8 id)
> +{
> +	u32 request[] = {
> +		INTEL_GUC_ACTION_SLPC_REQUEST,
> + 		SLPC_EVENT(SLPC_EVENT_PARAMETER_UNSET, 2),
> +		id,
> +	};
> +
> + 	return intel_guc_send(guc, request, ARRAY_SIZE(request));
> +}
> +
> +
>  static bool slpc_is_running(struct intel_guc_slpc *slpc)
>  {
>  	return (slpc_get_state(slpc) == SLPC_GLOBAL_STATE_RUNNING);
> @@ -164,6 +180,16 @@ static int slpc_set_param(struct intel_guc_slpc *slpc, u8 id, u32 value)
>  	return guc_action_slpc_set_param(guc, id, value);
>  }
>  
> +static int slpc_unset_param(struct intel_guc_slpc *slpc,
> +				u8 id)

likely can fit into one line

> +{
> +	struct intel_guc *guc = slpc_to_guc(slpc);
> +
> +	GEM_BUG_ON(id >= SLPC_MAX_PARAM);
> +
> +	return guc_action_slpc_unset_param(guc, id);
> +}
> +
>  static const char *slpc_state_string(struct intel_guc_slpc *slpc)
>  {
>  	const char *str = NULL;
> @@ -388,6 +414,55 @@ void intel_guc_pm_intrmsk_enable(struct intel_gt *gt)
>  			   GEN6_PMINTRMSK, pm_intrmsk_mbz, 0);
>  }
>  
> +static int intel_guc_slpc_set_softlimits(struct intel_guc_slpc *slpc)
> +{
> +	int ret = 0;
> +
> +	/* Softlimits are initially equivalent to platform limits
> +	 * unless they have deviated from defaults, in which case,
> +	 * we retain the values and set min/max accordingly.
> +	 */
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

hard to tell from mail client, but likely misalignment
did you run checkpatch.pl ?

> +	}
> +}
> +
> +static void intel_guc_slpc_use_fused_rp0(struct intel_guc_slpc *slpc)
> +{
> +	/* Force slpc to used platform rp0 */
> +	slpc_set_param(slpc,
> +	   SLPC_PARAM_GLOBAL_MAX_GT_UNSLICE_FREQ_MHZ,
> +	   slpc->rp0_freq);
> +}
> +
>  /*
>   * intel_guc_slpc_enable() - Start SLPC
>   * @slpc: pointer to intel_guc_slpc.
> @@ -405,6 +480,7 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>  {
>  	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>  	struct slpc_shared_data *data;
> +	u32 rp_state_cap;
>  	int ret;
>  
>  	GEM_BUG_ON(!slpc->vma);
> @@ -442,6 +518,28 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>  			slpc_decode_min_freq(slpc),
>  			slpc_decode_max_freq(slpc));
>  
> +	rp_state_cap = intel_uncore_read(i915->gt.uncore, GEN6_RP_STATE_CAP);
> +
> +	slpc->rp0_freq = REG_FIELD_GET(RP0_CAP_MASK, rp_state_cap) *
> +					GT_FREQUENCY_MULTIPLIER;
> +	slpc->rp1_freq = REG_FIELD_GET(RP1_CAP_MASK, rp_state_cap) *
> +					GT_FREQUENCY_MULTIPLIER;
> +	slpc->min_freq = REG_FIELD_GET(RPN_CAP_MASK, rp_state_cap) *
> +					GT_FREQUENCY_MULTIPLIER;
> +
> +	/* Ignore efficient freq and set min/max to platform min/max */
> +	intel_guc_slpc_ignore_eff_freq(slpc, true);
> +	intel_guc_slpc_use_fused_rp0(slpc);
> +
> +	ret = intel_guc_slpc_set_softlimits(slpc);
> +	if (ret)
> +		drm_err(&i915->drm, "Set softlimits returned (%pe)\n",

"Failed to set SLPC softlimits (%pe)\n"

> +					ERR_PTR(ret));

should we continue after error ?

Michal

> +
> +	drm_info(&i915->drm,
> +		 "Platform fused frequency values - min: %u Mhz, max: %u Mhz\n",
> +		 slpc->min_freq,
> +		 slpc->rp0_freq);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> index c417992b1346..8c42562a28fc 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> @@ -15,6 +15,15 @@ struct intel_guc_slpc {
>  
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
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index aa433ae8f5de..92392c1da0e6 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -4086,6 +4086,9 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
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
