Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B145032535B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 17:18:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D646ECD1;
	Thu, 25 Feb 2021 16:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by gabe.freedesktop.org (Postfix) with SMTP id 441FB6ECD1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 16:18:49 +0000 (UTC)
Received: (qmail 1352732 invoked by uid 1000); 25 Feb 2021 11:18:47 -0500
Date: Thu, 25 Feb 2021 11:18:47 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v4] drm: Use USB controller's DMA mask when importing
 dmabufs
Message-ID: <20210225161847.GB1350993@rowland.harvard.edu>
References: <20210224092304.29932-1-tzimmermann@suse.de>
 <20210224152153.GA1307460@rowland.harvard.edu>
 <b44307cf-25f9-acd0-eb35-92e8716205de@suse.de>
 <s5h1rd4sgie.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5h1rd4sgie.wl-tiwai@suse.de>
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
Cc: airlied@linux.ie, gregkh@linuxfoundation.org, stable@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, hdegoede@redhat.com,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 sean@poorly.run, christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 25, 2021 at 09:23:05AM +0100, Takashi Iwai wrote:
> On Thu, 25 Feb 2021 08:57:14 +0100,
> Thomas Zimmermann wrote:
> > 
> > Hi
> > 
> > Am 24.02.21 um 16:21 schrieb Alan Stern:
> > > On Wed, Feb 24, 2021 at 10:23:04AM +0100, Thomas Zimmermann wrote:
> > >> USB devices cannot perform DMA and hence have no dma_mask set in their
> > >> device structure. Therefore importing dmabuf into a USB-based driver
> > >> fails, which breaks joining and mirroring of display in X11.
> > >>
> > >> For USB devices, pick the associated USB controller as attachment device.
> > >> This allows the DRM import helpers to perform the DMA setup. If the DMA
> > >> controller does not support DMA transfers, we're out of luck and cannot
> > >> import. Our current USB-based DRM drivers don't use DMA, so the actual
> > >> DMA device is not important.
> > >>
> > >> Drivers should use DRM_GEM_SHMEM_DROVER_OPS_USB to initialize their
> > >> instance of struct drm_driver.
> > >>
> > >> Tested by joining/mirroring displays of udl and radeon un der Gnome/X11.
> > >>
> > >> v4:
> > >> 	* implement workaround with USB helper functions (Greg)
> > >> 	* use struct usb_device->bus->sysdev as DMA device (Takashi)
> > >> v3:
> > >> 	* drop gem_create_object
> > >> 	* use DMA mask of USB controller, if any (Daniel, Christian, Noralf)
> > >> v2:
> > >> 	* move fix to importer side (Christian, Daniel)
> > >> 	* update SHMEM and CMA helpers for new PRIME callbacks
> > >>
> > >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > >> Fixes: 6eb0233ec2d0 ("usb: don't inherity DMA properties for USB devices")
> > >> Cc: Christoph Hellwig <hch@lst.de>
> > >> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > >> Cc: <stable@vger.kernel.org> # v5.10+
> > >> ---
> > >
> > >> +struct drm_gem_object *drm_gem_prime_import_usb(struct drm_device *dev,
> > >> +						struct dma_buf *dma_buf)
> > >> +{
> > >> +	struct usb_device *udev;
> > >> +	struct device *dmadev;
> > >> +	struct drm_gem_object *obj;
> > >> +
> > >> +	if (!dev_is_usb(dev->dev))
> > >> +		return ERR_PTR(-ENODEV);
> > >> +	udev = interface_to_usbdev(to_usb_interface(dev->dev));
> > >> +
> > >> +	dmadev = usb_get_dma_device(udev);
> > >
> > > You can do it this way if you want, but I think usb_get_dma_device would
> > > be easier to use if its argument was a pointer to struct usb_interface
> > > or (even better) a pointer to a usb_interface's embedded struct device.
> > > Then you wouldn't need to compute udev, and the same would be true for
> > > other callers.
> > 
> > It seemed natural to me to use usb_device, because it contains the bus
> > pointer. But maybe a little wrapper for usb_interface in the header
> > file makes things easier to read. I'll wait a bit for other reviews to
> > come in.
> 
> I agree with Thomas, as most of users referring to the sysdev do
> access in a pattern like udev->bus->sysdev, AFAIK.

Apart from the USB core and host/gadget controller drivers, there 
appears to be only one reference to sysdev for a USB device: the one in 
usb-storage (and that one really should be dmadev).

In general, I expect callers of the new routine would be drivers that 
bind to a USB interface (like usb-storage), not to a USB device.  So 
they would naturally have the interface pointer handy.

But the routine could be written in a different way.  If it took a 
pointer to struct device as its argument, it could easily tell whether 
that structure was embedded in a usb_device or a usb_interface 
struct, and do the right thing either way.

Or there could be two routines: one taking a usb_device pointer and one 
taking a usb_interface pointer.

The idea here is to make the routine as easy as possible for callers.  
If this means making the routine a little longer, that's okay -- there's 
only one copy of the routine but there could be lots of callers.

Alan Stern
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
