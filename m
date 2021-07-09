Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B69563C2061
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 10:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF286E9D6;
	Fri,  9 Jul 2021 08:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CFC56E9D4
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 08:00:26 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id u66so5437634oif.13
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 01:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4Tm6rbhq6rt9ho8Bl6eVvSWWbDirLBWL3poqengHkQM=;
 b=cWUbVFQufEddmU6NXf5u7WC6fcnvndpqVjZeZXeZCcSYX2cktBcUxUBwg089EwCYHi
 /Uu4s/ipVTMHCBSYXYMZrL+YnRvU8Mhf4EaJefC3korjw2voNxEbQstCk/sxVQ2slul0
 A5/rfvrOaX7XI91SNvVtG903grhYSoWEDhMyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4Tm6rbhq6rt9ho8Bl6eVvSWWbDirLBWL3poqengHkQM=;
 b=ZpjTssovDVe46RVoR3xFV9QeZt/88ZpNh6qv+EJI12nR4yWOmTMj/gAmQZlrm3ksqW
 R2kpKy3D68vFdCpBLywnKwwRasyaCLeXrR7/YxkX92Cx95GentUSWQWFKQ3c8c0/DkGQ
 Z5/dvNt+HGSTg1DYRKgDV+ACZvKsyLxs9cbZt80i34FGf3stfoaU7kWBTpkwx2csCl86
 67py/HVwl2aVhSuUE5xvEB1CPpkEZiIB9UuhZ7Iuq+b7xDltNOFsgCBDEM2nBA9VcjDW
 L5pYxHWL5V6AZkKvRekH1fMazf9S4sk1C9Gy/zeRg53xheGPvx06gMWP5Cg89mmwk3qn
 6K9Q==
X-Gm-Message-State: AOAM530ulJheq1KM5Ms6EO3vKmEsAAz5SNpO0iKXizK/s4f4ST4Q3E7V
 fibNEZDukKedFLoBF89yz3G3jCcc2QbwU9rbhgtaxg==
X-Google-Smtp-Source: ABdhPJwpYZhP/rk5oEw1WXb6I1u345ELPS2Mya0mKaMsr52a+aV56mu3CTUMBnYv6GhYXipU5gPS4xgH0qXe9Ie58LQ=
X-Received: by 2002:aca:f491:: with SMTP id
 s139mr21163595oih.128.1625817625401; 
 Fri, 09 Jul 2021 01:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210708173754.3877540-1-daniel.vetter@ffwll.ch>
 <20210708173754.3877540-2-daniel.vetter@ffwll.ch>
 <5588d1c3-833b-bd95-69e6-a103f2e8affa@amd.com>
 <CAKMK7uFuqXdbvqDCerXHW5kiT=LUZEoyrjFMgHjkUQdS1eidDw@mail.gmail.com>
 <871a4619-8a17-134f-9d9c-40a522473946@amd.com>
In-Reply-To: <871a4619-8a17-134f-9d9c-40a522473946@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 9 Jul 2021 10:00:14 +0200
Message-ID: <CAKMK7uG8ODwoPz8ztBfn=iBn8iWUOfrMxPkauuAHc=XktoCeGA@mail.gmail.com>
Subject: Re: [PATCH v3 01/20] drm/sched: entity->rq selection cannot fail
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
Cc: Jack Zhang <Jack.Zhang1@amd.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 9, 2021 at 9:23 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
> Am 09.07.21 um 09:14 schrieb Daniel Vetter:
> > On Fri, Jul 9, 2021 at 8:53 AM Christian K=C3=B6nig <christian.koenig@a=
md.com> wrote:
> >> Am 08.07.21 um 19:37 schrieb Daniel Vetter:
> >>> If it does, someone managed to set up a sched_entity without
> >>> schedulers, which is just a driver bug.
> >> NAK, it is perfectly valid for rq selection to fail.
> > There isn't a better way to explain stuff to someone who's new to the
> > code and tries to improve it with docs than to NAK stuff with
> > incomplete explanations?
>
> Well as far as I understand it a NAK means that the author has missed
> something important and needs to re-iterate.

It comes around as very screaming at least to me (all uppercase and
all that) and personally I only associate it with unchecked angry
kernel maintainers on lkml celebrating their status and putting down
some noobs for shits and giggles. I think here on dri-devel you're the
only one doing it regularly.

> It's just to say that we absolutely can't merge a patch or something
> will break.

Well yeah I know that when a patch breaks something I can't merge it.
For drm-intel we also documented that clearly, but for drm-misc it's
not spelled out. I'll fix that.

