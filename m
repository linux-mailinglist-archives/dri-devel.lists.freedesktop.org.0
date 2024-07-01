Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3539691D872
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 09:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A3510E325;
	Mon,  1 Jul 2024 06:59:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="T98SwK2Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE06110E2DA
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 06:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1719817195;
 bh=Yg07CdhDPSHyS29n+dlUWjZE4pr3zHwDxA+sEOsOpf8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=T98SwK2ZURdzDzIs0HePq5vSltqsCDiq7ki3knx23Md4CuQDvv+EHxOq22QzGopaE
 yEw29x4WDejAdhbWt5A8TMqrZpIIkrIfHvHFIxfbNC24F0nfOqUegroQYO30Q4RzZ9
 Duz2daP6ICmDu7N+u9gU3E3WRr8yiP3/5ZJ76byGX70pHlR9xNkdtjIjq53rzfAWt6
 I1v0I3rA0pKDW0ZM0VFNhM4/dQ3/O/8TBeyPLWWqotRC1ffiNY2EBznyF17x+vlI1p
 zVcOExJbCOiYzIWh/MGheVhYj0H1ppev1DkGFtlkSTUk3+qCWsBoDdxmpw+0HITlOm
 E2qUSyCwhgnnQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 332F537809D0;
 Mon,  1 Jul 2024 06:59:55 +0000 (UTC)
Date: Mon, 1 Jul 2024 08:59:53 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Steven Price <steven.price@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH 2/2] drm/panthor: Fix sync-only jobs
Message-ID: <20240701085953.32f17425@collabora.com>
In-Reply-To: <Zn_5uyOcGc8bz-D0@e110455-lin.cambridge.arm.com>
References: <20240628145536.778349-1-boris.brezillon@collabora.com>
 <20240628145536.778349-3-boris.brezillon@collabora.com>
 <Zn8sgSQUoQgdxHZ7@e110455-lin.cambridge.arm.com>
 <20240629105256.55b9c4c4@collabora.com>
 <Zn_5uyOcGc8bz-D0@e110455-lin.cambridge.arm.com>
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

On Sat, 29 Jun 2024 13:10:35 +0100
Liviu Dudau <liviu.dudau@arm.com> wrote:

> On Sat, Jun 29, 2024 at 10:52:56AM +0200, Boris Brezillon wrote:
> > On Fri, 28 Jun 2024 22:34:57 +0100
> > Liviu Dudau <liviu.dudau@arm.com> wrote:
> >   
> > > On Fri, Jun 28, 2024 at 04:55:36PM +0200, Boris Brezillon wrote:  
> > > > A sync-only job is meant to provide a synchronization point on a
> > > > queue, so we can't return a NULL fence there, we have to add a signal
> > > > operation to the command stream which executes after all other
> > > > previously submitted jobs are done.
> > > > 
> > > > Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> > > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>    
> > > 
> > > Took me a bit longer to read, lets blame Friday.
> > >   
> > > > ---
> > > >  drivers/gpu/drm/panthor/panthor_sched.c | 41 ++++++++++++++++++++-----
> > > >  include/uapi/drm/panthor_drm.h          |  5 +++
> > > >  2 files changed, 38 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> > > > index 79ffcbc41d78..951ff7e63ea8 100644
> > > > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > > > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > > > @@ -458,6 +458,16 @@ struct panthor_queue {
> > > >  		/** @seqno: Sequence number of the last initialized fence. */
> > > >  		atomic64_t seqno;
> > > >  
> > > > +		/**
> > > > +		 * @last_fence: Fence of the last submitted job.
> > > > +		 *
> > > > +		 * We return this fence when we get an empty command stream.
> > > > +		 * This way, we are guaranteed that all earlier jobs have completed
> > > > +		 * when drm_sched_job::s_fence::finished without having to feed
> > > > +		 * the CS ring buffer with a dummy job that only signals the fence.
> > > > +		 */
> > > > +		struct dma_fence *last_fence;
> > > > +
> > > >  		/**
> > > >  		 * @in_flight_jobs: List containing all in-flight jobs.
> > > >  		 *
> > > > @@ -829,6 +839,9 @@ static void group_free_queue(struct panthor_group *group, struct panthor_queue *
> > > >  	panthor_kernel_bo_destroy(queue->ringbuf);
> > > >  	panthor_kernel_bo_destroy(queue->iface.mem);
> > > >  
> > > > +	/* Release the last_fence we were holding, if any. */
> > > > +	dma_fence_put(queue->fence_ctx.last_fence);
> > > > +
> > > >  	kfree(queue);
> > > >  }
> > > >  
> > > > @@ -2865,11 +2878,14 @@ queue_run_job(struct drm_sched_job *sched_job)
> > > >  	static_assert(sizeof(call_instrs) % 64 == 0,
> > > >  		      "call_instrs is not aligned on a cacheline");
> > > >  
> > > > -	/* Stream size is zero, nothing to do => return a NULL fence and let
> > > > -	 * drm_sched signal the parent.
> > > > +	/* Stream size is zero, nothing to do except making sure all previously
> > > > +	 * submitted jobs are done before we signal the
> > > > +	 * drm_sched_job::s_fence::finished fence.
> > > >  	 */
> > > > -	if (!job->call_info.size)
> > > > -		return NULL;
> > > > +	if (!job->call_info.size) {
> > > > +		job->done_fence = dma_fence_get(queue->fence_ctx.last_fence);
> > > > +		return job->done_fence;    
> > > 
> > > What happens if the last job's done_fence was cancelled or timed out? Is the
> > > sync job's done_fence going to be signalled with the same error?  
> > 
> > It's the same object, so yes, the job will also be considered faulty
> > (the error propagated to the job::s_fence::finished fence). I guess
> > synchronization jobs are not supposed to fail/timeout in theory, because
> > they don't do anything, but I don't think that's an issue in
> > practice, because dma_fence errors are never propagated to user-space
> > (only the queue status is).
> >   
> > > 
> > > Now that we're returning a fence here, should the job be also added into the
> > > in_flight_jobs?  
> > 
> > Yeah, that's done on purpose, such that we don't end up signalling the
> > same dma_fence object twice (which is forbidden).  
> 
> That's the thing I was trying to figure out on Friday: how do we stop the fence
> returned as last_fence for the sync job to be signalled after the job's done_fence
> has also been signalled. I can't say that I found a good answer, if you can point
> me to what I've missed it will be appreciated.

Well, there's only just one job that's added to the in_flight for a
given done_fence object, so there's no risk of signaling such a fence
more than once (even in case of a timeout). Now, let's say the
previous 'real' job is done when this 'dummy/sync' job queued, the
queue::fence_ctx::last_fence object will be signalled too, since this
is essentially the same object, and when we return a signalled fence to
the drm_sched layer in our ::run_job() callback, it just signals the
finished drm_sched_job::s_fence::finished immediately, just like when
you return a NULL fence.
