Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F76E1647D8
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 16:08:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE4156EC1E;
	Wed, 19 Feb 2020 15:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A79A6EC1D;
 Wed, 19 Feb 2020 15:08:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD3C552B;
 Wed, 19 Feb 2020 16:08:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582124930;
 bh=o28ugUtgGgCHnpJyas1T5uweG45PlFuCdccSB4zvar4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j8r+eJxjnvrTNC6GPG4x+a16TnvXyjKufomf6QpLWWCICjj9p9qaw1c5fP6hVlwt7
 rPci8vQC3GGEtTxBU+O5d0nzltPtjq8idcz1OjE09DVeYCUMTXFI9yd2ppYRc7w1XC
 b0BQhHcviBYPKHguYQDTtYiccc1EgVW3ZpoXOTTc=
Date: Wed, 19 Feb 2020 17:08:31 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 52/52] drm: Add docs for managed resources
Message-ID: <20200219150831.GQ5070@pendragon.ideasonboard.com>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-53-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219102122.1607365-53-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Thank you for the patch.

On Wed, Feb 19, 2020 at 11:21:22AM +0100, Daniel Vetter wrote:
> All collected together to provide a consistent story in one patch,
> instead of the somewhat bumpy refactor-evolution leading to this.
> 
> Also some thoughts on what the next steps could be:
> 
> - Create a macro called devm_drm_dev_alloc() which essentially wraps
>   the kzalloc(); devm_drm_dev_init(); drmm_add_final_kfree() combo.
>   Needs to be a macro since we'll have to do some typeof trickery and
>   casting to make this fully generic for all drivers that embed struct
>   drm_device into their own thing.

Do you think it would be hard to do this already, in order to avoid
drmm_add_final_kfree() ?

> - A lot of the simple drivers now have essentially just
>   drm_dev_unplug(); drm_atomic_helper_shutdown(); as their
>   $bus_driver->remove hook. We could create a devm_mode_config_reset
>   which sets drm_atomic_helper_shutdown as it's cleanup action, and a
>   devm_drm_dev_register with drm_dev_unplug as it's cleanup action,
>   and simple drivers wouldn't have a need for a ->remove function at
>   all, and we could delete them.
> 
> - For more complicated drivers we need drmm_ versions of a _lot_ more
>   things. All the userspace visible objects (crtc, plane, encoder,
>   crtc), anything else hanging of those (maybe a drmm_get_edid, at
>   least for panels and other built-in stuff).

I think it will get messy if we try to use the managed API for too many
things.

