Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D422E17C660
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 20:38:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB666EBC1;
	Fri,  6 Mar 2020 19:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A98D6EBC1;
 Fri,  6 Mar 2020 19:38:33 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 541F12001E;
 Fri,  6 Mar 2020 20:38:28 +0100 (CET)
Date: Fri, 6 Mar 2020 20:38:27 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm: add managed resources tied to drm_device
Message-ID: <20200306193827.GA13014@ravnborg.org>
References: <20200302222631.3861340-4-daniel.vetter@ffwll.ch>
 <20200303084453.3886320-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200303084453.3886320-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=yPCof4ZbAAAA:8
 a=7gkXJVJtAAAA:8 a=P1BnusSwAAAA:8 a=IpJZQVW2AAAA:8 a=ag1SF4gXAAAA:8
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=-xmwdJeEkhUtC6ilOQwA:9
 a=1ozxCxZ5a6emhI2V:21 a=p4dUTv0QECzEOTPd:21 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=D0XLA9XvdZm18NrgonBM:22
 a=IawgGOuG5U0WyFbmm1f5:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=AjGcO6oz07-iQ99wixmX:22
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel.

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
> v3: Review from Sam
> - Add the kerneldoc for the managed sub-struct back in, even if it
>   doesn't show up in the generated html somehow.
> - Explain why __always_inline.
> - Fix bisectability around the final kfree() in drm_dev_relase(). This
>   is just interim code which will disappear again.
> - Some whitespace polish.
> - Add debug output when drmm_add_action or drmm_kmalloc fail.
> 
> v4: My bisectability fix wasn't up to par as noticed by smatch.
Counting is a difficult, let's restart from v3 :-)

> 
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Looks good now.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  Documentation/gpu/drm-internals.rst |   6 +
>  drivers/gpu/drm/Makefile            |   3 +-
>  drivers/gpu/drm/drm_drv.c           |  12 +-
>  drivers/gpu/drm/drm_internal.h      |   3 +
>  drivers/gpu/drm/drm_managed.c       | 186 ++++++++++++++++++++++++++++
>  include/drm/drm_device.h            |  15 +++
>  include/drm/drm_managed.h           |  30 +++++
>  include/drm/drm_print.h             |   6 +
>  8 files changed, 259 insertions(+), 2 deletions(-)
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
> index 9fcd6ab3c154..d36e3812bedc 100644
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
> @@ -828,8 +831,15 @@ static void drm_dev_release(struct kref *ref)
>  		dev->driver->release(dev);
>  	} else {
>  		drm_dev_fini(dev);
> -		kfree(dev);
>  	}
> +
> +	drm_managed_release(dev);
> +
> +	if (!dev->driver->release && !dev->managed.final_kfree) {
> +		WARN_ON(!list_empty(&dev->managed.resources));
> +		kfree(dev);
> +	} else if (dev->managed.final_kfree)
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
> index 000000000000..57dc79fa90af
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_managed.c
> @@ -0,0 +1,186 @@
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
> +
> +/**
> + * DOC: managed resources
> + *
> + * Inspired by struct &device managed resources, but tied to the lifetime of
> + * struct &drm_device, which can outlive the underlying physical device, usually
> + * when userspace has some open files and other handles to resources still open.
> + */
> +struct drmres_node {
> +	struct list_head	entry;
> +	drmres_release_t	release;
> +	const char		*name;
> +	size_t			size;
> +};
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
> +/*
> + * Always inline so that kmallc_track_caller tracks the actual interesting
> + * caller outside of drm_managed.c.
> + */
> +static __always_inline struct drmres * alloc_dr(drmres_release_t release,
> +						size_t size, gfp_t gfp, int nid)
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
> +		      GFP_KERNEL | __GFP_ZERO,
> +		      dev_to_node(dev->dev));
> +	if (!dr) {
> +		drm_dbg_drmres(dev, "failed to add action %s for %p\n",
> +			       name, data);
> +		return -ENOMEM;
> +	}
> +
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
> +
> +void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp)
> +{
> +	struct drmres *dr;
> +
> +	dr = alloc_dr(NULL, size, gfp, dev_to_node(dev->dev));
> +	if (!dr) {
> +		drm_dbg_drmres(dev, "failed to allocate %zu bytes, %u flags\n",
> +			       size, gfp);
> +		return NULL;
> +	}
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
> index bb60a949f416..d39132b477dd 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -67,6 +67,21 @@ struct drm_device {
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
> +		/** @managed.resources: managed resources list */
> +		struct list_head resources;
> +		/** @managed.final_kfree: pointer for final kfree() call */
> +		void *final_kfree;
> +		/** @managed.lock: protects @managed.resources */
> +		spinlock_t lock;
> +	} managed;
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
>  
>  
>  /*
> -- 
> 2.24.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
