Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EED6D7CEB
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 14:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C383D10E940;
	Wed,  5 Apr 2023 12:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1B710E940
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 12:46:03 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-947a47eb908so53935166b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 05:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680698761;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=X2kR6Oti+ds5h6yx5UTqifJPwTP5PcKebh4PDgKQAAY=;
 b=Q2NRWFiBLF2l+o19ZkfMqfCQ9fWEHdwnP1dBg9Oc7K8fY3aMQ3MsLCzr3EfP3ad3AM
 vaMQMFtQHgzJJ9Vxt9QQEcZsJY6CafgBUi5B7F+N8jDS/J7G1DdrnJS6xKC2v7D2N11J
 KzZWM45fU0NvF/Bteq+dkNWzVrdGNVbV1udGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680698761;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X2kR6Oti+ds5h6yx5UTqifJPwTP5PcKebh4PDgKQAAY=;
 b=rtmpXJ+C2BHVgmwbz9HGTb3McYSkrNsdZRnYgcTzrUc1e4uCb9/zi+TYhMpkQX+uY9
 J2plUtlj0lqfMnPAU3069Q1dqyJQ6klf9Y0VV5emuVtvAehwqXwkWPkOHjE7ObnBWt6s
 wMWc0+SQGSxWtBQgIncqBZtsiC+CQMIy3eJuNMkw9TIYvdQ3QsSHu/Mwv1FDOv/T3Nn5
 sxrArl3hR6+xFPFbNmU32wyMefgp2jy4zHM77/Avha4+7TrWfE66SX/k5sQZDeiBWLNt
 pqZeR09P+Ny4RGYJFQkmDX3kVcNelxfZbASbnc5ss+S4wwRnLAF+nCv1z6vq3bhbCagF
 AHQQ==
X-Gm-Message-State: AAQBX9e/fG43dU1FiTLu/v9eA75+fZANfz6i+Nox6I2lokqL8Q/p2v98
 s8B2Ga4JDki/cwuSXFp9wceCyw==
X-Google-Smtp-Source: AKy350YgQM/syQAb1MJVhjfKkEfEIBAunEcMLjyUZKA0toppZ0JEqQ54GBzJG++BoFSWQUzwRwsXMw==
X-Received: by 2002:a17:906:13:b0:8f0:ba09:4abe with SMTP id
 19-20020a170906001300b008f0ba094abemr2742203eja.2.1680698761063; 
 Wed, 05 Apr 2023 05:46:01 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 d3-20020a170906544300b009476309c1d9sm7270622ejp.125.2023.04.05.05.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 05:46:00 -0700 (PDT)
Date: Wed, 5 Apr 2023 14:45:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [RFC PATCH 08/10] dma-buf/dma-fence: Introduce long-running
 completion fences
Message-ID: <ZC1thkzodefVK6XU@phenom.ffwll.local>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-9-matthew.brost@intel.com>
 <e5eb5ab0-8e51-389c-34ae-7c6004f4b1ba@amd.com>
 <f7b3b70b-c798-b09e-210c-f84eaafd3251@linux.intel.com>
 <5b2e6a78-b743-028c-f54d-af38c130164a@amd.com>
 <16a3a3fd-47c7-d74d-4835-9438ef8d2635@shipmail.org>
 <ZCx0P7GwLh2yOVR4@DUT025-TGLU.fm.intel.com>
 <ZCx5wGTA3RCZGjA4@phenom.ffwll.local>
 <cece14bb-d3c5-3772-855e-bac0bb7766d7@linux.intel.com>
 <c57a9fcc-7721-9958-38f5-b3a1b0b56772@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c57a9fcc-7721-9958-38f5-b3a1b0b56772@amd.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 airlied@linux.ie, lina@asahilina.net,
 Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 robdclark@chromium.org, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 05, 2023 at 02:39:35PM +0200, Christian König wrote:
> Am 05.04.23 um 14:35 schrieb Thomas Hellström:
> > Hi,
> > 
> > On 4/4/23 21:25, Daniel Vetter wrote:
> > > On Tue, Apr 04, 2023 at 07:02:23PM +0000, Matthew Brost wrote:
> > > > On Tue, Apr 04, 2023 at 08:14:01PM +0200, Thomas Hellström
> > > > (Intel) wrote:
> > > > > On 4/4/23 15:10, Christian König wrote:
> > > > > > Am 04.04.23 um 14:54 schrieb Thomas Hellström:
> > > > > > > Hi, Christian,
> > > > > > > 
> > > > > > > On 4/4/23 11:09, Christian König wrote:
> > > > > > > > Am 04.04.23 um 02:22 schrieb Matthew Brost:
> > > > > > > > > From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > > > > > > 
> > > > > > > > > For long-running workloads, drivers either need to open-code
> > > > > > > > > completion
> > > > > > > > > waits, invent their own synchronization
> > > > > > > > > primitives or internally use
> > > > > > > > > dma-fences that do not obey the cross-driver
> > > > > > > > > dma-fence protocol, but
> > > > > > > > > without any lockdep annotation all these
> > > > > > > > > approaches are error prone.
> > > > > > > > > 
> > > > > > > > > So since for example the drm scheduler uses dma-fences it is
> > > > > > > > > desirable for
> > > > > > > > > a driver to be able to use it for throttling and error
> > > > > > > > > handling also with
> > > > > > > > > internal dma-fences tha do not obey the cros-driver
> > > > > > > > > dma-fence protocol.
> > > > > > > > > 
> > > > > > > > > Introduce long-running completion fences in form of
> > > > > > > > > dma-fences, and add
> > > > > > > > > lockdep annotation for them. In particular:
> > > > > > > > > 
> > > > > > > > > * Do not allow waiting under any memory management locks.
> > > > > > > > > * Do not allow to attach them to a dma-resv object.
> > > > > > > > > * Introduce a new interface for adding callbacks making the
> > > > > > > > > helper adding
> > > > > > > > >     a callback sign off on that it is aware
> > > > > > > > > that the dma-fence may not
> > > > > > > > >     complete anytime soon. Typically this will be the
> > > > > > > > > scheduler chaining
> > > > > > > > >     a new long-running fence on another one.
> > > > > > > > Well that's pretty much what I tried before:
> > > > > > > > https://lwn.net/Articles/893704/
> > > > > > > > 
> > > > I don't think this quite the same, this explictly enforces that
> > > > we don't
> > > > break the dma-fence rules (in path of memory allocations, exported in
> > > > any way), essentially this just SW sync point reusing dma-fence the
> > > > infrastructure for signaling / callbacks. I believe your series
> > > > tried to
> > > > export these fences to user space (admittedly I haven't fully read your
> > > > series).
> > > > 
> > > > In this use case we essentially just want to flow control the ring via
> > > > the dma-scheduler + maintain a list of pending jobs so the TDR can be
> > > > used for cleanup if LR entity encounters an error. To me this seems
> > > > perfectly reasonable but I know dma-femce rules are akin to a holy war.
> > > > 
> > > > If we return NULL in run_job, now we have to be able to sink all jobs
> > > > in the backend regardless on ring space, maintain a list of jobs
> > > > pending
> > > > for cleanup after errors, and write a different cleanup path as now the
> > > > TDR doesn't work. Seems very, very silly to duplicate all of this code
> > > > when the DRM scheduler provides all of this for us. Also if we go this
> > > > route, now all drivers are going to invent ways to handle LR
> > > > jobs /w the
> > > > DRM scheduler.
> > > > 
> > > > This solution is pretty clear, mark the scheduler as LR, and don't
> > > > export any fences from the scheduler. If you try to export these fences
> > > > a blow up happens.
> > > The problem is if you mix things up. Like for resets you need all the
> > > schedulers on an engine/set-of-engines to quiescent or things get
> > > potentially hilarious. If you now have a scheduler in forever limbo, the
> > > dma_fence guarantees are right out the window.
> > > 
> > > But the issue you're having is fairly specific if it's just about
> > > ringspace. I think the dumbest fix is to just block in submit if you run
> > > out of per-ctx ringspace, and call it a day. This notion that
> > > somehow the
> > > kernel is supposed to provide a bottomless queue of anything userspace
> > > submits simply doesn't hold up in reality (as much as userspace
> > > standards
> > > committees would like it to), and as long as it doesn't have a
> > > real-world
> > > perf impact it doesn't really matter why we end up blocking in the
> > > submit
> > > ioctl. It might also be a simple memory allocation that hits a snag in
> > > page reclaim.
> > 
> > So it seems the discussion around the long-running synchronization
> > diverged a bit between threads and this thread was hijacked for
> > preempt-fences and userptr.
> > 
> > Do I understand it correctly that the recommendation from both Daniel
> > and Christian is to *not* use the drm scheduler for long-running compute
> > jobs, but track any internal dma-fence dependencies (pipelined clearing
> > or whatever) in a separate mechanism and handle unresolved dependencies
> > on other long-running jobs using -EWOULDBLOCK?
> 
> Yeah, I think that's a good summary.
> 
> If needed we could extract some scheduler functionality into separate
> components, but the fundamental problem is that to the GPU scheduler
> provides a dma_fence interface to the outside to signal job completion and
> Daniel and I seem to agree that you really don't want that.

I think I'm on something slightly different:

- For anything which semantically is not a dma_fence I agree it probably
  should be handled with EWOULDBLOCK and passed to userspace. Either with
  a submit thread or userspace memory fences. Note that in practice you
  will have a bunch of blocking left in the ioctl, stuff like mutexes or
  memory allocations when things get really tight and you end up in
  synchronous reclaim. Not any different from userspace ending up in
  synchronous reclaim due to a page fault really. Trying to shoehorn
  userspace memory fences or anything else long-running into drm/sched
  dependency handling is just way too much a can of worms.

- For the memory management dependencies, which are all dma_fence when
  pipeline, I do think pushing them through the drm/sched makes sense. It
  has all the stuff to handle that already, plus it's imo also the ideal
  place to handle the preempt-ctx dma_fence scaffolding/semantics. Which
  would give you a really neatly unified command submission interface
  since in both cases (end-of-batch and long-running) you fish the
  dma_fence you need to stuff in all the right dma_resv object (for memory
  management purpose) out of the same place: The drm_sched_job struct.

