Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D971164630
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 14:57:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D596EBF5;
	Wed, 19 Feb 2020 13:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8EE6EBF6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 13:57:51 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id g64so151291otb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 05:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OsgMdFWPqBnGpfwurIlyWZL5zKJqwXYQTj7t+pQpCY0=;
 b=HNq6EtHs9FIdVnon3TSksdXygtuTTMSI7i4W4sFd/Gsbh7SFjzBgiL3rGmuf6yHF+S
 G3R3CTaigOt0ib2r1AXDPGHyrnjbqj7N13sZAplLyJhxGKcS7j5mhYOAya+U04d0q9uY
 Up9Nk8iprsb5DYMIL5ZEDcYh16nj3i/A/DMUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OsgMdFWPqBnGpfwurIlyWZL5zKJqwXYQTj7t+pQpCY0=;
 b=L318XxHbWKZs4TAnsJ6JO61zo+fN/o0WTNk04DMHurgW5Zve/yJFUNsjqxNkLe6Gil
 h/HyaIrk19kJe51DeXxciYUMfOZWlsrVv5G8FVPP6eBS1eORHiBwA7Gh9RwX/W3TIPCo
 X0NCtboXw8KRXTxZVjf5LdFCwNKuKT6haXnCiGD1ZT/6hHLDOnden926Czw/U+Jm97lQ
 mIPfq2H7ESTqzlbuWVPPKgOm67X8rov4HyYlCrAVdkdXRSlUNfki2Ookkna+JeaMH7h0
 PwBl6G15ouKi9ibOdLhkO/rDr2iW7RZc9Daffr3N2JofE7P8byb+vqAdnVfoxBHtcjbd
 DFXA==
X-Gm-Message-State: APjAAAW2qsMzeL9uDenJURm9Hm+IUBfur6Z4snDBg4/VUdSTmvofPgKl
 VI1vbumTHQYdb1cTs0ZYQw3vgmqjFTvmOdqEqxQ4bw==
X-Google-Smtp-Source: APXvYqwvlqBwcqQrJzQuqT9z1Wc6QVlnoNMX9WYf7xEGU54qQRtUPnh2GaiEgbbm4ELiLDoR/G3MOQHaDLKz4djgLG8=
X-Received: by 2002:a9d:7f11:: with SMTP id j17mr20935155otq.281.1582120670413; 
 Wed, 19 Feb 2020 05:57:50 -0800 (PST)
MIME-Version: 1.0
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-4-daniel.vetter@ffwll.ch>
 <20200219132847.GD5070@pendragon.ideasonboard.com>
