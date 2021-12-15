Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 831F1475453
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 09:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F1010E6DA;
	Wed, 15 Dec 2021 08:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445AF10E6DA;
 Wed, 15 Dec 2021 08:35:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="219863418"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="219863418"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 00:35:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; d="scan'208";a="465466957"
Received: from tbarret1-mobl.ger.corp.intel.com (HELO [10.213.212.98])
 ([10.213.212.98])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 00:35:08 -0800
Message-ID: <18951e7a-d0e3-eec7-29aa-5ba0d58e8e53@linux.intel.com>
Date: Wed, 15 Dec 2021 08:35:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] drm/i915: remove writeback hook
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20211214180754.4113036-1-matthew.auld@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20211214180754.4113036-1-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 14/12/2021 18:07, Matthew Auld wrote:
> Ditch the writeback hook and drop i915_gem_object_writeback(). We
> already support the shrinker_release_pages hook which can just call
> shmem_writeback directly.

Looks like a good cleanup to me.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

A couple of bike shedding comments/question only below.

> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_object.h    |  1 -
>   .../gpu/drm/i915/gem/i915_gem_object_types.h  |  1 -
>   drivers/gpu/drm/i915/gem/i915_gem_pages.c     | 10 ----------
>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c     | 19 ++++++++++++++++++-
>   drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  | 12 ------------
>   5 files changed, 18 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> index 66f20b803b01..aaf9183e601b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -455,7 +455,6 @@ i915_gem_object_unpin_pages(struct drm_i915_gem_object *obj)
>   
>   int __i915_gem_object_put_pages(struct drm_i915_gem_object *obj);
>   int i915_gem_object_truncate(struct drm_i915_gem_object *obj);
> -void i915_gem_object_writeback(struct drm_i915_gem_object *obj);
>   
>   /**
>    * i915_gem_object_pin_map - return a contiguous mapping of the entire object
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> index f9f7e44099fe..00c844caeabd 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -57,7 +57,6 @@ struct drm_i915_gem_object_ops {
>   	void (*put_pages)(struct drm_i915_gem_object *obj,
>   			  struct sg_table *pages);
>   	int (*truncate)(struct drm_i915_gem_object *obj);
> -	void (*writeback)(struct drm_i915_gem_object *obj);
>   	int (*shrinker_release_pages)(struct drm_i915_gem_object *obj,
>   				      bool no_gpu_wait,
>   				      bool should_writeback);

Perhaps a simple shrink for the vfunc name would suffice and match 
better with the neighbouring names?

> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> index 49c6e55c68ce..52e975f57956 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
> @@ -168,16 +168,6 @@ int i915_gem_object_truncate(struct drm_i915_gem_object *obj)
>   	return 0;
>   }
>   
> -/* Try to discard unwanted pages */
> -void i915_gem_object_writeback(struct drm_i915_gem_object *obj)
> -{
> -	assert_object_held_shared(obj);
> -	GEM_BUG_ON(i915_gem_object_has_pages(obj));
> -
> -	if (obj->ops->writeback)
> -		obj->ops->writeback(obj);
> -}
> -
>   static void __i915_gem_object_reset_page_iter(struct drm_i915_gem_object *obj)
>   {
>   	struct radix_tree_iter iter;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> index cc9fe258fba7..7fdf4fa10b0e 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
> @@ -331,6 +331,23 @@ shmem_writeback(struct drm_i915_gem_object *obj)
>   	__shmem_writeback(obj->base.size, obj->base.filp->f_mapping);
>   }
>   
> +static int shmem_shrinker_release_pages(struct drm_i915_gem_object *obj,
> +					bool no_gpu_wait,
> +					bool writeback)
> +{
> +	switch (obj->mm.madv) {
> +	case I915_MADV_DONTNEED:
> +		return i915_gem_object_truncate(obj);
> +	case __I915_MADV_PURGED:
> +		return 0;
> +	}
> +
> +	if (writeback)
> +		shmem_writeback(obj);
> +
> +	return 0;
> +}
> +
>   void
>   __i915_gem_object_release_shmem(struct drm_i915_gem_object *obj,
>   				struct sg_table *pages,
> @@ -503,7 +520,7 @@ const struct drm_i915_gem_object_ops i915_gem_shmem_ops = {
>   	.get_pages = shmem_get_pages,
>   	.put_pages = shmem_put_pages,
>   	.truncate = shmem_truncate,
> -	.writeback = shmem_writeback,
> +	.shrinker_release_pages = shmem_shrinker_release_pages,
>   
>   	.pwrite = shmem_pwrite,
>   	.pread = shmem_pread,
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> index 157a9765f483..fd54e05521f6 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
> @@ -61,18 +61,6 @@ static int try_to_writeback(struct drm_i915_gem_object *obj, unsigned int flags)
>   		return obj->ops->shrinker_release_pages(obj,
>   							!(flags & I915_SHRINK_ACTIVE),
>   							flags & I915_SHRINK_WRITEBACK);

Maybe flags would be better than two booleans? (Usually more than one is 
one two many when readability is concerned.) Although they couldn't be 
from I915_SHRINK_ namespace since that "belongs" to the shrinker, and 
granted, there wouldn't be ideal component separation since caller still 
has to have knowledge of shrinking mechanics to decide which ones is 
safe to pass in. So don't know, just thinking out loud.

Regards,

Tvrtko

> -
> -	switch (obj->mm.madv) {
> -	case I915_MADV_DONTNEED:
> -		i915_gem_object_truncate(obj);
> -		return 0;
> -	case __I915_MADV_PURGED:
> -		return 0;
> -	}
> -
> -	if (flags & I915_SHRINK_WRITEBACK)
> -		i915_gem_object_writeback(obj);
> -
>   	return 0;
>   }
>   
> 
