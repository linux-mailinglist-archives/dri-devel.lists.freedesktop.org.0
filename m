Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C216D6CC8
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 21:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9723E10E3B3;
	Tue,  4 Apr 2023 19:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5359010E3B3
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 19:01:16 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-17786581fe1so35732210fac.10
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 12:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680634875;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uol23XXK57qYdNbaundjqa6KMA/UBSxEUaBgKRpJ8Hk=;
 b=AuZXR7GBuAE3xEwahKJoIJ2SMFOGoZd/VmznHDuRZ7D9jTpcnawoqthfjsmg3161RG
 nSDKpjjVutGSFPMONVrrBzf1AC6RlxixDU5SAd+vrwjk7idrHWo/mSuJcQXsETh7MYHX
 eAuHPcv4A8UUojklXSrrjgzgoqGu+FLFYB6gA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680634875;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uol23XXK57qYdNbaundjqa6KMA/UBSxEUaBgKRpJ8Hk=;
 b=MVnOVjqRe1YIadqFFVTeOxUTctCk04pCFpQU7DTMC4/nQdEHHwu8n8pHqHfKJRoSAa
 2U/698ckMJiAqSiCbtskTgG5+v53WTRJRwZE2vCzieQjELIzp+gfN35BRaCZNO4M9A+g
 DDsMBivz3kpLKBvHm744MxIUkB4rmHGaGARWvpQnwTlnUFvmdHHuLXIZ8v8esPnb6FMT
 ZlNp9w7QHbDasHuHo4Zt8WJGIHqtugbzVzSb/r0HnIw5jkefYHGUOL2VJwcx34bllFwi
 GZ0/UqJhKJ8+tJrDVdIcMLmVeHADvOt0vQpTV3v42iHinoRTWehzvZYGqy1Uhuz6sGqj
 HU9w==
X-Gm-Message-State: AAQBX9cCvlfoqK0TueNCYb1U5+KvsQ7iKAlX29VL4w6N54ACw/AUf0EA
 y+f0A0wFb0m4ZSrUuau5DEtEi7o2o1ZHcZwVaLONYA==
X-Google-Smtp-Source: AKy350Y6E0tWxVGNgCitFgv7qSKGAa656ix57EGh+mPUxMHwMIFQeyTTj2k3TYw7soe402NFphHlUfOa9PgrlDZ+5GA=
X-Received: by 2002:a05:6870:c688:b0:177:ac40:8f6d with SMTP id
 cv8-20020a056870c68800b00177ac408f6dmr1653872oab.8.1680634875094; Tue, 04 Apr
 2023 12:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <20230404002211.3611376-9-matthew.brost@intel.com>
 <e5eb5ab0-8e51-389c-34ae-7c6004f4b1ba@amd.com>
 <f7b3b70b-c798-b09e-210c-f84eaafd3251@linux.intel.com>
 <5b2e6a78-b743-028c-f54d-af38c130164a@amd.com>
In-Reply-To: <5b2e6a78-b743-028c-f54d-af38c130164a@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 4 Apr 2023 21:00:59 +0200
Message-ID: <CAKMK7uGeBJRQ4dKfY=wRvw-o7qdzurFHzUymxGsLWr4Y_nQPAA@mail.gmail.com>
Subject: Re: [RFC PATCH 08/10] dma-buf/dma-fence: Introduce long-running
 completion fences
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 airlied@linux.ie, lina@asahilina.net, dri-devel@lists.freedesktop.org,
 boris.brezillon@collabora.com, robdclark@chromium.org,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 4 Apr 2023 at 15:10, Christian K=C3=B6nig <christian.koenig@amd.com=