> Also some more thoughts on why we're not reusing devm_ with maybe a
> fake struct device embedded into the drm_device (we can't use the
> kdev, since that's in each drm_minor).
> 
> - Code review gets extremely tricky, since every time you see a devm_
>   you need to carefully check whether the fake device (with the
>   drm_device lifetim) or the real device (with the lifetim of the
>   underlying physical device and driver binding) are used. That's not
>   going to help at all, and we have enormous amounts of drivers who
>   use devm_ where they really shouldn't. Having different types makes
>   sure the compiler type checks this for us and ensures correctness.
> 
> - The set of functions are very much non-overlapping. E.g.
>   devm_ioremap makes total sense, drmm_ioremap has the wrong lifetime,
>   since hw resources need to be cleaned out at driver unbind and wont
>   outlive that like a drm_device. Similar, but other way round for
>   drmm_connector_init (which is the only correct version, devm_ for
>   drm_connector is just buggy). Simply not having the wrong version
>   again prevents bugs.
> 
> Finally I guess this opens a huge todo for all the drivers. I'm
> semi-tempted to do a tree-wide s/devm_kzalloc/drmm_kzalloc/ since most
> likely that'll fix an enormous amount of bugs and most likely not
> cause any issues at all (aside from maybe holding onto memory slightly
> too long).
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  Documentation/gpu/drm-internals.rst |  6 +++
>  drivers/gpu/drm/drm_drv.c           | 18 +++++++--
>  drivers/gpu/drm/drm_managed.c       | 63 ++++++++++++++++++++++++++++-
>  include/drm/drm_drv.h               |  4 ++
>  include/drm/drm_managed.h           | 47 +++++++++++++++++++++
>  5 files changed, 134 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
> index a6b6145fda78..12272b168580 100644
> --- a/Documentation/gpu/drm-internals.rst
> +++ b/Documentation/gpu/drm-internals.rst
> @@ -138,6 +138,12 @@ Managed Resources
>  .. kernel-doc:: drivers/gpu/drm/drm_managed.c
>     :doc: managed resources
>  
> +.. kernel-doc:: drivers/gpu/drm/drm_managed.c
> +   :export:
> +
> +.. kernel-doc:: include/drm/drm_managed.h
> +   :internal:
> +
>  Bus-specific Device Registration and PCI Support
>  ------------------------------------------------
>  
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 428c569aaaf1..b1827ba53924 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -258,9 +258,15 @@ void drm_minor_release(struct drm_minor *minor)
>   * any other resources allocated at device initialization and drop the driver's
>   * reference to &drm_device using drm_dev_put().
>   *
> - * Note that the lifetime rules for &drm_device instance has still a lot of
> - * historical baggage. Hence use the reference counting provided by
> - * drm_dev_get() and drm_dev_put() only carefully.
> + * Note that any allocation or resource which is visible to userspace must be
> + * released only when the final drm_dev_put() is called, and not when the
> + * driver is unbound from the underlying physical struct &device. Best to use
> + * &drm_device managed resources with drmm_add_action(), drmm_kmalloc() and
> + * related functions.
> + *
> + * devres managed resources like devm_kmalloc() can only be used for resources
> + * directly related to the underlying hardware device, and only used in code
> + * paths fully protected by drm_dev_enter() and drm_dev_exit().
>   *
>   * Display driver example
>   * ~~~~~~~~~~~~~~~~~~~~~~
> @@ -604,6 +610,9 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
>   * arbitrary offset, you must supply a &drm_driver.release callback and control
>   * the finalization explicitly.
>   *
> + * Note that drivers must call drmm_add_final_kfree() after this function has
> + * completed successfully.
> + *
>   * RETURNS:
>   * 0 on success, or error code on failure.
>   */
> @@ -705,6 +714,9 @@ static void devm_drm_dev_init_release(void *data)
>   * Managed drm_dev_init(). The DRM device initialized with this function is
>   * automatically put on driver detach using drm_dev_put().
>   *
> + * Note that drivers must call drmm_add_final_kfree() after this function has
> + * completed successfully.
> + *
>   * RETURNS:
>   * 0 on success, or error code on failure.
>   */
> diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
> index fb44fe65c2cd..7fcbe90d3f46 100644
> --- a/drivers/gpu/drm/drm_managed.c
> +++ b/drivers/gpu/drm/drm_managed.c
> @@ -17,10 +17,22 @@
>  /**
>   * DOC: managed resources
>   *
> - * Inspired by sturct &device managed resources, but tied to the lifetime of
> + * Inspired by struct &device managed resources, but tied to the lifetime of
>   * struct &drm_device, which can outlive the underlying physical device, usually
>   * when userspace has some open files and other handles to resources still open.
> + *
> + * Release actions can be added with drmm_add_action(), memory allocations can
> + * be done directly with drmm_kmalloc() and the related functions. Everything
> + * will be released on the final drm_dev_put() in reverse order of how the
> + * release actions have been added and memory has been allocated at driver load
> + * time.

Maybe drop "at driver load time" as it could also happen later ?

> + *
> + * Note that release actions and managed memory can also be added and removed
> + * during the lifetime of the driver, all the functions are fully concurrent
> + * safe. But it is recommended to use managed resources only when they change

s/only when they/only for resources that/ ?

> + * rarely, if ever, during the lifetime of the &drm_device instance.
>   */
> +
>  struct drmres_node {
>  	struct list_head		entry;
>  	drmres_release_t		release;
> @@ -102,6 +114,18 @@ void add_dr(struct drm_device *dev, struct drmres *dr)
>  		       dr, dr->node.name, (unsigned long) dr->node.size);
>  }
>  
> +/**
> + * drmm_add_final_kfree - add release action for the final kfree()
> + * @dev: DRM device
> + * @data: pointer to the kmalloc allocation containing @dev
> + *
> + * Since the allocation containing the struct &drm_device must be allocated
> + * before it can be initialized with drm_dev_init() there's no way to allocate
> + * that memory with drmm_kmalloc(). To side-step this chicken-egg problem the
> + * pointer for this final kfree() must be specified by calling this function. It
> + * will be released in the final drm_dev_put() for @dev, after all other release
> + * actions installed through drmm_add_action() have been processed.
> + */
>  void drmm_add_final_kfree(struct drm_device *dev, void *parent)
>  {
>  	WARN_ON(dev->managed.final_kfree);
> @@ -132,6 +156,14 @@ int __drmm_add_action(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(__drmm_add_action);
>  
> +/**
> + * drmm_add_action - remave a managed release action to a &drm_device

s/remave/remove/

> + * @dev: DRM device
> + * @action: release function
> + * @data: opaque pointer, passed to @action
> + *
> + * This function removes a release action added by drmm_add_action.

s/drmm_add_action/drmm_add_action()/

> + */
>  void drmm_remove_action(struct drm_device *dev,
>  			drmres_release_t action,
>  			void *data)
> @@ -160,6 +192,16 @@ void drmm_remove_action(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(drmm_remove_action);
>  
> +/**
> + * drmm_kmalloc - &drm_device managed kmalloc()
> + * @dev: DRM device
> + * @size: size of the memory allocation
> + * @gfp: GFP allocation flags
> + *
> + * This is a &drm_device managed version of kmalloc(). The allocated memory is
> + * automatically freed on the final drm_dev_put(). Memory can also be freed
> + * before the final drm_dev_put() by calling drmm_kfree().
> + */
>  void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp)
>  {
>  	struct drmres *dr;
> @@ -175,6 +217,16 @@ void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp)
>  }
>  EXPORT_SYMBOL(drmm_kmalloc);
>  
> +/**
> + * drmm_kstrdup - &drm_device managed kstrdup()
> + * @dev: DRM device
> + * @size: 0 terminated string to be duplicated

s/0 terminated/0-terminated/

> + * @gfp: GFP allocation flags
> + *
> + * This is a &drm_device managed version of kstrdup(). The allocated memory is
> + * automatically freed on the final drm_dev_put() and works exactly like a
> + * memory allocation obtained by drmm_kmalloc().
> + */
>  char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp)
>  {
>  	size_t size;
> @@ -191,6 +243,15 @@ char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp)
>  }
>  EXPORT_SYMBOL_GPL(drmm_kstrdup);
>  
> +/**
> + * drmm_kfree - &drm_device managed kfree()
> + * @dev: DRM device
> + * @data: memory allocation to be freed
> + *
> + * This is a &drm_device managed version of kfree() which can be used to
> + * release memory allocated through drmm_kmalloc() or any of its related
> + * functions before the final drm_dev_put() of @dev.
> + */
>  void drmm_kfree(struct drm_device *dev, void *data)
>  {
>  	struct drmres *dr = NULL, *tmp;
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index edee40e31e4b..0fd7fc6f024e 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -266,6 +266,10 @@ struct drm_driver {
>  	 *
>  	 * Optional callback for destroying device data after the final
>  	 * reference is released, i.e. the device is being destroyed.
> +	 *
> +	 * This is deprecated, clean up all memory allocations associated with a
> +	 * &drm_device using drmm_add_action(), drmm_kmalloc() and related
> +	 * managed resources functions.

I'm afraid we can't necessarily do this. Drivers may create multiple
userspace-facing devices, or other resources used within the kernel (for
instance a driver could expose both a DRM and a V4L2 device, or
registers clocks used by other devices). We thus need a .release()
function in the general case to handle this, as the top-level structure
needs to be reference-counted.

I agree this isn't the norm, so we can document the .release() function
as being rarely used, and recommend the drmm_* API, but we can't
deprecate it completely.

>  	 */
>  	void (*release) (struct drm_device *);
>  
> diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> index 573cadca4b3d..0e7616bd0858 100644
> --- a/include/drm/drm_managed.h
> +++ b/include/drm/drm_managed.h
> @@ -8,6 +8,19 @@ struct drm_device;
>  
>  typedef void (*drmres_release_t)(struct drm_device *dev, void *res);
>  
> +/**
> + * drmm_add_action - add a managed release action to a &drm_device
> + * @dev: DRM device
> + * @action: function which should be called when @dev is released
> + * @data: opaque pointer, passed to @action
> + *
> + * This function adds the @release action wwith optional parameter @data to the

s/wwith/with/

> + * list of cleanup actions for @dev. The cleanup actions will be run in reverse
> + * order in the final drm_dev_put() call for @dev.
> + *
> + * A release action can be removed before @dev is released by calling
> + * drmm_remove_action() with matching parameters for @action and @data.
> + */
>  #define drmm_add_action(dev, action, data) \
>  	__drmm_add_action(dev, action, data, #action)
>  
> @@ -22,12 +35,45 @@ void drmm_remove_action(struct drm_device *dev,
>  void drmm_add_final_kfree(struct drm_device *dev, void *parent);
>  
>  void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp) __malloc;
> +
> +/**
> + * drmm_kzalloc - &drm_device managed kzalloc()
> + * @dev: DRM device
> + * @size: size of the memory allocation
> + * @gfp: GFP allocation flags
> + *
> + * This is a &drm_device managed version of kzalloc(). The allocated memory is
> + * automatically freed on the final drm_dev_put(). Memory can also be freed
> + * before the final drm_dev_put() by calling drmm_kfree().
> + */
>  static inline void *drmm_kzalloc(struct drm_device *dev, size_t size, gfp_t gfp)
>  {
>  	return drmm_kmalloc(dev, size, gfp | __GFP_ZERO);
>  }
> +
> +/**
> + * drmm_kmalloc_array - &drm_device managed kmalloc_array()
> + * @dev: DRM device
> + * @size: 0 terminated string to be duplicated

s/0 terminated/0-terminated/

> + * @gfp: GFP allocation flags
> + *
> + * This is a &drm_device managed version of kmalloc_array(). The allocated
> + * memory is automatically freed on the final drm_dev_put() and works exactly
> + * like a memory allocation obtained by drmm_kmalloc().
> + */
>  static inline void *drmm_kmalloc_array(struct drm_device *dev,
>  				       size_t n, size_t size, gfp_t flags)
> +
> +/**
> + * drmm_kcalloc - &drm_device managed kcalloc()
> + * @dev: DRM device
> + * @size: 0 terminated string to be duplicated

Ditto.

> + * @gfp: GFP allocation flags
> + *
> + * This is a &drm_device managed version of kcalloc(). The allocated memory is
> + * automatically freed on the final drm_dev_put() and works exactly like a
> + * memory allocation obtained by drmm_kmalloc().
> + */
>  {
>  	size_t bytes;
>  
> @@ -41,6 +87,7 @@ static inline void *drmm_kcalloc(struct drm_device *dev,
>  {
>  	return drmm_kmalloc_array(dev, n, size, flags | __GFP_ZERO);
>  }
> +
>  char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp);
>  
>  void drmm_kfree(struct drm_device *dev, void *data);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
