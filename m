Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADCEB458C6
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 15:25:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D6C10EBA1;
	Fri,  5 Sep 2025 13:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="iQCPpIZz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C56310EBA5
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 13:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757078711;
 bh=BS0xC4jZDN4Cw681SJQ0Y1uQQnmS34hv3RPDCvazEHU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iQCPpIZzpr51DwmAs3y+Oa9EQd533DsUyszJqmaUn5dK2tp1Y1vnyRZCB6Igmmu5g
 e3/CErHdhLAmeBqbRiQDWM5xte8u7aex7rURJ9i5hMJlOYc9tNgzN0+9+M6X2sIRtR
 pJt03tvBrVtMPBsaGyN4khVukCF34UO6IhFqkR6sHsyUoPCDcGsPROTTdJQ/zhsidI
 s5RgCU/3ThkASVVRDkxdxBRPeLutrwiWzN66FDiM8PqUYMa1fyc84t+7kuMxue1i6F
 lnSySrT3AQ4aWnPwhqRpeqbLfEGKbI02mdW6b96/XJutJzVHrXUh5WSpWK/GYs9ZIS
 YNboU91InIk7A==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 342D117E0B85;
 Fri,  5 Sep 2025 15:25:11 +0200 (CEST)
Date: Fri, 5 Sep 2025 15:25:05 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, "Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?="
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, Liviu Dudau
 <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/gpuvm: add deferred vm_bo cleanup
Message-ID: <20250905152505.005a610d@fedora>
In-Reply-To: <20250905-vmbo-defer-v1-1-7ae1a382b674@google.com>
References: <20250905-vmbo-defer-v1-0-7ae1a382b674@google.com>
 <20250905-vmbo-defer-v1-1-7ae1a382b674@google.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri, 05 Sep 2025 12:11:28 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> When using GPUVM in immediate mode, it is necessary to call
