Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47369CC75C8
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 12:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDDCF10E325;
	Wed, 17 Dec 2025 11:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id AC51110E325
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 11:38:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02A1514BF;
 Wed, 17 Dec 2025 03:37:58 -0800 (PST)
Received: from [10.57.45.201] (unknown [10.57.45.201])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 363863F73B;
 Wed, 17 Dec 2025 03:38:02 -0800 (PST)
Message-ID: <36909139-3ba1-4f29-afa9-08a98ffc018c@arm.com>
Date: Wed, 17 Dec 2025 11:37:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/5] drm/panthor: Store queue fault and fatal
 information
To: Lukas Zapolskas <lukas.zapolskas@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: nd@arm.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251215115457.2137485-1-lukas.zapolskas@arm.com>
 <20251215115457.2137485-3-lukas.zapolskas@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251215115457.2137485-3-lukas.zapolskas@arm.com>
Content-Type: text/plain; charset=UTF-8
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

On 15/12/2025 11:54, Lukas Zapolskas wrote:
> A queue may encounter either one fatal fault or any number of
> recoverable faults during execution. The CSF FW provides the
> FAULT/FATAL registers, indicating the fault type, and another
> set of registers providing more metadata about why the fault
> was generated. Storing the information allows it to be
> reported to the user using the GROUP_GET_STATE ioctl.
> 
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 116 +++++++++++++++++-------
>  include/uapi/drm/panthor_drm.h          |  17 ++++
>  2 files changed, 100 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index eb8841beba39..a77399e95620 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -342,6 +342,14 @@ struct panthor_syncobj_64b {
>  	u32 pad;
>  };
>  
> +struct panthor_queue_event {
> +	/** @link: Link to a list of Panthor event errors. */
> +	struct list_head link;
> +
> +	/** @event: The event containing all of the fault/fatal metadata. */
> +	struct drm_panthor_queue_event event;
> +};
> +
>  /**
>   * struct panthor_queue - Execution queue
>   */
> @@ -485,6 +493,9 @@ struct panthor_queue {
>  		/** @seqno: Index of the next available profiling information slot. */
>  		u32 seqno;
>  	} profiling;
> +
> +	/** @events: List of fault or fatal events reported on this queue. */
> +	struct list_head events;
>  };
>  
>  /**
> @@ -918,6 +929,8 @@ panthor_queue_get_syncwait_obj(struct panthor_group *group, struct panthor_queue
>  
>  static void group_free_queue(struct panthor_group *group, struct panthor_queue *queue)
>  {
> +	struct panthor_queue_event *evt, *tmp;
> +
>  	if (IS_ERR_OR_NULL(queue))
>  		return;
>  
> @@ -934,6 +947,11 @@ static void group_free_queue(struct panthor_group *group, struct panthor_queue *
>  
>  	panthor_queue_put_syncwait_obj(queue);
>  
> +	list_for_each_entry_safe(evt, tmp, &queue->events, link) {
> +		list_del(&evt->link);
> +		kfree(evt);
> +	}
> +
>  	panthor_kernel_bo_destroy(queue->ringbuf);
>  	panthor_kernel_bo_destroy(queue->iface.mem);
>  	panthor_kernel_bo_destroy(queue->profiling.slots);
> @@ -1476,6 +1494,69 @@ csg_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 priority)
>  	return 0;
>  }
>  
> +static struct panthor_queue_event *
> +panthor_queue_create_event(unsigned long event_type, u32 cs_id, u32 exception)
> +{
> +	struct panthor_queue_event *event;
> +
> +	event = kzalloc(sizeof(*event), GFP_KERNEL);
> +	if (!event)
> +		return ERR_PTR(-ENOMEM);
> +
> +	event->event = (struct drm_panthor_queue_event){
> +		.queue_id = cs_id,
> +		.event_type = event_type,
> +		.exception_type = CS_EXCEPTION_TYPE(exception),
> +		.exception_data = CS_EXCEPTION_DATA(exception),
> +	};
> +	INIT_LIST_HEAD(&event->link);
> +
> +	return event;
> +}
> +
> +#define PANTHOR_DEFINE_EVENT_INFO(__type, __msg, __event) \
> +static u32 panthor_queue_set_ ## __type ## _info(struct panthor_device *ptdev,			\
> +						 struct panthor_group *group,			\
> +						 u32 csg_id, u32 cs_id)				\
> +{												\
> +	struct panthor_scheduler *sched = ptdev->scheduler;					\
> +	struct panthor_fw_cs_iface *iface = panthor_fw_get_cs_iface(ptdev, csg_id, cs_id);	\
> +	struct panthor_queue *queue = group && cs_id < group->queue_count ?			\
> +				      group->queues[cs_id] : NULL;				\
> +	struct panthor_queue_event *event;							\
> +												\
> +	lockdep_assert_held(&sched->lock);							\
> +												\
> +	if (!iface || !queue)									\
> +		return 0;									\
> +												\
> +	const u32 exception = iface->output->__type;						\
> +	const u64 info = iface->output->__type ## _info;					\
> +												\
> +	event = panthor_queue_create_event((__event), cs_id, exception);			\
> +												\
> +	if (!IS_ERR(event))									\
> +		list_add_tail(&event->link, &queue->events);					\
> +	else											\
> +		drm_err(&ptdev->base, "Could not store fault notification, err = %ld",		\
> +			PTR_ERR(event));							\
> +												\
> +	drm_warn(&ptdev->base,									\
> +		 "CSG slot %d CS slot: %d\n"							\
> +		 "CS_" __msg  ".EXCEPTION_TYPE: 0x%x (%s)\n"					\
> +		 "CS_" __msg  ".EXCEPTION_DATA: 0x%x\n"						\
> +		 "CS_" __msg  "_INFO.EXCEPTION_DATA: 0x%llx\n",					\
> +		 csg_id, cs_id,									\
> +		 (unsigned int)CS_EXCEPTION_TYPE(exception),					\
> +		 panthor_exception_name(ptdev, CS_EXCEPTION_TYPE(exception)),			\
> +		 (unsigned int)CS_EXCEPTION_DATA(exception), info);				\
> +												\
> +	return exception;									\
> +}
> +
> +PANTHOR_DEFINE_EVENT_INFO(fatal, "FATAL", DRM_PANTHOR_GROUP_STATE_FATAL_FAULT);
> +PANTHOR_DEFINE_EVENT_INFO(fault, "FAULT", DRM_PANTHOR_GROUP_STATE_QUEUE_FAULT);

I can't say I'm particularly keen on a massive macro defining functions 
like this - it makes the code harder to read and breaks tools like 
ctags. In this case it's not much more code to just make a generic 
version (untested):

---8<---
static u32 panthor_queue_set_info(struct panthor_device *ptdev,
				  struct panthor_group *group,
				  u32 csg_id, u32 cs_id,
				  int event)
{
	struct panthor_scheduler *sched = ptdev->scheduler;
	struct panthor_fw_cs_iface *iface = panthor_fw_get_cs_iface(ptdev, csg_id, cs_id);
	struct panthor_queue *queue = group && cs_id < group->queue_count ?
				      group->queues[cs_id] : NULL;
	struct panthor_queue_event *event;
	u32 exception, info;
	const char *type;

	lockdep_assert_held(&sched->lock);

	if (!iface || !queue)
		return 0;

	switch (event) {
	case DRM_PANTHOR_GROUP_STATE_FATAL_FAULT:
		exception = iface->output->fatal;
		info = iface->output->fatal_info;
		type = "FATAL";
		break;
	case DRM_PANTHOR_GROUP_STATE_QUEUE_FAULT:
		exception = iface->output->fault;
		info = iface->output->fault_info;
		type = "FAULT";
		break;
	default:
		WARN_ON(1);
		return 0;
	}

	event = panthor_queue_create_event(event, cs_id, exception);

	if (!IS_ERR(event))
		list_add_tail(&event->link, &queue->events);
	else
		drm_err(&ptdev->base, "Could not store fault notification, err = %ld",
			PTR_ERR(event));

	drm_warn(&ptdev->base,
		 "CSG slot %d CS slot: %d\n"
		 "CS_%s.EXCEPTION_TYPE: 0x%x (%s)\n"
		 "CS_%s.EXCEPTION_DATA: 0x%x\n"
		 "CS_%s_INFO.EXCEPTION_DATA: 0x%llx\n",
		 csg_id, cs_id,
		 type, (unsigned int)CS_EXCEPTION_TYPE(exception),
		 panthor_exception_name(ptdev, CS_EXCEPTION_TYPE(exception)),
		 type, (unsigned int)CS_EXCEPTION_DATA(exception),
		 type, info);

	return exception;
}

static u32 panthor_queue_set_fatal_info(struct panthor_device *ptdev,
					struct panthor_group *group,
					u32 csg_id, u32 cs_id)
{
	return panthor_queue_set_info(ptdev, group, csg_id, cs_id,
				      DRM_PANTHOR_GROUP_STATE_FATAL_FAULT);
}

static u32 panthor_queue_set_fault_info(struct panthor_device *ptdev,
					struct panthor_group *group,
					u32 csg_id, u32 cs_id)
{
	return panthor_queue_set_info(ptdev, group, csg_id, cs_id,
				      DRM_PANTHOR_GROUP_STATE_QUEUE_FAULT);
}
---8<---

I'm also wondering if "set_fault_info" is the right wording. Both are 
'faults' (FATAL_FAULT vs QUEUE_FAULT). I also suspect that the helper
wrappers are unneeded considering we only have the single call site
for each.

The drm_warn() message could also be simplified - we don't actually
need the 'official' register names output, so we could just have a
"is fatal" flag.

Thanks,
Steve

> +
>  static void
>  cs_slot_process_fatal_event_locked(struct panthor_device *ptdev,
>  				   u32 csg_id, u32 cs_id)
> @@ -1483,15 +1564,11 @@ cs_slot_process_fatal_event_locked(struct panthor_device *ptdev,
>  	struct panthor_scheduler *sched = ptdev->scheduler;
>  	struct panthor_csg_slot *csg_slot = &sched->csg_slots[csg_id];
>  	struct panthor_group *group = csg_slot->group;
> -	struct panthor_fw_cs_iface *cs_iface;
>  	u32 fatal;
> -	u64 info;
>  
>  	lockdep_assert_held(&sched->lock);
>  
> -	cs_iface = panthor_fw_get_cs_iface(ptdev, csg_id, cs_id);
> -	fatal = cs_iface->output->fatal;
> -	info = cs_iface->output->fatal_info;
> +	fatal = panthor_queue_set_fatal_info(ptdev, group, csg_id, cs_id);
>  
>  	if (group) {
>  		drm_warn(&ptdev->base, "CS_FATAL: pid=%d, comm=%s\n",
> @@ -1509,17 +1586,6 @@ cs_slot_process_fatal_event_locked(struct panthor_device *ptdev,
>  	} else {
>  		sched_queue_delayed_work(sched, tick, 0);
>  	}
> -
> -	drm_warn(&ptdev->base,
> -		 "CSG slot %d CS slot: %d\n"
> -		 "CS_FATAL.EXCEPTION_TYPE: 0x%x (%s)\n"
> -		 "CS_FATAL.EXCEPTION_DATA: 0x%x\n"
> -		 "CS_FATAL_INFO.EXCEPTION_DATA: 0x%llx\n",
> -		 csg_id, cs_id,
> -		 (unsigned int)CS_EXCEPTION_TYPE(fatal),
> -		 panthor_exception_name(ptdev, CS_EXCEPTION_TYPE(fatal)),
> -		 (unsigned int)CS_EXCEPTION_DATA(fatal),
> -		 info);
>  }
>  
>  static void
> @@ -1531,15 +1597,10 @@ cs_slot_process_fault_event_locked(struct panthor_device *ptdev,
>  	struct panthor_group *group = csg_slot->group;
>  	struct panthor_queue *queue = group && cs_id < group->queue_count ?
>  				      group->queues[cs_id] : NULL;
> -	struct panthor_fw_cs_iface *cs_iface;
> -	u32 fault;
> -	u64 info;
>  
>  	lockdep_assert_held(&sched->lock);
>  
> -	cs_iface = panthor_fw_get_cs_iface(ptdev, csg_id, cs_id);
> -	fault = cs_iface->output->fault;
> -	info = cs_iface->output->fault_info;
> +	panthor_queue_set_fault_info(ptdev, group, csg_id, cs_id);
>  
>  	if (queue) {
>  		u64 cs_extract = queue->iface.output->extract;
> @@ -1564,17 +1625,6 @@ cs_slot_process_fault_event_locked(struct panthor_device *ptdev,
>  
>  		group->fault_queues |= BIT(cs_id);
>  	}
> -
> -	drm_warn(&ptdev->base,
> -		 "CSG slot %d CS slot: %d\n"
> -		 "CS_FAULT.EXCEPTION_TYPE: 0x%x (%s)\n"
> -		 "CS_FAULT.EXCEPTION_DATA: 0x%x\n"
> -		 "CS_FAULT_INFO.EXCEPTION_DATA: 0x%llx\n",
> -		 csg_id, cs_id,
> -		 (unsigned int)CS_EXCEPTION_TYPE(fault),
> -		 panthor_exception_name(ptdev, CS_EXCEPTION_TYPE(fault)),
> -		 (unsigned int)CS_EXCEPTION_DATA(fault),
> -		 info);
>  }
>  
>  static int group_process_tiler_oom(struct panthor_group *group, u32 cs_id)
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index 77262d2b9672..083a02418d28 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -974,6 +974,23 @@ enum drm_panthor_group_state_flags {
>  	DRM_PANTHOR_GROUP_STATE_QUEUE_FAULT = 1 << 3,
>  };
>  
> +/**
> + * struct drm_panthor_queue_event - Fault or fatal event occurring on a single queue.
> + */
> +struct drm_panthor_queue_event {
> +	/** @queue_id: The ID of the queue that faulted. */
> +	__u32 queue_id;
> +
> +	/** @event_type: What kind of event is being propagated. */
> +	__u32 event_type;
> +
> +	/** @exception_type: The type of exception that caused the fault. */
> +	__u32 exception_type;
> +
> +	/** @exception_data: Exception-specific data. */
> +	__u32 exception_data;
> +};
> +
>  /**
>   * struct drm_panthor_group_get_state - Arguments passed to DRM_IOCTL_PANTHOR_GROUP_GET_STATE
>   *

