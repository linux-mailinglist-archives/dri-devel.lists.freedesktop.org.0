Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 525A0AF6B60
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 09:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CDA510E7D4;
	Thu,  3 Jul 2025 07:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c2SoKIA+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE1F10E7D4
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 07:22:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 903265C56AF;
 Thu,  3 Jul 2025 07:22:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ED20C4CEE3;
 Thu,  3 Jul 2025 07:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751527371;
 bh=ALg01YIgkrwoUDvsMjOv0ifrRIF9II6dP2WmLLB2Zos=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c2SoKIA+rlsxHTHcIFNb2FZZFIhKnqguziQCm7t+B1CjEzVSLvjkNTbCZT+2Hvc56
 kIy1nOTR6xoGOGnaJt7BvuoI1m0srPGGqcivwIX11x2BiI1RtT/vS4eW9x2gxoZ1fQ
 8AbxpvZCHaYfn4wl23UqHmjCqmj/x11Xn1p591WDhd+bYGC5Wio8PkHmZJp2lSF2mS
 2CvA/hFPKM2TKoh7ES70u1vptm452cQegu2XmGksndsJGnN+Zs8if9cfSiTFhY5jNo
 KnPmWK1lFf+Ig1o/4+sVx8k9fHnP9ls4dyeqBDDlcX3pdGngQ1wdw2opXrsOz9NGBJ
 rhdr098JpIYCQ==
Date: Thu, 3 Jul 2025 12:52:40 +0530
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
 Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com,
 Etienne Carriere <etienne.carriere@foss.st.com>
Subject: Re: [PATCH v10 5/9] tee: new ioctl to a register tee_shm from a
 dmabuf file descriptor
Message-ID: <aGYvwHK2RgIERf_G@sumit-X1>
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
 <20250610131600.2972232-6-jens.wiklander@linaro.org>
 <aFFIAiU4ZSN1qZXK@sumit-X1>
 <CAHUa44E=nHjLf2guoG6LzTKZwTQGjEReKUF01PL31BfJ22e9EQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHUa44E=nHjLf2guoG6LzTKZwTQGjEReKUF01PL31BfJ22e9EQ@mail.gmail.com>
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

