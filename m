Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA6F487420
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 09:33:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D8411AC63;
	Fri,  7 Jan 2022 08:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B692411AC63;
 Fri,  7 Jan 2022 08:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641544392; x=1673080392;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hKe0mUEjIeS7jBjUHwJ+anYZx5VErBu/WlH05uinMFM=;
 b=HjXzdVtqq0iJWILqBhDJYQ4URPS/66UaRgAdbP90zEqTk8KF+a879aOF
 6BQY+oyXbzE0OooJ1cKVqwDwDsHwsXZouOcJUGziZzOyT0OlnTf4aQJSG
 DvONQ6vudGaqDHCEdjvkUqJvnC8teR9VzchSKR6q8lcMNTUUwoRdWOimA
 Uxtrg+gf2NnpQLbv1Cz74KpudkFd6Yo0F8gB3YV1Txt9vCqF6VoH6eCNr
 gWzu/hGLjjM2Op5dAE0eSxoafK5cpla3B2jcDtXufI4zSIfQZg6/FQYVl
 9udJF38x9mxFYpzrpP4upXR+sJd08/Gws5kH58pPw8M4B/C1yK+byLEsE g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="267128017"
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600"; d="scan'208";a="267128017"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 00:33:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600"; d="scan'208";a="763784135"
Received: from asparren-mobl2.ger.corp.intel.com (HELO [10.249.254.124])
 ([10.249.254.124])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 00:33:10 -0800
Message-ID: <4d0d3894-e711-841c-07ed-1516f01dc9c0@linux.intel.com>
Date: Fri, 7 Jan 2022 09:33:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 3/4] drm/i915/ttm: add unmap_virtual callback
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220106174910.280616-1-matthew.auld@intel.com>
 <20220106174910.280616-3-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220106174910.280616-3-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/6/22 18:49, Matthew Auld wrote:
> Ensure we call ttm_bo_unmap_virtual when releasing the pages.
> Importantly this should now handle the ttm swapping case, and all other
> places that already call into i915_ttm_move_notify().
>
> v2: fix up the selftest
>
> Fixes: cf3e3e86d779 ("drm/i915: Use ttm mmap handling for ttm bo's.")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Hm.

I guess we've been saved here previously by the fact that TTM calls 
ttm_bo_unmap_virtual()
before calling the move callback.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_mman.c       |  3 +++
>   .../gpu/drm/i915/gem/i915_gem_object_types.h   |  1 +
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c        |  6 ++++++
>   .../gpu/drm/i915/gem/selftests/i915_gem_mman.c | 18 ++++--------------
>   4 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> index ee5ec0fd4807..5ac2506f4ee8 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> @@ -538,6 +538,9 @@ void i915_gem_object_release_mmap_offset(struct drm_i915_gem_object *obj)
>   {
>   	struct i915_mmap_offset *mmo, *mn;
>   
> +	if (obj->ops->unmap_virtual)
> +		obj->ops->unmap_virtual(obj);
> +
>   	spin_lock(&obj->mmo.lock);
>   	rbtree_postorder_for_each_entry_safe(mmo, mn,
>   					     &obj->mmo.offsets, offset) {
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> index f9f7e44099fe..4b4829eb16c2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -67,6 +67,7 @@ struct drm_i915_gem_object_ops {
>   	int (*pwrite)(struct drm_i915_gem_object *obj,
>   		      const struct drm_i915_gem_pwrite *arg);
>   	u64 (*mmap_offset)(struct drm_i915_gem_object *obj);
> +	void (*unmap_virtual)(struct drm_i915_gem_object *obj);
>   
>   	int (*dmabuf_export)(struct drm_i915_gem_object *obj);
>   
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 8d61d4538a64..1530d9f0bc81 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -950,6 +950,11 @@ static u64 i915_ttm_mmap_offset(struct drm_i915_gem_object *obj)
>   	return drm_vma_node_offset_addr(&obj->base.vma_node);
>   }
>   
> +static void i915_ttm_unmap_virtual(struct drm_i915_gem_object *obj)
> +{
> +	ttm_bo_unmap_virtual(i915_gem_to_ttm(obj));
> +}
> +
>   static const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
>   	.name = "i915_gem_object_ttm",
>   	.flags = I915_GEM_OBJECT_IS_SHRINKABLE |
> @@ -965,6 +970,7 @@ static const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops = {
>   	.migrate = i915_ttm_migrate,
>   
>   	.mmap_offset = i915_ttm_mmap_offset,
> +	.unmap_virtual = i915_ttm_unmap_virtual,
>   	.mmap_ops = &vm_ops_ttm,
>   };
>   
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> index 743a098facf2..f61356b72b1c 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> @@ -1369,20 +1369,10 @@ static int __igt_mmap_revoke(struct drm_i915_private *i915,
>   		}
>   	}
>   
> -	if (!obj->ops->mmap_ops) {
> -		err = check_absent(addr, obj->base.size);
> -		if (err) {
> -			pr_err("%s: was not absent\n", obj->mm.region->name);
> -			goto out_unmap;
> -		}
> -	} else {
> -		/* ttm allows access to evicted regions by design */
> -
> -		err = check_present(addr, obj->base.size);
> -		if (err) {
> -			pr_err("%s: was not present\n", obj->mm.region->name);
> -			goto out_unmap;
> -		}
> +	err = check_absent(addr, obj->base.size);
> +	if (err) {
> +		pr_err("%s: was not absent\n", obj->mm.region->name);
> +		goto out_unmap;
>   	}
>   
>   out_unmap:
