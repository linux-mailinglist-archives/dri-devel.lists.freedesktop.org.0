Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0246A667BDE
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 17:48:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BCA10E2FA;
	Thu, 12 Jan 2023 16:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CA010E2F6;
 Thu, 12 Jan 2023 16:48:37 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EA4446600010;
 Thu, 12 Jan 2023 16:48:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1673542116;
 bh=uz9pI1gvIEzhrb2m/Xm7YdISRgBmgk6rpjUdS7IrNpU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gK0tai0IIxVf8XgBbpEOy4GXXsdbG/KTiVd7SQpge2WgCQjC8OyQcBiKF5B/nKTgH
 XwP7EGm24dIqaLEOabyADii00s23dA2GYs6kmjHQKREke3MRDlTIcPjQIUbgBMHkXo
 6PUtmoWRTJKcR+5JSDSaiNrOCt+E/7cLkayFRpzO4iq91izLnWB4vy9qWLSlpBZv3F
 tjELmxj5DxfagSVAhDz03T1E28DrzZDyrkAH8R0zx2LEJCVxaDGgfhs2HEaWjH2hTV
 uibmhehWlHTBPtiAxecjF38oiTdv8N7bUgyxk73NLdX8qc96EZd9My2mWrXCmGstrh
 Ac7RK/+acdl5Q==
Date: Thu, 12 Jan 2023 17:48:33 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [RFC PATCH 04/20] drm/sched: Convert drm scheduler
 to use a work queue rather than kthread
Message-ID: <20230112174833.71023805@collabora.com>
In-Reply-To: <CAKMK7uGPFVjkugw-W+o6C514x8ZPJs3L1A_QCB69aF0WAfHZjw@mail.gmail.com>
References: <Y7cns9bpfIslkCPu@DUT025-TGLU.fm.intel.com>
 <CAOFGe978gae1mN2W_rrgXQm4ioQm73Bkpr-ex2Oa4gtkNzDpcg@mail.gmail.com>
 <20230109181748.4d73b834@collabora.com>
 <Y7x7tSsdgQvZ+JD0@phenom.ffwll.local>
 <20230110094647.5897dbdd@collabora.com>
 <CAKMK7uHTGCoW1CEmfk6vTYG-=8FEQg2fUrcKMV80o=iQ6QhUdg@mail.gmail.com>
 <20230112101053.393e0717@collabora.com>
 <Y7/Tolh8SGLtybs0@phenom.ffwll.local>
 <20230112111103.324abb3c@collabora.com>
 <20230112112553.324ffa05@collabora.com>
 <Y7/kMa1Jz+4+YIvv@phenom.ffwll.local>
 <20230112130818.220edc62@collabora.com>
 <CAKMK7uGPFVjkugw-W+o6C514x8ZPJs3L1A_QCB69aF0WAfHZjw@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
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
Cc: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 12 Jan 2023 16:38:18 +0100
Daniel Vetter <daniel@ffwll.ch> wrote:

> > >
> > > Also if you do the allocation in ->prepare_job with dma_fence and not
> > > run_job, then I think can sort out fairness issues (if they do pop up) in
> > > the drm/sched code instead of having to think about this in each driver.  
> >
> > By allocation, you mean assigning a FW slot ID? If we do this allocation
> > in ->prepare_job(), couldn't we mess up ordering? Like,
> > lower-prio/later-queuing entity being scheduled before its pairs,
> > because there's no guarantee on the job completion order (and thus the
> > queue idleness order). I mean, completion order depends on the kind of
> > job being executed by the queues, the time the FW actually lets the
> > queue execute things and probably other factors. You can use metrics
> > like the position in the LRU list + the amount of jobs currently
> > queued to a group to guess which one will be idle first, but that's
> > just a guess. And I'm not sure I see what doing this slot selection in  
> > ->prepare_job() would bring us compared to doing it in ->run_job(),  
> > where we can just pick the least recently used slot.  
> 
> In ->prepare_job you can let the scheduler code do the stalling (and
> ensure fairness), in ->run_job it's your job.

Yeah returning a fence in ->prepare_job() to wait for a FW slot to
become idle sounds good. This fence would be signaled when one of the
slots becomes idle. But I'm wondering why we'd want to select the slot
so early. Can't we just do the selection in ->run_job()? After all, if
the fence has been signaled, that means we'll find at least one slot
that's ready when we hit ->run_job(), and we can select it at that
point.

