Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B04324D02
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 10:37:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03586E10E;
	Thu, 25 Feb 2021 09:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1963C6E10E
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 09:36:56 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id z126so5483037oiz.6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 01:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W7MC3/QnDlOBciI7HO8xeix5Zlcj2JKBczxxvejpGvM=;
 b=lWVfsr9CjnfmWsbtgiQDe3qnCpNonlE1+yy6onxrYumeosbwmI5YZ1zc2PCcDmQys9
 YTNqDJBBicYF+nv26NUpn+0XLVwgm4vchwi60h3lH1i8USM7cW49N6d/f/TDPnZDQci5
 tIhKlFseJT9Isl7DaI/wfR2ucMNRXIwsvmQuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W7MC3/QnDlOBciI7HO8xeix5Zlcj2JKBczxxvejpGvM=;
 b=tjGFJbdr2dHqM8uECoZHYVMfCy4+dc/G864hGeDvOJN4ndbv3WPdTTlKu2LcJ+T6zW
 h/LbBQwK3hUggtqwy1KjvevZVgoN1Q2XIFR5e/8R3ZXOY3SK/U02v6jr5k7FHldo0rlc
 EJh42KsZ4Qw44kJao/y5xcU029wQhQFuv7jpB4qodrgGqomwGBPFZIK34wiu2GFVgoTe
 uQtHylwskEFs5CZVRy2bVoyjJyZQOlGcSA6h6HyzZLMpMcoC0z184yra5ANDOoMOAs0a
 M2WMRtSKJtuHiD/ntfIfySs+nwy/JkPbofe2GBXNA6Rw3GL+chx0Yw5Pef4GJ63IEyVd
 JSLw==
X-Gm-Message-State: AOAM530ODsyeoJRd7qg4PeVMAah2FMTLYcc+m5irgdQMB7DBLdWkjx3D
 7BKDJZmhzVzTimZRvzEfeLyWEAQSlnrjSvqp2D9eRg==
X-Google-Smtp-Source: ABdhPJxgMzBnZ6ZO00bpxTer9CP2+NvwZV0qXHayexi0FhKDb9yYPkpK6gRp93FaxCrJVUx6Zo3ApI85aRMgXGS1LZI=
X-Received: by 2002:a05:6808:aa6:: with SMTP id
 r6mr1324550oij.128.1614245815316; 
 Thu, 25 Feb 2021 01:36:55 -0800 (PST)
MIME-Version: 1.0
References: <20210224092304.29932-1-tzimmermann@suse.de>
In-Reply-To: <20210224092304.29932-1-tzimmermann@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 25 Feb 2021 10:36:44 +0100
Message-ID: <CAKMK7uGi1j_7xt7XeSaUu6noq+UOsS5nNHBDQBp46uwWHOofnA@mail.gmail.com>
Subject: Re: [PATCH v4] drm: Use USB controller's DMA mask when importing
 dmabufs
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Dave Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 Christoph Hellwig <hch@lst.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, Alan Stern <stern@rowland.harvard.edu>,
 dri-devel <dri-devel@lists.freedesktop.org>, stable <stable@vger.kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 24, 2021 at 10:23 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> USB devices cannot perform DMA and hence have no dma_mask set in their
