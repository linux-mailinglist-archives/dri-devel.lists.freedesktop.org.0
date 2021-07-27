Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1183D79A0
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 17:24:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C5F6E91D;
	Tue, 27 Jul 2021 15:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457896E91D;
 Tue, 27 Jul 2021 15:24:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="212455298"
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="212455298"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 08:24:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="516906085"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga002.fm.intel.com with ESMTP; 27 Jul 2021 08:24:26 -0700
Received: from [10.249.141.251] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.141.251])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 16RFOO3w006078; Tue, 27 Jul 2021 16:24:25 +0100
Subject: Re: [Intel-gfx] [PATCH 08/15] drm/i915/guc/slpc: Add methods to set
 min/max frequency
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210726190800.26762-1-vinay.belgaumkar@intel.com>
 <20210726190800.26762-9-vinay.belgaumkar@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <d1440d67-4eb1-ae41-b55e-97a2288a8564@intel.com>
Date: Tue, 27 Jul 2021 17:24:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210726190800.26762-9-vinay.belgaumkar@intel.com>
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
> Add param set h2g helpers to set the min and max frequencies

s/h2g/H2G

> for use by SLPC.
> 
> v2: Address review comments (Michal W)
> v3: Check for positive error code (Michal W)
> 
> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 89 ++++++++++++++++++++-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h |  2 +
>  2 files changed, 90 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index f5808d2acbca..63656640189c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -109,6 +109,21 @@ static u32 slpc_get_state(struct intel_guc_slpc *slpc)
>  	return data->header.global_state;
>  }
>  
> +static int guc_action_slpc_set_param(struct intel_guc *guc, u8 id, u32 value)
> +{
> +	u32 request[] = {
> +		INTEL_GUC_ACTION_SLPC_REQUEST,
> +		SLPC_EVENT(SLPC_EVENT_PARAMETER_SET, 2),
> +		id,
> +		value,
> +	};
> +	int ret;
> +
> +	ret = intel_guc_send(guc, request, ARRAY_SIZE(request));
> +
> +	return ret > 0 ? -EPROTO : ret;
> +}
> +
>  static bool slpc_is_running(struct intel_guc_slpc *slpc)
>  {
>  	return (slpc_get_state(slpc) == SLPC_GLOBAL_STATE_RUNNING);
> @@ -118,7 +133,7 @@ static int guc_action_slpc_query(struct intel_guc *guc, u32 offset)
>  {
>  	u32 request[] = {
>  		INTEL_GUC_ACTION_SLPC_REQUEST,
> - 		SLPC_EVENT(SLPC_EVENT_QUERY_TASK_STATE, 2),
> +		SLPC_EVENT(SLPC_EVENT_QUERY_TASK_STATE, 2),

this should be fixed in original patch

>  		offset,
>  		0,
>  	};
> @@ -146,6 +161,15 @@ static int slpc_query_task_state(struct intel_guc_slpc *slpc)
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
>  static const char *slpc_global_state_to_string(enum slpc_global_state state)
>  {
>  	const char *str = NULL;
> @@ -251,6 +275,69 @@ static u32 slpc_decode_max_freq(struct intel_guc_slpc *slpc)
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
> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
> +	intel_wakeref_t wakeref;
> +	int ret;
> +
> +	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
> +		ret = slpc_set_param(slpc,
> +			       SLPC_PARAM_GLOBAL_MAX_GT_UNSLICE_FREQ_MHZ,
> +			       val);
> +		if (ret) {
> +			drm_err(&i915->drm,
> +				"Set max frequency unslice returned (%pe)\n", ERR_PTR(ret));

maybe generic error reporting could be moved to slpc_set_param() ?

> +			/* Return standardized err code for sysfs */
> +			ret = -EIO;

at this point we don't know if this function is for sysfs only
I would sanitize error in "store" hook if really needed

ssize_t slpc_max_freq_store(... const char *buf, size_t count)
{
	...
	err = intel_guc_slpc_set_max_freq(slpc, val);
	return err ? -EIO : count;
}

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

same here

Michal

> +
> +	return ret;
> +}
> +
>  /*
>   * intel_guc_slpc_enable() - Start SLPC
>   * @slpc: pointer to intel_guc_slpc.
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> index c3b0ad7f0f93..e594510497ec 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> @@ -29,5 +29,7 @@ void intel_guc_slpc_init_early(struct intel_guc_slpc *slpc);
>  int intel_guc_slpc_init(struct intel_guc_slpc *slpc);
>  int intel_guc_slpc_enable(struct intel_guc_slpc *slpc);
>  void intel_guc_slpc_fini(struct intel_guc_slpc *slpc);
> +int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val);
> +int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val);
>  
>  #endif
> 
