Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CC1A5680F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 13:45:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FDC10E184;
	Fri,  7 Mar 2025 12:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iITzqxXc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73C3E10E994
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 12:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741351554; x=1772887554;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9c+y/tczAvboxs6kQT/JaMbtQxNyxszAPrgNMfGaFBM=;
 b=iITzqxXclIjIdpSmTvR3tITOIrvEgLLjy+Je0KdoCk4kDZb74kN1AtIG
 EJqVJCSkSncOIz6xQwdQtdepENR1vJeJkkIOdaqOQWTT90tqbdBbT7pRY
 Ju0YE2yF1Pfxlhy1rCCQtyseooOR/szgxltJVJTpSCLcTK3KDZPubcxI5
 q/hJKQjd5uZTcn/Hr/9iTR3f4rfhWCFACyPxO9jFA/ZW7sPDadOqpAKfc
 4qWWtDq/GY7su6Srp2wKMu3WQT7VPeTM6jO75wz6cebkjC2GMagfUoGEv
 /cjRgLNO162A4joLgSQTPKgAcgrsM/sxciGbu4+orScU9pcEwk5QFnAPq A==;
X-CSE-ConnectionGUID: P6cyA7B4R8+dKBx1R7CaXw==
X-CSE-MsgGUID: vIRZFF9gTxOCUb5UIWrlyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="64838433"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="64838433"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 04:45:53 -0800
X-CSE-ConnectionGUID: 0c/1u6EpRrSkIoiiY5r8kQ==
X-CSE-MsgGUID: vP8oXbnCSACIYCoGJXLb8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119841959"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.240])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 04:45:47 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 javierm@redhat.com, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, hdegoede@redhat.com, airlied@redhat.com,
 sean@poorly.run, sumit.semwal@linaro.org, christian.koenig@amd.com,
 admin@kodeit.net, gargaditya08@live.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 1/5] drm/prime: Support dedicated DMA device for
 dma-buf imports
In-Reply-To: <20250307080836.42848-2-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250307080836.42848-1-tzimmermann@suse.de>
 <20250307080836.42848-2-tzimmermann@suse.de>
Date: Fri, 07 Mar 2025 14:45:44 +0200
Message-ID: <87y0xhggav.fsf@intel.com>
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

On Fri, 07 Mar 2025, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Importing dma-bufs via PRIME requires a DMA-capable device. Devices on
> peripheral busses, such as USB, often cannot perform DMA by themselves.
> Without DMA-capable device PRIME import fails. DRM drivers for USB
> devices already use a separate DMA device for dma-buf imports. Make the
> mechanism generally available.
>
> Besides the case of USB, there are embedded DRM devices without DMA
> capability. DMA is performed by a separate controller. DRM drivers should
> set this accordingly.
>
> Add the field dma_dev to struct drm_device to refer to the device's DMA
> device. For USB this should be the USB controller. Use dma_dev in the
> PRIME import helpers, if set.
>
> v2:
> - acquire internal reference on dma_dev (Jani)
> - add DMA-controller usecase to docs (Maxime)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/drm_drv.c   | 21 +++++++++++++++++++
>  drivers/gpu/drm/drm_prime.c |  2 +-
>  include/drm/drm_device.h    | 41 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 63 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 17fc5dc708f4..c9487bc88624 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -500,6 +500,25 @@ void drm_dev_unplug(struct drm_device *dev)
>  }
>  EXPORT_SYMBOL(drm_dev_unplug);
>  
> +/**
> + * drm_dev_set_dma_dev - set the DMA device for a DRM device
> + * @dev: DRM device
> + * @dma_dev: DMA device or NULL
> + *
> + * Sets the DMA device of the given DRM device. Only required if
> + * the DMA device is different from the DRM device's parent. After
> + * calling this function, the DRM device holds a reference on
> + * @dma_dev. Pass NULL to clear the DMA device.
> + */
> +void drm_dev_set_dma_dev(struct drm_device *dev, struct device *dma_dev)
> +{
> +	dma_dev = get_device(dma_dev);
> +
> +	put_device(dev->dma_dev);
> +	dev->dma_dev = dma_dev;
> +}
> +EXPORT_SYMBOL(drm_dev_set_dma_dev);
> +
>  /*
>   * Available recovery methods for wedged device. To be sent along with device
>   * wedged uevent.
> @@ -654,6 +673,8 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
>  {
>  	drm_fs_inode_free(dev->anon_inode);
>  
> +	put_device(dev->dma_dev);
> +	dev->dma_dev = NULL;
>  	put_device(dev->dev);
>  	/* Prevent use-after-free in drm_managed_release when debugging is
>  	 * enabled. Slightly awkward, but can't really be helped. */
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index bdb51c8f262e..ed4e5f06b79d 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -998,7 +998,7 @@ EXPORT_SYMBOL(drm_gem_prime_import_dev);
>  struct drm_gem_object *drm_gem_prime_import(struct drm_device *dev,
>  					    struct dma_buf *dma_buf)
>  {
> -	return drm_gem_prime_import_dev(dev, dma_buf, dev->dev);
> +	return drm_gem_prime_import_dev(dev, dma_buf, drm_dev_dma_dev(dev));
>  }
>  EXPORT_SYMBOL(drm_gem_prime_import);
>  
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 6ea54a578cda..e2f894f1b90a 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -64,6 +64,28 @@ struct drm_device {
>  	/** @dev: Device structure of bus-device */
>  	struct device *dev;
>  
> +	/**
> +	 * @dma_dev:
> +	 *
> +	 * Device for DMA operations. Only required if the device @dev
> +	 * cannot perform DMA by itself. Should be NULL otherwise. Call
> +	 * drm_dev_dma_dev() to get the DMA device instead of using this
> +	 * field directly. Call drm_dev_set_dma_dev() to set this field.
> +	 *
> +	 * DRM devices are sometimes bound to virtual devices that cannot
> +	 * perform DMA by themselves. Drivers should set this field to the
> +	 * respective DMA controller.
> +	 *
> +	 * Devices on USB and other peripheral busses also cannot perform
> +	 * DMA by themselves. The @dma_dev field should point the bus
> +	 * controller that does DMA on behalve of such a device. Required
> +	 * for importing buffers via dma-buf.
> +	 *
> +	 * If set, the DRM core automatically releases the reference on the
> +	 * device.
> +	 */
> +	struct device *dma_dev;
> +
>  	/**
>  	 * @managed:
>  	 *
> @@ -327,4 +349,23 @@ struct drm_device {
>  	struct dentry *debugfs_root;
>  };
>  
> +void drm_dev_set_dma_dev(struct drm_device *dev, struct device *dma_dev);
> +
> +/**
> + * drm_dev_dma_dev - returns the DMA device for a DRM device
> + * @dev: DRM device
> + *
> + * Returns the DMA device of the given DRM device. By default, this
> + * the DRM device's parent. See drm_dev_set_dma_dev().
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