> device structure. Therefore importing dmabuf into a USB-based driver
> fails, which breaks joining and mirroring of display in X11.
>
> For USB devices, pick the associated USB controller as attachment device.
> This allows the DRM import helpers to perform the DMA setup. If the DMA
> controller does not support DMA transfers, we're out of luck and cannot
> import. Our current USB-based DRM drivers don't use DMA, so the actual
> DMA device is not important.
>
> Drivers should use DRM_GEM_SHMEM_DROVER_OPS_USB to initialize their
> instance of struct drm_driver.
>
> Tested by joining/mirroring displays of udl and radeon un der Gnome/X11.
>
> v4:
>         * implement workaround with USB helper functions (Greg)
>         * use struct usb_device->bus->sysdev as DMA device (Takashi)
> v3:
>         * drop gem_create_object
>         * use DMA mask of USB controller, if any (Daniel, Christian, Noralf)
> v2:
>         * move fix to importer side (Christian, Daniel)
>         * update SHMEM and CMA helpers for new PRIME callbacks
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 6eb0233ec2d0 ("usb: don't inherity DMA properties for USB devices")
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: <stable@vger.kernel.org> # v5.10+
> ---
>  drivers/gpu/drm/drm_prime.c        | 38 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/tiny/gm12u320.c    |  2 +-
>  drivers/gpu/drm/udl/udl_drv.c      |  2 +-
>  drivers/usb/core/usb.c             | 29 +++++++++++++++++++++++
>  include/drm/drm_gem_shmem_helper.h | 13 ++++++++++
>  include/drm/drm_prime.h            |  5 ++++
>  include/linux/usb.h                |  3 +++
>  7 files changed, 90 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 2a54f86856af..15c82088ab4c 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -29,6 +29,7 @@
>  #include <linux/export.h>
>  #include <linux/dma-buf.h>
>  #include <linux/rbtree.h>
> +#include <linux/usb.h>
>
>  #include <drm/drm.h>
>  #include <drm/drm_drv.h>
> @@ -1055,3 +1056,40 @@ void drm_prime_gem_destroy(struct drm_gem_object *obj, struct sg_table *sg)
>         dma_buf_put(dma_buf);
>  }
>  EXPORT_SYMBOL(drm_prime_gem_destroy);
> +
> +/**
> + * drm_gem_prime_import_usb - helper library implementation of the import callback for USB devices
> + * @dev: drm_device to import into
> + * @dma_buf: dma-buf object to import
> + *
> + * This is an implementation of drm_gem_prime_import() for USB-based devices.
> + * USB devices cannot perform DMA directly. This function selects the USB host
> + * controller as DMA device instead. Drivers can use this as their
> + * &drm_driver.gem_prime_import implementation.

We're still just papering over drm_prime.c here, and this kerneldoc
here is sounding way too much like this is a sensible thing to do and
doesn't mention the fundamental problem.

I'd do something like the below as the entire kerneldoc:

<doc>
FIXME:

drm_gem_prime_fd_to_handle() and drm_gem_prime_handle_to_fd() require
that importers call dma_buf_attach() even if they never do actual
device DMA, but only CPU access through dma_buf_vmap(). Fixing this is
a bit more involved, since the import/export cache is also tied to
&drm_gem_object.import_attach.

Meanwhile this function here can be used to paper over this problem
for USB devices by fishing out the USB host controller device, as long
as that supports DMA. Otherwise importing can still needlessly fail.
</doc>
Since we do not actually have usb drm drivers that do dma I don't want
to give people wrong impressions about what's going on here. I still
think the better approach would be to copypaste this hack into each of
the tree drivers, with the above as a comment, since sharing bad code
isn't a good idea imo - all that does is hide the problem and make the
next person feel like it's all peachy. But also ok if there's a
giantic warning label on the shared code.

With that: Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>


> + *
> + * See also drm_gem_prime_import().
> + */
> +#ifdef CONFIG_USB
> +struct drm_gem_object *drm_gem_prime_import_usb(struct drm_device *dev,
> +                                               struct dma_buf *dma_buf)
> +{
> +       struct usb_device *udev;
> +       struct device *dmadev;
> +       struct drm_gem_object *obj;
> +
> +       if (!dev_is_usb(dev->dev))
> +               return ERR_PTR(-ENODEV);
> +       udev = interface_to_usbdev(to_usb_interface(dev->dev));
> +
> +       dmadev = usb_get_dma_device(udev);
> +       if (drm_WARN_ONCE(dev, !dmadev, "buffer sharing not supported"))
> +               return ERR_PTR(-ENODEV);
> +
> +       obj = drm_gem_prime_import_dev(dev, dma_buf, dmadev);
> +
> +       put_device(dmadev);
> +
> +       return obj;
> +}
> +EXPORT_SYMBOL(drm_gem_prime_import_usb);
> +#endif
> diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
> index 0b4f4f2af1ef..99e7bd36a220 100644
> --- a/drivers/gpu/drm/tiny/gm12u320.c
> +++ b/drivers/gpu/drm/tiny/gm12u320.c
> @@ -611,7 +611,7 @@ static const struct drm_driver gm12u320_drm_driver = {
>         .minor           = DRIVER_MINOR,
>
>         .fops            = &gm12u320_fops,
> -       DRM_GEM_SHMEM_DRIVER_OPS,
> +       DRM_GEM_SHMEM_DRIVER_OPS_USB,
>  };
>
>  static const struct drm_mode_config_funcs gm12u320_mode_config_funcs = {
> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
> index 9269092697d8..2db483b2b199 100644
> --- a/drivers/gpu/drm/udl/udl_drv.c
> +++ b/drivers/gpu/drm/udl/udl_drv.c
> @@ -39,7 +39,7 @@ static const struct drm_driver driver = {
>
>         /* GEM hooks */
>         .fops = &udl_driver_fops,
> -       DRM_GEM_SHMEM_DRIVER_OPS,
> +       DRM_GEM_SHMEM_DRIVER_OPS_USB,
>
>         .name = DRIVER_NAME,
>         .desc = DRIVER_DESC,
> diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
> index 8f07b0516100..253bf71780fd 100644
> --- a/drivers/usb/core/usb.c
> +++ b/drivers/usb/core/usb.c
> @@ -748,6 +748,35 @@ void usb_put_intf(struct usb_interface *intf)
>  }
>  EXPORT_SYMBOL_GPL(usb_put_intf);
>
> +/**
> + * usb_get_dma_device - acquire a reference on the usb device's DMA endpoint
> + * @udev: usb device
> + *
> + * While a USB device cannot perform DMA operations by itself, many USB
> + * controllers can. A call to usb_get_dma_device() returns the DMA endpoint
> + * for the given USB device, if any. The returned device structure should be
> + * released with put_device().
> + *
> + * Returns: A reference to the usb device's DMA endpoint; or NULL if none
> + *          exists.
> + */
> +struct device *usb_get_dma_device(struct usb_device *udev)
> +{
> +       struct device *dmadev;
> +
> +       if (!udev->bus)
> +               return NULL;
> +
> +       dmadev = get_device(udev->bus->sysdev);
> +       if (!dmadev || !dmadev->dma_mask) {
> +               put_device(dmadev);
> +               return NULL;
> +       }
> +
> +       return dmadev;
> +}
> +EXPORT_SYMBOL_GPL(usb_get_dma_device);
> +
>  /*                     USB device locking
>   *
>   * USB devices and interfaces are locked using the semaphore in their
> diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
> index 434328d8a0d9..09d12f632cad 100644
> --- a/include/drm/drm_gem_shmem_helper.h
> +++ b/include/drm/drm_gem_shmem_helper.h
> @@ -162,4 +162,17 @@ struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_object *obj);
>         .gem_prime_mmap         = drm_gem_prime_mmap, \
>         .dumb_create            = drm_gem_shmem_dumb_create
>
> +#ifdef CONFIG_USB
> +/**
> + * DRM_GEM_SHMEM_DRIVER_OPS_USB - Default shmem GEM operations for USB devices
> + *
> + * This macro provides a shortcut for setting the shmem GEM operations in
> + * the &drm_driver structure. Drivers for USB-based devices should use this
> + * macro instead of &DRM_GEM_SHMEM_DRIVER_OPS.
> + */
> +#define DRM_GEM_SHMEM_DRIVER_OPS_USB \
> +       DRM_GEM_SHMEM_DRIVER_OPS, \
> +       .gem_prime_import = drm_gem_prime_import_usb
> +#endif
> +
>  #endif /* __DRM_GEM_SHMEM_HELPER_H__ */
> diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
> index 54f2c58305d2..b42e07edd9e6 100644
> --- a/include/drm/drm_prime.h
> +++ b/include/drm/drm_prime.h
> @@ -110,4 +110,9 @@ int drm_prime_sg_to_page_array(struct sg_table *sgt, struct page **pages,
>  int drm_prime_sg_to_dma_addr_array(struct sg_table *sgt, dma_addr_t *addrs,
>                                    int max_pages);
>
> +#ifdef CONFIG_USB
> +struct drm_gem_object *drm_gem_prime_import_usb(struct drm_device *dev,
> +                                               struct dma_buf *dma_buf);
> +#endif
> +
>  #endif /* __DRM_PRIME_H__ */
> diff --git a/include/linux/usb.h b/include/linux/usb.h
> index 7d72c4e0713c..a9bd698c8839 100644
> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -711,6 +711,7 @@ struct usb_device {
>         unsigned use_generic_driver:1;
>  };
>  #define        to_usb_device(d) container_of(d, struct usb_device, dev)
> +#define dev_is_usb(d)  ((d)->bus == &usb_bus_type)
>
>  static inline struct usb_device *interface_to_usbdev(struct usb_interface *intf)
>  {
> @@ -746,6 +747,8 @@ extern int usb_lock_device_for_reset(struct usb_device *udev,
>  extern int usb_reset_device(struct usb_device *dev);
>  extern void usb_queue_reset_device(struct usb_interface *dev);
>
> +extern struct device *usb_get_dma_device(struct usb_device *udev);
> +
>  #ifdef CONFIG_ACPI
>  extern int usb_acpi_set_power_state(struct usb_device *hdev, int index,
>         bool enable);
> --
> 2.30.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
