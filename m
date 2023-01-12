Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3C5666FF0
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 11:43:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D6B10E17E;
	Thu, 12 Jan 2023 10:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05E910E17E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 10:43:01 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id v6so693226ejg.6
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 02:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xupZsniWL7d6uEb2xEhY//TXVFtrJVXq0KU94KICnv8=;
 b=FEgYm6D2PuVW4LNS3XhvSoPfVx0/isH15Sw4AcZSH1U8/LtBwvofcqJluAKOXcGIlh
 vpzhXHsg609KabPCAjrO4IUd7jY5fXX5n1rfKlX7+jxWWu+R4r/+0S1YJYXDnOvCTPle
 J/4MCGc/qTnfjasoCOYGNffaODJDid1cDoXYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xupZsniWL7d6uEb2xEhY//TXVFtrJVXq0KU94KICnv8=;
 b=WWuDff/OBgFpiBW9knWRYT2rkG22TZjfuYdPkJ6b8zMqp7Bm7yrupz5e0auNlXQ8H6
 PxDsGQi4V1svip938A4wSgK0Pnf9mGgf8kxbgSfJAwJ8K+eKL/yi7tTEq2eRxZH1VpzU
 l9FSFV/A9wtZvDU3w9bsnSlcN6YW3mJd65qfdvPWVXISIH6zMx1FNg2HGhH/7OGLqczj
 Xb+IIGpAVyLt3ncArBuRJ8oDt8rApDd3QIzgWpYMemU8kKLIcyQoM7M0n0P97ZlGHsC8
 piiNZGdWxBHnngF750kOsHecA0L5K9nBKzyWvvy0mkx+dc8UxuiiQsnuT3jlxY0Ij24v
 YCaA==
X-Gm-Message-State: AFqh2krOGetz+mxgWKVaVC2rjhu2WO1vx5llGBVYJYwTjBmoOfVCo584
 mwPB5NzXvG3eZq0Ldc0tqK2uTA==
X-Google-Smtp-Source: AMrXdXsCepsrgUX7raf/ND9vuoqPimcLlB1ZZjpTN4RWog+sSqAVPxXAmkt+5gcgbQPgqKRDI/J6bg==
X-Received: by 2002:a17:906:5dd2:b0:7c1:7010:f413 with SMTP id
 p18-20020a1709065dd200b007c17010f413mr4789684ejv.19.1673520180030; 
 Thu, 12 Jan 2023 02:43:00 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906329100b007c0bb571da5sm7204295ejw.41.2023.01.12.02.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 02:42:59 -0800 (PST)
Date: Thu, 12 Jan 2023 11:42:57 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [Intel-gfx] [RFC PATCH 04/20] drm/sched: Convert drm scheduler
 to use a work queue rather than kthread
Message-ID: <Y7/kMa1Jz+4+YIvv@phenom.ffwll.local>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112112553.324ffa05@collabora.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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

