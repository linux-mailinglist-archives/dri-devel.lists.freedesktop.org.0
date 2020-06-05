Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C241EF1DC
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 09:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329426E854;
	Fri,  5 Jun 2020 07:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA746E373
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 01:28:53 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id w1so8191671qkw.5
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jun 2020 18:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y/nqmn16Yw0SQZqn88EIVGM4HFQd8IWQBv7BdFGkZBA=;
 b=Djwuxcxs7hMaNuqV5sa0Qt4loVXVD289IkhwAUeoo9toxuTynSobzLXQofFQ/mxxmA
 chX1YXEbRvziHsS2t9CF+sRs3hitooR08WRDXrroJv4P7KQvweF5vSAapRuCRXxcin75
 AMdZf0yCjV6zh6r2M2eGqgwJQzS57I0WUDha8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y/nqmn16Yw0SQZqn88EIVGM4HFQd8IWQBv7BdFGkZBA=;
 b=XTiOqWE/rGuGBVrF+YsndFIW2Km+4KyOlGsls8h9VYTfSN+6u4/AGrO+BU+/s2EEk3
 1L7QRYe9JcSlVZVBzccccglGaf0BRCE2ojc7XJD8VstVsztJ5SS0hDzJD4AsM8Gg9DI7
 8eJ9wtOeRY5EbPxo1lTtRhBV5YX14l9f6XklQPrDOo3iQkmv1+2m4YK4jEVsVEn19kRV
 nHDSHk7vgogtDdauFlyTYj0GBn+phgJzG5NPqEZGZUWk27BmlrVWxwwLiw/FbaoOFCeJ
 o7OlymbfazMDhCoxoZGhzieqID+iDYxex9D4tvym4xsZEmMp8BjpKnXIpFII6H/f3Az0
 uMKA==
X-Gm-Message-State: AOAM531j7iNiguKf7B8Pnx31+gx6IAkNzeDyn7Bj9gPval+Bw2aq9Xbp
 7PAUXcz1Ld4fUhEEQGGB+UgUI7l+rJkcOy7Bpdo2QA==
X-Google-Smtp-Source: ABdhPJzI3XPBWQSo123FOo+T+xLNNe5zY7aIfXdAy9YU7XblVgMgV74iVNrnVs1mdh7B4N8NJ72GXVJk+yl0MoIt45U=
X-Received: by 2002:a05:620a:21cc:: with SMTP id
 h12mr7527247qka.194.1591320533032; 
 Thu, 04 Jun 2020 18:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200526105811.30784-1-stevensd@chromium.org>
 <20200526105811.30784-2-stevensd@chromium.org>
 <20200604145620-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200604145620-mutt-send-email-mst@kernel.org>
From: David Stevens <stevensd@chromium.org>
Date: Fri, 5 Jun 2020 10:28:42 +0900
Message-ID: <CAD=HUj74mKs5AfcViD3CBva86E0Hvg_pmYChAJe3ny8jtnZ8Tw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] virtio: add dma-buf support for exported objects
To: "Michael S. Tsirkin" <mst@redhat.com>
X-Mailman-Approved-At: Fri, 05 Jun 2020 07:18:56 +0000
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

On Fri, Jun 5, 2020 at 4:05 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, May 26, 2020 at 07:58:09PM +0900, David Stevens wrote:
> > This change adds a new flavor of dma-bufs that can be used by virtio
> > drivers to share exported objects. A virtio dma-buf can be queried by
> > virtio drivers to obtain the UUID which identifies the underlying
> > exported object.
> >
> > Signed-off-by: David Stevens <stevensd@chromium.org>
>
> Is this just for graphics? If yes I'd rather we put it in the graphics
> driver. We can always move it later ...

As stated in the cover letter, this will be used by virtio-video.

The proposed virtio-video patches: https://markmail.org/thread/p5d3k566srtdtute
The patch which imports these dma-bufs (slightly out of data, uses v3
of this patch set): https://markmail.org/thread/j4xlqaaim266qpks

