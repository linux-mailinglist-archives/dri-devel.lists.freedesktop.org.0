Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3326A4F9215
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 11:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB6D810E1B0;
	Fri,  8 Apr 2022 09:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0CA10E1B0
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 09:33:52 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 e25-20020a0568301e5900b005b236d5d74fso5759213otj.0
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 02:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5sclF+IrdYw7kLMS4+PbaiC+DLOVATYfHwnkaUrWhQI=;
 b=XlEAe1I5Wq9XqirnOarVwTa60ijiNRrnbc4Yv5HKaVh/FcioMIu0gD7B+NkE5hc4kf
 x+kd74NaqDPBeeh3Z3ajfAlZOVcpPKPo8B7skTs7oPlIG/Q+HjjsxN6ps75+9wnOdNQS
 ZZj4UrcwBZom/1YfqdFauf5u9EzXcF8xDCS2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5sclF+IrdYw7kLMS4+PbaiC+DLOVATYfHwnkaUrWhQI=;
 b=ofoXdmd1itacVfm7nH4qKezCL/GmkeB0WtvwZVXSucm2Gz1XVKxqxjWlzi+JYINxsM
 nn5+ZxKNzyhKyhpkdC2c1wTYooYRPXNXK1K9VnBWLTWPJEO3YMXNlVcyGXkIMSHgtT8J
 lRQPAF8e1cpC/KdhY+p/yKURPcTIcN7dKB15eYAhQMIOJjirtctDrL5YPdNnp5yT2KKL
 t06N7c3tFx6OpV2fk7HNJVVplZVbAdyz/QBvp3adX0K3tl7jIUuxtytgSz+KYTxRY7gl
 spbE46yh/x0C7DTZoYPOf1E6KIktx0m7RVn6zuVmUZd1f2EeXmOLaDgXDcXYpcvZ05Qn
 JM5A==
X-Gm-Message-State: AOAM533FU37OrBk4UcNoCMfQXmM74vbloO4cUCwKbIfNejhhrflBPeQ5
 sO6+qLze4rms/FVTibTjv+F4K6ceMTZhZ5ZHmPs+9A==
X-Google-Smtp-Source: ABdhPJwAWRfwr432QP41MmQSuRe0ifBC5wTb4asvwvRMWC+cYyDLfoEdvfcS95NdsU4htY6D+ueitQKTueutE7XdWvc=
X-Received: by 2002:a9d:57c7:0:b0:5b2:3d6d:6469 with SMTP id
 q7-20020a9d57c7000000b005b23d6d6469mr6234428oti.301.1649410432050; Fri, 08
 Apr 2022 02:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220407085946.744568-1-christian.koenig@amd.com>
 <20220407085946.744568-13-christian.koenig@amd.com> <87y20ghrmy.fsf@intel.com>
 <f6f56ad0-4a5b-69b7-500d-79663f690f13@amd.com>
In-Reply-To: <f6f56ad0-4a5b-69b7-500d-79663f690f13@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 8 Apr 2022 11:33:40 +0200
Message-ID: <CAKMK7uEYbNrNZAx1k_D7u01=2-d3chResyBo9NFzG9BPq84LpA@mail.gmail.com>
Subject: Re: [PATCH 12/15] drm/i915: drop bo->moving dependency
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
Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 8 Apr 2022 at 11:27, Christian K=C3=B6nig <christian.koenig@amd.com=
> wrote:
>
> Am 08.04.22 um 11:05 schrieb Jani Nikula:
> > On Thu, 07 Apr 2022, "Christian K=C3=B6nig" <ckoenig.leichtzumerken@gma=
il.com> wrote:
> >> That should now be handled by the common dma_resv framework.
> >>
> >> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >> Cc: intel-gfx@lists.freedesktop.org
> > So, where are the i915 maintainer acks for merging this (and the other
> > patches in the series touching i915) via drm-misc-next?
> >
> > Daniel's Reviewed-by is not an ack to merge outside drm-intel-next.
>
> I had the impression that it would be sufficient.
>
> > We don't merge i915 stuff without passing CI results. Apparently this
> > one failed enough machines that the CI had to be stopped entirely.
>
> That was unfortunately partially expected and pointed out by Matthew and
> Daniel before the push.

Uh I didn't realize that CI never tested this. Usually the way then is
to rebase onto drm-tip and figure out the merge story. Doing subsystem
wide changes while not on linux-next or drm-tip or another integration
tree is just fraught with surprises due to conflicts.

