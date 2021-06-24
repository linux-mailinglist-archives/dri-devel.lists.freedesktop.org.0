Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 828503B358D
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 20:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820886EC3A;
	Thu, 24 Jun 2021 18:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C95556EC3A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 18:21:27 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id s23so8338802oiw.9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 11:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+rKpKLUxM4+R8+IRFRYwOuTo7BuzeARKTnnRSkQ5igA=;
 b=FOmc5fUjWciLP99AuHHaV2eMTQK3GHeXUclGNolcHaT567caOADM9kG7DbsZpxVFJb
 LcQdBjJhg++vnCidx7K2N12bJyCD9e2BcCaxLsAgjXNAzUs5kdQcPW4q+aMALKdZv2Cv
 nyXlBBuLTp/mVf6X6MALQ0mT5RsCettZL2aFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+rKpKLUxM4+R8+IRFRYwOuTo7BuzeARKTnnRSkQ5igA=;
 b=ktTIfUPETlF8woJ3LcKsKnrfSDuDhngZdDRbrtN1tcS45Pd6Ck6fqxaNdy6UpELLpU
 EjfGP9lmytQXPrLXvGcH3bVKTEORWMc2z7TGDH3DEa1vMsCyUjRrUcoA20hg9ITuEe+A
 W9ts1VvehR2rcc7V78vUoh9quR80KZtGh5AuyG/8XIwR8o3U4zC+LFNmLSc8735lTI+W
 svVa8CqRg2e3s/fBOHx+Wg1H85FMShOdvUmQ937R5RAqJbI+1jhDftaqJJoMjlmyeeA9
 oC+Ioo42BlaPmTOkvmwoLFl9m5R10QzHO8496gfuPQq6poQzPupBwFGbiPVapLnfI3sP
 EE1A==
X-Gm-Message-State: AOAM532Qf5Q3frpD+ml7gHyVKVHV9t4wgkOpr1jIb5m6cxQRaZHfd2Bb
 RKGkYhSLU3HY2F54sA4jt3hujnc5hJ2V/J+nIJTpgztf6QA=
X-Google-Smtp-Source: ABdhPJzTutnO41JLe2Hx8O9k51+t/CYkaDP3QTu8o9brPU3yozav66UGEAujKcsH3M8JSTtbAWBLJjpa+ZvLStVp7DQ=
X-Received: by 2002:aca:530f:: with SMTP id h15mr5152667oib.128.1624558887080; 
 Thu, 24 Jun 2021 11:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210624140025.438303-1-daniel.vetter@ffwll.ch>
 <20210624140025.438303-11-daniel.vetter@ffwll.ch>
 <fa721d0e-46d7-b5f3-f846-560b8dad4e58@amd.com>
 <YNTBC04wfQ7ItRq7@phenom.ffwll.local>
 <811e5816-c9d7-72b8-2836-a3d1891bb762@amd.com>
 <CAKMK7uGmXiPUJEyC87bS5vTCtHTG7HFP=C-DQA0pQHB6mpB66A@mail.gmail.com>
 <fe537d78-0737-f1b1-a740-66efa93e94a9@amd.com>