On Thu, Jan 12, 2023 at 11:25:53AM +0100, Boris Brezillon wrote:
> On Thu, 12 Jan 2023 11:11:03 +0100
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
> > On Thu, 12 Jan 2023 10:32:18 +0100
> > Daniel Vetter <daniel@ffwll.ch> wrote:
> > 
> > > On Thu, Jan 12, 2023 at 10:10:53AM +0100, Boris Brezillon wrote:  
> > > > Hi Daniel,
> > > > 
> > > > On Wed, 11 Jan 2023 22:47:02 +0100
> > > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >     
> > > > > On Tue, 10 Jan 2023 at 09:46, Boris Brezillon
> > > > > <boris.brezillon@collabora.com> wrote:    
> > > > > >
> > > > > > Hi Daniel,
> > > > > >
> > > > > > On Mon, 9 Jan 2023 21:40:21 +0100
> > > > > > Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > > >      
> > > > > > > On Mon, Jan 09, 2023 at 06:17:48PM +0100, Boris Brezillon wrote:      
> > > > > > > > Hi Jason,
> > > > > > > >
> > > > > > > > On Mon, 9 Jan 2023 09:45:09 -0600
> > > > > > > > Jason Ekstrand <jason@jlekstrand.net> wrote:
> > > > > > > >      
> > > > > > > > > On Thu, Jan 5, 2023 at 1:40 PM Matthew Brost <matthew.brost@intel.com>
> > > > > > > > > wrote:
> > > > > > > > >      
> > > > > > > > > > On Mon, Jan 02, 2023 at 08:30:19AM +0100, Boris Brezillon wrote:      
> > > > > > > > > > > On Fri, 30 Dec 2022 12:55:08 +0100
> > > > > > > > > > > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > > > > > > > > > >      
> > > > > > > > > > > > On Fri, 30 Dec 2022 11:20:42 +0100
> > > > > > > > > > > > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > > > > > > > > > > >      
> > > > > > > > > > > > > Hello Matthew,
> > > > > > > > > > > > >
> > > > > > > > > > > > > On Thu, 22 Dec 2022 14:21:11 -0800
> > > > > > > > > > > > > Matthew Brost <matthew.brost@intel.com> wrote:
> > > > > > > > > > > > >      
> > > > > > > > > > > > > > In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
> > > > > > > > > > > > > > mapping between a drm_gpu_scheduler and drm_sched_entity. At first      
> > > > > > > > > > this      
> > > > > > > > > > > > > > seems a bit odd but let us explain the reasoning below.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > 1. In XE the submission order from multiple drm_sched_entity is not
> > > > > > > > > > > > > > guaranteed to be the same completion even if targeting the same      
> > > > > > > > > > hardware      
> > > > > > > > > > > > > > engine. This is because in XE we have a firmware scheduler, the      
> > > > > > > > > > GuC,      
> > > > > > > > > > > > > > which allowed to reorder, timeslice, and preempt submissions. If a      
> > > > > > > > > > using      
> > > > > > > > > > > > > > shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR      
> > > > > > > > > > falls      
> > > > > > > > > > > > > > apart as the TDR expects submission order == completion order.      
> > > > > > > > > > Using a      
> > > > > > > > > > > > > > dedicated drm_gpu_scheduler per drm_sched_entity solve this      
> > > > > > > > > > problem.      
> > > > > > > > > > > > >
> > > > > > > > > > > > > Oh, that's interesting. I've been trying to solve the same sort of
> > > > > > > > > > > > > issues to support Arm's new Mali GPU which is relying on a      
> > > > > > > > > > FW-assisted      
> > > > > > > > > > > > > scheduling scheme (you give the FW N streams to execute, and it does
> > > > > > > > > > > > > the scheduling between those N command streams, the kernel driver
> > > > > > > > > > > > > does timeslice scheduling to update the command streams passed to the
> > > > > > > > > > > > > FW). I must admit I gave up on using drm_sched at some point, mostly
> > > > > > > > > > > > > because the integration with drm_sched was painful, but also because      
> > > > > > > > > > I      
> > > > > > > > > > > > > felt trying to bend drm_sched to make it interact with a
> > > > > > > > > > > > > timeslice-oriented scheduling model wasn't really future proof.      
> > > > > > > > > > Giving      
> > > > > > > > > > > > > drm_sched_entity exlusive access to a drm_gpu_scheduler probably      
> > > > > > > > > > might      
> > > > > > > > > > > > > help for a few things (didn't think it through yet), but I feel it's
> > > > > > > > > > > > > coming short on other aspects we have to deal with on Arm GPUs.      
> > > > > > > > > > > >
> > > > > > > > > > > > Ok, so I just had a quick look at the Xe driver and how it
> > > > > > > > > > > > instantiates the drm_sched_entity and drm_gpu_scheduler, and I think I
> > > > > > > > > > > > have a better understanding of how you get away with using drm_sched
> > > > > > > > > > > > while still controlling how scheduling is really done. Here
> > > > > > > > > > > > drm_gpu_scheduler is just a dummy abstract that let's you use the
> > > > > > > > > > > > drm_sched job queuing/dep/tracking mechanism. The whole run-queue      
> > > > > > > > > >
> > > > > > > > > > You nailed it here, we use the DRM scheduler for queuing jobs,
> > > > > > > > > > dependency tracking and releasing jobs to be scheduled when dependencies
> > > > > > > > > > are met, and lastly a tracking mechanism of inflights jobs that need to
> > > > > > > > > > be cleaned up if an error occurs. It doesn't actually do any scheduling
> > > > > > > > > > aside from the most basic level of not overflowing the submission ring
> > > > > > > > > > buffer. In this sense, a 1 to 1 relationship between entity and
> > > > > > > > > > scheduler fits quite well.
> > > > > > > > > >      
> > > > > > > > >
> > > > > > > > > Yeah, I think there's an annoying difference between what AMD/NVIDIA/Intel
> > > > > > > > > want here and what you need for Arm thanks to the number of FW queues
> > > > > > > > > available. I don't remember the exact number of GuC queues but it's at
> > > > > > > > > least 1k. This puts it in an entirely different class from what you have on
> > > > > > > > > Mali. Roughly, there's about three categories here:
> > > > > > > > >
> > > > > > > > >  1. Hardware where the kernel is placing jobs on actual HW rings. This is
> > > > > > > > > old Mali, Intel Haswell and earlier, and probably a bunch of others.
> > > > > > > > > (Intel BDW+ with execlists is a weird case that doesn't fit in this
> > > > > > > > > categorization.)
> > > > > > > > >
> > > > > > > > >  2. Hardware (or firmware) with a very limited number of queues where
> > > > > > > > > you're going to have to juggle in the kernel in order to run desktop Linux.
> > > > > > > > >
> > > > > > > > >  3. Firmware scheduling with a high queue count. In this case, you don't
> > > > > > > > > want the kernel scheduling anything. Just throw it at the firmware and let
> > > > > > > > > it go brrrrr.  If we ever run out of queues (unlikely), the kernel can
> > > > > > > > > temporarily pause some low-priority contexts and do some juggling or,
> > > > > > > > > frankly, just fail userspace queue creation and tell the user to close some
> > > > > > > > > windows.
> > > > > > > > >
> > > > > > > > > The existence of this 2nd class is a bit annoying but it's where we are. I
> > > > > > > > > think it's worth recognizing that Xe and panfrost are in different places
> > > > > > > > > here and will require different designs. For Xe, we really are just using
> > > > > > > > > drm/scheduler as a front-end and the firmware does all the real scheduling.
> > > > > > > > >
> > > > > > > > > How do we deal with class 2? That's an interesting question.  We may
> > > > > > > > > eventually want to break that off into a separate discussion and not litter
> > > > > > > > > the Xe thread but let's keep going here for a bit.  I think there are some
> > > > > > > > > pretty reasonable solutions but they're going to look a bit different.
> > > > > > > > >
> > > > > > > > > The way I did this for Xe with execlists was to keep the 1:1:1 mapping
> > > > > > > > > between drm_gpu_scheduler, drm_sched_entity, and userspace xe_engine.
> > > > > > > > > Instead of feeding a GuC ring, though, it would feed a fixed-size execlist
> > > > > > > > > ring and then there was a tiny kernel which operated entirely in IRQ
> > > > > > > > > handlers which juggled those execlists by smashing HW registers.  For
> > > > > > > > > Panfrost, I think we want something slightly different but can borrow some
> > > > > > > > > ideas here.  In particular, have the schedulers feed kernel-side SW queues
> > > > > > > > > (they can even be fixed-size if that helps) and then have a kthread which
> > > > > > > > > juggles those feeds the limited FW queues.  In the case where you have few
> > > > > > > > > enough active contexts to fit them all in FW, I do think it's best to have
> > > > > > > > > them all active in FW and let it schedule. But with only 31, you need to be
> > > > > > > > > able to juggle if you run out.      
> > > > > > > >
> > > > > > > > That's more or less what I do right now, except I don't use the
> > > > > > > > drm_sched front-end to handle deps or queue jobs (at least not yet). The
> > > > > > > > kernel-side timeslice-based scheduler juggling with runnable queues
> > > > > > > > (queues with pending jobs that are not yet resident on a FW slot)
> > > > > > > > uses a dedicated ordered-workqueue instead of a thread, with scheduler
> > > > > > > > ticks being handled with a delayed-work (tick happening every X
> > > > > > > > milliseconds when queues are waiting for a slot). It all seems very
> > > > > > > > HW/FW-specific though, and I think it's a bit premature to try to
> > > > > > > > generalize that part, but the dep-tracking logic implemented by
> > > > > > > > drm_sched looked like something I could easily re-use, hence my
> > > > > > > > interest in Xe's approach.      
> > > > > > >
> > > > > > > So another option for these few fw queue slots schedulers would be to
> > > > > > > treat them as vram and enlist ttm.
> > > > > > >
> > > > > > > Well maybe more enlist ttm and less treat them like vram, but ttm can
> > > > > > > handle idr (or xarray or whatever you want) and then help you with all the
> > > > > > > pipelining (and the drm_sched then with sorting out dependencies). If you
> > > > > > > then also preferentially "evict" low-priority queus you pretty much have
> > > > > > > the perfect thing.
> > > > > > >
> > > > > > > Note that GuC with sriov splits up the id space and together with some
> > > > > > > restrictions due to multi-engine contexts media needs might also need this
> > > > > > > all.
> > > > > > >
> > > > > > > If you're balking at the idea of enlisting ttm just for fw queue
> > > > > > > management, amdgpu has a shoddy version of id allocation for their vm/tlb
> > > > > > > index allocation. Might be worth it to instead lift that into some sched
> > > > > > > helper code.      
> > > > > >
> > > > > > Would you mind pointing me to the amdgpu code you're mentioning here?
> > > > > > Still have a hard time seeing what TTM has to do with scheduling, but I
> > > > > > also don't know much about TTM, so I'll keep digging.      
> > > > > 
> > > > > ttm is about moving stuff in&out of a limited space and gives you some
> > > > > nice tooling for pipelining it all. It doesn't care whether that space
> > > > > is vram or some limited id space. vmwgfx used ttm as an id manager
> > > > > iirc.    
> > > > 
> > > > Ok.
> > > >     
> > > > >     
> > > > > > > Either way there's two imo rather solid approaches available to sort this
> > > > > > > out. And once you have that, then there shouldn't be any big difference in
> > > > > > > driver design between fw with defacto unlimited queue ids, and those with
> > > > > > > severe restrictions in number of queues.      
> > > > > >
> > > > > > Honestly, I don't think there's much difference between those two cases
> > > > > > already. There's just a bunch of additional code to schedule queues on
> > > > > > FW slots for the limited-number-of-FW-slots case, which, right now, is
> > > > > > driver specific. The job queuing front-end pretty much achieves what
> > > > > > drm_sched does already: queuing job to entities, checking deps,
> > > > > > submitting job to HW (in our case, writing to the command stream ring
> > > > > > buffer). Things start to differ after that point: once a scheduling
> > > > > > entity has pending jobs, we add it to one of the runnable queues (one
> > > > > > queue per prio) and kick the kernel-side timeslice-based scheduler to
> > > > > > re-evaluate, if needed.
> > > > > >
> > > > > > I'm all for using generic code when it makes sense, even if that means
> > > > > > adding this common code when it doesn't exists, but I don't want to be
> > > > > > dragged into some major refactoring that might take years to land.
> > > > > > Especially if pancsf is the first
> > > > > > FW-assisted-scheduler-with-few-FW-slot driver.      
> > > > > 
> > > > > I don't see where there's a major refactoring that you're getting dragged into?    
> > > > 
> > > > Oh, no, I'm not saying this is the case just yet, just wanted to make
> > > > sure we're on the same page :-).
> > > >     
> > > > > 
> > > > > Yes there's a huge sprawling discussion right now, but I think that's
> > > > > just largely people getting confused.    
> > > > 
> > > > I definitely am :-).
> > > >     
> > > > > 
> > > > > Wrt the actual id assignment stuff, in amdgpu at least it's few lines
> > > > > of code. See the amdgpu_vmid_grab stuff for the simplest starting
> > > > > point.    
> > > > 
> > > > Ok, thanks for the pointers. I'll have a look and see how I could use
> > > > that. I guess that's about getting access to the FW slots with some
> > > > sort of priority+FIFO ordering guarantees given by TTM. If that's the
> > > > case, I'll have to think about it, because that's a major shift from
> > > > what we're doing now, and I'm afraid this could lead to starving
> > > > non-resident entities if all resident entities keep receiving new jobs
> > > > to execute. Unless we put some sort of barrier when giving access to a
> > > > slot, so we evict the entity when it's done executing the stuff it had
> > > > when it was given access to this slot. But then, again, there are other
> > > > constraints to take into account for the Arm Mali CSF case:
> > > > 
> > > > - it's more efficient to update all FW slots at once, because each
> > > >   update of a slot might require updating priorities of the other slots
> > > >   (FW mandates unique slot priorities, and those priorities depend on
> > > >   the entity priority/queue-ordering)
> > > > - context/FW slot switches have a non-negligible cost (FW needs to
> > > >   suspend the context and save the state every time there such a
> > > >   switch), so, limiting the number of FW slot updates might prove
> > > >   important    
> > > 
> > > I frankly think you're overworrying. When you have 31+ contexts running at
> > > the same time, you have bigger problems. At that point there's two
> > > use-cases:
> > > 1. system is overloaded, the user will reach for reset button anyway
> > > 2. temporary situation, all you have to do is be roughly fair enough to get
> > >    through it before case 1 happens.
> > >  
> > > Trying to write a perfect scheduler for this before we have actual
> > > benchmarks that justify the effort seems like pretty serious overkill.
> > > That's why I think the simplest solution is the one we should have:
> > > 
> > > - drm/sched frontend. If you get into slot exhaustion that alone will
> > >   ensure enough fairness  
> > 
> > We're talking about the CS ring buffer slots here, right?
> > 
> > > 
> > > - LRU list of slots, with dma_fence so you can pipeline/batch up changes
> > >   as needed (but I honestly wouldn't worry about the batching before
> > >   you've shown an actual need for this in some benchmark/workload, even
> > >   piglit shouldn't have this many things running concurrently I think, you
> > >   don't have that many cpu cores). Between drm/sched and the lru you will
> > >   have an emergent scheduler that cycles through all runnable gpu jobs.
> > > 
> > > - If you want to go fancy, have eviction tricks like skipping currently
> > >   still active gpu context with higher priority than the one that you need
> > >   to find a slot for.
> > > 
> > > - You don't need time slicing in this, not even for compute. compute is
> > >   done with preempt context fences, if you give them a minimum scheduling
> > >   quanta you'll have a very basic round robin scheduler as an emergent
> > >   thing.
> > > 
> > > Any workload were it matters will be scheduled by the fw directly, with
> > > drm/sched only being the dma_fence dependcy sorter. My take is that if you
> > > spend more than a hundred or so lines with slot allocation logic
> > > (excluding the hw code to load/unload a slot) you're probably doing some
> > > serious overengineering.  
> > 
> > Let me see if I got this right:
> > 
> > - we still keep a 1:1 drm_gpu_scheduler:drm_sched_entity approach,
> >   where hw_submission_limit == available_slots_in_ring_buf
> > - when ->run_job() is called, we write the RUN_JOB() instruction
> >   sequence to the next available ringbuf slot and queue the entity to
> >   the FW-slot queue
> >   * if a slot is directly available, we program the slot directly
> >   * if no slots are available, but some slots are done with the jobs
> >     they were given (last job fence signaled), we evict the LRU entity
> >     (possibly taking priority into account) and use this slot for the
> >     new entity
> >   * if no slots are available and all currently assigned slots
> >     contain busy entities, we queue the entity to a pending list
> >     (possibly one list per prio)

You could also handle this in ->prepare_job, which is called after all the
default fences have signalled. That allows you to put the "wait for a
previous job to finnish/unload" behind a dma_fence, which is how (I think
at least) you can get the round-robin emergent behaviour: If there's no
idle slot, you just pick all the fences from the currently busy job you
want to steal the slot from (with priority and lru taken into account),
let the scheduler wait for that to finnish, and then it'll call your
run_job when the slot is already available.

