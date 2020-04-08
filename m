Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 788D11A1C10
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 08:57:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C656E956;
	Wed,  8 Apr 2020 06:57:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 200366E956;
 Wed,  8 Apr 2020 06:57:19 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7A9D780511;
 Wed,  8 Apr 2020 08:57:16 +0200 (CEST)
Date: Wed, 8 Apr 2020 08:57:14 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 02/44] drm: Add devm_drm_dev_alloc macro
Message-ID: <20200408065714.GC14965@ravnborg.org>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-3-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403135828.2542770-3-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=P-IC7800AAAA:8
 a=P1BnusSwAAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8 a=Vp9Je2LJPudk9Kz6O5wA:9
 a=CjuIK1q_8ugA:10 a=d3PnA9EDa4IxuAV0gXij:22 a=D0XLA9XvdZm18NrgonBM:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel.

Finally managed to dive into this..

Maybe I need more coffee, it is still morning here.
But alas this patch triggered a few comments.

	Sam

On Fri, Apr 03, 2020 at 03:57:46PM +0200, Daniel Vetter wrote:
> The kerneldoc is only added for this new function. Existing kerneldoc
> and examples will be udated at the very end, since once all drivers
> are converted over to devm_drm_dev_alloc we can unexport a lot of
> interim functions and make the documentation for driver authors a lot
> cleaner and less confusing. There will be only one true way to
> initialize a drm_device at the end of this, which is going to be
> devm_drm_dev_alloc.

This changelog entry does a poor job describing what the purpose of this
change is.
Try to read it outside context.


> 
> Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_drv.c | 23 +++++++++++++++++++++++
>  include/drm/drm_drv.h     | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 56 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 1bb4f636b83c..9e60b784b3ac 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -739,6 +739,29 @@ int devm_drm_dev_init(struct device *parent,
>  }
>  EXPORT_SYMBOL(devm_drm_dev_init);
>  
> +void* __devm_drm_dev_alloc(struct device *parent, struct drm_driver *driver,
> +			   size_t size, size_t offset)
> +{
> +	void *container;
> +	struct drm_device *drm;
> +	int ret;
> +
> +	container = kzalloc(size, GFP_KERNEL);
> +	if (!container)
> +		return ERR_PTR(-ENOMEM);
> +
> +	drm = container + offset;
> +	ret = devm_drm_dev_init(parent, drm, driver);
> +	if (ret) {
> +		kfree(container);
> +		return ERR_PTR(ret);
> +	}
> +	drmm_add_final_kfree(drm, container);
> +
> +	return container;
> +}
> +EXPORT_SYMBOL(__devm_drm_dev_alloc);
> +
>  /**
>   * drm_dev_alloc - Allocate new DRM device
>   * @driver: DRM driver to allocate device for
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index e7c6ea261ed1..26776be5a21e 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -626,6 +626,39 @@ int devm_drm_dev_init(struct device *parent,
>  		      struct drm_device *dev,
>  		      struct drm_driver *driver);
>  
> +void* __devm_drm_dev_alloc(struct device *parent, struct drm_driver *driver,
> +			   size_t size, size_t offset);
> +
> +/**
> + * devm_drm_dev_alloc - Resource managed allocation of a &drm_device instance
> + * @parent: Parent device object
> + * @driver: DRM driver
> + * @type: the type of the struct which contains struct &drm_device
> + * @member: the name of the &drm_device within @type.
I am confused about the naming here.
devm_ implies we allocate something with a lifetime equal that of a
driver. So when the driver are gone what we allocate is also gone.
Like everythign else devm_ prefixed.

But the lifetime of a drm_device is until the last userspace reference
is gone (final drm_dev_put() is called).

> + *
> + * This allocates and initialize a new DRM device. No device registration is done.
> + * Call drm_dev_register() to advertice the device to user space and register it
> + * with other core subsystems. This should be done last in the device
s/This/Calling drm_dev_register()/ will make this sentence a bit more
explicit.

> + * initialization sequence to make sure userspace can't access an inconsistent
> + * state.
> + *
> + * The initial ref-count of the object is 1. Use drm_dev_get() and
> + * drm_dev_put() to take and drop further ref-counts.
> + *
> + * It is recommended that drivers embed &struct drm_device into their own device
> + * structure.
> + *
> + * Note that this manages the lifetime of the resulting &drm_device
> + * automatically using devres.
Hmm, no this is managed by drmres???


> + * The DRM device initialized with this function is
> + * automatically put on driver detach using drm_dev_put().
> + *
> + * RETURNS:
> + * Pointer to new DRM device, or ERR_PTR on failure.
> + */
> +#define devm_drm_dev_alloc(parent, driver, type, member) \
> +	((type *) __devm_drm_dev_alloc(parent, driver, sizeof(type), \
> +				       offsetof(type, member)))
> +
>  struct drm_device *drm_dev_alloc(struct drm_driver *driver,
>  				 struct device *parent);
>  int drm_dev_register(struct drm_device *dev, unsigned long flags);
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
