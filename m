Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A303E11EA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 12:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9F86E038;
	Thu,  5 Aug 2021 10:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694B16E038
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 10:05:33 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id q6so6640287oiw.7
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 03:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yia+LyRcDBuzDnzMbGNn3kAOSWfcYCVnFnEZf6XYtRI=;
 b=DMFjkTjcPxhUPJQFZDLncOZVhxW5PHMGt3u6vA8bdiV+Kr47GCXkDFnT47u2KgGXbc
 qtNNXq6Qb5NyIRW7hIze6UIPHZ1Z6PtfKFWaOXdVV+/UP9a85KUM6bBK9VCOpGG+1tsd
 0CmqIvisVET21hQhhNrkfTCiV814EdLDMHpCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yia+LyRcDBuzDnzMbGNn3kAOSWfcYCVnFnEZf6XYtRI=;
 b=cR/nQWvwYStdDVLpWZqiYogNRpk6lqWgmACdwZwYmkMe4QRhqJ5j+qwWqf5611r9Ox
 E3842Wlj6XDRWc0BSzQdHPxq6IpLsYz1KQ43zerAxOb9fq4LSB/OABEvmLbv/s+z2jr5
 TK6Ryv1BT5zEjX+qC+W9/NThoG2dkSbo3Yr7b4iRETjNjrVapM+5U9ab2yCZK9geZA6T
 OeV5v2311V4f8cinijEWmKup+yylbiW54B6b1+95Gj01VDNiTdfN5QPCXsgC7PX9Pq9V
 WYUICSqKivPaQrAqFmDvDMmPr4WyuFZg/kS/9tIy3GzswP/VTV7BkAR4SiyPygw/bM3A
 4PEg==
X-Gm-Message-State: AOAM531243yqu4NFVkqJxtv8eEJ94C/BrLHlYNO9uM/rW5GM2GhM5FQx
 JUh0U4C8wiGHvbY6Cg6u7k+mhbcIhENQlibrScidd1J9rgQ=
X-Google-Smtp-Source: ABdhPJzgpB7xld6TBDyheJXp3Bn4mNnDZC6MgUvP6geIJL1TweQpGVRMwpo2t9geB1QQhegU7pgQNDaQmeI4O0A2Ef0=
X-Received: by 2002:a54:4015:: with SMTP id x21mr779745oie.128.1628157932171; 
 Thu, 05 Aug 2021 03:05:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210617063018.92802-1-thomas.hellstrom@linux.intel.com>
 <20210617063018.92802-8-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20210617063018.92802-8-thomas.hellstrom@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 5 Aug 2021 12:05:21 +0200
Message-ID: <CAKMK7uG6g+DQQEcjqeA6=Z2ENHogaMuvKERDgKm5jKq3u+a1jQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v5 07/12] drm/i915/gt: Pipelined page migration
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 "Bloomfield, Jon" <jon.bloomfield@intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>, 
 Chris Wilson <chris@chris-wilson.co.uk>
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

On Thu, Jun 17, 2021 at 8:30 AM Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
>
> If we pipeline the PTE updates and then do the copy of those pages
> within a single unpreemptible command packet, we can submit the copies
> and leave them to be scheduled without having to synchronously wait
> under a global lock. In order to manage migration, we need to
> preallocate the page tables (and keep them pinned and available for use
> at any time), causing a bottleneck for migrations as all clients must
> contend on the limited resources. By inlining the ppGTT updates and
> performing the blit atomically, each client only owns the PTE while in
> use, and so we can reschedule individual operations however we see fit.
> And most importantly, we do not need to take a global lock on the shared
> vm, and wait until the operation is complete before releasing the lock
> for others to claim the PTE for themselves.
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Co-developed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> ---
> v2:
> - Add a TODO for huge LMEM ptes (Pointed out by Matthew Auld)
> - Use intel_engine_destroy_pinned_context() to properly take the pinned
>   context timeline off the engine list. (CI warning).
> v3:
> - Remove an obsolete GEM_BUG_ON (Pointed out by Matthew Auld)
> - Fix the size argument in allocate_va_range() to not include the base
>   (Pointed out by Matthew Auld)

I stumbled over this because I was chasing some intel_context->vm
users, and have a few comments and questions.

First, we generally keep the patch changelog above the cut, it's often
fairly useful information when browsing old history.

