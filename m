Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B19B3D1545
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 19:42:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70086E873;
	Wed, 21 Jul 2021 17:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDCDF6E873;
 Wed, 21 Jul 2021 17:42:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="233290141"
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="233290141"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 10:42:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="632715195"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga005.jf.intel.com with ESMTP; 21 Jul 2021 10:42:29 -0700
Received: from [10.249.140.99] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.140.99])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 16LHgS9J003910; Wed, 21 Jul 2021 18:42:28 +0100
Subject: Re: [PATCH 07/14] drm/i915/guc/slpc: Add methods to set min/max
 frequency
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210721161120.24610-1-vinay.belgaumkar@intel.com>
 <20210721161120.24610-8-vinay.belgaumkar@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <e4a5657a-12f2-cb45-4021-47c9ebb36f2c@intel.com>
Date: Wed, 21 Jul 2021 19:42:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210721161120.24610-8-vinay.belgaumkar@intel.com>
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
Cc: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 21.07.2021 18:11, Vinay Belgaumkar wrote:
> Add param set h2g helpers to set the min and max frequencies
> for use by SLPC.
> 
> v2: Address review comments (Michal W)
> 
> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 84 +++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h |  2 +
>  2 files changed, 86 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index 48db2a8f67d1..b40c39ba4049 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -109,6 +109,18 @@ static u32 slpc_get_state(struct intel_guc_slpc *slpc)
>  	return data->header.global_state;
>  }
>  
> +static int guc_action_slpc_set_param(struct intel_guc *guc, u8 id, u32 value)
> +{
> +	u32 request[] = {
> +		INTEL_GUC_ACTION_SLPC_REQUEST,
> + 		SLPC_EVENT(SLPC_EVENT_PARAMETER_SET, 2),
> +		id,
> +		value,
> +	};
> +
> + 	return intel_guc_send(guc, request, ARRAY_SIZE(request));

beware of possible non-zero data0 returned by guc_send()

> +}
> +
>  static bool slpc_is_running(struct intel_guc_slpc *slpc)
>  {
>  	return (slpc_get_state(slpc) == SLPC_GLOBAL_STATE_RUNNING);
> @@ -143,6 +155,15 @@ static int slpc_query_task_state(struct intel_guc_slpc *slpc)
>  	return ret;
>  }
>  
> +static int slpc_set_param(struct intel_guc_slpc *slpc, u8 id, u32 value)
> +{
> +	struct intel_guc *guc = slpc_to_guc(slpc);
> +
> +	GEM_BUG_ON(id >= SLPC_MAX_PARAM);
> +
> +	return guc_action_slpc_set_param(guc, id, value);
> +}
> +
>  static const char *slpc_state_string(struct intel_guc_slpc *slpc)
>  {
>  	const char *str = NULL;
> @@ -238,6 +259,69 @@ u32 slpc_decode_max_freq(struct intel_guc_slpc *slpc)
>  		GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER);
>  }
>  
> +/**
> + * intel_guc_slpc_set_max_freq() - Set max frequency limit for SLPC.
> + * @slpc: pointer to intel_guc_slpc.
> + * @val: frequency (MHz)
> + *
> + * This function will invoke GuC SLPC action to update the max frequency
> + * limit for unslice.
> + *
> + * Return: 0 on success, non-zero error code on failure.
> + */
> +int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val)
> +{
> +	int ret;
> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
> +	intel_wakeref_t wakeref;

nit: move "ret" as last

> +
> +	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
> +		ret = slpc_set_param(slpc,
> +			       SLPC_PARAM_GLOBAL_MAX_GT_UNSLICE_FREQ_MHZ,
> +			       val);
> +		if (ret) {
> +			drm_err(&i915->drm,
> +				"Set max frequency unslice returned (%pe)\n", ERR_PTR(ret));
> +			/* Return standardized err code for sysfs */
> +			ret = -EIO;

maybe caller (hook in sysfs) can sanitize this error ?

Michal

> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * intel_guc_slpc_set_min_freq() - Set min frequency limit for SLPC.
> + * @slpc: pointer to intel_guc_slpc.
> + * @val: frequency (MHz)
> + *
> + * This function will invoke GuC SLPC action to update the min unslice
> + * frequency.
> + *
> + * Return: 0 on success, non-zero error code on failure.
> + */
> +int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
> +{
> +	int ret;
> +	struct intel_guc *guc = slpc_to_guc(slpc);
> +	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
> +	intel_wakeref_t wakeref;
> +
> +	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
> +		ret = slpc_set_param(slpc,
> +			       SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
> +			       val);
> +		if (ret) {
> +			drm_err(&i915->drm,
> +				"Set min frequency for unslice returned (%pe)\n", ERR_PTR(ret));
> +			/* Return standardized err code for sysfs */
> +			ret = -EIO;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
>  /*
>   * intel_guc_slpc_enable() - Start SLPC
>   * @slpc: pointer to intel_guc_slpc.
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> index f02249ff5f1b..3a1a7eaafc12 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> @@ -30,5 +30,7 @@ void intel_guc_slpc_init_early(struct intel_guc_slpc *slpc);
>  int intel_guc_slpc_init(struct intel_guc_slpc *slpc);
>  int intel_guc_slpc_enable(struct intel_guc_slpc *slpc);
>  void intel_guc_slpc_fini(struct intel_guc_slpc *slpc);
> +int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val);
> +int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val);
>  
>  #endif
> 
