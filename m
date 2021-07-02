Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 635DF3B9E91
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 11:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609136E0AB;
	Fri,  2 Jul 2021 09:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DCAAF6E0AB
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 09:56:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 232661FB;
 Fri,  2 Jul 2021 02:56:32 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96A6A3F718;
 Fri,  2 Jul 2021 02:56:30 -0700 (PDT)
Subject: Re: [PATCH v2 4/7] drm/panfrost: Add the ability to create submit
 queues
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20210701091224.3209803-1-boris.brezillon@collabora.com>
 <20210701091224.3209803-5-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <b277ce22-f2d2-35e5-30cd-c851a7896b44@arm.com>
Date: Fri, 2 Jul 2021 10:56:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701091224.3209803-5-boris.brezillon@collabora.com>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/07/2021 10:12, Boris Brezillon wrote:
> Needed to keep VkQueues isolated from each other.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

My Vulkan knowledge is limited so I'm not sure whether this is the right
approach or not. In particular is it correct that an application can
create a high priority queue which could affect other (normal priority)
applications?

Also does it really make sense to allow user space to create an
unlimited number of queues? It feels like an ideal way for an malicious
application to waste kernel memory.

In terms of implementation it looks correct, but one comment below

> ---
>  drivers/gpu/drm/panfrost/Makefile             |   3 +-
>  drivers/gpu/drm/panfrost/panfrost_device.h    |   2 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |  69 ++++++++--
>  drivers/gpu/drm/panfrost/panfrost_job.c       |  47 ++-----
>  drivers/gpu/drm/panfrost/panfrost_job.h       |   9 +-
>  .../gpu/drm/panfrost/panfrost_submitqueue.c   | 130 ++++++++++++++++++
>  .../gpu/drm/panfrost/panfrost_submitqueue.h   |  27 ++++
>  include/uapi/drm/panfrost_drm.h               |  17 +++
>  8 files changed, 258 insertions(+), 46 deletions(-)
>  create mode 100644 drivers/gpu/drm/panfrost/panfrost_submitqueue.c
>  create mode 100644 drivers/gpu/drm/panfrost/panfrost_submitqueue.h
> 
[...]
> diff --git a/drivers/gpu/drm/panfrost/panfrost_submitqueue.c b/drivers/gpu/drm/panfrost/panfrost_submitqueue.c
> new file mode 100644
> index 000000000000..98050f7690df
> --- /dev/null
> +++ b/drivers/gpu/drm/panfrost/panfrost_submitqueue.c
> @@ -0,0 +1,130 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright 2021 Collabora ltd. */
> +
> +#include <linux/idr.h>
> +
> +#include "panfrost_device.h"
> +#include "panfrost_job.h"
> +#include "panfrost_submitqueue.h"
> +
> +static enum drm_sched_priority
> +to_sched_prio(enum panfrost_submitqueue_priority priority)
> +{
> +	switch (priority) {
> +	case PANFROST_SUBMITQUEUE_PRIORITY_LOW:
> +		return DRM_SCHED_PRIORITY_MIN;
> +	case PANFROST_SUBMITQUEUE_PRIORITY_MEDIUM:
> +		return DRM_SCHED_PRIORITY_NORMAL;
> +	case PANFROST_SUBMITQUEUE_PRIORITY_HIGH:
> +		return DRM_SCHED_PRIORITY_HIGH;
> +	default:
> +		break;
> +	}
> +
> +	return DRM_SCHED_PRIORITY_UNSET;
> +}
> +
> +static void
> +panfrost_submitqueue_cleanup(struct kref *ref)
> +{
> +	struct panfrost_submitqueue *queue;
> +	unsigned int i;
> +
> +	queue = container_of(ref, struct panfrost_submitqueue, refcount);
> +
> +	for (i = 0; i < NUM_JOB_SLOTS; i++)
> +		drm_sched_entity_destroy(&queue->sched_entity[i]);
> +
> +	/* Kill in-flight jobs */
> +	panfrost_job_kill_queue(queue);
> +
> +	kfree(queue);
> +}
> +
> +void panfrost_submitqueue_put(struct panfrost_submitqueue *queue)
> +{
> +	if (!IS_ERR_OR_NULL(queue))
> +		kref_put(&queue->refcount, panfrost_submitqueue_cleanup);
> +}
> +
> +struct panfrost_submitqueue *
> +panfrost_submitqueue_create(struct panfrost_file_priv *ctx,
> +			    enum panfrost_submitqueue_priority priority,
> +			    u32 flags)