In-Reply-To: <20200219132847.GD5070@pendragon.ideasonboard.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 19 Feb 2020 14:57:39 +0100
Message-ID: <CAKMK7uGdFUk_Ga4GS6QPd=iuTPKWZrXXtkWRVJcCHa1WoOk2Yg@mail.gmail.com>
Subject: Re: [PATCH 03/52] drm: add managed resources tied to drm_device
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 19, 2020 at 2:29 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Daniel,
>
> Thank you for the patch.
>
> On Wed, Feb 19, 2020 at 11:20:33AM +0100, Daniel Vetter wrote:
> > We have lots of these. And the cleanup code tends to be of dubious
> > quality. The biggest wrong pattern is that developers use devm_, which
> > ties the release action to the underlying struct device, whereas
> > all the userspace visible stuff attached to a drm_device can long
> > outlive that one (e.g. after a hotunplug while userspace has open
> > files and mmap'ed buffers). Give people what they want, but with more
> > correctness.
> >
> > Mostly copied from devres.c, with types adjusted to fit drm_device and
> > a few simplifications - I didn't (yet) copy over everything. Since
> > the types don't match code sharing looked like a hopeless endeavour.
> >
> > For now it's only super simplified, no groups, you can't remove
> > actions (but kfree exists, we'll need that soon). Plus all specific to
> > drm_device ofc, including the logging. Which I didn't bother to make
> > compile-time optional, since none of the other drm logging is compile
> > time optional either.
> >
> > One tricky bit here is the chicken&egg between allocating your
> > drm_device structure and initiliazing it with drm_dev_init. For
> > perfect onion unwinding we'd need to have the action to kfree the
> > allocation registered before drm_dev_init registers any of its own
> > release handlers. But drm_dev_init doesn't know where exactly the
> > drm_device is emebedded into the overall structure, and by the time it
> > returns it'll all be too late. And forcing drivers to be able clean up
> > everything except the one kzalloc is silly.
> >
> > Work around this by having a very special final_kfree pointer. This
> > also avoids troubles with the list head possibly disappearing from
> > underneath us when we release all resources attached to the
> > drm_device.
>
> This is all a very good idea ! Many subsystems are plagged by drivers
> using devm_k*alloc to allocate data accessible by userspace. Since the
> introduction of devm_*, we've likely reduced the number of memory leaks,
> but I'm pretty sure we've increased the risk of crashes as I've seen
> some drivers that used .release() callbacks correctly being naively
> converted to incorrect devm_* usage :-(
>
> This leads me to a question: if other subsystems have the same problem,
> could we turn this implementation into something more generic ? It
> doesn't have to be done right away and shouldn't block merging this
> series, but I think it would be very useful.

That's why I'm cc'ing devres maintainers (Greg&Rafael for driver core)
on this. I do think we should make this distinct from devm, with
distinct types, so that the compiler can help us catch bugs, and it's
easier to spot mistakes in review (in cases where both variants
exists, e.g. devm_kzalloc and drmm_kzalloc). Disjoint examples would
be devm_ioremap (iounmap only on the final drm_dev_put is a bug) or
drmm_connector_init (release the drm_connector already at device
driver unbind with devres is a bug).

> > v2: Do all the kerneldoc at the end, to avoid lots of fairly pointless
> > shuffling while getting everything into shape.
> >
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  Documentation/gpu/drm-internals.rst |   6 +
> >  drivers/gpu/drm/Makefile            |   3 +-
> >  drivers/gpu/drm/drm_drv.c           |  13 ++-
> >  drivers/gpu/drm/drm_internal.h      |   3 +
> >  drivers/gpu/drm/drm_managed.c       | 173 ++++++++++++++++++++++++++++
> >  include/drm/drm_device.h            |  12 ++
> >  include/drm/drm_managed.h           |  25 ++++
> >  include/drm/drm_print.h             |   6 +
> >  8 files changed, 239 insertions(+), 2 deletions(-)
> >  create mode 100644 drivers/gpu/drm/drm_managed.c
> >  create mode 100644 include/drm/drm_managed.h
> >
> > diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
> > index a73320576ca9..a6b6145fda78 100644
> > --- a/Documentation/gpu/drm-internals.rst
> > +++ b/Documentation/gpu/drm-internals.rst
> > @@ -132,6 +132,12 @@ be unmapped; on many devices, the ROM address decoder is shared with
> >  other BARs, so leaving it mapped could cause undesired behaviour like
> >  hangs or memory corruption.
> >
> > +Managed Resources
> > +-----------------
> > +
> > +.. kernel-doc:: drivers/gpu/drm/drm_managed.c
> > +   :doc: managed resources
> > +
> >  Bus-specific Device Registration and PCI Support
> >  ------------------------------------------------
> >
> > diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> > index ca0ca775d37f..53d8fa170143 100644
> > --- a/drivers/gpu/drm/Makefile
> > +++ b/drivers/gpu/drm/Makefile
> > @@ -17,7 +17,8 @@ drm-y       :=      drm_auth.o drm_cache.o \
> >               drm_plane.o drm_color_mgmt.o drm_print.o \
> >               drm_dumb_buffers.o drm_mode_config.o drm_vblank.o \
> >               drm_syncobj.o drm_lease.o drm_writeback.o drm_client.o \
> > -             drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o
> > +             drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o \
> > +             drm_managed.o
> >
> >  drm-$(CONFIG_DRM_LEGACY) += drm_legacy_misc.o drm_bufs.o drm_context.o drm_dma.o drm_scatter.o drm_lock.o
> >  drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index 9fcd6ab3c154..3e5627d6eba6 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -629,6 +629,9 @@ int drm_dev_init(struct drm_device *dev,
> >       dev->dev = get_device(parent);
> >       dev->driver = driver;
> >
> > +     INIT_LIST_HEAD(&dev->managed.resources);
> > +     spin_lock_init(&dev->managed.lock);
> > +
> >       /* no per-device feature limits by default */
> >       dev->driver_features = ~0u;
> >
> > @@ -828,8 +831,16 @@ static void drm_dev_release(struct kref *ref)
> >               dev->driver->release(dev);
> >       } else {
> >               drm_dev_fini(dev);
> > -             kfree(dev);
> > +             if (!dev->managed.final_kfree) {
> > +                     WARN_ON(!list_empty(&dev->managed.resources));
> > +                     kfree(dev);
> > +             }
> >       }
> > +
> > +     drm_managed_release(dev);
> > +
> > +     if (dev->managed.final_kfree)
> > +             kfree(dev->managed.final_kfree);
>
> Should we do this even if the driver implements .release() ? The
> callback may free dev.

There's going to be a WARN_ON(!dev->managed.final_kfree) a bit later
in the series, once all drivers are converted over. And a bunch of the
above code disappears again.

So I think it'll be all fine at the end.

> >  }
> >
> >  /**
> > diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> > index aeec2e68d772..8c2628dfc6c7 100644
> > --- a/drivers/gpu/drm/drm_internal.h
> > +++ b/drivers/gpu/drm/drm_internal.h
> > @@ -89,6 +89,9 @@ void drm_prime_remove_buf_handle_locked(struct drm_prime_file_private *prime_fpr
> >  struct drm_minor *drm_minor_acquire(unsigned int minor_id);
> >  void drm_minor_release(struct drm_minor *minor);
> >
> > +/* drm_managed.c */
> > +void drm_managed_release(struct drm_device *dev);
> > +
> >  /* drm_vblank.c */
> >  void drm_vblank_disable_and_save(struct drm_device *dev, unsigned int pipe);
> >  void drm_vblank_cleanup(struct drm_device *dev);
> > diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
> > new file mode 100644
> > index 000000000000..ee7c7253af61
> > --- /dev/null
> > +++ b/drivers/gpu/drm/drm_managed.c
> > @@ -0,0 +1,173 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2020 Intel
> > + *
> > + * Based on drivers/base/devres.c
> > + */
> > +
> > +#include <drm/drm_managed.h>
> > +
> > +#include <linux/list.h>
> > +#include <linux/slab.h>
> > +#include <linux/spinlock.h>
> > +
> > +#include <drm/drm_device.h>
> > +#include <drm/drm_print.h>
> > +
> > +/**
> > + * DOC: managed resources
> > + *
> > + * Inspired by sturct &device managed resources, but tied to the lifetime of
>
> s/sturct/struct/

Yeah misplaced fixup, it's somewhere else in the series, already
shuffled in my local branch.

> > + * struct &drm_device, which can outlive the underlying physical device, usually
> > + * when userspace has some open files and other handles to resources still open.
> > + */
> > +struct drmres_node {
> > +     struct list_head                entry;
> > +     drmres_release_t                release;
> > +     const char                      *name;
> > +     size_t                          size;
> > +};
> > +
> > +struct drmres {
> > +     struct drmres_node              node;
> > +     /*
> > +      * Some archs want to perform DMA into kmalloc caches
> > +      * and need a guaranteed alignment larger than
> > +      * the alignment of a 64-bit integer.
> > +      * Thus we use ARCH_KMALLOC_MINALIGN here and get exactly the same
> > +      * buffer alignment as if it was allocated by plain kmalloc().
> > +      */
>
> Do we want to make this API usable for DMA ?

Dunno. Maybe. Was easier to just copy it over instead of thinking
about whether breaking this is useful or not - not doing this might
also break cacheline alignment and stuff like that, which drivers
legit can optimize for allocations bound to drm_device lifetime.

> > +     u8 __aligned(ARCH_KMALLOC_MINALIGN) data[];
> > +};
> > +
> > +void drm_managed_release(struct drm_device *dev)
> > +{
> > +
>
> Extra blank line.

Will fix.

> > +     struct drmres *dr, *tmp;
>
> I'm sure a better name than tmp can be found. res, resource or node ?

It's the temporary list cursor the _safe() variants need, I just call
them tmp since you should never access them outside of that macro.
Otherwise I'm all for more meaningful names, but here this might tempt
people to do something stupid.

> > +
> > +     drm_dbg_drmres(dev, "drmres release begin\n");
> > +     list_for_each_entry_safe(dr, tmp, &dev->managed.resources, node.entry) {
> > +             drm_dbg_drmres(dev, "REL %p %s (%lu bytes)\n",
> > +                            dr, dr->node.name, (unsigned long) dr->node.size);
>
> No need to cast to unsigned long, you can replace %lu with %zu instead.

Fixed.

> > +
> > +             if (dr->node.release)
> > +                     dr->node.release(dev, dr->node.size ? dr->data : NULL);
>
> Shouldn't this be
>
>                         dr->node.release(dev, dr->node.size ? *(void **)&dr->data : NULL);
>
> ?

Hm. Nothing oopsed in my testing, so now I'm confused. Your & is
definitely wrong, we don't want to pass the address of the data
pointer, but the actual data (which in turn is of type (void*). But I
have no idea why the lack of * didn't result in a fireworks show,
because some of the callbacks I'm using make use of the void*
parameter.

> > +
> > +             list_del(&dr->node.entry);
> > +             kfree(dr);
> > +     }
> > +     drm_dbg_drmres(dev, "drmres release end\n");
> > +}
> > +
> > +static __always_inline struct drmres * alloc_dr(drmres_release_t release,
> > +                                             size_t size, gfp_t gfp, int nid)
>
> Why always inline ?

Because kmalloc_track_caller.

> Let's give the function a better name, even if it's internal. alloc_dr
> sounds like it could conflict, and it's also not very clear in a
> backtrace that it's DRM-specific. drmm_alloc_resource ?

Copypasta from devres.c, but I can change this if consensus points to
longer names.

> > +{
> > +     size_t tot_size;
> > +     struct drmres *dr;
> > +
> > +     /* We must catch any near-SIZE_MAX cases that could overflow. */
> > +     if (unlikely(check_add_overflow(sizeof(*dr), size, &tot_size)))
> > +             return NULL;
> > +
> > +     dr = kmalloc_node_track_caller(tot_size, gfp, nid);
> > +     if (unlikely(!dr))
> > +             return NULL;
> > +
> > +     memset(dr, 0, offsetof(struct drmres, data));
> > +
> > +     INIT_LIST_HEAD(&dr->node.entry);
> > +     dr->node.release = release;
> > +     dr->node.size = size;
> > +
> > +     return dr;
> > +}
> > +
> > +void del_dr(struct drm_device *dev, struct drmres *dr)
>
> And drmm_del_resource ?
>
> > +{
> > +     list_del_init(&dr->node.entry);
> > +
> > +     drm_dbg_drmres(dev, "DEL %p %s (%lu bytes)\n",
> > +                    dr, dr->node.name, (unsigned long) dr->node.size);
> > +}
> > +
> > +void add_dr(struct drm_device *dev, struct drmres *dr)
>
> And drmm_add_resource ?
>
> > +{
> > +     unsigned long flags;
> > +
> > +     spin_lock_irqsave(&dev->managed.lock, flags);
> > +     list_add(&dr->node.entry, &dev->managed.resources);
> > +     spin_unlock_irqrestore(&dev->managed.lock, flags);
> > +
> > +     drm_dbg_drmres(dev, "ADD %p %s (%lu bytes)\n",
> > +                    dr, dr->node.name, (unsigned long) dr->node.size);
> > +}
> > +
> > +void drmm_add_final_kfree(struct drm_device *dev, void *parent)
> > +{
> > +     WARN_ON(dev->managed.final_kfree);
> > +     dev->managed.final_kfree = parent;
> > +}
> > +EXPORT_SYMBOL(drmm_add_final_kfree);
>
> As you mentioned this is quite a bit of a hack, but I think we can live
> with it for now.
>
> > +
> > +int __drmm_add_action(struct drm_device *dev,
> > +                   drmres_release_t action,
> > +                   void *data, const char *name)
> > +{
> > +     struct drmres *dr;
> > +     void **void_ptr;
> > +
> > +     dr = alloc_dr(action, data ? sizeof(void*) : 0,
> > +                   GFP_KERNEL | __GFP_ZERO,
> > +                   dev_to_node(dev->dev));
> > +     if (!dr)
> > +             return -ENOMEM;
> > +     dr->node.name = name;
> > +     void_ptr = (void **) dr->data;
>
> I'd write (void **)&dr->data; to make it clear that you're taking the
> address of the data array. Arrays decay to pointers in C, so it's
> equivalent, but with & I had to realize data was an array before
> figuring out what the code was doing.

We're not doing that. We're treating ->data as a void* pointer, but
the data itself is a void*. So I very much don't want to take the
address of that thing. Or I'm totally confused about what's going on
here.

> > +     *void_ptr = data;
>
> I may be mistaken, but if data == NULL, you pass 0 as the size to
> alloc_dr, and dr will have an empty data array. Aren't you then
> overflowing your allocation ?

Huh indeed, how did this work. Needs to be protected with an if
(data). I think I need a few unit tests for v2.

> > +
> > +     add_dr(dev, dr);
> > +
> > +     return 0;
> > +
> > +}
> > +EXPORT_SYMBOL(__drmm_add_action);
> > +
> > +void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp)
> > +{
> > +     struct drmres *dr;
> > +
> > +     dr = alloc_dr(NULL, size, gfp, dev_to_node(dev->dev));
> > +     if (!dr)
> > +             return NULL;
> > +     dr->node.name = "kmalloc";
> > +
> > +     add_dr(dev, dr);
> > +
> > +     return dr->data;
> > +}
> > +EXPORT_SYMBOL(drmm_kmalloc);
> > +
> > +void drmm_kfree(struct drm_device *dev, void *data)
> > +{
> > +     struct drmres *dr = NULL, *tmp;
>
> res, resource or node here too ?

Hm yeah, here it's not the tmp list cursor for the _safe version. I
was once when I started typing. Will rename.

> > +     unsigned long flags;
> > +
> > +     if (!data)
> > +             return;
> > +
> > +     spin_lock_irqsave(&dev->managed.lock, flags);
> > +     list_for_each_entry(tmp, &dev->managed.resources, node.entry) {
> > +             if (tmp->data == data) {
> > +                     dr = tmp;
> > +                     del_dr(dev, dr);
> > +                     break;
> > +             }
> > +     }
> > +     spin_unlock_irqrestore(&dev->managed.lock, flags);
> > +
> > +     if (WARN_ON(!dr))
> > +             return;
> > +
> > +     kfree(dr);
> > +}
> > +EXPORT_SYMBOL(drmm_kfree);
> > diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> > index bb60a949f416..2790c9ed614e 100644
> > --- a/include/drm/drm_device.h
> > +++ b/include/drm/drm_device.h
> > @@ -67,6 +67,18 @@ struct drm_device {
> >       /** @dev: Device structure of bus-device */
> >       struct device *dev;
> >
> > +     /**
> > +      * @managed:
> > +      *
> > +      * Managed resources linked to the lifetime of this &drm_device as
> > +      * tracked by @ref.
> > +      */
> > +     struct {
> > +             struct list_head resources;
> > +             void *final_kfree;
> > +             spinlock_t lock;
>
> Would it be a good time to #include <linux/spinlock.h> at the top ?

Dunno, seems to compile :-) My approach to #includes is to just add
more until the compiler is happy.

> > +     } managed;
> > +
> >       /** @driver: DRM driver managing the device */
> >       struct drm_driver *driver;
> >
> > diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> > new file mode 100644
> > index 000000000000..75f2c8932c69
> > --- /dev/null
> > +++ b/include/drm/drm_managed.h
> > @@ -0,0 +1,25 @@
> > +// SPDX-License-Identifier: GPL-2.0
>
> No header guard ?

Hm yeah, will add.

> > +
> > +#include <linux/types.h>
> > +#include <linux/gfp.h>
>
> Alphabetically sorted ?

Will do.

Thanks a lot for your detailed review.
-Daniel

> > +
> > +struct drm_device;
> > +
> > +typedef void (*drmres_release_t)(struct drm_device *dev, void *res);
> > +
> > +#define drmm_add_action(dev, action, data) \
> > +     __drmm_add_action(dev, action, data, #action)
> > +
> > +int __must_check __drmm_add_action(struct drm_device *dev,
> > +                                drmres_release_t action,
> > +                                void *data, const char *name);
> > +
> > +void drmm_add_final_kfree(struct drm_device *dev, void *parent);
> > +
> > +void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp) __malloc;
> > +static inline void *drmm_kzalloc(struct drm_device *dev, size_t size, gfp_t gfp)
> > +{
> > +     return drmm_kmalloc(dev, size, gfp | __GFP_ZERO);
> > +}
> > +
> > +void drmm_kfree(struct drm_device *dev, void *data);
> > diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> > index ca7cee8e728a..1c9417430d08 100644
> > --- a/include/drm/drm_print.h
> > +++ b/include/drm/drm_print.h
> > @@ -313,6 +313,10 @@ enum drm_debug_category {
> >        * @DRM_UT_DP: Used in the DP code.
> >        */
> >       DRM_UT_DP               = 0x100,
> > +     /**
> > +      * @DRM_UT_DRMRES: Used in the drm managed resources code.
> > +      */
> > +     DRM_UT_DRMRES           = 0x200,
> >  };
> >
> >  static inline bool drm_debug_enabled(enum drm_debug_category category)
> > @@ -442,6 +446,8 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
> >       drm_dev_dbg((drm)->dev, DRM_UT_LEASE, fmt, ##__VA_ARGS__)
> >  #define drm_dbg_dp(drm, fmt, ...)                                    \
> >       drm_dev_dbg((drm)->dev, DRM_UT_DP, fmt, ##__VA_ARGS__)
> > +#define drm_dbg_drmres(drm, fmt, ...)                                        \
> > +     drm_dev_dbg((drm)->dev, DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
> >
> >
> >  /*
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
