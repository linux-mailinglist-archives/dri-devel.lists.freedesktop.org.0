Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E89B532D1
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 14:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15D410EB1E;
	Thu, 11 Sep 2025 12:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="JbewnDWG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D45010EB1E
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 12:54:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757595280; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=WDxqax0wV/WNwBY0qceSGKgNfqpEDAiwuJ8nc9bPio0Dz5US2x5Xu+Bkc/8m6bWU5ubGkb0G7q8RxV7BcPAO9GmbmHJmxyUBL04bJmUireQ78DUP9DSvDRObCpbTSXdVixwbmo6yjr3NNWpD2SWbhRYTYzs/w01dzf+P8JgVKjk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757595280;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=W6CJNaIVzIOkllB6TU74J41JHRP6SmEfP0GNmTtSBFE=; 
 b=ZPBGiElmsR9p7bT1ub22PXCe7AEXmbaug67pkLyCOjjvYDMDycK+nzeFlo1IJZGzbwvVhm7PfQQnImSv3HJL5x10mykWqEUOT+s0l7qsEl/MHuNYFr7jxGOC4cmmOykjPzUKlEKmZ4YIcJhk1e6jI/WC4iNBfQj5cgSiKJFm2DU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757595279; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=W6CJNaIVzIOkllB6TU74J41JHRP6SmEfP0GNmTtSBFE=;
 b=JbewnDWGisbR0cCvjVJoy3MbEW4us3UINIePX8PKtQvYdhJXDD6zjEkd03sznJrQ
 2joHfayWsjqiuXEjRBQPW3bpvQOwemxQf5TJ9fJYQ2GmUogW2qr45mVlPJ/YzwELwoa
 xucX1N2gbHgmtX4SqxFUVaFiVZW0H+yo9eTw27JE=
Received: by mx.zohomail.com with SMTPS id 1757595278584122.0736606863992;
 Thu, 11 Sep 2025 05:54:38 -0700 (PDT)
Date: Thu, 11 Sep 2025 13:54:34 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v2 2/4] drm/panfrost: Introduce JM contexts for manging
 job resources
Message-ID: <lr75gtj62yktbguw6iv3fmnpjoxuhrwbdj2wkbp3na6uqobwgz@3hm2cgijeavd>
References: <20250904001054.147465-1-adrian.larumbe@collabora.com>
 <20250904001054.147465-3-adrian.larumbe@collabora.com>
 <99a903b8-4b51-408d-b620-4166a11e3ad1@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99a903b8-4b51-408d-b620-4166a11e3ad1@arm.com>
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

Hi Steven,