> > ---
> >  drivers/virtio/Makefile         |  2 +-
> >  drivers/virtio/virtio.c         |  6 +++
> >  drivers/virtio/virtio_dma_buf.c | 89 +++++++++++++++++++++++++++++++++
> >  include/linux/virtio.h          |  1 +
> >  include/linux/virtio_dma_buf.h  | 58 +++++++++++++++++++++
> >  5 files changed, 155 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/virtio/virtio_dma_buf.c
> >  create mode 100644 include/linux/virtio_dma_buf.h
> >
> > diff --git a/drivers/virtio/Makefile b/drivers/virtio/Makefile
> > index 29a1386ecc03..ecdae5b596de 100644
> > --- a/drivers/virtio/Makefile
> > +++ b/drivers/virtio/Makefile
> > @@ -1,5 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0
> > -obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o
> > +obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o virtio_dma_buf.o
> >  obj-$(CONFIG_VIRTIO_MMIO) += virtio_mmio.o
> >  obj-$(CONFIG_VIRTIO_PCI) += virtio_pci.o
> >  virtio_pci-y := virtio_pci_modern.o virtio_pci_common.o
> > diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> > index a977e32a88f2..5d46f0ded92d 100644
> > --- a/drivers/virtio/virtio.c
> > +++ b/drivers/virtio/virtio.c
> > @@ -357,6 +357,12 @@ int register_virtio_device(struct virtio_device *dev)
> >  }
> >  EXPORT_SYMBOL_GPL(register_virtio_device);
> >
> > +bool is_virtio_device(struct device *dev)
> > +{
> > +     return dev->bus == &virtio_bus;
> > +}
> > +EXPORT_SYMBOL_GPL(is_virtio_device);
> > +
> >  void unregister_virtio_device(struct virtio_device *dev)
> >  {
> >       int index = dev->index; /* save for after device release */
> > diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_buf.c
> > new file mode 100644
> > index 000000000000..23e3399b11ed
> > --- /dev/null
> > +++ b/drivers/virtio/virtio_dma_buf.c
> > @@ -0,0 +1,89 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * dma-bufs for virtio exported objects
> > + *
> > + * Copyright (C) 2020 Google, Inc.
> > + */
> > +
> > +#include <linux/virtio_dma_buf.h>
> > +
> > +/**
> > + * virtio_dma_buf_export - Creates a new dma-buf for a virtio exported object
> > + *
> > + * This wraps dma_buf_export() to allow virtio drivers to create a dma-buf
> > + * for an virtio exported object that can be queried by other virtio drivers
> > + * for the object's UUID.
> > + */
> > +struct dma_buf *virtio_dma_buf_export(
> > +             const struct virtio_dma_buf_export_info *virtio_exp_info)
> > +{
> > +     struct dma_buf_export_info exp_info;
> > +
> > +     if (!virtio_exp_info->ops
> > +             || virtio_exp_info->ops->ops.attach != &virtio_dma_buf_attach
> > +             || !virtio_exp_info->ops->get_uuid) {
> > +             return ERR_PTR(-EINVAL);
> > +     }
> > +
> > +     exp_info.exp_name = virtio_exp_info->exp_name;
> > +     exp_info.owner = virtio_exp_info->owner;
> > +     exp_info.ops = &virtio_exp_info->ops->ops;
> > +     exp_info.size = virtio_exp_info->size;
> > +     exp_info.flags = virtio_exp_info->flags;
> > +     exp_info.resv = virtio_exp_info->resv;
> > +     exp_info.priv = virtio_exp_info->priv;
> > +     BUILD_BUG_ON(sizeof(struct virtio_dma_buf_export_info)
> > +                  != sizeof(struct dma_buf_export_info));
>
> This is the only part that gives me pause. Why do we need this hack?
> What's wrong with just using dma_buf_export_info directly,
> and if you want the virtio ops, just using container_off?

This approach provides a more explicit type signature and a little
more type safety, I think. If others don't think it's a worthwhile
tradeoff, I can remove it.

-David
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
