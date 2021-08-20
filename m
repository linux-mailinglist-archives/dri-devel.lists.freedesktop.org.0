Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A39793F32A3
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 19:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6C26EAD4;
	Fri, 20 Aug 2021 17:59:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72B86EAD4
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 17:59:16 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 k12-20020a056830150c00b0051abe7f680bso10610914otp.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 10:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JDVBm6I3BGiyh1jRlkhoYh+FsqkkxaN1c28nTbNSDwg=;
 b=ZXHcKsIocdCSFEyh9sekUEKug+uqiIwWwWeR9s6fGn1ZbX00Pl89xZPJLBJwVONrqz
 /J3ihpQMkWymoUonjagJVXybD+5IFlFhtJA20GPYjx/p4OaQl1uWbK7QxjQBhMEgjf+J
 nXMoc7g3roT9LoXIjz7BD1ILlznMsg2lIrxYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JDVBm6I3BGiyh1jRlkhoYh+FsqkkxaN1c28nTbNSDwg=;
 b=TkwM3Lbe6TUyR5WrktlQ3D+Q/Qg8J6gSE1pPFZUxBy6xCE4ygf9dcVyXjvPZI0RwBu
 ooQ3GSgjH/HOug4R7h0rrksBgmgzz/OhoB6ovfV/r7/WKQpp1hT5hj97e7iG0sAL7/nU
 +VJXuMJ/LA2meK8h+RyaWI7iks8jhu1m+8uAuC8xI0S1lC7IjAkUtytPLCvdo4ijsyxP
 mVlJb1wo5Q2vHO+qmhQBY7owYWIUeshWOefY09nf50HUprpCc4lho7zUoAAivQEs8iuc
 0210Pf5v4D+3tc8SiS/jsiLtp9W8A1GvAd5UrIp1k1vpnCW+GiR/k7w8wNbw1sS1YAsQ
 u0Dw==
X-Gm-Message-State: AOAM531rzjIJxfUwQLDwBY/B+rfDyhygtGwMJvOyfBhdhGPumSPuUfXc
 nIND7d9iga3NTa4Y2h33Rtxj7/MMiI7Zh2vrukRDEA==
X-Google-Smtp-Source: ABdhPJwA2TZYt+QOa28T9iKQO6RUwPa3j7wUiqLsNv4CQMBkyqfpBq7/9ymCAD8FQuQYE2/bvgCDZM7lDlM1iHhbCxs=
X-Received: by 2002:a9d:4785:: with SMTP id b5mr18021176otf.188.1629482356066; 
 Fri, 20 Aug 2021 10:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210820154932.296628-1-daniel.vetter@ffwll.ch>
 <YR/fjM7fDbMHZh5b@intel.com>
In-Reply-To: <YR/fjM7fDbMHZh5b@intel.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Fri, 20 Aug 2021 19:59:04 +0200
Message-ID: <CAKMK7uG_dU1kZa21JDWa4ZnCGc1A2bdUU1H-b2ZF8E0Hmob-eA@mail.gmail.com>
Subject: Re: [PATCH] drm/i915: Actually delete gpu reloc selftests
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, 
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Matthew Auld <matthew.auld@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>, 
 Dave Airlie <airlied@redhat.com>, Jason Ekstrand <jason@jlekstrand.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 20, 2021 at 7:00 PM Rodrigo Vivi <rodrigo.vivi@intel.com> wrote=
:
>
> On Fri, Aug 20, 2021 at 05:49:32PM +0200, Daniel Vetter wrote:
> > In
> >
> > commit 8e02cceb1f1f4f254625e5338dd997ff61ab40d7
> > Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Date:   Tue Aug 3 14:48:33 2021 +0200
> >
> >     drm/i915: delete gpu reloc code
>
> it would be better with dim cite format...
>
> do we need the Fixes: tag?

I did delete the selftest, I just forgot to delete the code. So no
Fixes: imo. I'll bikeshed the commit citation.

> anyway:
>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thanks for the review, will merge when CI approves too, one never knows.
-Daniel

