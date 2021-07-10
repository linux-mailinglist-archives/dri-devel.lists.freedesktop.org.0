Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C0A3C35EE
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 19:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 174DE6EB4E;
	Sat, 10 Jul 2021 17:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1856EB4D;
 Sat, 10 Jul 2021 17:52:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10041"; a="206824015"
X-IronPort-AV: E=Sophos;i="5.84,229,1620716400"; d="scan'208";a="206824015"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2021 10:52:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,229,1620716400"; d="scan'208";a="424943676"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga007.fm.intel.com with ESMTP; 10 Jul 2021 10:52:20 -0700
Received: from [10.249.151.15] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.151.15])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 16AHqJom003980; Sat, 10 Jul 2021 18:52:19 +0100
Subject: Re: [PATCH 09/16] drm/i915/guc/slpc: Add get max/min freq hooks
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
 <20210710012026.19705-10-vinay.belgaumkar@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <ac11aea5-b4ea-a3bd-9a72-94bb8cef4057@intel.com>
Date: Sat, 10 Jul 2021 19:52:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210710012026.19705-10-vinay.belgaumkar@intel.com>
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



On 10.07.2021 03:20, Vinay Belgaumkar wrote:
> Add helpers to read the min/max frequency being used
> by SLPC. This is done by send a h2g command which forces

s/h2g/H2G

> SLPC to update the shared data struct which can then be
> read.
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 58 +++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h |  2 +
>  2 files changed, 60 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index 19cb26479942..98a283d31734 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -278,6 +278,35 @@ int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val)
>  	return ret;
>  }
>  
> +int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val)
> +{
> +	struct slpc_shared_data *data;
> +	intel_wakeref_t wakeref;
> +	struct drm_i915_private *i915 = guc_to_gt(slpc_to_guc(slpc))->i915;
> +	int ret = 0;
> +
> +	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
> +
> +	/* Force GuC to update task data */
> +	if (slpc_read_task_state(slpc)) {
> +		DRM_ERROR("Unable to update task data");

use drm_err
missing \n
maybe this message could be moved to slpc_read_task_state ?

> +		ret = -EIO;
> +		goto done;
> +	}
> +
> +	GEM_BUG_ON(!slpc->vma);
> +
> +	drm_clflush_virt_range(slpc->vaddr, sizeof(struct slpc_shared_data));

maybe this can also be part of slpc_read_task_state ?

> +	data = slpc->vaddr;
> +
> +	*val = DIV_ROUND_CLOSEST(data->task_state_data.max_unslice_freq *
> +				GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER);
> +
> +done:
> +	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
> +	return ret;
> +}
> +
>  /**
>   * intel_guc_slpc_min_freq_set() - Set min frequency limit for SLPC.
>   * @slpc: pointer to intel_guc_slpc.
> @@ -312,6 +341,35 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
>  	return ret;
>  }
>  
> +int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val)

missing kernel-doc (above intel_guc_slpc_min_freq_set has one)

> +{
> +	struct slpc_shared_data *data;
> +	intel_wakeref_t wakeref;
> +	struct drm_i915_private *i915 = guc_to_gt(slpc_to_guc(slpc))->i915;
> +	int ret = 0;
> +
> +	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
> +
> +	/* Force GuC to update task data */
> +	if (slpc_read_task_state(slpc)) {
> +		DRM_ERROR("Unable to update task data");

see above

> +		ret = -EIO;
> +		goto done;
> +	}
> +
> +	GEM_BUG_ON(!slpc->vma);
> +
> +	drm_clflush_virt_range(slpc->vaddr, sizeof(struct slpc_shared_data));

see above

Michal

> +	data = slpc->vaddr;
> +
> +	*val = DIV_ROUND_CLOSEST(data->task_state_data.min_unslice_freq *
> +				GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER);
> +
> +done:
> +	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
> +	return ret;
> +}
> +
>  /*
>   * intel_guc_slpc_enable() - Start SLPC
>   * @slpc: pointer to intel_guc_slpc.
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> index a473e1ea7c10..2cb830cdacb5 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> @@ -36,5 +36,7 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc);
>  void intel_guc_slpc_fini(struct intel_guc_slpc *slpc);
>  int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val);
>  int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val);
> +int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val);
> +int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val);
>  
>  #endif
> 
