Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF044EDF06
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 18:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED2D810E380;
	Thu, 31 Mar 2022 16:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6725E10E380
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 16:43:11 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 d15-20020a9d72cf000000b005cda54187c3so286145otk.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 09:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=haWaVkCCmD6Dl0cFVL17wur5DvlYHi103gUyGLJ1d64=;
 b=Qb3CBBGOJjnj8o9Z7KDaMQUeBJ99hcRQvVQ4se0o/vwtbP+HT92aUAXLED8epu0Lax
 Y5+/zCXZ+3BcZWso0urY8K4aeycxgKZ9Ush5vE/H4QGzNt6oKG3fkbcEotm8v6NCXp3+
 k2k57UaDOiMy+PAuazV8wWBUNqXZSVEfx5eJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=haWaVkCCmD6Dl0cFVL17wur5DvlYHi103gUyGLJ1d64=;
 b=vxiz43BlLpv82fkCPzly3TThSNAZmB7c1+nU3i1qfKDCo8nvazxrG3b1v8fF8sWCQt
 KkY6+LN4M5P2S+ICc6s3ZMCXkvvMUSVM9Z/LISi4t9jEU1f4PytOjP6SGt+cnTFZtWLx
 0YhznkBmRg2ZEugzh/scvcQwHb/OmmeWxkBuq89uRi//xFcABDzWJFcheykVAlf75Evb
 ETFIGfRXVWDRkvVPLyJZpIcCjOrWVR5hI+7jVnNSFN0laTxi0KkioQLcmvfySOmIkkyM
 jjMs98R8shMxYmE/HOVibhForpwBLzppBC+NAo5g2iwhCymvN/1Yy/Gv8Gc8+YX4/Cm/
 6/qw==
X-Gm-Message-State: AOAM531gxprH5bVpx4BNcEkidjBaotA7uIktao1MT8u3UJmunMOnIn+J
 ZwvJa33XNW4MWvkEkg0+vraLSK8pSoInvB2LpIpciA==
X-Google-Smtp-Source: ABdhPJzwv8KNbQV4qoP7DrQhzmC1RqY8O+GXK639XQIwuzO0+9Kc2e+b7bVjasplJ/9LLhEqdWjSqhK9LYeXE9IBqtI=
X-Received: by 2002:a05:6830:14d3:b0:5b2:49d9:17b6 with SMTP id
 t19-20020a05683014d300b005b249d917b6mr5860692otq.321.1648744990475; Thu, 31
 Mar 2022 09:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-12-christian.koenig@amd.com>
 <YkHs7tKWtzBpRE/a@phenom.ffwll.local>
 <8c3bb3ba-1c30-7323-2be0-870b9633b406@gmail.com>
In-Reply-To: <8c3bb3ba-1c30-7323-2be0-870b9633b406@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 31 Mar 2022 18:42:59 +0200
Message-ID: <CAKMK7uECymTpsPWrHX_yZQ+5JUvfwRgq-OEvXa4y50YyzRNSpw@mail.gmail.com>
Subject: Re: [PATCH 12/23] dma-buf/drivers: make reserving a shared slot
 mandatory v3
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Mar 2022 at 14:07, Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 28.03.22 um 19:14 schrieb Daniel Vetter:
> > On Mon, Mar 21, 2022 at 02:58:45PM +0100, Christian K=C3=B6nig wrote:
> >> [SNIP]
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_object.c
> >> index ea0cde4904f0..2f808decd8d9 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> >> @@ -1384,6 +1384,14 @@ void amdgpu_bo_fence(struct amdgpu_bo *bo, stru=
ct dma_fence *fence,
> >>                   bool shared)
> >>   {
> >>      struct dma_resv *resv =3D bo->tbo.base.resv;
> >> +    int r;
> >> +
> >> +    r =3D dma_resv_reserve_fences(resv, 1);
> > This is quite a hack, but I did scroll through all the callers of
> > amdgpu_bo_fence and I think it's fine - i.e. no recursion into the
> > shrinker from a calling context where recursion into shrinker/memalloc
> > isn't allowed.
> >
> > But it aint pretty :-/
>
> Yeah, but one long term goal of this is to remove all the hacky handling
> of manually adding fences to the resv object using this function. I
> could add a TODO if that helps.
>
> > [SNIP]
> >> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gp=
u/drm/i915/gem/i915_gem_ttm_move.c
> >> index ee9612a3ee5e..4de6500f3c55 100644
> >> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> >> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> >> @@ -596,7 +596,11 @@ int i915_gem_obj_copy_ttm(struct drm_i915_gem_obj=
ect *dst,
> >>      assert_object_held(src);
> >>      i915_deps_init(&deps, GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN);
> >>
> >> -    ret =3D dma_resv_reserve_shared(src_bo->base.resv, 1);
> >> +    ret =3D dma_resv_reserve_fences(src_bo->base.resv, 1);
> >> +    if (ret)
> >> +            return ret;
> >> +
> >> +    ret =3D dma_resv_reserve_fences(dst_bo->base.resv, 1);
> > Can't we just reserve 2 slots instead of doing this 2x?
>
> *handing you some coffee* We reserve one one slot on the source and one
> on the destination buffer :)

Ah, coffee, great :-)

