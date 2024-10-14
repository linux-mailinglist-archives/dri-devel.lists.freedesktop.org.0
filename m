Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CF299CF01
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 16:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D93610E190;
	Mon, 14 Oct 2024 14:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KytJsdmZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C78C710E190
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 14:49:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8F2CC5C5515;
 Mon, 14 Oct 2024 14:49:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A93C4CEC3;
 Mon, 14 Oct 2024 14:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728917394;
 bh=yVItqLy2gUaogwMt0QYjMMUFkEsvo9jfLZALFwuBNuA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KytJsdmZggwJCl6+Sh+my+E8xpPt4K8FMyrNVCadRX9J0qI3JKKoqMqjwg6pnCDNw
 hhVKz5t35tp43HJmFS6YhuM9uSNHDiw981aBmshGBj4Y/b1EsCe3B7jxIeoVUntRvN
 Pm+LliRCYQO0LzlPbyuj9PiMMGE8VvFBLIVtAW1HUlWHfGa9XrWpvhxvxcyPPDZzHd
 BImLHCM5LR83bZsFtmDlPzA58qXGI/Ch89rQeFlT2dfDhlv5kWVPnp1su7a93W7XSL
 5Yj1T0c8tAIqP0xf9IytEs939PhOk5nmI7o0L7xLQOor2SjlHQviBb/c1epEl7Vt7o
 WfWp7ZWEagBHQ==
Date: Mon, 14 Oct 2024 16:49:50 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Philipp Stanner <pstanner@redhat.com>,
 dri-devel@lists.freedesktop.org, ltuikov89@gmail.com
Subject: Re: [PATCH 1/2] drm/sched: add WARN_ON and BUG_ON to drm_sched_fini
Message-ID: <Zw0vjq1XLxNd7Cxw@pollux>
References: <20240918133956.26557-1-christian.koenig@amd.com>
 <8a0e7e0b0d2ef05954240434759ca79f25328b73.camel@redhat.com>
 <e2231195-8fed-4b25-8852-589794665e70@gmail.com>
 <2f0b15d47576f25b65927de6c039a6d9839dbb81.camel@redhat.com>
 <cef7c754-df50-409b-a7ee-4c184afafa5c@gmail.com>
 <ZvKgAbiydG8Y9Z3F@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZvKgAbiydG8Y9Z3F@phenom.ffwll.local>
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

On Tue, Sep 24, 2024 at 01:18:25PM +0200, Simona Vetter wrote:
> On Mon, Sep 23, 2024 at 05:24:10PM +0200, Christian König wrote:
> > Am 20.09.24 um 15:26 schrieb Philipp Stanner:
> > > On Fri, 2024-09-20 at 12:33 +0200, Christian König wrote:
> > > > Am 20.09.24 um 10:57 schrieb Philipp Stanner:
> > > > > On Wed, 2024-09-18 at 15:39 +0200, Christian König wrote:
> > > > > > Tearing down the scheduler with jobs still on the pending list
> > > > > > can
> > > > > > lead to use after free issues. Add a warning if drivers try to
> > > > > > destroy a scheduler which still has work pushed to the HW.
> > > > > Did you have time yet to look into my proposed waitque-solution?
> > > > I don't remember seeing anything. What have I missed?
> > > https://lore.kernel.org/all/20240903094446.29797-2-pstanner@redhat.com/
> > 
> > Mhm, I didn't got that in my inbox for some reason.
> > 
> > Interesting approach, I'm just not sure if we can or should wait in
> > drm_sched_fini().
> > 
> > Probably better to make that a separate function, something like
> > drm_sched_flush() or similar.
> 
> Yeah I don't think we should smash this into drm_sched_fini
> unconditionally. I think conceptually there's about three cases:
> 
> - Ringbuffer schedules. Probably want everything as-is, because
>   drm_sched_fini is called long after all the entities are gone in
>   drm_device cleanup.

Even if entities are long gone we can still have jobs on the pending list of the
scheduler. Calling drm_sched_fini() would still leak those jobs.

It's just that for this case it's unlikely, but I don't think we want to rely on
"unlikely".

Do I miss anything?

> 
> - fw scheduler hardware with preemption support. There we probably want to
>   nuke the context by setting the tdr timeout to zero (or maybe just as
>   long as context preemption takes to be efficient), and relying on the
>   normal gpu reset flow to handle things. drm_sched_entity_flush kinda
>   does this, except not really and it's a lot more focused on the
>   ringbuffer context. So maybe we want a new drm_sched_entity_kill.
> 
>   For this case calling drm_sched_fini() after the 1:1 entity is gone
>   should not find any linger jobs, it would actually be a bug somewhere if
>   there's a job lingering. Maybe a sanity check that there's not just no
>   jobs lingering, but also no entity left would be good here?

This is a timing assumption too, isn't it? What if we reach drm_sched_fini()
quicker than all the free() callbacks from the jobs on the pending list are
processed?

I know Xe uses the "tdr to zero trick", so I'm not aware of all implications --
in Nouveau I had to do it differently.

> 
> - fw scheduler without preemption support. There we kinda need the
>   drm_sched_flush, except blocking in fops->close is not great. So instead
>   I think the following is better:
>   1. drm_sched_entity_stopped, which only stops new submissions (for
>   paranoia) but doesn't tear down the entity
>   2. drm_dev_get
>   3. launch a worker which does a) drm_sched_flush (or
>   drm_sched_entity_flush or whatever we call it) b) drm_sched_entity_fini