> >> See drm_sched_pick_best():
> >>
> >>                   if (!sched->ready) {
> >>                           DRM_WARN("scheduler %s is not ready, skippin=
g",
> >>                                    sched->name);
> >>                           continue;
> >>                   }
> >>
> >> This can happen when a device reset fails for some engine.
> > Well yeah I didn't expect amdgpu to just change this directly, so I
> > didn't find it. Getting an ENOENT on a hw failure instead of an EIO is
> > a bit interesting semantics I guess, also what happens with the jobs
> > which raced against the scheduler not being ready? I'm not seeing any
> > checks for ready in the main scheduler logic so this at least looks
> > somewhat accidental as a side effect, also no other driver than amdgpu
> > communitcates that reset failed back to drm/sched like this. They seem
> > to just not, and I guess timeout on the next request will get us into
> > an endless reset loop?
>
> Correct. Key point is that there aren't any jobs which are currently
> scheduled.
>
> When the ready flag is changed the scheduler is paused, e.g. the main
> thread is not running any more.
>
> I'm pretty sure that all of this is horrible racy, but nobody really
> looked into the design from a higher level as far as I know.

Yeah the scheduler thread is fine because it's stopped, but it also
doesn't look at sched->ready, so it can't race. What does race is new
submissions, and if they stuff something into the queue then I'm
wondering what happens to that. Also what happens to the requests
already in the queue.

Eventually I guess userspace notices the ENOENT, tears down the
context, and the kernel then also tears down the context and cleans up
the mess. But it's rather inglorious until it collapses down to a
coherent state again I think.

Or is there something with the scheduler restart flow which is
guaranteed to catch these, and we're maybe just missing a bunch of
barriers?

Either way I think a proper interface to terminally wedge a sched
would be good, so that at least we can pass back something meaningful
like -EIO. And also tell "the gpu died" apart from "the driver author
tore down the scheduler while it was still in use", which I think we
really should catch with some WARN_ON.

Anyway for the immediate issue of "don't break amdgpu" I think I'll
reshuffle the split between job_init and job_arm again, and add a big
comment to job_init that it can fail with ENOENT, and why, and what
kind of interface would be more proper. i915 will need the terminally
wedged flow too so I'll probably have to look into this, but that will
need some proper thought.

Cheers, Daniel


>
> Christian.
>
>
>
> > -Daniel
> >
> >
> >> Regards,
> >> Christian.
> >>
> >>> We BUG_ON() here because in the next patch drm_sched_job_init() will
> >>> be split up, with drm_sched_job_arm() never failing. And that's the
> >>> part where the rq selection will end up in.
> >>>
> >>> Note that if having an empty sched_list set on an entity is indeed a
> >>> valid use-case, we can keep that check in job_init even after the spl=
it
> >>> into job_init/arm.
> >>>
> >>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >>> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> >>> Cc: Luben Tuikov <luben.tuikov@amd.com>
> >>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> >>> Cc: Steven Price <steven.price@arm.com>
> >>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> >>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> >>> Cc: Jack Zhang <Jack.Zhang1@amd.com>
> >>> ---
> >>>    drivers/gpu/drm/scheduler/sched_entity.c | 2 +-
> >>>    drivers/gpu/drm/scheduler/sched_main.c   | 3 +--
> >>>    2 files changed, 2 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/d=
rm/scheduler/sched_entity.c
> >>> index 79554aa4dbb1..6fc116ee7302 100644
> >>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> >>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> >>> @@ -45,7 +45,7 @@
> >>>     * @guilty: atomic_t set to 1 when a job on this queue
> >>>     *          is found to be guilty causing a timeout
> >>>     *
> >>> - * Note: the sched_list should have at least one element to schedule
> >>> + * Note: the sched_list must have at least one element to schedule
> >>>     *       the entity
> >>>     *
> >>>     * Returns 0 on success or a negative error code on failure.
> >>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm=
/scheduler/sched_main.c
> >>> index 33c414d55fab..01dd47154181 100644
> >>> --- a/drivers/gpu/drm/scheduler/sched_main.c
> >>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> >>> @@ -586,8 +586,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
> >>>        struct drm_gpu_scheduler *sched;
> >>>
> >>>        drm_sched_entity_select_rq(entity);
> >>> -     if (!entity->rq)
> >>> -             return -ENOENT;
> >>> +     BUG_ON(!entity->rq);
> >>>
> >>>        sched =3D entity->rq->sched;
> >>>
> >
>


--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
