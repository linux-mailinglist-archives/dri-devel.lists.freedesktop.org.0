Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B3C3B34F5
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 19:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1176EC72;
	Thu, 24 Jun 2021 17:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1026EC72
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 17:44:11 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 v11-20020a4a8c4b0000b029024be8350c45so1819531ooj.12
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 10:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2zbjEMLOhY6r00jLovUvg+cDkukY8e+ehBYDIDtu8ak=;
 b=cNXDM25LzsLh+znUAPF8XGZunGiT2d5LTm3VhQM3a30Nz2m8Mtm6Eg7ClFschfOFKA
 t4aJ1MEacWmOvglRsSQ+FKoCY5il6sTghtAt7cWTl6ZX/ei2H63paQDp2kwB0tTuIN/3
 RKoaHfFQSKAJLiCYdfUlF9lIWXk0x7gSghyIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2zbjEMLOhY6r00jLovUvg+cDkukY8e+ehBYDIDtu8ak=;
 b=Wr0Oi2E/CCCPr+7kqY9uVITu7la6ffBVwHRjsCge0Y2YFOONUrhLdXPg5USl9VAL/w
 gmrvwm7trDgPKmrBfKGz+CVgYzfQz9oG44iqIvYvOPk/i2qzkEdL/y3dj/OofdL20cRk
 9gr1wDVksNAJuATgYYuOE8l/tdtiJayVLyHsHTGafycMit2A+ErZSoBW1EnAUewDqA2u
 IgCRxHqI7EmTHYS3j9npCH6cwpvmVAsixhZbu7wXNt+0p2fpOekkFKfFUDPkzuL/uOWw
 TUAc1f8lt4xO4mD4A/2ftMLek7t20uTJMaQ/P2nXrMQLR/xc9z+hCOzE9ZRDZ4l+o76U
 LU7g==
X-Gm-Message-State: AOAM533591b/50FZG25vKAfPBwHAn8nfF6QSbZoCmpczz/OvqAmQ9/oK
 8OKHNIhMiQyj18Akf35o8d0T4CYF5Ukvol0W9VZF1Q==
X-Google-Smtp-Source: ABdhPJwCAUFdauKYgkR1eVpGkCFWIqzH3KUNGQT9AtCmEv9bqfAX5o9/lJseCwCrAk5dRFMXiwRlitsGkE2NYFA4/u8=
X-Received: by 2002:a4a:8802:: with SMTP id d2mr5497433ooi.28.1624556650239;
 Thu, 24 Jun 2021 10:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210624140025.438303-1-daniel.vetter@ffwll.ch>
 <20210624140025.438303-11-daniel.vetter@ffwll.ch>
 <fa721d0e-46d7-b5f3-f846-560b8dad4e58@amd.com>
 <YNTBC04wfQ7ItRq7@phenom.ffwll.local>
 <811e5816-c9d7-72b8-2836-a3d1891bb762@amd.com>
In-Reply-To: <811e5816-c9d7-72b8-2836-a3d1891bb762@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 24 Jun 2021 19:43:59 +0200
Message-ID: <CAKMK7uGmXiPUJEyC87bS5vTCtHTG7HFP=C-DQA0pQHB6mpB66A@mail.gmail.com>
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

On Thu, Jun 24, 2021 at 7:38 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 24.06.21 um 19:29 schrieb Daniel Vetter:
> > On Thu, Jun 24, 2021 at 07:03:10PM +0200, Christian K=C3=B6nig wrote:
> >> Am 24.06.21 um 16:00 schrieb Daniel Vetter:
> >>> This is essentially part of drm_sched_dependency_optimized(), which
> >>> only amdgpu seems to make use of. Use it a bit more.
> >>>
> >>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >>> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> >>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> >>> Cc: Luben Tuikov <luben.tuikov@amd.com>
> >>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> >>> Cc: Alex Deucher <alexander.deucher@amd.com>
> >>> Cc: Jack Zhang <Jack.Zhang1@amd.com>
> >>> ---
> >>>    drivers/gpu/drm/scheduler/sched_main.c | 7 +++++++
> >>>    1 file changed, 7 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm=
/scheduler/sched_main.c
> >>> index 370c336d383f..c31d7cf7df74 100644
> >>> --- a/drivers/gpu/drm/scheduler/sched_main.c
> >>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> >>> @@ -649,6 +649,13 @@ int drm_sched_job_await_fence(struct drm_sched_j=
ob *job,
> >>>     if (!fence)
> >>>             return 0;
> >>> +   /* if it's a fence from us it's guaranteed to be earlier */
> >>> +   if (fence->context =3D=3D job->entity->fence_context ||
> >>> +       fence->context =3D=3D job->entity->fence_context + 1) {
> >>> +           dma_fence_put(fence);
> >>> +           return 0;
> >>> +   }
> >>> +
> >> Well NAK. That would break Vulkan.

I'm assuming your reply means the NAK is retracted and was just the
usual "this doesn't perfectly fit for amdgpu" reflex?

> >> The problem is that Vulkan can insert dependencies between jobs which =
run on
> >> the same queue.
> >>
> >> So we need to track those as well and if the previous job for the same
> >> queue/scheduler is not yet finished a pipeline synchronization needs t=
o be
> >> inserted.
> >>
> >> That's one of the reasons we wasn't able to unify the dependency handl=
ing
> >> yet.
> > That sounds like an extremely amdgpu specific constraint?
>
> Yeah, that's totally hardware specific.
>
> It's just that I don't know how else we could track that without having
> the same separation as in amdgpu between implicit and explicit fences.
> And as far as I understand it that's exactly what you want to avoid.
>
> As I said this turned out to be really awkward.
>
> > You're also the
> > only one who keeps track of whether the previous job we've scheduled ha=
s
> > finished already (I guess they can get pipelined and you don't flush by
> > default), so you insert fences.
>
> Yes, exactly that.
>
> > I guess we can add a await_fence_no_dedup or so for amdgpu, but I'm not
> > sure why we have to inflict this design constraint on all other drivers=
?
> > At least I'm not seeing anything in lima, panfrost, v3d or entaviv that
> > would break with this, and i915 will also be perfectly fine.
> >
> > Also note: I'm not using this for amdgpu, exactly because there's a few
> > funny things going on.
>
> Yeah, exactly the reason why we never unified this.

Yeah there's clear limits to this, because you also can't use the
await_implicit helper, because you have to keep filtering for owner or
the current amdgpu uapi goes horribly slow. I think the benefit would
be just that we could share the datastructure and the book-keeping,
but aside from that you'd need your own integration in amdgpu.

One idea I just had was whether we could use the tag bits xarray has
for the amdgpu purposed. Like we could do a
drm_sched_job_await_fence_tagged, where you supply additional
information (like the "this might be relevant for the vm_flush" and
things like that). Afaiui xarray tags are very fast to enumerate on if
you're looking for specific tags, but I might be wrong. Ideally this
would avoid the need for the duplicated amdgpu_job->sched.

Cheers, Daniel


> Regards,
> Christian.
>
> > Finally: You _really_ need explicit dependency handling for vulkan in y=
our
> > uapi, instead of the kernel second-guessing what userspace might be doi=
ng.
> > That's really not how vulkan is designed to work :-)
>
> >
> > Cheers, Daniel
> >
> >
> >> Christian.
> >>
> >>>     /* Deduplicate if we already depend on a fence from the same cont=
ext.
> >>>      * This lets the size of the array of deps scale with the number =
of
> >>>      * engines involved, rather than the number of BOs.
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
