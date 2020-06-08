Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B500F1F1384
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 09:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58B56E497;
	Mon,  8 Jun 2020 07:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C3FA89D4B
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 01:33:21 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id g62so9976503qtd.5
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 18:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lWjZ0ATSaEye0Bi2OFiSChYlU/sVI6QI0KBmWOw2/ME=;
 b=B5UxJNKy+Gku93rPNEm+OScpi1AgEe9k+fedHSTZjhSZKs+0NOi77JqT3RVE7UJQHz
 gX8Nd82uP8BI34gepu9gQsaTgthEVw1ScOJ+vV5HRSOIMVZUEBJtHAvRnz4u5RbNWpYq
 TASQxquIYZ+4NleP6+w1br6oU0gJcj07/F7gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lWjZ0ATSaEye0Bi2OFiSChYlU/sVI6QI0KBmWOw2/ME=;
 b=nfvvnGd7t6WBgEZ1ilnbbvWscdB7YkdL6dhgR5c1AEpAK9/YzBhWcLEJNLUMLk4Nsl
 YPMBZVT+PXGYRfc8umHli3kVeiTOfrzmBde369lZCBdnSSRI2cmqqDm2TOvBykHFuxXs
 HI3r9L5h13wpwpa3Rud78H1VC+8/gi4S+aqEHJ3Ffhs8xSzwcNsnFOP+D7U0NgeZJvMh
 pR/astTdk/RyayAcpqEoZTUKW2uaCxnpx6ETFO/DpNLq5x/87vaEi5eOrVBBer2ZZnck
 tIz+55s/Lx4ECkKCK7vongzRHO2XvpjrLNq8CIKvEbtD/j6vxyMyAkb85BZrVoY1Ce3y
 hBCA==
X-Gm-Message-State: AOAM533SU8SSfPNJ7bcCglNvS7nFGrthXYztDVpC9NNDiiF5pi+WnlQH
 x7u7HWWunZHRuwJ7j8ncpU6sMdYbFBfg70MCa53ixw==
X-Google-Smtp-Source: ABdhPJw4OhRhvJvUEtwywNu0NEGhO7Zgx4/6suiIs89J/Z3riECqRRbSUeDB2bVSSaqL0ISmU4q4EcJtUtS32ixDf8U=
X-Received: by 2002:aed:21a4:: with SMTP id l33mr17978554qtc.72.1591580000574; 
 Sun, 07 Jun 2020 18:33:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200526105811.30784-1-stevensd@chromium.org>
 <20200526105811.30784-2-stevensd@chromium.org>
 <20200604145620-mutt-send-email-mst@kernel.org>
 <CAD=HUj74mKs5AfcViD3CBva86E0Hvg_pmYChAJe3ny8jtnZ8Tw@mail.gmail.com>
 <20200606160155-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200606160155-mutt-send-email-mst@kernel.org>
From: David Stevens <stevensd@chromium.org>
Date: Mon, 8 Jun 2020 10:33:09 +0900
Message-ID: <CAD=HUj5Jn+grQVfxmPSSnERdGwnu8RceDsdpWpoxXH+WL4k+qw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] virtio: add dma-buf support for exported objects
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Mailman-Approved-At: Mon, 08 Jun 2020 07:21:26 +0000
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