If this function returned an 'int' we could simplify some code. So
instead of returning the struct panfrost_submitqueue just return the ID
(or negative error). The only caller (panfrost_ioctl_create_submitqueue)
doesn't actually want the object just the ID and we can ditch the 'id'
field from panfrost_submitqueue.

Steve

> +{
> +	struct panfrost_submitqueue *queue;
> +	enum drm_sched_priority sched_prio;
> +	int ret, i;
> +
> +	if (flags || priority >= PANFROST_SUBMITQUEUE_PRIORITY_COUNT)
> +		return ERR_PTR(-EINVAL);
> +
> +	queue = kzalloc(sizeof(*queue), GFP_KERNEL);
> +	if (!queue)
> +		return ERR_PTR(-ENOMEM);
> +
> +	queue->pfdev = ctx->pfdev;
> +	sched_prio = to_sched_prio(priority);
> +	for (i = 0; i < NUM_JOB_SLOTS; i++) {
> +		struct drm_gpu_scheduler *sched;
> +
> +		sched = panfrost_job_get_sched(ctx->pfdev, i);
> +		ret = drm_sched_entity_init(&queue->sched_entity[i],
> +					    sched_prio, &sched, 1, NULL);
> +		if (ret)
> +			break;
> +	}
> +
> +	if (ret) {
> +		for (i--; i >= 0; i--)
> +			drm_sched_entity_destroy(&queue->sched_entity[i]);
> +
> +		return ERR_PTR(ret);
> +	}
> +
> +	kref_init(&queue->refcount);
> +	idr_lock(&ctx->queues);
> +	ret = idr_alloc(&ctx->queues, queue, 0, INT_MAX, GFP_KERNEL);
> +	if (ret >= 0)
> +		queue->id = ret;
> +	idr_unlock(&ctx->queues);
> +
> +	if (ret < 0) {
> +		panfrost_submitqueue_put(queue);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return queue;
> +}
> +
> +int panfrost_submitqueue_destroy(struct panfrost_file_priv *ctx, u32 id)
> +{
> +	struct panfrost_submitqueue *queue;
> +
> +	idr_lock(&ctx->queues);
> +	queue = idr_remove(&ctx->queues, id);
> +	idr_unlock(&ctx->queues);
> +
> +	if (!queue)
> +		return -ENOENT;
> +
> +	panfrost_submitqueue_put(queue);
> +	return 0;
> +}
> +
> +struct panfrost_submitqueue *
> +panfrost_submitqueue_get(struct panfrost_file_priv *ctx, u32 id)
> +{
> +	struct panfrost_submitqueue *queue;
> +
> +	idr_lock(&ctx->queues);
> +	queue = idr_find(&ctx->queues, id);
> +	if (queue)
> +		kref_get(&queue->refcount);
> +	idr_unlock(&ctx->queues);
> +
> +	if (!queue)
> +		return ERR_PTR(-ENOENT);
> +
> +	return queue;
> +}
> diff --git a/drivers/gpu/drm/panfrost/panfrost_submitqueue.h b/drivers/gpu/drm/panfrost/panfrost_submitqueue.h
> new file mode 100644
> index 000000000000..cde736d97cf6
> --- /dev/null
> +++ b/drivers/gpu/drm/panfrost/panfrost_submitqueue.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright 2032 Collabora ltd. */
> +
> +#ifndef __PANFROST_SUBMITQUEUE_H__
> +#define __PANFROST_SUBMITQUEUE_H__
> +
> +#include <drm/panfrost_drm.h>
> +
> +struct panfrost_submitqueue {
> +	struct kref refcount;
> +	struct panfrost_device *pfdev;
> +	u32 id;
> +	struct drm_sched_entity sched_entity[NUM_JOB_SLOTS];
> +};
> +
> +struct panfrost_file_priv;
> +
> +struct panfrost_submitqueue *
> +panfrost_submitqueue_create(struct panfrost_file_priv *ctx,
> +			    enum panfrost_submitqueue_priority priority,
> +			    u32 flags);
> +int panfrost_submitqueue_destroy(struct panfrost_file_priv *ctx, u32 id);
> +struct panfrost_submitqueue *
> +panfrost_submitqueue_get(struct panfrost_file_priv *ctx, u32 id);
> +void panfrost_submitqueue_put(struct panfrost_submitqueue *queue);
> +
> +#endif
> diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
> index 45d6c600475c..7ee02fd1ac75 100644
> --- a/include/uapi/drm/panfrost_drm.h
> +++ b/include/uapi/drm/panfrost_drm.h
> @@ -21,6 +21,8 @@ extern "C" {
>  #define DRM_PANFROST_PERFCNT_ENABLE		0x06
>  #define DRM_PANFROST_PERFCNT_DUMP		0x07
>  #define DRM_PANFROST_MADVISE			0x08
> +#define DRM_PANFROST_CREATE_SUBMITQUEUE		0x09
> +#define DRM_PANFROST_DESTROY_SUBMITQUEUE	0x0a
>  
>  #define DRM_IOCTL_PANFROST_SUBMIT		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_SUBMIT, struct drm_panfrost_submit)
>  #define DRM_IOCTL_PANFROST_WAIT_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_WAIT_BO, struct drm_panfrost_wait_bo)
> @@ -29,6 +31,8 @@ extern "C" {
>  #define DRM_IOCTL_PANFROST_GET_PARAM		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_GET_PARAM, struct drm_panfrost_get_param)
>  #define DRM_IOCTL_PANFROST_GET_BO_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_GET_BO_OFFSET, struct drm_panfrost_get_bo_offset)
>  #define DRM_IOCTL_PANFROST_MADVISE		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_MADVISE, struct drm_panfrost_madvise)
> +#define DRM_IOCTL_PANFROST_CREATE_SUBMITQUEUE	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_CREATE_SUBMITQUEUE, struct drm_panfrost_create_submitqueue)
> +#define DRM_IOCTL_PANFROST_DESTROY_SUBMITQUEUE	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_DESTROY_SUBMITQUEUE, __u32)
>  
>  /*
>   * Unstable ioctl(s): only exposed when the unsafe unstable_ioctls module
> @@ -224,6 +228,19 @@ struct drm_panfrost_madvise {
>  	__u32 retained;       /* out, whether backing store still exists */
>  };
>  
> +enum panfrost_submitqueue_priority {
> +	PANFROST_SUBMITQUEUE_PRIORITY_LOW = 0,
> +	PANFROST_SUBMITQUEUE_PRIORITY_MEDIUM,
> +	PANFROST_SUBMITQUEUE_PRIORITY_HIGH,
> +	PANFROST_SUBMITQUEUE_PRIORITY_COUNT,
> +};
> +
> +struct drm_panfrost_create_submitqueue {
> +	__u32 flags;	/* in, PANFROST_SUBMITQUEUE_x */
> +	__u32 priority;	/* in, enum panfrost_submitqueue_priority */
> +	__u32 id;	/* out, identifier */
> +};
> +
>  #define PANFROST_BO_REF_EXCLUSIVE	0x1
>  
>  #if defined(__cplusplus)
> 

