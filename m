Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C90A7788D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 12:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48CC910E554;
	Tue,  1 Apr 2025 10:13:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D5TMxz2L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9D310E554
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 10:13:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4FB8AA44600;
 Tue,  1 Apr 2025 10:07:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81ADAC4CEE4;
 Tue,  1 Apr 2025 10:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743502395;
 bh=ivTxn0hTBNFRHrw5B9krJdw5mAWDPBuasN1FU6mUvdY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D5TMxz2LblaZOefkG+9mPTYiuHkfkNeDbTm3jWhTmBJlInjkb54B21tBEAgtRETiI
 E/MngD31JIK7Han0wAFx49L4O6hZMK1DDAgNEK/z/7PPjgykXzABeEdVn5g9vOI1nH
 22pfQ5qgAHbaDAzx5ZbZ2r52FVSIm1Z6oINugS6bChXCaqRteoQfIxJFkbz/uF6xMp
 /ebT/o71NNZp4daFLmc708qT2TaFzHkw1wcx8nGtkC1oJ5NLu8ITK7oNRYhKccMN7/
 oOQwlfIud5AIFa7kZMEXpwmRrogpvW05QaiX3PfK5GuJdN1znlvVWSE0mF1D5ylVry
 vW52CKGxaIzXg==
Date: Tue, 1 Apr 2025 15:43:05 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>, akpm@linux-foundation.org,
 david@redhat.com, rppt@linux.ibm.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org,
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>, linux-mm@kvack.org
Subject: Re: [PATCH v6 09/10] optee: FF-A: dynamic restricted memory allocation
Message-ID: <Z-u8MWNVNy9lLbkK@sumit-X1>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-10-jens.wiklander@linaro.org>
 <Z-JePo6yGlUgrZkw@sumit-X1>
 <CAHUa44H1MzBLBM+Oeawca52C8PF3uAT0ggbL-zRdnBqj4LYrZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHUa44H1MzBLBM+Oeawca52C8PF3uAT0ggbL-zRdnBqj4LYrZg@mail.gmail.com>
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

+ MM folks to seek guidance here.

On Thu, Mar 27, 2025 at 09:07:34AM +0100, Jens Wiklander wrote:
> Hi Sumit,
> 
> On Tue, Mar 25, 2025 at 8:42 AM Sumit Garg <sumit.garg@kernel.org> wrote:
> >
> > On Wed, Mar 05, 2025 at 02:04:15PM +0100, Jens Wiklander wrote:
> > > Add support in the OP-TEE backend driver dynamic restricted memory
> > > allocation with FF-A.
> > >
> > > The restricted memory pools for dynamically allocated restrict memory
> > > are instantiated when requested by user-space. This instantiation can
> > > fail if OP-TEE doesn't support the requested use-case of restricted
> > > memory.
> > >
> > > Restricted memory pools based on a static carveout or dynamic allocation
> > > can coexist for different use-cases. We use only dynamic allocation with
> > > FF-A.
> > >
> > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > ---
> > >  drivers/tee/optee/Makefile        |   1 +
> > >  drivers/tee/optee/ffa_abi.c       | 143 ++++++++++++-
> > >  drivers/tee/optee/optee_private.h |  13 +-
> > >  drivers/tee/optee/rstmem.c        | 329 ++++++++++++++++++++++++++++++
> > >  4 files changed, 483 insertions(+), 3 deletions(-)
> > >  create mode 100644 drivers/tee/optee/rstmem.c
> > >

<snip>

