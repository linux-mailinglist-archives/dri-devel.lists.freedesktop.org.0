Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B00FAF6A42
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 08:28:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A7110E12C;
	Thu,  3 Jul 2025 06:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uL70UOkq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD5F810E12C
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 06:28:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C1C3D61142;
 Thu,  3 Jul 2025 06:28:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16EEC4CEEB;
 Thu,  3 Jul 2025 06:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751524091;
 bh=T72yXCmWdX5uoyXouBY6LyB4JVY9V6cpBLUYnY5mazQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uL70UOkq3bTbtQc6sV0B15O2BmBs+JKSMF5sViA6FpL5BEFxDRZ2EMCCuGe1EvaaM
 APZWQiXwZQJcn56XDKHVuOI7rLGD+Xs1E9FreeF9wIQa/PhwbDmEI2TrrmyJAXfJPW
 Z4SP060V1akKVI83GrwoWWlMtTY2fI8hb8AaPKjyYUNuOivHvr7vDLpkkSxtsGGVQq
 BsI2UOgEyyShfWxVYe1VW8CodBSutQeeW7mRVA5n+7s/A9ym5TU6fkXMS4V6/NfxKK
 81RwZTsLAY8ADwAK5VkoPb9oT0b5ELh2S5CI7coneJ4PeHDrPqfaJHCSJxbm9ZVGci
 O5fq+JWp5PBQA==
Date: Thu, 3 Jul 2025 11:58:01 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
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
 Daniel Stone <daniel@fooishbar.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com
Subject: Re: [PATCH v10 6/9] tee: add tee_shm_alloc_dma_mem()
Message-ID: <aGYi8QkgI3WyeN59@sumit-X1>
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
 <20250610131600.2972232-7-jens.wiklander@linaro.org>
 <aFFSWDiVsxA1CbCX@sumit-X1>
 <CAHUa44HP5EbURyLCmawMLc0d5jz1oTQZ53V1w2h0-ngUC2hbEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHUa44HP5EbURyLCmawMLc0d5jz1oTQZ53V1w2h0-ngUC2hbEw@mail.gmail.com>
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

