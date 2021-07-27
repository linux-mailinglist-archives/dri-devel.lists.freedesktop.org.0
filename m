Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 406933D79D8
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 17:33:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E046E04B;
	Tue, 27 Jul 2021 15:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BD16E04B;
 Tue, 27 Jul 2021 15:32:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="234336965"
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="234336965"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 08:32:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="474634264"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga008.fm.intel.com with ESMTP; 27 Jul 2021 08:32:57 -0700
Received: from [10.249.141.251] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.141.251])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 16RFWuZT010699; Tue, 27 Jul 2021 16:32:56 +0100
Subject: Re: [Intel-gfx] [PATCH 09/15] drm/i915/guc/slpc: Add get max/min freq
 hooks
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210726190800.26762-1-vinay.belgaumkar@intel.com>
 <20210726190800.26762-10-vinay.belgaumkar@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <83adc062-f5b9-5272-d99a-fa870a85328c@intel.com>
Date: Tue, 27 Jul 2021 17:32:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210726190800.26762-10-vinay.belgaumkar@intel.com>
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
> Add helpers to read the min/max frequency being used
> by SLPC. This is done by send a H2G command which forces
> SLPC to update the shared data struct which can then be
> read. These helpers will be used in a sysfs patch later
> on.
> 
> v2: Address review comments (Michal W)
> v3: Return err in case of query failure (Michal W)
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 54 +++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h |  2 +
>  2 files changed, 56 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index 63656640189c..c653bba3b5eb 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -306,6 +306,33 @@ int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val)
>  	return ret;
>  }
>  
> +/**
> + * intel_guc_slpc_get_max_freq() - Get max frequency limit for SLPC.
> + * @slpc: pointer to intel_guc_slpc.
> + * @val: pointer to val which will hold max frequency (MHz)
> + *
> + * This function will invoke GuC SLPC action to read the max frequency
> + * limit for unslice.
> + *
> + * Return: 0 on success, non-zero error code on failure.
> + */
> +int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val)
> +{
> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
> +	intel_wakeref_t wakeref;
> +	int ret = 0;
> +
> +	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
> +		/* Force GuC to update task data */
> +		ret = slpc_query_task_state(slpc);
> +
> +		if (!ret)
> +			*val = slpc_decode_max_freq(slpc);
> +	}
> +
> +	return ret;
> +}
> +
>  /**
>   * intel_guc_slpc_set_min_freq() - Set min frequency limit for SLPC.
>   * @slpc: pointer to intel_guc_slpc.
> @@ -338,6 +365,33 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
>  	return ret;
>  }
>  
> +/**
> + * intel_guc_slpc_get_min_freq() - Get min frequency limit for SLPC.
> + * @slpc: pointer to intel_guc_slpc.
> + * @val: pointer to val which will hold min frequency (MHz)
> + *
> + * This function will invoke GuC SLPC action to read the min frequency
> + * limit for unslice.
> + *
> + * Return: 0 on success, non-zero error code on failure.
> + */
> +int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val)
> +{
> +	intel_wakeref_t wakeref;
> +	struct drm_i915_private *i915 = guc_to_gt(slpc_to_guc(slpc))->i915;

use slpc_to_i915() and in this order:

	struct drm_i915_private *i915 = slpc_to_i915(slpc);
	intel_wakeref_t wakeref;
	int ret = 0;

with that fixed,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> +	int ret = 0;
> +
> +	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
> +		/* Force GuC to update task data */
> +		ret = slpc_query_task_state(slpc);
> +
> +		if (!ret)
> +			*val = slpc_decode_min_freq(slpc);
> +	}
> +
> +	return ret;
> +}
> +
>  /*
>   * intel_guc_slpc_enable() - Start SLPC
>   * @slpc: pointer to intel_guc_slpc.
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> index e594510497ec..92d7afd44f07 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> @@ -31,5 +31,7 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc);
>  void intel_guc_slpc_fini(struct intel_guc_slpc *slpc);
>  int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val);
>  int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val);
> +int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val);
> +int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val);
>  
>  #endif
> 
