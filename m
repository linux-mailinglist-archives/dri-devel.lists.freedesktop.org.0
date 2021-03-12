Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 935D433868E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 08:31:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815886F44F;
	Fri, 12 Mar 2021 07:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA78F6F44F
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 07:31:31 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E06A21F4687A;
 Fri, 12 Mar 2021 07:31:29 +0000 (GMT)
Date: Fri, 12 Mar 2021 08:31:25 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [RFC PATCH 0/7] drm/panfrost: Add a new submit ioctl
Message-ID: <20210312083125.76063c77@collabora.com>
In-Reply-To: <CAOFGe95d-LQ_rNwncup-G5oj14uCnNrnHr=r1b5jLYnXfMSTiA@mail.gmail.com>
References: <20210311092539.2405596-1-boris.brezillon@collabora.com>
 <86062831-6608-9ae7-c513-e74d3a9c2e33@arm.com>
 <20210311140023.2735aaa5@collabora.com>
 <CAOFGe94rnS+5FeJ1A8bLxgVDZB4_0Wp2Nx25iCCYGJ=j3KpOCA@mail.gmail.com>
 <20210311182458.0e0140a1@collabora.com>
 <CAOFGe95d-LQ_rNwncup-G5oj14uCnNrnHr=r1b5jLYnXfMSTiA@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 11 Mar 2021 12:11:48 -0600
Jason Ekstrand <jason@jlekstrand.net> wrote:

> > > > > > 2/ Queued jobs might be executed out-of-order (unless they have
> > > > > >     explicit/implicit deps between them), and Vulkan asks that the out
> > > > > >     fence be signaled when all jobs are done. Timeline syncobjs are a
> > > > > >     good match for that use case. All we need to do is pass the same
> > > > > >     fence syncobj to all jobs being attached to a single QueueSubmit
> > > > > >     request, but a different point on the timeline. The syncobj
> > > > > >     timeline wait does the rest and guarantees that we've reached a
> > > > > >     given timeline point (IOW, all jobs before that point are done)
> > > > > >     before declaring the fence as signaled.
> > > > > >     One alternative would be to have dummy 'synchronization' jobs that
> > > > > >     don't actually execute anything on the GPU but declare a dependency
> > > > > >     on all other jobs that are part of the QueueSubmit request, and
> > > > > >     signal the out fence (the scheduler would do most of the work for
> > > > > >     us, all we have to do is support NULL job heads and signal the
> > > > > >     fence directly when that happens instead of queueing the job).  
> > > > >
> > > > > I have to admit to being rather hazy on the details of timeline
> > > > > syncobjs, but I thought there was a requirement that the timeline moves
> > > > > monotonically. I.e. if you have multiple jobs signalling the same
> > > > > syncobj just with different points, then AFAIU the API requires that the
> > > > > points are triggered in order.  
> > > >
> > > > I only started looking at the SYNCOBJ_TIMELINE API a few days ago, so I
> > > > might be wrong, but my understanding is that queuing fences (addition
> > > > of new points in the timeline) should happen in order, but signaling
> > > > can happen in any order. When checking for a signaled fence the
> > > > fence-chain logic starts from the last point (or from an explicit point
> > > > if you use the timeline wait flavor) and goes backward, stopping at the
> > > > first un-signaled node. If I'm correct, that means that fences that
> > > > are part of a chain can be signaled in any order.  
> > >
> > > You don't even need a timeline for this.  Just have a single syncobj
> > > per-queue and make each submit wait on it and then signal it.
> > > Alternatively, you can just always hang on to the out-fence from the
> > > previous submit and make the next one wait on that.  
> >
> > That's what I have right now, but it forces the serialization of all
> > jobs that are pushed during a submit (and there can be more than one
> > per command buffer on panfrost :-/). Maybe I'm wrong, but I thought it'd
> > be better to not force this serialization if we can avoid it.  
> 
> I'm not familiar with panfrost's needs and I don't work on a tiler and
> I know there are different issues there.  But...
> 
> The Vulkan spec requires that everything that all the submits that
> happen on a given vkQueue happen in-order.  Search the spec for
> "Submission order" for more details.

Duh, looks like I completely occulted the "Submission order"
guarantees. This being said, even after reading this chapter multiple
times I'm not sure what kind of guarantee this gives us, given the
execution itself can be out-of-order. My understanding is that
submission order matters for implicit deps, say you have 2 distinct
VkSubmitInfo, the first one (in submission order) writing to a buffer
and the second one reading from it, you really want the first one to
be submitted first and the second one to wait on the implicit BO fence
created by the first one. If we were to submit out-of-order, this
guarantee wouldn't be met. OTOH, if we have 2 completely independent
submits, I don't really see what submission order gives us if execution
is out-of-order.

In our case, the kernel driver takes care of the submission
serialization (gathering implicit and explicit deps, queuing the job and
assigning the "done" fence to the output sync objects). Once things
are queued, it's the scheduler (drm_sched) deciding of the execution
order.

> 
> So, generally speaking, there are some in-order requirements there.
> Again, not having a lot of tiler experience, I'm not the one to weigh
> in.
> 
> > > Timelines are overkill here, IMO.  
> >
> > Mind developing why you think this is overkill? After looking at the
> > kernel implementation I thought using timeline syncobjs would be
> > pretty cheap compared to the other options I considered.  
> 
> If you use a regular syncobj, every time you wait on it it inserts a
> dependency between the current submit and the last thing to signal it
> on the CPU timeline.  The internal dma_fences will hang around
> as-needed to ensure those dependencies.  If you use a timeline, you
> have to also track a uint64_t to reference the current time point.
> This may work if you need to sync a bunch of in-flight stuff at one
> go, that may work but if you're trying to serialize, it's just extra
> tracking for no point.  Again, maybe there's something I'm missing and
> you don't actually want to serialize.

My understanding (and I might very much be wrong here) is that using a
regular syncobj to do this actually enforces not only the submission
order but also the execution order (each job waiting on the previous
one to complete before being scheduled). The idea of the timeline
syncobj approach is that jobs that have no inter dependencies can be
started in any order, the scheduler picking the first whose deps are
ready (which might not necessarily match submission order). The
timeline syncobj allows us to have one point per kernel-submission and
eventually wait on the last point for the fence passed to
vkSubmitQueue(), and some specific point on the timeline for
pSignalSemaphores entries.

What's more challenging is signal operation ordering:

"
Signal operation order is a fundamental ordering in Vulkan, giving
meaning to the order in which semaphore and fence signal operations
occur when submitted to a single queue.



1.  The initial order is determined by the order in which
    vkQueueSubmit commands are executed on the host, for a single
    queue, from first to last.

2.  The order in which VkSubmitInfo structures are specified in the
    pSubmits parameter of vkQueueSubmit, from lowest index to highest.

3.  The fence signal operation defined by the fence parameter of a
    vkQueueSubmit or vkQueueBindSparse command is ordered after all
    semaphore signal operations defined by that command.
"

This means we have to add implicit dependencies on the signaling
itself. We have two options to guarantee that:

1/ Transfer one of the queue syncobj timeline point to each semaphore
   and fence after job submission (the point itself being dependent
   on the position of the submit entry in the array for semaphores, and
   the last point for the fence). Problem with this approach is that we
   now have an extra TRANSFER_SYNCOBJ call per semaphore/fence

2/ Add SYNC jobs (jobs that do not actually execute on the GPU, but
   serve as a synchronization point) whose responsibility would be to
   do this muxing/transfer as part of the batch submission process.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
