Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7906C3D15C3
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 20:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 085AC6E113;
	Wed, 21 Jul 2021 18:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9116E113;
 Wed, 21 Jul 2021 18:00:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10052"; a="297048814"
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="297048814"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 11:00:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,258,1620716400"; d="scan'208";a="470237517"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga008.fm.intel.com with ESMTP; 21 Jul 2021 11:00:11 -0700
Received: from [10.249.140.99] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.140.99])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 16LI09hX008236; Wed, 21 Jul 2021 19:00:10 +0100
Subject: Re: [PATCH 08/14] drm/i915/guc/slpc: Add get max/min freq hooks
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210721161120.24610-1-vinay.belgaumkar@intel.com>
 <20210721161120.24610-9-vinay.belgaumkar@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <afb6ccc2-1abd-b507-cea0-e09dda1952b6@intel.com>
Date: Wed, 21 Jul 2021 20:00:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210721161120.24610-9-vinay.belgaumkar@intel.com>
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
> Add helpers to read the min/max frequency being used
> by SLPC. This is done by send a H2G command which forces
> SLPC to update the shared data struct which can then be
> read.

add note that functions will be used later

> 
> v2: Address review comments (Michal W)
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 52 +++++++++++++++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h |  2 +
>  2 files changed, 54 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index b40c39ba4049..c1cf8d46e360 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -290,6 +290,32 @@ int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val)
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
> +	intel_wakeref_t wakeref;
> +	struct drm_i915_private *i915 = guc_to_gt(slpc_to_guc(slpc))->i915;
> +	int ret = 0;

struct drm_i915_private *i915 = slpc_to_i915(slpc);
intel_wakeref_t wakeref;
int ret = 0;

> +
> +	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
> +		/* Force GuC to update task data */
> +		slpc_query_task_state(slpc);

what if this call fails ?

> +
> +		*val = slpc_decode_max_freq(slpc);
> +	}
> +
> +	return ret;
> +}
> +
>  /**
>   * intel_guc_slpc_set_min_freq() - Set min frequency limit for SLPC.
>   * @slpc: pointer to intel_guc_slpc.
> @@ -322,6 +348,32 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
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
> +	int ret = 0;
> +
> +	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
> +		/* Force GuC to update task data */
> +		slpc_query_task_state(slpc);

same here

Michal

> +
> +		*val = slpc_decode_min_freq(slpc);
> +	}
> +
> +	return ret;
> +}
> +
>  /*
>   * intel_guc_slpc_enable() - Start SLPC
>   * @slpc: pointer to intel_guc_slpc.
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> index 3a1a7eaafc12..627c71a95777 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> @@ -32,5 +32,7 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc);
>  void intel_guc_slpc_fini(struct intel_guc_slpc *slpc);
>  int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val);
>  int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val);
> +int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val);
> +int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val);
>  
>  #endif
> 