On Wed, Jun 18, 2025 at 09:03:00AM +0200, Jens Wiklander wrote:
> On Tue, Jun 17, 2025 at 1:32 PM Sumit Garg <sumit.garg@kernel.org> wrote:
> >
> > On Tue, Jun 10, 2025 at 03:13:50PM +0200, Jens Wiklander wrote:
> > > Add tee_shm_alloc_dma_mem() to allocate DMA memory. The memory is
> > > represented by a tee_shm object using the new flag TEE_SHM_DMA_MEM to
> > > identify it as DMA memory. The allocated memory will later be lent to
> > > the TEE to be used as protected memory.
> > >
> > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > ---
> > >  drivers/tee/tee_shm.c    | 85 +++++++++++++++++++++++++++++++++++++++-
> > >  include/linux/tee_core.h |  5 +++
> > >  2 files changed, 88 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > > index e63095e84644..60b0f3932cee 100644
> > > --- a/drivers/tee/tee_shm.c
> > > +++ b/drivers/tee/tee_shm.c
> > > @@ -5,6 +5,8 @@
> > >  #include <linux/anon_inodes.h>
> > >  #include <linux/device.h>
> > >  #include <linux/dma-buf.h>
> > > +#include <linux/dma-mapping.h>
> > > +#include <linux/highmem.h>
> > >  #include <linux/idr.h>
> > >  #include <linux/io.h>
> > >  #include <linux/mm.h>
> > > @@ -13,9 +15,14 @@
> > >  #include <linux/tee_core.h>
> > >  #include <linux/uaccess.h>
> > >  #include <linux/uio.h>
> > > -#include <linux/highmem.h>
> > >  #include "tee_private.h"
> > >
> > > +struct tee_shm_dma_mem {
> > > +     struct tee_shm shm;
> > > +     dma_addr_t dma_addr;
> > > +     struct page *page;
> > > +};
> > > +
> > >  static void shm_put_kernel_pages(struct page **pages, size_t page_count)
> > >  {
> > >       size_t n;
> > > @@ -48,7 +55,16 @@ static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
> > >  {
> > >       void *p = shm;
> > >
> > > -     if (shm->flags & TEE_SHM_DMA_BUF) {
> > > +     if (shm->flags & TEE_SHM_DMA_MEM) {
> > > +#if IS_ENABLED(CONFIG_TEE_DMABUF_HEAPS)
> >
> > nit: this config check can be merged into the above if check.
> 
> No, because dma_free_pages() is only defined if
> CONFIG_TEE_DMABUF_HEAPS is enabled.

It looks like you misunderstood my above comment, I rather meant:

	if (IS_ENABLED(CONFIG_TEE_DMABUF_HEAPS) &&
	    (shm->flags & TEE_SHM_DMA_MEM))

-Sumit

> 
> >
> > > +             struct tee_shm_dma_mem *dma_mem;
> > > +
> > > +             dma_mem = container_of(shm, struct tee_shm_dma_mem, shm);
> > > +             p = dma_mem;
> > > +             dma_free_pages(&teedev->dev, shm->size, dma_mem->page,
> > > +                            dma_mem->dma_addr, DMA_BIDIRECTIONAL);
> > > +#endif
> > > +     } else if (shm->flags & TEE_SHM_DMA_BUF) {
> >
> > Do we need a similar config check for this flag too?
> 
> No, because DMA_SHARED_BUFFER is selected, so the dma_buf functions are defined.
> 
> Cheers,
> Jens
> 
> 
> >
> > With these addressed, feel free to add:
> >
> > Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >
> > -Sumit
> >
> > >               struct tee_shm_dmabuf_ref *ref;
> > >
> > >               ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
> > > @@ -303,6 +319,71 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size)
> > >  }
> > >  EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
> > >
> > > +#if IS_ENABLED(CONFIG_TEE_DMABUF_HEAPS)
> > > +/**
> > > + * tee_shm_alloc_dma_mem() - Allocate DMA memory as shared memory object
> > > + * @ctx:     Context that allocates the shared memory
> > > + * @page_count:      Number of pages
> > > + *
> > > + * The allocated memory is expected to be lent (made inaccessible to the
> > > + * kernel) to the TEE while it's used and returned (accessible to the
> > > + * kernel again) before it's freed.
> > > + *
> > > + * This function should normally only be used internally in the TEE
> > > + * drivers.
> > > + *
> > > + * @returns a pointer to 'struct tee_shm'
> > > + */
> > > +struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
> > > +                                   size_t page_count)
> > > +{
> > > +     struct tee_device *teedev = ctx->teedev;
> > > +     struct tee_shm_dma_mem *dma_mem;
> > > +     dma_addr_t dma_addr;
> > > +     struct page *page;
> > > +
> > > +     if (!tee_device_get(teedev))
> > > +             return ERR_PTR(-EINVAL);
> > > +
> > > +     page = dma_alloc_pages(&teedev->dev, page_count * PAGE_SIZE,
> > > +                            &dma_addr, DMA_BIDIRECTIONAL, GFP_KERNEL);
> > > +     if (!page)
> > > +             goto err_put_teedev;
> > > +
> > > +     dma_mem = kzalloc(sizeof(*dma_mem), GFP_KERNEL);
> > > +     if (!dma_mem)
> > > +             goto err_free_pages;
> > > +
> > > +     refcount_set(&dma_mem->shm.refcount, 1);
> > > +     dma_mem->shm.ctx = ctx;
> > > +     dma_mem->shm.paddr = page_to_phys(page);
> > > +     dma_mem->dma_addr = dma_addr;
> > > +     dma_mem->page = page;
> > > +     dma_mem->shm.size = page_count * PAGE_SIZE;
> > > +     dma_mem->shm.flags = TEE_SHM_DMA_MEM;
> > > +
> > > +     teedev_ctx_get(ctx);
> > > +
> > > +     return &dma_mem->shm;
> > > +
> > > +err_free_pages:
> > > +     dma_free_pages(&teedev->dev, page_count * PAGE_SIZE, page, dma_addr,
> > > +                    DMA_BIDIRECTIONAL);
> > > +err_put_teedev:
> > > +     tee_device_put(teedev);
> > > +
> > > +     return ERR_PTR(-ENOMEM);
> > > +}
> > > +EXPORT_SYMBOL_GPL(tee_shm_alloc_dma_mem);
> > > +#else
> > > +struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
> > > +                                   size_t page_count)
> > > +{
> > > +     return ERR_PTR(-EINVAL);
> > > +}
> > > +EXPORT_SYMBOL_GPL(tee_shm_alloc_dma_mem);
> > > +#endif
> > > +
> > >  int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t align,
> > >                            int (*shm_register)(struct tee_context *ctx,
> > >                                                struct tee_shm *shm,
> > > diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> > > index f17710196c4c..e46a53e753af 100644
> > > --- a/include/linux/tee_core.h
> > > +++ b/include/linux/tee_core.h
> > > @@ -29,6 +29,8 @@
> > >  #define TEE_SHM_POOL         BIT(2)  /* Memory allocated from pool */
> > >  #define TEE_SHM_PRIV         BIT(3)  /* Memory private to TEE driver */
> > >  #define TEE_SHM_DMA_BUF              BIT(4)  /* Memory with dma-buf handle */
> > > +#define TEE_SHM_DMA_MEM              BIT(5)  /* Memory allocated with */
> > > +                                     /* dma_alloc_pages() */
> > >
> > >  #define TEE_DEVICE_FLAG_REGISTERED   0x1
> > >  #define TEE_MAX_DEV_NAME_LEN         32
> > > @@ -310,6 +312,9 @@ void *tee_get_drvdata(struct tee_device *teedev);
> > >   */
> > >  struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size);
> > >
> > > +struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
> > > +                                   size_t page_count);
> > > +
> > >  int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t align,
> > >                            int (*shm_register)(struct tee_context *ctx,
> > >                                                struct tee_shm *shm,
> > > --
> > > 2.43.0
> > >
