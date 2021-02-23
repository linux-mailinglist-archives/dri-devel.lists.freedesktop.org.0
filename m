Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 252E0322A2E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 13:02:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3022C89A83;
	Tue, 23 Feb 2021 12:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985A889A83
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 12:02:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A8B6A61481;
 Tue, 23 Feb 2021 12:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1614081765;
 bh=0Zt1cKt1K7xf/htjgE0vulHmO/nRk4RAiLjk1zOipPw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oAypFQfY3N+T56ZJZHnSp/V5cXlRmQHKlCor4CseuG3Rl87MNm/yAMOv6jPLv0YSS
 Aa4UHpFFyVrKeMrWGFgY/e9pdNxTo2AcBYg9doKA1hNEM1cWuGwup/DAHByAoSbNur
 37sA/yNuFdQGQN0IAXZpdO/Vz1U+oPeRChJ5JJY8=
Date: Tue, 23 Feb 2021 13:02:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3] drm: Use USB controller's DMA mask when importing
 dmabufs
Message-ID: <YDTu4ugLo23APyaM@kroah.com>
References: <20210223105842.27011-1-tzimmermann@suse.de>
 <YDTk3L3gNxDE3YrC@kroah.com> <YDTrDAlcFH/7/7DD@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YDTrDAlcFH/7/7DD@phenom.ffwll.local>
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
 Thomas Gleixner <tglx@linutronix.de>, airlied@linux.ie,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Oliver Neukum <oneukum@suse.com>, Christoph Hellwig <hch@lst.de>,
 hdegoede@redhat.com, Alan Stern <stern@rowland.harvard.edu>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 stable@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, sean@poorly.run,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 23, 2021 at 12:46:20PM +0100, Daniel Vetter wrote:
> On Tue, Feb 23, 2021 at 12:19:56PM +0100, Greg KH wrote:
> > On Tue, Feb 23, 2021 at 11:58:42AM +0100, Thomas Zimmermann wrote:
> > > USB devices cannot perform DMA and hence have no dma_mask set in their
> > > device structure. Importing dmabuf into a USB-based driver fails, which
> > > break joining and mirroring of display in X11.
> > > 
> > > For USB devices, pick the associated USB controller as attachment device,
> > > so that it can perform DMA. If the DMa controller does not support DMA
> > > transfers, we're aout of luck and cannot import.
> > > 
> > > Drivers should use DRM_GEM_SHMEM_DROVER_OPS_USB to initialize their
> > > instance of struct drm_driver.
> > > 
> > > Tested by joining/mirroring displays of udl and radeon un der Gnome/X11.
> > > 
> > > v3:
> > > 	* drop gem_create_object
> > > 	* use DMA mask of USB controller, if any (Daniel, Christian, Noralf)
> > > v2:
> > > 	* move fix to importer side (Christian, Daniel)
> > > 	* update SHMEM and CMA helpers for new PRIME callbacks
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > Fixes: 6eb0233ec2d0 ("usb: don't inherity DMA properties for USB devices")
> > > Cc: Christoph Hellwig <hch@lst.de>
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Cc: Johan Hovold <johan@kernel.org>
> > > Cc: Alan Stern <stern@rowland.harvard.edu>
> > > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > > Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > Cc: Oliver Neukum <oneukum@suse.com>
> > > Cc: Thomas Gleixner <tglx@linutronix.de>
> > > Cc: <stable@vger.kernel.org> # v5.10+
> > > ---
> > >  drivers/gpu/drm/drm_prime.c        | 36 ++++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/tiny/gm12u320.c    |  2 +-
> > >  drivers/gpu/drm/udl/udl_drv.c      |  2 +-
> > >  include/drm/drm_gem_shmem_helper.h | 13 +++++++++++
> > >  include/drm/drm_prime.h            |  5 +++++
> > >  5 files changed, 56 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> > > index 2a54f86856af..9015850f2160 100644
> > > --- a/drivers/gpu/drm/drm_prime.c
> > > +++ b/drivers/gpu/drm/drm_prime.c
> > > @@ -29,6 +29,7 @@
> > >  #include <linux/export.h>
> > >  #include <linux/dma-buf.h>
> > >  #include <linux/rbtree.h>
> > > +#include <linux/usb.h>
> > > 
> > >  #include <drm/drm.h>
> > >  #include <drm/drm_drv.h>
> > > @@ -1055,3 +1056,38 @@ void drm_prime_gem_destroy(struct drm_gem_object *obj, struct sg_table *sg)
> > >  	dma_buf_put(dma_buf);
> > >  }
> > >  EXPORT_SYMBOL(drm_prime_gem_destroy);
> > > +
> > > +/**
> > > + * drm_gem_prime_import_usb - helper library implementation of the import callback for USB devices
> > > + * @dev: drm_device to import into
> > > + * @dma_buf: dma-buf object to import
> > > + *
> > > + * This is an implementation of drm_gem_prime_import() for USB-based devices.
> > > + * USB devices cannot perform DMA directly. This function selects the USB host
> > > + * controller as DMA device instead. Drivers can use this as their
> > > + * &drm_driver.gem_prime_import implementation.
> > > + *
> > > + * See also drm_gem_prime_import().
> > > + */
> > > +#ifdef CONFIG_USB
> > > +struct drm_gem_object *drm_gem_prime_import_usb(struct drm_device *dev,
> > > +						struct dma_buf *dma_buf)
> > > +{
> > > +	struct usb_device *udev;
> > > +	struct device *usbhost;
> > > +
> > > +	if (dev->dev->bus != &usb_bus_type)
> > > +		return ERR_PTR(-ENODEV);
> > > +
> > > +	udev = interface_to_usbdev(to_usb_interface(dev->dev));
> > > +	if (!udev->bus)
> > > +		return ERR_PTR(-ENODEV);
> > > +
> > > +	usbhost = udev->bus->controller;
> > > +	if (!usbhost || !usbhost->dma_mask)
> > > +		return ERR_PTR(-ENODEV);
> > 
> > If individual USB drivers need access to this type of thing, shouldn't
> > that be done in the USB core itself?
> > 
> > {hint, yes}
> > 
> > There shouldn't be anything "special" about a DRM driver that needs this
> > vs. any other driver that might want to know about DMA things related to
> > a specific USB device.  Why isn't this an issue with the existing
> > storage or v4l USB devices?
> 
> The trouble is that this is a regression fix for 5.9, because the dma-api
> got more opinionated about what it allows. The proper fix is a lot more
> invasive (we essentially need to rework the drm_prime.c to allow dma-buf
> importing for just cpu access), and that's a ton more invasive than just a
> small patch with can stuff into stable kernels.
> 
> This here is ugly, but it should at least get rid of black screens again.
> 
> I think solid FIXME comment explaining the situation would be good.

Why can't I take a USB patch for a regression fix?  Is drm somehow
stand-alone that you make changes here that should belong in other
subsystems?

{hint, it shouldn't be}

When you start poking in the internals of usb controller structures,
that logic belongs in the USB core for all drivers to use, not in a
random tiny subsystem where no USB developer will ever notice it?  :)

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