> > [SNIP]
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/=
panfrost/panfrost_job.c
> > index a6925dbb6224..c34114560e49 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -247,6 +247,10 @@ static int panfrost_acquire_object_fences(struct d=
rm_gem_object **bos,
> >       int i, ret;
> >
> >       for (i =3D 0; i < bo_count; i++) {
> > +             ret =3D dma_resv_reserve_fences(bos[i]->resv, 1);
> > +             if (ret)
> > +                     return ret;
> > +
> >               /* panfrost always uses write mode in its current uapi */
> >               ret =3D drm_sched_job_add_implicit_dependencies(job, bos[=
i],
> > I wonder whether we shouldn't move the dma-resv reserving into some sha=
red
> > helpers eventually ...
>
> I was going back and forth adding this to
> drm_sched_job_add_implicit_dependencies(), but then decided against that
> because it is really two independent functionalities.

Yeah it doesn't really fit. Maybe together as a combo packet of ttm eu
helpers (lifted to gem_bo level) combined with drm_sched. Defo
something for another patch set.

> >> [SNIP]
> >> @@ -120,9 +119,9 @@ int ttm_eu_reserve_buffers(struct ww_acquire_ctx *=
ticket,
> >>                      ret =3D ttm_bo_reserve_slowpath(bo, intr, ticket)=
;
> >>              }
> >>
> >> -            if (!ret && entry->num_shared)
> >> -                    ret =3D dma_resv_reserve_shared(bo->base.resv,
> >> -                                                            entry->nu=
m_shared);
> >> +            if (!ret)
> >> +                    ret =3D dma_resv_reserve_fences(bo->base.resv,
> >> +                                                  num_fences);
> >>
> >>              if (unlikely(ret !=3D 0)) {
> >>                      if (ticket) {
> > I didn't fine the corresponding reserve for the dma_resv_add_excl_fence=
()
> > in ttm_bo_move_accel_cleanup(). Was that an oversight?
>
> Mhm, need to double check as well. Could be that I missed that one.
>
> >> [SNIP]
> >> diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_g=
em.c
> >> index 4abf10b66fe8..594bd6bb00d2 100644
> >> --- a/drivers/gpu/drm/vc4/vc4_gem.c
> >> +++ b/drivers/gpu/drm/vc4/vc4_gem.c
> >> @@ -644,7 +644,7 @@ vc4_lock_bo_reservations(struct drm_device *dev,
> >>      for (i =3D 0; i < exec->bo_count; i++) {
> >>              bo =3D &exec->bo[i]->base;
> >>
> >> -            ret =3D dma_resv_reserve_shared(bo->resv, 1);
> >> +            ret =3D dma_resv_reserve_fences(bo->resv, 1);
> >>              if (ret) {
> >>                      vc4_unlock_bo_reservations(dev, exec, acquire_ctx=
);
> >>                      return ret;
> > v3d and vc4 are missing in the conversion. I think for both you need to
> > add it before the call to  like
> > with etnaviv.
>
> Both drivers already have the necessary calls. See
> vc4_lock_bo_reservations() and v3d_lock_bo_reservations().

Indeed I missed that they unconditionally reserve slots and aren't
trying to be clever.

> >> [SNIP]
> >> diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/vi=
rtio/virtgpu_gem.c
> >> index 48d3c9955f0d..1820ca6cf673 100644
> >> --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
> >> +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
> >> @@ -214,6 +214,7 @@ void virtio_gpu_array_add_obj(struct virtio_gpu_ob=
ject_array *objs,
> >>
> >>   int virtio_gpu_array_lock_resv(struct virtio_gpu_object_array *objs)
> >>   {
> >> +    unsigned int i;
> >>      int ret;
> >>
> >>      if (objs->nents =3D=3D 1) {
> >> @@ -222,6 +223,14 @@ int virtio_gpu_array_lock_resv(struct virtio_gpu_=
object_array *objs)
> >>              ret =3D drm_gem_lock_reservations(objs->objs, objs->nents=
,
> >>                                              &objs->ticket);
> >>      }
> >> +    if (ret)
> >> +            return ret;
> >> +
> >> +    for (i =3D 0; i < objs->nents; ++i) {
> >> +            ret =3D dma_resv_reserve_fences(objs->objs[i]->resv, 1);
> > I think you could stuff this into the same loop, but also probably does=
n't
> > matter.
>
> Na, that loop is inside drm_gem_lock_reservations().

Hm maybe another case for unified execbuf helpers that do this for drivers =
:-)

> > [SNIP]
> >
> > I found a few things, but with those (vc4 and v3d plus the ttm question=
,
> > the other stuff is just comments) corrected this gets my
>
> Going to double check the TTM case once more, but apart from that I
> think its solid.

Yeah with ttm I'm just a bit too much out of my own depth, so if you
can reply with an explainer for dummies so I can check myself where
all the pieces are I think we have it all now!
-Daniel

>
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> Thanks,
> Christian.
>
> >
> >> --
> >> 2.25.1
> >>
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
