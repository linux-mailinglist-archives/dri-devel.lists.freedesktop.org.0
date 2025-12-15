Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 279FCCBF3DD
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 18:32:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5AE10E664;
	Mon, 15 Dec 2025 17:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="MzrFJdAi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9919910E642
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 17:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765819923;
 bh=za1z6HlcucCRe3OBYJjxgDsXryoFmt5DmApCMpavDNk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MzrFJdAiZcEmtPLXatX2Iol0hw1wKc+0k/4sqG5Yzwx9ueH6bg2B/1wouHvp04Ew5
 jJVmUg55t2e1s+fHajm2YvWub5PsDOkWzMqLM/w8G1LVGJbqeB2GWto8t46H/ojhkA
 VAa7Z0OX02V3KetAl/vwPgXyPC859cdcy52IIjkY8lYB9DtOqt8EWCAAM8ogCOSRuG
 XqP7S0ynhDf/Qff3mDWjA+Ak3VACtnWTFtxLja4ilxo4GYDg5hHQG1fG8p/vbPGnf4
 amJpmgFD1xzy7YSSfqLcEPAqJNMj27b4pkHHyHyTbgIbo8pTxc5Vivf1ZeQVYVOuKw
 KEKjRUaWalVAg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 81B8917E12A2;
 Mon, 15 Dec 2025 18:32:02 +0100 (CET)
Date: Mon, 15 Dec 2025 18:31:59 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nd@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Ketil
 Johnsen <ketil.johnsen@arm.com>
Subject: Re: [PATCH v1 5/5] drm/panthor: Use GROUP_GET_STATE to provide
 group and queue errors
Message-ID: <20251215183159.52fc824c@fedora>
In-Reply-To: <20251215115457.2137485-6-lukas.zapolskas@arm.com>
References: <20251215115457.2137485-1-lukas.zapolskas@arm.com>
 <20251215115457.2137485-6-lukas.zapolskas@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
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

On Mon, 15 Dec 2025 11:54:57 +0000
Lukas Zapolskas <lukas.zapolskas@arm.com> wrote:

> GROUP_GET_STATE now can be called two times: the first time to
> enumerate the faults that occurred on the associated queues, and
> the second time to copy out any fault information. The
> necessary infrastructure to copy out drm_panthor_obj_array's
> is pulled in from
> https://lore.kernel.org/dri-devel/20240828172605.19176-7-mihail.atanassov@arm.com/
> 
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> Co-developed-by: Ketil Johnsen <ketil.johnsen@arm.com>
> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c   | 85 ++++++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_sched.c | 92 +++++++++++++++++++++++--
>  drivers/gpu/drm/panthor/panthor_sched.h |  4 +-
>  include/uapi/drm/panthor_drm.h          | 24 +++++++
>  4 files changed, 195 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 98d4e8d867ed..bdcaf85b98cd 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -75,6 +75,55 @@ panthor_set_uobj(u64 usr_ptr, u32 usr_size, u32 min_size, u32 kern_size, const v
>  	return 0;
>  }
>  
> +/**
> + * panthor_set_uobj_array() - Copy a kernel object array into a user object array.
> + * @out: The object array to copy to.
> + * @min_stride: Minimum array stride.
> + * @obj_size: Kernel object size.
> + * @in: Kernel object array to copy from.
> + *
> + * Helper automating kernel -> user object copies.
> + *
> + * Don't use this function directly, use PANTHOR_UOBJ_SET_ARRAY() instead.
> + *
> + * Return: 0 on success, a negative error code otherwise.
> + */
> +static int
> +panthor_set_uobj_array(const struct drm_panthor_obj_array *out, u32 min_stride, u32 obj_size,
> +		       const void *in)
> +{
> +	if (out->stride < min_stride)
> +		return -EINVAL;
> +
> +	if (!out->count)
> +		return 0;
> +
> +	if (obj_size == out->stride) {
> +		if (copy_to_user(u64_to_user_ptr(out->array), in,
> +				 (unsigned long)obj_size * out->count))
> +			return -EFAULT;
> +	} else {
> +		u32 cpy_elem_size = min_t(u32, out->stride, obj_size);
> +		void __user *out_ptr = u64_to_user_ptr(out->array);
> +		const void *in_ptr = in;
> +
> +		for (u32 i = 0; i < out->count; i++) {
> +			if (copy_to_user(out_ptr, in_ptr, cpy_elem_size))
> +				return -EFAULT;
> +
> +			if (out->stride > obj_size &&
> +			    clear_user(out_ptr + cpy_elem_size, out->stride - obj_size)) {
> +				return -EFAULT;
> +			}
> +
> +			out_ptr += out->stride;
> +			in_ptr += obj_size;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * panthor_get_uobj_array() - Copy a user object array into a kernel accessible object array.
>   * @in: The object array to copy.
> @@ -178,7 +227,8 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
>  		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
> -		 PANTHOR_UOBJ_DECL(struct drm_panthor_bo_sync_op, size))
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_bo_sync_op, size), \
> +		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_event, exception_data))
>  
>  /**
>   * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
> @@ -193,6 +243,20 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
>  			 PANTHOR_UOBJ_MIN_SIZE(_src_obj), \
>  			 sizeof(_src_obj), &(_src_obj))
>  
> +/**
> + * PANTHOR_UOBJ_SET_ARRAY() - Copies from _src_array to @_dest_drm_panthor_obj_array.array.
> + * @_dest_drm_panthor_obj_array: The &struct drm_panthor_obj_array containing a __u64 raw
> + * pointer to the destination C array in user space and the size of each array
> + * element in user space (the 'stride').
> + * @_src_array: The source C array object in kernel space.
> + *
> + * Return: Error code. See panthor_set_uobj_array().
> + */
> +#define PANTHOR_UOBJ_SET_ARRAY(_dest_drm_panthor_obj_array, _src_array) \
> +	panthor_set_uobj_array(_dest_drm_panthor_obj_array, \
> +			       PANTHOR_UOBJ_MIN_SIZE((_src_array)[0]), \
> +			       sizeof((_src_array)[0]), _src_array)
> +
>  /**
>   * PANTHOR_UOBJ_GET_ARRAY() - Copy a user object array to a kernel accessible
>   * object array.
> @@ -1128,9 +1192,23 @@ static int panthor_ioctl_group_get_state(struct drm_device *ddev, void *data,
>  					 struct drm_file *file)
>  {
>  	struct panthor_file *pfile = file->driver_priv;
> +	struct drm_panthor_queue_event *__free(kvfree) events = NULL;
>  	struct drm_panthor_group_get_state *args = data;
> +	int ret;
>  
> -	return panthor_group_get_state(pfile, args);
> +	/* First call enumerates the faults. */
> +	if (!args->faults.count && !args->faults.array)
> +		return panthor_group_get_state(pfile, args, NULL, 0);
> +
> +	ret = PANTHOR_UOBJ_GET_ARRAY(events, &args->faults);
> +	if (ret)
> +		return ret;
> +
> +	ret = panthor_group_get_state(pfile, args, events, args->faults.count);
> +	if (!ret)
> +		ret = PANTHOR_UOBJ_SET_ARRAY(&args->faults, events);
> +
> +	return ret;
>  }
>  
>  static int panthor_ioctl_tiler_heap_create(struct drm_device *ddev, void *data,
> @@ -1678,6 +1756,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
>   *       - adds DRM_IOCTL_PANTHOR_BO_SYNC ioctl
>   *       - adds DRM_IOCTL_PANTHOR_BO_QUERY_INFO ioctl
>   *       - adds drm_panthor_gpu_info::selected_coherency
> + * - 1.8 - extends GROUP_GET_STATE to propagate fault and fatal event metadata
>   */
>  static const struct drm_driver panthor_drm_driver = {
>  	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
> @@ -1691,7 +1770,7 @@ static const struct drm_driver panthor_drm_driver = {
>  	.name = "panthor",
>  	.desc = "Panthor DRM driver",
>  	.major = 1,
> -	.minor = 7,
> +	.minor = 8,
>  
>  	.gem_create_object = panthor_gem_create_object,
>  	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 9ea0d2b27114..f58d9a21dec4 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3872,21 +3872,86 @@ static struct panthor_group *group_from_handle(struct panthor_group_pool *pool,
>  	return group;
>  }
>  
> +static int panthor_group_count_faults(struct panthor_scheduler *sched, struct panthor_group *group)
> +{
> +	int count = 0;
> +	unsigned long queue_events = group->fault_queues | group->fatal_queues;
> +
> +	lockdep_assert(&sched->lock);
> +
> +	for (size_t i = 0; i < group->queue_count; i++) {
> +		struct panthor_queue *queue;
> +		struct panthor_queue_event *evnt;
> +
> +		if (!test_bit(i, &queue_events))
> +			continue;
> +
> +		queue = group->queues[i];
> +		if (!queue)
> +			continue;
> +
> +		list_for_each_entry(evnt, &queue->events, link)
> +			count++;
> +	}
> +
> +	return count;
> +}
> +
> +static void panthor_group_get_faults(struct panthor_scheduler *sched, struct panthor_group *group,
> +				     struct drm_panthor_queue_event *events, u32 count)
> +{
> +	int nr_events = 0;
> +	unsigned long queue_events = group->fault_queues | group->fatal_queues;
> +
> +	lockdep_assert(&sched->lock);
> +
> +	for (u32 i = 0; i < group->queue_count; i++) {
> +		struct panthor_queue *queue;
> +		struct panthor_queue_event *evnt, *tmp;
> +
> +		if (!test_bit(i, &queue_events))
> +			continue;
> +
> +		queue = group->queues[i];
> +
> +		if (!queue)
> +			continue;
> +
> +		list_for_each_entry_safe(evnt, tmp, &queue->events, link) {
> +			if (nr_events >= count)
> +				return;
> +
> +			events[nr_events++] = evnt->event;
> +			list_del(&evnt->link);
> +			kfree(evnt);
> +		}
> +
> +		/* In case of additional faults being generated between invocations
> +		 * of group_get state, there may not be enough space to drain
> +		 * events to the user provided buffer. In those cases, the queue
> +		 * should remain listed as faulted.
> +		 */
> +		if ((group->fault_queues & BIT(i)) && list_empty(&queue->events))
> +			group->fault_queues &= ~BIT(i);
> +	}
> +}
> +
>  int panthor_group_get_state(struct panthor_file *pfile,
> -			    struct drm_panthor_group_get_state *get_state)
> +			    struct drm_panthor_group_get_state *get_state,
> +			    struct drm_panthor_queue_event *events, u32 count)
>  {
>  	struct panthor_group_pool *gpool = pfile->groups;
>  	struct panthor_device *ptdev = pfile->ptdev;
>  	struct panthor_scheduler *sched = ptdev->scheduler;
> -	struct panthor_group *group;
> +	struct panthor_group *group = NULL;
> +	u32 fault_count;
>  
>  	group = group_from_handle(gpool, get_state->group_handle);
>  	if (!group)
>  		return -EINVAL;
>  
> -	memset(get_state, 0, sizeof(*get_state));
> +	guard(mutex)(&sched->lock);

If we go for a guard, can we do a scoped_guard() so the unlock happens
just before the put() on the group.

>  
> -	mutex_lock(&sched->lock);
>  	if (group->timedout)
>  		get_state->state |= DRM_PANTHOR_GROUP_STATE_TIMEDOUT;
>  	if (group->fatal_queues) {
> @@ -3898,10 +3963,25 @@ int panthor_group_get_state(struct panthor_file *pfile,
>  	if (group->fault_queues) {
>  		get_state->state |= DRM_PANTHOR_GROUP_STATE_QUEUE_FAULT;
>  		get_state->fault_queues = group->fault_queues;
> -		group->fault_queues = 0;
>  	}
> -	mutex_unlock(&sched->lock);
>  
> +	get_state->exception_type = group->fault.exception_type;
> +	get_state->access_type = group->fault.access_type;
> +	get_state->source_id = group->fault.source_id;
> +	get_state->valid_address = group->fault.valid_address;
> +	get_state->address = group->fault.address;
> +
> +	fault_count = panthor_group_count_faults(sched, group);
> +
> +	if (!count && !events) {
> +		get_state->faults.count = fault_count;
> +		get_state->faults.stride = sizeof(struct drm_panthor_queue_event);

Is there any point reporting the kernel stride here? I'd expect the
kernel driver to adapt to the user stride when count != 0, and since
the stride is dictated by the kernel uAPI version, there's not much to
be gained by having userspace allocation an array with a stride that
doesn't match the object size the UMD knows about.

> +		goto exit;
> +	}
> +
> +	panthor_group_get_faults(sched, group, events, min(get_state->faults.count, count));

As I was mentioning early, we really need to reflect when the some
events were lost. Right now you're assuming infinite event list, but
capping it and reporting overflows is more future-proof, I think.

> +
> +exit:
>  	group_put(group);
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
> index f4a475aa34c0..d75870a6d836 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.h
> +++ b/drivers/gpu/drm/panthor/panthor_sched.h
> @@ -14,6 +14,7 @@ struct drm_panthor_group_create;
>  struct drm_panthor_queue_create;
>  struct drm_panthor_group_get_state;
>  struct drm_panthor_queue_submit;
> +struct drm_panthor_queue_event;
>  struct panthor_device;
>  struct panthor_file;
>  struct panthor_group_pool;
> @@ -25,7 +26,8 @@ int panthor_group_create(struct panthor_file *pfile,
>  			 u64 drm_client_id);
>  int panthor_group_destroy(struct panthor_file *pfile, u32 group_handle);
>  int panthor_group_get_state(struct panthor_file *pfile,
> -			    struct drm_panthor_group_get_state *get_state);
> +			    struct drm_panthor_group_get_state *get_state,
> +			    struct drm_panthor_queue_event *events, u32 count);
>  
>  struct drm_sched_job *
>  panthor_job_create(struct panthor_file *pfile,
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 083a02418d28..931c8371b1b6 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -1012,6 +1012,30 @@ struct drm_panthor_group_get_state {
>  
>  	/** @fatal_queues: Bitmask of queues that faced fatal faults. */
>  	__u32 fault_queues;
> +
> +	/** @exception_type: The type of exception that caused the fault. */
> +	__u32 exception_type;
> +
> +	/** @access_type: The direction of the data transfer that caused the fault., if known. */
> +	__u32 access_type;
> +
> +	/** @source_id: ID supplying further data about the source of the fault. */
> +	__u32 source_id;
> +
> +	/**
> +	 * @valid_address: Whether the address is valid or not. Some faults may not come with
> +	 * a valid GPU VA.
> +	 */
> +	__u8 valid_address;

Could we actually have a drm_panthor_vm_fault object defined in the
uAPI header and re-used in the panthor_mmu.c code, so we don't have to
do this manual per-field copy dance and we can simply replace it with:

	get_state->vm_fault = group->vm_fault;

> +
> +	/** @pad0: MBZ. */
> +	__u8 pad0[3];
> +
> +	/** @address: GPU VA of the faulting access, if present. */
> +	__u64 address;
> +
> +	/** @faults: Array of faults passed back to the user. */
> +	struct drm_panthor_obj_array faults;

Can we name that one queue_faults?

>  };
>  
>  /**