> The current RFC doesn't
> really bother much with getting this very right, but if the scheduler
> code tries to make sure it pushes higher-prio stuff in first before
> others, you should get the right outcome.

Okay, so I'm confused again. We said we had a 1:1
drm_gpu_scheduler:drm_sched_entity mapping, meaning that entities are
isolated from each other. I can see how I could place the dma_fence
returned by ->prepare_job() in a driver-specific per-priority list, so
the driver can pick the highest-prio/first-inserted entry and signal the
associated fence when a slot becomes idle. But I have a hard time
seeing how common code could do that if it doesn't see the other
entities. Right now, drm_gpu_scheduler only selects the best entity
among the registered ones, and there's only one entity per
drm_gpu_scheduler in this case.

> 
> The more important functional issue is that you must only allocate the
> fw slot after all dependencies have signalled.

Sure, but it doesn't have to be a specific FW slot, it can be any FW
slot, as long as we don't signal more fences than we have slots
available, right?

> Otherwise you might get
> a nice deadlock, where job A is waiting for the fw slot of B to become
> free, and B is waiting for A to finish.

Got that part, and that's ensured by the fact we wait for all
regular deps before returning the FW-slot-available dma_fence in
->prepare_job(). This exact same fence will be signaled when a slot
becomes idle.

> 
> > > Few fw sched slots essentially just make fw scheduling unfairness more
> > > prominent than with others, but I don't think it's fundamentally something
> > > else really.
> > >
> > > If every ctx does that and the lru isn't too busted, they should then form
> > > a nice orderly queue and cycle through the fw scheduler, while still being
> > > able to get some work done. It's essentially the exact same thing that
> > > happens with ttm vram eviction, when you have a total working set where
> > > each process fits in vram individually, but in total they're too big and
> > > you need to cycle things through.  
> >
> > I see.
> >  
> > >  
> > > > > I'll need to make sure this still works with the concept of group (it's
> > > > > not a single queue we schedule, it's a group of queues, meaning that we
> > > > > have N fences to watch to determine if the slot is busy or not, but
> > > > > that should be okay).  
> > > >
> > > > Oh, there's one other thing I forgot to mention: the FW scheduler is
> > > > not entirely fair, it does take the slot priority (which has to be
> > > > unique across all currently assigned slots) into account when
> > > > scheduling groups. So, ideally, we'd want to rotate group priorities
> > > > when they share the same drm_sched_priority (probably based on the
> > > > position in the LRU).  
> > >
> > > Hm that will make things a bit more fun I guess, especially with your
> > > constraint to not update this too often. How strict is that priority
> > > difference? If it's a lot, we might need to treat this more like execlist
> > > and less like a real fw scheduler ...  
> >
> > Strict as in, if two groups with same priority try to request an
> > overlapping set of resources (cores or tilers), it can deadlock, so
> > pretty strict I would say :-).  
> 
> So it first finishes all the higher priority tasks and only then it
> runs the next one, so no round-robin? Or am I just confused what this
> all is about. Or is it more that the order in the group determines how
> it tries to schedule on the hw, and if the earlier job needs hw that
> also the later one needs, then the earlier one has to finish first?
> Which would still mean that for these overlapping cases there's just
> no round-robin in the fw scheduler at all.

Okay, so my understanding is: FW scheduler always takes the highest
priority when selecting between X groups requesting access to a
resource, but if 2 groups want the same resource and have the same
priority, there's no ordering guarantee. The deadlock happens when both
group A and B claim resources X and Y. Group A might get resource X
and group B might get resource Y, both waiting for the other resource
they claimed. If they have different priorities one of them would back
off and let the other run, if they have the same priority, none of them
would, and that's where the deadlock comes from. Note that we don't
control the order resources get acquired from the CS, so there's no way
to avoid this deadlock without assigning different priorities.

And you're right, if you pick different priorities, the only time lower
priority groups get to run is when the highest priority group is
waiting on an asynchronous operation to complete (can be a
compute/frag/tiler job completion, some inter queue synchronization,
waiting for an already acquired resource, ...), or when it's idle. I
suspect queues from different groups can run concurrently if there's
enough command-stream processing slots available, and those groups
request resources that don't overlap, but I'm speculating here. So, no
round-robin if slots are assigned unique priorities. Not even sure
scheduling is time-slice based to be honest, it could be some
cooperative scheduling where groups with the same priorities get to
wait for the currently running group to be blocked to get access to
the HW. In any case, there's no easy way to prevent deadlocks if we
don't assign unique priorities.
