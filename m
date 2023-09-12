Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E3779D2D9
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 15:52:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5489110E3AB;
	Tue, 12 Sep 2023 13:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088AF10E3AB;
 Tue, 12 Sep 2023 13:52:34 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4217B6607314;
 Tue, 12 Sep 2023 14:52:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694526752;
 bh=DGxVQqvsV3JpC+LxgQ8xVZTUmBu7C9Xoru45PS24HoA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SzQr03yD3GsHaOo7BD60kGgN13uBdEM3J9r5wPnRe320mLVOMLbWfmyvUqAjOAyds
 IGr/m9q3YQBwrBpb4ir5iEp0jjQHts38uOIVvBcz4ZshJDV21fHeyM6cIrlyCSp940
 Jg69posIRwqy4jcbmD/jddtQSRpeR6M1WHzenaDsGHu6r7zqtrhwW9+sVcJDrRgPNC
 6vuG/u46rjawx/ibdqkR6NzHEt6MUxteFedzxVELEcznsCGLUWWPAVdbawNV/sIX9d
 awLjmzObPoiyNvAlY6bVSqyOjJOSnEsz41R4YVXOZ4fk+Ez4qEIDb8+Dr8eEYOk+EP
 r98MHEXD0gt6Q==
Date: Tue, 12 Sep 2023 15:52:28 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH v2 4/9] drm/sched: Split free_job into own work item
Message-ID: <20230912155228.6ee83d62@collabora.com>
In-Reply-To: <ZQBf5vFhRGrNBINj@pollux>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-5-matthew.brost@intel.com>
 <ZOfh6o2EaGuIqZVe@pollux>
 <ZOgYu1fZQUHeneJC@DUT025-TGLU.fm.intel.com>
 <6ae84066-b690-1562-0598-4694b022c960@amd.com>
 <ZOiuWcFDImBvJtnO@DUT025-TGLU.fm.intel.com>
 <ee56b9ee-36c7-5935-c319-c8d1ad412c7c@amd.com>
 <20230912121357.4cc10dec@collabora.com> <ZQBBgsrohAqIAppA@pollux>
 <20230912141818.10827d1d@collabora.com> <ZQBf5vFhRGrNBINj@pollux>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: Matthew Brost <matthew.brost@intel.com>, robdclark@chromium.org,
 sarah.walker@imgtec.com, thomas.hellstrom@linux.intel.com,
 ketil.johnsen@arm.com, lina@asahilina.net, Liviu.Dudau@arm.com,
 dri-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 luben.tuikov@amd.com, donald.robson@imgtec.com, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Sep 2023 14:56:06 +0200
Danilo Krummrich <dakr@redhat.com> wrote:

> On Tue, Sep 12, 2023 at 02:18:18PM +0200, Boris Brezillon wrote:
> > On Tue, 12 Sep 2023 12:46:26 +0200
> > Danilo Krummrich <dakr@redhat.com> wrote:
> >   
> > > > I'm a bit worried that leaving this single vs multi-threaded wq
> > > > decision to drivers is going to cause unnecessary pain, because what
> > > > was previously a granted in term of run/cleanup execution order (thanks
> > > > to the kthread+static-drm_sched_main-workflow approach) is now subject
> > > > to the wq ordering guarantees, which depend on the wq type picked by
> > > > the driver.    
> > > 
> > > Not sure if this ends up to be much different. The only thing I could think of
> > > is that IIRC with the kthread implementation cleanup was always preferred over
> > > run.  
> > 
> > Given the sequence in drm_sched_main(), I'd say that cleanup and run
> > operations are naturally interleaved when both are available, but I
> > might be wrong.  
> 
> From drm_sched_main():
> 
> 	wait_event_interruptible(sched->wake_up_worker,
> 				 (cleanup_job = drm_sched_get_cleanup_job(sched)) ||
> 				 (!drm_sched_blocked(sched) &&
> 				  (entity = drm_sched_select_entity(sched))) ||
> 				 kthread_should_stop());
> 
> 	if (cleanup_job)
> 		sched->ops->free_job(cleanup_job);
> 
> 	if (!entity)
> 		continue;
> 
> If cleanup_job is not NULL the rest shouldn't be evaluated I guess. Hence entity
> would be NULL and we'd loop until there are no more cleanup_jobs if I don't miss
> anything here.

Indeed, I got tricked by the wait_event() expression.

> 
> >   
> > > With a single threaded wq this should be a bit more balanced.  
> > 
> > With a single threaded wq, it's less clear, because each work
> > reschedules itself for further processing, but it's likely to be more
> > or less interleaved. Anyway, I'm not too worried about cleanup taking
> > precedence on run or the other way around, because the limited amount
> > of HW slots (size of the ring-buffer) will regulate that.  
> 
> Yeah, that's what I meant, with to work items rescheduling themselves it starts
> to be interleaved. Which I'm not worried about as well.
> 
> >   
> > > 
> > > With a multi-threaded wq it's still the same, but run and cleanup can run
> > > concurrently,  
> > 
> > What I'm worried about is that ^. I'm not saying it's fundamentally
> > unsafe, but I'm saying drm_sched hasn't been designed with this
> > concurrency in mind, and I fear we'll face subtle bugs if we go from
> > kthread to multi-threaded-wq+run-and-cleanup-split-in-2-work-items.
> >   
> 
> Yeah, so what we get with that is that job_run() of job A and job_free() of job
> B can run in parallel. Unless drivers do weird things there, I'm not seeing an
> issue with that as well at a first glance.

