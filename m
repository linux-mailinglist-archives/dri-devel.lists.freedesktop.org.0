Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFB3403888
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 13:07:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CAF6E18E;
	Wed,  8 Sep 2021 11:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545726E18E;
 Wed,  8 Sep 2021 11:07:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="281469100"
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; d="scan'208";a="281469100"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 04:07:19 -0700
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; d="scan'208";a="538503413"
Received: from cofaolai-mobl1.ger.corp.intel.com (HELO [10.213.198.69])
 ([10.213.198.69])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 04:07:18 -0700
Subject: Re: [PATCH v2 5/6] drm/i915: Don't back up pinned LMEM context images
 and rings during suspend
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
References: <20210906165515.450541-1-thomas.hellstrom@linux.intel.com>
 <20210906165515.450541-6-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <160c96ac-3cf2-5542-9ad0-bbc0b5ebec55@intel.com>
Date: Wed, 8 Sep 2021 12:07:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210906165515.450541-6-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/09/2021 17:55, Thomas Hellström wrote:
> Pinned context images are now reset during resume. Don't back them up,
> and assuming that rings can be assumed empty at suspend, don't back them
> up either.
> 
> Introduce a new object flag, I915_BO_ALLOC_PM_VOLATILE meaning that an
> object is allowed to lose its content on suspend.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   .../gpu/drm/i915/gem/i915_gem_object_types.h    | 17 ++++++++++-------
>   drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c      |  3 +++
>   drivers/gpu/drm/i915/gt/intel_lrc.c             |  3 ++-
>   drivers/gpu/drm/i915/gt/intel_ring.c            |  3 ++-
>   4 files changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> index 734cc8e16481..66123ba46247 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -288,16 +288,19 @@ struct drm_i915_gem_object {
>   	I915_SELFTEST_DECLARE(struct list_head st_link);
>   
>   	unsigned long flags;
> -#define I915_BO_ALLOC_CONTIGUOUS BIT(0)
> -#define I915_BO_ALLOC_VOLATILE   BIT(1)
> -#define I915_BO_ALLOC_CPU_CLEAR  BIT(2)
> -#define I915_BO_ALLOC_USER       BIT(3)
> +#define I915_BO_ALLOC_CONTIGUOUS  BIT(0)
> +#define I915_BO_ALLOC_VOLATILE    BIT(1)
> +#define I915_BO_ALLOC_CPU_CLEAR   BIT(2)
> +#define I915_BO_ALLOC_USER        BIT(3)
> +/* Object may lose its contents on suspend / resume */
> +#define I915_BO_ALLOC_PM_VOLATILE BIT(4)

PM_SKIP_PINNED? Not sure if that is better.


>   #define I915_BO_ALLOC_FLAGS (I915_BO_ALLOC_CONTIGUOUS | \
>   			     I915_BO_ALLOC_VOLATILE | \
>   			     I915_BO_ALLOC_CPU_CLEAR | \
> -			     I915_BO_ALLOC_USER)
> -#define I915_BO_READONLY         BIT(4)
> -#define I915_TILING_QUIRK_BIT    5 /* unknown swizzling; do not release! */
> +			     I915_BO_ALLOC_USER | \
> +			     I915_BO_ALLOC_PM_VOLATILE)
> +#define I915_BO_READONLY          BIT(5)
> +#define I915_TILING_QUIRK_BIT     6 /* unknown swizzling; do not release! */
>   
>   	/**
>   	 * @mem_flags - Mutable placement-related flags
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> index 3884bf45dab8..eaceecfc3f19 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
> @@ -61,6 +61,9 @@ static int i915_ttm_backup(struct i915_gem_apply_to_region *apply,
>   	if (!pm_apply->backup_pinned)
>   		return 0;
>   
> +	if (obj->flags & I915_BO_ALLOC_PM_VOLATILE)
> +		return 0;
> +
>   	sys_region = i915->mm.regions[INTEL_REGION_SMEM];
>   	backup = i915_gem_object_create_region(sys_region,
>   					       obj->base.size,
> diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
> index 6ba8daea2f56..3ef9eaf8c50e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
> @@ -942,7 +942,8 @@ __lrc_alloc_state(struct intel_context *ce, struct intel_engine_cs *engine)
>   		context_size += PAGE_SIZE;
>   	}
>   
> -	obj = i915_gem_object_create_lmem(engine->i915, context_size, 0);
> +	obj = i915_gem_object_create_lmem(engine->i915, context_size,
> +					  I915_BO_ALLOC_PM_VOLATILE);
>   	if (IS_ERR(obj))
>   		obj = i915_gem_object_create_shmem(engine->i915, context_size);
>   	if (IS_ERR(obj))
> diff --git a/drivers/gpu/drm/i915/gt/intel_ring.c b/drivers/gpu/drm/i915/gt/intel_ring.c
> index 7c4d5158e03b..2fdd52b62092 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ring.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ring.c
> @@ -112,7 +112,8 @@ static struct i915_vma *create_ring_vma(struct i915_ggtt *ggtt, int size)
>   	struct drm_i915_gem_object *obj;
>   	struct i915_vma *vma;
>   
> -	obj = i915_gem_object_create_lmem(i915, size, I915_BO_ALLOC_VOLATILE);
> +	obj = i915_gem_object_create_lmem(i915, size, I915_BO_ALLOC_VOLATILE |
> +					  I915_BO_ALLOC_PM_VOLATILE);
>   	if (IS_ERR(obj) && i915_ggtt_has_aperture(ggtt))
>   		obj = i915_gem_object_create_stolen(i915, size);
>   	if (IS_ERR(obj))
> 