On 10.09.2025 16:42, Steven Price wrote:
> On 04/09/2025 01:08, Adrián Larumbe wrote:
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> >
> > A JM context describes GPU HW resourdce allocation for the jobs bound to
> > it. At the time of writing this, it only holds the JS and queue
> > scheduler priorities.
> >
> > When a context is created, all the scheduler entities created for job
> > slots will have the same priority.
> >
> > Until context creation and destruction and attaching a context ID to
> > a job submission are exposed to UM, all jobs shall be bound to the
> > default Panfrost file context, which has medium priority.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_device.h |   4 +-
> >  drivers/gpu/drm/panfrost/panfrost_drv.c    |  19 +-
> >  drivers/gpu/drm/panfrost/panfrost_job.c    | 203 +++++++++++++++++----
> >  drivers/gpu/drm/panfrost/panfrost_job.h    |  25 ++-
> >  4 files changed, 210 insertions(+), 41 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> > index 077525a3ad68..5b164871eb95 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> > +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> > @@ -15,6 +15,7 @@
> >  #include <drm/gpu_scheduler.h>
> >
> >  #include "panfrost_devfreq.h"
> > +#include "panfrost_job.h"
> >
> >  struct panfrost_device;
> >  struct panfrost_mmu;
> > @@ -22,7 +23,6 @@ struct panfrost_job_slot;
> >  struct panfrost_job;
> >  struct panfrost_perfcnt;
> >
> > -#define NUM_JOB_SLOTS 3
> >  #define MAX_PM_DOMAINS 5
> >
> >  enum panfrost_drv_comp_bits {
> > @@ -206,7 +206,7 @@ struct panfrost_engine_usage {
> >  struct panfrost_file_priv {
> >  	struct panfrost_device *pfdev;
> >
> > -	struct drm_sched_entity sched_entity[NUM_JOB_SLOTS];
> > +	struct xarray jm_ctxs;
> >
> >  	struct panfrost_mmu *mmu;
> >
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > index 1ea6c509a5d5..398c067457d9 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> > @@ -279,6 +279,7 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
> >  	struct panfrost_file_priv *file_priv = file->driver_priv;
> >  	struct drm_panfrost_submit *args = data;
> >  	struct drm_syncobj *sync_out = NULL;
> > +	struct panfrost_jm_ctx *jm_ctx;
> >  	struct panfrost_job *job;
> >  	int ret = 0, slot;
> >
> > @@ -294,10 +295,17 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
> >  			return -ENODEV;
> >  	}
> >
> > +	/* TODO: Use the default JM context until ctx management IOCTLs are exposed */
> > +	jm_ctx = panfrost_jm_ctx_from_handle(file, 0);
> > +	if (!jm_ctx) {
> > +		ret = -EINVAL;
> > +		goto out_put_syncout;
> > +	}
> > +
> >  	job = kzalloc(sizeof(*job), GFP_KERNEL);
> >  	if (!job) {
> >  		ret = -ENOMEM;
> > -		goto out_put_syncout;
> > +		goto out_put_jm_ctx;
> >  	}
> >
> >  	kref_init(&job->refcount);
> > @@ -307,12 +315,13 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
> >  	job->requirements = args->requirements;
> >  	job->flush_id = panfrost_gpu_get_latest_flush_id(pfdev);
> >  	job->mmu = file_priv->mmu;
> > +	job->ctx = panfrost_jm_ctx_get(jm_ctx);
> >  	job->engine_usage = &file_priv->engine_usage;
> >
> >  	slot = panfrost_job_get_slot(job);
> >
> >  	ret = drm_sched_job_init(&job->base,
> > -				 &file_priv->sched_entity[slot],
> > +				 &jm_ctx->slots[slot].sched_entity,
> >  				 1, NULL, file->client_id);
> >  	if (ret)
> >  		goto out_put_job;
> > @@ -338,6 +347,8 @@ static int panfrost_ioctl_submit(struct drm_device *dev, void *data,
> >  		drm_sched_job_cleanup(&job->base);
> >  out_put_job:
> >  	panfrost_job_put(job);
> > +out_put_jm_ctx:
> > +	panfrost_jm_ctx_put(jm_ctx);
> >  out_put_syncout:
> >  	if (sync_out)
> >  		drm_syncobj_put(sync_out);
> > @@ -564,7 +575,7 @@ panfrost_open(struct drm_device *dev, struct drm_file *file)
> >  		goto err_free;
> >  	}
> >
> > -	ret = panfrost_job_open(panfrost_priv);
> > +	ret = panfrost_job_open(file);
> >  	if (ret)
> >  		goto err_job;
> >
> > @@ -583,7 +594,7 @@ panfrost_postclose(struct drm_device *dev, struct drm_file *file)
> >  	struct panfrost_file_priv *panfrost_priv = file->driver_priv;
> >
> >  	panfrost_perfcnt_close(file);
> > -	panfrost_job_close(panfrost_priv);
> > +	panfrost_job_close(file);
> >
> >  	panfrost_mmu_ctx_put(panfrost_priv->mmu);
> >  	kfree(panfrost_priv);
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> > index 82acabb21b27..b6853add307c 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/dma-resv.h>
> > +#include <drm/drm_auth.h>
> >  #include <drm/gpu_scheduler.h>
> >  #include <drm/panfrost_drm.h>
> >
> > @@ -22,6 +23,7 @@
> >  #include "panfrost_mmu.h"
> >  #include "panfrost_dump.h"
> >
> > +#define MAX_JM_CTX_PER_FILE 128
>
> 128 seems like a very large number, do we have a reason to set this so high?

Maybe I can drop it down to 64, to make sure it remains a power of two.

>
> >  #define JOB_TIMEOUT_MS 500
> >
> >  #define job_write(dev, reg, data) writel(data, dev->iomem + (reg))
> > @@ -222,7 +224,7 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
> >
> >  	/* start MMU, medium priority, cache clean/flush on end, clean/flush on
> >  	 * start */
> > -	cfg |= JS_CONFIG_THREAD_PRI(8) |
> > +	cfg |= job->ctx->config |
>
> Note that the thread priority on Midgard/Bifrost is pretty pointless. I
> don't believe kbase ever set this to anything other than 8. In theory it
> should balance priority between different slots but "How the priority
> values affect issue rates from different slots is implementation
> dependent" (which I think is wording for 'not implemented'!).
>
> My main concern is that since kbase never used it there's a possibility
> for undiscovered hardware bugs.

In that case, to avoid unexpected behaviour, I'll remove this part in the next revision.

> >  		JS_CONFIG_START_FLUSH_CLEAN_INVALIDATE |
> >  		JS_CONFIG_END_FLUSH_CLEAN_INVALIDATE |
> >  		panfrost_get_job_chain_flag(job);
> > @@ -359,6 +361,7 @@ static void panfrost_job_cleanup(struct kref *ref)
> >  		kvfree(job->bos);
> >  	}
> >
> > +	panfrost_jm_ctx_put(job->ctx);
> >  	kfree(job);
> >  }
> >
> > @@ -917,39 +920,184 @@ void panfrost_job_fini(struct panfrost_device *pfdev)
> >  	destroy_workqueue(pfdev->reset.wq);
> >  }
> >
> > -int panfrost_job_open(struct panfrost_file_priv *panfrost_priv)
> > +int panfrost_job_open(struct drm_file *file)
> > +{
> > +	struct panfrost_file_priv *panfrost_priv = file->driver_priv;
> > +	int ret;
> > +
> > +	struct drm_panfrost_jm_ctx_create default_jm_ctx = {
> > +		.priority = PANFROST_JM_CTX_PRIORITY_MEDIUM,
> > +	};
> > +
> > +	xa_init_flags(&panfrost_priv->jm_ctxs, XA_FLAGS_ALLOC);
> > +
> > +	ret = panfrost_jm_ctx_create(file, &default_jm_ctx);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* We expect the default context to be assigned handle 0. */
> > +	if (WARN_ON(default_jm_ctx.handle))
> > +		return -EINVAL;
> > +
> > +	return 0;
> > +}
> > +
> > +void panfrost_job_close(struct drm_file *file)
> > +{
> > +	struct panfrost_file_priv *panfrost_priv = file->driver_priv;
> > +	struct panfrost_jm_ctx *jm_ctx;
> > +	unsigned long i;
> > +
> > +	xa_for_each(&panfrost_priv->jm_ctxs, i, jm_ctx)
> > +		panfrost_jm_ctx_destroy(file, i);
> > +
> > +	xa_destroy(&panfrost_priv->jm_ctxs);
> > +}
> > +
> > +int panfrost_job_is_idle(struct panfrost_device *pfdev)
> >  {
> > -	struct panfrost_device *pfdev = panfrost_priv->pfdev;
> >  	struct panfrost_job_slot *js = pfdev->js;
> > -	struct drm_gpu_scheduler *sched;
> > -	int ret, i;
> > +	int i;
> >
> >  	for (i = 0; i < NUM_JOB_SLOTS; i++) {
> > -		sched = &js->queue[i].sched;
> > -		ret = drm_sched_entity_init(&panfrost_priv->sched_entity[i],
> > -					    DRM_SCHED_PRIORITY_NORMAL, &sched,
> > -					    1, NULL);
> > -		if (WARN_ON(ret))
> > -			return ret;
> > +		/* If there are any jobs in the HW queue, we're not idle */
> > +		if (atomic_read(&js->queue[i].sched.credit_count))
> > +			return false;
> >  	}
> > +
> > +	return true;
> > +}
> > +
> > +static void panfrost_jm_ctx_release(struct kref *kref)
> > +{
> > +	struct panfrost_jm_ctx *jm_ctx = container_of(kref, struct panfrost_jm_ctx, refcnt);
> > +
> > +	kfree(jm_ctx);
> > +}
> > +
> > +void
> > +panfrost_jm_ctx_put(struct panfrost_jm_ctx *jm_ctx)
> > +{
> > +	if (jm_ctx)
> > +		kref_put(&jm_ctx->refcnt, panfrost_jm_ctx_release);
> > +}
> > +
> > +struct panfrost_jm_ctx *
> > +panfrost_jm_ctx_get(struct panfrost_jm_ctx *jm_ctx)
> > +{
> > +	if (jm_ctx)
> > +		kref_get(&jm_ctx->refcnt);
> > +
> > +	return jm_ctx;
> > +}
> > +
> > +struct panfrost_jm_ctx *
> > +panfrost_jm_ctx_from_handle(struct drm_file *file, u32 handle)
> > +{
> > +	struct panfrost_file_priv *priv = file->driver_priv;
> > +	struct panfrost_jm_ctx *jm_ctx;
> > +
> > +	xa_lock(&priv->jm_ctxs);
> > +	jm_ctx = panfrost_jm_ctx_get(xa_load(&priv->jm_ctxs, handle));
> > +	xa_unlock(&priv->jm_ctxs);
> > +
> > +	return jm_ctx;
> > +}
> > +
> > +static int jm_ctx_prio_to_drm_sched_prio(struct drm_file *file,
> > +					 enum drm_panfrost_jm_ctx_priority in,
> > +					 enum drm_sched_priority *out)
> > +{
> > +	switch (in) {
> > +	case PANFROST_JM_CTX_PRIORITY_LOW:
> > +		*out = DRM_SCHED_PRIORITY_LOW;
> > +		return 0;
> > +	case PANFROST_JM_CTX_PRIORITY_MEDIUM:
> > +		*out = DRM_SCHED_PRIORITY_NORMAL;
> > +		return 0;
> > +	case PANFROST_JM_CTX_PRIORITY_HIGH:
> > +		/* Higher priorities require CAP_SYS_NICE or DRM_MASTER */
> > +		if (!capable(CAP_SYS_NICE) && !drm_is_current_master(file))
> > +			return -EACCES;
> > +
> > +		*out = DRM_SCHED_PRIORITY_HIGH;
> > +		return 0;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> > +int panfrost_jm_ctx_create(struct drm_file *file,
> > +			   struct drm_panfrost_jm_ctx_create *args)
> > +{
> > +	struct panfrost_file_priv *priv = file->driver_priv;
> > +	struct panfrost_device *pfdev = priv->pfdev;
> > +	enum drm_sched_priority sched_prio;
> > +	struct panfrost_jm_ctx *jm_ctx;
> > +
> > +	int ret;
> > +
> > +	jm_ctx = kzalloc(sizeof(*jm_ctx), GFP_KERNEL);
> > +	if (!jm_ctx)
> > +		return -ENOMEM;
> > +
> > +	kref_init(&jm_ctx->refcnt);
> > +
> > +	/* Same priority for all JS within a single context */
> > +	jm_ctx->config = JS_CONFIG_THREAD_PRI(args->priority);
> > +
> > +	ret = jm_ctx_prio_to_drm_sched_prio(file, args->priority, &sched_prio);
> > +	if (ret)
> > +		goto err_put_jm_ctx;
> > +
> > +	for (u32 i = 0; i < NUM_JOB_SLOTS - 1; i++) {
> > +		struct drm_gpu_scheduler *sched = &pfdev->js->queue[i].sched;
> > +		struct panfrost_js_ctx *js_ctx = &jm_ctx->slots[i];
> > +
> > +		ret = drm_sched_entity_init(&js_ctx->sched_entity, sched_prio,
> > +					    &sched, 1, NULL);
> > +		if (ret)
> > +			goto err_put_jm_ctx;
> > +
> > +		js_ctx->enabled = true;
> > +	}
> > +
> > +	ret = xa_alloc(&priv->jm_ctxs, &args->handle, jm_ctx,
> > +		       XA_LIMIT(0, MAX_JM_CTX_PER_FILE), GFP_KERNEL);
> > +	if (ret)
> > +		goto err_put_jm_ctx;
>
> On error here we just jump down and call panfrost_jm_ctx_put() which
> will free jm_ctx but won't destroy any of the drm_sched_entities. There
> seems to be something a bit off with the lifetime management here.
>
> Should panfrost_jm_ctx_release() be responsible for tearing down the
> context, and panfrost_jm_ctx_destroy() be nothing more than dropping the
> reference?
>
> Steve
>
> > +
> >  	return 0;
> > +
> > +err_put_jm_ctx:
> > +	panfrost_jm_ctx_put(jm_ctx);
> > +	return ret;
> >  }
> >
> > -void panfrost_job_close(struct panfrost_file_priv *panfrost_priv)
> > +int panfrost_jm_ctx_destroy(struct drm_file *file, u32 handle)
> >  {
> > -	struct panfrost_device *pfdev = panfrost_priv->pfdev;
> > -	int i;
> > +	struct panfrost_file_priv *priv = file->driver_priv;
> > +	struct panfrost_device *pfdev = priv->pfdev;
> > +	struct panfrost_jm_ctx *jm_ctx;
> >
> > -	for (i = 0; i < NUM_JOB_SLOTS; i++)
> > -		drm_sched_entity_destroy(&panfrost_priv->sched_entity[i]);
> > +	jm_ctx = xa_erase(&priv->jm_ctxs, handle);
> > +	if (!jm_ctx)
> > +		return -EINVAL;
> > +
> > +	for (u32 i = 0; i < ARRAY_SIZE(jm_ctx->slots); i++) {
> > +		if (jm_ctx->slots[i].enabled)
> > +			drm_sched_entity_destroy(&jm_ctx->slots[i].sched_entity);
> > +	}
> >
> >  	/* Kill in-flight jobs */
> >  	spin_lock(&pfdev->js->job_lock);
> > -	for (i = 0; i < NUM_JOB_SLOTS; i++) {
> > -		struct drm_sched_entity *entity = &panfrost_priv->sched_entity[i];
> > -		int j;
> > +	for (u32 i = 0; i < ARRAY_SIZE(jm_ctx->slots); i++) {
> > +		struct drm_sched_entity *entity = &jm_ctx->slots[i].sched_entity;
> > +
> > +		if (!jm_ctx->slots[i].enabled)
> > +			continue;
> >
> > -		for (j = ARRAY_SIZE(pfdev->jobs[0]) - 1; j >= 0; j--) {
> > +		for (int j = ARRAY_SIZE(pfdev->jobs[0]) - 1; j >= 0; j--) {
> >  			struct panfrost_job *job = pfdev->jobs[i][j];
> >  			u32 cmd;
> >
> > @@ -980,18 +1128,7 @@ void panfrost_job_close(struct panfrost_file_priv *panfrost_priv)
> >  		}
> >  	}
> >  	spin_unlock(&pfdev->js->job_lock);
> > -}
> >
> > -int panfrost_job_is_idle(struct panfrost_device *pfdev)
> > -{
> > -	struct panfrost_job_slot *js = pfdev->js;
> > -	int i;
> > -
> > -	for (i = 0; i < NUM_JOB_SLOTS; i++) {
> > -		/* If there are any jobs in the HW queue, we're not idle */
> > -		if (atomic_read(&js->queue[i].sched.credit_count))
> > -			return false;
> > -	}
> > -
> > -	return true;
> > +	panfrost_jm_ctx_put(jm_ctx);
> > +	return 0;
> >  }
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/panfrost/panfrost_job.h
> > index ec581b97852b..f3e5010e6cf5 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.h
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.h
> > @@ -18,6 +18,7 @@ struct panfrost_job {
> >
> >  	struct panfrost_device *pfdev;
> >  	struct panfrost_mmu *mmu;
> > +	struct panfrost_jm_ctx *ctx;
> >
> >  	/* Fence to be signaled by IRQ handler when the job is complete. */
> >  	struct dma_fence *done_fence;
> > @@ -39,10 +40,30 @@ struct panfrost_job {
> >  	u64 start_cycles;
> >  };
> >
> > +struct panfrost_js_ctx {
> > +	struct drm_sched_entity sched_entity;
> > +	bool enabled;
> > +};
> > +
> > +#define NUM_JOB_SLOTS 3
> > +
> > +struct panfrost_jm_ctx {
> > +	struct kref refcnt;
> > +	u32 config;
> > +	struct panfrost_js_ctx slots[NUM_JOB_SLOTS];
> > +};
> > +
> > +int panfrost_jm_ctx_create(struct drm_file *file,
> > +			   struct drm_panfrost_jm_ctx_create *args);
> > +int panfrost_jm_ctx_destroy(struct drm_file *file, u32 handle);
> > +void panfrost_jm_ctx_put(struct panfrost_jm_ctx *jm_ctx);
> > +struct panfrost_jm_ctx *panfrost_jm_ctx_get(struct panfrost_jm_ctx *jm_ctx);
> > +struct panfrost_jm_ctx *panfrost_jm_ctx_from_handle(struct drm_file *file, u32 handle);
> > +
> >  int panfrost_job_init(struct panfrost_device *pfdev);
> >  void panfrost_job_fini(struct panfrost_device *pfdev);
> > -int panfrost_job_open(struct panfrost_file_priv *panfrost_priv);
> > -void panfrost_job_close(struct panfrost_file_priv *panfrost_priv);
> > +int panfrost_job_open(struct drm_file *file);
> > +void panfrost_job_close(struct drm_file *file);
> >  int panfrost_job_get_slot(struct panfrost_job *job);
> >  int panfrost_job_push(struct panfrost_job *job);
> >  void panfrost_job_put(struct panfrost_job *job);


Adrian Larumbe