> drm_gpuvm_unlink() from the fence signalling critical path. However,
> unlink may call drm_gpuvm_bo_put(), which causes some challenges:
> 
> 1. drm_gpuvm_bo_put() often requires you to take resv locks, which you
>    can't do from the fence signalling critical path.
> 2. drm_gpuvm_bo_put() calls drm_gem_object_put(), which is often going
>    to be unsafe to call from the fence signalling critical path.
> 
> To solve these issues, add a deferred version of drm_gpuvm_unlink() that
> adds the vm_bo to a deferred cleanup list, and then clean it up later.
> 
> The new methods take the GEMs GPUVA lock internally rather than letting
> the caller do it because it also needs to perform an operation after
> releasing the mutex again. This is to prevent freeing the GEM while
> holding the mutex (more info as comments in the patch). This means that
> the new methods can only be used with DRM_GPUVM_IMMEDIATE_MODE.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/gpu/drm/drm_gpuvm.c | 167 ++++++++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_gpuvm.h     |  26 +++++++
>  2 files changed, 193 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 78a1a4f095095e9379bdf604d583f6c8b9863ccb..849b6c08f83dcba832eda372bd3ce62b540e144b 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -876,6 +876,25 @@ __drm_gpuvm_bo_list_add(struct drm_gpuvm *gpuvm, spinlock_t *lock,
>  	cond_spin_unlock(lock, !!lock);
>  }
>  
> +/**
> + * drm_gpuvm_bo_is_dead() - check whether this vm_bo is scheduled for cleanup
> + * @vm_bo: the &drm_gpuvm_bo
> + *
> + * When a vm_bo is scheduled for cleanup using the bo_defer list, it is not
> + * immediately removed from the evict and extobj lists.

Maybe mention that it can't be, because those lists are protected with
the resv lock and we can't take this lock when we're in immediate mode?

> Therefore, anyone
> + * iterating these lists should skip entries that are being destroyed.
> + *
> + * Checking the refcount without incrementing it is okay as long as the lock
> + * protecting the evict/extobj list is held for as long as you are using the
> + * vm_bo, because even if the refcount hits zero while you are using it, freeing
> + * the vm_bo requires taking the list's lock.
> + */
> +static bool
> +drm_gpuvm_bo_is_dead(struct drm_gpuvm_bo *vm_bo)
> +{
> +	return !kref_read(&vm_bo->kref);

I'm not too sure I like the idea of [ab]using vm_bo::kref to defer the
vm_bo release. I get why it's done like that, but I'm wondering why we
don't defer the release of drm_gpuva objects instead (which is really
what's being released in va_unlink()). I can imagine drivers wanting to
attach resources to the gpuva that can't be released in the
dma-signalling path in the future, and if we're doing that at the gpuva
level, we also get rid of this kref dance, since the va will hold a
vm_bo ref until it's destroyed.

Any particular reason you went for vm_bo destruction deferral instead
of gpuva?

> +}
> +
>  /**
>   * drm_gpuvm_bo_list_add() - insert a vm_bo into the given list
>   * @__vm_bo: the &drm_gpuvm_bo
> @@ -1081,6 +1100,9 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
>  	INIT_LIST_HEAD(&gpuvm->evict.list);
>  	spin_lock_init(&gpuvm->evict.lock);
>  
> +	INIT_LIST_HEAD(&gpuvm->bo_defer.list);
> +	spin_lock_init(&gpuvm->bo_defer.lock);
> +
>  	kref_init(&gpuvm->kref);
>  
>  	gpuvm->name = name ? name : "unknown";
> @@ -1122,6 +1144,8 @@ drm_gpuvm_fini(struct drm_gpuvm *gpuvm)
>  		 "Extobj list should be empty.\n");
>  	drm_WARN(gpuvm->drm, !list_empty(&gpuvm->evict.list),
>  		 "Evict list should be empty.\n");
> +	drm_WARN(gpuvm->drm, !list_empty(&gpuvm->bo_defer.list),
> +		 "VM BO cleanup list should be empty.\n");
>  
>  	drm_gem_object_put(gpuvm->r_obj);
>  }
> @@ -1217,6 +1241,9 @@ drm_gpuvm_prepare_objects_locked(struct drm_gpuvm *gpuvm,
>  
>  	drm_gpuvm_resv_assert_held(gpuvm);
>  	list_for_each_entry(vm_bo, &gpuvm->extobj.list, list.entry.extobj) {
> +		if (drm_gpuvm_bo_is_dead(vm_bo))
> +			continue;
> +
>  		ret = exec_prepare_obj(exec, vm_bo->obj, num_fences);
>  		if (ret)
>  			break;
> @@ -1460,6 +1487,9 @@ drm_gpuvm_validate_locked(struct drm_gpuvm *gpuvm, struct drm_exec *exec)
>  
>  	list_for_each_entry_safe(vm_bo, next, &gpuvm->evict.list,
>  				 list.entry.evict) {
> +		if (drm_gpuvm_bo_is_dead(vm_bo))
> +			continue;
> +
>  		ret = ops->vm_bo_validate(vm_bo, exec);
>  		if (ret)
>  			break;
> @@ -1560,6 +1590,7 @@ drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
>  
>  	INIT_LIST_HEAD(&vm_bo->list.entry.extobj);
>  	INIT_LIST_HEAD(&vm_bo->list.entry.evict);
> +	INIT_LIST_HEAD(&vm_bo->list.entry.bo_defer);
>  
>  	return vm_bo;
>  }
> @@ -1621,6 +1652,106 @@ drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo)
>  }
>  EXPORT_SYMBOL_GPL(drm_gpuvm_bo_put);
>  
> +static void
> +drm_gpuvm_bo_defer_locked(struct kref *kref)
> +{
> +	struct drm_gpuvm_bo *vm_bo = container_of(kref, struct drm_gpuvm_bo,
> +						  kref);
> +	struct drm_gpuvm *gpuvm = vm_bo->vm;
> +
> +	if (!drm_gpuvm_resv_protected(gpuvm)) {
> +		drm_gpuvm_bo_list_del(vm_bo, extobj, true);
> +		drm_gpuvm_bo_list_del(vm_bo, evict, true);
> +	}
> +
> +	list_del(&vm_bo->list.entry.gem);
> +	mutex_unlock(&vm_bo->obj->gpuva.lock);

I got tricked by this implicit unlock, and the conditional unlocks it
creates in drm_gpuva_unlink_defer(). Honestly, I'd rather see this
unlocked moved to drm_gpuva_unlink_defer() and a conditional unlock
added to drm_gpuvm_bo_put_deferred(), because it's easier to reason
about when the lock/unlock calls are in the same function
(kref_put_mutex() being the equivalent of a conditional lock).

> +}
> +
> +/**
> + * drm_gpuvm_bo_put_deferred() - drop a struct drm_gpuvm_bo reference with
> + * deferred cleanup
> + * @vm_bo: the &drm_gpuvm_bo to release the reference of
> + *
> + * This releases a reference to @vm_bo.
> + *
> + * This might take and release the GEMs GPUVA lock. You should call
> + * drm_gpuvm_bo_deferred_cleanup() later to complete the cleanup process.
> + *
> + * Returns: true if vm_bo is being destroyed, false otherwise.
> + */
> +bool
> +drm_gpuvm_bo_put_deferred(struct drm_gpuvm_bo *vm_bo)
> +{
> +	bool defer;
> +
> +	drm_WARN_ON(vm_bo->vm->drm, !drm_gpuvm_immediate_mode(vm_bo->vm));
> +
> +	if (!vm_bo)
> +		return false;
> +
> +	defer = kref_put_mutex(&vm_bo->kref, drm_gpuvm_bo_defer_locked,
> +			       &vm_bo->obj->gpuva.lock);
> +
> +	/*
> +	 * It's important that the GEM stays alive for the duration in which
> +	 * drm_gpuvm_bo_defer_locked() holds the mutex, but the instant we add
> +	 * the vm_bo to bo_defer, another thread might call
> +	 * drm_gpuvm_bo_deferred_cleanup() and put the GEM. For this reason, we
> +	 * add the vm_bo to bo_defer after releasing the GEM's mutex.
> +	 */
> +	if (defer)
> +		drm_gpuvm_bo_list_add(vm_bo, bo_defer, true);
> +
> +	return defer;
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuvm_bo_put_deferred);
> +
> +/**
> + * drm_gpuvm_bo_deferred_cleanup() - clean up BOs in the deferred list
> + * deferred cleanup
> + * @gpuvm: the VM to clean up
> + *
> + * Cleans up &drm_gpuvm_bo instances in the deferred cleanup list.
> + */
> +void
> +drm_gpuvm_bo_deferred_cleanup(struct drm_gpuvm *gpuvm)
> +{
> +	const struct drm_gpuvm_ops *ops = gpuvm->ops;
> +	struct drm_gpuvm_bo *vm_bo;
> +	struct drm_gem_object *obj;
> +	LIST_HEAD(bo_defer);
> +
> +	spin_lock(&gpuvm->bo_defer.lock);
> +	list_replace_init(&gpuvm->bo_defer.list, &bo_defer);
> +	spin_unlock(&gpuvm->bo_defer.lock);
> +
> +	if (drm_gpuvm_resv_protected(gpuvm)) {
> +		dma_resv_lock(drm_gpuvm_resv(gpuvm), NULL);
> +		list_for_each_entry(vm_bo, &bo_defer, list.entry.bo_defer) {
> +			drm_gpuvm_bo_list_del(vm_bo, extobj, false);
> +			drm_gpuvm_bo_list_del(vm_bo, evict, false);
> +		}
> +		dma_resv_unlock(drm_gpuvm_resv(gpuvm));
> +	}
> +
> +	while (!list_empty(&bo_defer)) {
> +		vm_bo = list_first_entry(&bo_defer,
> +			struct drm_gpuvm_bo, list.entry.bo_defer);
> +		obj = vm_bo->obj;
> +
> +		list_del(&vm_bo->list.entry.bo_defer);
> +		if (ops && ops->vm_bo_free)
> +			ops->vm_bo_free(vm_bo);
> +		else
> +			kfree(vm_bo);
> +
> +		drm_gpuvm_put(gpuvm);
> +		drm_gem_object_put(obj);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuvm_bo_deferred_cleanup);
> +
>  static struct drm_gpuvm_bo *
>  __drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
>  		    struct drm_gem_object *obj)
> @@ -1948,6 +2079,42 @@ drm_gpuva_unlink(struct drm_gpuva *va)
>  }
>  EXPORT_SYMBOL_GPL(drm_gpuva_unlink);
>  
> +/**
> + * drm_gpuva_unlink_defer() - unlink a &drm_gpuva with deferred vm_bo cleanup
> + * @va: the &drm_gpuva to unlink
> + *
> + * Similar to drm_gpuva_unlink(), but uses drm_gpuvm_bo_put_deferred() and takes
> + * the lock for the caller.
> + */
> +void
> +drm_gpuva_unlink_defer(struct drm_gpuva *va)
> +{
> +	struct drm_gem_object *obj = va->gem.obj;
> +	struct drm_gpuvm_bo *vm_bo = va->vm_bo;
> +
> +	if (unlikely(!obj))
> +		return;
> +
> +	drm_WARN_ON(vm_bo->vm->drm, !drm_gpuvm_immediate_mode(vm_bo->vm));
> +
> +	mutex_lock(&obj->gpuva.lock);
> +	list_del_init(&va->gem.entry);
> +
> +	/*
> +	 * This is drm_gpuvm_bo_put_deferred() slightly modified since we
> +	 * already hold the mutex. It's important that we add the vm_bo to
> +	 * bo_defer after releasing the mutex for the same reason as in
> +	 * drm_gpuvm_bo_put_deferred().
> +	 */
> +	if (kref_put(&vm_bo->kref, drm_gpuvm_bo_defer_locked))
> +		drm_gpuvm_bo_list_add(vm_bo, bo_defer, true);
> +	else
> +		mutex_unlock(&obj->gpuva.lock);
> +
> +	va->vm_bo = NULL;
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuva_unlink_defer);
> +
>  /**
>   * drm_gpuva_find_first() - find the first &drm_gpuva in the given range
>   * @gpuvm: the &drm_gpuvm to search in
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 727b8f336fad0d853998e4379cbd374155468e18..1f80389e14312f552a8abc95d12f52f83beb9be8 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -152,6 +152,7 @@ void drm_gpuva_remove(struct drm_gpuva *va);
>  
>  void drm_gpuva_link(struct drm_gpuva *va, struct drm_gpuvm_bo *vm_bo);
>  void drm_gpuva_unlink(struct drm_gpuva *va);
> +void drm_gpuva_unlink_defer(struct drm_gpuva *va);
>  
>  struct drm_gpuva *drm_gpuva_find(struct drm_gpuvm *gpuvm,
>  				 u64 addr, u64 range);
> @@ -331,6 +332,22 @@ struct drm_gpuvm {
>  		 */
>  		spinlock_t lock;
>  	} evict;
> +
> +	/**
> +	 * @bo_defer: structure holding vm_bos that need to be destroyed
> +	 */
> +	struct {
> +		/**
> +		 * @bo_defer.list: &list_head storing &drm_gpuvm_bos that need
> +		 * to be destroyed
> +		 */
> +		struct list_head list;
> +
> +		/**
> +		 * @bo_defer.lock: spinlock to protect the bo_defer list
> +		 */
> +		spinlock_t lock;
> +	} bo_defer;
>  };
>  
>  void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
> @@ -714,6 +731,12 @@ struct drm_gpuvm_bo {
>  			 * &drm_gpuvms evict list.
>  			 */
>  			struct list_head evict;
> +
> +			/**
> +			 * @list.entry.bo_defer: List entry to attach to
> +			 * the &drm_gpuvms bo_defer list.
> +			 */
> +			struct list_head bo_defer;
>  		} entry;
>  	} list;
>  };
> @@ -746,6 +769,9 @@ drm_gpuvm_bo_get(struct drm_gpuvm_bo *vm_bo)
>  
>  bool drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo);
>  
> +bool drm_gpuvm_bo_put_deferred(struct drm_gpuvm_bo *vm_bo);
> +void drm_gpuvm_bo_deferred_cleanup(struct drm_gpuvm *gpuvm);
> +
>  struct drm_gpuvm_bo *
>  drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
>  		  struct drm_gem_object *obj);
> 

