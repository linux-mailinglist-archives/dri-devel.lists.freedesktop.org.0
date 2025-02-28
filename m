Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE45A4983E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 12:21:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA8E10E093;
	Fri, 28 Feb 2025 11:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T8OmAE9D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA22610E093
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 11:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740741671; x=1772277671;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=I1gaAno88Aq8yjPunwouNqglRYSUNpJHt5Q/wDlHh7Q=;
 b=T8OmAE9Do8ZUXV00Q5O+JiuMGK9kx8ivDSBQ3IGHm2V7Bxu3VuOPBD4P
 3/kB+nGIMLpTRA9L8J4+tAUHL0vStgjNDx7SK9/XhXiAD0EBjMoZhTaYk
 3B35+fVGMVMFBzOy0iIEGYbFcgchm1nQ71th9XU74c/hzp6I1jf9NCPO4
 GbYoswEbdaFN5mMJhTHGzr8X1OwDAJxor254olGx0Nr8wlqAFH85pPU+/
 SIxjbK5b/N5r537D9CQ1Eiu8RpunWZRN1lr/y59oZzmwudhfPQJzfd3Fv
 zGz7LHecwfrAS7ryRq4pInankiKzJ4jcDqFG3DlxtjUJ1v6opTkEi9a6j Q==;
X-CSE-ConnectionGUID: c0ilT+ACQGqdwI//TPWIfQ==
X-CSE-MsgGUID: SKqSZfmnS1KZR6xKllZu0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="52654023"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="52654023"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 03:21:10 -0800
X-CSE-ConnectionGUID: MF78jqXcRja9tHFILLmFMA==
X-CSE-MsgGUID: LU3oBIy8SMmwPBdR3JVmrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="140542416"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.24])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 03:21:06 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 javierm@redhat.com, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, hdegoede@redhat.com, airlied@redhat.com,
 sean@poorly.run, sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/4] drm/prime: Support dedicated DMA device for dma-buf
 imports
In-Reply-To: <20250228094457.239442-2-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250228094457.239442-1-tzimmermann@suse.de>
 <20250228094457.239442-2-tzimmermann@suse.de>
Date: Fri, 28 Feb 2025 13:21:02 +0200
Message-ID: <8734fy2u3l.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 28 Feb 2025, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Importing dma-bufs via PRIME requires a DMA-capable device. Devices on
> peripheral busses, such as USB, often cannot perform DMA by themselves.
> Without DMA-capable device PRIME import fails. DRM drivers for USB
> devices already use a separate DMA device for dma-buf imports. Make the
> mechanism generally available.
>
> Add the field dma_dev to struct drm_device to refer to the device's DMA
> device. For USB this should be the USB controller. Use dma_dev in the
> PRIME import helpers, if set.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_drv.c   |  2 ++
>  drivers/gpu/drm/drm_prime.c |  2 +-
>  include/drm/drm_device.h    | 37 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 40 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 17fc5dc708f4..f8c3c9f77d22 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -654,6 +654,8 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
>  {
>  	drm_fs_inode_free(dev->anon_inode);
>  
> +	put_device(dev->dma_dev);
> +	dev->dma_dev = NULL;

The asymmetry in who gets and puts the ->dma_dev bugs me.

You could avoid that by providing a helper for setting ->dma_dev, and
having that get the device:

int drm_dev_set_dma_device(struct drm_device *drm, struct device *dma_device)
{
	dev->dma_dev = get_device(dma_device);

	return dev->dma_dev ? 0 : -ENODEV.
}

Taking drm/gm12u320 from patch 2 as an example, it would become:

	dma_device = usb_intf_get_dma_device(to_usb_interface(dev->dev))
	if (drm_dev_set_dma_device(drm, dma_device))
		drm_warn(dev, "buffer sharing not supported"); /* not an error */
	put_device(dma_device);

Sligthly more verbose, but has a get/put pair in the driver, and a
get/put pair in the core, instead of the asymmetry.

I'm not insisting, but something to consider.


BR,
Jani.


>  	put_device(dev->dev);
>  	/* Prevent use-after-free in drm_managed_release when debugging is
>  	 * enabled. Slightly awkward, but can't really be helped. */
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 32a8781cfd67..258858f2f8dd 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -1004,7 +1004,7 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
>  struct drm_gem_object *drm_gem_prime_import(struct drm_device *dev,
>  					    struct dma_buf *dma_buf)
>  {
> -	return drm_gem_prime_import_dev(dev, dma_buf, dev->dev);
> +	return drm_gem_prime_import_dev(dev, dma_buf, drm_dev_dma_dev(dev));
>  }
>  EXPORT_SYMBOL(drm_gem_prime_import);
>  
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 6ea54a578cda..a24cac4b2077 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -64,6 +64,23 @@ struct drm_device {
>  	/** @dev: Device structure of bus-device */
>  	struct device *dev;
>  
> +	/**
> +	 * @dma_dev:
> +	 *
> +	 * Device for DMA operations. Only required if the device @dev
> +	 * cannot perform DMA by itself. Should be NULL otherwise.
> +	 *
> +	 * Devices on USB and other peripheral busses cannot perform DMA
> +	 * by themselves. The @dma_dev field should point the bus controller
> +	 * that does DMA on behalve of such a device. Required for importing
> +	 * buffers via dma-buf.
> +	 *
> +	 * If set, the DRM driver has to acquire a reference on the DMA
> +	 * device, which will be owned and released automatically by the
> +	 * DRM core.
> +	 */
> +	struct device *dma_dev;
> +
>  	/**
>  	 * @managed:
>  	 *
> @@ -327,4 +344,24 @@ struct drm_device {
>  	struct dentry *debugfs_root;
>  };
>  
> +/**
> + * drm_dev_dma_dev - returns the DMA device for a DRM device
> + * @dev: DRM device
> + *
> + * Returns the DMA device of the given DRM device. This is usually
> + * the same as the DRM device's parent. Devices on some peripheral
> + * busses, such as USB, are incapable of performing DMA by themselves.
> + * Drivers should set struct &drm_device.dma_dev to the bus controller
> + * to make DMA work. Required for PRIME buffer import.
> + *
> + * Returns:
> + * A DMA-capable device for the DRM device.
> + */
> +static inline struct device *drm_dev_dma_dev(struct drm_device *dev)
> +{
> +	if (dev->dma_dev)
> +		return dev->dma_dev;
> +	return dev->dev;
> +}
> +
>  #endif

-- 
Jani Nikula, Intel
