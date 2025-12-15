Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF20CCBDB96
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 13:11:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55C5810E437;
	Mon, 15 Dec 2025 12:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dk2NkNRE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D91F10E437
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 12:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765800707;
 bh=EuEHTi+w0xIPCQfDyo69Q9F97kiH5lE/1sntNp81uAU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dk2NkNREFjksf0vEDnUtzau9Np+cgY7tozXHpRsnixgQAWZpvdpRSSZm5M9WtPF77
 Bvxj0dm0rYqu2QZ29fmtLYr6SA4fzcAbFrh1oNvKVRoGtuPRm0C/w/73AF7aeSQ4dL
 ChGCJaOzLMMmCw72crEyf12YNTQdCKzkmO0DXMoeumBbxV42RWog2C8CEp+eQycL58
 OdcUIqyyvxe5VNy7PuyX9VaAtTdM/wv6YHcVNQ1DTtzdF1WvZbiIg5yLz2MscBFvvP
 zVYtncq9fglGlU5YKTEPjntVPDKIxPwNmxI4qzBPQZXbfy4oM6a2J+aioI3Jzuq5+h
 2ap8ggDhXQZaw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 865F517E1321;
 Mon, 15 Dec 2025 13:11:47 +0100 (CET)
Date: Mon, 15 Dec 2025 13:11:42 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nd@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/5] drm/panthor: Store queue fault and fatal
 information
Message-ID: <20251215131142.34bf5d74@fedora>
In-Reply-To: <20251215115457.2137485-3-lukas.zapolskas@arm.com>
References: <20251215115457.2137485-1-lukas.zapolskas@arm.com>
 <20251215115457.2137485-3-lukas.zapolskas@arm.com>
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

On Mon, 15 Dec 2025 11:54:54 +0000
Lukas Zapolskas <lukas.zapolskas@arm.com> wrote:

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

This is called from the dma-signalling path, from which we can't
allocate with GFP_KERNEL. I think it'd be preferable to pre-allocate a
fixed size event array at queue creation time (can be an extra param
passed to GROUP_CREATE), and report overflows if we're running out of
slots.

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