>
>
> >
> > I deleted the gpu relocation code and the selftest include and
> > enabling, but accidentally forgot about the selftest source code.
> >
> > Fix this oversight.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > Cc: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > ---
> >  .../i915/gem/selftests/i915_gem_execbuffer.c  | 190 ------------------
> >  1 file changed, 190 deletions(-)
> >  delete mode 100644 drivers/gpu/drm/i915/gem/selftests/i915_gem_execbuf=
fer.c
> >
> > diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_execbuffer.c b=
/drivers/gpu/drm/i915/gem/selftests/i915_gem_execbuffer.c
> > deleted file mode 100644
> > index 16162fc2782d..000000000000
> > --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_execbuffer.c
> > +++ /dev/null
> > @@ -1,190 +0,0 @@
> > -// SPDX-License-Identifier: MIT
> > -/*
> > - * Copyright =C2=A9 2020 Intel Corporation
> > - */
> > -
> > -#include "i915_selftest.h"
> > -
> > -#include "gt/intel_engine_pm.h"
> > -#include "selftests/igt_flush_test.h"
> > -
> > -static u64 read_reloc(const u32 *map, int x, const u64 mask)
> > -{
> > -     u64 reloc;
> > -
> > -     memcpy(&reloc, &map[x], sizeof(reloc));
> > -     return reloc & mask;
> > -}
> > -
> > -static int __igt_gpu_reloc(struct i915_execbuffer *eb,
> > -                        struct drm_i915_gem_object *obj)
> > -{
> > -     const unsigned int offsets[] =3D { 8, 3, 0 };
> > -     const u64 mask =3D
> > -             GENMASK_ULL(eb->reloc_cache.use_64bit_reloc ? 63 : 31, 0)=
;
> > -     const u32 *map =3D page_mask_bits(obj->mm.mapping);
> > -     struct i915_request *rq;
> > -     struct i915_vma *vma;
> > -     int err;
> > -     int i;
> > -
> > -     vma =3D i915_vma_instance(obj, eb->context->vm, NULL);
> > -     if (IS_ERR(vma))
> > -             return PTR_ERR(vma);
> > -
> > -     err =3D i915_gem_object_lock(obj, &eb->ww);
> > -     if (err)
> > -             return err;
> > -
> > -     err =3D i915_vma_pin_ww(vma, &eb->ww, 0, 0, PIN_USER | PIN_HIGH);
> > -     if (err)
> > -             return err;
> > -
> > -     /* 8-Byte aligned */
> > -     err =3D __reloc_entry_gpu(eb, vma, offsets[0] * sizeof(u32), 0);
> > -     if (err <=3D 0)
> > -             goto reloc_err;
> > -
> > -     /* !8-Byte aligned */
> > -     err =3D __reloc_entry_gpu(eb, vma, offsets[1] * sizeof(u32), 1);
> > -     if (err <=3D 0)
> > -             goto reloc_err;
> > -
> > -     /* Skip to the end of the cmd page */
> > -     i =3D PAGE_SIZE / sizeof(u32) - 1;
> > -     i -=3D eb->reloc_cache.rq_size;
> > -     memset32(eb->reloc_cache.rq_cmd + eb->reloc_cache.rq_size,
> > -              MI_NOOP, i);
> > -     eb->reloc_cache.rq_size +=3D i;
> > -
> > -     /* Force next batch */
> > -     err =3D __reloc_entry_gpu(eb, vma, offsets[2] * sizeof(u32), 2);
> > -     if (err <=3D 0)
> > -             goto reloc_err;
> > -
> > -     GEM_BUG_ON(!eb->reloc_cache.rq);
> > -     rq =3D i915_request_get(eb->reloc_cache.rq);
> > -     reloc_gpu_flush(eb, &eb->reloc_cache);
> > -     GEM_BUG_ON(eb->reloc_cache.rq);
> > -
> > -     err =3D i915_gem_object_wait(obj, I915_WAIT_INTERRUPTIBLE, HZ / 2=
);
> > -     if (err) {
> > -             intel_gt_set_wedged(eb->engine->gt);
> > -             goto put_rq;
> > -     }
> > -
> > -     if (!i915_request_completed(rq)) {
> > -             pr_err("%s: did not wait for relocations!\n", eb->engine-=
>name);
> > -             err =3D -EINVAL;
> > -             goto put_rq;
> > -     }
> > -
> > -     for (i =3D 0; i < ARRAY_SIZE(offsets); i++) {
> > -             u64 reloc =3D read_reloc(map, offsets[i], mask);
> > -
> > -             if (reloc !=3D i) {
> > -                     pr_err("%s[%d]: map[%d] %llx !=3D %x\n",
> > -                            eb->engine->name, i, offsets[i], reloc, i)=
;
> > -                     err =3D -EINVAL;
> > -             }
> > -     }
> > -     if (err)
> > -             igt_hexdump(map, 4096);
> > -
> > -put_rq:
> > -     i915_request_put(rq);
> > -unpin_vma:
> > -     i915_vma_unpin(vma);
> > -     return err;
> > -
> > -reloc_err:
> > -     if (!err)
> > -             err =3D -EIO;
> > -     goto unpin_vma;
> > -}
> > -
> > -static int igt_gpu_reloc(void *arg)
> > -{
> > -     struct i915_execbuffer eb;
> > -     struct drm_i915_gem_object *scratch;
> > -     int err =3D 0;
> > -     u32 *map;
> > -
> > -     eb.i915 =3D arg;
> > -
> > -     scratch =3D i915_gem_object_create_internal(eb.i915, 4096);
> > -     if (IS_ERR(scratch))
> > -             return PTR_ERR(scratch);
> > -
> > -     map =3D i915_gem_object_pin_map_unlocked(scratch, I915_MAP_WC);
> > -     if (IS_ERR(map)) {
> > -             err =3D PTR_ERR(map);
> > -             goto err_scratch;
> > -     }
> > -
> > -     intel_gt_pm_get(&eb.i915->gt);
> > -
> > -     for_each_uabi_engine(eb.engine, eb.i915) {
> > -             if (intel_engine_requires_cmd_parser(eb.engine) ||
> > -                 intel_engine_using_cmd_parser(eb.engine))
> > -                     continue;
> > -
> > -             reloc_cache_init(&eb.reloc_cache, eb.i915);
> > -             memset(map, POISON_INUSE, 4096);
> > -
> > -             intel_engine_pm_get(eb.engine);
> > -             eb.context =3D intel_context_create(eb.engine);
> > -             if (IS_ERR(eb.context)) {
> > -                     err =3D PTR_ERR(eb.context);
> > -                     goto err_pm;
> > -             }
> > -             eb.reloc_pool =3D NULL;
> > -             eb.reloc_context =3D NULL;
> > -
> > -             i915_gem_ww_ctx_init(&eb.ww, false);
> > -retry:
> > -             err =3D intel_context_pin_ww(eb.context, &eb.ww);
> > -             if (!err) {
> > -                     err =3D __igt_gpu_reloc(&eb, scratch);
> > -
> > -                     intel_context_unpin(eb.context);
> > -             }
> > -             if (err =3D=3D -EDEADLK) {
> > -                     err =3D i915_gem_ww_ctx_backoff(&eb.ww);
> > -                     if (!err)
> > -                             goto retry;
> > -             }
> > -             i915_gem_ww_ctx_fini(&eb.ww);
> > -
> > -             if (eb.reloc_pool)
> > -                     intel_gt_buffer_pool_put(eb.reloc_pool);
> > -             if (eb.reloc_context)
> > -                     intel_context_put(eb.reloc_context);
> > -
> > -             intel_context_put(eb.context);
> > -err_pm:
> > -             intel_engine_pm_put(eb.engine);
> > -             if (err)
> > -                     break;
> > -     }
> > -
> > -     if (igt_flush_test(eb.i915))
> > -             err =3D -EIO;
> > -
> > -     intel_gt_pm_put(&eb.i915->gt);
> > -err_scratch:
> > -     i915_gem_object_put(scratch);
> > -     return err;
> > -}
> > -
> > -int i915_gem_execbuffer_live_selftests(struct drm_i915_private *i915)
> > -{
> > -     static const struct i915_subtest tests[] =3D {
> > -             SUBTEST(igt_gpu_reloc),
> > -     };
> > -
> > -     if (intel_gt_is_wedged(&i915->gt))
> > -             return 0;
> > -
> > -     return i915_live_subtests(tests, i915);
> > -}
> > --
> > 2.32.0
> >



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
