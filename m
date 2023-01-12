Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B278A666D8E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 10:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B0910E8AB;
	Thu, 12 Jan 2023 09:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EDA410E8A9;
 Thu, 12 Jan 2023 09:10:58 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C101A6602DAB;
 Thu, 12 Jan 2023 09:10:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1673514657;
 bh=pRwP5s6lz4VJ/v+nBUHhKh19ZUq0wbSzC88flKGjG4o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JQ9D/9WqTFIH4YVEAGlwY2csc9If4R7YbnpCvC+gDut3TOr/OhINtBfphqTFqZ4OY
 sLI9dtnM5dRbPfiQJc1p/N1kKxdPMLCjO810SnNSE8Flz8BI7d48c31UuEZ+h3OdlC
 kPu4fIWZoNJ1NAK8szbAEMhmaQHizk5jFEMOqw1kavRZxWkjmRxNRaINmiq1B6y3cK
 92L0MuTqFrmLaycWNOm6mDcxG/lUHYHApO2fY/OO4iw6Y3mo2GjFeelNM3QdFNrkFz
 PbgFeyP5FBbB4qAJKc8GSWlEigNR46csiWia+/wrLY5ILBRhBI+wKL5fmvPgOQEZOP
 seEM/OHap79DA==
Date: Thu, 12 Jan 2023 10:10:53 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [RFC PATCH 04/20] drm/sched: Convert drm scheduler
 to use a work queue rather than kthread
Message-ID: <20230112101053.393e0717@collabora.com>
In-Reply-To: <CAKMK7uHTGCoW1CEmfk6vTYG-=8FEQg2fUrcKMV80o=iQ6QhUdg@mail.gmail.com>
References: <20221222222127.34560-1-matthew.brost@intel.com>
 <20221222222127.34560-5-matthew.brost@intel.com>
 <20221230112042.2ddd1946@collabora.com>
 <20221230125508.57af8a14@collabora.com>
 <20230102083019.24b99647@collabora.com>
 <Y7cns9bpfIslkCPu@DUT025-TGLU.fm.intel.com>
 <CAOFGe978gae1mN2W_rrgXQm4ioQm73Bkpr-ex2Oa4gtkNzDpcg@mail.gmail.com>
 <20230109181748.4d73b834@collabora.com>
 <Y7x7tSsdgQvZ+JD0@phenom.ffwll.local>
 <20230110094647.5897dbdd@collabora.com>
 <CAKMK7uHTGCoW1CEmfk6vTYG-=8FEQg2fUrcKMV80o=iQ6QhUdg@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
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

Hi Daniel,

