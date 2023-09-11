Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD1879A743
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 12:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB1AD10E2C1;
	Mon, 11 Sep 2023 10:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E5F10E2C1;
 Mon, 11 Sep 2023 10:35:31 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2525E66072F9;
 Mon, 11 Sep 2023 11:35:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694428529;
 bh=6r3vx57qtWVMn0QKt1NqNPP3mFc3ALPRcicl0VS/gvI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=h31UFadycnV6ySm4bv5Hvh70nlQgnoHlrJP4f8/JQDi/B4DN7yF7WWkzYc1ajvA4G
 jXU/AFJBx4KYha6LIy9AXN9i7RbMHYfLsEJceRymKCePFdOXvkhFa027hn0RY+9qR7
 +WO5ghNiH+s2FVgTzfhHnc7WFu7J4rakRN8I70URy5Q3x0trm+r/QfTSXjT2/EpwXd
 Oh+VXfVH39bzdYPP9XRylweA++CLGfZW5DGtmIaivHMJQsb97UiOTe87UXVUstKCfl
 Glm/jAiCd+kzmvdAeKobGRLdkeI+D1C6oooa1CPI5uDrG7TmZj55DEn++fadHkoNsv
 SkwcutlaCSCpg==
Date: Mon, 11 Sep 2023 12:35:26 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v3 6/7] drm/gpuvm: generalize
 dma_resv/extobj handling and GEM validation
Message-ID: <20230911123526.6c67feb0@collabora.com>
In-Reply-To: <20230909153125.30032-7-dakr@redhat.com>
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-7-dakr@redhat.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Danilo,

On Sat,  9 Sep 2023 17:31:13 +0200
Danilo Krummrich <dakr@redhat.com> wrote:


> @@ -632,6 +661,131 @@
>   *	}
>   */
>  
> +/**
> + * get_next_vm_bo_from_list() - get the next vm_bo element
> + * @__gpuvm: The GPU VM
> + * @__list_name: The name of the list we're iterating on
> + * @__local_list: A pointer to the local list used to store already iterated items
> + * @__prev_vm_bo: The previous element we got from drm_gpuvm_get_next_cached_vm_bo()
> + *
> + * This helper is here to provide lockless list iteration. Lockless as in, the
> + * iterator releases the lock immediately after picking the first element from
> + * the list, so list insertion deletion can happen concurrently.
> + *
> + * Elements popped from the original list are kept in a local list, so removal
> + * and is_empty checks can still happen while we're iterating the list.
> + */
> +#define get_next_vm_bo_from_list(__gpuvm, __list_name, __local_list, __prev_vm_bo)	\
> +	({										\
> +		struct drm_gpuvm_bo *__vm_bo;						\
> +											\
> +		drm_gpuvm_bo_put(__prev_vm_bo);						\
> +											\
> +		spin_lock(&(__gpuvm)->__list_name.lock);				\

I'm tempted to add a drm_gpuvm::<list_name>::local_list field, so we
can catch concurrent iterations with something like:

		if (!(__gpuvm)->__list_name.local_list)
			(__gpuvm)->__list_name.local_list = __local_list;
		else
			WARN_ON((__gpuvm)->__list_name.local_list != __local_list);

with (__gpuvm)->__list_name.local_list being restored to NULL
in restore_vm_bo_list().

> +		while (!list_empty(&(__gpuvm)->__list_name.list)) {			\
> +			__vm_bo = list_first_entry(&(__gpuvm)->__list_name.list,	\
> +						   struct drm_gpuvm_bo,			\
> +						   list.entry.__list_name);		\
> +			if (drm_gpuvm_bo_get_unless_zero(__vm_bo)) {			\
> +				list_move_tail(&(__vm_bo)->list.entry.__list_name,	\
> +					       __local_list);				\
> +				break;							\
> +			} else {							\
> +				list_del_init(&(__vm_bo)->list.entry.__list_name);	\
> +				__vm_bo = NULL;						\
> +			}								\
> +		}									\
> +		spin_unlock(&(__gpuvm)->__list_name.lock);				\
> +											\
> +		__vm_bo;								\
> +	})
> +
> +/**
> + * for_each_vm_bo_in_list() - internal vm_bo list iterator
> + *
> + * This helper is here to provide lockless list iteration. Lockless as in, the
> + * iterator releases the lock immediately after picking the first element from the
> + * list, so list insertion and deletion can happen concurrently.
> + *
> + * Typical use:
> + *
> + *	struct drm_gpuvm_bo *vm_bo;
> + *	LIST_HEAD(my_local_list);
> + *
> + *	ret = 0;
> + *	drm_gpuvm_for_each_vm_bo(gpuvm, <list_name>, &my_local_list, vm_bo) {
> + *		ret = do_something_with_vm_bo(..., vm_bo);
> + *		if (ret)
> + *			break;
> + *	}
> + *	drm_gpuvm_bo_put(vm_bo);
> + *	drm_gpuvm_restore_vm_bo_list(gpuvm, <list_name>, &my_local_list);

The names in this example and the helper names don't match.

> + *
> + *
> + * Only used for internal list iterations, not meant to be exposed to the outside
> + * world.
> + */
> +#define for_each_vm_bo_in_list(__gpuvm, __list_name, __local_list, __vm_bo)	\
> +	for (__vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
> +						__local_list, NULL);		\
> +	     __vm_bo;								\
> +	     __vm_bo = get_next_vm_bo_from_list(__gpuvm, __list_name,		\
> +						__local_list, __vm_bo))		\
> +
> +/**
> + * restore_vm_bo_list() - move vm_bo elements back to their original list
> + * @__gpuvm: The GPU VM
> + * @__list_name: The name of the list we're iterating on
> + * @__local_list: A pointer to the local list used to store already iterated items
> + *
> + * When we're done iterating a vm_bo list, we should call restore_vm_bo_list()
> + * to restore the original state and let new iterations take place.
> + */
> +#define restore_vm_bo_list(__gpuvm, __list_name, __local_list)				\
> +	do {										\
> +		/* Merge back the two lists, moving local list elements to the		\
> +		 * head to preserve previous ordering, in case it matters.		\
> +		 */									\
> +		spin_lock(&(__gpuvm)->__list_name.lock);				\
> +		list_splice(__local_list, &(__gpuvm)->__list_name.list);		\
> +		spin_unlock(&(__gpuvm)->__list_name.lock);				\
> +	} while (0)
> +/**
> + * drm_gpuvm_bo_list_add() - insert a vm_bo into the given list
> + * @__vm_bo: the &drm_gpuvm_bo
> + * @__list_name: the name of the list to insert into
> + *
> + * Inserts the given @__vm_bo into the list specified by @__list_name and
> + * increases the vm_bo's reference count.
> + */
> +#define drm_gpuvm_bo_list_add(__vm_bo, __list_name)				\
> +	do {									\
> +		spin_lock(&(__vm_bo)->vm->__list_name.lock);			\
> +		if (list_empty(&(__vm_bo)->list.entry.__list_name))		\
> +			list_add_tail(&(__vm_bo)->list.entry.__list_name,	\
> +				      &(__vm_bo)->vm->__list_name.list);	\
> +		spin_unlock(&(__vm_bo)->vm->__list_name.lock);			\
> +	} while (0)
> +
> +/**
> + * drm_gpuvm_bo_list_del() - remove a vm_bo from the given list
> + * @__vm_bo: the &drm_gpuvm_bo
> + * @__list_name: the name of the list to insert into
> + *
> + * Removes the given @__vm_bo from the list specified by @__list_name and
> + * decreases the vm_bo's reference count.
> + */
> +#define drm_gpuvm_bo_list_del(__vm_bo, __list_name)				\
> +	do {									\
> +		spin_lock(&(__vm_bo)->vm->__list_name.lock);			\
> +		if (!list_empty(&(__vm_bo)->list.entry.__list_name))		\
> +			list_del_init(&(__vm_bo)->list.entry.__list_name);	\
> +		spin_unlock(&(__vm_bo)->vm->__list_name.lock);			\
> +	} while (0)
> +
> +static int __must_check
> +drm_gpuvm_bo_get_unless_zero(struct drm_gpuvm_bo *vm_bo);

