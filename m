Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E539E2983B9
	for <lists+dri-devel@lfdr.de>; Sun, 25 Oct 2020 22:45:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C876E064;
	Sun, 25 Oct 2020 21:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B836E05C;
 Sun, 25 Oct 2020 21:44:55 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 422F880617;
 Sun, 25 Oct 2020 22:44:52 +0100 (CET)
Date: Sun, 25 Oct 2020 22:44:50 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 4/5] drm: Allow const struct drm_driver
Message-ID: <20201025214450.GA13779@ravnborg.org>
References: <20201023122811.2374118-1-daniel.vetter@ffwll.ch>
 <20201023122811.2374118-4-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201023122811.2374118-4-daniel.vetter@ffwll.ch>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=7gkXJVJtAAAA:8
 a=e5mUnYsNAAAA:8 a=Xr82exVJ7S4rfeC2btUA:9 a=CjuIK1q_8ugA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 23, 2020 at 02:28:10PM +0200, Daniel Vetter wrote:
> It's nice if a big function/ioctl table like this is const. Only
> downside here is that we need a few more #ifdef to paper over the
> differences when CONFIG_DRM_LEGACY is enabled. Maybe provides more
> motivation to sunset that horror show :-)
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_drv.c | 15 ++++++++++-----
>  include/drm/drm_device.h  |  4 ++++
>  include/drm/drm_drv.h     |  5 +++--
>  3 files changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 457ac0f82be2..94d2c41115b8 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -574,7 +574,7 @@ static void drm_dev_init_release(struct drm_device *dev, void *res)
>  }
>  
>  static int drm_dev_init(struct drm_device *dev,
> -			struct drm_driver *driver,
> +			const struct drm_driver *driver,
>  			struct device *parent)
>  {
>  	int ret;
> @@ -589,7 +589,11 @@ static int drm_dev_init(struct drm_device *dev,
>  
>  	kref_init(&dev->ref);
>  	dev->dev = get_device(parent);
> +#ifdef CONFIG_DRM_LEGACY
> +	dev->driver = (struct drm_driver *) driver;
checkpatch will tell you to drop space after closing ')'

With this super important fix the patch is:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> +#else
>  	dev->driver = driver;
> +#endif
>  
>  	INIT_LIST_HEAD(&dev->managed.resources);
>  	spin_lock_init(&dev->managed.lock);
> @@ -663,7 +667,7 @@ static void devm_drm_dev_init_release(void *data)
>  
>  static int devm_drm_dev_init(struct device *parent,
>  			     struct drm_device *dev,
> -			     struct drm_driver *driver)
> +			     const struct drm_driver *driver)
>  {
>  	int ret;
>  
> @@ -678,7 +682,8 @@ static int devm_drm_dev_init(struct device *parent,
>  	return ret;
>  }
>  
> -void *__devm_drm_dev_alloc(struct device *parent, struct drm_driver *driver,
> +void *__devm_drm_dev_alloc(struct device *parent,
> +			   const struct drm_driver *driver,
>  			   size_t size, size_t offset)
>  {
>  	void *container;
> @@ -713,7 +718,7 @@ EXPORT_SYMBOL(__devm_drm_dev_alloc);
>   * RETURNS:
>   * Pointer to new DRM device, or ERR_PTR on failure.
>   */
> -struct drm_device *drm_dev_alloc(struct drm_driver *driver,
> +struct drm_device *drm_dev_alloc(const struct drm_driver *driver,
>  				 struct device *parent)
>  {
>  	struct drm_device *dev;
> @@ -858,7 +863,7 @@ static void remove_compat_control_link(struct drm_device *dev)
>   */
>  int drm_dev_register(struct drm_device *dev, unsigned long flags)
>  {
> -	struct drm_driver *driver = dev->driver;
> +	const struct drm_driver *driver = dev->driver;
>  	int ret;
>  
>  	if (!driver->load)
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index f4f68e7a9149..2c361964aee7 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -83,7 +83,11 @@ struct drm_device {
>  	} managed;
>  
>  	/** @driver: DRM driver managing the device */
> +#ifdef CONFIG_DRM_LEGACY
>  	struct drm_driver *driver;
> +#else
> +	const struct drm_driver *driver;
> +#endif
>  
>  	/**
>  	 * @dev_private:
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 7af220226a25..cc9da43b6eda 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -516,7 +516,8 @@ struct drm_driver {
>  #endif
>  };
>  
> -void *__devm_drm_dev_alloc(struct device *parent, struct drm_driver *driver,
> +void *__devm_drm_dev_alloc(struct device *parent,
> +			   const struct drm_driver *driver,
>  			   size_t size, size_t offset);
>  
>  /**
> @@ -549,7 +550,7 @@ void *__devm_drm_dev_alloc(struct device *parent, struct drm_driver *driver,
>  	((type *) __devm_drm_dev_alloc(parent, driver, sizeof(type), \
>  				       offsetof(type, member)))
>  
> -struct drm_device *drm_dev_alloc(struct drm_driver *driver,
> +struct drm_device *drm_dev_alloc(const struct drm_driver *driver,
>  				 struct device *parent);
>  int drm_dev_register(struct drm_device *dev, unsigned long flags);
>  void drm_dev_unregister(struct drm_device *dev);
> -- 
> 2.28.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
