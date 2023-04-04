Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF066D6DB1
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 22:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1364B10E79D;
	Tue,  4 Apr 2023 20:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FD7010E79D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 20:12:12 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id y184so25125093oiy.8
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 13:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680639131;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x5/KGj/UhjeVyGQaKIkD6g8841/3YNDIcs9ccW1IVew=;
 b=jcsRiQnRVnunC9BkzQn6UYKObo48HUyPl4N2seQpPdepwInWiOGJM9bmNlJs7ujzgI
 TXYffPwpM53QTchgcEou4NqEawuobue8Cyxvj6FFT+r26/EhF9htRU8CHzVF5Y1ypfBz
 6PKMDVpZ/8D9amlz8r5EUicQkHfmWgomCVsLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680639131;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x5/KGj/UhjeVyGQaKIkD6g8841/3YNDIcs9ccW1IVew=;
 b=x8Q0DQ590lRwyULAj5o5PdNE2yb0ZD4y2v/ywp/MAIfnDDevq0+ZxgZAC7ZUI3b+Cs
 jxoWl1hP2C4ZLNLDKWhPbHC0ov8pBgdKfqAb+9dEpV9JEvbdRsB7DOXcZWFBlyfjQ+oB
 +4DATKNsrDEZ7KbQN8Yy9AUSSq07o5XF4oft/g8FmSEUo8ArUIJkfgHoaaFO3llxb6F6
 LX4gBZQr2RtZUO+B/yrDe/9vfOl0LZuSfQdmFhL6FjgcB4M/cqVYKYqZaxyjmnTmqwxn
 juizxWQmO7d+C5tF3UbIJs9v3UOZ1/JP7LyLYoENRIIlW/OiOCn1WcbgN/kU+lo9gMKJ
 HKxA==
X-Gm-Message-State: AAQBX9fALz2gH7uBMg5WfRaBebRzojM6JRUnXB5aaR8A72fdaMbk+Vx4
 shXJQ+CX7WApVHDcCQHpd0sYibGE2aQ0OJ+JqjzGJg==
X-Google-Smtp-Source: AKy350aFUxWs13UaixQaY/8/oXz9M2cyNatT0c+IuI0G4EtYSLsffQqHO6LzVbNov/PdSfQ8ednN4AoRPxs/un7KWZc=
X-Received: by 2002:a05:6808:280c:b0:386:bc3c:408b with SMTP id
 et12-20020a056808280c00b00386bc3c408bmr1208784oib.8.1680639131030; Tue, 04
 Apr 2023 13:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-9-matthew.brost@intel.com>
 <e5eb5ab0-8e51-389c-34ae-7c6004f4b1ba@amd.com>
 <f7b3b70b-c798-b09e-210c-f84eaafd3251@linux.intel.com>
 <5b2e6a78-b743-028c-f54d-af38c130164a@amd.com>
 <CAKMK7uGeBJRQ4dKfY=wRvw-o7qdzurFHzUymxGsLWr4Y_nQPAA@mail.gmail.com>
 <ZCyCpyFmteD0uZ3v@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZCyCpyFmteD0uZ3v@DUT025-TGLU.fm.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 4 Apr 2023 22:11:59 +0200
Message-ID: <CAKMK7uG7C9or+L4sS1e7u14wbXt2=0-wGnLxjZ3uSGvM7-Vd4g@mail.gmail.com>
Subject: Re: [RFC PATCH 08/10] dma-buf/dma-fence: Introduce long-running
 completion fences
To: Matthew Brost <matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 airlied@linux.ie, lina@asahilina.net, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, boris.brezillon@collabora.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 4 Apr 2023 at 22:04, Matthew Brost <matthew.brost@intel.com> wrote:
>
> On Tue, Apr 04, 2023 at 09:00:59PM +0200, Daniel Vetter wrote:
> > On Tue, 4 Apr 2023 at 15:10, Christian K=C3=B6nig <christian.koenig@amd=
.com> wrote:
> > >
> > > Am 04.04.23 um 14:54 schrieb Thomas Hellstr=C3=B6m:
> > > > Hi, Christian,
> > > >
> > > > On 4/4/23 11:09, Christian K=C3=B6nig wrote:
> > > >> Am 04.04.23 um 02:22 schrieb Matthew Brost:
> > > >>> From: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > >>>
> > > >>> For long-running workloads, drivers either need to open-code comp=
letion
> > > >>> waits, invent their own synchronization primitives or internally =
use
> > > >>> dma-fences that do not obey the cross-driver dma-fence protocol, =
but
> > > >>> without any lockdep annotation all these approaches are error pro=
ne.
> > > >>>
> > > >>> So since for example the drm scheduler uses dma-fences it is
> > > >>> desirable for
> > > >>> a driver to be able to use it for throttling and error handling a=
lso
> > > >>> with
> > > >>> internal dma-fences tha do not obey the cros-driver dma-fence pro=
tocol.
> > > >>>
> > > >>> Introduce long-running completion fences in form of dma-fences, a=
nd add
> > > >>> lockdep annotation for them. In particular:
> > > >>>
> > > >>> * Do not allow waiting under any memory management locks.
> > > >>> * Do not allow to attach them to a dma-resv object.
> > > >>> * Introduce a new interface for adding callbacks making the helpe=
r
> > > >>> adding
> > > >>>    a callback sign off on that it is aware that the dma-fence may=
 not
