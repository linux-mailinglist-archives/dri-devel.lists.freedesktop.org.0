Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF1B1C5DD6
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 18:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E5616E1F8;
	Tue,  5 May 2020 16:49:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333CB6E1F8
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 16:49:04 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 1F9B9804BA;
 Tue,  5 May 2020 18:49:02 +0200 (CEST)
Date: Tue, 5 May 2020 18:49:00 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/5] drm/mgag200: Init and finalize devices in
 mgag200_device_{init,fini}()
Message-ID: <20200505164900.GE5082@ravnborg.org>
References: <20200505095649.25814-1-tzimmermann@suse.de>
 <20200505095649.25814-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200505095649.25814-5-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=C80a1XTypFPPC2WrnmsA:9 a=CjuIK1q_8ugA:10
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
Cc: cogarre@gmail.com, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 airlied@redhat.com, emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

On Tue, May 05, 2020 at 11:56:48AM +0200, Thomas Zimmermann wrote:
> Device initialization is now done in mgag200_device_init(). Specifically,
> the function allocates the DRM device and sets up the respective fields
> in struct mga_device.
> 
> A call to mgag200_device_fini() finalizes struct mga_device.
> 
> The old function mgag200_driver_load() and mgag200_driver_unload() were
> left over from the DRM driver's load callbacks and have now been removed.

Not too big fan of this patch, due to the changes allocation.
I would prefer if you merged patch 4+5 and then take it from there.

