Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D83DD3F95D1
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 10:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47FAD6E8F1;
	Fri, 27 Aug 2021 08:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA2D6E8F1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 08:13:40 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id b6so9072379wrh.10
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 01:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=2s59FfRG78bE8LxIeg1Zj8OdCh3zZnI3gg7/dazHWA4=;
 b=Kdeb1fAG7//r6DeGePhfvKFBXK0qvLA5s2kT1G9xMjshC5lbuti0zxpCZLjQ2B3gx6
 Ur0e4z09eQenuGU9OQZxNV3LH7wV25UtCEWI1RDIaU+RF7z1nFkrZNsQS08xcBms0QOY
 YRbvAEG0SOGfCOPfMNp3r8pBX7v+hR7G17ugg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=2s59FfRG78bE8LxIeg1Zj8OdCh3zZnI3gg7/dazHWA4=;
 b=mqrorhMo606IT5vBePNWE3BowMAg5g0RK/F7uw73JPm5XKkyAWLRLWkLT7fphPv1yH
 SwrATxk6SvDFvKqJZGmA2ED8TwAcm1GGvk8d38qENz3sCcJyRXdRHLqytdy9EMebCxAU
 gU4A/L/2FZk8a1vuq9FK4fyl4GxTEtY6s3wuZRT9WExxt50GN7QDhtJ4diPnmIKOzSyG
 ltkFCRbMZ97LASTFMVjjQtvjZyeQsSZBFRmerBD1ERqWeNQo0OXkf4jHuwha/UUV5pND
 KJDRsNrqvTW0S1q4Tqt1Yiu1k2gWy0wHwKAXuu8yZ+VViCftovZEmnIpve6CqY7HJlOW
 glGA==
X-Gm-Message-State: AOAM533b1D6vbBVSW1zNZrzOFi9Egbsyrkd/yvQpAmg/rtHYO4Ko35w8
 MS82Tv4mA473Gbipak5WLsz8rg==
X-Google-Smtp-Source: ABdhPJxyr85yRqeMose6PPIDndQ8Z3GywH1iVXOk6X6WTLRuAPDm6BMdOKs0q/JSmV4qlZWreefNhg==
X-Received: by 2002:adf:c10c:: with SMTP id r12mr1113052wre.142.1630052018990; 
 Fri, 27 Aug 2021 01:13:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l1sm3718664wrb.15.2021.08.27.01.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 01:13:38 -0700 (PDT)
Date: Fri, 27 Aug 2021 10:13:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Dave Airlie <airlied@redhat.com>, Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH] drm/i915: Actually delete gpu reloc selftests
Message-ID: <YSiesBxB0Grrcdya@phenom.ffwll.local>
References: <20210820154932.296628-1-daniel.vetter@ffwll.ch>
 <YR/fjM7fDbMHZh5b@intel.com>
 <CAKMK7uG_dU1kZa21JDWa4ZnCGc1A2bdUU1H-b2ZF8E0Hmob-eA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKMK7uG_dU1kZa21JDWa4ZnCGc1A2bdUU1H-b2ZF8E0Hmob-eA@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Fri, Aug 20, 2021 at 07:59:04PM +0200, Daniel Vetter wrote:
> On Fri, Aug 20, 2021 at 7:00 PM Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> >
> > On Fri, Aug 20, 2021 at 05:49:32PM +0200, Daniel Vetter wrote:
> > > In
> > >
> > > commit 8e02cceb1f1f4f254625e5338dd997ff61ab40d7
> > > Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Date:   Tue Aug 3 14:48:33 2021 +0200
> > >
> > >     drm/i915: delete gpu reloc code
> >
> > it would be better with dim cite format...
> >
> > do we need the Fixes: tag?
> 
> I did delete the selftest, I just forgot to delete the code. So no
> Fixes: imo. I'll bikeshed the commit citation.
> 
> > anyway:
> >
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Thanks for the review, will merge when CI approves too, one never knows.

Well CI fell over in noise, but it builds still, so good enough for this
one :-)
-Daniel