Also if you do the allocation in ->prepare_job with dma_fence and not
run_job, then I think can sort out fairness issues (if they do pop up) in
the drm/sched code instead of having to think about this in each driver.
Few fw sched slots essentially just make fw scheduling unfairness more
prominent than with others, but I don't think it's fundamentally something
else really.

If every ctx does that and the lru isn't too busted, they should then form
a nice orderly queue and cycle through the fw scheduler, while still being
able to get some work done. It's essentially the exact same thing that
happens with ttm vram eviction, when you have a total working set where
each process fits in vram individually, but in total they're too big and
you need to cycle things through.

> > I'll need to make sure this still works with the concept of group (it's
> > not a single queue we schedule, it's a group of queues, meaning that we
> > have N fences to watch to determine if the slot is busy or not, but
> > that should be okay).
> 
> Oh, there's one other thing I forgot to mention: the FW scheduler is
> not entirely fair, it does take the slot priority (which has to be
> unique across all currently assigned slots) into account when
> scheduling groups. So, ideally, we'd want to rotate group priorities
> when they share the same drm_sched_priority (probably based on the
> position in the LRU).

Hm that will make things a bit more fun I guess, especially with your
constraint to not update this too often. How strict is that priority
difference? If it's a lot, we might need to treat this more like execlist
and less like a real fw scheduler ...
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
