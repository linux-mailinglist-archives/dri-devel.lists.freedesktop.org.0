Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 700803265C1
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 17:43:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB80A6EE15;
	Fri, 26 Feb 2021 16:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by gabe.freedesktop.org (Postfix) with SMTP id 518F36EE20
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Feb 2021 16:43:44 +0000 (UTC)
Received: (qmail 1394367 invoked by uid 1000); 26 Feb 2021 11:43:42 -0500
Date: Fri, 26 Feb 2021 11:43:42 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v5] drm: Use USB controller's DMA mask when importing
 dmabufs
Message-ID: <20210226164342.GC1392547@rowland.harvard.edu>
References: <20210226092648.4584-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210226092648.4584-1-tzimmermann@suse.de>
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
Cc: Pavel Machek <pavel@ucw.cz>, airlied@linux.ie, gregkh@linuxfoundation.org,
 Christoph Hellwig <hch@lst.de>, hdegoede@redhat.com,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 stable@vger.kernel.org, sean@poorly.run, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 26, 2021 at 10:26:47AM +0100, Thomas Zimmermann wrote:
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
> v5:
> 	* provide a helper for USB interfaces (Alan)
> 	* add FIXME item to documentation and TODO list (Daniel)

> --- a/drivers/usb/core/usb.c
> +++ b/drivers/usb/core/usb.c
> @@ -748,6 +748,37 @@ void usb_put_intf(struct usb_interface *intf)
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
> + * See also usb_intf_get_dma_device().
> + *
> + * Returns: A reference to the usb device's DMA endpoint; or NULL if none
> + *          exists.
> + */
> +struct device *usb_get_dma_device(struct usb_device *udev)
> +{
> +	struct device *dmadev;
> +
> +	if (!udev->bus)
> +		return NULL;
> +
> +	dmadev = get_device(udev->bus->sysdev);
> +	if (!dmadev || !dmadev->dma_mask) {
> +		put_device(dmadev);
> +		return NULL;
> +	}
> +
> +	return dmadev;
> +}
> +EXPORT_SYMBOL_GPL(usb_get_dma_device);

There's no point making this a separate function, since it has no
callers of its own.  Just make usb_intf_get_dma_device the only new
function.

> --- a/include/linux/usb.h
> +++ b/include/linux/usb.h
> @@ -711,6 +711,7 @@ struct usb_device {
>  	unsigned use_generic_driver:1;
>  };
>  #define	to_usb_device(d) container_of(d, struct usb_device, dev)
> +#define dev_is_usb(d)	((d)->bus == &usb_bus_type)
>  
>  static inline struct usb_device *interface_to_usbdev(struct usb_interface *intf)
>  {
> @@ -746,6 +747,29 @@ extern int usb_lock_device_for_reset(struct usb_device *udev,
>  extern int usb_reset_device(struct usb_device *dev);
>  extern void usb_queue_reset_device(struct usb_interface *dev);
>  
> +extern struct device *usb_get_dma_device(struct usb_device *udev);
> +
> +/**
> + * usb_intf_get_dma_device - acquire a reference on the usb interface's DMA endpoint
> + * @intf: the usb interface
> + *
> + * While a USB device cannot perform DMA operations by itself, many USB
> + * controllers can. A call to usb_intf_get_dma_device() returns the DMA endpoint
> + * for the given USB interface, if any. The returned device structure should be
> + * released with put_device().
> + *
> + * See also usb_get_dma_device().
> + *
> + * Returns: A reference to the usb interface's DMA endpoint; or NULL if none
> + *          exists.
> + */
> +static inline struct device *usb_intf_get_dma_device(struct usb_interface *intf)
> +{
> +	if (!intf)
> +		return NULL;

Why would intf ever be NULL?

> +	return usb_get_dma_device(interface_to_usbdev(intf));
> +}

Alan Stern
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
