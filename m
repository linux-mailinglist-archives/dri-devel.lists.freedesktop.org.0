Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB6A1F34F6
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 09:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156D66E288;
	Tue,  9 Jun 2020 07:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB67E8997E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 09:30:49 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id n11so16552553qkn.8
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 02:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FiS6FXFBbYvuiObSkizJLnD188Qx4xGnrdqq/91Kjfk=;
 b=NEXT3lPGN24I0sCOBTtQEvemeXK7AIoCm4xsEx7f/5gzIYXUaBO9zxrTfMz9ZfRISR
 Jl6eVUxNku//cyjm+Tw/uA4gHILbvSoE+nAVgmdzo4MsHQPHsdukrtHYssDG7fdbbo2i
 LwXJlLaAgy++e/qqaZCajIcQtTBDCAzq6DF8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FiS6FXFBbYvuiObSkizJLnD188Qx4xGnrdqq/91Kjfk=;
 b=Fejn5WwPaj7Y0b79T71YJRE/O2ghjQdz4nxvIiEvjuImDoEdFb6VjFvoNKGDs7CZpJ
 rW3Eof/IbKqdEqXJLGSZEd2nw3CdTcHUkVp0f+bZSJ7p+OphlJMCjlLrqR21LRxRfGge
 QGZKH8zL8eal8PIdUqRYDaaITSlf9Tg1AXgF7qpEvH1JTW8A0CDIQd1Q1M9Gl/5rhShG
 +HtXoFUpIr2v3unaPG5prZfPkNxl3a7Rc+IGu3D3v0rxF0dGIZv5MiKW5C8hPQJRRxvz
 5d0iVtoS9Wsr64qmdXYvyBfp87l8h4tZS4adG208Jawv1J+51HlStzQ4ROBw9jroV/ep
 Btsg==
X-Gm-Message-State: AOAM531Q9tJqgwhPzfOENsaWVTjh3jdcsEhM4gHy3MqlRHnELxbKi3Hw
 c5ceVesRcOUtkod1tApKcOQF+6i5KPB7bMbh9RqnGA==
X-Google-Smtp-Source: ABdhPJyCyqnNzUwYp03xeP6dKWsEdLt6bxdABQu7k/v5O3JAPPStYqQlKixO/2KpuUK5xAlAx3uTUFYsTfWQRTxcyh4=
X-Received: by 2002:a37:48cc:: with SMTP id v195mr4863659qka.232.1591608648827; 
 Mon, 08 Jun 2020 02:30:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200526105811.30784-1-stevensd@chromium.org>
 <20200526105811.30784-2-stevensd@chromium.org>
 <20200604145620-mutt-send-email-mst@kernel.org>
 <CAD=HUj74mKs5AfcViD3CBva86E0Hvg_pmYChAJe3ny8jtnZ8Tw@mail.gmail.com>
 <20200606160155-mutt-send-email-mst@kernel.org>
 <CAD=HUj5Jn+grQVfxmPSSnERdGwnu8RceDsdpWpoxXH+WL4k+qw@mail.gmail.com>
 <20200608015728-mutt-send-email-mst@kernel.org>
 <CAD=HUj68NfNK+0go7Z-XeZ2ckWJpYsym3G+-DfJyoUm+dJDznQ@mail.gmail.com>
 <20200608045721-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200608045721-mutt-send-email-mst@kernel.org>
