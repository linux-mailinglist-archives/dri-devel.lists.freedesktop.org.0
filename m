Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E00C038C32F
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 11:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6885F6F4B9;
	Fri, 21 May 2021 09:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2166F4B9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 09:32:51 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1lk1WU-0006jm-3a; Fri, 21 May 2021 11:32:50 +0200
Message-ID: <066b1c490a1251113fbcf7f2270654be25be4f29.camel@pengutronix.de>
Subject: Re: [PATCH 02/11] drm/panfrost: Remove sched_lock
From: Lucas Stach <l.stach@pengutronix.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Date: Fri, 21 May 2021 11:32:48 +0200
In-Reply-To: <20210521090959.1663703-2-daniel.vetter@ffwll.ch>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-2-daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Steven Price <steven.price@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, dem 21.05.2021 um 11:09 +0200 schrieb Daniel Vetter:
> Scheduler takes care of its own locking, dont worry. For everything else
> there's reservation locking on each bo.
> 
> So seems to be entirely redundnant and just a bit in the way.

I haven't read all the surrounding code, but this looks wrong from a
glance. You must hold a lock across drm_sched_job_init ->
drm_sched_entity_push_job as the scheduler fences are initialized in
the job init, so if there's no exclusive section across those two
function calls you might end up with jobs being queued with their fence
seqnos not monotonically increasing, which breaks all kinds of other
stuff.

I don't see a reason to hold the lock across the reservation calls,
though.

Regards,
Lucas

> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c |  1 -
>  drivers/gpu/drm/panfrost/panfrost_device.h |  2 --
>  drivers/gpu/drm/panfrost/panfrost_job.c    | 13 ++-----------
>  3 files changed, 2 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
> index 125ed973feaa..23070c01c63f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -199,7 +199,6 @@ int panfrost_device_init(struct panfrost_device *pfdev)
>  	int err;
>  	struct resource *res;
>  
> -	mutex_init(&pfdev->sched_lock);
>  	INIT_LIST_HEAD(&pfdev->scheduled_jobs);
>  	INIT_LIST_HEAD(&pfdev->as_lru_list);
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index 597cf1459b0a..7519903bb031 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -105,8 +105,6 @@ struct panfrost_device {
>  
>  	struct panfrost_perfcnt *perfcnt;
>  
> -	struct mutex sched_lock;
> -
>  	struct {
>  		struct work_struct work;
>  		atomic_t pending;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index 6003cfeb1322..f5d39ee14ab5 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -218,26 +218,19 @@ static void panfrost_attach_object_fences(struct drm_gem_object **bos,
>  
>  int panfrost_job_push(struct panfrost_job *job)
>  {
> -	struct panfrost_device *pfdev = job->pfdev;
>  	int slot = panfrost_job_get_slot(job);
>  	struct drm_sched_entity *entity = &job->file_priv->sched_entity[slot];
>  	struct ww_acquire_ctx acquire_ctx;
>  	int ret = 0;
>  
> -	mutex_lock(&pfdev->sched_lock);
> -
>  	ret = drm_gem_lock_reservations(job->bos, job->bo_count,
>  					    &acquire_ctx);
> -	if (ret) {
> -		mutex_unlock(&pfdev->sched_lock);
> +	if (ret)
>  		return ret;
> -	}
>  
>  	ret = drm_sched_job_init(&job->base, entity, NULL);
> -	if (ret) {
> -		mutex_unlock(&pfdev->sched_lock);
> +	if (ret)
>  		goto unlock;
> -	}
>  
>  	job->render_done_fence = dma_fence_get(&job->base.s_fence->finished);
>  
> @@ -248,8 +241,6 @@ int panfrost_job_push(struct panfrost_job *job)
>  
>  	drm_sched_entity_push_job(&job->base, entity);
>  
> -	mutex_unlock(&pfdev->sched_lock);
> -
>  	panfrost_attach_object_fences(job->bos, job->bo_count,
>  				      job->render_done_fence);
>  


