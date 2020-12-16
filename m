Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DEA2DC237
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 15:31:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717966E1CE;
	Wed, 16 Dec 2020 14:31:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF31A6E1CE
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 14:31:52 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2DB352CF;
 Wed, 16 Dec 2020 15:31:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608129111;
 bh=ppGuTJOO/QoHIHyt/YT/cs7UU2AuvaCdCz6LTeS6py8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QW/VBa/kQ7Vj665757KIALIyUODbBrDDYrXXFpHMf3LISqa+8iRmIsz+B6hmwa/8e
 xFmSxQ5lvqnB0ZvpFWZACst35XiPtP3wEUD5v+JjiIVz6TzqcB2SZpy9cTgdHXRaQo
 st4gx6oTpiiNcS79VxWqcAjHmEaOstLeeMcs34rw=
Date: Wed, 16 Dec 2020 16:31:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 2/3] drm: Use a const drm_driver for legacy PCI devices
Message-ID: <X9oaUNN1TYPwmzT0@pendragon.ideasonboard.com>
References: <20201215203126.10175-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201215203126.10175-3-laurent.pinchart+renesas@ideasonboard.com>
 <X9oZrB2Y+/eUrXwf@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X9oZrB2Y+/eUrXwf@phenom.ffwll.local>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Edmund Dea <edmund.j.dea@intel.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 16, 2020 at 03:29:00PM +0100, Daniel Vetter wrote:
> On Tue, Dec 15, 2020 at 10:31:25PM +0200, Laurent Pinchart wrote:
> > Now that the legacy PCI support code doesn't need to write to the
> > drm_driver structure, it can be treated as const through the whole DRM
> > core, unconditionally. This allows declaring the structure as const in
> > all drivers, removing one possible attack vector.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> I didn't inquire the compiler whether you got all the combos right, but
> looks complete.

I've compile-tested with CONFIG_DRM_LEGACY enabled and disabled, and
CONFIG_PCI enabled, so we should be good.

> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> > ---
> >  drivers/gpu/drm/drm_drv.c |  4 ----
> >  drivers/gpu/drm/drm_pci.c |  8 +++++---
> >  include/drm/drm_device.h  |  4 ----
> >  include/drm/drm_legacy.h  | 10 ++++++----
> >  4 files changed, 11 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index 734303802bc3..3f57e880685e 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -589,11 +589,7 @@ static int drm_dev_init(struct drm_device *dev,
> >  
> >  	kref_init(&dev->ref);
> >  	dev->dev = get_device(parent);
> > -#ifdef CONFIG_DRM_LEGACY
> > -	dev->driver = (struct drm_driver *)driver;
> > -#else
> >  	dev->driver = driver;
> > -#endif
> >  
> >  	INIT_LIST_HEAD(&dev->managed.resources);
> >  	spin_lock_init(&dev->managed.lock);
> > diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
> > index dfb138aaccba..5370e6b492fd 100644
> > --- a/drivers/gpu/drm/drm_pci.c
> > +++ b/drivers/gpu/drm/drm_pci.c
> > @@ -201,7 +201,7 @@ static void drm_pci_agp_init(struct drm_device *dev)
> >  
> >  static int drm_get_pci_dev(struct pci_dev *pdev,
> >  			   const struct pci_device_id *ent,
> > -			   struct drm_driver *driver)
> > +			   const struct drm_driver *driver)
> >  {
> >  	struct drm_device *dev;
> >  	int ret;
> > @@ -255,7 +255,8 @@ static int drm_get_pci_dev(struct pci_dev *pdev,
> >   *
> >   * Return: 0 on success or a negative error code on failure.
> >   */
> > -int drm_legacy_pci_init(struct drm_driver *driver, struct pci_driver *pdriver)
> > +int drm_legacy_pci_init(const struct drm_driver *driver,
> > +			struct pci_driver *pdriver)
> >  {
> >  	struct pci_dev *pdev = NULL;
> >  	const struct pci_device_id *pid;
> > @@ -300,7 +301,8 @@ EXPORT_SYMBOL(drm_legacy_pci_init);
> >   * Unregister a DRM driver shadow-attached through drm_legacy_pci_init(). This
> >   * is deprecated and only used by dri1 drivers.
> >   */
> > -void drm_legacy_pci_exit(struct drm_driver *driver, struct pci_driver *pdriver)
> > +void drm_legacy_pci_exit(const struct drm_driver *driver,
> > +			 struct pci_driver *pdriver)
> >  {
> >  	struct drm_device *dev, *tmp;
> >  
> > diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> > index bd5abe7cd48f..939904ae88fc 100644
> > --- a/include/drm/drm_device.h
> > +++ b/include/drm/drm_device.h
> > @@ -76,11 +76,7 @@ struct drm_device {
> >  	} managed;
> >  
> >  	/** @driver: DRM driver managing the device */
> > -#ifdef CONFIG_DRM_LEGACY
> > -	struct drm_driver *driver;
> > -#else
> >  	const struct drm_driver *driver;
> > -#endif
> >  
> >  	/**
> >  	 * @dev_private:
> > diff --git a/include/drm/drm_legacy.h b/include/drm/drm_legacy.h
> > index 852d7451eeb1..8ed04e9be997 100644
> > --- a/include/drm/drm_legacy.h
> > +++ b/include/drm/drm_legacy.h
> > @@ -198,8 +198,10 @@ struct drm_dma_handle *drm_pci_alloc(struct drm_device *dev, size_t size,
> >  				     size_t align);
> >  void drm_pci_free(struct drm_device *dev, struct drm_dma_handle *dmah);
> >  
> > -int drm_legacy_pci_init(struct drm_driver *driver, struct pci_driver *pdriver);
> > -void drm_legacy_pci_exit(struct drm_driver *driver, struct pci_driver *pdriver);
> > +int drm_legacy_pci_init(const struct drm_driver *driver,
> > +			struct pci_driver *pdriver);
> > +void drm_legacy_pci_exit(const struct drm_driver *driver,
> > +			 struct pci_driver *pdriver);
> >  
> >  #else
> >  
> > @@ -214,13 +216,13 @@ static inline void drm_pci_free(struct drm_device *dev,
> >  {
> >  }
> >  
> > -static inline int drm_legacy_pci_init(struct drm_driver *driver,
> > +static inline int drm_legacy_pci_init(const struct drm_driver *driver,
> >  				      struct pci_driver *pdriver)
> >  {
> >  	return -EINVAL;
> >  }
> >  
> > -static inline void drm_legacy_pci_exit(struct drm_driver *driver,
> > +static inline void drm_legacy_pci_exit(const struct drm_driver *driver,
> >  				       struct pci_driver *pdriver)
> >  {
> >  }

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