I think it would be drm_sched_flush(); the jobs on the pending are not
associated with any entity any more. See also 96c7c2f4d5bd ("drm/scheduler: set
entity to NULL in drm_sched_entity_pop_job()").

>   + drm_sched_fini c) drm_dev_put
> 
>   Note that semantically this implements the refcount in the other path
>   from Phillip:
> 
>   https://lore.kernel.org/all/20240903094531.29893-2-pstanner@redhat.com/
>   
>   Except it doesn't impose refcount on everyone else who doesn't need it,
>   and it doesn't even impose refcounting on drivers that do need it
>   because we use drm_sched_flush and a worker to achieve the same.
> 
> Essentially helper functions for the common use-cases instead of trying to
> solve them all by putting drm_sched_flush as a potentially very blocking
> function into drm_sched_fini.
> 
> 
> > > > > > When there are still entities with jobs the situation is even
> > > > > > worse
> > > > > > since the dma_fences for those jobs can never signal we can just
> > > > > > choose between potentially locking up core memory management and
> > > > > > random memory corruption. When drivers really mess it up that
> > > > > > well
> > > > > > let them run into a BUG_ON().
> > > > > > 
> > > > > > Signed-off-by: Christian König<christian.koenig@amd.com>
> > > > > > ---
> > > > > >    drivers/gpu/drm/scheduler/sched_main.c | 19 ++++++++++++++++++-
> > > > > >    1 file changed, 18 insertions(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > index f093616fe53c..8a46fab5cdc8 100644
> > > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > > @@ -1333,17 +1333,34 @@ void drm_sched_fini(struct
> > > > > > drm_gpu_scheduler
> > > > > > *sched)
> > > > > I agree with Sima that it should first be documented in the
> > > > > function's
> > > > > docstring what the user is expected to have done before calling the
> > > > > function.
> > > > Good point, going to update the documentation as well.
> > > Cool thing, thx.
> > > Would be great if everything (not totally trivial) necessary to be done
> > > before _fini() is mentioned.
> > > 
> > > One could also think about providing a hint at how the driver can do
> > > that. AFAICS the only way for the driver to ensure that is to maintain
> > > its own, separate list of submitted jobs.
> > 
> > Even with a duplicated pending list it's actually currently impossible to do
> > this fully cleanly.
> > 
> > The problem is that the dma_fence object gives no guarantee when callbacks
> > are processed, e.g. they can be both processed from interrupt context as
> > well as from a CPU which called dma_fence_is_signaled().
> > 
> > So when a driver (or drm_sched_fini) waits for the last submitted fence it
> > actually can be that the drm_sched object still needs to do some processing.
> > See the hack in amdgpu_vm_tlb_seq() for more background on the problem.
> 
> So I thought this should be fairly easy because of the sched hw/public
> fence split: If we wait for both all jobs to finish and for all the sched
> work/tdr work to finish, and we make sure there's no entity existing
> that's not yet stopped we should catch them all? Or at least I think it's
> a bug if any other code even tries to touch the hw fence.
> 
> If you have any other driver code which relies on the rcu freeing then I
> think that's just a separate concern and we can ignore that here since the
> fences themselves will till get rcu-delay freed even if drm_sched_fini has
> finished.
> -Sima
> 
> > 
> > Regards,
> > Christian.
> > 
> > > 
> > > P.
> > > 
> > > > Thanks,
> > > > Christian.
> > > > 
> > > > > P.
> > > > > 
> > > > > >    	drm_sched_wqueue_stop(sched);
> > > > > > +	/*
> > > > > > +	 * Tearing down the scheduler wile there are still
> > > > > > unprocessed jobs can
> > > > > > +	 * lead to use after free issues in the scheduler fence.
> > > > > > +	 */
> > > > > > +	WARN_ON(!list_empty(&sched->pending_list));
> > > > > > +
> > > > > >    	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs;
> > > > > > i++)
> > > > > > {
> > > > > >    		struct drm_sched_rq *rq = sched->sched_rq[i];
> > > > > >    		spin_lock(&rq->lock);
> > > > > > -		list_for_each_entry(s_entity, &rq->entities,
> > > > > > list)
> > > > > > +		list_for_each_entry(s_entity, &rq->entities,
> > > > > > list) {
> > > > > > +			/*
> > > > > > +			 * The justification for this BUG_ON()
> > > > > > is
> > > > > > that tearing
> > > > > > +			 * down the scheduler while jobs are
> > > > > > pending
> > > > > > leaves
> > > > > > +			 * dma_fences unsignaled. Since we have
> > > > > > dependencies
> > > > > > +			 * from the core memory management to
> > > > > > eventually signal
> > > > > > +			 * dma_fences this can trivially lead to
> > > > > > a
> > > > > > system wide
> > > > > > +			 * stop because of a locked up memory
> > > > > > management.
> > > > > > +			 */
> > > > > > +			BUG_ON(spsc_queue_count(&s_entity-
> > > > > > > job_queue));
> > > > > > +
> > > > > >    			/*
> > > > > >    			 * Prevents reinsertion and marks
> > > > > > job_queue
> > > > > > as idle,
> > > > > >    			 * it will removed from rq in
> > > > > > drm_sched_entity_fini
> > > > > >    			 * eventually
> > > > > >    			 */
> > > > > >    			s_entity->stopped = true;
> > > > > > +		}
> > > > > >    		spin_unlock(&rq->lock);
> > > > > >    		kfree(sched->sched_rq[i]);
> > > > > >    	}
> 
> -- 
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> 
