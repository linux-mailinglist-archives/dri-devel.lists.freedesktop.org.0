Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A5FB7E32A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF53710E197;
	Wed, 17 Sep 2025 10:15:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 884E010E197
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 10:15:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2AE82659;
 Wed, 17 Sep 2025 03:15:46 -0700 (PDT)
Received: from [10.1.26.46] (e122027.cambridge.arm.com [10.1.26.46])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D893C3F673;
 Wed, 17 Sep 2025 03:15:52 -0700 (PDT)
Message-ID: <ffc945c5-a7dc-4a83-84d5-725e603c0581@arm.com>
Date: Wed, 17 Sep 2025 11:15:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drm/panfrost: Introduce JM contexts for manging
 job resources
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250912132002.304187-1-adrian.larumbe@collabora.com>
 <20250912132002.304187-3-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250912132002.304187-3-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
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

On 12/09/2025 14:19, Adrián Larumbe wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> A JM context describes user-requested priorities for the JM queues.
> 
> Context creation leads to the initialization of scheduling entities of
> the same priority for all the device's job slots.
> 
> Until context creation and destruction are exposed to UM, all issued
> jobs shall be bound to the default Panfrost file context, which has
> medium priority.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_device.h |  11 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c    |  24 ++-
>  drivers/gpu/drm/panfrost/panfrost_job.c    | 195 +++++++++++++++++----
>  drivers/gpu/drm/panfrost/panfrost_job.h    |  25 ++-
>  4 files changed, 215 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 077525a3ad68..1e73efad02a8 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -10,11 +10,13 @@
>  #include <linux/pm.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/spinlock.h>
> +#include <drm/drm_auth.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_mm.h>
>  #include <drm/gpu_scheduler.h>
>  
>  #include "panfrost_devfreq.h"
> +#include "panfrost_job.h"
>  
>  struct panfrost_device;
>  struct panfrost_mmu;
> @@ -22,7 +24,6 @@ struct panfrost_job_slot;
>  struct panfrost_job;
>  struct panfrost_perfcnt;
>  
> -#define NUM_JOB_SLOTS 3
>  #define MAX_PM_DOMAINS 5
>  
>  enum panfrost_drv_comp_bits {
> @@ -206,13 +207,19 @@ struct panfrost_engine_usage {
>  struct panfrost_file_priv {
>  	struct panfrost_device *pfdev;
>  
> -	struct drm_sched_entity sched_entity[NUM_JOB_SLOTS];
> +	struct xarray jm_ctxs;
>  
>  	struct panfrost_mmu *mmu;
>  
>  	struct panfrost_engine_usage engine_usage;
>  };
>  
> +static inline bool panfrost_high_prio_allowed(struct drm_file *file)
> +{
> +	/* Higher priorities require CAP_SYS_NICE or DRM_MASTER */
> +	return (capable(CAP_SYS_NICE) || drm_is_current_master(file));
> +}
> +
>  static inline struct panfrost_device *to_panfrost_device(struct drm_device *ddev)
>  {
>  	return ddev->dev_private;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 1ea6c509a5d5..be384b18e8fd 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -279,9 +279,16 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>  	struct panfrost_file_priv *file_priv = file->driver_priv;
>  	struct drm_panfrost_submit *args = data;
>  	struct drm_syncobj *sync_out = NULL;
> +	struct panfrost_jm_ctx *jm_ctx;
>  	struct panfrost_job *job;
>  	int ret = 0, slot;
>  
> +	if (args->pad)
> +		return -EINVAL;
> +
> +	if (args->jm_ctx_handle)
> +		return -EINVAL;
> +
>  	if (!args->jc)
>  		return -EINVAL;
>  
> @@ -294,10 +301,16 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>  			return -ENODEV;
>  	}
>  
> +	jm_ctx = panfrost_jm_ctx_from_handle(file, args->jm_ctx_handle);
> +	if (!jm_ctx) {
> +		ret = -EINVAL;
> +		goto out_put_syncout;
> +	}
> +
>  	job = kzalloc(sizeof(*job), GFP_KERNEL);
>  	if (!job) {
>  		ret = -ENOMEM;
> -		goto out_put_syncout;
> +		goto out_put_jm_ctx;
>  	}
>  
>  	kref_init(&job->refcount);
> @@ -307,12 +320,13 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>  	job->requirements = args->requirements;
>  	job->flush_id = panfrost_gpu_get_latest_flush_id(pfdev);
>  	job->mmu = file_priv->mmu;
> +	job->ctx = panfrost_jm_ctx_get(jm_ctx);
>  	job->engine_usage = &file_priv->engine_usage;
>  
>  	slot = panfrost_job_get_slot(job);
>  
>  	ret = drm_sched_job_init(&job->base,
> -				 &file_priv->sched_entity[slot],
> +				 &jm_ctx->slot_entity[slot],
>  				 1, NULL, file->client_id);
>  	if (ret)
>  		goto out_put_job;
> @@ -338,6 +352,8 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
>  		drm_sched_job_cleanup(&job->base);
>  out_put_job:
>  	panfrost_job_put(job);
> +out_put_jm_ctx:
> +	panfrost_jm_ctx_put(jm_ctx);
>  out_put_syncout:
>  	if (sync_out)
>  		drm_syncobj_put(sync_out);
> @@ -564,7 +580,7 @@ panfrost_open(struct drm_device *dev, struct drm_file *file)
>  		goto err_free;
>  	}
>  
> -	ret = panfrost_job_open(panfrost_priv);
> +	ret = panfrost_job_open(file);
>  	if (ret)
>  		goto err_job;
>  
> @@ -583,7 +599,7 @@ panfrost_postclose(struct drm_device *dev, struct drm_file *file)
>  	struct panfrost_file_priv *panfrost_priv = file->driver_priv;
>  
>  	panfrost_perfcnt_close(file);
> -	panfrost_job_close(panfrost_priv);
> +	panfrost_job_close(file);
>  
>  	panfrost_mmu_ctx_put(panfrost_priv->mmu);
>  	kfree(panfrost_priv);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 82acabb21b27..0f955dae7873 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -22,6 +22,7 @@
>  #include "panfrost_mmu.h"
>  #include "panfrost_dump.h"
>  
> +#define MAX_JM_CTX_PER_FILE 64
>  #define JOB_TIMEOUT_MS 500
>  
>  #define job_write(dev, reg, data) writel(data, dev->iomem + (reg))
> @@ -359,6 +360,7 @@ static void panfrost_job_cleanup(struct kref *ref)
>  		kvfree(job->bos);
>  	}
>  
> +	panfrost_jm_ctx_put(job->ctx);
>  	kfree(job);
>  }
>  
> @@ -383,6 +385,9 @@ static struct dma_fence *panfrost_job_run(struct drm_sched_job *sched_job)
>  	int slot = panfrost_job_get_slot(job);
>  	struct dma_fence *fence = NULL;
>  
> +	if (job->ctx->destroyed)
> +		return ERR_PTR(-ECANCELED);
> +
>  	if (unlikely(job->base.s_fence->finished.error))
>  		return NULL;
>  
> @@ -917,39 +922,176 @@ void panfrost_job_fini(struct panfrost_device *pfdev)
>  	destroy_workqueue(pfdev->reset.wq);
>  }
>  
> -int panfrost_job_open(struct panfrost_file_priv *panfrost_priv)
> +int panfrost_job_open(struct drm_file *file)
> +{
> +	struct panfrost_file_priv *panfrost_priv = file->driver_priv;
> +	int ret;
> +
> +	struct drm_panfrost_jm_ctx_create default_jm_ctx = {
> +		.priority = PANFROST_JM_CTX_PRIORITY_MEDIUM,
> +	};
> +
> +	xa_init_flags(&panfrost_priv->jm_ctxs, XA_FLAGS_ALLOC);
> +
> +	ret = panfrost_jm_ctx_create(file, &default_jm_ctx);
> +	if (ret)
> +		return ret;
> +
> +	/* We expect the default context to be assigned handle 0. */
> +	if (WARN_ON(default_jm_ctx.handle))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +void panfrost_job_close(struct drm_file *file)
> +{
> +	struct panfrost_file_priv *panfrost_priv = file->driver_priv;
> +	struct panfrost_jm_ctx *jm_ctx;
> +	unsigned long i;
> +
> +	xa_for_each(&panfrost_priv->jm_ctxs, i, jm_ctx)
> +		panfrost_jm_ctx_destroy(file, i);
> +
> +	xa_destroy(&panfrost_priv->jm_ctxs);
> +}
> +
> +int panfrost_job_is_idle(struct panfrost_device *pfdev)
>  {
> -	struct panfrost_device *pfdev = panfrost_priv->pfdev;
>  	struct panfrost_job_slot *js = pfdev->js;
> -	struct drm_gpu_scheduler *sched;
> -	int ret, i;
> +	int i;
>  
>  	for (i = 0; i < NUM_JOB_SLOTS; i++) {
> -		sched = &js->queue[i].sched;
> -		ret = drm_sched_entity_init(&panfrost_priv->sched_entity[i],
> -					    DRM_SCHED_PRIORITY_NORMAL, &sched,
> -					    1, NULL);
> -		if (WARN_ON(ret))
> -			return ret;
> +		/* If there are any jobs in the HW queue, we're not idle */
> +		if (atomic_read(&js->queue[i].sched.credit_count))
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
> +static void panfrost_jm_ctx_release(struct kref *kref)
> +{
> +	struct panfrost_jm_ctx *jm_ctx = container_of(kref, struct panfrost_jm_ctx, refcnt);
> +
> +	WARN_ON(!jm_ctx->destroyed);
> +
> +	for (u32 i = 0; i < ARRAY_SIZE(jm_ctx->slot_entity) - 1; i++)

Why the "- 1" here (and below)? AFAICT you've allocated the array to the
NUM_JOB_SLOTS long but then never use the final entry? I'll admit that
the 3rd job slot is basically useless. But if we're going down that
route we should just reduce NUM_JOB_SLOTS by 1 (or I guess define the
slot_entity array with the "- 1" with a comment explaining the logic).
Personally I'd just stick with 3 slots as then it's ready in case anyone
is brave enough to take on the T658 and support multiple core groups
properly.

Other than that everything looks good.

Thanks,
Steve

> +		drm_sched_entity_destroy(&jm_ctx->slot_entity[i]);
> +
> +	kfree(jm_ctx);
> +}
> +
> +void
> +panfrost_jm_ctx_put(struct panfrost_jm_ctx *jm_ctx)
> +{
> +	if (jm_ctx)
> +		kref_put(&jm_ctx->refcnt, panfrost_jm_ctx_release);
> +}
> +
> +struct panfrost_jm_ctx *
> +panfrost_jm_ctx_get(struct panfrost_jm_ctx *jm_ctx)
> +{
> +	if (jm_ctx)
> +		kref_get(&jm_ctx->refcnt);
> +
> +	return jm_ctx;
> +}
> +
> +struct panfrost_jm_ctx *
> +panfrost_jm_ctx_from_handle(struct drm_file *file, u32 handle)
> +{
> +	struct panfrost_file_priv *priv = file->driver_priv;
> +	struct panfrost_jm_ctx *jm_ctx;
> +
> +	xa_lock(&priv->jm_ctxs);
> +	jm_ctx = panfrost_jm_ctx_get(xa_load(&priv->jm_ctxs, handle));
> +	xa_unlock(&priv->jm_ctxs);
> +
> +	return jm_ctx;
> +}
> +
> +static int jm_ctx_prio_to_drm_sched_prio(struct drm_file *file,
> +					 enum drm_panfrost_jm_ctx_priority in,
> +					 enum drm_sched_priority *out)
> +{
> +	switch (in) {
> +	case PANFROST_JM_CTX_PRIORITY_LOW:
> +		*out = DRM_SCHED_PRIORITY_LOW;
> +		return 0;
> +	case PANFROST_JM_CTX_PRIORITY_MEDIUM:
> +		*out = DRM_SCHED_PRIORITY_NORMAL;
> +		return 0;
> +	case PANFROST_JM_CTX_PRIORITY_HIGH:
> +		if (!panfrost_high_prio_allowed(file))
> +			return -EACCES;
> +
> +		*out = DRM_SCHED_PRIORITY_HIGH;
> +		return 0;
> +	default:
> +		return -EINVAL;
>  	}
> +}
> +
> +int panfrost_jm_ctx_create(struct drm_file *file,
> +			   struct drm_panfrost_jm_ctx_create *args)
> +{
> +	struct panfrost_file_priv *priv = file->driver_priv;
> +	struct panfrost_device *pfdev = priv->pfdev;
> +	enum drm_sched_priority sched_prio;
> +	struct panfrost_jm_ctx *jm_ctx;
> +	int ret;
> +
> +	jm_ctx = kzalloc(sizeof(*jm_ctx), GFP_KERNEL);
> +	if (!jm_ctx)
> +		return -ENOMEM;
> +
> +	kref_init(&jm_ctx->refcnt);
> +
> +	ret = jm_ctx_prio_to_drm_sched_prio(file, args->priority, &sched_prio);
> +	if (ret)
> +		goto err_put_jm_ctx;
> +
> +	for (u32 i = 0; i < NUM_JOB_SLOTS - 1; i++) {
> +		struct drm_gpu_scheduler *sched = &pfdev->js->queue[i].sched;
> +
> +		ret = drm_sched_entity_init(&jm_ctx->slot_entity[i], sched_prio,
> +					    &sched, 1, NULL);
> +		if (ret)
> +			goto err_put_jm_ctx;
> +	}
> +
> +	ret = xa_alloc(&priv->jm_ctxs, &args->handle, jm_ctx,
> +		       XA_LIMIT(0, MAX_JM_CTX_PER_FILE), GFP_KERNEL);
> +	if (ret)
> +		goto err_put_jm_ctx;
> +
>  	return 0;
> +
> +err_put_jm_ctx:
> +	jm_ctx->destroyed = true;
> +	panfrost_jm_ctx_put(jm_ctx);
> +	return ret;
>  }
>  
> -void panfrost_job_close(struct panfrost_file_priv *panfrost_priv)
> +int panfrost_jm_ctx_destroy(struct drm_file *file, u32 handle)
>  {
> -	struct panfrost_device *pfdev = panfrost_priv->pfdev;
> -	int i;
> +	struct panfrost_file_priv *priv = file->driver_priv;
> +	struct panfrost_device *pfdev = priv->pfdev;
> +	struct panfrost_jm_ctx *jm_ctx;
>  
> -	for (i = 0; i < NUM_JOB_SLOTS; i++)
> -		drm_sched_entity_destroy(&panfrost_priv->sched_entity[i]);
> +	jm_ctx = xa_erase(&priv->jm_ctxs, handle);
> +	if (!jm_ctx)
> +		return -EINVAL;
> +
> +	jm_ctx->destroyed = true;
>  
>  	/* Kill in-flight jobs */
>  	spin_lock(&pfdev->js->job_lock);
> -	for (i = 0; i < NUM_JOB_SLOTS; i++) {
> -		struct drm_sched_entity *entity = &panfrost_priv->sched_entity[i];
> -		int j;
> +	for (u32 i = 0; i < ARRAY_SIZE(jm_ctx->slot_entity) - 1; i++) {
> +		struct drm_sched_entity *entity = &jm_ctx->slot_entity[i];
>  
> -		for (j = ARRAY_SIZE(pfdev->jobs[0]) - 1; j >= 0; j--) {
> +		for (int j = ARRAY_SIZE(pfdev->jobs[0]) - 1; j >= 0; j--) {
>  			struct panfrost_job *job = pfdev->jobs[i][j];
>  			u32 cmd;
>  
> @@ -980,18 +1122,7 @@ void panfrost_job_close(struct panfrost_file_priv *panfrost_priv)
>  		}
>  	}
>  	spin_unlock(&pfdev->js->job_lock);
> -}
> -
> -int panfrost_job_is_idle(struct panfrost_device *pfdev)
> -{
> -	struct panfrost_job_slot *js = pfdev->js;
> -	int i;
>  
> -	for (i = 0; i < NUM_JOB_SLOTS; i++) {
> -		/* If there are any jobs in the HW queue, we're not idle */
> -		if (atomic_read(&js->queue[i].sched.credit_count))
> -			return false;
> -	}
> -
> -	return true;
> +	panfrost_jm_ctx_put(jm_ctx);
> +	return 0;
>  }
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
> index ec581b97852b..5a30ff1503c6 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.h
> @@ -18,6 +18,7 @@ struct panfrost_job {
>  
>  	struct panfrost_device *pfdev;
>  	struct panfrost_mmu *mmu;
> +	struct panfrost_jm_ctx *ctx;
>  
>  	/* Fence to be signaled by IRQ handler when the job is complete. */
>  	struct dma_fence *done_fence;
> @@ -39,10 +40,30 @@ struct panfrost_job {
>  	u64 start_cycles;
>  };
>  
> +struct panfrost_js_ctx {
> +	struct drm_sched_entity sched_entity;
> +	bool enabled;
> +};
> +
> +#define NUM_JOB_SLOTS 3
> +
> +struct panfrost_jm_ctx {
> +	struct kref refcnt;
> +	bool destroyed;
> +	struct drm_sched_entity slot_entity[NUM_JOB_SLOTS];
> +};
> +
> +int panfrost_jm_ctx_create(struct drm_file *file,
> +			   struct drm_panfrost_jm_ctx_create *args);
> +int panfrost_jm_ctx_destroy(struct drm_file *file, u32 handle);
> +void panfrost_jm_ctx_put(struct panfrost_jm_ctx *jm_ctx);
> +struct panfrost_jm_ctx *panfrost_jm_ctx_get(struct panfrost_jm_ctx *jm_ctx);
> +struct panfrost_jm_ctx *panfrost_jm_ctx_from_handle(struct drm_file *file, u32 handle);
> +
>  int panfrost_job_init(struct panfrost_device *pfdev);
>  void panfrost_job_fini(struct panfrost_device *pfdev);
> -int panfrost_job_open(struct panfrost_file_priv *panfrost_priv);
> -void panfrost_job_close(struct panfrost_file_priv *panfrost_priv);
> +int panfrost_job_open(struct drm_file *file);
> +void panfrost_job_close(struct drm_file *file);
>  int panfrost_job_get_slot(struct panfrost_job *job);
>  int panfrost_job_push(struct panfrost_job *job);
>  void panfrost_job_put(struct panfrost_job *job);