> wrote:
>
> Am 04.04.23 um 14:54 schrieb Thomas Hellstr=C3=B6m:
> > Hi, Christian,
> >
> > On 4/4/23 11:09, Christian K=C3=B6nig wrote:
> >> Am 04.04.23 um 02:22 schrieb Matthew Brost:
> >>> From: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> >>>
> >>> For long-running workloads, drivers either need to open-code completi=
on
> >>> waits, invent their own synchronization primitives or internally use
> >>> dma-fences that do not obey the cross-driver dma-fence protocol, but
> >>> without any lockdep annotation all these approaches are error prone.
> >>>
> >>> So since for example the drm scheduler uses dma-fences it is
> >>> desirable for
> >>> a driver to be able to use it for throttling and error handling also
> >>> with
> >>> internal dma-fences tha do not obey the cros-driver dma-fence protoco=
l.
> >>>
> >>> Introduce long-running completion fences in form of dma-fences, and a=
dd
> >>> lockdep annotation for them. In particular:
> >>>
> >>> * Do not allow waiting under any memory management locks.
> >>> * Do not allow to attach them to a dma-resv object.
> >>> * Introduce a new interface for adding callbacks making the helper
> >>> adding
> >>>    a callback sign off on that it is aware that the dma-fence may not
> >>>    complete anytime soon. Typically this will be the scheduler chaini=
ng
> >>>    a new long-running fence on another one.
> >>
> >> Well that's pretty much what I tried before:
> >> https://lwn.net/Articles/893704/
> >>
> >> And the reasons why it was rejected haven't changed.
> >>
> >> Regards,
> >> Christian.
> >>
> > Yes, TBH this was mostly to get discussion going how we'd best tackle
> > this problem while being able to reuse the scheduler for long-running
> > workloads.
> >
> > I couldn't see any clear decision on your series, though, but one main
> > difference I see is that this is intended for driver-internal use
> > only. (I'm counting using the drm_scheduler as a helper for
> > driver-private use). This is by no means a way to try tackle the
> > indefinite fence problem.
>
> Well this was just my latest try to tackle this, but essentially the
> problems are the same as with your approach: When we express such
> operations as dma_fence there is always the change that we leak that
> somewhere.
>
> My approach of adding a flag noting that this operation is dangerous and
> can't be synced with something memory management depends on tried to
> contain this as much as possible, but Daniel still pretty clearly
> rejected it (for good reasons I think).

Yeah I still don't like dma_fence that somehow have totally different
semantics in that critical piece of "will it complete or will it
deadlock?" :-)
>
> >
> > We could ofc invent a completely different data-type that abstracts
> > the synchronization the scheduler needs in the long-running case, or
> > each driver could hack something up, like sleeping in the
> > prepare_job() or run_job() callback for throttling, but those waits
> > should still be annotated in one way or annotated one way or another
> > (and probably in a similar way across drivers) to make sure we don't
> > do anything bad.
> >
> >  So any suggestions as to what would be the better solution here would
> > be appreciated.
>
> Mhm, do we really the the GPU scheduler for that?
>
> I mean in the 1 to 1 case  you basically just need a component which
> collects the dependencies as dma_fence and if all of them are fulfilled
> schedules a work item.
>
> As long as the work item itself doesn't produce a dma_fence it can then
> still just wait for other none dma_fence dependencies.

Yeah that's the important thing, for long-running jobs dependencies as
dma_fence should be totally fine. You're just not allowed to have any
outgoing dma_fences at all (except the magic preemption fence).

> Then the work function could submit the work and wait for the result.
>
> The work item would then pretty much represent what you want, you can
> wait for it to finish and pass it along as long running dependency.
>
> Maybe give it a funky name and wrap it up in a structure, but that's
> basically it.

Like do we need this? If the kernel ever waits for a long-running
compute job to finnish I'd call that a bug. Any functional
dependencies between engines or whatever are userspace's problem only,
which it needs to sort out using userspace memory fences.

The only things the kernel needs are some way to track dependencies as
dma_fence (because memory management move the memory away and we need
to move it back in, ideally pipelined). And it needs the special
preempt fence (if we don't have pagefaults) so that you have a fence
to attach to all the dma_resv for memory management purposes. Now the
scheduler already has almost all the pieces (at least if we assume
there's some magic fw which time-slices these contexts on its own),
and we just need a few minimal changes:
- allowing the scheduler to ignore the completion fence and just
immediately push the next "job" in if its dependencies are ready
- maybe minimal amounts of scaffolding to handle the preemption
dma_fence because that's not entirely trivial. I think ideally we'd
put that into drm_sched_entity since you can only ever have one active
preempt dma_fence per gpu ctx/entity.

None of this needs a dma_fence_is_lr anywhere at all.

Of course there's the somewhat related issue of "how do we transport
these userspace memory fences around from app to compositor", and
that's a lot more gnarly. I still don't think dma_fence_is_lr is
anywhere near what the solution should look like for that.
-Daniel


> Regards,
> Christian.
>
> >
> > Thanks,
> >
> > Thomas
> >
> >
> >
> >
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
