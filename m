Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 440E6667C62
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 18:16:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602B310E304;
	Thu, 12 Jan 2023 17:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF43910E304
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 17:16:33 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 768D26602D59;
 Thu, 12 Jan 2023 17:16:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1673543792;
 bh=OUFHhzSnMtjK7R2mPxhm7ayVHkTULH1G9M2+OtHQc74=;
 h=Date:From:To:Cc:Subject:From;
 b=Vy9AVVPG/JSyuhjw7FtQrmUcjOuZQRAwZ/y59n8jRz6uWSEgqJqhvdLvzEvVqzTGv
 SVB1PmysLOhQ5a1qDxz9LcUWmEYCXHizJaHySRVwhV9K3oX9vGAG2X9VlFnf0k9aW9
 E0xeJ60iSAlq177H2DKNEPIalnS/uXvS9V1jetARG9yu/sYq4sUwnP8z1ndCsVJcp6
 m75mr0VtPKi4bbNnD5OvA7EwB6tiphKOho72XZpTTR/HUpB9WwqiPWkpm/IvRaPTgj
 wYPBMPmKsoEykM5clmgZNg4yX5lT7sLdDd3/0189kUzT1HzKajv72qIFShB2ckVJk0
 7McNS+6WMf0iQ==
Date: Thu, 12 Jan 2023 18:16:29 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [RFC] Discussing the pancsf scheduler implementation
Message-ID: <20230112181629.467a50ca@collabora.com>
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
Cc: Daniel Stone <daniels@collabora.com>, Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

Moving the discussion that started here [1] to a separate thread to stop
polluting the Xe RFC.

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

Regards,

Boris

[1]https://lore.kernel.org/dri-devel/Y7cns9bpfIslkCPu@DUT025-TGLU.fm.intel.com/T/#u
