Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 633043BB9AC
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 10:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1458982C;
	Mon,  5 Jul 2021 08:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 20C1B8982C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 08:56:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EBFB13D5;
 Mon,  5 Jul 2021 01:56:19 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A62013F5A1;
 Mon,  5 Jul 2021 01:56:13 -0700 (PDT)
Subject: Re: [PATCH v4 4/7] drm/panfrost: Add the ability to create submit
 queues
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <20210705082950.3573841-1-boris.brezillon@collabora.com>
 <20210705082950.3573841-5-boris.brezillon@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <f6014259-3b71-8437-9c81-5dbfb82f2d7e@arm.com>
Date: Mon, 5 Jul 2021 09:56:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705082950.3573841-5-boris.brezillon@collabora.com>
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

On 05/07/2021 09:29, Boris Brezillon wrote:
> Needed to keep VkQueues isolated from each other.
> 
> v4:
> * Make panfrost_ioctl_create_submitqueue() return the queue ID
>   instead of a queue object
> 
> v3:
> * Limit the number of submitqueue per context to 16
> * Fix a deadlock
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/Makefile             |   3 +-
>  drivers/gpu/drm/panfrost/panfrost_device.h    |   2 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |  69 ++++++++-
>  drivers/gpu/drm/panfrost/panfrost_job.c       |  47 ++-----
>  drivers/gpu/drm/panfrost/panfrost_job.h       |   9 +-
>  .../gpu/drm/panfrost/panfrost_submitqueue.c   | 132 ++++++++++++++++++
>  .../gpu/drm/panfrost/panfrost_submitqueue.h   |  26 ++++
>  include/uapi/drm/panfrost_drm.h               |  17 +++
>  8 files changed, 260 insertions(+), 45 deletions(-)
>  create mode 100644 drivers/gpu/drm/panfrost/panfrost_submitqueue.c
>  create mode 100644 drivers/gpu/drm/panfrost/panfrost_submitqueue.h
> 
> diff --git a/drivers/gpu/drm/panfrost/Makefile b/drivers/gpu/drm/panfrost/Makefile
> index b71935862417..e99192b66ec9 100644
> --- a/drivers/gpu/drm/panfrost/Makefile
> +++ b/drivers/gpu/drm/panfrost/Makefile
> @@ -9,6 +9,7 @@ panfrost-y := \
>  	panfrost_gpu.o \
>  	panfrost_job.o \
>  	panfrost_mmu.o \
> -	panfrost_perfcnt.o
> +	panfrost_perfcnt.o \
> +	panfrost_submitqueue.o
>  
>  obj-$(CONFIG_DRM_PANFROST) += panfrost.o
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 8b25278f34c8..51c0ba4e50f5 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -137,7 +137,7 @@ struct panfrost_mmu {
>  struct panfrost_file_priv {
>  	struct panfrost_device *pfdev;
>  
> -	struct drm_sched_entity sched_entity[NUM_JOB_SLOTS];
> +	struct idr queues;
>  
>  	struct panfrost_mmu *mmu;
>  };
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index b6b5997c9366..8e28ef30310b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -19,6 +19,7 @@
>  #include "panfrost_job.h"
>  #include "panfrost_gpu.h"
>  #include "panfrost_perfcnt.h"
> +#include "panfrost_submitqueue.h"
>  
>  static bool unstable_ioctls;
>  module_param_unsafe(unstable_ioctls, bool, 0600);
> @@ -250,6 +251,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>  	struct panfrost_device *pfdev = dev->dev_private;
>  	struct drm_panfrost_submit *args = data;
>  	struct drm_syncobj *sync_out = NULL;
> +	struct panfrost_submitqueue *queue;
>  	struct panfrost_job *job;
>  	int ret = 0;
>  
> @@ -259,10 +261,16 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>  	if (args->requirements && args->requirements != PANFROST_JD_REQ_FS)
>  		return -EINVAL;
>  
> +	queue = panfrost_submitqueue_get(file->driver_priv, 0);
> +	if (IS_ERR(queue))
> +		return PTR_ERR(queue);
> +
>  	if (args->out_sync > 0) {
>  		sync_out = drm_syncobj_find(file, args->out_sync);
> -		if (!sync_out)
> -			return -ENODEV;
> +		if (!sync_out) {
> +			ret = -ENODEV;
> +			goto fail_put_queue;
> +		}
>  	}
>  
>  	job = kzalloc(sizeof(*job), GFP_KERNEL);
> @@ -289,7 +297,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>  	if (ret)
>  		goto fail_job;
>  
> -	ret = panfrost_job_push(job);
> +	ret = panfrost_job_push(queue, job);
>  	if (ret)
>  		goto fail_job;
>  
> @@ -302,6 +310,8 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>  fail_out_sync:
>  	if (sync_out)
>  		drm_syncobj_put(sync_out);
> +fail_put_queue:
> +	panfrost_submitqueue_put(queue);
>  
>  	return ret;
>  }
> @@ -451,6 +461,36 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
>  	return ret;
>  }
>  
> +static int
> +panfrost_ioctl_create_submitqueue(struct drm_device *dev, void *data,
> +				  struct drm_file *file_priv)
> +{
> +	struct panfrost_file_priv *priv = file_priv->driver_priv;
> +	struct drm_panfrost_create_submitqueue *args = data;
> +	int ret;
> +
> +	ret = panfrost_submitqueue_create(priv, args->priority, args->flags);
> +	if (ret < 0)
> +		return ret;
> +
> +	args->id = ret;
> +	return 0;
> +}
> +
> +static int
> +panfrost_ioctl_destroy_submitqueue(struct drm_device *dev, void *data,
> +				   struct drm_file *file_priv)
> +{
> +	struct panfrost_file_priv *priv = file_priv->driver_priv;
> +	u32 id = *((u32 *)data);
> +
> +	/* Default queue can't be destroyed. */
> +	if (!id)
> +		return -ENOENT;
> +
> +	return panfrost_submitqueue_destroy(priv, id);
> +}
> +
>  int panfrost_unstable_ioctl_check(void)
>  {
>  	if (!unstable_ioctls)
> @@ -479,13 +519,22 @@ panfrost_open(struct drm_device *dev, struct drm_file *file)
>  		goto err_free;
>  	}
>  
> -	ret = panfrost_job_open(panfrost_priv);
> +	idr_init(&panfrost_priv->queues);
> +
> +	ret = panfrost_submitqueue_create(panfrost_priv,
> +					  PANFROST_SUBMITQUEUE_PRIORITY_MEDIUM,
> +					  0);
> +
> +	/* We expect the default queue to get id 0, a positive queue id is
> +	 * considered a failure in that case.
> +	 */
>  	if (ret)
> -		goto err_job;
> +		goto err_destroy_idr;
>  
>  	return 0;
>  
> -err_job:
> +err_destroy_idr:
> +	idr_destroy(&panfrost_priv->queues);
>  	panfrost_mmu_ctx_put(panfrost_priv->mmu);
>  err_free:
>  	kfree(panfrost_priv);
> @@ -496,11 +545,15 @@ static void
>  panfrost_postclose(struct drm_device *dev, struct drm_file *file)
>  {
>  	struct panfrost_file_priv *panfrost_priv = file->driver_priv;
> +	u32 id;
>  
>  	panfrost_perfcnt_close(file);
> -	panfrost_job_close(panfrost_priv);
> +
> +	for (id = 0; idr_get_next(&panfrost_priv->queues, &id); id++)
> +		panfrost_submitqueue_destroy(panfrost_priv, id);
>  
>  	panfrost_mmu_ctx_put(panfrost_priv->mmu);
> +	idr_destroy(&panfrost_priv->queues);
>  	kfree(panfrost_priv);
>  }
>  
> @@ -517,6 +570,8 @@ static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
>  	PANFROST_IOCTL(PERFCNT_ENABLE,	perfcnt_enable,	DRM_RENDER_ALLOW),
>  	PANFROST_IOCTL(PERFCNT_DUMP,	perfcnt_dump,	DRM_RENDER_ALLOW),
>  	PANFROST_IOCTL(MADVISE,		madvise,	DRM_RENDER_ALLOW),
> +	PANFROST_IOCTL(CREATE_SUBMITQUEUE, create_submitqueue, DRM_RENDER_ALLOW),
> +	PANFROST_IOCTL(DESTROY_SUBMITQUEUE, destroy_submitqueue, DRM_RENDER_ALLOW),
>  };
>  
>  DEFINE_DRM_GEM_FOPS(panfrost_drm_driver_fops);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 152245b122be..56ae89272e19 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -20,6 +20,7 @@
>  #include "panfrost_regs.h"
>  #include "panfrost_gpu.h"
>  #include "panfrost_mmu.h"
> +#include "panfrost_submitqueue.h"
>  
>  #define JOB_TIMEOUT_MS 500
>  
> @@ -276,15 +277,15 @@ static void panfrost_attach_object_fences(struct panfrost_job *job)
>  	}
>  }
>  
> -int panfrost_job_push(struct panfrost_job *job)
> +int panfrost_job_push(struct panfrost_submitqueue *queue,
> +		      struct panfrost_job *job)
>  {
>  	struct panfrost_device *pfdev = job->pfdev;
>  	int slot = panfrost_job_get_slot(job);
> -	struct drm_sched_entity *entity = &job->file_priv->sched_entity[slot];
> +	struct drm_sched_entity *entity = &queue->sched_entity[slot];
>  	struct ww_acquire_ctx acquire_ctx;
>  	int ret = 0;
>  
> -
>  	ret = drm_gem_lock_reservations(job->bos, job->bo_count,
>  					    &acquire_ctx);
>  	if (ret)
> @@ -881,43 +882,18 @@ void panfrost_job_fini(struct panfrost_device *pfdev)
>  	destroy_workqueue(pfdev->reset.wq);
>  }
>  
> -int panfrost_job_open(struct panfrost_file_priv *panfrost_priv)
> +void panfrost_job_kill_queue(struct panfrost_submitqueue *queue)
>  {
> -	struct panfrost_device *pfdev = panfrost_priv->pfdev;
> -	struct panfrost_job_slot *js = pfdev->js;
> -	struct drm_gpu_scheduler *sched;
> -	int ret, i;
> +	struct panfrost_device *pfdev = queue->pfdev;
> +	int i, j;
>  
> -	for (i = 0; i < NUM_JOB_SLOTS; i++) {
> -		sched = &js->queue[i].sched;
> -		ret = drm_sched_entity_init(&panfrost_priv->sched_entity[i],
> -					    DRM_SCHED_PRIORITY_NORMAL, &sched,
> -					    1, NULL);
> -		if (WARN_ON(ret))
> -			return ret;
> -	}
> -	return 0;
> -}
> -
> -void panfrost_job_close(struct panfrost_file_priv *panfrost_priv)
> -{
> -	struct panfrost_device *pfdev = panfrost_priv->pfdev;
> -	int i;
> -
> -	for (i = 0; i < NUM_JOB_SLOTS; i++)
> -		drm_sched_entity_destroy(&panfrost_priv->sched_entity[i]);
> -
> -	/* Kill in-flight jobs */
>  	spin_lock(&pfdev->js->job_lock);
>  	for (i = 0; i < NUM_JOB_SLOTS; i++) {
> -		struct drm_sched_entity *entity = &panfrost_priv->sched_entity[i];
> -		int j;
> -
>  		for (j = ARRAY_SIZE(pfdev->jobs[0]) - 1; j >= 0; j--) {
>  			struct panfrost_job *job = pfdev->jobs[i][j];
>  			u32 cmd;
>  
> -			if (!job || job->base.entity != entity)
> +			if (!job || job->base.entity != &queue->sched_entity[i])
>  				continue;
>  
>  			if (j == 1) {
> @@ -936,7 +912,6 @@ void panfrost_job_close(struct panfrost_file_priv *panfrost_priv)
>  			} else {
>  				cmd = JS_COMMAND_HARD_STOP;
>  			}
> -
>  			job_write(pfdev, JS_COMMAND(i), cmd);
>  		}
>  	}
> @@ -956,3 +931,9 @@ int panfrost_job_is_idle(struct panfrost_device *pfdev)
>  
>  	return true;
>  }
> +
> +struct drm_gpu_scheduler *
> +panfrost_job_get_sched(struct panfrost_device *pfdev, unsigned int js)
> +{
> +	return &pfdev->js->queue[js].sched;
> +}
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
> index 1cbc3621b663..5c228bb431c0 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.h
> @@ -10,6 +10,7 @@
>  struct panfrost_device;
>  struct panfrost_gem_object;
>  struct panfrost_file_priv;
> +struct panfrost_submitqueue;
>  
>  struct panfrost_job {
>  	struct drm_sched_job base;
> @@ -41,11 +42,13 @@ struct panfrost_job {
>  
>  int panfrost_job_init(struct panfrost_device *pfdev);
>  void panfrost_job_fini(struct panfrost_device *pfdev);
> -int panfrost_job_open(struct panfrost_file_priv *panfrost_priv);
> -void panfrost_job_close(struct panfrost_file_priv *panfrost_priv);
> -int panfrost_job_push(struct panfrost_job *job);
> +int panfrost_job_push(struct panfrost_submitqueue *queue,
> +		      struct panfrost_job *job);
>  void panfrost_job_put(struct panfrost_job *job);
>  void panfrost_job_enable_interrupts(struct panfrost_device *pfdev);
>  int panfrost_job_is_idle(struct panfrost_device *pfdev);
> +void panfrost_job_kill_queue(struct panfrost_submitqueue *queue);
> +struct drm_gpu_scheduler *
> +panfrost_job_get_sched(struct panfrost_device *pfdev, unsigned int js);
>  
>  #endif
> diff --git a/drivers/gpu/drm/panfrost/panfrost_submitqueue.c b/drivers/gpu/drm/panfrost/panfrost_submitqueue.c
> new file mode 100644
> index 000000000000..8944b4410be3
> --- /dev/null
> +++ b/drivers/gpu/drm/panfrost/panfrost_submitqueue.c
> @@ -0,0 +1,132 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright 2021 Collabora ltd. */
> +
> +#include <linux/idr.h>
> +
> +#include "panfrost_device.h"
> +#include "panfrost_job.h"
> +#include "panfrost_submitqueue.h"
> +
> +#define PAN_MAX_SUBMITQUEUES	16
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
> +int
> +panfrost_submitqueue_create(struct panfrost_file_priv *ctx,
> +			    enum panfrost_submitqueue_priority priority,
> +			    u32 flags)
> +{
> +	struct panfrost_submitqueue *queue;
> +	enum drm_sched_priority sched_prio;
> +	int ret, i;
> +
> +	if (flags || priority >= PANFROST_SUBMITQUEUE_PRIORITY_COUNT)
> +		return -EINVAL;
> +
> +	queue = kzalloc(sizeof(*queue), GFP_KERNEL);
> +	if (!queue)
> +		return -ENOMEM;
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
> +		return ret;
> +	}
> +
> +	kref_init(&queue->refcount);
> +
> +	idr_preload(GFP_KERNEL);
> +	idr_lock(&ctx->queues);
> +	ret = idr_alloc(&ctx->queues, queue, 0, PAN_MAX_SUBMITQUEUES,
> +			GFP_NOWAIT);
> +	idr_unlock(&ctx->queues);
> +	idr_preload_end();
> +
> +	if (ret < 0)
> +		panfrost_submitqueue_put(queue);
> +
> +	return ret;
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
> index 000000000000..ade224725844
> --- /dev/null
> +++ b/drivers/gpu/drm/panfrost/panfrost_submitqueue.h
> @@ -0,0 +1,26 @@
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
> +	struct drm_sched_entity sched_entity[NUM_JOB_SLOTS];
> +};
> +
> +struct panfrost_file_priv;
> +
> +int
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
> index 3723c9d231b5..e31a22c176d9 100644
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
>  /* Exclusive (AKA write) access to the BO */
>  #define PANFROST_BO_REF_EXCLUSIVE	0x1
>  
> 