On Wed, 11 Jan 2023 22:47:02 +0100
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Tue, 10 Jan 2023 at 09:46, Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > Hi Daniel,
> >
> > On Mon, 9 Jan 2023 21:40:21 +0100
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> >  
> > > On Mon, Jan 09, 2023 at 06:17:48PM +0100, Boris Brezillon wrote:  
> > > > Hi Jason,
> > > >
> > > > On Mon, 9 Jan 2023 09:45:09 -0600
> > > > Jason Ekstrand <jason@jlekstrand.net> wrote:
> > > >  
> > > > > On Thu, Jan 5, 2023 at 1:40 PM Matthew Brost <matthew.brost@intel.com>
> > > > > wrote:
> > > > >  
> > > > > > On Mon, Jan 02, 2023 at 08:30:19AM +0100, Boris Brezillon wrote:  
> > > > > > > On Fri, 30 Dec 2022 12:55:08 +0100
> > > > > > > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > > > > > >  
> > > > > > > > On Fri, 30 Dec 2022 11:20:42 +0100
> > > > > > > > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > > > > > > >  
> > > > > > > > > Hello Matthew,
> > > > > > > > >
> > > > > > > > > On Thu, 22 Dec 2022 14:21:11 -0800
> > > > > > > > > Matthew Brost <matthew.brost@intel.com> wrote:
> > > > > > > > >  
> > > > > > > > > > In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
> > > > > > > > > > mapping between a drm_gpu_scheduler and drm_sched_entity. At first  
> > > > > > this  
> > > > > > > > > > seems a bit odd but let us explain the reasoning below.
> > > > > > > > > >
> > > > > > > > > > 1. In XE the submission order from multiple drm_sched_entity is not
> > > > > > > > > > guaranteed to be the same completion even if targeting the same  
> > > > > > hardware  
> > > > > > > > > > engine. This is because in XE we have a firmware scheduler, the  
> > > > > > GuC,  
> > > > > > > > > > which allowed to reorder, timeslice, and preempt submissions. If a  
> > > > > > using  
> > > > > > > > > > shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR  
> > > > > > falls  
> > > > > > > > > > apart as the TDR expects submission order == completion order.  
> > > > > > Using a  
> > > > > > > > > > dedicated drm_gpu_scheduler per drm_sched_entity solve this  
> > > > > > problem.  
> > > > > > > > >
> > > > > > > > > Oh, that's interesting. I've been trying to solve the same sort of
> > > > > > > > > issues to support Arm's new Mali GPU which is relying on a  
> > > > > > FW-assisted  
> > > > > > > > > scheduling scheme (you give the FW N streams to execute, and it does
> > > > > > > > > the scheduling between those N command streams, the kernel driver
> > > > > > > > > does timeslice scheduling to update the command streams passed to the
> > > > > > > > > FW). I must admit I gave up on using drm_sched at some point, mostly
> > > > > > > > > because the integration with drm_sched was painful, but also because  
> > > > > > I  
> > > > > > > > > felt trying to bend drm_sched to make it interact with a
> > > > > > > > > timeslice-oriented scheduling model wasn't really future proof.  
> > > > > > Giving  
> > > > > > > > > drm_sched_entity exlusive access to a drm_gpu_scheduler probably  
> > > > > > might  
> > > > > > > > > help for a few things (didn't think it through yet), but I feel it's
> > > > > > > > > coming short on other aspects we have to deal with on Arm GPUs.  
> > > > > > > >
> > > > > > > > Ok, so I just had a quick look at the Xe driver and how it
> > > > > > > > instantiates the drm_sched_entity and drm_gpu_scheduler, and I think I
> > > > > > > > have a better understanding of how you get away with using drm_sched
> > > > > > > > while still controlling how scheduling is really done. Here
> > > > > > > > drm_gpu_scheduler is just a dummy abstract that let's you use the
> > > > > > > > drm_sched job queuing/dep/tracking mechanism. The whole run-queue  
> > > > > >
> > > > > > You nailed it here, we use the DRM scheduler for queuing jobs,
> > > > > > dependency tracking and releasing jobs to be scheduled when dependencies
> > > > > > are met, and lastly a tracking mechanism of inflights jobs that need to
> > > > > > be cleaned up if an error occurs. It doesn't actually do any scheduling
> > > > > > aside from the most basic level of not overflowing the submission ring
> > > > > > buffer. In this sense, a 1 to 1 relationship between entity and
> > > > > > scheduler fits quite well.
> > > > > >  
> > > > >
> > > > > Yeah, I think there's an annoying difference between what AMD/NVIDIA/Intel
> > > > > want here and what you need for Arm thanks to the number of FW queues
> > > > > available. I don't remember the exact number of GuC queues but it's at
> > > > > least 1k. This puts it in an entirely different class from what you have on
> > > > > Mali. Roughly, there's about three categories here:
> > > > >
> > > > >  1. Hardware where the kernel is placing jobs on actual HW rings. This is
> > > > > old Mali, Intel Haswell and earlier, and probably a bunch of others.
> > > > > (Intel BDW+ with execlists is a weird case that doesn't fit in this
> > > > > categorization.)
> > > > >
> > > > >  2. Hardware (or firmware) with a very limited number of queues where
> > > > > you're going to have to juggle in the kernel in order to run desktop Linux.
> > > > >
> > > > >  3. Firmware scheduling with a high queue count. In this case, you don't
> > > > > want the kernel scheduling anything. Just throw it at the firmware and let
> > > > > it go brrrrr.  If we ever run out of queues (unlikely), the kernel can
> > > > > temporarily pause some low-priority contexts and do some juggling or,
> > > > > frankly, just fail userspace queue creation and tell the user to close some
> > > > > windows.
> > > > >
> > > > > The existence of this 2nd class is a bit annoying but it's where we are. I
> > > > > think it's worth recognizing that Xe and panfrost are in different places
> > > > > here and will require different designs. For Xe, we really are just using
> > > > > drm/scheduler as a front-end and the firmware does all the real scheduling.
> > > > >
> > > > > How do we deal with class 2? That's an interesting question.  We may
> > > > > eventually want to break that off into a separate discussion and not litter
> > > > > the Xe thread but let's keep going here for a bit.  I think there are some
> > > > > pretty reasonable solutions but they're going to look a bit different.
> > > > >
> > > > > The way I did this for Xe with execlists was to keep the 1:1:1 mapping
> > > > > between drm_gpu_scheduler, drm_sched_entity, and userspace xe_engine.
> > > > > Instead of feeding a GuC ring, though, it would feed a fixed-size execlist
> > > > > ring and then there was a tiny kernel which operated entirely in IRQ
> > > > > handlers which juggled those execlists by smashing HW registers.  For
> > > > > Panfrost, I think we want something slightly different but can borrow some
> > > > > ideas here.  In particular, have the schedulers feed kernel-side SW queues
> > > > > (they can even be fixed-size if that helps) and then have a kthread which
> > > > > juggles those feeds the limited FW queues.  In the case where you have few
> > > > > enough active contexts to fit them all in FW, I do think it's best to have
> > > > > them all active in FW and let it schedule. But with only 31, you need to be
> > > > > able to juggle if you run out.  
> > > >
> > > > That's more or less what I do right now, except I don't use the
> > > > drm_sched front-end to handle deps or queue jobs (at least not yet). The
> > > > kernel-side timeslice-based scheduler juggling with runnable queues
> > > > (queues with pending jobs that are not yet resident on a FW slot)
> > > > uses a dedicated ordered-workqueue instead of a thread, with scheduler
> > > > ticks being handled with a delayed-work (tick happening every X
> > > > milliseconds when queues are waiting for a slot). It all seems very
> > > > HW/FW-specific though, and I think it's a bit premature to try to
> > > > generalize that part, but the dep-tracking logic implemented by
> > > > drm_sched looked like something I could easily re-use, hence my
> > > > interest in Xe's approach.  
> > >
> > > So another option for these few fw queue slots schedulers would be to
> > > treat them as vram and enlist ttm.
> > >
> > > Well maybe more enlist ttm and less treat them like vram, but ttm can
> > > handle idr (or xarray or whatever you want) and then help you with all the
> > > pipelining (and the drm_sched then with sorting out dependencies). If you
> > > then also preferentially "evict" low-priority queus you pretty much have
> > > the perfect thing.
> > >
> > > Note that GuC with sriov splits up the id space and together with some
> > > restrictions due to multi-engine contexts media needs might also need this
> > > all.
> > >
> > > If you're balking at the idea of enlisting ttm just for fw queue
> > > management, amdgpu has a shoddy version of id allocation for their vm/tlb
> > > index allocation. Might be worth it to instead lift that into some sched
> > > helper code.  
> >
> > Would you mind pointing me to the amdgpu code you're mentioning here?
> > Still have a hard time seeing what TTM has to do with scheduling, but I
> > also don't know much about TTM, so I'll keep digging.  
> 
> ttm is about moving stuff in&out of a limited space and gives you some
> nice tooling for pipelining it all. It doesn't care whether that space
> is vram or some limited id space. vmwgfx used ttm as an id manager
> iirc.

Ok.

> 
> > > Either way there's two imo rather solid approaches available to sort this
> > > out. And once you have that, then there shouldn't be any big difference in
> > > driver design between fw with defacto unlimited queue ids, and those with
> > > severe restrictions in number of queues.  
> >
> > Honestly, I don't think there's much difference between those two cases
> > already. There's just a bunch of additional code to schedule queues on
> > FW slots for the limited-number-of-FW-slots case, which, right now, is
> > driver specific. The job queuing front-end pretty much achieves what
> > drm_sched does already: queuing job to entities, checking deps,
> > submitting job to HW (in our case, writing to the command stream ring
> > buffer). Things start to differ after that point: once a scheduling
> > entity has pending jobs, we add it to one of the runnable queues (one
> > queue per prio) and kick the kernel-side timeslice-based scheduler to
> > re-evaluate, if needed.
> >
> > I'm all for using generic code when it makes sense, even if that means
> > adding this common code when it doesn't exists, but I don't want to be
> > dragged into some major refactoring that might take years to land.
> > Especially if pancsf is the first
> > FW-assisted-scheduler-with-few-FW-slot driver.  
> 
> I don't see where there's a major refactoring that you're getting dragged into?

Oh, no, I'm not saying this is the case just yet, just wanted to make
sure we're on the same page :-).

> 
> Yes there's a huge sprawling discussion right now, but I think that's
> just largely people getting confused.

I definitely am :-).

