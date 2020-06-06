Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3841F0878
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jun 2020 22:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747366E0AA;
	Sat,  6 Jun 2020 20:04:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213906E1E5
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jun 2020 20:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591473865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dbpBb4MSkQWgLg9Nn7J60Pj1PPVIBaYGkqlC19OVAoU=;
 b=JIBUme6Qm25XNpInji/44TS6RoAAk6WyPzBDQgjgolUZzc7TgKnx3LR20+pZhWCFLYM0kC
 IjXxk0taU3+miweX/Noon1lUthmpsmVANfZGwAxcXUFsYXaj4Jed9i8lL5dJNNcrIc4pVr
 WUvsJydQzqUz85V4jZXLy7r3eua9iNk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-BB4K3yB9OWKGEVlVHYiF5w-1; Sat, 06 Jun 2020 16:04:20 -0400
X-MC-Unique: BB4K3yB9OWKGEVlVHYiF5w-1
Received: by mail-wr1-f71.google.com with SMTP id d6so5342291wrn.1
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Jun 2020 13:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dbpBb4MSkQWgLg9Nn7J60Pj1PPVIBaYGkqlC19OVAoU=;
 b=ObK7B3GoUk4bCoW6ILuwvBhhZisH5j0/LBz0A0OSjWI6+ki5yzu6tC809OJOfzlZkR
 6o3p3KyLmBFlEdWXe8PCZXIqeXniUDhjAZQXCd0YNvHwAf5371TlThKBRO9iSYDlLs0g
 AkqNtF3BkWMcNyU0NoLxsYxkhH81MpxyFAKbzGS8CWcj2Ja8wGLbKSquKjLNjlirJKO2
 0hW593ByQ/V5/mV2PIRMS0EpEwtHr1jvCCN2jCG0PoRayHP8fhAqQB4xcgeLq+tYVjiB
 1Gofz2dp5EBvkggEbE9wze89i14wqmNi2O0QyL+eAiDL8wSoFmCOYQaQ5en4lLlJJNjR
 ejZw==
X-Gm-Message-State: AOAM5335xBXopFIs8SaPEDibi9rTDETxJgbfndEb9bACSda15dkR6UWn
 FLxiukAfUsINwxGjJSgjzziRRs5Ggc4EKGC3DWJACtNhTUE9X/Tc1zjI486W+XB+Na8gV0taKju
 FFHgOlnIImeLgVh7ewol62J5iTogp
X-Received: by 2002:a1c:9acf:: with SMTP id c198mr8645766wme.172.1591473859003; 
 Sat, 06 Jun 2020 13:04:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyF/K0kPe+1BU5+z6wf6mCOoFiN46YBrIzFqjnlbkr449lWKdRucwcJZf/rZHdlV+ssrzYp6g==
X-Received: by 2002:a1c:9acf:: with SMTP id c198mr8645737wme.172.1591473858743; 
 Sat, 06 Jun 2020 13:04:18 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 b8sm17369698wrm.35.2020.06.06.13.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jun 2020 13:04:17 -0700 (PDT)
Date: Sat, 6 Jun 2020 16:04:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v4 1/3] virtio: add dma-buf support for exported objects
Message-ID: <20200606160155-mutt-send-email-mst@kernel.org>
References: <20200526105811.30784-1-stevensd@chromium.org>
 <20200526105811.30784-2-stevensd@chromium.org>
 <20200604145620-mutt-send-email-mst@kernel.org>
 <CAD=HUj74mKs5AfcViD3CBva86E0Hvg_pmYChAJe3ny8jtnZ8Tw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD=HUj74mKs5AfcViD3CBva86E0Hvg_pmYChAJe3ny8jtnZ8Tw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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

