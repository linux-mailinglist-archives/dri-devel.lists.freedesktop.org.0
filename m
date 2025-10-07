Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F08ABBFDA0
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 02:34:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37CAC10E169;
	Tue,  7 Oct 2025 00:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="AVqMWw8K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5282510E169
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 00:34:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759797266; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RlwrFiZvdan50H4kqXG4lG0Z+8rNongazAuAynNOTXCi/uMSqfENHoIOnarV//9ioMhh0ZOF01xTUogA1YBetW93E3owQ+v0mthBT36K9a6fkrDj16WIrvv4FADWE9RluJQVWZyDh/mri/RSTL2nLBTxLg5WhdAj/EPJ2XDVnyg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759797266;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=+ZMAf+X470UbdXWWHN9Qz4YlFy0BR17oOQDi8pq/BL8=; 
 b=FkUHRft9YxOn6Yb78x4Y3vnuSulVvhQA4gL+Wi2fqjF77W+sneB6e9LqPU4QBMwvZzCg7tU2uzuSeZ4aFY31c8fesweBhbq6eetYOEJ8EuJLikUKECWF1WfChQgmCX6Vd7ULkcjKRwUPvSNW8EFGA5VbhxR56e8ePilN2/M/qr0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759797266; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=+ZMAf+X470UbdXWWHN9Qz4YlFy0BR17oOQDi8pq/BL8=;
 b=AVqMWw8KOSTjY6LWGoEvcARkXsY0PyytCoQqPTvxRB6Dk/bsb6jLVyJFh4gWOlW9
 laJnn2PnFFvlzlzmKAtudbiQXyIDM3/7jqc4cmU5Ne0Dd/lA1Ot2B15EagArKiaeKzo
 XDVXFFihWCb2vfETDHQwFabZKu83nBzLMOkatD4s=
Received: by mx.zohomail.com with SMTPS id 175979726147753.982398285844056;
 Mon, 6 Oct 2025 17:34:21 -0700 (PDT)
Date: Tue, 7 Oct 2025 01:34:16 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v4 03/10] drm/panfrost: Handle job HW submit errors
Message-ID: <3mtnplufdgdfjsj23s5f3ftbwwzj5t3rbjzrqmg4ahqkojxyxd@at275hsnrqip>
References: <20251001022039.1215976-1-adrian.larumbe@collabora.com>
 <20251001022039.1215976-4-adrian.larumbe@collabora.com>
 <f20a1595-d5a8-4f3c-8b08-f7c743ca37e9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f20a1595-d5a8-4f3c-8b08-f7c743ca37e9@arm.com>
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

On 06.10.2025 17:07, Steven Price wrote:
> On 01/10/2025 03:20, Adrián Larumbe wrote:
> > Avoid waiting for the DRM scheduler job timedout handler, and instead, let
> > the DRM scheduler core signal the error fence immediately when HW job
> > submission fails.
> >
> > That means we must also decrement the runtime-PM refcnt for the device,
> > because the job will never be enqueued or inflight.
> >
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_job.c | 20 ++++++++++++++++----
> >  1 file changed, 16 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> > index a0123d0a1b7d..3f60adc9b69d 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -196,7 +196,7 @@ panfrost_enqueue_job(struct panfrost_device *pfdev, int slot,
> >  	return 1;
> >  }
> >
> > -static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
> > +static int panfrost_job_hw_submit(struct panfrost_job *job, int js)
> >  {
> >  	struct panfrost_device *pfdev = job->pfdev;
> >  	unsigned int subslot;
> > @@ -208,10 +208,11 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
> >
> >  	ret = pm_runtime_get_sync(pfdev->base.dev);
> >  	if (ret < 0)
> > -		return;
> > +		goto err_hwsubmit;
> >
> >  	if (WARN_ON(job_read(pfdev, JS_COMMAND_NEXT(js)))) {
> > -		return;
> > +		ret = -EINVAL;
> > +		goto err_hwsubmit;
> >  	}
> >
> >  	cfg = panfrost_mmu_as_get(pfdev, job->mmu);
> > @@ -262,6 +263,12 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
> >  			job, js, subslot, jc_head, cfg & 0xf);
> >  	}
> >  	spin_unlock(&pfdev->js->job_lock);
> > +
> > +	return 0;
> > +
> > +err_hwsubmit:
> > +	pm_runtime_put_autosuspend(pfdev->base.dev);
>
> I think you're missing something here. You've put a call to
> pm_runtime_put_autosuspend() here which matches the call to
> pm_runtime_get_sync() that we do earlier in the function. But there's no
> corresponding panfrost_devfreq_record_idle() (but the first thing this
> function does is panfrost_devfreq_record_busy()).
>
> So unless I'm missing something (very possible) then this is going to
> mess up the devfreq accounting. A simple fix would be just to move the
> panfrost_devfreq_record_busy() call down in the function.

You didn't miss anything, I completely forgot to keep the devfreq busy
count balanced after this change.

I've moved panfrost_devfreq_record_busy() right after the point the function
can no longer result in an error, as you suggested.

> Thanks,
> Steve
>
> > +	return ret;
> >  }
> >
> >  static int panfrost_acquire_object_fences(struct drm_gem_object **bos,
> > @@ -384,6 +391,7 @@ static struct dma_fence *panfrost_job_run(struct drm_sched_job *sched_job)
> >  	struct panfrost_device *pfdev = job->pfdev;
> >  	int slot = panfrost_job_get_slot(job);
> >  	struct dma_fence *fence = NULL;
> > +	int ret;
> >
> >  	if (job->ctx->destroyed)
> >  		return ERR_PTR(-ECANCELED);
> > @@ -405,7 +413,11 @@ static struct dma_fence *panfrost_job_run(struct drm_sched_job *sched_job)
> >  		dma_fence_put(job->done_fence);
> >  	job->done_fence = dma_fence_get(fence);
> >
> > -	panfrost_job_hw_submit(job, slot);
> > +	ret = panfrost_job_hw_submit(job, slot);
> > +	if (ret) {
> > +		dma_fence_put(fence);
> > +		return ERR_PTR(ret);
> > +	}
> >
> >  	return fence;
> >  }

Adrian Larumbe