> -Daniel
> 
> >
> >
> > >
> > > I deleted the gpu relocation code and the selftest include and
> > > enabling, but accidentally forgot about the selftest source code.
> > >
> > > Fix this oversight.
> > >
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> > > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> > > Cc: Dave Airlie <airlied@redhat.com>
> > > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > > ---
> > >  .../i915/gem/selftests/i915_gem_execbuffer.c  | 190 ------------------
> > >  1 file changed, 190 deletions(-)
> > >  delete mode 100644 drivers/gpu/drm/i915/gem/selftests/i915_gem_execbuffer.c
> > >
> > > diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_execbuffer.c
> > > deleted file mode 100644
> > > index 16162fc2782d..000000000000
> > > --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_execbuffer.c
> > > +++ /dev/null
> > > @@ -1,190 +0,0 @@
> > > -// SPDX-License-Identifier: MIT
> > > -/*
> > > - * Copyright © 2020 Intel Corporation
> > > - */
> > > -
> > > -#include "i915_selftest.h"
> > > -
> > > -#include "gt/intel_engine_pm.h"
> > > -#include "selftests/igt_flush_test.h"
> > > -
> > > -static u64 read_reloc(const u32 *map, int x, const u64 mask)
> > > -{
> > > -     u64 reloc;
> > > -
> > > -     memcpy(&reloc, &map[x], sizeof(reloc));
> > > -     return reloc & mask;
> > > -}
> > > -
> > > -static int __igt_gpu_reloc(struct i915_execbuffer *eb,
> > > -                        struct drm_i915_gem_object *obj)
> > > -{
> > > -     const unsigned int offsets[] = { 8, 3, 0 };
> > > -     const u64 mask =
> > > -             GENMASK_ULL(eb->reloc_cache.use_64bit_reloc ? 63 : 31, 0);
> > > -     const u32 *map = page_mask_bits(obj->mm.mapping);
> > > -     struct i915_request *rq;
> > > -     struct i915_vma *vma;
> > > -     int err;
> > > -     int i;
> > > -
> > > -     vma = i915_vma_instance(obj, eb->context->vm, NULL);
> > > -     if (IS_ERR(vma))
> > > -             return PTR_ERR(vma);
> > > -
> > > -     err = i915_gem_object_lock(obj, &eb->ww);
> > > -     if (err)
> > > -             return err;
> > > -
> > > -     err = i915_vma_pin_ww(vma, &eb->ww, 0, 0, PIN_USER | PIN_HIGH);
> > > -     if (err)
> > > -             return err;
> > > -
> > > -     /* 8-Byte aligned */
> > > -     err = __reloc_entry_gpu(eb, vma, offsets[0] * sizeof(u32), 0);
> > > -     if (err <= 0)
> > > -             goto reloc_err;
> > > -
> > > -     /* !8-Byte aligned */
> > > -     err = __reloc_entry_gpu(eb, vma, offsets[1] * sizeof(u32), 1);
> > > -     if (err <= 0)
> > > -             goto reloc_err;
> > > -
> > > -     /* Skip to the end of the cmd page */
> > > -     i = PAGE_SIZE / sizeof(u32) - 1;
> > > -     i -= eb->reloc_cache.rq_size;
> > > -     memset32(eb->reloc_cache.rq_cmd + eb->reloc_cache.rq_size,
> > > -              MI_NOOP, i);
> > > -     eb->reloc_cache.rq_size += i;
> > > -
> > > -     /* Force next batch */
> > > -     err = __reloc_entry_gpu(eb, vma, offsets[2] * sizeof(u32), 2);
> > > -     if (err <= 0)
> > > -             goto reloc_err;
> > > -
> > > -     GEM_BUG_ON(!eb->reloc_cache.rq);
> > > -     rq = i915_request_get(eb->reloc_cache.rq);
> > > -     reloc_gpu_flush(eb, &eb->reloc_cache);
> > > -     GEM_BUG_ON(eb->reloc_cache.rq);
> > > -
> > > -     err = i915_gem_object_wait(obj, I915_WAIT_INTERRUPTIBLE, HZ / 2);
> > > -     if (err) {
> > > -             intel_gt_set_wedged(eb->engine->gt);
> > > -             goto put_rq;
> > > -     }
> > > -
> > > -     if (!i915_request_completed(rq)) {
> > > -             pr_err("%s: did not wait for relocations!\n", eb->engine->name);
> > > -             err = -EINVAL;
> > > -             goto put_rq;
> > > -     }
> > > -
> > > -     for (i = 0; i < ARRAY_SIZE(offsets); i++) {
> > > -             u64 reloc = read_reloc(map, offsets[i], mask);
> > > -
> > > -             if (reloc != i) {
> > > -                     pr_err("%s[%d]: map[%d] %llx != %x\n",
> > > -                            eb->engine->name, i, offsets[i], reloc, i);
> > > -                     err = -EINVAL;
> > > -             }
> > > -     }
> > > -     if (err)
> > > -             igt_hexdump(map, 4096);
> > > -
> > > -put_rq:
> > > -     i915_request_put(rq);
> > > -unpin_vma:
> > > -     i915_vma_unpin(vma);
> > > -     return err;
> > > -
> > > -reloc_err:
> > > -     if (!err)
> > > -             err = -EIO;
> > > -     goto unpin_vma;
> > > -}
> > > -
> > > -static int igt_gpu_reloc(void *arg)
> > > -{
> > > -     struct i915_execbuffer eb;
> > > -     struct drm_i915_gem_object *scratch;
> > > -     int err = 0;
> > > -     u32 *map;
> > > -
> > > -     eb.i915 = arg;
> > > -
> > > -     scratch = i915_gem_object_create_internal(eb.i915, 4096);
> > > -     if (IS_ERR(scratch))
> > > -             return PTR_ERR(scratch);
> > > -
> > > -     map = i915_gem_object_pin_map_unlocked(scratch, I915_MAP_WC);
> > > -     if (IS_ERR(map)) {
> > > -             err = PTR_ERR(map);
> > > -             goto err_scratch;
> > > -     }
> > > -
> > > -     intel_gt_pm_get(&eb.i915->gt);
> > > -
> > > -     for_each_uabi_engine(eb.engine, eb.i915) {
> > > -             if (intel_engine_requires_cmd_parser(eb.engine) ||
> > > -                 intel_engine_using_cmd_parser(eb.engine))
> > > -                     continue;
> > > -
> > > -             reloc_cache_init(&eb.reloc_cache, eb.i915);
> > > -             memset(map, POISON_INUSE, 4096);
> > > -
> > > -             intel_engine_pm_get(eb.engine);
> > > -             eb.context = intel_context_create(eb.engine);
> > > -             if (IS_ERR(eb.context)) {
> > > -                     err = PTR_ERR(eb.context);
> > > -                     goto err_pm;
> > > -             }
> > > -             eb.reloc_pool = NULL;
> > > -             eb.reloc_context = NULL;
> > > -
> > > -             i915_gem_ww_ctx_init(&eb.ww, false);
> > > -retry:
> > > -             err = intel_context_pin_ww(eb.context, &eb.ww);
> > > -             if (!err) {
> > > -                     err = __igt_gpu_reloc(&eb, scratch);
> > > -
> > > -                     intel_context_unpin(eb.context);
> > > -             }
> > > -             if (err == -EDEADLK) {
> > > -                     err = i915_gem_ww_ctx_backoff(&eb.ww);
> > > -                     if (!err)
> > > -                             goto retry;
> > > -             }
> > > -             i915_gem_ww_ctx_fini(&eb.ww);
> > > -
> > > -             if (eb.reloc_pool)
> > > -                     intel_gt_buffer_pool_put(eb.reloc_pool);
> > > -             if (eb.reloc_context)
> > > -                     intel_context_put(eb.reloc_context);
> > > -
> > > -             intel_context_put(eb.context);
> > > -err_pm:
> > > -             intel_engine_pm_put(eb.engine);
> > > -             if (err)
> > > -                     break;
> > > -     }
> > > -
> > > -     if (igt_flush_test(eb.i915))
> > > -             err = -EIO;
> > > -
> > > -     intel_gt_pm_put(&eb.i915->gt);
> > > -err_scratch:
> > > -     i915_gem_object_put(scratch);
> > > -     return err;
> > > -}
> > > -
> > > -int i915_gem_execbuffer_live_selftests(struct drm_i915_private *i915)
> > > -{
> > > -     static const struct i915_subtest tests[] = {
> > > -             SUBTEST(igt_gpu_reloc),
> > > -     };
> > > -
> > > -     if (intel_gt_is_wedged(&i915->gt))
> > > -             return 0;
> > > -
> > > -     return i915_live_subtests(tests, i915);
> > > -}
> > > --
> > > 2.32.0
> > >
> 
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