You have patch 1+2+3 and they are now reviewed so why not push them
and work on top of them.
And then you could also push the patch that removes the cursor stuff
so we do not need to look at that anymore.

	Sam
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/mgag200/mgag200_drv.c  | 27 ++++++++++----------
>  drivers/gpu/drm/mgag200/mgag200_drv.h  |  5 ++--
>  drivers/gpu/drm/mgag200/mgag200_main.c | 34 ++++++++++++++++----------
>  3 files changed, 37 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
> index c2f0e4b40b052..ad12c1b7c66cc 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -51,6 +51,7 @@ MODULE_DEVICE_TABLE(pci, pciidlist);
>  
>  static int mga_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  {
> +	struct mga_device *mdev;
>  	struct drm_device *dev;
>  	int ret;
>  
> @@ -60,31 +61,28 @@ static int mga_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	if (ret)
>  		return ret;
>  
> -	dev = drm_dev_alloc(&driver, &pdev->dev);
> -	if (IS_ERR(dev)) {
> -		ret = PTR_ERR(dev);
> +	mdev = devm_kzalloc(&pdev->dev, sizeof(*mdev), GFP_KERNEL);
> +	if (!mdev) {
> +		ret = -ENOMEM;
>  		goto err_pci_disable_device;
>  	}
>  
> -	dev->pdev = pdev;
> -	pci_set_drvdata(pdev, dev);
> -
> -	ret = mgag200_driver_load(dev, ent->driver_data);
> +	ret = mgag200_device_init(mdev, &driver, pdev, ent->driver_data);
>  	if (ret)
> -		goto err_drm_dev_put;
> +		goto err_pci_disable_device;
> +
> +	dev = mdev->dev;
>  
>  	ret = drm_dev_register(dev, ent->driver_data);
>  	if (ret)
> -		goto err_mgag200_driver_unload;
> +		goto err_mgag200_device_fini;
>  
>  	drm_fbdev_generic_setup(dev, 0);
>  
>  	return 0;
>  
> -err_mgag200_driver_unload:
> -	mgag200_driver_unload(dev);
> -err_drm_dev_put:
> -	drm_dev_put(dev);
> +err_mgag200_device_fini:
> +	mgag200_device_fini(mdev);
>  err_pci_disable_device:
>  	pci_disable_device(pdev);
>  	return ret;
> @@ -93,9 +91,10 @@ static int mga_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  static void mga_pci_remove(struct pci_dev *pdev)
>  {
>  	struct drm_device *dev = pci_get_drvdata(pdev);
> +	struct mga_device *mdev = to_mga_device(dev);
>  
>  	drm_dev_unregister(dev);
> -	mgag200_driver_unload(dev);
> +	mgag200_device_fini(mdev);
>  	drm_dev_put(dev);
>  }
>  
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
> index 632bbb50465c9..1ce0386669ffa 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> @@ -200,8 +200,9 @@ int mgag200_modeset_init(struct mga_device *mdev);
>  void mgag200_modeset_fini(struct mga_device *mdev);
>  
>  				/* mgag200_main.c */
> -int mgag200_driver_load(struct drm_device *dev, unsigned long flags);
> -void mgag200_driver_unload(struct drm_device *dev);
> +int mgag200_device_init(struct mga_device *mdev, struct drm_driver *drv,
> +			struct pci_dev *pdev, unsigned long flags);
> +void mgag200_device_fini(struct mga_device *mdev);
>  
>  				/* mgag200_i2c.c */
>  struct mga_i2c_chan *mgag200_i2c_create(struct drm_device *dev);
> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
> index 010b309c01fc4..070ff1f433df2 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
> @@ -11,6 +11,7 @@
>  #include <linux/pci.h>
>  
>  #include <drm/drm_crtc_helper.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  
>  #include "mgag200_drv.h"
> @@ -96,17 +97,21 @@ static int mga_vram_init(struct mga_device *mdev)
>   */
>  
>  
> -int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
> +int mgag200_device_init(struct mga_device *mdev, struct drm_driver *drv,
> +			struct pci_dev *pdev, unsigned long flags)
>  {
> -	struct mga_device *mdev;
> +	struct drm_device *dev = mdev->dev;
>  	int ret, option;
>  
> -	mdev = devm_kzalloc(dev->dev, sizeof(struct mga_device), GFP_KERNEL);
> -	if (mdev == NULL)
> -		return -ENOMEM;
> +	dev = drm_dev_alloc(drv, &pdev->dev);
> +	if (IS_ERR(dev))
> +		return PTR_ERR(dev);
>  	dev->dev_private = (void *)mdev;
>  	mdev->dev = dev;
>  
> +	dev->pdev = pdev;
> +	pci_set_drvdata(pdev, dev);
> +
>  	mdev->flags = mgag200_flags_from_driver_data(flags);
>  	mdev->type = mgag200_type_from_driver_data(flags);
>  
> @@ -123,12 +128,15 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
>  	if (!devm_request_mem_region(dev->dev, mdev->rmmio_base,
>  				     mdev->rmmio_size, "mgadrmfb_mmio")) {
>  		drm_err(dev, "can't reserve mmio registers\n");
> -		return -ENOMEM;
> +		ret = -ENOMEM;
> +		goto err_drm_dev_put;
>  	}
>  
>  	mdev->rmmio = pcim_iomap(dev->pdev, 1, 0);
> -	if (mdev->rmmio == NULL)
> -		return -ENOMEM;
> +	if (mdev->rmmio == NULL) {
> +		ret = -ENOMEM;
> +		goto err_drm_dev_put;
> +	}
>  
>  	/* stash G200 SE model number for later use */
>  	if (IS_G200_SE(mdev)) {
> @@ -139,7 +147,7 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
>  
>  	ret = mga_vram_init(mdev);
>  	if (ret)
> -		return ret;
> +		goto err_drm_dev_put;
>  
>  	mdev->bpp_shifts[0] = 0;
>  	mdev->bpp_shifts[1] = 1;
> @@ -174,17 +182,17 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
>  	drm_mode_config_cleanup(dev);
>  	mgag200_cursor_fini(mdev);
>  	mgag200_mm_fini(mdev);
> +err_drm_dev_put:
> +	drm_dev_put(dev);
>  err_mm:
>  	dev->dev_private = NULL;
>  	return ret;
>  }
>  
> -void mgag200_driver_unload(struct drm_device *dev)
> +void mgag200_device_fini(struct mga_device *mdev)
>  {
> -	struct mga_device *mdev = to_mga_device(dev);
> +	struct drm_device *dev = mdev->dev;
>  
> -	if (mdev == NULL)
> -		return;
>  	mgag200_modeset_fini(mdev);
>  	drm_mode_config_cleanup(dev);
>  	mgag200_cursor_fini(mdev);
> -- 
> 2.26.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