> 
> Wrt the actual id assignment stuff, in amdgpu at least it's few lines
> of code. See the amdgpu_vmid_grab stuff for the simplest starting
> point.

Ok, thanks for the pointers. I'll have a look and see how I could use
that. I guess that's about getting access to the FW slots with some
sort of priority+FIFO ordering guarantees given by TTM. If that's the
case, I'll have to think about it, because that's a major shift from
what we're doing now, and I'm afraid this could lead to starving
non-resident entities if all resident entities keep receiving new jobs
to execute. Unless we put some sort of barrier when giving access to a
slot, so we evict the entity when it's done executing the stuff it had
when it was given access to this slot. But then, again, there are other
constraints to take into account for the Arm Mali CSF case:

- it's more efficient to update all FW slots at once, because each
  update of a slot might require updating priorities of the other slots
  (FW mandates unique slot priorities, and those priorities depend on
  the entity priority/queue-ordering)
- context/FW slot switches have a non-negligible cost (FW needs to
  suspend the context and save the state every time there such a
  switch), so, limiting the number of FW slot updates might prove
  important

> 
> And also yes a scheduler frontend for dependency sorting shouldn't
> really be a that big thing, so there's not going to be huge amounts of
> code sharing in the end.

Agreed.

> It's the conceptual sharing, and sharing
> stuff like drm_sched_entity to eventual build some cross driver gpu
> context stuff on top that really is going to matter.

And I agree with that too.

> 
> Also like I mentioned, at least in some cases i915-guc might also have
> a need for fw scheduler slot allocation for a bunch of running things.

Ok.

> 
> Finally I'm a bit confused why you're building a time sharing
> scheduler in the kernel if you have one in fw already. Or do I get
> that part wrong?

It's here to overcome the low number of FW-slot (which is as low as 8
on the HW I'm testing on). If you don't do time sharing scheduling
kernel-side, you have no guarantee of fairness, since one could keep
queuing jobs to an entity/queue, making it permanently resident,
without giving a chance to non-resident entities/queues to ever run. To
sum-up, the scheduler is not entirely handled by the FW, it's a mixed
design, where part of it is in the FW (scheduling between currently
active entities passed to the FW), and the other part in the kernel
driver (rotating runnable entities on the limited amount of FW slots we
have). But overall, it shouldn't make a difference compared to Xe. The
fact some of the scheduling happens kernel-side is completely opaque to
the drm_sched_entity frontend if we go the Xe way (one
drm_gpu_scheduler per drm_sched_entity, real scheduling is handled by
some black box, either entirely in the FW, or with shared
responsibility between FW and kernel).

Regards,

Boris
