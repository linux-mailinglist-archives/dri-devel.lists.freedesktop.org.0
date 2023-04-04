Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB406D6E1C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 22:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A81E10E1CF;
	Tue,  4 Apr 2023 20:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C4110E7B0
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 20:32:03 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id h8so135668704ede.8
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 13:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680640321; x=1683232321;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gFAkPti6LO7XjxUbtq+pTx5uT8O/fnJpKhggNzsNmjw=;
 b=AT2ABsecOWNjTer2Gwsjva8bnYUGQG4qE/HbntzdnhNxba9naJrkaGZFiUcX0KsLuB
 V020wjNsocs6+NhC6L6A9gsmmDMw/UR//r+cvPY54RrpD7ozb0NcVv+Ss/G0nAtGZEu5
 fDCQ3BwLeh2+c8OIVK2L5VrzuNsIMnFc8XhQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680640321; x=1683232321;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gFAkPti6LO7XjxUbtq+pTx5uT8O/fnJpKhggNzsNmjw=;
 b=yM/uue3UnfbAd3pN+vrAryVzsxWJbE/B1ARkkjvC/oUvlkx6A4b46FqUHa4bdfvC9Z
 bElQHtseTOIx4dqfqsSPMFvGsholtYntAKXOPLLw+Hr1PMZ0tZqfFEC0Auhncub59MKb
 xZq3Sy1X9PRLJPYiA6XgDfaWNQ8hZTs4aX9xQvV2LTH9RXc2m6Nd6uIS89BERG48CBNJ
 JPwcR9yIJrXx1zmSsp/EaFydB6GU0DQWHCubTQQqJCfXiu5sa7Qja/fg90hErw3zNmmb
 ZqUvOCTmP4Dr/HYCFFngGxjVfCs6OuZP9HNQkJPQyG9+yL9NI6s4BcLeiRsl6OU0U7t1
 ndSg==
X-Gm-Message-State: AAQBX9dNKokYD/DXnV+P3XwOeav4XWJcOcuGsYqPwLbNOiIF1UfrBFXs
 2V02pwy8H7u4RJKtAMqPZn7E9Y0KPWw2+iheU14=
X-Google-Smtp-Source: AKy350YTL45ktIBIchDk7HGhB6EBy/1Hwpk8CCeUzpJBolcv1Xfe8iLdg9xlZutWY+7kuE8leNiRGg==
X-Received: by 2002:a05:6402:524e:b0:4fd:2978:d80 with SMTP id
 t14-20020a056402524e00b004fd29780d80mr77389edd.1.1680640321156; 
 Tue, 04 Apr 2023 13:32:01 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 a65-20020a509ec7000000b004fbf6b35a56sm6402632edf.76.2023.04.04.13.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 13:32:00 -0700 (PDT)
Date: Tue, 4 Apr 2023 22:31:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [RFC PATCH 08/10] dma-buf/dma-fence: Introduce long-running
 completion fences