From: David Stevens <stevensd@chromium.org>
Date: Mon, 8 Jun 2020 18:30:37 +0900
Message-ID: <CAD=HUj5q7V74V41ijHEa5QPgQVHZ0D1guj9cvxzhzfQUotWUBA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] virtio: add dma-buf support for exported objects
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Mailman-Approved-At: Tue, 09 Jun 2020 07:35:06 +0000
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 virtio-dev@lists.oasis-open.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Jason Wang <jasowang@redhat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 8, 2020 at 6:05 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Jun 08, 2020 at 05:32:26PM +0900, David Stevens wrote:
> > On Mon, Jun 8, 2020 at 3:00 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Mon, Jun 08, 2020 at 10:33:09AM +0900, David Stevens wrote:
> > > > On Sun, Jun 7, 2020 at 5:04 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > >
> > > > > On Fri, Jun 05, 2020 at 10:28:42AM +0900, David Stevens wrote:
> > > > > > On Fri, Jun 5, 2020 at 4:05 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > >
> > > > > > > On Tue, May 26, 2020 at 07:58:09PM +0900, David Stevens wrote:
> > > > > > > > This change adds a new flavor of dma-bufs that can be used by virtio
> > > > > > > > drivers to share exported objects. A virtio dma-buf can be queried by
> > > > > > > > virtio drivers to obtain the UUID which identifies the underlying
> > > > > > > > exported object.
> > > > > > > >
> > > > > > > > Signed-off-by: David Stevens <stevensd@chromium.org>
> > > > > > >
> > > > > > > Is this just for graphics? If yes I'd rather we put it in the graphics
> > > > > > > driver. We can always move it later ...
> > > > > >
> > > > > > As stated in the cover letter, this will be used by virtio-video.
> > > > > >
> > > > > > The proposed virtio-video patches: https://markmail.org/thread/p5d3k566srtdtute
> > > > > > The patch which imports these dma-bufs (slightly out of data, uses v3
> > > > > > of this patch set): https://markmail.org/thread/j4xlqaaim266qpks
> > > > > >
> > > > > > > > ---
> > > > > > > >  drivers/virtio/Makefile         |  2 +-
> > > > > > > >  drivers/virtio/virtio.c         |  6 +++
> > > > > > > >  drivers/virtio/virtio_dma_buf.c | 89 +++++++++++++++++++++++++++++++++
> > > > > > > >  include/linux/virtio.h          |  1 +
> > > > > > > >  include/linux/virtio_dma_buf.h  | 58 +++++++++++++++++++++
> > > > > > > >  5 files changed, 155 insertions(+), 1 deletion(-)
> > > > > > > >  create mode 100644 drivers/virtio/virtio_dma_buf.c
> > > > > > > >  create mode 100644 include/linux/virtio_dma_buf.h
> > > > > > > >
> > > > > > > > diff --git a/drivers/virtio/Makefile b/drivers/virtio/Makefile
> > > > > > > > index 29a1386ecc03..ecdae5b596de 100644
> > > > > > > > --- a/drivers/virtio/Makefile
> > > > > > > > +++ b/drivers/virtio/Makefile
> > > > > > > > @@ -1,5 +1,5 @@
> > > > > > > >  # SPDX-License-Identifier: GPL-2.0
> > > > > > > > -obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o
> > > > > > > > +obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o virtio_dma_buf.o
> > > > > > > >  obj-$(CONFIG_VIRTIO_MMIO) += virtio_mmio.o
> > > > > > > >  obj-$(CONFIG_VIRTIO_PCI) += virtio_pci.o
> > > > > > > >  virtio_pci-y := virtio_pci_modern.o virtio_pci_common.o
> > > > > > > > diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> > > > > > > > index a977e32a88f2..5d46f0ded92d 100644
> > > > > > > > --- a/drivers/virtio/virtio.c
> > > > > > > > +++ b/drivers/virtio/virtio.c
> > > > > > > > @@ -357,6 +357,12 @@ int register_virtio_device(struct virtio_device *dev)
> > > > > > > >  }
> > > > > > > >  EXPORT_SYMBOL_GPL(register_virtio_device);
> > > > > > > >
> > > > > > > > +bool is_virtio_device(struct device *dev)
> > > > > > > > +{
> > > > > > > > +     return dev->bus == &virtio_bus;
> > > > > > > > +}
> > > > > > > > +EXPORT_SYMBOL_GPL(is_virtio_device);
> > > > > > > > +
> > > > > > > >  void unregister_virtio_device(struct virtio_device *dev)
> > > > > > > >  {
> > > > > > > >       int index = dev->index; /* save for after device release */
> > > > > > > > diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_buf.c
> > > > > > > > new file mode 100644
> > > > > > > > index 000000000000..23e3399b11ed
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/drivers/virtio/virtio_dma_buf.c
> > > > > > > > @@ -0,0 +1,89 @@
> > > > > > > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > > > > > > +/*
> > > > > > > > + * dma-bufs for virtio exported objects
> > > > > > > > + *
> > > > > > > > + * Copyright (C) 2020 Google, Inc.
> > > > > > > > + */
> > > > > > > > +
> > > > > > > > +#include <linux/virtio_dma_buf.h>
> > > > > > > > +
> > > > > > > > +/**
> > > > > > > > + * virtio_dma_buf_export - Creates a new dma-buf for a virtio exported object
> > > > > > > > + *
> > > > > > > > + * This wraps dma_buf_export() to allow virtio drivers to create a dma-buf
> > > > > > > > + * for an virtio exported object that can be queried by other virtio drivers
> > > > > > > > + * for the object's UUID.
> > > > > > > > + */
> > > > > > > > +struct dma_buf *virtio_dma_buf_export(
> > > > > > > > +             const struct virtio_dma_buf_export_info *virtio_exp_info)
> > > > > > > > +{
> > > > > > > > +     struct dma_buf_export_info exp_info;
> > > > > > > > +
> > > > > > > > +     if (!virtio_exp_info->ops
> > > > > > > > +             || virtio_exp_info->ops->ops.attach != &virtio_dma_buf_attach
> > > > > > > > +             || !virtio_exp_info->ops->get_uuid) {
> > > > > > > > +             return ERR_PTR(-EINVAL);
> > > > > > > > +     }
> > > > > > > > +
> > > > > > > > +     exp_info.exp_name = virtio_exp_info->exp_name;
> > > > > > > > +     exp_info.owner = virtio_exp_info->owner;
> > > > > > > > +     exp_info.ops = &virtio_exp_info->ops->ops;
> > > > > > > > +     exp_info.size = virtio_exp_info->size;
> > > > > > > > +     exp_info.flags = virtio_exp_info->flags;
> > > > > > > > +     exp_info.resv = virtio_exp_info->resv;
> > > > > > > > +     exp_info.priv = virtio_exp_info->priv;
> > > > > > > > +     BUILD_BUG_ON(sizeof(struct virtio_dma_buf_export_info)
> > > > > > > > +                  != sizeof(struct dma_buf_export_info));
> > > > > > >
> > > > > > > This is the only part that gives me pause. Why do we need this hack?
> > > > > > > What's wrong with just using dma_buf_export_info directly,
> > > > > > > and if you want the virtio ops, just using container_off?
> > > > > >
> > > > > > This approach provides a more explicit type signature and a little
> > > > > > more type safety, I think. If others don't think it's a worthwhile
> > > > > > tradeoff, I can remove it.
> > > > > >
> > > > > > -David
> > > > >
> > > > > The cost is that if dma_buf_export_info changes even slightly, we get
> > > > > weird crashes.
> > > >
> > > > I'm not sure I understand what types of changes you're referring to.
> > > > As this is written, virtio-dma-buf is just another client of the
> > > > dma-buf API. If this were rewritten to use dma-buf directly, then
> > > > whatever code calls virtio_dma_buf_export would become a client of the
> > > > dma-buf API. If the semantics of existing fields in the dma-buf API
> > > > were changed and virtio-dma-buf wasn't updated, then yes, you could
> > > > get weird crashes from virtio-dma-buf.
> > > > However, the same problem would
> > > > exist if virtio_dma_buf_export used dma-buf directly - changes to
> > > > dma-buf's semantics could cause weird crashes if the caller of
> > > > virtio_dma_buf_export wasn't updated properly. The only potential
> > > > source of problems I see is if virtio_dma_buf_export_info wasn't
> > > > updated properly, but virtio_dma_buf_export_info is dead simple, so I
> > > > don't know if that's really a problem.
> > > >
> > > > -David
> > >
> > > I think you can get weird crashes if fields in dma buf are reordered, or
> > > if a field size changes.  You have a build bug catching overall struct
> > > size changes but that can remain the same due do compiler padding or
> > > such.
> >
> > Since it's manually copying the fields instead of trying something
> > clever like memcpy, I don't see how reordering the fields or changing
> > the size of the fields would cause problems. Right now,
> > virtio_dma_buf_export is just a regular client of dma_buf_export, no
> > different than any of the other call sites in the kernel.
> >
> > Overall, I don't really think that this is a problem. If someone makes
> > breaking changes to the semantics of dma-buf, then they will need to
> > update this call site, just like they will need to update all of the
> > other call sites in the kernel. If someone adds new functionality to
> > dma-buf and adds another field to dma_buf_export_info, the build bug
> > is a reminder to add it to virtio_dma_buf_export_info. However, if the
> > struct padding happens to work out such that the build bug doesn't
> > trigger, that doesn't really matter - it just means that the new
> > dma-buf feature won't be exposed by virito-dma-buf until someone needs
> > it and notices that the new field is missing.
> >
> > -David
>
> Think about the reasons for the BUILD_BUG_ON being there, checking
> struct sizes like this is a clear sign of something strange going on.

Like I said, it's there as a reminder to update the virtio-dma-buf API
if the dma-buf API gets updated. Perhaps you could say it's a misuse
of BUILD_BUG_ON, since not updating virtio-dma-buf in such a situation
isn't a bug per se. If the BUILD_BUG_ON actually caught a real bug,
there would be a much more fundamental issue going on. The code is
doing nothing strange, nothing fundamentally different from any other
call such as in drm_gem_prime_export or udmabuf_create - it's just
setting fields in the dma_buf_export_info struct to values.

> But really this is just unnecessary complexity anyway.
>
> The only difference with dma_buf is get_uuid and device_attacj, isn't it?
>
> And they are called like this:
>
>
>
> + */
> +int virtio_dma_buf_get_uuid(struct dma_buf *dma_buf,
> +                           uuid_t *uuid)
> +{
> +       const struct virtio_dma_buf_ops *ops = container_of(
> +                       dma_buf->ops, const struct virtio_dma_buf_ops, ops);
> +
> +       if (!is_virtio_dma_buf(dma_buf))
> +               return -EINVAL;
> +
> +       return ops->get_uuid(dma_buf, uuid);
> +}
>
>
> So you are doing the container_of trick anyway, the extra structure
> did not give us any type safety.

Lack of type safety in one situation doesn't mean that type safety in
another situation isn't worthwhile. If that were the case, then why
does C have typedef? Why does Linux bother with types at all, since
you can cast anything to anything with strict aliasing disabled? We
can still make the virtio_dma_buf_export function more type-safe and
readable while still having some unavoidable casting.

But that being said, it's not worth further bikeshedding. I'll send
out an updated patch set.

-David
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