I might be wrong of course, but I'm pretty sure the timestamp race you
reported is indirectly coming from this ST -> MT transition. Again, I'm
not saying we should never use an MT wq, but it feels a bit premature,
and I think I'd prefer if we do it in 2 steps to minimize the amount of
things that could go wrong, and avoid a late revert.

> 
> > > which has the nice side effect that free_job() gets out of the
> > > fence signaling path. At least as long as the workqueue has max_active > 1.  
> > 
> > Oh, yeah, I don't deny using a multi-threaded workqueue has some
> > benefits, just saying it might be trickier than it sounds.
> >   
> > > Which is one reason why I'm using a multi-threaded wq in Nouveau.  
> > 
> > Note that I'm using a multi-threaded workqueue internally at the moment
> > to deal with all sort of interactions with the FW (Mali HW only has a
> > limited amount of scheduling slots, and we need to rotate entities
> > having jobs to execute so every one gets a chance to run on the GPU),
> > but this has been designed this way from the ground up, unlike
> > drm_sched_main() operations, which were mostly thought as a fixed
> > sequential set of operations. That's not to say it's impossible to get
> > right, but I fear we'll face weird/unexpected behavior if we go from
> > completely-serialized to multi-threaded-with-pseudo-random-processing
> > order.  
> 
> From a per job perspective it's still all sequential and besides fence
> dependencies,

Sure, per job ops are still sequential (run, then cleanup once parent
fence is signalled).

> which are still resolved, I don't see where jobs could have cross
> dependencies that make this racy. But agree that it's probably worth to think
> through it a bit more.
> 
> >   
> > > 
> > > That latter seems a bit subtile, we probably need to document this aspect of
> > > under which conditions free_job() is or is not within the fence signaling path.  
> > 
> > Well, I'm not even sure it can be clearly defined when the driver is
> > using the submit_wq for its own work items (which can be done since we
> > pass an optional submit_wq when calling drm_sched_init()). Sure, having
> > max_active >= 2 should be enough to guarantee that the free_job work
> > won't block the run_job one when these are the 2 only works being
> > queued, but what if you have many other work items being queued by the
> > driver to this wq, and some of those try to acquire resv locks? Could
> > this prevent execution of the run_job() callback, thus preventing
> > signaling of fences? I'm genuinely asking, don't know enough about the
> > cmwq implementation to tell what's happening when work items are
> > blocked (might be that the worker pool is extended to unblock the
> > situation).  
> 
> Yes, I think so. If max_active would be 2 and you have two jobs running on this
> workqueue already waiting on allocations then the 3rd job signaling the fence
> the allocation is blocked by would be stuck and we'd have a deadlock I guess.
> 
> But that's where I start to see the driver being responsible not to pass a
> workqueue to the driver where it queues up other work, either at all, or that
> interferes with fence signaling paths.
> 
> So, I guess the message here would be something like: free_job() must be
> considered to be in the fence signaling path, unless the submit_wq is a
> multi-threaded workqueue with max_active > 1 *dedicated* to the DRM scheduler.

If it's meant to be dedicated to the drm scheduler, is there any point
passing a custom submit_wq? I mean, we could start with a dedicated
ordered-wq created by the core to replace the kthread, and then, once
enough testing has been done to make sure things work correctly in a MT
env, switch everyone to a mutithreaded-wq. The fact that we let the
caller pass its own workqueue, to then restrict its usage to things
directly related to drm_sched is somewhat confusing.

> Otherwise it's the drivers full resposibility to make sure it doesn't violate
> the rules.

Yeah, that's what I'm worried about tbh. There's so many subtle ways we
let DRM drivers shoot themselves in the foot already, using the
excuse we want drivers to be in control (for optimization/perf
concerns). I'm just not comfortable adding one more way of doing that,
especially given drm_sched has been one thread calling multiple hooks
sequentially until now, which is essentially what an ordered wq would
provide.

> 
> > 
> > Anyway, documenting when free_job() is in the dma signalling path should
> > be doable (single-threaded wq), but at this point, are we not better
> > off considering anything called from the submit_wq as being part of the
> > dma signalling path, so we can accommodate with both cases. And if
> > there is cleanup processing that require taking dma_resv locks, I'd be
> > tempted to queue that to a driver-specific wq (which is what I'm doing
> > right now), just to be safe.
> >   
> 
> It's not only the dma-resv lock, it's any lock under which allocations may be
> performed.

Sure, I was taking the resv lock in example, because that's easy to
reason about, but that's indeed any lock being taken while doing
allocations that don't have the GFP_{NOWAIT,ATOMIC} flags set.