I see no obvious reason to have a forward declaration for this helper,
if we decide to keep it, let's at least move the declaration here.


> @@ -807,6 +1262,14 @@ drm_gpuvm_bo_destroy(struct kref *kref)
>  
>  	drm_gem_gpuva_assert_lock_held(vm_bo->obj);
>  
> +	spin_lock(&gpuvm->extobj.lock);
> +	list_del(&vm_bo->list.entry.extobj);
> +	spin_unlock(&gpuvm->extobj.lock);
> +
> +	spin_lock(&gpuvm->evict.lock);
> +	list_del(&vm_bo->list.entry.evict);
> +	spin_unlock(&gpuvm->evict.lock);
> +
>  	list_del(&vm_bo->list.entry.gem);
>  
>  	drm_gem_object_put(obj);
> @@ -822,6 +1285,11 @@ drm_gpuvm_bo_destroy(struct kref *kref)
>   * @vm_bo: the &drm_gpuvm_bo to release the reference of
>   *
>   * This releases a reference to @vm_bo.
> + *
> + * If the reference count drops to zero, the &gpuvm_bo is destroyed, which
> + * includes removing it from the GEMs gpuva list. Hence, if a call to this
> + * function can potentially let the reference count to zero the caller must
> + * hold the dma-resv or driver specific GEM gpuva lock.

Looks like this should have been part of the previous patch. I hate
the fact we have to worry about GEM gpuva lock being held when we call
_put() only if the ref drops to zero though. I think I'd feel more
comfortable if the function was named differently. Maybe _return() or
_release() to match the _obtain() function, where the object is inserted
in the GEM vm_bo list. I would also do the lock_is_held() check
unconditionally, move the list removal in this function with a del_init(),
and have a WARN_ON(!list_empty) in vm_bo_destroy().

>   */
>  void
>  drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo)
> @@ -831,6 +1299,12 @@ drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo)
>  }
>  EXPORT_SYMBOL_GPL(drm_gpuvm_bo_put);
>  
> +static int __must_check
> +drm_gpuvm_bo_get_unless_zero(struct drm_gpuvm_bo *vm_bo)
> +{
> +	return kref_get_unless_zero(&vm_bo->kref);

Not convinced this helper is needed. It's only used once, and I
don't think we'll need it elsewhere.

> +}
> +
>  static struct drm_gpuvm_bo *
>  __drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
>  		    struct drm_gem_object *obj)


Regards,

Boris