So I'm _not_ on the "do not use drm/sched for long-running jobs at all".
That doesn't make much sense to me because you'll just reinventing the
exact same dma_fence dependency handling and memory management shuffling
we already have. That seems silly.
-Daniel

> 
> Regards,
> Christian.
> 
> > 
> > Thanks,
> > Thomas
> > 
> > 
> > 
> > 
> > 
> > > > > > > > And the reasons why it was rejected haven't changed.
> > > > > > > > 
> > > > > > > > Regards,
> > > > > > > > Christian.
> > > > > > > > 
> > > > > > > Yes, TBH this was mostly to get discussion going how we'd best
> > > > > > > tackle this problem while being able to reuse the scheduler for
> > > > > > > long-running workloads.
> > > > > > > 
> > > > > > > I couldn't see any clear decision on your series, though, but one
> > > > > > > main difference I see is that this is intended for driver-internal
> > > > > > > use only. (I'm counting using the drm_scheduler as a helper for
> > > > > > > driver-private use). This is by no means a way to try tackle the
> > > > > > > indefinite fence problem.
> > > > > > Well this was just my latest try to tackle this, but essentially the
> > > > > > problems are the same as with your approach: When we express such
> > > > > > operations as dma_fence there is always the change that we leak that
> > > > > > somewhere.
> > > > > > 
> > > > > > My approach of adding a flag noting that this operation
> > > > > > is dangerous and
> > > > > > can't be synced with something memory management depends on tried to
> > > > > > contain this as much as possible, but Daniel still pretty clearly
> > > > > > rejected it (for good reasons I think).
> > > > > > 
> > > > > > > We could ofc invent a completely different data-type that abstracts
> > > > > > > the synchronization the scheduler needs in the long-running case, or
> > > > > > > each driver could hack something up, like sleeping in the
> > > > > > > prepare_job() or run_job() callback for throttling, but those waits
> > > > > > > should still be annotated in one way or annotated one way or another
> > > > > > > (and probably in a similar way across drivers) to make sure we don't
> > > > > > > do anything bad.
> > > > > > > 
> > > > > > >   So any suggestions as to what would be the better solution here
> > > > > > > would be appreciated.
> > > > > > Mhm, do we really the the GPU scheduler for that?
> > > > > > 
> > > > I think we need to solve this within the DRM scheduler one way or
> > > > another.
> > > Yeah so if we conclude that the queue really must be bottomless then I
> > > agree drm-sched should help out sort out the mess. Because I'm guessing
> > > that every driver will have this issue. But that's a big if.
> > > 
> > > I guess if we teach the drm scheduler that some jobs are fairly endless
> > > then maybe it wouldn't be too far-fetched to also teach it to wait for a
> > > previous one to finish (but not with the dma_fence that preempts,
> > > which we
> > > put into the dma_resv for memory management, but some other struct
> > > completion). The scheduler already has a concept of not stuffing too
> > > much
> > > stuff into the same queue after all, so this should fit?
> > > -Daniel
> > > 
> > > 
> > > > > > I mean in the 1 to 1 case  you basically just need a component which
> > > > > > collects the dependencies as dma_fence and if all of
> > > > > > them are fulfilled
> > > > > > schedules a work item.
> > > > > > 
> > > > > > As long as the work item itself doesn't produce a
> > > > > > dma_fence it can then
> > > > > > still just wait for other none dma_fence dependencies.
> > > > > > 
> > > > > > Then the work function could submit the work and wait for the result.
> > > > > > 
> > > > > > The work item would then pretty much represent what you want, you can
> > > > > > wait for it to finish and pass it along as long running dependency.
> > > > > > 
> > > > > > Maybe give it a funky name and wrap it up in a structure, but that's
> > > > > > basically it.
> > > > > > 
> > > > > This very much sounds like a i915_sw_fence for the
> > > > > dependency tracking and
> > > > > dma_fence_work for the actual work although it's completion fence is a
> > > > > dma_fence.
> > > > > 
> > > > Agree this does sound to i915ish as stated below one of mandates in Xe
> > > > was to use the DRM scheduler. Beyond that as someone who a submission
> > > > backend in the i915 and Xe, I love how the DRM scheduler works (single
> > > > entry point), it makes everything so much easier.
> > > > 
> > > > Matt
> > > > 
> > > > > Although that goes against the whole idea of a condition for
> > > > > merging the xe
> > > > > driver would be that we implement some sort of minimal scaffolding for
> > > > > long-running workloads in the drm scheduler, and the
> > > > > thinking behind that is
> > > > > to avoid implementing intel-specific solutions like those...
> > > > > 
> > > > > Thanks,
> > > > > 
> > > > > Thomas
> > > > > 
> > > > > 
> > > > > 
> > > > > > Regards,
> > > > > > Christian.
> > > > > > 
> > > > > > > Thanks,
> > > > > > > 
> > > > > > > Thomas
> > > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
