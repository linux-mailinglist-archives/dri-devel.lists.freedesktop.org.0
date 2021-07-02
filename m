Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A943B9F61
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 12:56:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFFC6E10C;
	Fri,  2 Jul 2021 10:55:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 571756E0FE
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 10:55:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 981621FB;
 Fri,  2 Jul 2021 03:55:56 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3907A3F718;
 Fri,  2 Jul 2021 03:55:55 -0700 (PDT)
Subject: Re: [PATCH v2 4/7] drm/panfrost: Add the ability to create submit
 queues
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20210701091224.3209803-1-boris.brezillon@collabora.com>
 <20210701091224.3209803-5-boris.brezillon@collabora.com>
 <b277ce22-f2d2-35e5-30cd-c851a7896b44@arm.com>
 <20210702124320.1bd0f228@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <3955f63e-40af-bcb3-0214-2d1f22dbfdec@arm.com>
Date: Fri, 2 Jul 2021 11:55:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702124320.1bd0f228@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: Jason Ekstrand <jason@jlekstrand.net>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/07/2021 11:43, Boris Brezillon wrote:
> On Fri, 2 Jul 2021 10:56:29 +0100
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 01/07/2021 10:12, Boris Brezillon wrote:
>>> Needed to keep VkQueues isolated from each other.
>>>
>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>  
>>
>> My Vulkan knowledge is limited so I'm not sure whether this is the right
>> approach or not. In particular is it correct that an application can
>> create a high priority queue which could affect other (normal priority)
>> applications?
> 
> That's what msm does (with no extra CAPS check AFAICT), and the
> freedreno driver can already create high priority queues if
> PIPE_CONTEXT_HIGH_PRIORITY is passed. Not saying that's okay to allow
> userspace to tweak the priority, but if that's a problem, other drivers
> are in trouble too ;-).

Oh well I guess if others are doing the same ;) I have to admit kbase
has always struggled with how to identify a "privileged" process - it's
something that makes a bit of sense on Android but for other userspaces
there really doesn't seem to be a good way of identifying what should or
should not be allowed to create high priority queues.

>>
>> Also does it really make sense to allow user space to create an
>> unlimited number of queues? It feels like an ideal way for an malicious
>> application to waste kernel memory.
> 
> Same here, I see no limit on the number of queues the msm driver can
> create. I can definitely pick an arbitrary limit of 2^16 (or 2^8 if
> 2^16 is too high) if you prefer, but I feel like there's plenty of ways
> to force kernel allocations already, like allocating a gazillion of 4k
> GEM buffers (cgroup can probably limit the total amount of memory
> allocated, but you'd still have all gem-buf meta data in kernel memory).

I guess the real problem is picking a sensible limit ;) My main concern
here is that there doesn't appear to be any memory accounted against the
process. For GEM buffers at least there is some cost to the application
- so an unbounded allocation isn't possible, even if the bounds are
likely to be very high.

With kbase we found that syzcaller was good at finding ways of using up
all the memory on the platform - and if it wasn't accounted to the right
process that meant the OOM-killer knocked out the wrong process and
produced a bug report to investigate. Perhaps I'm just scarred by that
history ;)

Steve

>>
>> In terms of implementation it looks correct, but one comment below
>>
>>> ---
>>>  drivers/gpu/drm/panfrost/Makefile             |   3 +-
>>>  drivers/gpu/drm/panfrost/panfrost_device.h    |   2 +-
>>>  drivers/gpu/drm/panfrost/panfrost_drv.c       |  69 ++++++++--
>>>  drivers/gpu/drm/panfrost/panfrost_job.c       |  47 ++-----
>>>  drivers/gpu/drm/panfrost/panfrost_job.h       |   9 +-
>>>  .../gpu/drm/panfrost/panfrost_submitqueue.c   | 130 ++++++++++++++++++
>>>  .../gpu/drm/panfrost/panfrost_submitqueue.h   |  27 ++++
>>>  include/uapi/drm/panfrost_drm.h               |  17 +++
>>>  8 files changed, 258 insertions(+), 46 deletions(-)
>>>  create mode 100644 drivers/gpu/drm/panfrost/panfrost_submitqueue.c
>>>  create mode 100644 drivers/gpu/drm/panfrost/panfrost_submitqueue.h
>>>   
>> [...]
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_submitqueue.c b/drivers/gpu/drm/panfrost/panfrost_submitqueue.c
>>> new file mode 100644
>>> index 000000000000..98050f7690df
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_submitqueue.c
>>> @@ -0,0 +1,130 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/* Copyright 2021 Collabora ltd. */
>>> +
>>> +#include <linux/idr.h>
>>> +
>>> +#include "panfrost_device.h"
>>> +#include "panfrost_job.h"
>>> +#include "panfrost_submitqueue.h"
>>> +
>>> +static enum drm_sched_priority
>>> +to_sched_prio(enum panfrost_submitqueue_priority priority)
>>> +{
>>> +	switch (priority) {
>>> +	case PANFROST_SUBMITQUEUE_PRIORITY_LOW:
>>> +		return DRM_SCHED_PRIORITY_MIN;
>>> +	case PANFROST_SUBMITQUEUE_PRIORITY_MEDIUM:
>>> +		return DRM_SCHED_PRIORITY_NORMAL;
>>> +	case PANFROST_SUBMITQUEUE_PRIORITY_HIGH:
>>> +		return DRM_SCHED_PRIORITY_HIGH;
>>> +	default:
>>> +		break;
>>> +	}
>>> +
>>> +	return DRM_SCHED_PRIORITY_UNSET;
>>> +}
>>> +
>>> +static void
>>> +panfrost_submitqueue_cleanup(struct kref *ref)
>>> +{
>>> +	struct panfrost_submitqueue *queue;
>>> +	unsigned int i;
>>> +
>>> +	queue = container_of(ref, struct panfrost_submitqueue, refcount);
>>> +
>>> +	for (i = 0; i < NUM_JOB_SLOTS; i++)
>>> +		drm_sched_entity_destroy(&queue->sched_entity[i]);
>>> +
>>> +	/* Kill in-flight jobs */
>>> +	panfrost_job_kill_queue(queue);
>>> +
>>> +	kfree(queue);
>>> +}
>>> +
>>> +void panfrost_submitqueue_put(struct panfrost_submitqueue *queue)
>>> +{
>>> +	if (!IS_ERR_OR_NULL(queue))
>>> +		kref_put(&queue->refcount, panfrost_submitqueue_cleanup);
>>> +}
>>> +
>>> +struct panfrost_submitqueue *
>>> +panfrost_submitqueue_create(struct panfrost_file_priv *ctx,
>>> +			    enum panfrost_submitqueue_priority priority,
>>> +			    u32 flags)  
>>
>> If this function returned an 'int' we could simplify some code. So
>> instead of returning the struct panfrost_submitqueue just return the ID
>> (or negative error). The only caller (panfrost_ioctl_create_submitqueue)
>> doesn't actually want the object just the ID and we can ditch the 'id'
>> field from panfrost_submitqueue.
> 
> Sure, I can do that.
> 