On Wed, Jun 18, 2025 at 08:47:51AM +0200, Jens Wiklander wrote:
> On Tue, Jun 17, 2025 at 12:48 PM Sumit Garg <sumit.garg@kernel.org> wrote:
> >
> > On Tue, Jun 10, 2025 at 03:13:49PM +0200, Jens Wiklander wrote:
> > > From: Etienne Carriere <etienne.carriere@foss.st.com>
> > >
> > > Add a userspace API to create a tee_shm object that refers to a dmabuf
> > > reference.
> > >
> > > Userspace registers the dmabuf file descriptor as in a tee_shm object.
> > > The registration is completed with a tee_shm returned file descriptor.
> > >
> > > Userspace is free to close the dmabuf file descriptor after it has been
> > > registered since all the resources are now held via the new tee_shm
> > > object.
> > >
> > > Closing the tee_shm file descriptor will eventually release all
> > > resources used by the tee_shm object when all references are released.
> > >
> > > The new IOCTL, TEE_IOC_SHM_REGISTER_FD, supports dmabuf references to
> > > physically contiguous memory buffers. Dmabuf references acquired from
> > > the TEE DMA-heap can be used as protected memory for Secure Video Path
> > > and such use cases. It depends on the TEE and the TEE driver if dmabuf
> > > references acquired by other means can be used.
> > >
> > > A new tee_shm flag is added to identify tee_shm objects built from a
> > > registered dmabuf, TEE_SHM_DMA_BUF.
> > >
> > > Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> > > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > ---
> > >  drivers/tee/tee_core.c    |  63 +++++++++++++++++++++-
> > >  drivers/tee/tee_private.h |  10 ++++
> > >  drivers/tee/tee_shm.c     | 106 ++++++++++++++++++++++++++++++++++++--
> > >  include/linux/tee_core.h  |   1 +
> > >  include/linux/tee_drv.h   |  10 ++++
> > >  include/uapi/linux/tee.h  |  31 +++++++++++
> > >  6 files changed, 217 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> > > index 5259b8223c27..0e9d9e5872a4 100644
> > > --- a/drivers/tee/tee_core.c
> > > +++ b/drivers/tee/tee_core.c
> > > @@ -353,11 +353,49 @@ tee_ioctl_shm_register(struct tee_context *ctx,
> > >       return ret;
> > >  }
> > >
> > > +static int
> > > +tee_ioctl_shm_register_fd(struct tee_context *ctx,
> > > +                       struct tee_ioctl_shm_register_fd_data __user *udata)
> > > +{
> > > +     struct tee_ioctl_shm_register_fd_data data;
> > > +     struct tee_shm *shm;
> > > +     long ret;
> > > +
> > > +     if (copy_from_user(&data, udata, sizeof(data)))
> > > +             return -EFAULT;
> > > +
> > > +     /* Currently no input flags are supported */
> > > +     if (data.flags)
> > > +             return -EINVAL;
> > > +
> > > +     shm = tee_shm_register_fd(ctx, data.fd);
> > > +     if (IS_ERR(shm))
> > > +             return -EINVAL;
> > > +
> > > +     data.id = shm->id;
> > > +     data.flags = shm->flags;
> > > +     data.size = shm->size;
> > > +
> > > +     if (copy_to_user(udata, &data, sizeof(data)))
> > > +             ret = -EFAULT;
> > > +     else
> > > +             ret = tee_shm_get_fd(shm);
> > > +
> > > +     /*
> > > +      * When user space closes the file descriptor the shared memory
> > > +      * should be freed or if tee_shm_get_fd() failed then it will
> > > +      * be freed immediately.
> > > +      */
> > > +     tee_shm_put(shm);
> > > +     return ret;
> > > +}
> > > +
> > >  static int param_from_user_memref(struct tee_context *ctx,
> > >                                 struct tee_param_memref *memref,
> > >                                 struct tee_ioctl_param *ip)
> > >  {
> > >       struct tee_shm *shm;
> > > +     size_t offs = 0;
> > >
> > >       /*
> > >        * If a NULL pointer is passed to a TA in the TEE,
> > > @@ -388,6 +426,26 @@ static int param_from_user_memref(struct tee_context *ctx,
> > >                       tee_shm_put(shm);
> > >                       return -EINVAL;
> > >               }
> > > +
> > > +             if (shm->flags & TEE_SHM_DMA_BUF) {
> > > +                     struct tee_shm_dmabuf_ref *ref;
> > > +
> > > +                     ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
> > > +                     if (ref->parent_shm) {
> > > +                             /*
> > > +                              * The shm already has one reference to
> > > +                              * ref->parent_shm so we are clear of 0.
> > > +                              * We're getting another reference since
> > > +                              * this shm will be used in the parameter
> > > +                              * list instead of the shm we got with
> > > +                              * tee_shm_get_from_id() above.
> > > +                              */
> > > +                             refcount_inc(&ref->parent_shm->refcount);
> > > +                             tee_shm_put(shm);
> > > +                             shm = ref->parent_shm;
> > > +                             offs = ref->offset;
> > > +                     }
> > > +             }
> > >       } else if (ctx->cap_memref_null) {
> > >               /* Pass NULL pointer to OP-TEE */
> > >               shm = NULL;
> > > @@ -395,7 +453,7 @@ static int param_from_user_memref(struct tee_context *ctx,
> > >               return -EINVAL;
> > >       }
> > >
> > > -     memref->shm_offs = ip->a;
> > > +     memref->shm_offs = ip->a + offs;
> > >       memref->size = ip->b;
> > >       memref->shm = shm;
> > >
> > > @@ -841,6 +899,8 @@ static long tee_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
> > >               return tee_ioctl_shm_alloc(ctx, uarg);
> > >       case TEE_IOC_SHM_REGISTER:
> > >               return tee_ioctl_shm_register(ctx, uarg);
> > > +     case TEE_IOC_SHM_REGISTER_FD:
> > > +             return tee_ioctl_shm_register_fd(ctx, uarg);
> > >       case TEE_IOC_OPEN_SESSION:
> > >               return tee_ioctl_open_session(ctx, uarg);
> > >       case TEE_IOC_INVOKE:
> > > @@ -1300,3 +1360,4 @@ MODULE_AUTHOR("Linaro");
> > >  MODULE_DESCRIPTION("TEE Driver");
> > >  MODULE_VERSION("1.0");
> > >  MODULE_LICENSE("GPL v2");
> > > +MODULE_IMPORT_NS("DMA_BUF");
> > > diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
> > > index 6c6ff5d5eed2..308467705da6 100644
> > > --- a/drivers/tee/tee_private.h
> > > +++ b/drivers/tee/tee_private.h
> > > @@ -13,6 +13,16 @@
> > >  #include <linux/mutex.h>
> > >  #include <linux/types.h>
> > >
> > > +/* extra references appended to shm object for registered shared memory */
> > > +struct tee_shm_dmabuf_ref {
> > > +     struct tee_shm shm;
> > > +     size_t offset;
> > > +     struct dma_buf *dmabuf;
> > > +     struct dma_buf_attachment *attach;
> > > +     struct sg_table *sgt;
> > > +     struct tee_shm *parent_shm;
> > > +};
> > > +
> > >  int tee_shm_get_fd(struct tee_shm *shm);
> > >
> > >  bool tee_device_get(struct tee_device *teedev);
> > > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > > index daf6e5cfd59a..e63095e84644 100644
> > > --- a/drivers/tee/tee_shm.c
> > > +++ b/drivers/tee/tee_shm.c
> > > @@ -4,6 +4,7 @@
> > >   */
> > >  #include <linux/anon_inodes.h>
> > >  #include <linux/device.h>
> > > +#include <linux/dma-buf.h>
> > >  #include <linux/idr.h>
> > >  #include <linux/io.h>
> > >  #include <linux/mm.h>
> > > @@ -45,7 +46,21 @@ static void release_registered_pages(struct tee_shm *shm)
> > >
> > >  static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
> > >  {
> > > -     if (shm->flags & TEE_SHM_POOL) {
> > > +     void *p = shm;
> > > +
> > > +     if (shm->flags & TEE_SHM_DMA_BUF) {
> > > +             struct tee_shm_dmabuf_ref *ref;
> > > +
> > > +             ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
> > > +             p = ref;
> > > +             if (ref->attach) {
> > > +                     dma_buf_unmap_attachment(ref->attach, ref->sgt,
> > > +                                              DMA_BIDIRECTIONAL);
> > > +
> > > +                     dma_buf_detach(ref->dmabuf, ref->attach);
> > > +             }
> > > +             dma_buf_put(ref->dmabuf);
> > > +     } else if (shm->flags & TEE_SHM_POOL) {
> > >               teedev->pool->ops->free(teedev->pool, shm);
> > >       } else if (shm->flags & TEE_SHM_DYNAMIC) {
> > >               int rc = teedev->desc->ops->shm_unregister(shm->ctx, shm);
> > > @@ -59,7 +74,7 @@ static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
> > >
> > >       teedev_ctx_put(shm->ctx);
> > >
> > > -     kfree(shm);
> > > +     kfree(p);
> > >
> > >       tee_device_put(teedev);
> > >  }
> > > @@ -169,7 +184,7 @@ struct tee_shm *tee_shm_alloc_user_buf(struct tee_context *ctx, size_t size)
> > >   * tee_client_invoke_func(). The memory allocated is later freed with a
> > >   * call to tee_shm_free().
> > >   *
> > > - * @returns a pointer to 'struct tee_shm'
> > > + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on failure
> > >   */
> > >  struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size_t size)
> > >  {
> > > @@ -179,6 +194,91 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size_t size)
> > >  }
> > >  EXPORT_SYMBOL_GPL(tee_shm_alloc_kernel_buf);
> > >
> > > +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd)
> > > +{
> > > +     struct tee_shm_dmabuf_ref *ref;
> > > +     int rc;
> > > +
> > > +     if (!tee_device_get(ctx->teedev))
> > > +             return ERR_PTR(-EINVAL);
> > > +
> > > +     teedev_ctx_get(ctx);
> > > +
> > > +     ref = kzalloc(sizeof(*ref), GFP_KERNEL);
> > > +     if (!ref) {
> > > +             rc = -ENOMEM;
> > > +             goto err_put_tee;
> > > +     }
> > > +
> > > +     refcount_set(&ref->shm.refcount, 1);
> > > +     ref->shm.ctx = ctx;
> > > +     ref->shm.id = -1;
> > > +     ref->shm.flags = TEE_SHM_DMA_BUF;
> > > +
> > > +     ref->dmabuf = dma_buf_get(fd);
> > > +     if (IS_ERR(ref->dmabuf)) {
> > > +             rc = PTR_ERR(ref->dmabuf);
> > > +             goto err_kfree_ref;
> > > +     }
> > > +
> > > +     rc = tee_heap_update_from_dma_buf(ctx->teedev, ref->dmabuf,
> > > +                                       &ref->offset, &ref->shm,
> > > +                                       &ref->parent_shm);
> > > +     if (!rc)
> > > +             goto out;
> >
> > One odd thing I find here, why do we bail out on success case here?
> > Don't we need the DMA buffer attach and map APIs to be invoked on
> > success case here?
> 
> No, because if tee_heap_update_from_dma_buf() succeeds, we know
> everything we need about the buffer. Note that we're returning a valid
> pointer below to indicate success.

AFAICS, protmem_pool_op_dyn_update_shm() and
protmem_pool_op_static_update_shm() both return 0 on success case...

> >
> > > +     if (rc != -EINVAL)
> > > +             goto err_put_dmabuf;

...and with this check the below code path is only executed when rc ==
-EINVAL, is that expected behaviour? Shouldn't we error out when -EINVAL
is returned?

> > > +
> > > +     ref->attach = dma_buf_attach(ref->dmabuf, &ctx->teedev->dev);
> > > +     if (IS_ERR(ref->attach)) {
> > > +             rc = PTR_ERR(ref->attach);
> > > +             goto err_put_dmabuf;
> > > +     }
> > > +
> > > +     ref->sgt = dma_buf_map_attachment(ref->attach, DMA_BIDIRECTIONAL);
> > > +     if (IS_ERR(ref->sgt)) {
> > > +             rc = PTR_ERR(ref->sgt);
> > > +             goto err_detach;
> > > +     }

Given above, have we really tested this code leg?

-Sumit

> > > +
> > > +     if (sg_nents(ref->sgt->sgl) != 1) {
> > > +             rc = -EINVAL;
> > > +             goto err_unmap_attachement;
> > > +     }
> > > +
> > > +     ref->shm.paddr = page_to_phys(sg_page(ref->sgt->sgl));
> > > +     ref->shm.size = ref->sgt->sgl->length;
> > > +
> > > +out:
> > > +     mutex_lock(&ref->shm.ctx->teedev->mutex);
> > > +     ref->shm.id = idr_alloc(&ref->shm.ctx->teedev->idr, &ref->shm,
> > > +                             1, 0, GFP_KERNEL);
> > > +     mutex_unlock(&ref->shm.ctx->teedev->mutex);
> > > +     if (ref->shm.id < 0) {
> > > +             rc = ref->shm.id;
> > > +             if (ref->attach)
> > > +                     goto err_unmap_attachement;
> > > +             goto err_put_dmabuf;
> > > +     }
> > > +
> > > +     return &ref->shm;
> > > +
> > > +err_unmap_attachement:
> > > +     dma_buf_unmap_attachment(ref->attach, ref->sgt, DMA_BIDIRECTIONAL);
> > > +err_detach:
> > > +     dma_buf_detach(ref->dmabuf, ref->attach);
> > > +err_put_dmabuf:
> > > +     dma_buf_put(ref->dmabuf);
> > > +err_kfree_ref:
> > > +     kfree(ref);
> > > +err_put_tee:
> > > +     teedev_ctx_put(ctx);
> > > +     tee_device_put(ctx->teedev);
> > > +
> > > +     return ERR_PTR(rc);
> > > +}
> > > +EXPORT_SYMBOL_GPL(tee_shm_register_fd);
> > > +
> > >  /**
> > >   * tee_shm_alloc_priv_buf() - Allocate shared memory for a privately shared
> > >   *                         kernel buffer
> > > diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> > > index 22e03d897dc3..f17710196c4c 100644
> > > --- a/include/linux/tee_core.h
> > > +++ b/include/linux/tee_core.h
> > > @@ -28,6 +28,7 @@
> > >  #define TEE_SHM_USER_MAPPED  BIT(1)  /* Memory mapped in user space */
> > >  #define TEE_SHM_POOL         BIT(2)  /* Memory allocated from pool */
> > >  #define TEE_SHM_PRIV         BIT(3)  /* Memory private to TEE driver */
> > > +#define TEE_SHM_DMA_BUF              BIT(4)  /* Memory with dma-buf handle */
> > >
> > >  #define TEE_DEVICE_FLAG_REGISTERED   0x1
> > >  #define TEE_MAX_DEV_NAME_LEN         32
> > > diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> > > index a54c203000ed..824f1251de60 100644
> > > --- a/include/linux/tee_drv.h
> > > +++ b/include/linux/tee_drv.h
> > > @@ -116,6 +116,16 @@ struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, size_t size);
> > >  struct tee_shm *tee_shm_register_kernel_buf(struct tee_context *ctx,
> > >                                           void *addr, size_t length);
> > >
> > > +/**
> > > + * tee_shm_register_fd() - Register shared memory from file descriptor
> > > + *
> > > + * @ctx:     Context that allocates the shared memory
> > > + * @fd:              Shared memory file descriptor reference
> > > + *
> > > + * @returns a pointer to 'struct tee_shm' on success, and ERR_PTR on failure
> > > + */
> > > +struct tee_shm *tee_shm_register_fd(struct tee_context *ctx, int fd);
> > > +
> > >  /**
> > >   * tee_shm_free() - Free shared memory
> > >   * @shm:     Handle to shared memory to free
> > > diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> > > index d0430bee8292..d843cf980d98 100644
> > > --- a/include/uapi/linux/tee.h
> > > +++ b/include/uapi/linux/tee.h
> > > @@ -378,6 +378,37 @@ struct tee_ioctl_shm_register_data {
> > >       __s32 id;
> > >  };
> > >
> > > +/**
> > > + * struct tee_ioctl_shm_register_fd_data - Shared memory registering argument
> > > + * @fd:              [in] File descriptor identifying dmabuf reference
> > > + * @size:    [out] Size of referenced memory
> > > + * @flags:   [in] Flags to/from allocation.
> > > + * @id:              [out] Identifier of the shared memory
> > > + *
> > > + * The flags field should currently be zero as input. Updated by the call
> > > + * with actual flags as defined by TEE_IOCTL_SHM_* above.
> > > + * This structure is used as argument for TEE_IOC_SHM_REGISTER_FD below.
> > > + */
> > > +struct tee_ioctl_shm_register_fd_data {
> > > +     __s64 fd;
> > > +     __u64 size;
> > > +     __u32 flags;
> > > +     __s32 id;
> > > +};
> > > +
> > > +/**
> > > + * TEE_IOC_SHM_REGISTER_FD - register a shared memory from a file descriptor
> > > + *
> > > + * Returns a file descriptor on success or < 0 on failure
> > > + *
> > > + * The returned file descriptor refers to the shared memory object in the
> > > + * kernel. The supplied file deccriptor can be closed if it's not needed
> > > + * for other purposes. The shared memory is freed when the descriptor is
> > > + * closed.
> > > + */
> > > +#define TEE_IOC_SHM_REGISTER_FD      _IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 8, \
> > > +                                  struct tee_ioctl_shm_register_fd_data)
> > > +
> > >  /**
> > >   * TEE_IOC_SHM_REGISTER - Register shared memory argument
> > >   *
> > > --
> > > 2.43.0
> > >