In-Reply-To: <fe537d78-0737-f1b1-a740-66efa93e94a9@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 24 Jun 2021 20:21:15 +0200
Message-ID: <CAKMK7uE21AVpBQywKhQOVZUhG=D=CDaGwWAEDTpjhUoSzTdbrw@mail.gmail.com>
Subject: Re: [PATCH 10/11] drm/scheduler: Don't store self-dependencies
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 24, 2021 at 7:56 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 24.06.21 um 19:43 schrieb Daniel Vetter:
> > On Thu, Jun 24, 2021 at 7:38 PM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 24.06.21 um 19:29 schrieb Daniel Vetter:
> >>> On Thu, Jun 24, 2021 at 07:03:10PM +0200, Christian K=C3=B6nig wrote:
> >>>> Am 24.06.21 um 16:00 schrieb Daniel Vetter:
> >>>>> This is essentially part of drm_sched_dependency_optimized(), which
> >>>>> only amdgpu seems to make use of. Use it a bit more.
> >>>>>
> >>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >>>>> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> >>>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> >>>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
> >>>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> >>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
> >>>>> Cc: Jack Zhang <Jack.Zhang1@amd.com>
> >>>>> ---
> >>>>>     drivers/gpu/drm/scheduler/sched_main.c | 7 +++++++
> >>>>>     1 file changed, 7 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/d=
rm/scheduler/sched_main.c
> >>>>> index 370c336d383f..c31d7cf7df74 100644
> >>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
> >>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> >>>>> @@ -649,6 +649,13 @@ int drm_sched_job_await_fence(struct drm_sched=
_job *job,
> >>>>>      if (!fence)
> >>>>>              return 0;
> >>>>> +   /* if it's a fence from us it's guaranteed to be earlier */
> >>>>> +   if (fence->context =3D=3D job->entity->fence_context ||
> >>>>> +       fence->context =3D=3D job->entity->fence_context + 1) {
> >>>>> +           dma_fence_put(fence);
> >>>>> +           return 0;
> >>>>> +   }
> >>>>> +
> >>>> Well NAK. That would break Vulkan.
> > I'm assuming your reply means the NAK is retracted and was just the
> > usual "this doesn't perfectly fit for amdgpu" reflex?
>
> Well rather "NAK, you haven't considered that special handling in amdgpu
> and if you really want to unify this you need that as well."
>
> >
> >>>> The problem is that Vulkan can insert dependencies between jobs whic=
h run on
> >>>> the same queue.
> >>>>
> >>>> So we need to track those as well and if the previous job for the sa=
me
> >>>> queue/scheduler is not yet finished a pipeline synchronization needs=
 to be
> >>>> inserted.
> >>>>
> >>>> That's one of the reasons we wasn't able to unify the dependency han=
dling
> >>>> yet.
> >>> That sounds like an extremely amdgpu specific constraint?
> >> Yeah, that's totally hardware specific.
> >>
> >> It's just that I don't know how else we could track that without havin=
g
> >> the same separation as in amdgpu between implicit and explicit fences.
> >> And as far as I understand it that's exactly what you want to avoid.
> >>
> >> As I said this turned out to be really awkward.
> >>
> >>> You're also the
> >>> only one who keeps track of whether the previous job we've scheduled =
has
> >>> finished already (I guess they can get pipelined and you don't flush =
by
> >>> default), so you insert fences.
> >> Yes, exactly that.
> >>
> >>> I guess we can add a await_fence_no_dedup or so for amdgpu, but I'm n=
ot
> >>> sure why we have to inflict this design constraint on all other drive=
rs?
> >>> At least I'm not seeing anything in lima, panfrost, v3d or entaviv th=
at
> >>> would break with this, and i915 will also be perfectly fine.
> >>>
> >>> Also note: I'm not using this for amdgpu, exactly because there's a f=
ew
> >>> funny things going on.
> >> Yeah, exactly the reason why we never unified this.
> > Yeah there's clear limits to this, because you also can't use the
> > await_implicit helper, because you have to keep filtering for owner or
> > the current amdgpu uapi goes horribly slow. I think the benefit would
> > be just that we could share the datastructure and the book-keeping,
> > but aside from that you'd need your own integration in amdgpu.
>
> Yeah, but that is trivial. The _add_dependency() function (or however we
> want to call it) needs to be exported anyway for adding fences from
> syncfile and syncobj.
>
> Or do you also want to unify the handling for those?

I guess we could add some convenience wrapper that pulls in a
sync_file or sync_objc automatically. But there's not that much code
involved there, and it's also not tricky. Also drivers might need to
add dependencies for whatever anyway. The await_implicit is a bit
different, because that defines how implicit sync is supposed to work.

I guess the bikeshed then boils down to which one is the simple
await_fence() function. The one that filters for same timeline, or the
one that doesnt. I'd make the non-filtering one the special case so
that amdgpu sticks out a bit more - out of 6 drivers with schedulers
(i915 included) it seems to be the special one.

> > One idea I just had was whether we could use the tag bits xarray has
> > for the amdgpu purposed. Like we could do a
> > drm_sched_job_await_fence_tagged, where you supply additional
> > information (like the "this might be relevant for the vm_flush" and
> > things like that). Afaiui xarray tags are very fast to enumerate on if
> > you're looking for specific tags, but I might be wrong. Ideally this
> > would avoid the need for the duplicated amdgpu_job->sched.
>
> That could work.
>
> Essentially we just need the information from the scheduler which is the
> last fence which was dependency optimized.
>
> In other words when you push jobs like those to the same scheduler
>
> J1
> J2 -> depends on J1.
> J3 -> depends on whatever, but not j2
>
> The hardware needs to insert a flush between J2 and J1, but not between
> j3 and j2.
>
> This makes roughly 19% performance difference for some OpenGL games and
> incorrect rendering for Vulkan if you mess it up either way or the other.

Yeah that's massive. On i915 "too many pipeline stalls" even within
batches is a lot less, so we never bothered with this at all.
-Daniel

>
> Regards,
> Christian.
>
>
> >
> > Cheers, Daniel
> >
> >
> >> Regards,
> >> Christian.
> >>
> >>> Finally: You _really_ need explicit dependency handling for vulkan in=
 your
> >>> uapi, instead of the kernel second-guessing what userspace might be d=
oing.
> >>> That's really not how vulkan is designed to work :-)
> >>> Cheers, Daniel
> >>>
> >>>
> >>>> Christian.
> >>>>
> >>>>>      /* Deduplicate if we already depend on a fence from the same c=
ontext.
> >>>>>       * This lets the size of the array of deps scale with the numb=
er of
> >>>>>       * engines involved, rather than the number of BOs.
> >
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