> ---
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  drivers/gpu/drm/i915/gt/intel_engine.h        |   1 +
>  drivers/gpu/drm/i915/gt/intel_gpu_commands.h  |   2 +
>  drivers/gpu/drm/i915/gt/intel_migrate.c       | 542 ++++++++++++++++++
>  drivers/gpu/drm/i915/gt/intel_migrate.h       |  45 ++
>  drivers/gpu/drm/i915/gt/intel_migrate_types.h |  15 +
>  drivers/gpu/drm/i915/gt/intel_ring.h          |   1 +
>  drivers/gpu/drm/i915/gt/selftest_migrate.c    | 291 ++++++++++
>  .../drm/i915/selftests/i915_live_selftests.h  |   1 +
>  9 files changed, 899 insertions(+)
>  create mode 100644 drivers/gpu/drm/i915/gt/intel_migrate.c
>  create mode 100644 drivers/gpu/drm/i915/gt/intel_migrate.h
>  create mode 100644 drivers/gpu/drm/i915/gt/intel_migrate_types.h
>  create mode 100644 drivers/gpu/drm/i915/gt/selftest_migrate.c
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefil=
e
> index dde698f3bff4..5e10e0628c56 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -108,6 +108,7 @@ gt-y +=3D \
>         gt/intel_gtt.o \
>         gt/intel_llc.o \
>         gt/intel_lrc.o \
> +       gt/intel_migrate.o \
>         gt/intel_mocs.o \
>         gt/intel_ppgtt.o \
>         gt/intel_rc6.o \
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i91=
5/gt/intel_engine.h
> index 36ea9eb52bb5..62f7440bc111 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> @@ -188,6 +188,7 @@ intel_write_status_page(struct intel_engine_cs *engin=
e, int reg, u32 value)
>  #define I915_GEM_HWS_PREEMPT_ADDR      (I915_GEM_HWS_PREEMPT * sizeof(u3=
2))
>  #define I915_GEM_HWS_SEQNO             0x40
>  #define I915_GEM_HWS_SEQNO_ADDR                (I915_GEM_HWS_SEQNO * siz=
eof(u32))
> +#define I915_GEM_HWS_MIGRATE           (0x42 * sizeof(u32))
>  #define I915_GEM_HWS_SCRATCH           0x80
>
>  #define I915_HWS_CSB_BUF0_INDEX                0x10
> diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/d=
rm/i915/gt/intel_gpu_commands.h
> index 2694dbb9967e..1c3af0fc0456 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> @@ -123,8 +123,10 @@
>  #define   MI_SEMAPHORE_SAD_NEQ_SDD     (5 << 12)
>  #define   MI_SEMAPHORE_TOKEN_MASK      REG_GENMASK(9, 5)
>  #define   MI_SEMAPHORE_TOKEN_SHIFT     5
> +#define MI_STORE_DATA_IMM      MI_INSTR(0x20, 0)
>  #define MI_STORE_DWORD_IMM     MI_INSTR(0x20, 1)
>  #define MI_STORE_DWORD_IMM_GEN4        MI_INSTR(0x20, 2)
> +#define MI_STORE_QWORD_IMM_GEN8 (MI_INSTR(0x20, 3) | REG_BIT(21))
>  #define   MI_MEM_VIRTUAL       (1 << 22) /* 945,g33,965 */
>  #define   MI_USE_GGTT          (1 << 22) /* g4x+ */
>  #define MI_STORE_DWORD_INDEX   MI_INSTR(0x21, 1)
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i9=
15/gt/intel_migrate.c
> new file mode 100644
> index 000000000000..e2e860063e7b
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -0,0 +1,542 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2020 Intel Corporation
> + */
> +
> +#include "i915_drv.h"
> +#include "intel_context.h"
> +#include "intel_gpu_commands.h"
> +#include "intel_gt.h"
> +#include "intel_gtt.h"
> +#include "intel_migrate.h"
> +#include "intel_ring.h"
> +
> +struct insert_pte_data {
> +       u64 offset;
> +       bool is_lmem;
> +};
> +
> +#define CHUNK_SZ SZ_8M /* ~1ms at 8GiB/s preemption delay */
> +
> +static bool engine_supports_migration(struct intel_engine_cs *engine)

