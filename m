Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E2F16884D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 21:23:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342906F508;
	Fri, 21 Feb 2020 20:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E686F503;
 Fri, 21 Feb 2020 20:23:40 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 852B120044;
 Fri, 21 Feb 2020 21:23:36 +0100 (CET)
Date: Fri, 21 Feb 2020 21:23:35 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 52/52] drm: Add docs for managed resources
Message-ID: <20200221202335.GB27701@ravnborg.org>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-53-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219102122.1607365-53-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8
 a=la3sf7WCWzTiMNMG3OsA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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

Hi Daniel.

In general I think I could follow the documentation, this is good.
If the overall design is the best possible I cannot say,
but looks sane to me.

I like the drmm_ naming as a counterpart to devm_, each handling
resources with different lifetimes.

What I miss in all of this is how do other subsystems deal
with the different lifetime of their stuff?
Or maybe only drm really has this issue?
Anything we could learn from others?

Some more or less clueless comments in the following. Filter as usual.

And a bikeshedding detail.
"dev" is in my vocalubary a "struct device". So each time I see a "dev"
I think a struct device.
drm or ddev makes me think of struct drm_device - with the former being
my favorite.

	Sam

> + * Note that any allocation or resource which is visible to userspace must be
> + * released only when the final drm_dev_put() is called, and not when the
> + * driver is unbound from the underlying physical struct &device. Best to use
> + * &drm_device managed resources with drmm_add_action(), drmm_kmalloc() and
> + * related functions.

Best to use => Maybe "It is recommended to use ..."

> + *
> + * devres managed resources like devm_kmalloc() can only be used for resources
> + * directly related to the underlying hardware device, and only used in code
> + * paths fully protected by drm_dev_enter() and drm_dev_exit().
Maybe this is obvious to others, but maybe add just a bit more about
what is required to be "fully protected". Or maybe this is already
documented somewhere else?
In drm_dev_enter() the term "critical section" is used.
I gues this is the section that is fully protected.

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
Maybe fix this when the text is added.

> +/**
> + * drmm_add_final_kfree - add release action for the final kfree()
> + * @dev: DRM device
> + * @data: pointer to the kmalloc allocation containing @dev
> + *
> + * Since the allocation containing the struct &drm_device must be allocated
> + * before it can be initialized with drm_dev_init() there's no way to allocate
> + * that memory with drmm_kmalloc().

To side-step this chicken-egg problem the
> + * pointer for this final kfree() must be specified by calling this function. It
> + * will be released in the final drm_dev_put() for @dev, after all other release
> + * actions installed through drmm_add_action() have been processed.

Or maybe

Use drmm_add_final_kfree() to record that the allocation must be
released as the last step when the final drm_dev_put() for @dev is
called.


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
"action to a &drm_device" => "action from a &drm_device"?

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

RETURNS: ?

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
> + * @gfp: GFP allocation flags
> + *
> + * This is a &drm_device managed version of kstrdup(). The allocated memory is
> + * automatically freed on the final drm_dev_put() and works exactly like a
> + * memory allocation obtained by drmm_kmalloc().

RETURNS: ?
> + */
>  char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp)
>  {
>  	size_t size;
> @@ -191,6 +243,15 @@ char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp)
>  }
>  EXPORT_SYMBOL_GPL(drmm_kstrdup);
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

RETURNS: ?

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
> + * @gfp: GFP allocation flags
> + *
> + * This is a &drm_device managed version of kmalloc_array(). The allocated
> + * memory is automatically freed on the final drm_dev_put() and works exactly
> + * like a memory allocation obtained by drmm_kmalloc().

RETURNS: ?

> + */
>  static inline void *drmm_kmalloc_array(struct drm_device *dev,
>  				       size_t n, size_t size, gfp_t flags)
> +
> +/**
> + * drmm_kcalloc - &drm_device managed kcalloc()
> + * @dev: DRM device
> + * @size: 0 terminated string to be duplicated
> + * @gfp: GFP allocation flags
> + *
> + * This is a &drm_device managed version of kcalloc(). The allocated memory is
> + * automatically freed on the final drm_dev_put() and works exactly like a
> + * memory allocation obtained by drmm_kmalloc().

RETURNS: ?

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
> -- 
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
