Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D99BF3C356F
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 18:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9FB6EB41;
	Sat, 10 Jul 2021 16:05:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914126EB41;
 Sat, 10 Jul 2021 16:05:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10041"; a="197106705"
X-IronPort-AV: E=Sophos;i="5.84,229,1620716400"; d="scan'208";a="197106705"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2021 09:05:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,229,1620716400"; d="scan'208";a="411644881"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga006.jf.intel.com with ESMTP; 10 Jul 2021 09:05:13 -0700
Received: from [10.249.151.15] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.151.15])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 16AG5BLw004615; Sat, 10 Jul 2021 17:05:12 +0100
Subject: Re: [PATCH 06/16] drm/i915/guc/slpc: Allocate, initialize and release
 slpc
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
 <20210710012026.19705-7-vinay.belgaumkar@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <d561e568-5e4e-f038-9d99-75d75a43951a@intel.com>
Date: Sat, 10 Jul 2021 18:05:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210710012026.19705-7-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
> Allocate data structures for SLPC and functions for
> initializing on host side.
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c      | 11 +++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 36 ++++++++++++++++++++-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h | 20 ++++++++++++
>  3 files changed, 66 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> index 9d61b2d54de4..82863a9bc8e8 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> @@ -336,6 +336,12 @@ int intel_guc_init(struct intel_guc *guc)
>  			goto err_ct;
>  	}
>  
> +	if (intel_guc_slpc_is_used(guc)) {
> +		ret = intel_guc_slpc_init(&guc->slpc);
> +		if (ret)
> +			goto err_submission;
> +	}
> +
>  	/* now that everything is perma-pinned, initialize the parameters */
>  	guc_init_params(guc);
>  
> @@ -346,6 +352,8 @@ int intel_guc_init(struct intel_guc *guc)
>  
>  	return 0;
>  
> +err_submission:
> +	intel_guc_submission_fini(guc);
>  err_ct:
>  	intel_guc_ct_fini(&guc->ct);
>  err_ads:
> @@ -368,6 +376,9 @@ void intel_guc_fini(struct intel_guc *guc)
>  
>  	i915_ggtt_disable_guc(gt->ggtt);
>  
> +	if (intel_guc_slpc_is_used(guc))
> +		intel_guc_slpc_fini(&guc->slpc);
> +
>  	if (intel_guc_submission_is_used(guc))
>  		intel_guc_submission_fini(guc);
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index c1f569d2300d..94e2f19951aa 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -4,11 +4,41 @@
>   * Copyright © 2020 Intel Corporation
>   */
>  
> +#include <asm/msr-index.h>

hmm, what exactly is needed from this header ?

> +
> +#include "gt/intel_gt.h"
> +#include "gt/intel_rps.h"
> +
> +#include "i915_drv.h"
>  #include "intel_guc_slpc.h"
> +#include "intel_pm.h"
> +
> +static inline struct intel_guc *slpc_to_guc(struct intel_guc_slpc *slpc)
> +{
> +	return container_of(slpc, struct intel_guc, slpc);
> +}
> +
> +static int slpc_shared_data_init(struct intel_guc_slpc *slpc)
> +{
> +	struct intel_guc *guc = slpc_to_guc(slpc);
> +	int err;
> +	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));

move err decl here

> +
> +	err = intel_guc_allocate_and_map_vma(guc, size, &slpc->vma, &slpc->vaddr);
> +	if (unlikely(err)) {
> +		DRM_ERROR("Failed to allocate slpc struct (err=%d)\n", err);

s/slpc/SLPC

and use drm_err instead
and you may also want to print error as %pe

> +		i915_vma_unpin_and_release(&slpc->vma, I915_VMA_RELEASE_MAP);

do you really need this ?

> +		return err;
> +	}
> +
> +	return err;
> +}
>  
>  int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>  {
> -	return 0;
> +	GEM_BUG_ON(slpc->vma);
> +
> +	return slpc_shared_data_init(slpc);
>  }
>  
>  /*
> @@ -31,4 +61,8 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>  
>  void intel_guc_slpc_fini(struct intel_guc_slpc *slpc)
>  {
> +	if (!slpc->vma)
> +		return;
> +
> +	i915_vma_unpin_and_release(&slpc->vma, I915_VMA_RELEASE_MAP);
>  }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> index 98036459a1a3..a2643b904165 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> @@ -3,12 +3,32 @@
>   *
>   * Copyright © 2020 Intel Corporation
>   */
> +

should be fixed in earlier patch

>  #ifndef _INTEL_GUC_SLPC_H_
>  #define _INTEL_GUC_SLPC_H_
>  
> +#include <linux/mutex.h>
>  #include "intel_guc_slpc_fwif.h"
>  
>  struct intel_guc_slpc {
> +	/*Protects access to vma and SLPC actions */

hmm, missing mutex ;)

> +	struct i915_vma *vma;
> +	void *vaddr;

no need to be void, define it as ptr to slpc_shared_data

> +
> +	/* platform frequency limits */
> +	u32 min_freq;
> +	u32 rp0_freq;
> +	u32 rp1_freq;
> +
> +	/* frequency softlimits */
> +	u32 min_freq_softlimit;
> +	u32 max_freq_softlimit;
> +
> +	struct {
> +		u32 param_id;
> +		u32 param_value;
> +		u32 param_override;
> +	} debug;

can you add all these extra fields in patches which will need them?

Michal

>  };
>  
>  int intel_guc_slpc_init(struct intel_guc_slpc *slpc);
> 

