Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2F17B9CD4
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 13:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F80C10E3DB;
	Thu,  5 Oct 2023 11:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5495410E3DB;
 Thu,  5 Oct 2023 11:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696506929; x=1728042929;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zs5rwGbndy4epzi93fEGO0AT0AknuIE70HJKj8Or+S8=;
 b=QNHXEB+9ZMg6VgnlxmaWc7ugskmfyO9wEH0VYJhEi59VxBHy9xTZRps5
 paXBsjFT0B+XaIeqIrLqcP1BLzj84CtEAgd8J+ICQItf4ecYSGkwFujcP
 Ous6h1q/xbR8h4kCDzJ6x6PqY5Xt5cu/BQij5SZ2xClMW0gzWUJZcXC36
 5XsnUYhcSct30JfxyXdib/0t4E6xgfkYwh/xeUYWWcmP6NCIo/RjtmTKz
 8zoLJNloQrsCRPYAB3oZgB08LyUGcaqbwraHYqMWTWFr9fhfEqfeSWCHB
 +H29zuvjo18ZGNI5tchfD+re+YEyIttgUZAk6v3PjtI6EljmPELrjw9Kv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="387348303"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="387348303"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 04:55:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="755413827"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="755413827"
Received: from lapeders-mobl1.ger.corp.intel.com (HELO [10.249.254.36])
 ([10.249.254.36])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 04:55:25 -0700
Message-ID: <937138da-35fe-f135-e13d-0ac75bc3ef5d@linux.intel.com>
Date: Thu, 5 Oct 2023 13:55:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH drm-misc-next v5 4/6] drm/gpuvm: track/lock/validate
 external/evicted objects
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch,
 matthew.brost@intel.com, sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com, faith@gfxstrand.net
References: <20230928191624.13703-1-dakr@redhat.com>
 <20230928191624.13703-5-dakr@redhat.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230928191624.13703-5-dakr@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/28/23 21:16, Danilo Krummrich wrote:
> Currently the DRM GPUVM offers common infrastructure to track GPU VA
> allocations and mappings, generically connect GPU VA mappings to their
> backing buffers and perform more complex mapping operations on the GPU VA
> space.
>
> However, there are more design patterns commonly used by drivers, which
> can potentially be generalized in order to make the DRM GPUVM represent
> a basis for GPU-VM implementations. In this context, this patch aims
> at generalizing the following elements.
>
> 1) Provide a common dma-resv for GEM objects not being used outside of
>     this GPU-VM.
>
> 2) Provide tracking of external GEM objects (GEM objects which are
>     shared with other GPU-VMs).
>
> 3) Provide functions to efficiently lock all GEM objects dma-resv the
>     GPU-VM contains mappings of.
>
> 4) Provide tracking of evicted GEM objects the GPU-VM contains mappings
>     of, such that validation of evicted GEM objects is accelerated.
>
> 5) Provide some convinience functions for common patterns.
>
> Big thanks to Boris Brezillon for his help to figure out locking for
> drivers updating the GPU VA space within the fence signalling path.
>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>   drivers/gpu/drm/drm_gpuvm.c | 642 ++++++++++++++++++++++++++++++++++++
>   include/drm/drm_gpuvm.h     | 240 ++++++++++++++
>   2 files changed, 882 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 27100423154b..770bb3d68d1f 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -82,6 +82,21 @@
>    * &drm_gem_object list of &drm_gpuvm_bos for an existing instance of this
>    * particular combination. If not existent a new instance is created and linked
>    * to the &drm_gem_object.
> + *
> + * &drm_gpuvm_bo structures, since unique for a given &drm_gpuvm, are also used
> + * as entry for the &drm_gpuvm's lists of external and evicted objects. Those
> + * list are maintained in order to accelerate locking of dma-resv locks and
> + * validation of evicted objects bound in a &drm_gpuvm. For instance, all
> + * &drm_gem_object's &dma_resv of a given &drm_gpuvm can be locked by calling
> + * drm_gpuvm_exec_lock(). Once locked drivers can call drm_gpuvm_validate() in
> + * order to validate all evicted &drm_gem_objects. It is also possible to lock
> + * additional &drm_gem_objects by providing the corresponding parameters to
> + * drm_gpuvm_exec_lock() as well as open code the &drm_exec loop while making
> + * use of helper functions such as drm_gpuvm_prepare_range() or
> + * drm_gpuvm_prepare_objects().
> + *
> + * Every bound &drm_gem_object is treated as external object when its &dma_resv
> + * structure is different than the &drm_gpuvm's common &dma_resv structure.
>    */
>   
>   /**
> @@ -429,6 +444,20 @@
>    * Subsequent calls to drm_gpuvm_bo_obtain() for the same &drm_gpuvm and
>    * &drm_gem_object must be able to observe previous creations and destructions
>    * of &drm_gpuvm_bos in order to keep instances unique.
> + *
> + * The &drm_gpuvm's lists for keeping track of external and evicted objects are
> + * protected against concurrent insertion / removal and iteration internally.
> + *
> + * However, drivers still need ensure to protect concurrent calls to functions
> + * iterating those lists, namely drm_gpuvm_prepare_objects() and
> + * drm_gpuvm_validate().
> + *
> + * Alternatively, drivers can set the &DRM_GPUVM_RESV_PROTECTED flag to indicate
> + * that the corresponding &dma_resv locks are held in order to protect the
> + * lists. If &DRM_GPUVM_RESV_PROTECTED is set, internal locking is disabled and
> + * the corresponding lockdep checks are enabled. This is an optimization for
> + * drivers which are capable of taking the corresponding &dma_resv locks and
> + * hence do not require internal locking.
>    */
>   
>   /**
> @@ -641,6 +670,195 @@
>    *	}
>    */
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
> +		struct drm_gpuvm_bo *__vm_bo = NULL;					\
> +											\
> +		drm_gpuvm_bo_put(__prev_vm_bo);						\
> +											\
> +		spin_lock(&(__gpuvm)->__list_name.lock);				\
> +		if (!(__gpuvm)->__list_name.local_list)					\
> +			(__gpuvm)->__list_name.local_list = __local_list;		\
> +		else									\
> +			WARN_ON((__gpuvm)->__list_name.local_list != __local_list);	\
> +											\
> +		while (!list_empty(&(__gpuvm)->__list_name.list)) {			\
> +			__vm_bo = list_first_entry(&(__gpuvm)->__list_name.list,	\
> +						   struct drm_gpuvm_bo,			\
> +						   list.entry.__list_name);		\
> +			if (kref_get_unless_zero(&__vm_bo->kref)) {			\
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
> + * list, hence list insertion and deletion can happen concurrently.
> + *
> + * It is not allowed to re-assign the vm_bo pointer from inside this loop.
> + *
> + * Typical use:
> + *
> + *	struct drm_gpuvm_bo *vm_bo;
> + *	LIST_HEAD(my_local_list);
> + *
> + *	ret = 0;
> + *	for_each_vm_bo_in_list(gpuvm, <list_name>, &my_local_list, vm_bo) {
> + *		ret = do_something_with_vm_bo(..., vm_bo);
> + *		if (ret)
> + *			break;
> + *	}
> + *	drm_gpuvm_bo_put(vm_bo);
> + *	restore_vm_bo_list(gpuvm, <list_name>, &my_local_list);
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
> +						__local_list, __vm_bo))
> +
> +static inline void
> +__restore_vm_bo_list(struct drm_gpuvm *gpuvm, spinlock_t *lock,
> +		     struct list_head *list, struct list_head **local_list)
s/static inline void/static void/?  In .c files, the compiler is 
typically trusted to inline where needed.

/Thomas


