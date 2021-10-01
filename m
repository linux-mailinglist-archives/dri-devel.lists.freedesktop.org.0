Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 998B841E91D
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 10:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 670476ED1A;
	Fri,  1 Oct 2021 08:33:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1880D6E52E;
 Fri,  1 Oct 2021 08:33:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="310917725"
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; d="scan'208";a="310917725"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 01:33:56 -0700
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; d="scan'208";a="520877842"
Received: from bansiong-mobl.gar.corp.intel.com (HELO [10.215.255.6])
 ([10.215.255.6])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 01:33:54 -0700
Subject: Re: [PATCH v3] drm/i915/ttm: Rework object initialization slightly
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
References: <20210930113236.583531-1-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <d93081f6-7f96-4a26-7423-c2c4048bb06f@intel.com>
Date: Fri, 1 Oct 2021 09:33:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210930113236.583531-1-thomas.hellstrom@linux.intel.com>
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

On 30/09/2021 12:32, Thomas Hellström wrote:
> We may end up in i915_ttm_bo_destroy() in an error path before the
> object is fully initialized. In that case it's not correct to call
> __i915_gem_free_object(), because that function
> a) Assumes the gem object refcount is 0, which it isn't.
> b) frees the placements which are owned by the caller until the
> init_object() region ops returns successfully. Fix this by providing
> a lightweight cleanup function __i915_gem_object_fini() which is also
> called by __i915_gem_free_object().
> 
> While doing this, also make sure we call dma_resv_fini() as part of
> ordinary object destruction and not from the RCU callback that frees
> the object. This will help track down bugs where the object is incorrectly
> locked from an RCU lookup.
> 
> Finally, make sure the object isn't put on the region list until it's
> either locked or fully initialized in order to block list processing of
> partially initialized objects.
> 
> v2:
> - The TTM object backend memory was freed before the gem pages were
>    put. Separate this functionality into __i915_gem_object_pages_fini()
>    and call it from the TTM delete_mem_notify() callback.
> v3:
> - Include i915_gem_object_free_mmaps() in __i915_gem_object_pages_fini()
>    to make sure we don't inadvertedly introduce a race.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com> #v1

