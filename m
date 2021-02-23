Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B49E322AF9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 14:00:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAFE788065;
	Tue, 23 Feb 2021 13:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6341088065
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 13:00:04 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id n19so3808770ooj.11
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 05:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vVUR+VI2N/dsmkgh9pt6dHQkPQEP9ElWNL7bJUhWnoA=;
 b=Of+9oRV6A3gwmGz5mpkiifJiTE07wa7hYRXeJZSz61ErGW6fqyxtw5kLkDsLIVjjH0
 xuiWo4QX/XZ4tPJ7gqyQmkmqMcySPmon3xCLBrKxoxzCUyzmFXWZV6+rmj1bqlRbHsJq
 WaIHfVfgmwceMgafjJw1e1qPfmjWbCpixSFcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vVUR+VI2N/dsmkgh9pt6dHQkPQEP9ElWNL7bJUhWnoA=;
 b=OZYDOEF+rfnHHjVmYZZT3tcew+0ZEVks+at0K5HbTbdp+ZeNEoOS8bFnmOw0pTJhWG
 cV2yP+s+60vgV6d5oZn1s+SB75kMRuOmOIN/AH4m6o71EXGX0YlO19kcKe6MO8aU8RhU
 CmKs3Ajk3xEEQeMkT60/0owBR1te4J5wCCRk8n6kQS5/2KISAg1HKQNuGxZf9JXD3CJ1
 WMZKQdCeIggWeWezOrC8dX3DdiTWQhsCfT+A0ANhQkEGXHN+bEapSB31yxM+1qJ0077A
 rOtigGZlCNRqQCNPINKARdzjaScwEEz+Us+7PvHZWZEzEm165JBvcJbF2oHFiP9EzD62
 IaCQ==
X-Gm-Message-State: AOAM5319nhRN38AzTpeFneBhoEO8K7hnoQY6xlFTgIDhi01NAr7kM/i5
 hZ7U0sr0FdXYu08INKbl+Lwqqrr9f03sy6bLSaKryQ==
X-Google-Smtp-Source: ABdhPJzveZVl7smag347ViHcBNcaIGvR0BNxJ/Ez5xS5qUZBUgUP+yWOSqLEYZUtcI+hoJ9xHZfF7+EHtlS4Oy9AsNk=
X-Received: by 2002:a4a:424c:: with SMTP id i12mr20083611ooj.85.1614085203645; 
 Tue, 23 Feb 2021 05:00:03 -0800 (PST)
MIME-Version: 1.0
References: <20210223105842.27011-1-tzimmermann@suse.de>
 <YDTk3L3gNxDE3YrC@kroah.com>
 <YDTrDAlcFH/7/7DD@phenom.ffwll.local> <YDTu4ugLo23APyaM@kroah.com>
 <CAKMK7uG67eHEFOCJBJCtwFbwoUWQsER4DNBKRp6e75uywvF1pw@mail.gmail.com>
 <YDT0GIJEhWRp0w5F@kroah.com>
 <CAKMK7uEYxc9LLZa3w0NX7tEcBMpGAUdUGXzwdXoow7U3c5KLZQ@mail.gmail.com>
 <YDT6KwrAEAAdZieT@kroah.com>
In-Reply-To: <YDT6KwrAEAAdZieT@kroah.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 23 Feb 2021 13:59:52 +0100
Message-ID: <CAKMK7uGcHX=q1rOr6C3VVZKOD6BFTo4k5yNqFMsL3oXWmitLsQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm: Use USB controller's DMA mask when importing
 dmabufs
To: Greg KH <gregkh@linuxfoundation.org>
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
 Thomas Gleixner <tglx@linutronix.de>, Dave Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Oliver Neukum <oneukum@suse.com>, Christoph Hellwig <hch@lst.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, Alan Stern <stern@rowland.harvard.edu>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, stable <stable@vger.kernel.org>,
 Johan Hovold <johan@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 23, 2021 at 1:50 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Feb 23, 2021 at 01:40:51PM +0100, Daniel Vetter wrote:
> > On Tue, Feb 23, 2021 at 1:24 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Feb 23, 2021 at 01:14:30PM +0100, Daniel Vetter wrote:
> > > > On Tue, Feb 23, 2021 at 1:02 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Tue, Feb 23, 2021 at 12:46:20PM +0100, Daniel Vetter wrote:
> > > > > > On Tue, Feb 23, 2021 at 12:19:56PM +0100, Greg KH wrote:
> > > > > > > On Tue, Feb 23, 2021 at 11:58:42AM +0100, Thomas Zimmermann wrote:
> > > > > > > > USB devices cannot perform DMA and hence have no dma_mask set in their
> > > > > > > > device structure. Importing dmabuf into a USB-based driver fails, which
> > > > > > > > break joining and mirroring of display in X11.
> > > > > > > >
> > > > > > > > For USB devices, pick the associated USB controller as attachment device,
> > > > > > > > so that it can perform DMA. If the DMa controller does not support DMA
> > > > > > > > transfers, we're aout of luck and cannot import.
> > > > > > > >
> > > > > > > > Drivers should use DRM_GEM_SHMEM_DROVER_OPS_USB to initialize their
> > > > > > > > instance of struct drm_driver.
> > > > > > > >
> > > > > > > > Tested by joining/mirroring displays of udl and radeon un der Gnome/X11.
> > > > > > > >
> > > > > > > > v3:
> > > > > > > >   * drop gem_create_object
> > > > > > > >   * use DMA mask of USB controller, if any (Daniel, Christian, Noralf)
> > > > > > > > v2:
> > > > > > > >   * move fix to importer side (Christian, Daniel)
> > > > > > > >   * update SHMEM and CMA helpers for new PRIME callbacks
> > > > > > > >
> > > > > > > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > > > > Fixes: 6eb0233ec2d0 ("usb: don't inherity DMA properties for USB devices")
> > > > > > > > Cc: Christoph Hellwig <hch@lst.de>
> > > > > > > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > > > > Cc: Johan Hovold <johan@kernel.org>
> > > > > > > > Cc: Alan Stern <stern@rowland.harvard.edu>
> > > > > > > > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > > > > > Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > > > > > > > Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
> > > > > > > > Cc: Oliver Neukum <oneukum@suse.com>
> > > > > > > > Cc: Thomas Gleixner <tglx@linutronix.de>
> > > > > > > > Cc: <stable@vger.kernel.org> # v5.10+
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/drm_prime.c        | 36 ++++++++++++++++++++++++++++++
> > > > > > > >  drivers/gpu/drm/tiny/gm12u320.c    |  2 +-
> > > > > > > >  drivers/gpu/drm/udl/udl_drv.c      |  2 +-
> > > > > > > >  include/drm/drm_gem_shmem_helper.h | 13 +++++++++++
> > > > > > > >  include/drm/drm_prime.h            |  5 +++++
> > > > > > > >  5 files changed, 56 insertions(+), 2 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> > > > > > > > index 2a54f86856af..9015850f2160 100644
> > > > > > > > --- a/drivers/gpu/drm/drm_prime.c
> > > > > > > > +++ b/drivers/gpu/drm/drm_prime.c
> > > > > > > > @@ -29,6 +29,7 @@
> > > > > > > >  #include <linux/export.h>
> > > > > > > >  #include <linux/dma-buf.h>
> > > > > > > >  #include <linux/rbtree.h>
> > > > > > > > +#include <linux/usb.h>
> > > > > > > >
> > > > > > > >  #include <drm/drm.h>
> > > > > > > >  #include <drm/drm_drv.h>
> > > > > > > > @@ -1055,3 +1056,38 @@ void drm_prime_gem_destroy(struct drm_gem_object *obj, struct sg_table *sg)
> > > > > > > >   dma_buf_put(dma_buf);
> > > > > > > >  }
> > > > > > > >  EXPORT_SYMBOL(drm_prime_gem_destroy);
> > > > > > > > +
> > > > > > > > +/**
> > > > > > > > + * drm_gem_prime_import_usb - helper library implementation of the import callback for USB devices
> > > > > > > > + * @dev: drm_device to import into
> > > > > > > > + * @dma_buf: dma-buf object to import
> > > > > > > > + *
> > > > > > > > + * This is an implementation of drm_gem_prime_import() for USB-based devices.
> > > > > > > > + * USB devices cannot perform DMA directly. This function selects the USB host
> > > > > > > > + * controller as DMA device instead. Drivers can use this as their
> > > > > > > > + * &drm_driver.gem_prime_import implementation.
> > > > > > > > + *
> > > > > > > > + * See also drm_gem_prime_import().
> > > > > > > > + */
> > > > > > > > +#ifdef CONFIG_USB
> > > > > > > > +struct drm_gem_object *drm_gem_prime_import_usb(struct drm_device *dev,
> > > > > > > > +                                         struct dma_buf *dma_buf)
> > > > > > > > +{
> > > > > > > > + struct usb_device *udev;
> > > > > > > > + struct device *usbhost;
> > > > > > > > +
> > > > > > > > + if (dev->dev->bus != &usb_bus_type)
> > > > > > > > +         return ERR_PTR(-ENODEV);
> > > > > > > > +
> > > > > > > > + udev = interface_to_usbdev(to_usb_interface(dev->dev));
> > > > > > > > + if (!udev->bus)
> > > > > > > > +         return ERR_PTR(-ENODEV);
> > > > > > > > +
> > > > > > > > + usbhost = udev->bus->controller;
> > > > > > > > + if (!usbhost || !usbhost->dma_mask)
> > > > > > > > +         return ERR_PTR(-ENODEV);
> > > > > > >
> > > > > > > If individual USB drivers need access to this type of thing, shouldn't
> > > > > > > that be done in the USB core itself?
> > > > > > >
> > > > > > > {hint, yes}
> > > > > > >
> > > > > > > There shouldn't be anything "special" about a DRM driver that needs this
> > > > > > > vs. any other driver that might want to know about DMA things related to
> > > > > > > a specific USB device.  Why isn't this an issue with the existing
> > > > > > > storage or v4l USB devices?
> > > > > >
> > > > > > The trouble is that this is a regression fix for 5.9, because the dma-api
> > > > > > got more opinionated about what it allows. The proper fix is a lot more
> > > > > > invasive (we essentially need to rework the drm_prime.c to allow dma-buf
> > > > > > importing for just cpu access), and that's a ton more invasive than just a
> > > > > > small patch with can stuff into stable kernels.
> > > > > >
> > > > > > This here is ugly, but it should at least get rid of black screens again.
> > > > > >
> > > > > > I think solid FIXME comment explaining the situation would be good.
> > > > >
> > > > > Why can't I take a USB patch for a regression fix?  Is drm somehow
> > > > > stand-alone that you make changes here that should belong in other
> > > > > subsystems?
> > > > >
> > > > > {hint, it shouldn't be}
> > > > >
> > > > > When you start poking in the internals of usb controller structures,
> > > > > that logic belongs in the USB core for all drivers to use, not in a
> > > > > random tiny subsystem where no USB developer will ever notice it?  :)
> > > >
> > > > Because the usb fix isn't the right fix here, it's just the duct-tape.
> > > > We don't want to dig around in these internals, it's just a convenient
> > > > way to shut up the dma-api until drm has sorted out its confusion.
> > > >
> > > > We can polish the turd if you want, but the thing is, it's still a turd ...
> > > >
> > > > The right fix is to change drm_prime.c code to not call dma_map_sg
> > > > when we don't need it. The problem is that roughly 3 layers of code
> > > > (drm_prime, dma-buf, gem shmem helpers) are involved. Plus, since
> > > > drm_prime is shared by all drm drivers, all other drm drivers are
> > > > impacted too. We're not going to be able to cc: stable that kind of
> > > > stuff. Thomas actually started with that series, until I pointed out
> > > > how bad things really are.
> > > >
> > > > And before you ask: The dma-api change makes sense, and dma-api vs drm
> > > > relations are strained since years, so we're not going ask for some
> > > > hack there for our abuse to paper over the regression. I've been in
> > > > way too many of those threads, only result is shouting and failed
> > > > anger management.
> > >
> > > Let's do it right.  If this is a regression from 5.9, it isn't a huge
> > > one as that kernel was released last October.  I don't like to see this
> > > messing around with USB internals in non-USB-core code please.
> >
> > So regressions don't count if it takes people more than 1 release to catch them?
> >
> > New to me ... It does explain though why people really, really, really
> > don't want to upgrade kernels.
>
> No, don't be silly.  I mean that you can take the time (i.e. a week) to
> do it right here.
>
> > The thing is, the proper drm refactor will land earliest in 5.13, if
> > someone can figure it out, and there's no surprises/breakage in
> > drivers. If we're unlucky, it'll be later.
>
> A whole refactor seems really odd when all you need is access to the
> proper dma mask stuff, right?  That's what this patch is doing.  That's
> what the storage drivers need as well, so I don't really understand why
> drm is so unique here with regards to this.
>
> > I'll work with Thomas to get this fixed some other way, with zero
> > usage of anything related to usb. But letting black screen regressions
> > hang out there simply because we absolutely have to have clean code
> > always: Nope, not going to happen.
>
> I'm just saying to not put USB core code/logic in a random driver, which
> I'm sure you can agree with.  You wouldn't want to see something like
> that in a usb gadget driver for a drm device, right?  :)
>
> I don't understand what is so convoluted here with DRM and why this
> became an issue for that subsystem only on 5.9 and no other subsystem
> that does this same type of thing for USB drivers.

Once more the problem.

- drm_prime code results in a calling dma_map_sg when importing a
dma-buf, on all devices. Even when your device never does dma, and all
dma-buf access is done through the cpu side using dma_buf_vmap, like
is the case for all usb drm drivers.
- this was harmless before the patch that landed in 5.9, even when
your device never had dma needs
- this is obviously not very cool, but also about a 10 year old
mistake, and so it has leaked _everywhere_ in the graphics subsystem.
You're not going to fix this in one week, since it's kinda been on the
todo list as a "would be nice to clean this up" for 10 years by now

All we need is some device (we really don't care which) where we can
dma_map_sg. Host device is convenient, but we can take any other, it
really doesn't matter to "fix" the regression.

So really, you want absolutely none of this in the usb subsystem,
since it really doesn't make sense at all technically. All it does is
keep drm_prime code going for another release so we can maybe fix this
for real, and meanwhile stuff isn't broken.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