> > > >>>    complete anytime soon. Typically this will be the scheduler ch=
aining
> > > >>>    a new long-running fence on another one.
> > > >>
> > > >> Well that's pretty much what I tried before:
> > > >> https://lwn.net/Articles/893704/
> > > >>
> > > >> And the reasons why it was rejected haven't changed.
> > > >>
> > > >> Regards,
> > > >> Christian.
> > > >>
> > > > Yes, TBH this was mostly to get discussion going how we'd best tack=
le
> > > > this problem while being able to reuse the scheduler for long-runni=
ng
> > > > workloads.
> > > >
> > > > I couldn't see any clear decision on your series, though, but one m=
ain
> > > > difference I see is that this is intended for driver-internal use
> > > > only. (I'm counting using the drm_scheduler as a helper for
> > > > driver-private use). This is by no means a way to try tackle the
> > > > indefinite fence problem.
> > >
> > > Well this was just my latest try to tackle this, but essentially the
> > > problems are the same as with your approach: When we express such
> > > operations as dma_fence there is always the change that we leak that
> > > somewhere.
> > >
> > > My approach of adding a flag noting that this operation is dangerous =
and
> > > can't be synced with something memory management depends on tried to
> > > contain this as much as possible, but Daniel still pretty clearly
> > > rejected it (for good reasons I think).
> >
> > Yeah I still don't like dma_fence that somehow have totally different
> > semantics in that critical piece of "will it complete or will it
> > deadlock?" :-)
>
> Not going to touch LR dma-fences in this reply, I think we can continue
> the LR fence discussion of the fork of this thread I just responded to.
> Have a response the preempt fence discussion below.
>
> > >
> > > >
> > > > We could ofc invent a completely different data-type that abstracts
> > > > the synchronization the scheduler needs in the long-running case, o=
r
> > > > each driver could hack something up, like sleeping in the
> > > > prepare_job() or run_job() callback for throttling, but those waits
> > > > should still be annotated in one way or annotated one way or anothe=
r
> > > > (and probably in a similar way across drivers) to make sure we don'=
t
> > > > do anything bad.
> > > >
> > > >  So any suggestions as to what would be the better solution here wo=
uld
> > > > be appreciated.
> > >
> > > Mhm, do we really the the GPU scheduler for that?
> > >
> > > I mean in the 1 to 1 case  you basically just need a component which
> > > collects the dependencies as dma_fence and if all of them are fulfill=
ed
> > > schedules a work item.
> > >
> > > As long as the work item itself doesn't produce a dma_fence it can th=
en
> > > still just wait for other none dma_fence dependencies.
> >
> > Yeah that's the important thing, for long-running jobs dependencies as
> > dma_fence should be totally fine. You're just not allowed to have any
> > outgoing dma_fences at all (except the magic preemption fence).
> >
> > > Then the work function could submit the work and wait for the result.
> > >
> > > The work item would then pretty much represent what you want, you can
> > > wait for it to finish and pass it along as long running dependency.
> > >
> > > Maybe give it a funky name and wrap it up in a structure, but that's
> > > basically it.
> >
> > Like do we need this? If the kernel ever waits for a long-running
> > compute job to finnish I'd call that a bug. Any functional
> > dependencies between engines or whatever are userspace's problem only,
> > which it needs to sort out using userspace memory fences.
> >
> > The only things the kernel needs are some way to track dependencies as
> > dma_fence (because memory management move the memory away and we need
> > to move it back in, ideally pipelined). And it needs the special
> > preempt fence (if we don't have pagefaults) so that you have a fence
> > to attach to all the dma_resv for memory management purposes. Now the
> > scheduler already has almost all the pieces (at least if we assume
> > there's some magic fw which time-slices these contexts on its own),
> > and we just need a few minimal changes:
> > - allowing the scheduler to ignore the completion fence and just
> > immediately push the next "job" in if its dependencies are ready
> > - maybe minimal amounts of scaffolding to handle the preemption
> > dma_fence because that's not entirely trivial. I think ideally we'd
> > put that into drm_sched_entity since you can only ever have one active
> > preempt dma_fence per gpu ctx/entity.
> >
>
> Yep, preempt fence is per entity in Xe (xe_engine). We install these
> into the VM and all external BOs mapped in the VM dma-resv slots.
> Wondering if we can make all of this very generic between the DRM
> scheduler + GPUVA...

I think if the drm/sched just takes care of the preempt ctx dma_fence
(and still stores it in the same slot in the drm_sched_job struct like
a end-of-batch dma_fence job would), and then the gpuva shared code
just has functions to smash these into the right dma_resv structures
then you have all the pieces. Maybe for a bit more flexibility the
gpuva code takes dma_fence and not directly the drm_sched_job, but
maybe even that level of integration makes sense (but imo optional, a
bit of driver glue code is fine).

Yeah that's roughly what I think we should at least aim for since
there's quiet a few drivers in-flight that all need these pieces (more
or less at least).
-Daniel
>
> Matt
>
> > None of this needs a dma_fence_is_lr anywhere at all.
> >
> > Of course there's the somewhat related issue of "how do we transport
> > these userspace memory fences around from app to compositor", and
> > that's a lot more gnarly. I still don't think dma_fence_is_lr is
> > anywhere near what the solution should look like for that.
> > -Daniel
> >
> >
> > > Regards,
> > > Christian.
> > >
> > > >
> > > > Thanks,
> > > >
> > > > Thomas
> > > >
> > > >
> > > >
> > > >
> > > >
> > >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