> > > diff --git a/drivers/tee/optee/rstmem.c b/drivers/tee/optee/rstmem.c
> > > new file mode 100644
> > > index 000000000000..ea27769934d4
> > > --- /dev/null
> > > +++ b/drivers/tee/optee/rstmem.c
> > > @@ -0,0 +1,329 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (c) 2025, Linaro Limited
> > > + */
> > > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > > +
> > > +#include <linux/errno.h>
> > > +#include <linux/genalloc.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/string.h>
> > > +#include <linux/tee_core.h>
> > > +#include <linux/types.h>
> > > +#include "optee_private.h"
> > > +
> > > +struct optee_rstmem_cma_pool {
> > > +     struct tee_rstmem_pool pool;
> > > +     struct gen_pool *gen_pool;
> > > +     struct optee *optee;
> > > +     size_t page_count;
> > > +     u16 *end_points;
> > > +     u_int end_point_count;
> > > +     u_int align;
> > > +     refcount_t refcount;
> > > +     u32 use_case;
> > > +     struct tee_shm *rstmem;
> > > +     /* Protects when initializing and tearing down this struct */
> > > +     struct mutex mutex;
> > > +};
> > > +
> > > +static struct optee_rstmem_cma_pool *
> > > +to_rstmem_cma_pool(struct tee_rstmem_pool *pool)
> > > +{
> > > +     return container_of(pool, struct optee_rstmem_cma_pool, pool);
> > > +}
> > > +
> > > +static int init_cma_rstmem(struct optee_rstmem_cma_pool *rp)
> > > +{
> > > +     int rc;
> > > +
> > > +     rp->rstmem = tee_shm_alloc_cma_phys_mem(rp->optee->ctx, rp->page_count,
> > > +                                             rp->align);
> > > +     if (IS_ERR(rp->rstmem)) {
> > > +             rc = PTR_ERR(rp->rstmem);
> > > +             goto err_null_rstmem;
> > > +     }
> > > +
> > > +     /*
> > > +      * TODO unmap the memory range since the physical memory will
> > > +      * become inaccesible after the lend_rstmem() call.
> > > +      */
> >
> > What's your plan for this TODO? I think we need a CMA allocator here
> > which can allocate un-mapped memory such that any cache speculation
> > won't lead to CPU hangs once the memory restriction comes into picture.
> 
> What happens is platform-specific. For some platforms, it might be
> enough to avoid explicit access. Yes, a CMA allocator with unmapped
> memory or where memory can be unmapped is one option.

Did you get a chance to enable real memory protection on RockPi board?
This will atleast ensure that mapped restricted memory without explicit
access works fine. Since otherwise once people start to enable real
memory restriction in OP-TEE, there can be chances of random hang ups
due to cache speculation.

MM folks,

Basically what we are trying to achieve here is a "no-map" DT behaviour
[1] which is rather dynamic in  nature. The use-case here is that a memory
block allocated from CMA can be marked restricted at runtime where we
would like the Linux not being able to directly or indirectly (cache
speculation) access it. Once memory restriction use-case has been
completed, the memory block can be marked as normal and freed for
further CMA allocation.

It will be apprciated if you can guide us regarding the appropriate APIs
to use for un-mapping/mamping CMA allocations for this use-case.

[1] https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/reserved-memory/reserved-memory.yaml#L79

-Sumit

> 
> >
> > > +     rc = rp->optee->ops->lend_rstmem(rp->optee, rp->rstmem, rp->end_points,
> > > +                                      rp->end_point_count, rp->use_case);
> > > +     if (rc)
> > > +             goto err_put_shm;
> > > +     rp->rstmem->flags |= TEE_SHM_DYNAMIC;
> > > +
> > > +     rp->gen_pool = gen_pool_create(PAGE_SHIFT, -1);
> > > +     if (!rp->gen_pool) {
> > > +             rc = -ENOMEM;
> > > +             goto err_reclaim;
> > > +     }
> > > +
> > > +     rc = gen_pool_add(rp->gen_pool, rp->rstmem->paddr,
> > > +                       rp->rstmem->size, -1);
> > > +     if (rc)
> > > +             goto err_free_pool;
> > > +
> > > +     refcount_set(&rp->refcount, 1);
> > > +     return 0;
> > > +
> > > +err_free_pool:
> > > +     gen_pool_destroy(rp->gen_pool);
> > > +     rp->gen_pool = NULL;
> > > +err_reclaim:
> > > +     rp->optee->ops->reclaim_rstmem(rp->optee, rp->rstmem);
> > > +err_put_shm:
> > > +     tee_shm_put(rp->rstmem);
> > > +err_null_rstmem:
> > > +     rp->rstmem = NULL;
> > > +     return rc;
> > > +}
> > > +
> > > +static int get_cma_rstmem(struct optee_rstmem_cma_pool *rp)
> > > +{
> > > +     int rc = 0;
> > > +
> > > +     if (!refcount_inc_not_zero(&rp->refcount)) {
> > > +             mutex_lock(&rp->mutex);
> > > +             if (rp->gen_pool) {
> > > +                     /*
> > > +                      * Another thread has already initialized the pool
> > > +                      * before us, or the pool was just about to be torn
> > > +                      * down. Either way we only need to increase the
> > > +                      * refcount and we're done.
> > > +                      */
> > > +                     refcount_inc(&rp->refcount);
> > > +             } else {
> > > +                     rc = init_cma_rstmem(rp);
> > > +             }
> > > +             mutex_unlock(&rp->mutex);
> > > +     }
> > > +
> > > +     return rc;
> > > +}
> > > +
> > > +static void release_cma_rstmem(struct optee_rstmem_cma_pool *rp)
> > > +{
> > > +     gen_pool_destroy(rp->gen_pool);
> > > +     rp->gen_pool = NULL;
> > > +
> > > +     rp->optee->ops->reclaim_rstmem(rp->optee, rp->rstmem);
> > > +     rp->rstmem->flags &= ~TEE_SHM_DYNAMIC;
> > > +
> > > +     WARN(refcount_read(&rp->rstmem->refcount) != 1, "Unexpected refcount");
> > > +     tee_shm_put(rp->rstmem);
> > > +     rp->rstmem = NULL;
> > > +}
> > > +
> > > +static void put_cma_rstmem(struct optee_rstmem_cma_pool *rp)
> > > +{
> > > +     if (refcount_dec_and_test(&rp->refcount)) {
> > > +             mutex_lock(&rp->mutex);
> > > +             if (rp->gen_pool)
> > > +                     release_cma_rstmem(rp);
> > > +             mutex_unlock(&rp->mutex);
> > > +     }
> > > +}
> > > +
> > > +static int rstmem_pool_op_cma_alloc(struct tee_rstmem_pool *pool,
> > > +                                 struct sg_table *sgt, size_t size,
> > > +                                 size_t *offs)
> > > +{
> > > +     struct optee_rstmem_cma_pool *rp = to_rstmem_cma_pool(pool);
> > > +     size_t sz = ALIGN(size, PAGE_SIZE);
> > > +     phys_addr_t pa;
> > > +     int rc;
> > > +
> > > +     rc = get_cma_rstmem(rp);
> > > +     if (rc)
> > > +             return rc;
> > > +
> > > +     pa = gen_pool_alloc(rp->gen_pool, sz);
> > > +     if (!pa) {
> > > +             rc = -ENOMEM;
> > > +             goto err_put;
> > > +     }
> > > +
> > > +     rc = sg_alloc_table(sgt, 1, GFP_KERNEL);
> > > +     if (rc)
> > > +             goto err_free;
> > > +
> > > +     sg_set_page(sgt->sgl, phys_to_page(pa), size, 0);
> > > +     *offs = pa - rp->rstmem->paddr;
> > > +
> > > +     return 0;
> > > +err_free:
> > > +     gen_pool_free(rp->gen_pool, pa, size);
> > > +err_put:
> > > +     put_cma_rstmem(rp);
> > > +
> > > +     return rc;
> > > +}
> > > +
> > > +static void rstmem_pool_op_cma_free(struct tee_rstmem_pool *pool,
> > > +                                 struct sg_table *sgt)
> > > +{
> > > +     struct optee_rstmem_cma_pool *rp = to_rstmem_cma_pool(pool);
> > > +     struct scatterlist *sg;
> > > +     int i;
> > > +
> > > +     for_each_sgtable_sg(sgt, sg, i)
> > > +             gen_pool_free(rp->gen_pool, sg_phys(sg), sg->length);
> > > +     sg_free_table(sgt);
> > > +     put_cma_rstmem(rp);
> > > +}
> > > +
> > > +static int rstmem_pool_op_cma_update_shm(struct tee_rstmem_pool *pool,
> > > +                                      struct sg_table *sgt, size_t offs,
> > > +                                      struct tee_shm *shm,
> > > +                                      struct tee_shm **parent_shm)
> > > +{
> > > +     struct optee_rstmem_cma_pool *rp = to_rstmem_cma_pool(pool);
> > > +
> > > +     *parent_shm = rp->rstmem;
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static void pool_op_cma_destroy_pool(struct tee_rstmem_pool *pool)
> > > +{
> > > +     struct optee_rstmem_cma_pool *rp = to_rstmem_cma_pool(pool);
> > > +
> > > +     mutex_destroy(&rp->mutex);
> > > +     kfree(rp);
> > > +}
> > > +
> > > +static struct tee_rstmem_pool_ops rstmem_pool_ops_cma = {
> > > +     .alloc = rstmem_pool_op_cma_alloc,
> > > +     .free = rstmem_pool_op_cma_free,
> > > +     .update_shm = rstmem_pool_op_cma_update_shm,
> > > +     .destroy_pool = pool_op_cma_destroy_pool,
> > > +};
> > > +
> > > +static int get_rstmem_config(struct optee *optee, u32 use_case,
> > > +                          size_t *min_size, u_int *min_align,
> > > +                          u16 *end_points, u_int *ep_count)
> >
> > I guess this end points terminology is specific to FF-A ABI. Is there
> > any relevance for this in the common APIs?
> 
> Yes, endpoints are specific to FF-A ABI. The list of end-points must
> be presented to FFA_MEM_LEND. We're relying on the secure world to
> know which endpoints are needed for a specific use case.
> 
> Cheers,
> Jens
> 
> >
> > -Sumit
> >
> > > +{
> > > +     struct tee_param params[2] = {
> > > +             [0] = {
> > > +                     .attr = TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT,
> > > +                     .u.value.a = use_case,
> > > +             },
> > > +             [1] = {
> > > +                     .attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT,
> > > +             },
> > > +     };
> > > +     struct optee_shm_arg_entry *entry;
> > > +     struct tee_shm *shm_param = NULL;
> > > +     struct optee_msg_arg *msg_arg;
> > > +     struct tee_shm *shm;
> > > +     u_int offs;
> > > +     int rc;
> > > +
> > > +     if (end_points && *ep_count) {
> > > +             params[1].u.memref.size = *ep_count * sizeof(*end_points);
> > > +             shm_param = tee_shm_alloc_priv_buf(optee->ctx,
> > > +                                                params[1].u.memref.size);
> > > +             if (IS_ERR(shm_param))
> > > +                     return PTR_ERR(shm_param);
> > > +             params[1].u.memref.shm = shm_param;
> > > +     }
> > > +
> > > +     msg_arg = optee_get_msg_arg(optee->ctx, ARRAY_SIZE(params), &entry,
> > > +                                 &shm, &offs);
> > > +     if (IS_ERR(msg_arg)) {
> > > +             rc = PTR_ERR(msg_arg);
> > > +             goto out_free_shm;
> > > +     }
> > > +     msg_arg->cmd = OPTEE_MSG_CMD_GET_RSTMEM_CONFIG;
> > > +
> > > +     rc = optee->ops->to_msg_param(optee, msg_arg->params,
> > > +                                   ARRAY_SIZE(params), params,
> > > +                                   false /*!update_out*/);
> > > +     if (rc)
> > > +             goto out_free_msg;
> > > +
> > > +     rc = optee->ops->do_call_with_arg(optee->ctx, shm, offs, false);
> > > +     if (rc)
> > > +             goto out_free_msg;
> > > +     if (msg_arg->ret && msg_arg->ret != TEEC_ERROR_SHORT_BUFFER) {
> > > +             rc = -EINVAL;
> > > +             goto out_free_msg;
> > > +     }
> > > +
> > > +     rc = optee->ops->from_msg_param(optee, params, ARRAY_SIZE(params),
> > > +                                     msg_arg->params, true /*update_out*/);
> > > +     if (rc)
> > > +             goto out_free_msg;
> > > +
> > > +     if (!msg_arg->ret && end_points &&
> > > +         *ep_count < params[1].u.memref.size / sizeof(u16)) {
> > > +             rc = -EINVAL;
> > > +             goto out_free_msg;
> > > +     }
> > > +
> > > +     *min_size = params[0].u.value.a;
> > > +     *min_align = params[0].u.value.b;
> > > +     *ep_count = params[1].u.memref.size / sizeof(u16);
> > > +
> > > +     if (msg_arg->ret == TEEC_ERROR_SHORT_BUFFER) {
> > > +             rc = -ENOSPC;
> > > +             goto out_free_msg;
> > > +     }
> > > +
> > > +     if (end_points)
> > > +             memcpy(end_points, tee_shm_get_va(shm_param, 0),
> > > +                    params[1].u.memref.size);
> > > +
> > > +out_free_msg:
> > > +     optee_free_msg_arg(optee->ctx, entry, offs);
> > > +out_free_shm:
> > > +     if (shm_param)
> > > +             tee_shm_free(shm_param);
> > > +     return rc;
> > > +}
> > > +
> > > +struct tee_rstmem_pool *optee_rstmem_alloc_cma_pool(struct optee *optee,
> > > +                                                 enum tee_dma_heap_id id)
> > > +{
> > > +     struct optee_rstmem_cma_pool *rp;
> > > +     u32 use_case = id;
> > > +     size_t min_size;
> > > +     int rc;
> > > +
> > > +     rp = kzalloc(sizeof(*rp), GFP_KERNEL);
> > > +     if (!rp)
> > > +             return ERR_PTR(-ENOMEM);
> > > +     rp->use_case = use_case;
> > > +
> > > +     rc = get_rstmem_config(optee, use_case, &min_size, &rp->align, NULL,
> > > +                            &rp->end_point_count);
> > > +     if (rc) {
> > > +             if (rc != -ENOSPC)
> > > +                     goto err;
> > > +             rp->end_points = kcalloc(rp->end_point_count,
> > > +                                      sizeof(*rp->end_points), GFP_KERNEL);
> > > +             if (!rp->end_points) {
> > > +                     rc = -ENOMEM;
> > > +                     goto err;
> > > +             }
> > > +             rc = get_rstmem_config(optee, use_case, &min_size, &rp->align,
> > > +                                    rp->end_points, &rp->end_point_count);
> > > +             if (rc)
> > > +                     goto err_kfree_eps;
> > > +     }
> > > +
> > > +     rp->pool.ops = &rstmem_pool_ops_cma;
> > > +     rp->optee = optee;
> > > +     rp->page_count = min_size / PAGE_SIZE;
> > > +     mutex_init(&rp->mutex);
> > > +
> > > +     return &rp->pool;
> > > +
> > > +err_kfree_eps:
> > > +     kfree(rp->end_points);
> > > +err:
> > > +     kfree(rp);
> > > +     return ERR_PTR(rc);
> > > +}
> > > --
> > > 2.43.0
> > >