On Sun, Jun 7, 2020 at 5:04 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Jun 05, 2020 at 10:28:42AM +0900, David Stevens wrote:
> > On Fri, Jun 5, 2020 at 4:05 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Tue, May 26, 2020 at 07:58:09PM +0900, David Stevens wrote:
> > > > This change adds a new flavor of dma-bufs that can be used by virtio
> > > > drivers to share exported objects. A virtio dma-buf can be queried by
> > > > virtio drivers to obtain the UUID which identifies the underlying
> > > > exported object.
> > > >
> > > > Signed-off-by: David Stevens <stevensd@chromium.org>
> > >
> > > Is this just for graphics? If yes I'd rather we put it in the graphics
> > > driver. We can always move it later ...
> >
> > As stated in the cover letter, this will be used by virtio-video.
> >
> > The proposed virtio-video patches: https://markmail.org/thread/p5d3k566srtdtute
> > The patch which imports these dma-bufs (slightly out of data, uses v3
> > of this patch set): https://markmail.org/thread/j4xlqaaim266qpks
> >
> > > > ---
> > > >  drivers/virtio/Makefile         |  2 +-
> > > >  drivers/virtio/virtio.c         |  6 +++
> > > >  drivers/virtio/virtio_dma_buf.c | 89 +++++++++++++++++++++++++++++++++
> > > >  include/linux/virtio.h          |  1 +
> > > >  include/linux/virtio_dma_buf.h  | 58 +++++++++++++++++++++
> > > >  5 files changed, 155 insertions(+), 1 deletion(-)
> > > >  create mode 100644 drivers/virtio/virtio_dma_buf.c
> > > >  create mode 100644 include/linux/virtio_dma_buf.h
> > > >
> > > > diff --git a/drivers/virtio/Makefile b/drivers/virtio/Makefile
> > > > index 29a1386ecc03..ecdae5b596de 100644
> > > > --- a/drivers/virtio/Makefile
> > > > +++ b/drivers/virtio/Makefile
> > > > @@ -1,5 +1,5 @@
> > > >  # SPDX-License-Identifier: GPL-2.0
> > > > -obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o
> > > > +obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o virtio_dma_buf.o
> > > >  obj-$(CONFIG_VIRTIO_MMIO) += virtio_mmio.o
> > > >  obj-$(CONFIG_VIRTIO_PCI) += virtio_pci.o
> > > >  virtio_pci-y := virtio_pci_modern.o virtio_pci_common.o
> > > > diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> > > > index a977e32a88f2..5d46f0ded92d 100644
> > > > --- a/drivers/virtio/virtio.c
> > > > +++ b/drivers/virtio/virtio.c
> > > > @@ -357,6 +357,12 @@ int register_virtio_device(struct virtio_device *dev)
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(register_virtio_device);
> > > >
> > > > +bool is_virtio_device(struct device *dev)
> > > > +{
> > > > +     return dev->bus == &virtio_bus;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(is_virtio_device);
> > > > +
> > > >  void unregister_virtio_device(struct virtio_device *dev)
> > > >  {
> > > >       int index = dev->index; /* save for after device release */
> > > > diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_buf.c
> > > > new file mode 100644
> > > > index 000000000000..23e3399b11ed
> > > > --- /dev/null
> > > > +++ b/drivers/virtio/virtio_dma_buf.c
> > > > @@ -0,0 +1,89 @@
> > > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > > +/*
> > > > + * dma-bufs for virtio exported objects
> > > > + *
> > > > + * Copyright (C) 2020 Google, Inc.
> > > > + */
> > > > +
> > > > +#include <linux/virtio_dma_buf.h>
> > > > +
> > > > +/**
> > > > + * virtio_dma_buf_export - Creates a new dma-buf for a virtio exported object
> > > > + *
> > > > + * This wraps dma_buf_export() to allow virtio drivers to create a dma-buf
> > > > + * for an virtio exported object that can be queried by other virtio drivers
> > > > + * for the object's UUID.
> > > > + */
> > > > +struct dma_buf *virtio_dma_buf_export(
> > > > +             const struct virtio_dma_buf_export_info *virtio_exp_info)
> > > > +{
> > > > +     struct dma_buf_export_info exp_info;
> > > > +
> > > > +     if (!virtio_exp_info->ops
> > > > +             || virtio_exp_info->ops->ops.attach != &virtio_dma_buf_attach
> > > > +             || !virtio_exp_info->ops->get_uuid) {
> > > > +             return ERR_PTR(-EINVAL);
> > > > +     }
> > > > +
> > > > +     exp_info.exp_name = virtio_exp_info->exp_name;
> > > > +     exp_info.owner = virtio_exp_info->owner;
> > > > +     exp_info.ops = &virtio_exp_info->ops->ops;
> > > > +     exp_info.size = virtio_exp_info->size;
> > > > +     exp_info.flags = virtio_exp_info->flags;
> > > > +     exp_info.resv = virtio_exp_info->resv;
> > > > +     exp_info.priv = virtio_exp_info->priv;
> > > > +     BUILD_BUG_ON(sizeof(struct virtio_dma_buf_export_info)
> > > > +                  != sizeof(struct dma_buf_export_info));
> > >
> > > This is the only part that gives me pause. Why do we need this hack?
> > > What's wrong with just using dma_buf_export_info directly,
> > > and if you want the virtio ops, just using container_off?
> >
> > This approach provides a more explicit type signature and a little
> > more type safety, I think. If others don't think it's a worthwhile
> > tradeoff, I can remove it.
> >
> > -David
>
> The cost is that if dma_buf_export_info changes even slightly, we get
> weird crashes.

I'm not sure I understand what types of changes you're referring to.
As this is written, virtio-dma-buf is just another client of the
dma-buf API. If this were rewritten to use dma-buf directly, then
whatever code calls virtio_dma_buf_export would become a client of the
dma-buf API. If the semantics of existing fields in the dma-buf API
were changed and virtio-dma-buf wasn't updated, then yes, you could
get weird crashes from virtio-dma-buf. However, the same problem would
exist if virtio_dma_buf_export used dma-buf directly - changes to
dma-buf's semantics could cause weird crashes if the caller of
virtio_dma_buf_export wasn't updated properly. The only potential
source of problems I see is if virtio_dma_buf_export_info wasn't
updated properly, but virtio_dma_buf_export_info is dead simple, so I
don't know if that's really a problem.

-David
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
