Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C407D322DBF
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 16:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C9F6E841;
	Tue, 23 Feb 2021 15:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by gabe.freedesktop.org (Postfix) with SMTP id 2CE3A6E841
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 15:45:09 +0000 (UTC)
Received: (qmail 1263331 invoked by uid 1000); 23 Feb 2021 10:45:07 -0500
Date: Tue, 23 Feb 2021 10:45:07 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3] drm: Use USB controller's DMA mask when importing
 dmabufs
Message-ID: <20210223154507.GA1261797@rowland.harvard.edu>
References: <20210223105842.27011-1-tzimmermann@suse.de>
 <YDTk3L3gNxDE3YrC@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YDTk3L3gNxDE3YrC@kroah.com>
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
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Oliver Neukum <oneukum@suse.com>, Christoph Hellwig <hch@lst.de>,
 christian.koenig@amd.com, hdegoede@redhat.com,
 Thomas Gleixner <tglx@linutronix.de>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 23, 2021 at 12:19:56PM +0100, Greg KH wrote:
> On Tue, Feb 23, 2021 at 11:58:42AM +0100, Thomas Zimmermann wrote:

> > --- a/drivers/gpu/drm/drm_prime.c
> > +++ b/drivers/gpu/drm/drm_prime.c
> > @@ -29,6 +29,7 @@
> >  #include <linux/export.h>
> >  #include <linux/dma-buf.h>
> >  #include <linux/rbtree.h>
> > +#include <linux/usb.h>
> > 
> >  #include <drm/drm.h>
> >  #include <drm/drm_drv.h>
> > @@ -1055,3 +1056,38 @@ void drm_prime_gem_destroy(struct drm_gem_object *obj, struct sg_table *sg)
> >  	dma_buf_put(dma_buf);
> >  }
> >  EXPORT_SYMBOL(drm_prime_gem_destroy);
> > +
> > +/**
> > + * drm_gem_prime_import_usb - helper library implementation of the import callback for USB devices
> > + * @dev: drm_device to import into
> > + * @dma_buf: dma-buf object to import
> > + *
> > + * This is an implementation of drm_gem_prime_import() for USB-based devices.
> > + * USB devices cannot perform DMA directly. This function selects the USB host
> > + * controller as DMA device instead. Drivers can use this as their
> > + * &drm_driver.gem_prime_import implementation.
> > + *
> > + * See also drm_gem_prime_import().
> > + */
> > +#ifdef CONFIG_USB
> > +struct drm_gem_object *drm_gem_prime_import_usb(struct drm_device *dev,
> > +						struct dma_buf *dma_buf)
> > +{
> > +	struct usb_device *udev;
> > +	struct device *usbhost;
> > +
> > +	if (dev->dev->bus != &usb_bus_type)
> > +		return ERR_PTR(-ENODEV);
> > +
> > +	udev = interface_to_usbdev(to_usb_interface(dev->dev));
> > +	if (!udev->bus)
> > +		return ERR_PTR(-ENODEV);
> > +
> > +	usbhost = udev->bus->controller;
> > +	if (!usbhost || !usbhost->dma_mask)
> > +		return ERR_PTR(-ENODEV);

Thomas, I doubt that you have to go through all of this.  The 
usb-storage driver, for instance, just uses the equivalent of 
dev->dev->dma_mask.  Even though USB devices don't do DMA themselves, 
the DMA mask value is inherited from the parent host controller's device 
struct.

Have you tried doing this?

> If individual USB drivers need access to this type of thing, shouldn't
> that be done in the USB core itself?
> 
> {hint, yes}
> 
> There shouldn't be anything "special" about a DRM driver that needs this
> vs. any other driver that might want to know about DMA things related to
> a specific USB device.  Why isn't this an issue with the existing
> storage or v4l USB devices?

If Thomas finds that the approach I outlined above works, then the rest 
of this email thread becomes moot.  :-)

Alan Stern
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
