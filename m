Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 759B0326138
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 11:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716A36EDBA;
	Fri, 26 Feb 2021 10:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E993E6EDBA
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 10:28:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B434A64ED2;
 Fri, 26 Feb 2021 10:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1614335331;
 bh=jg4KYD3nWRaiBaQ1WklFiccD7vWbIckOLF0IvTz3pgo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LMfrw4aTMBE4hcgBPIz+2UBAi4YleWnBzkIVm55F2R+lulxnEvQP4zEXgzQYfWOkz
 GWOw4Hl39c8LDOcL9yJDpr9MXqUk0J7XhRaCOrkrDviyzp4RPtCjlVLNrQVitaPJMg
 As7K8Pk74mkiSwiCfNA6CigWq1vVpciUn4rG+QNE=
Date: Fri, 26 Feb 2021 11:28:47 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v5] drm: Use USB controller's DMA mask when importing
 dmabufs
Message-ID: <YDjNXzMUaciWIxxi@kroah.com>
References: <20210226092648.4584-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210226092648.4584-1-tzimmermann@suse.de>
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
Cc: Pavel Machek <pavel@ucw.cz>, airlied@linux.ie,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Christoph Hellwig <hch@lst.de>,
 hdegoede@redhat.com, stern@rowland.harvard.edu,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org, sean@poorly.run,
 christian.koenig@amd.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 26, 2021 at 10:26:47AM +0100, Thomas Zimmermann wrote:
> USB devices cannot perform DMA and hence have no dma_mask set in their
> device structure. Therefore importing dmabuf into a USB-based driver
> fails, which breaks joining and mirroring of display in X11.
> =

> For USB devices, pick the associated USB controller as attachment device.
> This allows the DRM import helpers to perform the DMA setup. If the DMA
> controller does not support DMA transfers, we're out of luck and cannot
> import. Our current USB-based DRM drivers don't use DMA, so the actual
> DMA device is not important.
> =

> Drivers should use DRM_GEM_SHMEM_DROVER_OPS_USB to initialize their
> instance of struct drm_driver.
> =

> Tested by joining/mirroring displays of udl and radeon un der Gnome/X11.
> =

> v5:
> 	* provide a helper for USB interfaces (Alan)
> 	* add FIXME item to documentation and TODO list (Daniel)
> v4:
> 	* implement workaround with USB helper functions (Greg)
> 	* use struct usb_device->bus->sysdev as DMA device (Takashi)
> v3:
> 	* drop gem_create_object
> 	* use DMA mask of USB controller, if any (Daniel, Christian, Noralf)
> v2:
> 	* move fix to importer side (Christian, Daniel)
> 	* update SHMEM and CMA helpers for new PRIME callbacks
> =

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 6eb0233ec2d0 ("usb: don't inherity DMA properties for USB devices")
> Tested-by: Pavel Machek <pavel@ucw.cz>
> Acked-by: Christian K=F6nig <christian.koenig@amd.com>
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: <stable@vger.kernel.org> # v5.10+
> ---
>  Documentation/gpu/todo.rst         | 15 ++++++++++
>  drivers/gpu/drm/drm_prime.c        | 45 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/tiny/gm12u320.c    |  2 +-
>  drivers/gpu/drm/udl/udl_drv.c      |  2 +-
>  drivers/usb/core/usb.c             | 31 ++++++++++++++++++++
>  include/drm/drm_gem_shmem_helper.h | 16 +++++++++++
>  include/drm/drm_prime.h            |  5 ++++
>  include/linux/usb.h                | 24 ++++++++++++++++
>  8 files changed, 138 insertions(+), 2 deletions(-)
> =

> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index f872d3d33218..c185e0a2951e 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -617,6 +617,21 @@ Contact: Daniel Vetter
>  =

>  Level: Intermediate
>  =

> +Remove automatic page mapping from dma-buf importing
> +----------------------------------------------------
> +
> +When importing dma-bufs, the dma-buf and PRIME frameworks automatically =
map
> +imported pages into the importer's DMA area. This is a problem for USB d=
evices,
> +which do not support DMA operations. By default, importing fails for USB
> +devices. USB-based drivers work around this problem by employing
> +drm_gem_prime_import_usb(). To fix the issue, automatic page mappings sh=
ould
> +be removed from the buffer-sharing code.
> +
> +Contact: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter
> +
> +Level: Advanced
> +
> +
>  Better Testing
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  =

> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 2a54f86856af..59013bb1cd4b 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -29,6 +29,7 @@
>  #include <linux/export.h>
>  #include <linux/dma-buf.h>
>  #include <linux/rbtree.h>
> +#include <linux/usb.h>
>  =

>  #include <drm/drm.h>
>  #include <drm/drm_drv.h>
> @@ -1055,3 +1056,47 @@ void drm_prime_gem_destroy(struct drm_gem_object *=
obj, struct sg_table *sg)
>  	dma_buf_put(dma_buf);
>  }
>  EXPORT_SYMBOL(drm_prime_gem_destroy);
> +
> +/**
> + * drm_gem_prime_import_usb - helper library implementation of the impor=
t callback for USB devices
> + * @dev: drm_device to import into
> + * @dma_buf: dma-buf object to import
> + *
> + * This is an implementation of drm_gem_prime_import() for USB-based dev=
ices.
> + * USB devices cannot perform DMA directly. This function selects the US=
B host
> + * controller as DMA device instead. Drivers can use this as their
> + * &drm_driver.gem_prime_import implementation.
> + *
> + * See also drm_gem_prime_import().
> + *
> + * FIXME: The dma-buf framework expects to map the exported pages into
> + *        the importer's DMA area. USB devices don't support DMA, and
> + *        importing would fail. Foir the time being, this function provi=
des
> + *        a workaround by using the USB controller's DMA area. The real
> + *        solution is to remove page-mapping operations from the dma-buf
> + *        framework.
> + *
> + * Returns: A GEM object on success, or a pointer-encoder errno value ot=
herwise.
> + */
> +#ifdef CONFIG_USB
> +struct drm_gem_object *drm_gem_prime_import_usb(struct drm_device *dev,
> +						struct dma_buf *dma_buf)
> +{
> +	struct device *dmadev;
> +	struct drm_gem_object *obj;
> +
> +	if (!dev_is_usb(dev->dev))
> +		return ERR_PTR(-ENODEV);
> +
> +	dmadev =3D usb_intf_get_dma_device(to_usb_interface(dev->dev));
> +	if (drm_WARN_ONCE(dev, !dmadev, "buffer sharing not supported"))
> +		return ERR_PTR(-ENODEV);
> +
> +	obj =3D drm_gem_prime_import_dev(dev, dma_buf, dmadev);
> +
> +	put_device(dmadev);
> +
> +	return obj;
> +}
> +EXPORT_SYMBOL(drm_gem_prime_import_usb);
> +#endif
> diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u=
320.c
> index 0b4f4f2af1ef..99e7bd36a220 100644
> --- a/drivers/gpu/drm/tiny/gm12u320.c
> +++ b/drivers/gpu/drm/tiny/gm12u320.c
> @@ -611,7 +611,7 @@ static const struct drm_driver gm12u320_drm_driver =
=3D {
>  	.minor		 =3D DRIVER_MINOR,
>  =

>  	.fops		 =3D &gm12u320_fops,
> -	DRM_GEM_SHMEM_DRIVER_OPS,
> +	DRM_GEM_SHMEM_DRIVER_OPS_USB,
>  };
>  =

>  static const struct drm_mode_config_funcs gm12u320_mode_config_funcs =3D=
 {
> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
> index 9269092697d8..2db483b2b199 100644
> --- a/drivers/gpu/drm/udl/udl_drv.c
> +++ b/drivers/gpu/drm/udl/udl_drv.c
> @@ -39,7 +39,7 @@ static const struct drm_driver driver =3D {
>  =

>  	/* GEM hooks */
>  	.fops =3D &udl_driver_fops,
> -	DRM_GEM_SHMEM_DRIVER_OPS,
> +	DRM_GEM_SHMEM_DRIVER_OPS_USB,
>  =

>  	.name =3D DRIVER_NAME,
>  	.desc =3D DRIVER_DESC,
> diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
> index 8f07b0516100..5e07921e87ba 100644
> --- a/drivers/usb/core/usb.c
> +++ b/drivers/usb/core/usb.c
> @@ -748,6 +748,37 @@ void usb_put_intf(struct usb_interface *intf)
>  }
>  EXPORT_SYMBOL_GPL(usb_put_intf);
>  =

> +/**
> + * usb_get_dma_device - acquire a reference on the usb device's DMA endp=
oint
> + * @udev: usb device
> + *
> + * While a USB device cannot perform DMA operations by itself, many USB
> + * controllers can. A call to usb_get_dma_device() returns the DMA endpo=
int
> + * for the given USB device, if any. The returned device structure shoul=
d be
> + * released with put_device().

"must be" released.

Same for the other documentation in here.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
