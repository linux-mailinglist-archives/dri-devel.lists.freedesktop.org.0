Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A401F604CE5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 18:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08C610EB0D;
	Wed, 19 Oct 2022 16:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E86310E9DC;
 Wed, 19 Oct 2022 16:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666196168; x=1697732168;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yUF8swZTeykYvYIS0RdvgDV4PFuuqOIV0Wg2Nn65pGU=;
 b=SuSsSZX8hRR1s2ZemCdfME+4vo/6692NEDWJQqVDw14rjMcfs23En79S
 enjPilzHZpsXkBpHm4FG4ZDB0QksjVV69A/tpX1FRZczTBh3T3tC+cdWN
 mkpfDsbsA3yu42mJQL5a0bd9K/NFKrtQcrLF83tLixjWTYjDfaXERstdN
 pFQJVWJ314a84riIQr5+Lmyw9YWlsx4zOrrjaOOfMZQSOwTg0ymC+s5pq
 WlNXl1a1b7CiiCoC0eAtMNuB5IhF99GlmLW4CAS1LC6Zf7nqaijyY2fRQ
 2CqV1QpHvPTlQ0Yk0Afelln9tfZlsV2NlzbLOXlXw5wIixpTvEuyepyYv A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="306449746"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="306449746"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 09:07:37 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="624199579"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="624199579"
Received: from abyrne1-mobl1.ger.corp.intel.com (HELO [10.252.27.172])
 ([10.252.27.172])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 09:07:34 -0700
Message-ID: <33e7d512-c78d-dfff-0bcd-0cdf94af384a@intel.com>
Date: Wed, 19 Oct 2022 17:07:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.1
Subject: Re: [PATCH v4 13/17] drm/i915/vm_bind: Update
 i915_vma_verify_bind_complete()
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20221018071630.3831-1-niranjana.vishwanathapura@intel.com>
 <20221018071630.3831-14-niranjana.vishwanathapura@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20221018071630.3831-14-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, jason@jlekstrand.net, andi.shyti@linux.intel.com,
 daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/10/2022 08:16, Niranjana Vishwanathapura wrote:
> Ensure i915_vma_verify_bind_complete() handles case where bind
> is not initiated. Also make it non static, add documentation
> and move it out of CONFIG_DRM_I915_DEBUG_GEM.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/i915_vma.c | 16 +++++++++++-----
>   drivers/gpu/drm/i915/i915_vma.h |  1 +
>   2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index eaa13e9ba966..4975fc662c86 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -439,12 +439,21 @@ int i915_vma_sync(struct i915_vma *vma)
>   	return i915_vm_sync(vma->vm);
>   }
>   
> -#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
> -static int i915_vma_verify_bind_complete(struct i915_vma *vma)
> +/**
> + * i915_vma_verify_bind_complete() - Check for the bind completion of the vma
> + * @vma: vma to check for bind completion

Maybe mention the locking since this is now more than just DEBUG_GEM 
stuff. I assume we need the object lock or otherwise some guarantee that 
the vma is pinned?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> + *
> + * Returns: 0 if the vma bind is completed. Error code otherwise.
> + */
> +int i915_vma_verify_bind_complete(struct i915_vma *vma)
>   {
>   	struct dma_fence *fence = i915_active_fence_get(&vma->active.excl);
>   	int err;
>   
> +	/* Ensure vma bind is initiated */
> +	if (!i915_vma_is_bound(vma, I915_VMA_BIND_MASK))
> +		return -EINVAL;
> +
>   	if (!fence)
>   		return 0;
>   
> @@ -457,9 +466,6 @@ static int i915_vma_verify_bind_complete(struct i915_vma *vma)
>   
>   	return err;
>   }
> -#else
> -#define i915_vma_verify_bind_complete(_vma) 0
> -#endif
>   
>   I915_SELFTEST_EXPORT void
>   i915_vma_resource_init_from_vma(struct i915_vma_resource *vma_res,
> diff --git a/drivers/gpu/drm/i915/i915_vma.h b/drivers/gpu/drm/i915/i915_vma.h
> index 1cadbf8fdedf..04770f8ba815 100644
> --- a/drivers/gpu/drm/i915/i915_vma.h
> +++ b/drivers/gpu/drm/i915/i915_vma.h
> @@ -440,6 +440,7 @@ void i915_vma_make_purgeable(struct i915_vma *vma);
>   
>   int i915_vma_wait_for_bind(struct i915_vma *vma);
>   int i915_vma_sync(struct i915_vma *vma);
> +int i915_vma_verify_bind_complete(struct i915_vma *vma);
>   
>   /**
>    * i915_vma_get_current_resource - Get the current resource of the vma