On Fri, Jun 05, 2020 at 10:28:42AM +0900, David Stevens wrote:
> On Fri, Jun 5, 2020 at 4:05 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, May 26, 2020 at 07:58:09PM +0900, David Stevens wrote:
> > > This change adds a new flavor of dma-bufs that can be used by virtio
> > > drivers to share exported objects. A virtio dma-buf can be queried by
> > > virtio drivers to obtain the UUID which identifies the underlying
> > > exported object.
> > >
> > > Signed-off-by: David Stevens <stevensd@chromium.org>
> >
> > Is this just for graphics? If yes I'd rather we put it in the graphics
> > driver. We can always move it later ...
> 
> As stated in the cover letter, this will be used by virtio-video.
> 
> The proposed virtio-video patches: https://markmail.org/thread/p5d3k566srtdtute
> The patch which imports these dma-bufs (slightly out of data, uses v3
> of this patch set): https://markmail.org/thread/j4xlqaaim266qpks
> 
> > > ---
> > >  drivers/virtio/Makefile         |  2 +-
> > >  drivers/virtio/virtio.c         |  6 +++
> > >  drivers/virtio/virtio_dma_buf.c | 89 +++++++++++++++++++++++++++++++++
> > >  include/linux/virtio.h          |  1 +
> > >  include/linux/virtio_dma_buf.h  | 58 +++++++++++++++++++++
> > >  5 files changed, 155 insertions(+), 1 deletion(-)
> > >  create mode 100644 drivers/virtio/virtio_dma_buf.c
> > >  create mode 100644 include/linux/virtio_dma_buf.h
> > >
> > > diff --git a/drivers/virtio/Makefile b/drivers/virtio/Makefile
> > > index 29a1386ecc03..ecdae5b596de 100644
> > > --- a/drivers/virtio/Makefile
> > > +++ b/drivers/virtio/Makefile
> > > @@ -1,5 +1,5 @@
> > >  # SPDX-License-Identifier: GPL-2.0
> > > -obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o
> > > +obj-$(CONFIG_VIRTIO) += virtio.o virtio_ring.o virtio_dma_buf.o
> > >  obj-$(CONFIG_VIRTIO_MMIO) += virtio_mmio.o
> > >  obj-$(CONFIG_VIRTIO_PCI) += virtio_pci.o
> > >  virtio_pci-y := virtio_pci_modern.o virtio_pci_common.o
> > > diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> > > index a977e32a88f2..5d46f0ded92d 100644
> > > --- a/drivers/virtio/virtio.c
> > > +++ b/drivers/virtio/virtio.c
> > > @@ -357,6 +357,12 @@ int register_virtio_device(struct virtio_device *dev)
> > >  }
> > >  EXPORT_SYMBOL_GPL(register_virtio_device);
> > >
> > > +bool is_virtio_device(struct device *dev)
> > > +{
> > > +     return dev->bus == &virtio_bus;
> > > +}
> > > +EXPORT_SYMBOL_GPL(is_virtio_device);
> > > +
> > >  void unregister_virtio_device(struct virtio_device *dev)
> > >  {
> > >       int index = dev->index; /* save for after device release */
> > > diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_buf.c
> > > new file mode 100644
> > > index 000000000000..23e3399b11ed
> > > --- /dev/null
> > > +++ b/drivers/virtio/virtio_dma_buf.c
> > > @@ -0,0 +1,89 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * dma-bufs for virtio exported objects
> > > + *
> > > + * Copyright (C) 2020 Google, Inc.
> > > + */
> > > +
> > > +#include <linux/virtio_dma_buf.h>
> > > +
> > > +/**
> > > + * virtio_dma_buf_export - Creates a new dma-buf for a virtio exported object
> > > + *
> > > + * This wraps dma_buf_export() to allow virtio drivers to create a dma-buf
> > > + * for an virtio exported object that can be queried by other virtio drivers
> > > + * for the object's UUID.
> > > + */
> > > +struct dma_buf *virtio_dma_buf_export(
> > > +             const struct virtio_dma_buf_export_info *virtio_exp_info)
> > > +{
> > > +     struct dma_buf_export_info exp_info;
> > > +
> > > +     if (!virtio_exp_info->ops
> > > +             || virtio_exp_info->ops->ops.attach != &virtio_dma_buf_attach
> > > +             || !virtio_exp_info->ops->get_uuid) {
> > > +             return ERR_PTR(-EINVAL);
> > > +     }
> > > +
> > > +     exp_info.exp_name = virtio_exp_info->exp_name;
> > > +     exp_info.owner = virtio_exp_info->owner;
> > > +     exp_info.ops = &virtio_exp_info->ops->ops;
> > > +     exp_info.size = virtio_exp_info->size;
> > > +     exp_info.flags = virtio_exp_info->flags;
> > > +     exp_info.resv = virtio_exp_info->resv;
> > > +     exp_info.priv = virtio_exp_info->priv;
> > > +     BUILD_BUG_ON(sizeof(struct virtio_dma_buf_export_info)
> > > +                  != sizeof(struct dma_buf_export_info));
> >
> > This is the only part that gives me pause. Why do we need this hack?
> > What's wrong with just using dma_buf_export_info directly,
> > and if you want the virtio ops, just using container_off?
> 
> This approach provides a more explicit type signature and a little
> more type safety, I think. If others don't think it's a worthwhile
> tradeoff, I can remove it.
> 
> -David

The cost is that if dma_buf_export_info changes even slightly, we get
weird crashes.

-- 
MST

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