Also "doesn't even compile" is really below the bar, and not the first
time this happened at all. And i915 isn't really an obscure driver
which is hard to compile test :-)
-Daniel

> i915 for some reason extended the usage of the bo->moving fence despite
> the fact we had patches on the mailing list to entirely remove this featu=
re.
>
> I couldn't get any sane CI results for weeks because of this and at some
> point we just had to go ahead and fix the clash in drm-tip.
>
> Sorry for any inconvenience cause by that. I hoped that we fixed all
> cases, but looks like we still missed some.
>
> Regards,
> Christian.
>
> >
> >
> > BR,
> > Jani.
> >
> >
> >> ---
> >>   drivers/gpu/drm/i915/gem/i915_gem_object.c    | 41 ++++-------------=
--
> >>   drivers/gpu/drm/i915/gem/i915_gem_object.h    |  8 +---
> >>   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 15 +------
> >>   .../drm/i915/gem/selftests/i915_gem_migrate.c |  3 +-
> >>   .../drm/i915/gem/selftests/i915_gem_mman.c    |  3 +-
> >>   drivers/gpu/drm/i915/i915_vma.c               |  9 +++-
> >>   6 files changed, 21 insertions(+), 58 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/=
drm/i915/gem/i915_gem_object.c
> >> index 372bc220faeb..ffde7bc0a95d 100644
> >> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> >> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> >> @@ -741,30 +741,19 @@ static const struct drm_gem_object_funcs i915_ge=
m_object_funcs =3D {
> >>   /**
> >>    * i915_gem_object_get_moving_fence - Get the object's moving fence =
if any
> >>    * @obj: The object whose moving fence to get.
> >> + * @fence: The resulting fence
> >>    *
> >>    * A non-signaled moving fence means that there is an async operatio=
n
> >>    * pending on the object that needs to be waited on before setting u=
p
> >>    * any GPU- or CPU PTEs to the object's pages.
> >>    *
> >> - * Return: A refcounted pointer to the object's moving fence if any,
> >> - * NULL otherwise.
> >> + * Return: Negative error code or 0 for success.
> >>    */
> >> -struct dma_fence *
> >> -i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj)
> >> +int i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj,
> >> +                                 struct dma_fence **fence)
> >>   {
> >> -    return dma_fence_get(i915_gem_to_ttm(obj)->moving);
> >> -}
> >> -
> >> -void i915_gem_object_set_moving_fence(struct drm_i915_gem_object *obj=
,
> >> -                                  struct dma_fence *fence)
> >> -{
> >> -    struct dma_fence **moving =3D &i915_gem_to_ttm(obj)->moving;
> >> -
> >> -    if (*moving =3D=3D fence)
> >> -            return;
> >> -
> >> -    dma_fence_put(*moving);
> >> -    *moving =3D dma_fence_get(fence);
> >> +    return dma_resv_get_singleton(obj->base.resv, DMA_RESV_USAGE_KERN=
EL,
> >> +                                  fence);
> >>   }
> >>
> >>   /**
> >> @@ -782,23 +771,9 @@ void i915_gem_object_set_moving_fence(struct drm_=
i915_gem_object *obj,
> >>   int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *ob=
j,
> >>                                    bool intr)
> >>   {
> >> -    struct dma_fence *fence =3D i915_gem_to_ttm(obj)->moving;
> >> -    int ret;
> >> -
> >>      assert_object_held(obj);
> >> -    if (!fence)
> >> -            return 0;
> >> -
> >> -    ret =3D dma_fence_wait(fence, intr);
> >> -    if (ret)
> >> -            return ret;
> >> -
> >> -    if (fence->error)
> >> -            return fence->error;
> >> -
> >> -    i915_gem_to_ttm(obj)->moving =3D NULL;
> >> -    dma_fence_put(fence);
> >> -    return 0;
> >> +    return dma_resv_wait_timeout(obj->base. resv, DMA_RESV_USAGE_KERN=
EL,
> >> +                                 intr, MAX_SCHEDULE_TIMEOUT);
> >>   }
> >>
> >>   #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
> >> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/=
drm/i915/gem/i915_gem_object.h
> >> index 02c37fe4a535..e11d82a9f7c3 100644
> >> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> >> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> >> @@ -520,12 +520,8 @@ i915_gem_object_finish_access(struct drm_i915_gem=
_object *obj)
> >>      i915_gem_object_unpin_pages(obj);
> >>   }
> >>
> >> -struct dma_fence *
> >> -i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj);
> >> -
> >> -void i915_gem_object_set_moving_fence(struct drm_i915_gem_object *obj=
,
> >> -                                  struct dma_fence *fence);
> >> -
> >> +int i915_gem_object_get_moving_fence(struct drm_i915_gem_object *obj,
> >> +                                 struct dma_fence **fence);
> >>   int i915_gem_object_wait_moving_fence(struct drm_i915_gem_object *ob=
j,
> >>                                    bool intr);
> >>
> >> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gp=
u/drm/i915/gem/i915_gem_ttm_move.c
> >> index 438b8a95b3d1..a10716f4e717 100644
> >> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> >> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> >> @@ -467,19 +467,6 @@ __i915_ttm_move(struct ttm_buffer_object *bo,
> >>      return fence;
> >>   }
> >>
> >> -static int
> >> -prev_deps(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx=
,
> >> -      struct i915_deps *deps)
> >> -{
> >> -    int ret;
> >> -
> >> -    ret =3D i915_deps_add_dependency(deps, bo->moving, ctx);
> >> -    if (!ret)
> >> -            ret =3D i915_deps_add_resv(deps, bo->base.resv, ctx);
> >> -
> >> -    return ret;
> >> -}
> >> -
> >>   /**
> >>    * i915_ttm_move - The TTM move callback used by i915.
> >>    * @bo: The buffer object.
> >> @@ -534,7 +521,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bo=
ol evict,
> >>              struct i915_deps deps;
> >>
> >>              i915_deps_init(&deps, GFP_KERNEL | __GFP_NORETRY | __GFP_=
NOWARN);
> >> -            ret =3D prev_deps(bo, ctx, &deps);
> >> +            ret =3D i915_deps_add_resv(&deps, bo->base.resv, ctx);
> >>              if (ret) {
> >>                      i915_refct_sgt_put(dst_rsgt);
> >>                      return ret;
> >> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c b/d=
rivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
> >> index 4997ed18b6e4..0ad443a90c8b 100644
> >> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
> >> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_migrate.c
> >> @@ -219,8 +219,7 @@ static int __igt_lmem_pages_migrate(struct intel_g=
t *gt,
> >>                      err =3D dma_resv_reserve_fences(obj->base.resv, 1=
);
> >>                      if (!err)
> >>                              dma_resv_add_fence(obj->base.resv, &rq->f=
ence,
> >> -                                               DMA_RESV_USAGE_WRITE);
> >> -                    i915_gem_object_set_moving_fence(obj, &rq->fence)=
;
> >> +                                               DMA_RESV_USAGE_KERNEL)=
;
> >>                      i915_request_put(rq);
> >>              }
> >>              if (err)
> >> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/driv=
ers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> >> index 3a6e3f6d239f..dfc34cc2ef8c 100644
> >> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> >> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
> >> @@ -1221,8 +1221,7 @@ static int __igt_mmap_migrate(struct intel_memor=
y_region **placements,
> >>      i915_gem_object_unpin_pages(obj);
> >>      if (rq) {
> >>              dma_resv_add_fence(obj->base.resv, &rq->fence,
> >> -                               DMA_RESV_USAGE_WRITE);
> >> -            i915_gem_object_set_moving_fence(obj, &rq->fence);
> >> +                               DMA_RESV_USAGE_KERNEL);
> >>              i915_request_put(rq);
> >>      }
> >>      i915_gem_object_unlock(obj);
> >> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i9=
15_vma.c
> >> index 524477d8939e..d077f7b9eaad 100644
> >> --- a/drivers/gpu/drm/i915/i915_vma.c
> >> +++ b/drivers/gpu/drm/i915/i915_vma.c
> >> @@ -1357,10 +1357,17 @@ int i915_vma_pin_ww(struct i915_vma *vma, stru=
ct i915_gem_ww_ctx *ww,
> >>      if (err)
> >>              return err;
> >>
> >> +    if (vma->obj) {
> >> +            err =3D i915_gem_object_get_moving_fence(vma->obj, &movin=
g);
> >> +            if (err)
> >> +                    return err;
> >> +    } else {
> >> +            moving =3D NULL;
> >> +    }
> >> +
> >>      if (flags & PIN_GLOBAL)
> >>              wakeref =3D intel_runtime_pm_get(&vma->vm->i915->runtime_=
pm);
> >>
> >> -    moving =3D vma->obj ? i915_gem_object_get_moving_fence(vma->obj) =
: NULL;
> >>      if (flags & vma->vm->bind_async_flags || moving) {
> >>              /* lock VM */
> >>              err =3D i915_vm_lock_objects(vma->vm, ww);
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