R-b still stands.

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_object.c | 43 +++++++++++++++++++---
>   drivers/gpu/drm/i915/gem/i915_gem_object.h |  5 +++
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c    | 36 +++++++++++-------
>   3 files changed, 64 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 6fb9afb65034..b88b121e244a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -89,6 +89,22 @@ void i915_gem_object_init(struct drm_i915_gem_object *obj,
>   	mutex_init(&obj->mm.get_dma_page.lock);
>   }
>   
> +/**
> + * i915_gem_object_fini - Clean up a GEM object initialization
> + * @obj: The gem object to cleanup
> + *
> + * This function cleans up gem object fields that are set up by
> + * drm_gem_private_object_init() and i915_gem_object_init().
> + * It's primarily intended as a helper for backends that need to
> + * clean up the gem object in separate steps.
> + */
> +void __i915_gem_object_fini(struct drm_i915_gem_object *obj)
> +{
> +	mutex_destroy(&obj->mm.get_page.lock);
> +	mutex_destroy(&obj->mm.get_dma_page.lock);
> +	dma_resv_fini(&obj->base._resv);
> +}
> +
>   /**
>    * Mark up the object's coherency levels for a given cache_level
>    * @obj: #drm_i915_gem_object
> @@ -174,7 +190,6 @@ void __i915_gem_free_object_rcu(struct rcu_head *head)
>   		container_of(head, typeof(*obj), rcu);
>   	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>   
> -	dma_resv_fini(&obj->base._resv);
>   	i915_gem_object_free(obj);
>   
>   	GEM_BUG_ON(!atomic_read(&i915->mm.free_count));
> @@ -204,10 +219,17 @@ static void __i915_gem_object_free_mmaps(struct drm_i915_gem_object *obj)
>   	}
>   }
>   
> -void __i915_gem_free_object(struct drm_i915_gem_object *obj)
> +/**
> + * __i915_gem_object_pages_fini - Clean up pages use of a gem object
> + * @obj: The gem object to clean up
> + *
> + * This function cleans up usage of the object mm.pages member. It
> + * is intended for backends that need to clean up a gem object in
> + * separate steps and needs to be called when the object is idle before
> + * the object's backing memory is freed.
> + */
> +void __i915_gem_object_pages_fini(struct drm_i915_gem_object *obj)
>   {
> -	trace_i915_gem_object_destroy(obj);
> -
>   	if (!list_empty(&obj->vma.list)) {
>   		struct i915_vma *vma;
>   
> @@ -233,11 +255,17 @@ void __i915_gem_free_object(struct drm_i915_gem_object *obj)
>   
>   	__i915_gem_object_free_mmaps(obj);
>   
> -	GEM_BUG_ON(!list_empty(&obj->lut_list));
> -
>   	atomic_set(&obj->mm.pages_pin_count, 0);
>   	__i915_gem_object_put_pages(obj);
>   	GEM_BUG_ON(i915_gem_object_has_pages(obj));
> +}
> +
> +void __i915_gem_free_object(struct drm_i915_gem_object *obj)
> +{
> +	trace_i915_gem_object_destroy(obj);
> +
> +	GEM_BUG_ON(!list_empty(&obj->lut_list));
> +
>   	bitmap_free(obj->bit_17);
>   
>   	if (obj->base.import_attach)
> @@ -253,6 +281,8 @@ void __i915_gem_free_object(struct drm_i915_gem_object *obj)
>   
>   	if (obj->shares_resv_from)
>   		i915_vm_resv_put(obj->shares_resv_from);
> +
> +	__i915_gem_object_fini(obj);
>   }
>   
>   static void __i915_gem_free_objects(struct drm_i915_private *i915,
> @@ -266,6 +296,7 @@ static void __i915_gem_free_objects(struct drm_i915_private *i915,
>   			obj->ops->delayed_free(obj);
>   			continue;
>   		}
> +		__i915_gem_object_pages_fini(obj);
>   		__i915_gem_free_object(obj);
>   
>   		/* But keep the pointer alive for RCU-protected lookups */
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> index 3043fcbd31bd..7f9f2e5ba0ec 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -58,6 +58,9 @@ void i915_gem_object_init(struct drm_i915_gem_object *obj,
>   			  const struct drm_i915_gem_object_ops *ops,
>   			  struct lock_class_key *key,
>   			  unsigned alloc_flags);
> +
> +void __i915_gem_object_fini(struct drm_i915_gem_object *obj);
> +
>   struct drm_i915_gem_object *
>   i915_gem_object_create_shmem(struct drm_i915_private *i915,
>   			     resource_size_t size);
> @@ -582,6 +585,8 @@ bool i915_gem_object_is_shmem(const struct drm_i915_gem_object *obj);
>   
>   void __i915_gem_free_object_rcu(struct rcu_head *head);
>   
> +void __i915_gem_object_pages_fini(struct drm_i915_gem_object *obj);
> +
>   void __i915_gem_free_object(struct drm_i915_gem_object *obj);
>   
>   bool i915_gem_object_evictable(struct drm_i915_gem_object *obj);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index b94497989995..a0ab5c44627b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -367,8 +367,10 @@ static void i915_ttm_delete_mem_notify(struct ttm_buffer_object *bo)
>   {
>   	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>   
> -	if (likely(obj))
> +	if (likely(obj)) {
> +		__i915_gem_object_pages_fini(obj);
>   		i915_ttm_free_cached_io_st(obj);
> +	}
>   }
>   
>   static struct intel_memory_region *
> @@ -813,12 +815,9 @@ static void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
>    */
>   static void i915_ttm_delayed_free(struct drm_i915_gem_object *obj)
>   {
> -	if (obj->ttm.created) {
> -		ttm_bo_put(i915_gem_to_ttm(obj));
> -	} else {
> -		__i915_gem_free_object(obj);
> -		call_rcu(&obj->rcu, __i915_gem_free_object_rcu);
> -	}
> +	GEM_BUG_ON(!obj->ttm.created);
> +
> +	ttm_bo_put(i915_gem_to_ttm(obj));
>   }
>   
>   static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
> @@ -898,16 +897,19 @@ void i915_ttm_bo_destroy(struct ttm_buffer_object *bo)
>   {
>   	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>   
> -	i915_ttm_backup_free(obj);
> -
> -	/* This releases all gem object bindings to the backend. */
> -	__i915_gem_free_object(obj);
> -
>   	i915_gem_object_release_memory_region(obj);
>   	mutex_destroy(&obj->ttm.get_io_page.lock);
>   
> -	if (obj->ttm.created)
> +	if (obj->ttm.created) {
> +		i915_ttm_backup_free(obj);
> +
> +		/* This releases all gem object bindings to the backend. */
> +		__i915_gem_free_object(obj);
> +
>   		call_rcu(&obj->rcu, __i915_gem_free_object_rcu);
> +	} else {
> +		__i915_gem_object_fini(obj);
> +	}
>   }
>   
>   /**
> @@ -936,7 +938,11 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
>   
>   	drm_gem_private_object_init(&i915->drm, &obj->base, size);
>   	i915_gem_object_init(obj, &i915_gem_ttm_obj_ops, &lock_class, flags);
> -	i915_gem_object_init_memory_region(obj, mem);
> +
> +	/* Don't put on a region list until we're either locked or fully initialized. */
> +	obj->mm.region = intel_memory_region_get(mem);
> +	INIT_LIST_HEAD(&obj->mm.region_link);
> +
>   	i915_gem_object_make_unshrinkable(obj);
>   	INIT_RADIX_TREE(&obj->ttm.get_io_page.radix, GFP_KERNEL | __GFP_NOWARN);
>   	mutex_init(&obj->ttm.get_io_page.lock);
> @@ -963,6 +969,8 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
>   		return i915_ttm_err_to_gem(ret);
>   
>   	obj->ttm.created = true;
> +	i915_gem_object_release_memory_region(obj);
> +	i915_gem_object_init_memory_region(obj, mem);
>   	i915_ttm_adjust_domains_after_move(obj);
>   	i915_ttm_adjust_gem_after_move(obj);
>   	i915_gem_object_unlock(obj);
> 
