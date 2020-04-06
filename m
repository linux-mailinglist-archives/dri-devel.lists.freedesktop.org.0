Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C29019F553
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 14:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6566E094;
	Mon,  6 Apr 2020 12:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04B96E084;
 Mon,  6 Apr 2020 12:01:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E6CE80E;
 Mon,  6 Apr 2020 14:00:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586174459;
 bh=mUDkQ2Z4TkjaIOHhIGG0wRnBEGWCUll95N0r5FxF/TI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MROn78KzwNlRIJLcqRzegz/J1hAbyjh11fdsM8Tr5ncVGB6OAPCsjCjsp630uscXD
 SvyE7T4uiAOHIs8FrS/yR4R0pKr+VEZfYj3LmyArzPQ1Caz8Vh/cpz6d6kBjkDd2k8
 IPDK8w18FG4CtHocN+4sFmnMv2aToM75PSibefSQ=
Date: Mon, 6 Apr 2020 15:00:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 02/44] drm: Add devm_drm_dev_alloc macro
Message-ID: <20200406120049.GI4757@pendragon.ideasonboard.com>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-3-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403135828.2542770-3-daniel.vetter@ffwll.ch>
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
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Thank you for the patch.

On Fri, Apr 03, 2020 at 03:57:46PM +0200, Daniel Vetter wrote:
> The kerneldoc is only added for this new function. Existing kerneldoc
> and examples will be udated at the very end, since once all drivers
> are converted over to devm_drm_dev_alloc we can unexport a lot of
> interim functions and make the documentation for driver authors a lot
> cleaner and less confusing. There will be only one true way to
> initialize a drm_device at the end of this, which is going to be
> devm_drm_dev_alloc.

How about drivers that expose another interface towards userspace ? If
the other related subsystem also required allocation of the driver
private structure through its corresponding API, we'd be stuck. As
stated before, I want this API to be optional.

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
> + *
> + * This allocates and initialize a new DRM device. No device registration is done.
> + * Call drm_dev_register() to advertice the device to user space and register it
> + * with other core subsystems. This should be done last in the device
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
> + * automatically using devres. The DRM device initialized with this function is
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

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
