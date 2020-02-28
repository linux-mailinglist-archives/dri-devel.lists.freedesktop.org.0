Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 087B417425E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 23:45:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E83A6F519;
	Fri, 28 Feb 2020 22:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3846F516;
 Fri, 28 Feb 2020 22:45:10 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id EA8068052E;
 Fri, 28 Feb 2020 23:45:05 +0100 (CET)
Date: Fri, 28 Feb 2020 23:45:04 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 03/51] drm: add managed resources tied to drm_device
Message-ID: <20200228224504.GA23961@ravnborg.org>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
 <20200227181522.2711142-4-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227181522.2711142-4-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8
 a=IpJZQVW2AAAA:8 a=ag1SF4gXAAAA:8 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=NQJKRLj2viqlFQ6QbXAA:9 a=9dUVNg1dW5mNVaS6:21 a=SfnkcjMnE6hZ8Dl_:21
 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22 a=IawgGOuG5U0WyFbmm1f5:22
 a=Yupwre4RP9_Eg_Bd0iYG:22 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 m.felsch@pengutronix.de, DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel.

Some nitpicks / bikeshedding below.

	Sam

On Thu, Feb 27, 2020 at 07:14:34PM +0100, Daniel Vetter wrote:
> We have lots of these. And the cleanup code tends to be of dubious
> quality. The biggest wrong pattern is that developers use devm_, which
> ties the release action to the underlying struct device, whereas
> all the userspace visible stuff attached to a drm_device can long
> outlive that one (e.g. after a hotunplug while userspace has open
> files and mmap'ed buffers). Give people what they want, but with more
> correctness.
> 
> Mostly copied from devres.c, with types adjusted to fit drm_device and
> a few simplifications - I didn't (yet) copy over everything. Since
> the types don't match code sharing looked like a hopeless endeavour.

Readability had been increased if the short names was not reused.

s/dr_/drmres_/

But I know, this is in the bikeshedding area.

> 
> For now it's only super simplified, no groups, you can't remove
> actions (but kfree exists, we'll need that soon). Plus all specific to
> drm_device ofc, including the logging. Which I didn't bother to make
> compile-time optional, since none of the other drm logging is compile
> time optional either.
> 
> One tricky bit here is the chicken&egg between allocating your
> drm_device structure and initiliazing it with drm_dev_init. For
> perfect onion unwinding we'd need to have the action to kfree the
> allocation registered before drm_dev_init registers any of its own
> release handlers. But drm_dev_init doesn't know where exactly the
> drm_device is emebedded into the overall structure, and by the time it
> returns it'll all be too late. And forcing drivers to be able clean up
> everything except the one kzalloc is silly.
> 
> Work around this by having a very special final_kfree pointer. This
> also avoids troubles with the list head possibly disappearing from
> underneath us when we release all resources attached to the
> drm_device.
> 
> v2: Do all the kerneldoc at the end, to avoid lots of fairly pointless
> shuffling while getting everything into shape.
> 
> v3: Add static to add/del_dr (Neil)
> Move typo fix to the right patch (Neil)
> 
> v4: Enforce contract for drmm_add_final_kfree:
> 
> Use ksize() to check that the drm_device is indeed contained somewhere
> in the final kfree(). Because we need that or the entire managed
> release logic blows up in a pile of use-after-frees. Motivated by a
> discussion with Laurent.
> 
> v5: Review from Laurent:
> - %zu instead of casting size_t
> - header guards
> - sorting of includes
> - guarding of data assignment if we didn't allocate it for a NULL
>   pointer
> - delete spurious newline
> - cast void* data parameter correctly in ->release call, no idea how
>   this even worked before
> 
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  Documentation/gpu/drm-internals.rst |   6 +
>  drivers/gpu/drm/Makefile            |   3 +-
>  drivers/gpu/drm/drm_drv.c           |  13 ++-
>  drivers/gpu/drm/drm_internal.h      |   3 +
>  drivers/gpu/drm/drm_managed.c       | 175 ++++++++++++++++++++++++++++
>  include/drm/drm_device.h            |  12 ++
>  include/drm/drm_managed.h           |  30 +++++
>  include/drm/drm_print.h             |   6 +
>  8 files changed, 246 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_managed.c
>  create mode 100644 include/drm/drm_managed.h
> 
> diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
> index a73320576ca9..a6b6145fda78 100644
> --- a/Documentation/gpu/drm-internals.rst
> +++ b/Documentation/gpu/drm-internals.rst
> @@ -132,6 +132,12 @@ be unmapped; on many devices, the ROM address decoder is shared with
>  other BARs, so leaving it mapped could cause undesired behaviour like
>  hangs or memory corruption.
>  
> +Managed Resources
> +-----------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_managed.c
> +   :doc: managed resources
> +
>  Bus-specific Device Registration and PCI Support
>  ------------------------------------------------
>  
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 7f72ef5e7811..183c60048307 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -17,7 +17,8 @@ drm-y       :=	drm_auth.o drm_cache.o \
>  		drm_plane.o drm_color_mgmt.o drm_print.o \
>  		drm_dumb_buffers.o drm_mode_config.o drm_vblank.o \
>  		drm_syncobj.o drm_lease.o drm_writeback.o drm_client.o \
> -		drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o
> +		drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o \
> +		drm_managed.o
>  
>  drm-$(CONFIG_DRM_LEGACY) += drm_legacy_misc.o drm_bufs.o drm_context.o drm_dma.o drm_scatter.o drm_lock.o
>  drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 9fcd6ab3c154..3e5627d6eba6 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -629,6 +629,9 @@ int drm_dev_init(struct drm_device *dev,
>  	dev->dev = get_device(parent);
>  	dev->driver = driver;
>  
> +	INIT_LIST_HEAD(&dev->managed.resources);
> +	spin_lock_init(&dev->managed.lock);
> +
>  	/* no per-device feature limits by default */
>  	dev->driver_features = ~0u;
>  
> @@ -828,8 +831,16 @@ static void drm_dev_release(struct kref *ref)
>  		dev->driver->release(dev);
>  	} else {
>  		drm_dev_fini(dev);
> -		kfree(dev);
> +		if (!dev->managed.final_kfree) {
> +			WARN_ON(!list_empty(&dev->managed.resources));
> +			kfree(dev);
> +		}

This looks sub-optimal.
We cannot be sure a driver have used drmm_add_final_kfree() if it makes
use of drmm_.
So we may not WARN in all relavant cases.
Also, we cannot expect all drivers that uses devmm_ to have managed
to get rid of their ->release call-back.
So the right thing looks to me like we should move it out to be
unconditional. Se we will WARN_ON(!list_empty(&dev->managed.resources))
always.

It also looks like we do a kfree(dev); (inside {} )
And then we access kfree() in the call to drm_managed_relase(dev) right
after.


>  	}
> +
> +	drm_managed_release(dev);
> +
> +	if (dev->managed.final_kfree)
> +		kfree(dev->managed.final_kfree);
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index aeec2e68d772..8c2628dfc6c7 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -89,6 +89,9 @@ void drm_prime_remove_buf_handle_locked(struct drm_prime_file_private *prime_fpr
>  struct drm_minor *drm_minor_acquire(unsigned int minor_id);
>  void drm_minor_release(struct drm_minor *minor);
>  
> +/* drm_managed.c */
> +void drm_managed_release(struct drm_device *dev);
> +
>  /* drm_vblank.c */
>  void drm_vblank_disable_and_save(struct drm_device *dev, unsigned int pipe);
>  void drm_vblank_cleanup(struct drm_device *dev);
> diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
> new file mode 100644
> index 000000000000..a36d4604ee18
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_managed.c
> @@ -0,0 +1,175 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 Intel
> + *
> + * Based on drivers/base/devres.c
> + */
> +
> +#include <drm/drm_managed.h>
> +
> +#include <linux/list.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +
> +#include <drm/drm_device.h>
> +#include <drm/drm_print.h>

It is good practice to group the include files.
And drm/ comes after linux/

> +
> +/**
> + * DOC: managed resources
> + *
> + * Inspired by struct &device managed resources, but tied to the lifetime of
> + * struct &drm_device, which can outlive the underlying physical device, usually
> + * when userspace has some open files and other handles to resources still open.
> + */
> +struct drmres_node {
> +	struct list_head		entry;
> +	drmres_release_t		release;
> +	const char			*name;
> +	size_t				size;
> +};
Excessing indent? (I know, copied from somewhere else, but...)

> +
> +struct drmres {
> +	struct drmres_node		node;
> +	/*
> +	 * Some archs want to perform DMA into kmalloc caches
> +	 * and need a guaranteed alignment larger than
> +	 * the alignment of a 64-bit integer.
> +	 * Thus we use ARCH_KMALLOC_MINALIGN here and get exactly the same
> +	 * buffer alignment as if it was allocated by plain kmalloc().
> +	 */
> +	u8 __aligned(ARCH_KMALLOC_MINALIGN) data[];
> +};
> +
> +void drm_managed_release(struct drm_device *dev)
> +{
> +	struct drmres *dr, *tmp;
> +
> +	drm_dbg_drmres(dev, "drmres release begin\n");
> +	list_for_each_entry_safe(dr, tmp, &dev->managed.resources, node.entry) {
> +		drm_dbg_drmres(dev, "REL %p %s (%zu bytes)\n",
> +			       dr, dr->node.name, dr->node.size);
> +
> +		if (dr->node.release)
> +			dr->node.release(dev, dr->node.size ? *(void **)&dr->data : NULL);
> +
> +		list_del(&dr->node.entry);
> +		kfree(dr);
> +	}
> +	drm_dbg_drmres(dev, "drmres release end\n");
> +}
> +
> +static __always_inline struct drmres * alloc_dr(drmres_release_t release,
> +						size_t size, gfp_t gfp, int nid)
Why do we force the compiler to inline this?
Seems a little agressive.

All the two users so far uses dev_to_node(dev->dev) for the nid.
Maybe let this function take a drm_device * and thus move the
calculation to this function?

> +{
> +	size_t tot_size;
> +	struct drmres *dr;
> +
> +	/* We must catch any near-SIZE_MAX cases that could overflow. */
> +	if (unlikely(check_add_overflow(sizeof(*dr), size, &tot_size)))
> +		return NULL;
> +
> +	dr = kmalloc_node_track_caller(tot_size, gfp, nid);
> +	if (unlikely(!dr))
> +		return NULL;
> +
> +	memset(dr, 0, offsetof(struct drmres, data));
> +
> +	INIT_LIST_HEAD(&dr->node.entry);
> +	dr->node.release = release;
> +	dr->node.size = size;
> +
> +	return dr;
> +}
> +
> +static void del_dr(struct drm_device *dev, struct drmres *dr)
> +{
> +	list_del_init(&dr->node.entry);
> +
> +	drm_dbg_drmres(dev, "DEL %p %s (%lu bytes)\n",
> +		       dr, dr->node.name, (unsigned long) dr->node.size);
> +}
> +
> +static void add_dr(struct drm_device *dev, struct drmres *dr)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&dev->managed.lock, flags);
> +	list_add(&dr->node.entry, &dev->managed.resources);
> +	spin_unlock_irqrestore(&dev->managed.lock, flags);
> +
> +	drm_dbg_drmres(dev, "ADD %p %s (%lu bytes)\n",
> +		       dr, dr->node.name, (unsigned long) dr->node.size);
> +}
> +
> +void drmm_add_final_kfree(struct drm_device *dev, void *parent)
> +{
> +	WARN_ON(dev->managed.final_kfree);
> +	WARN_ON(dev < (struct drm_device *) parent);
> +	WARN_ON(dev + 1 >= (struct drm_device *) (parent + ksize(parent)));
> +	dev->managed.final_kfree = parent;
> +}
> +EXPORT_SYMBOL(drmm_add_final_kfree);
> +
> +int __drmm_add_action(struct drm_device *dev,
> +		      drmres_release_t action,
> +		      void *data, const char *name)
> +{
> +	struct drmres *dr;
> +	void **void_ptr;
> +
> +	dr = alloc_dr(action, data ? sizeof(void*) : 0,
Hmm, data is an u8 pointer, not a void pointer.
But this code is copied soo...

> +		      GFP_KERNEL | __GFP_ZERO,
So in this case the memset() in alloc_dr() is of no use.
Anyway, it is zero bytes or a pointer size bytes.
So no big deal I think.

> +		      dev_to_node(dev->dev));
> +	if (!dr)
> +		return -ENOMEM;
Add empty line.
> +	dr->node.name = name;
> +	if (data) {
> +		void_ptr = (void **)&dr->data;
> +		*void_ptr = data;
> +	}
> +
> +	add_dr(dev, dr);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(__drmm_add_action);
See rant about __ named functions in another mail.
drmm_add_action_named(..) would be better.


> +
> +void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp)
> +{
> +	struct drmres *dr;
> +
> +	dr = alloc_dr(NULL, size, gfp, dev_to_node(dev->dev));
> +	if (!dr)
> +		return NULL;
> +	dr->node.name = "kmalloc";
> +
> +	add_dr(dev, dr);
> +
> +	return dr->data;
> +}
> +EXPORT_SYMBOL(drmm_kmalloc);
> +
> +void drmm_kfree(struct drm_device *dev, void *data)
> +{
> +	struct drmres *dr_match = NULL, *dr;
> +	unsigned long flags;
> +
> +	if (!data)
> +		return;
> +
> +	spin_lock_irqsave(&dev->managed.lock, flags);
> +	list_for_each_entry(dr, &dev->managed.resources, node.entry) {
> +		if (dr->data == data) {
> +			dr_match = dr;
> +			del_dr(dev, dr_match);
> +			break;
> +		}
> +	}
> +	spin_unlock_irqrestore(&dev->managed.lock, flags);
> +
> +	if (WARN_ON(!dr_match))
> +		return;
> +
> +	kfree(dr_match);
> +}
> +EXPORT_SYMBOL(drmm_kfree);
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index bb60a949f416..2790c9ed614e 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -67,6 +67,18 @@ struct drm_device {
>  	/** @dev: Device structure of bus-device */
>  	struct device *dev;
>  
> +	/**
> +	 * @managed:
> +	 *
> +	 * Managed resources linked to the lifetime of this &drm_device as
> +	 * tracked by @ref.
> +	 */
> +	struct {
> +		struct list_head resources;
> +		void *final_kfree;
> +		spinlock_t lock;
> +	} managed;

I am missing kernel-doc here.
At least document that lock is used to guard access to resources.
(s/lock/lock_resources/ ?)

> +
>  	/** @driver: DRM driver managing the device */
>  	struct drm_driver *driver;
>  
> diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> new file mode 100644
> index 000000000000..7b5df7d09b19
> --- /dev/null
> +++ b/include/drm/drm_managed.h
> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#ifndef _DRM_MANAGED_H_
> +#define _DRM_MANAGED_H_
> +
> +#include <linux/gfp.h>
> +#include <linux/types.h>
> +
> +struct drm_device;
> +
> +typedef void (*drmres_release_t)(struct drm_device *dev, void *res);
> +
> +#define drmm_add_action(dev, action, data) \
> +	__drmm_add_action(dev, action, data, #action)
> +
> +int __must_check __drmm_add_action(struct drm_device *dev,
> +				   drmres_release_t action,
> +				   void *data, const char *name);
> +
> +void drmm_add_final_kfree(struct drm_device *dev, void *parent);
> +
> +void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp) __malloc;
> +static inline void *drmm_kzalloc(struct drm_device *dev, size_t size, gfp_t gfp)
> +{
> +	return drmm_kmalloc(dev, size, gfp | __GFP_ZERO);
> +}
> +
> +void drmm_kfree(struct drm_device *dev, void *data);
> +
> +#endif
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index ca7cee8e728a..1c9417430d08 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -313,6 +313,10 @@ enum drm_debug_category {
>  	 * @DRM_UT_DP: Used in the DP code.
>  	 */
>  	DRM_UT_DP		= 0x100,
> +	/**
> +	 * @DRM_UT_DRMRES: Used in the drm managed resources code.
> +	 */
> +	DRM_UT_DRMRES		= 0x200,
>  };
>  
>  static inline bool drm_debug_enabled(enum drm_debug_category category)
> @@ -442,6 +446,8 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
>  	drm_dev_dbg((drm)->dev, DRM_UT_LEASE, fmt, ##__VA_ARGS__)
>  #define drm_dbg_dp(drm, fmt, ...)					\
>  	drm_dev_dbg((drm)->dev, DRM_UT_DP, fmt, ##__VA_ARGS__)
> +#define drm_dbg_drmres(drm, fmt, ...)					\
> +	drm_dev_dbg((drm)->dev, DRM_UT_DRMRES, fmt, ##__VA_ARGS__)

We use drmm for all the managed stuff.
So drm_dbg_drmm() is for me a more logical name.
This debug printing is used only in a few spots, so no big deal.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