This function seems like a rather elobarote way to write a NULL check.
Do we really need this?
> +{
> +       if (!engine)
> +               return false;
> +
> +       /*
> +        * We need the ability to prevent aribtration (MI_ARB_ON_OFF),
> +        * the ability to write PTE using inline data (MI_STORE_DATA)
> +        * and of course the ability to do the block transfer (blits).
> +        */
> +       GEM_BUG_ON(engine->class !=3D COPY_ENGINE_CLASS);
> +
> +       return true;
> +}
> +
> +static void insert_pte(struct i915_address_space *vm,
> +                      struct i915_page_table *pt,
> +                      void *data)
> +{
> +       struct insert_pte_data *d =3D data;
> +
> +       vm->insert_page(vm, px_dma(pt), d->offset, I915_CACHE_NONE,
> +                       d->is_lmem ? PTE_LM : 0);
> +       d->offset +=3D PAGE_SIZE;
> +}
> +
> +static struct i915_address_space *migrate_vm(struct intel_gt *gt)
> +{
> +       struct i915_vm_pt_stash stash =3D {};
> +       struct i915_ppgtt *vm;
> +       int err;
> +       int i;
> +
> +       /*
> +        * We construct a very special VM for use by all migration contex=
ts,
> +        * it is kept pinned so that it can be used at any time. As we ne=
ed
> +        * to pre-allocate the page directories for the migration VM, thi=
s
> +        * limits us to only using a small number of prepared vma.
> +        *
> +        * To be able to pipeline and reschedule migration operations whi=
le
> +        * avoiding unnecessary contention on the vm itself, the PTE upda=
tes
> +        * are inline with the blits. All the blits use the same fixed
> +        * addresses, with the backing store redirection being updated on=
 the
> +        * fly. Only 2 implicit vma are used for all migration operations=
.
> +        *
> +        * We lay the ppGTT out as:
> +        *
> +        *      [0, CHUNK_SZ) -> first object
> +        *      [CHUNK_SZ, 2 * CHUNK_SZ) -> second object
> +        *      [2 * CHUNK_SZ, 2 * CHUNK_SZ + 2 * CHUNK_SZ >> 9] -> PTE
> +        *
> +        * By exposing the dma addresses of the page directories themselv=
es
> +        * within the ppGTT, we are then able to rewrite the PTE prior to=
 use.
> +        * But the PTE update and subsequent migration operation must be =
atomic,
> +        * i.e. within the same non-preemptible window so that we do not =
switch
> +        * to another migration context that overwrites the PTE.
> +        *
> +        * TODO: Add support for huge LMEM PTEs
> +        */
> +
> +       vm =3D i915_ppgtt_create(gt);
> +       if (IS_ERR(vm))
> +               return ERR_CAST(vm);
> +
> +       if (!vm->vm.allocate_va_range || !vm->vm.foreach) {
> +               err =3D -ENODEV;
> +               goto err_vm;
> +       }
> +
> +       /*
> +        * Each engine instance is assigned its own chunk in the VM, so
> +        * that we can run multiple instances concurrently
> +        */
> +       for (i =3D 0; i < ARRAY_SIZE(gt->engine_class[COPY_ENGINE_CLASS])=
; i++) {

Why are we setting this up for all copy engine, when we run out jobs
only on one? Afaiui the arch decision is that the kernel reserves one
copy engine for it's private use on chips with multiple, and that's
it. So this looks like overkill that we should remove.

Adding Jon Bloomfield, that's his area.

Also, why do we have a separate migrate_vm, and don't just set this up
for i915->gt.vm? For small bar we'll need another few special
mappings, having distinct vms for these and then always trying to make
sure we use the right one feels a bit overcomplicated. This is the
reason I stumbled over this, I was working on some patch to make a
clearer separation between user hw context (which have their own vm),
and the kernel hw context (which should share all the same one, like
the core linux kernel has one mm_struct for all kernel threads).

If we can I think simplifying this would be nice, there's a bit of
stuff that we can perhaps trim here.

Cheers, Daniel

> +               struct intel_engine_cs *engine;
> +               u64 base =3D (u64)i << 32;
> +               struct insert_pte_data d =3D {};
> +               struct i915_gem_ww_ctx ww;
> +               u64 sz;
> +
> +               engine =3D gt->engine_class[COPY_ENGINE_CLASS][i];
> +               if (!engine_supports_migration(engine))
> +                       continue;
> +
> +               /*
> +                * We copy in 8MiB chunks. Each PDE covers 2MiB, so we ne=
ed
> +                * 4x2 page directories for source/destination.
> +                */
> +               sz =3D 2 * CHUNK_SZ;
> +               d.offset =3D base + sz;
> +
> +               /*
> +                * We need another page directory setup so that we can wr=
ite
> +                * the 8x512 PTE in each chunk.
> +                */
> +               sz +=3D (sz >> 12) * sizeof(u64);
> +
> +               err =3D i915_vm_alloc_pt_stash(&vm->vm, &stash, sz);
> +               if (err)
> +                       goto err_vm;
> +
> +               for_i915_gem_ww(&ww, err, true) {
> +                       err =3D i915_vm_lock_objects(&vm->vm, &ww);
> +                       if (err)
> +                               continue;
> +                       err =3D i915_vm_map_pt_stash(&vm->vm, &stash);
> +                       if (err)
> +                               continue;
> +
> +                       vm->vm.allocate_va_range(&vm->vm, &stash, base, s=
z);
> +               }
> +               i915_vm_free_pt_stash(&vm->vm, &stash);
> +               if (err)
> +                       goto err_vm;
> +
> +               /* Now allow the GPU to rewrite the PTE via its own ppGTT=
 */
> +               d.is_lmem =3D i915_gem_object_is_lmem(vm->vm.scratch[0]);
> +               vm->vm.foreach(&vm->vm, base, base + sz, insert_pte, &d);
> +       }
> +
> +       return &vm->vm;
> +
> +err_vm:
> +       i915_vm_put(&vm->vm);
> +       return ERR_PTR(err);
> +}
> +
> +static struct intel_engine_cs *first_copy_engine(struct intel_gt *gt)
> +{
> +       struct intel_engine_cs *engine;
> +       int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(gt->engine_class[COPY_ENGINE_CLASS])=
; i++) {
> +               engine =3D gt->engine_class[COPY_ENGINE_CLASS][i];
> +               if (engine_supports_migration(engine))
> +                       return engine;
> +       }
> +
> +       return NULL;
> +}
> +
> +static struct intel_context *pinned_context(struct intel_gt *gt)
> +{
> +       static struct lock_class_key key;
> +       struct intel_engine_cs *engine;
> +       struct i915_address_space *vm;
> +       struct intel_context *ce;
> +
> +       engine =3D first_copy_engine(gt);
> +       if (!engine)
> +               return ERR_PTR(-ENODEV);
> +
> +       vm =3D migrate_vm(gt);
> +       if (IS_ERR(vm))
> +               return ERR_CAST(vm);
> +
> +       ce =3D intel_engine_create_pinned_context(engine, vm, SZ_512K,
> +                                               I915_GEM_HWS_MIGRATE,
> +                                               &key, "migrate");
> +       i915_vm_put(ce->vm);
> +       return ce;
> +}
> +
> +int intel_migrate_init(struct intel_migrate *m, struct intel_gt *gt)
> +{
> +       struct intel_context *ce;
> +
> +       memset(m, 0, sizeof(*m));
> +
> +       ce =3D pinned_context(gt);
> +       if (IS_ERR(ce))
> +               return PTR_ERR(ce);
> +
> +       m->context =3D ce;
> +       return 0;
> +}
> +
> +static int random_index(unsigned int max)
> +{
> +       return upper_32_bits(mul_u32_u32(get_random_u32(), max));
> +}
> +
> +static struct intel_context *__migrate_engines(struct intel_gt *gt)
> +{
> +       struct intel_engine_cs *engines[MAX_ENGINE_INSTANCE];
> +       struct intel_engine_cs *engine;
> +       unsigned int count, i;
> +
> +       count =3D 0;
> +       for (i =3D 0; i < ARRAY_SIZE(gt->engine_class[COPY_ENGINE_CLASS])=
; i++) {
> +               engine =3D gt->engine_class[COPY_ENGINE_CLASS][i];
> +               if (engine_supports_migration(engine))
> +                       engines[count++] =3D engine;
> +       }
> +
> +       return intel_context_create(engines[random_index(count)]);
> +}
> +
> +struct intel_context *intel_migrate_create_context(struct intel_migrate =
*m)
> +{
> +       struct intel_context *ce;
> +
> +       /*
> +        * We randomly distribute contexts across the engines upon constr=
ction,
> +        * as they all share the same pinned vm, and so in order to allow
> +        * multiple blits to run in parallel, we must construct each blit
> +        * to use a different range of the vm for its GTT. This has to be
> +        * known at construction, so we can not use the late greedy load
> +        * balancing of the virtual-engine.
> +        */
> +       ce =3D __migrate_engines(m->context->engine->gt);
> +       if (IS_ERR(ce))
> +               return ce;
> +
> +       ce->ring =3D __intel_context_ring_size(SZ_256K);
> +
> +       i915_vm_put(ce->vm);
> +       ce->vm =3D i915_vm_get(m->context->vm);
> +
> +       return ce;
> +}
> +
> +static inline struct sgt_dma sg_sgt(struct scatterlist *sg)
> +{
> +       dma_addr_t addr =3D sg_dma_address(sg);
> +
> +       return (struct sgt_dma){ sg, addr, addr + sg_dma_len(sg) };
> +}
> +
> +static int emit_no_arbitration(struct i915_request *rq)
> +{
> +       u32 *cs;
> +
> +       cs =3D intel_ring_begin(rq, 2);
> +       if (IS_ERR(cs))
> +               return PTR_ERR(cs);
> +
> +       /* Explicitly disable preemption for this request. */
> +       *cs++ =3D MI_ARB_ON_OFF;
> +       *cs++ =3D MI_NOOP;
> +       intel_ring_advance(rq, cs);
> +
> +       return 0;
> +}
> +
> +static int emit_pte(struct i915_request *rq,
> +                   struct sgt_dma *it,
> +                   enum i915_cache_level cache_level,
> +                   bool is_lmem,
> +                   u64 offset,
> +                   int length)
> +{
> +       const u64 encode =3D rq->context->vm->pte_encode(0, cache_level,
> +                                                      is_lmem ? PTE_LM :=
 0);
> +       struct intel_ring *ring =3D rq->ring;
> +       int total =3D 0;
> +       u32 *hdr, *cs;
> +       int pkt;
> +
> +       GEM_BUG_ON(INTEL_GEN(rq->engine->i915) < 8);
> +
> +       /* Compute the page directory offset for the target address range=
 */
> +       offset +=3D (u64)rq->engine->instance << 32;
> +       offset >>=3D 12;
> +       offset *=3D sizeof(u64);
> +       offset +=3D 2 * CHUNK_SZ;
> +
> +       cs =3D intel_ring_begin(rq, 6);
> +       if (IS_ERR(cs))
> +               return PTR_ERR(cs);
> +
> +       /* Pack as many PTE updates as possible into a single MI command =
*/
> +       pkt =3D min_t(int, 0x400, ring->space / sizeof(u32) + 5);
> +       pkt =3D min_t(int, pkt, (ring->size - ring->emit) / sizeof(u32) +=
 5);
> +
> +       hdr =3D cs;
> +       *cs++ =3D MI_STORE_DATA_IMM | REG_BIT(21); /* as qword elements *=
/
> +       *cs++ =3D lower_32_bits(offset);
> +       *cs++ =3D upper_32_bits(offset);
> +
> +       do {
> +               if (cs - hdr >=3D pkt) {
> +                       *hdr +=3D cs - hdr - 2;
> +                       *cs++ =3D MI_NOOP;
> +
> +                       ring->emit =3D (void *)cs - ring->vaddr;
> +                       intel_ring_advance(rq, cs);
> +                       intel_ring_update_space(ring);
> +
> +                       cs =3D intel_ring_begin(rq, 6);
> +                       if (IS_ERR(cs))
> +                               return PTR_ERR(cs);
> +
> +                       pkt =3D min_t(int, 0x400, ring->space / sizeof(u3=
2) + 5);
> +                       pkt =3D min_t(int, pkt, (ring->size - ring->emit)=
 / sizeof(u32) + 5);
> +
> +                       hdr =3D cs;
> +                       *cs++ =3D MI_STORE_DATA_IMM | REG_BIT(21);
> +                       *cs++ =3D lower_32_bits(offset);
> +                       *cs++ =3D upper_32_bits(offset);
> +               }
> +
> +               *cs++ =3D lower_32_bits(encode | it->dma);
> +               *cs++ =3D upper_32_bits(encode | it->dma);
> +
> +               offset +=3D 8;
> +               total +=3D I915_GTT_PAGE_SIZE;
> +
> +               it->dma +=3D I915_GTT_PAGE_SIZE;
> +               if (it->dma >=3D it->max) {
> +                       it->sg =3D __sg_next(it->sg);
> +                       if (!it->sg || sg_dma_len(it->sg) =3D=3D 0)
> +                               break;
> +
> +                       it->dma =3D sg_dma_address(it->sg);
> +                       it->max =3D it->dma + sg_dma_len(it->sg);
> +               }
> +       } while (total < length);
> +
> +       *hdr +=3D cs - hdr - 2;
> +       *cs++ =3D MI_NOOP;
> +
> +       ring->emit =3D (void *)cs - ring->vaddr;
> +       intel_ring_advance(rq, cs);
> +       intel_ring_update_space(ring);
> +
> +       return total;
> +}
> +
> +static bool wa_1209644611_applies(int gen, u32 size)
> +{
> +       u32 height =3D size >> PAGE_SHIFT;
> +
> +       if (gen !=3D 11)
> +               return false;
> +
> +       return height % 4 =3D=3D 3 && height <=3D 8;
> +}
> +
> +static int emit_copy(struct i915_request *rq, int size)
> +{
> +       const int gen =3D INTEL_GEN(rq->engine->i915);
> +       u32 instance =3D rq->engine->instance;
> +       u32 *cs;
> +
> +       cs =3D intel_ring_begin(rq, gen >=3D 8 ? 10 : 6);
> +       if (IS_ERR(cs))
> +               return PTR_ERR(cs);
> +
> +       if (gen >=3D 9 && !wa_1209644611_applies(gen, size)) {
> +               *cs++ =3D GEN9_XY_FAST_COPY_BLT_CMD | (10 - 2);
> +               *cs++ =3D BLT_DEPTH_32 | PAGE_SIZE;
> +               *cs++ =3D 0;
> +               *cs++ =3D size >> PAGE_SHIFT << 16 | PAGE_SIZE / 4;
> +               *cs++ =3D CHUNK_SZ; /* dst offset */
> +               *cs++ =3D instance;
> +               *cs++ =3D 0;
> +               *cs++ =3D PAGE_SIZE;
> +               *cs++ =3D 0; /* src offset */
> +               *cs++ =3D instance;
> +       } else if (gen >=3D 8) {
> +               *cs++ =3D XY_SRC_COPY_BLT_CMD | BLT_WRITE_RGBA | (10 - 2)=
;
> +               *cs++ =3D BLT_DEPTH_32 | BLT_ROP_SRC_COPY | PAGE_SIZE;
> +               *cs++ =3D 0;
> +               *cs++ =3D size >> PAGE_SHIFT << 16 | PAGE_SIZE / 4;
> +               *cs++ =3D CHUNK_SZ; /* dst offset */
> +               *cs++ =3D instance;
> +               *cs++ =3D 0;
> +               *cs++ =3D PAGE_SIZE;
> +               *cs++ =3D 0; /* src offset */
> +               *cs++ =3D instance;
> +       } else {
> +               GEM_BUG_ON(instance);
> +               *cs++ =3D SRC_COPY_BLT_CMD | BLT_WRITE_RGBA | (6 - 2);
> +               *cs++ =3D BLT_DEPTH_32 | BLT_ROP_SRC_COPY | PAGE_SIZE;
> +               *cs++ =3D size >> PAGE_SHIFT << 16 | PAGE_SIZE;
> +               *cs++ =3D CHUNK_SZ; /* dst offset */
> +               *cs++ =3D PAGE_SIZE;
> +               *cs++ =3D 0; /* src offset */
> +       }
> +
> +       intel_ring_advance(rq, cs);
> +       return 0;
> +}
> +
> +int
> +intel_context_migrate_copy(struct intel_context *ce,
> +                          struct dma_fence *await,
> +                          struct scatterlist *src,
> +                          enum i915_cache_level src_cache_level,
> +                          bool src_is_lmem,
> +                          struct scatterlist *dst,
> +                          enum i915_cache_level dst_cache_level,
> +                          bool dst_is_lmem,
> +                          struct i915_request **out)
> +{
> +       struct sgt_dma it_src =3D sg_sgt(src), it_dst =3D sg_sgt(dst);
> +       struct i915_request *rq;
> +       int err;
> +
> +       *out =3D NULL;
> +
> +       GEM_BUG_ON(ce->ring->size < SZ_64K);
> +
> +       do {
> +               int len;
> +
> +               rq =3D i915_request_create(ce);
> +               if (IS_ERR(rq)) {
> +                       err =3D PTR_ERR(rq);
> +                       goto out_ce;
> +               }
> +
> +               if (await) {
> +                       err =3D i915_request_await_dma_fence(rq, await);
> +                       if (err)
> +                               goto out_rq;
> +
> +                       if (rq->engine->emit_init_breadcrumb) {
> +                               err =3D rq->engine->emit_init_breadcrumb(=
rq);
> +                               if (err)
> +                                       goto out_rq;
> +                       }
> +
> +                       await =3D NULL;
> +               }
> +
> +               /* The PTE updates + copy must not be interrupted. */
> +               err =3D emit_no_arbitration(rq);
> +               if (err)
> +                       goto out_rq;
> +
> +               len =3D emit_pte(rq, &it_src, src_cache_level, src_is_lme=
m, 0,
> +                              CHUNK_SZ);
> +               if (len <=3D 0) {
> +                       err =3D len;
> +                       goto out_rq;
> +               }
> +
> +               err =3D emit_pte(rq, &it_dst, dst_cache_level, dst_is_lme=
m,
> +                              CHUNK_SZ, len);
> +               if (err < 0)
> +                       goto out_rq;
> +               if (err < len) {
> +                       err =3D -EINVAL;
> +                       goto out_rq;
> +               }
> +
> +               err =3D rq->engine->emit_flush(rq, EMIT_INVALIDATE);
> +               if (err)
> +                       goto out_rq;
> +
> +               err =3D emit_copy(rq, len);
> +
> +               /* Arbitration is re-enabled between requests. */
> +out_rq:
> +               if (*out)
> +                       i915_request_put(*out);
> +               *out =3D i915_request_get(rq);
> +               i915_request_add(rq);
> +               if (err || !it_src.sg || !sg_dma_len(it_src.sg))
> +                       break;
> +
> +               cond_resched();
> +       } while (1);
> +
> +out_ce:
> +       return err;
> +}
> +
> +int intel_migrate_copy(struct intel_migrate *m,
> +                      struct i915_gem_ww_ctx *ww,
> +                      struct dma_fence *await,
> +                      struct scatterlist *src,
> +                      enum i915_cache_level src_cache_level,
> +                      bool src_is_lmem,
> +                      struct scatterlist *dst,
> +                      enum i915_cache_level dst_cache_level,
> +                      bool dst_is_lmem,
> +                      struct i915_request **out)
> +{
> +       struct intel_context *ce;
> +       int err;
> +
> +       *out =3D NULL;
> +       if (!m->context)
> +               return -ENODEV;
> +
> +       ce =3D intel_migrate_create_context(m);
> +       if (IS_ERR(ce))
> +               ce =3D intel_context_get(m->context);
> +       GEM_BUG_ON(IS_ERR(ce));
> +
> +       err =3D intel_context_pin_ww(ce, ww);
> +       if (err)
> +               goto out;
> +
> +       err =3D intel_context_migrate_copy(ce, await,
> +                                        src, src_cache_level, src_is_lme=
m,
> +                                        dst, dst_cache_level, dst_is_lme=
m,
> +                                        out);
> +
> +       intel_context_unpin(ce);
> +out:
> +       intel_context_put(ce);
> +       return err;
> +}
> +
> +void intel_migrate_fini(struct intel_migrate *m)
> +{
> +       struct intel_context *ce;
> +
> +       ce =3D fetch_and_zero(&m->context);
> +       if (!ce)
> +               return;
> +
> +       intel_engine_destroy_pinned_context(ce);
> +}
> +
> +#if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
> +#include "selftest_migrate.c"
> +#endif
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.h b/drivers/gpu/drm/i9=
15/gt/intel_migrate.h
> new file mode 100644
> index 000000000000..32c61190ed73
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2020 Intel Corporation
> + */
> +
> +#ifndef __INTEL_MIGRATE__
> +#define __INTEL_MIGRATE__
> +
> +#include "intel_migrate_types.h"
> +
> +struct dma_fence;
> +struct i915_request;
> +struct i915_gem_ww_ctx;
> +struct intel_gt;
> +struct scatterlist;
> +enum i915_cache_level;
> +
> +int intel_migrate_init(struct intel_migrate *m, struct intel_gt *gt);
> +
> +struct intel_context *intel_migrate_create_context(struct intel_migrate =
*m);
> +
> +int intel_migrate_copy(struct intel_migrate *m,
> +                      struct i915_gem_ww_ctx *ww,
> +                      struct dma_fence *await,
> +                      struct scatterlist *src,
> +                      enum i915_cache_level src_cache_level,
> +                      bool src_is_lmem,
> +                      struct scatterlist *dst,
> +                      enum i915_cache_level dst_cache_level,
> +                      bool dst_is_lmem,
> +                      struct i915_request **out);
> +
> +int intel_context_migrate_copy(struct intel_context *ce,
> +                              struct dma_fence *await,
> +                              struct scatterlist *src,
> +                              enum i915_cache_level src_cache_level,
> +                              bool src_is_lmem,
> +                              struct scatterlist *dst,
> +                              enum i915_cache_level dst_cache_level,
> +                              bool dst_is_lmem,
> +                              struct i915_request **out);
> +
> +void intel_migrate_fini(struct intel_migrate *m);
> +
> +#endif /* __INTEL_MIGRATE__ */
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate_types.h b/drivers/gpu/=
drm/i915/gt/intel_migrate_types.h
> new file mode 100644
> index 000000000000..d98230597f42
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate_types.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2020 Intel Corporation
> + */
> +
> +#ifndef __INTEL_MIGRATE_TYPES__
> +#define __INTEL_MIGRATE_TYPES__
> +
> +struct intel_context;
> +
> +struct intel_migrate {
> +       struct intel_context *context;
> +};
> +
> +#endif /* __INTEL_MIGRATE_TYPES__ */
> diff --git a/drivers/gpu/drm/i915/gt/intel_ring.h b/drivers/gpu/drm/i915/=
gt/intel_ring.h
> index dbf5f14a136f..1b32dadfb8c3 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ring.h
> +++ b/drivers/gpu/drm/i915/gt/intel_ring.h
> @@ -49,6 +49,7 @@ static inline void intel_ring_advance(struct i915_reque=
st *rq, u32 *cs)
>          * intel_ring_begin()).
>          */
>         GEM_BUG_ON((rq->ring->vaddr + rq->ring->emit) !=3D cs);
> +       GEM_BUG_ON(!IS_ALIGNED(rq->ring->emit, 8)); /* RING_TAIL qword al=
ign */
>  }
>
>  static inline u32 intel_ring_wrap(const struct intel_ring *ring, u32 pos=
)
> diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm=
/i915/gt/selftest_migrate.c
> new file mode 100644
> index 000000000000..9784d149ebf1
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> @@ -0,0 +1,291 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2020 Intel Corporation
> + */
> +
> +#include "selftests/i915_random.h"
> +
> +static const unsigned int sizes[] =3D {
> +       SZ_4K,
> +       SZ_64K,
> +       SZ_2M,
> +       CHUNK_SZ - SZ_4K,
> +       CHUNK_SZ,
> +       CHUNK_SZ + SZ_4K,
> +       SZ_64M,
> +};
> +
> +static struct drm_i915_gem_object *
> +create_lmem_or_internal(struct drm_i915_private *i915, size_t size)
> +{
> +       if (HAS_LMEM(i915)) {
> +               struct drm_i915_gem_object *obj;
> +
> +               obj =3D i915_gem_object_create_lmem(i915, size, 0);
> +               if (!IS_ERR(obj))
> +                       return obj;
> +       }
> +
> +       return i915_gem_object_create_internal(i915, size);
> +}
> +
> +static int copy(struct intel_migrate *migrate,
> +               int (*fn)(struct intel_migrate *migrate,
> +                         struct i915_gem_ww_ctx *ww,
> +                         struct drm_i915_gem_object *src,
> +                         struct drm_i915_gem_object *dst,
> +                         struct i915_request **out),
> +               u32 sz, struct rnd_state *prng)
> +{
> +       struct drm_i915_private *i915 =3D migrate->context->engine->i915;
> +       struct drm_i915_gem_object *src, *dst;
> +       struct i915_request *rq;
> +       struct i915_gem_ww_ctx ww;
> +       u32 *vaddr;
> +       int err =3D 0;
> +       int i;
> +
> +       src =3D create_lmem_or_internal(i915, sz);
> +       if (IS_ERR(src))
> +               return 0;
> +
> +       dst =3D i915_gem_object_create_internal(i915, sz);
> +       if (IS_ERR(dst))
> +               goto err_free_src;
> +
> +       for_i915_gem_ww(&ww, err, true) {
> +               err =3D i915_gem_object_lock(src, &ww);
> +               if (err)
> +                       continue;
> +
> +               err =3D i915_gem_object_lock(dst, &ww);
> +               if (err)
> +                       continue;
> +
> +               vaddr =3D i915_gem_object_pin_map(src, I915_MAP_WC);
> +               if (IS_ERR(vaddr)) {
> +                       err =3D PTR_ERR(vaddr);
> +                       continue;
> +               }
> +
> +               for (i =3D 0; i < sz / sizeof(u32); i++)
> +                       vaddr[i] =3D i;
> +               i915_gem_object_flush_map(src);
> +
> +               vaddr =3D i915_gem_object_pin_map(dst, I915_MAP_WC);
> +               if (IS_ERR(vaddr)) {
> +                       err =3D PTR_ERR(vaddr);
> +                       goto unpin_src;
> +               }
> +
> +               for (i =3D 0; i < sz / sizeof(u32); i++)
> +                       vaddr[i] =3D ~i;
> +               i915_gem_object_flush_map(dst);
> +
> +               err =3D fn(migrate, &ww, src, dst, &rq);
> +               if (!err)
> +                       continue;
> +
> +               if (err !=3D -EDEADLK && err !=3D -EINTR && err !=3D -ERE=
STARTSYS)
> +                       pr_err("%ps failed, size: %u\n", fn, sz);
> +               if (rq) {
> +                       i915_request_wait(rq, 0, HZ);
> +                       i915_request_put(rq);
> +               }
> +               i915_gem_object_unpin_map(dst);
> +unpin_src:
> +               i915_gem_object_unpin_map(src);
> +       }
> +       if (err)
> +               goto err_out;
> +
> +       if (rq) {
> +               if (i915_request_wait(rq, 0, HZ) < 0) {
> +                       pr_err("%ps timed out, size: %u\n", fn, sz);
> +                       err =3D -ETIME;
> +               }
> +               i915_request_put(rq);
> +       }
> +
> +       for (i =3D 0; !err && i < sz / PAGE_SIZE; i++) {
> +               int x =3D i * 1024 + i915_prandom_u32_max_state(1024, prn=
g);
> +
> +               if (vaddr[x] !=3D x) {
> +                       pr_err("%ps failed, size: %u, offset: %zu\n",
> +                              fn, sz, x * sizeof(u32));
> +                       igt_hexdump(vaddr + i * 1024, 4096);
> +                       err =3D -EINVAL;
> +               }
> +       }
> +
> +       i915_gem_object_unpin_map(dst);
> +       i915_gem_object_unpin_map(src);
> +
> +err_out:
> +       i915_gem_object_put(dst);
> +err_free_src:
> +       i915_gem_object_put(src);
> +
> +       return err;
> +}
> +
> +static int __migrate_copy(struct intel_migrate *migrate,
> +                         struct i915_gem_ww_ctx *ww,
> +                         struct drm_i915_gem_object *src,
> +                         struct drm_i915_gem_object *dst,
> +                         struct i915_request **out)
> +{
> +       return intel_migrate_copy(migrate, ww, NULL,
> +                                 src->mm.pages->sgl, src->cache_level,
> +                                 i915_gem_object_is_lmem(src),
> +                                 dst->mm.pages->sgl, dst->cache_level,
> +                                 i915_gem_object_is_lmem(dst),
> +                                 out);
> +}
> +
> +static int __global_copy(struct intel_migrate *migrate,
> +                        struct i915_gem_ww_ctx *ww,
> +                        struct drm_i915_gem_object *src,
> +                        struct drm_i915_gem_object *dst,
> +                        struct i915_request **out)
> +{
> +       return intel_context_migrate_copy(migrate->context, NULL,
> +                                         src->mm.pages->sgl, src->cache_=
level,
> +                                         i915_gem_object_is_lmem(src),
> +                                         dst->mm.pages->sgl, dst->cache_=
level,
> +                                         i915_gem_object_is_lmem(dst),
> +                                         out);
> +}
> +
> +static int
> +migrate_copy(struct intel_migrate *migrate, u32 sz, struct rnd_state *pr=
ng)
> +{
> +       return copy(migrate, __migrate_copy, sz, prng);
> +}
> +
> +static int
> +global_copy(struct intel_migrate *migrate, u32 sz, struct rnd_state *prn=
g)
> +{
> +       return copy(migrate, __global_copy, sz, prng);
> +}
> +
> +static int live_migrate_copy(void *arg)
> +{
> +       struct intel_migrate *migrate =3D arg;
> +       struct drm_i915_private *i915 =3D migrate->context->engine->i915;
> +       I915_RND_STATE(prng);
> +       int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(sizes); i++) {
> +               int err;
> +
> +               err =3D migrate_copy(migrate, sizes[i], &prng);
> +               if (err =3D=3D 0)
> +                       err =3D global_copy(migrate, sizes[i], &prng);
> +               i915_gem_drain_freed_objects(i915);
> +               if (err)
> +                       return err;
> +       }
> +
> +       return 0;
> +}
> +
> +struct threaded_migrate {
> +       struct intel_migrate *migrate;
> +       struct task_struct *tsk;
> +       struct rnd_state prng;
> +};
> +
> +static int threaded_migrate(struct intel_migrate *migrate,
> +                           int (*fn)(void *arg),
> +                           unsigned int flags)
> +{
> +       const unsigned int n_cpus =3D num_online_cpus() + 1;
> +       struct threaded_migrate *thread;
> +       I915_RND_STATE(prng);
> +       unsigned int i;
> +       int err =3D 0;
> +
> +       thread =3D kcalloc(n_cpus, sizeof(*thread), GFP_KERNEL);
> +       if (!thread)
> +               return 0;
> +
> +       for (i =3D 0; i < n_cpus; ++i) {
> +               struct task_struct *tsk;
> +
> +               thread[i].migrate =3D migrate;
> +               thread[i].prng =3D
> +                       I915_RND_STATE_INITIALIZER(prandom_u32_state(&prn=
g));
> +
> +               tsk =3D kthread_run(fn, &thread[i], "igt-%d", i);
> +               if (IS_ERR(tsk)) {
> +                       err =3D PTR_ERR(tsk);
> +                       break;
> +               }
> +
> +               get_task_struct(tsk);
> +               thread[i].tsk =3D tsk;
> +       }
> +
> +       msleep(10); /* start all threads before we kthread_stop() */
> +
> +       for (i =3D 0; i < n_cpus; ++i) {
> +               struct task_struct *tsk =3D thread[i].tsk;
> +               int status;
> +
> +               if (IS_ERR_OR_NULL(tsk))
> +                       continue;
> +
> +               status =3D kthread_stop(tsk);
> +               if (status && !err)
> +                       err =3D status;
> +
> +               put_task_struct(tsk);
> +       }
> +
> +       kfree(thread);
> +       return err;
> +}
> +
> +static int __thread_migrate_copy(void *arg)
> +{
> +       struct threaded_migrate *tm =3D arg;
> +
> +       return migrate_copy(tm->migrate, 2 * CHUNK_SZ, &tm->prng);
> +}
> +
> +static int thread_migrate_copy(void *arg)
> +{
> +       return threaded_migrate(arg, __thread_migrate_copy, 0);
> +}
> +
> +static int __thread_global_copy(void *arg)
> +{
> +       struct threaded_migrate *tm =3D arg;
> +
> +       return global_copy(tm->migrate, 2 * CHUNK_SZ, &tm->prng);
> +}
> +
> +static int thread_global_copy(void *arg)
> +{
> +       return threaded_migrate(arg, __thread_global_copy, 0);
> +}
> +
> +int intel_migrate_live_selftests(struct drm_i915_private *i915)
> +{
> +       static const struct i915_subtest tests[] =3D {
> +               SUBTEST(live_migrate_copy),
> +               SUBTEST(thread_migrate_copy),
> +               SUBTEST(thread_global_copy),
> +       };
> +       struct intel_migrate m;
> +       int err;
> +
> +       if (intel_migrate_init(&m, &i915->gt))
> +               return 0;
> +
> +       err =3D i915_subtests(tests, &m);
> +       intel_migrate_fini(&m);
> +
> +       return err;
> +}
> diff --git a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h b/drive=
rs/gpu/drm/i915/selftests/i915_live_selftests.h
> index a92c0e9b7e6b..be5e0191eaea 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> +++ b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> @@ -26,6 +26,7 @@ selftest(gt_mocs, intel_mocs_live_selftests)
>  selftest(gt_pm, intel_gt_pm_live_selftests)
>  selftest(gt_heartbeat, intel_heartbeat_live_selftests)
>  selftest(requests, i915_request_live_selftests)
> +selftest(migrate, intel_migrate_live_selftests)
>  selftest(active, i915_active_live_selftests)
>  selftest(objects, i915_gem_object_live_selftests)
>  selftest(mman, i915_gem_mman_live_selftests)
> --
> 2.31.1
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
