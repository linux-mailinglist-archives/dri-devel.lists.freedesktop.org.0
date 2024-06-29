Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B8E91CD4B
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2024 15:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF8510E1F1;
	Sat, 29 Jun 2024 13:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Lfr2wv8P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC1010E1EA
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2024 13:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1719651178;
 bh=lgC1EcQObyzTkJyziNgpAopHLxFAZvwm4iMggzZeS5k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Lfr2wv8PtG7+Jm2quhkk2v2EbHnOmnhgis0Nj+2zR0XI1RlUgyBHIxUsOOvUMoLIC
 sycfY3Pl11kF8K8XesnvpjUWdClvwvyZgh8Z5l5InvWv2mhfT11r1hZ1Q897Wv1+BE
 88Vt6x8qNENVswOXZM9/SelV5OdPyXpAXVtaG3cVvTI+vVPbQExxQCKi053VzSxmKu
 UR0vZTvJuo4cd9Z5KrrUcENKuHhe/JyzPz2hPkAEsaGwapCwDD0Z8Z/y7pE8zEQsZe
 E/52bOtRYw9iYg1rJ11s4bHQDr6Ye/Ro2mUsef9m9UCpt9XvMfKzJXeMPNGPWWxzpg
 7qdUYAiseO/HA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1BF743780627;
 Sat, 29 Jun 2024 08:52:58 +0000 (UTC)
Date: Sat, 29 Jun 2024 10:52:56 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Steven Price <steven.price@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH 2/2] drm/panthor: Fix sync-only jobs
Message-ID: <20240629105256.55b9c4c4@collabora.com>
In-Reply-To: <Zn8sgSQUoQgdxHZ7@e110455-lin.cambridge.arm.com>
References: <20240628145536.778349-1-boris.brezillon@collabora.com>
 <20240628145536.778349-3-boris.brezillon@collabora.com>
 <Zn8sgSQUoQgdxHZ7@e110455-lin.cambridge.arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
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

On Fri, 28 Jun 2024 22:34:57 +0100
Liviu Dudau <liviu.dudau@arm.com> wrote:

> On Fri, Jun 28, 2024 at 04:55:36PM +0200, Boris Brezillon wrote:
> > A sync-only job is meant to provide a synchronization point on a
> > queue, so we can't return a NULL fence there, we have to add a signal
> > operation to the command stream which executes after all other
> > previously submitted jobs are done.
> > 
> > Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>  
> 
> Took me a bit longer to read, lets blame Friday.
> 
> > ---
> >  drivers/gpu/drm/panthor/panthor_sched.c | 41 ++++++++++++++++++++-----
> >  include/uapi/drm/panthor_drm.h          |  5 +++
> >  2 files changed, 38 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> > index 79ffcbc41d78..951ff7e63ea8 100644
> > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > @@ -458,6 +458,16 @@ struct panthor_queue {
> >  		/** @seqno: Sequence number of the last initialized fence. */
> >  		atomic64_t seqno;
> >  
> > +		/**
> > +		 * @last_fence: Fence of the last submitted job.
> > +		 *
> > +		 * We return this fence when we get an empty command stream.
> > +		 * This way, we are guaranteed that all earlier jobs have completed
> > +		 * when drm_sched_job::s_fence::finished without having to feed
> > +		 * the CS ring buffer with a dummy job that only signals the fence.
> > +		 */
> > +		struct dma_fence *last_fence;
> > +
> >  		/**
> >  		 * @in_flight_jobs: List containing all in-flight jobs.
> >  		 *
> > @@ -829,6 +839,9 @@ static void group_free_queue(struct panthor_group *group, struct panthor_queue *
> >  	panthor_kernel_bo_destroy(queue->ringbuf);
> >  	panthor_kernel_bo_destroy(queue->iface.mem);
> >  
> > +	/* Release the last_fence we were holding, if any. */
> > +	dma_fence_put(queue->fence_ctx.last_fence);
> > +
> >  	kfree(queue);
> >  }
> >  
> > @@ -2865,11 +2878,14 @@ queue_run_job(struct drm_sched_job *sched_job)
> >  	static_assert(sizeof(call_instrs) % 64 == 0,
> >  		      "call_instrs is not aligned on a cacheline");
> >  
> > -	/* Stream size is zero, nothing to do => return a NULL fence and let
> > -	 * drm_sched signal the parent.
> > +	/* Stream size is zero, nothing to do except making sure all previously
> > +	 * submitted jobs are done before we signal the
> > +	 * drm_sched_job::s_fence::finished fence.
> >  	 */
> > -	if (!job->call_info.size)
> > -		return NULL;
> > +	if (!job->call_info.size) {
> > +		job->done_fence = dma_fence_get(queue->fence_ctx.last_fence);
> > +		return job->done_fence;  
> 
> What happens if the last job's done_fence was cancelled or timed out? Is the
> sync job's done_fence going to be signalled with the same error?

It's the same object, so yes, the job will also be considered faulty
(the error propagated to the job::s_fence::finished fence). I guess
synchronization jobs are not supposed to fail/timeout in theory, because
they don't do anything, but I don't think that's an issue in
practice, because dma_fence errors are never propagated to user-space
(only the queue status is).

> 
> Now that we're returning a fence here, should the job be also added into the
> in_flight_jobs?

Yeah, that's done on purpose, such that we don't end up signalling the
same dma_fence object twice (which is forbidden). This makes me realize
I should probably drop the 'is_cs_empty()' check in
group_sync_upd_work(), since we're not supposed to have a job with an
empty CS in the in_flight_jobs list.

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 951ff7e63ea8..8bf01b7b1596 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2797,9 +2797,6 @@ static void group_sync_upd_work(struct work_struct *work)
 
                spin_lock(&queue->fence_ctx.lock);
                list_for_each_entry_safe(job, job_tmp, &queue->fence_ctx.in_flight_jobs, node) {
-                       if (!job->call_info.size)
-                               continue;
-
                        if (syncobj->seqno < job->done_fence->seqno)
                                break;


> 
> If you're happy with depending on the previous job's done_fence and not
> track the sync job in in_flight_jobs, then you can have my
> 
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> 
> Best regards,
> Liviu
> 
> > +	}
> >  
> >  	ret = pm_runtime_resume_and_get(ptdev->base.dev);
> >  	if (drm_WARN_ON(&ptdev->base, ret))
> > @@ -2928,6 +2944,10 @@ queue_run_job(struct drm_sched_job *sched_job)
> >  		}
> >  	}
> >  
> > +	/* Update the last fence. */
> > +	dma_fence_put(queue->fence_ctx.last_fence);
> > +	queue->fence_ctx.last_fence = dma_fence_get(job->done_fence);
> > +
> >  	done_fence = dma_fence_get(job->done_fence);
> >  
> >  out_unlock:
> > @@ -3378,10 +3398,15 @@ panthor_job_create(struct panthor_file *pfile,
> >  		goto err_put_job;
> >  	}
> >  
> > -	job->done_fence = kzalloc(sizeof(*job->done_fence), GFP_KERNEL);
> > -	if (!job->done_fence) {
> > -		ret = -ENOMEM;
> > -		goto err_put_job;
> > +	/* Empty command streams don't need a fence, they'll pick the one from
> > +	 * the previously submitted job.
> > +	 */
> > +	if (job->call_info.size) {
> > +		job->done_fence = kzalloc(sizeof(*job->done_fence), GFP_KERNEL);
> > +		if (!job->done_fence) {
> > +			ret = -ENOMEM;
> > +			goto err_put_job;
> > +		}
> >  	}
> >  
> >  	ret = drm_sched_job_init(&job->base,
> > diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> > index aaed8e12ad0b..926b1deb1116 100644
> > --- a/include/uapi/drm/panthor_drm.h
> > +++ b/include/uapi/drm/panthor_drm.h
> > @@ -802,6 +802,9 @@ struct drm_panthor_queue_submit {
> >  	 * Must be 64-bit/8-byte aligned (the size of a CS instruction)
> >  	 *
> >  	 * Can be zero if stream_addr is zero too.
> > +	 *
> > +	 * When the stream size is zero, the queue submit serves as a
> > +	 * synchronization point.
> >  	 */
> >  	__u32 stream_size;
> >  
> > @@ -822,6 +825,8 @@ struct drm_panthor_queue_submit {
> >  	 * ensure the GPU doesn't get garbage when reading the indirect command
> >  	 * stream buffers. If you want the cache flush to happen
> >  	 * unconditionally, pass a zero here.
> > +	 *
> > +	 * Ignored when stream_size is zero.
> >  	 */
> >  	__u32 latest_flush;
> >  
> > -- 
> > 2.45.0
> >   
> 