Message-ID: <ZCyJPvlH3U4lho6l@phenom.ffwll.local>
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-9-matthew.brost@intel.com>
 <e5eb5ab0-8e51-389c-34ae-7c6004f4b1ba@amd.com>
 <f7b3b70b-c798-b09e-210c-f84eaafd3251@linux.intel.com>
 <5b2e6a78-b743-028c-f54d-af38c130164a@amd.com>
 <CAKMK7uGeBJRQ4dKfY=wRvw-o7qdzurFHzUymxGsLWr4Y_nQPAA@mail.gmail.com>
 <ZCyCpyFmteD0uZ3v@DUT025-TGLU.fm.intel.com>
 <CAKMK7uG7C9or+L4sS1e7u14wbXt2=0-wGnLxjZ3uSGvM7-Vd4g@mail.gmail.com>
 <ZCyGWXmQ7q2ZMtID@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCyGWXmQ7q2ZMtID@DUT025-TGLU.fm.intel.com>
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
Cc: robdclark@chromium.org,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 airlied@linux.ie, lina@asahilina.net, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, boris.brezillon@collabora.com,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 04, 2023 at 08:19:37PM +0000, Matthew Brost wrote:
> On Tue, Apr 04, 2023 at 10:11:59PM +0200, Daniel Vetter wrote:
> > On Tue, 4 Apr 2023 at 22:04, Matthew Brost <matthew.brost@intel.com> wrote:
> > >
> > > On Tue, Apr 04, 2023 at 09:00:59PM +0200, Daniel Vetter wrote:
> > > > On Tue, 4 Apr 2023 at 15:10, Christian König <christian.koenig@amd.com> wrote:
> > > > >
> > > > > Am 04.04.23 um 14:54 schrieb Thomas Hellström:
> > > > > > Hi, Christian,
> > > > > >
> > > > > > On 4/4/23 11:09, Christian König wrote:
> > > > > >> Am 04.04.23 um 02:22 schrieb Matthew Brost:
> > > > > >>> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > > >>>
> > > > > >>> For long-running workloads, drivers either need to open-code completion
> > > > > >>> waits, invent their own synchronization primitives or internally use
> > > > > >>> dma-fences that do not obey the cross-driver dma-fence protocol, but
> > > > > >>> without any lockdep annotation all these approaches are error prone.
> > > > > >>>
> > > > > >>> So since for example the drm scheduler uses dma-fences it is
> > > > > >>> desirable for
> > > > > >>> a driver to be able to use it for throttling and error handling also
> > > > > >>> with
> > > > > >>> internal dma-fences tha do not obey the cros-driver dma-fence protocol.
> > > > > >>>
> > > > > >>> Introduce long-running completion fences in form of dma-fences, and add
> > > > > >>> lockdep annotation for them. In particular:
> > > > > >>>
> > > > > >>> * Do not allow waiting under any memory management locks.
> > > > > >>> * Do not allow to attach them to a dma-resv object.
> > > > > >>> * Introduce a new interface for adding callbacks making the helper
> > > > > >>> adding
> > > > > >>>    a callback sign off on that it is aware that the dma-fence may not
> > > > > >>>    complete anytime soon. Typically this will be the scheduler chaining
> > > > > >>>    a new long-running fence on another one.
> > > > > >>
> > > > > >> Well that's pretty much what I tried before:
> > > > > >> https://lwn.net/Articles/893704/
> > > > > >>
> > > > > >> And the reasons why it was rejected haven't changed.
> > > > > >>
> > > > > >> Regards,
> > > > > >> Christian.
> > > > > >>
> > > > > > Yes, TBH this was mostly to get discussion going how we'd best tackle
> > > > > > this problem while being able to reuse the scheduler for long-running
> > > > > > workloads.
> > > > > >
> > > > > > I couldn't see any clear decision on your series, though, but one main
> > > > > > difference I see is that this is intended for driver-internal use
> > > > > > only. (I'm counting using the drm_scheduler as a helper for
> > > > > > driver-private use). This is by no means a way to try tackle the
> > > > > > indefinite fence problem.
> > > > >
> > > > > Well this was just my latest try to tackle this, but essentially the
> > > > > problems are the same as with your approach: When we express such
> > > > > operations as dma_fence there is always the change that we leak that
> > > > > somewhere.
> > > > >
> > > > > My approach of adding a flag noting that this operation is dangerous and
> > > > > can't be synced with something memory management depends on tried to
> > > > > contain this as much as possible, but Daniel still pretty clearly
> > > > > rejected it (for good reasons I think).
> > > >
> > > > Yeah I still don't like dma_fence that somehow have totally different
> > > > semantics in that critical piece of "will it complete or will it
> > > > deadlock?" :-)
> > >
> > > Not going to touch LR dma-fences in this reply, I think we can continue
> > > the LR fence discussion of the fork of this thread I just responded to.
> > > Have a response the preempt fence discussion below.
> > >
> > > > >
> > > > > >
> > > > > > We could ofc invent a completely different data-type that abstracts
> > > > > > the synchronization the scheduler needs in the long-running case, or
> > > > > > each driver could hack something up, like sleeping in the
> > > > > > prepare_job() or run_job() callback for throttling, but those waits
> > > > > > should still be annotated in one way or annotated one way or another
> > > > > > (and probably in a similar way across drivers) to make sure we don't
> > > > > > do anything bad.
> > > > > >
> > > > > >  So any suggestions as to what would be the better solution here would
> > > > > > be appreciated.
> > > > >
> > > > > Mhm, do we really the the GPU scheduler for that?
> > > > >
> > > > > I mean in the 1 to 1 case  you basically just need a component which
> > > > > collects the dependencies as dma_fence and if all of them are fulfilled
> > > > > schedules a work item.
> > > > >
> > > > > As long as the work item itself doesn't produce a dma_fence it can then
> > > > > still just wait for other none dma_fence dependencies.
> > > >
> > > > Yeah that's the important thing, for long-running jobs dependencies as
> > > > dma_fence should be totally fine. You're just not allowed to have any
> > > > outgoing dma_fences at all (except the magic preemption fence).
> > > >
> > > > > Then the work function could submit the work and wait for the result.
> > > > >
> > > > > The work item would then pretty much represent what you want, you can
> > > > > wait for it to finish and pass it along as long running dependency.
> > > > >
> > > > > Maybe give it a funky name and wrap it up in a structure, but that's
> > > > > basically it.
> > > >
> > > > Like do we need this? If the kernel ever waits for a long-running
> > > > compute job to finnish I'd call that a bug. Any functional
> > > > dependencies between engines or whatever are userspace's problem only,
> > > > which it needs to sort out using userspace memory fences.
> > > >
> > > > The only things the kernel needs are some way to track dependencies as
> > > > dma_fence (because memory management move the memory away and we need
> > > > to move it back in, ideally pipelined). And it needs the special
> > > > preempt fence (if we don't have pagefaults) so that you have a fence
> > > > to attach to all the dma_resv for memory management purposes. Now the
> > > > scheduler already has almost all the pieces (at least if we assume
> > > > there's some magic fw which time-slices these contexts on its own),
> > > > and we just need a few minimal changes:
> > > > - allowing the scheduler to ignore the completion fence and just
> > > > immediately push the next "job" in if its dependencies are ready
> > > > - maybe minimal amounts of scaffolding to handle the preemption
> > > > dma_fence because that's not entirely trivial. I think ideally we'd
> > > > put that into drm_sched_entity since you can only ever have one active
> > > > preempt dma_fence per gpu ctx/entity.
> > > >
> > >
> > > Yep, preempt fence is per entity in Xe (xe_engine). We install these
> > > into the VM and all external BOs mapped in the VM dma-resv slots.
> > > Wondering if we can make all of this very generic between the DRM
> > > scheduler + GPUVA...
> > 
> > I think if the drm/sched just takes care of the preempt ctx dma_fence
> > (and still stores it in the same slot in the drm_sched_job struct like
> > a end-of-batch dma_fence job would), and then the gpuva shared code
> > just has functions to smash these into the right dma_resv structures
> > then you have all the pieces. Maybe for a bit more flexibility the
> > gpuva code takes dma_fence and not directly the drm_sched_job, but
> > maybe even that level of integration makes sense (but imo optional, a
> > bit of driver glue code is fine).
> > 
> > Yeah that's roughly what I think we should at least aim for since
> > there's quiet a few drivers in-flight that all need these pieces (more
> > or less at least).
> 
> That is very close to what I'm thinking too, we want to tackle userptr +
> GPUVA too, think that will be next but can add this to the list of
> things to do.

I discussed userptr+gpuva a bit with Rodrigo (and maybe Thomas H not sure
anymore) and it sounded a bit like that's maybe a bridge too far. At least
until we have some other drivers that also need that combo. But can't hurt
to at least think how it would ideally integrate from xe's pov.
-Daniel

> 
> Matt
> 
> > -Daniel
> > >
> > > Matt
> > >
> > > > None of this needs a dma_fence_is_lr anywhere at all.
> > > >
> > > > Of course there's the somewhat related issue of "how do we transport
> > > > these userspace memory fences around from app to compositor", and
> > > > that's a lot more gnarly. I still don't think dma_fence_is_lr is
> > > > anywhere near what the solution should look like for that.
> > > > -Daniel
> > > >
> > > >
> > > > > Regards,
> > > > > Christian.
> > > > >
> > > > > >
> > > > > > Thanks,
> > > > > >
> > > > > > Thomas
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > >
> > > >
> > > >
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> > 
> > 
> > 
> > -- 
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
