Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C1C1A28E8
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 20:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6462C6EAB6;
	Wed,  8 Apr 2020 18:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9466EAB6;
 Wed,  8 Apr 2020 18:55:56 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 42C6A8051C;
 Wed,  8 Apr 2020 20:55:54 +0200 (CEST)
Date: Wed, 8 Apr 2020 20:55:53 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 02/44] drm: Add devm_drm_dev_alloc macro
Message-ID: <20200408185552.GA22814@ravnborg.org>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-3-daniel.vetter@ffwll.ch>
 <20200408065714.GC14965@ravnborg.org>
 <20200408121147.GL3456981@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408121147.GL3456981@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=P-IC7800AAAA:8
 a=P1BnusSwAAAA:8 a=QyXUC8HyAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=25-AhOLfAAAA:8 a=vnx_9W7hNzymx3mj7ioA:9 a=CjuIK1q_8ugA:10
 a=d3PnA9EDa4IxuAV0gXij:22 a=D0XLA9XvdZm18NrgonBM:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=dnuY3_Gu-P7Vi9ynLKQe:22 a=pHzHmUro8NiASowvMSCR:22
 a=nt3jZW36AmriUCFCBwmW:22
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel.

On Wed, Apr 08, 2020 at 02:11:47PM +0200, Daniel Vetter wrote:
> On Wed, Apr 08, 2020 at 08:57:14AM +0200, Sam Ravnborg wrote:
> > Hi Daniel.
> > 
> > Finally managed to dive into this..
> > 
> > Maybe I need more coffee, it is still morning here.
> > But alas this patch triggered a few comments.
> > 
> > 	Sam
> > 
> > On Fri, Apr 03, 2020 at 03:57:46PM +0200, Daniel Vetter wrote:
> > > The kerneldoc is only added for this new function. Existing kerneldoc
> > > and examples will be udated at the very end, since once all drivers
> > > are converted over to devm_drm_dev_alloc we can unexport a lot of
> > > interim functions and make the documentation for driver authors a lot
> > > cleaner and less confusing. There will be only one true way to
> > > initialize a drm_device at the end of this, which is going to be
> > > devm_drm_dev_alloc.
> > 
> > This changelog entry does a poor job describing what the purpose of this
> > change is.
> > Try to read it outside context.
> 
> Something like:
> 
> Add a new macro helper to combine the usual init sequence in drivers,
> consisting of a kzalloc + devm_drm_dev_init + drmm_add_final_kfree
> triplet. This allows us to remove the rather unsightly
> drmm_add_final_kfree from all currently merged drivers.
Much better - thanks!

> 
> This good enough, as an intro paragraph?
> 
> > 
> > 
> > > 
> > > Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_drv.c | 23 +++++++++++++++++++++++
> > >  include/drm/drm_drv.h     | 33 +++++++++++++++++++++++++++++++++
> > >  2 files changed, 56 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > > index 1bb4f636b83c..9e60b784b3ac 100644
> > > --- a/drivers/gpu/drm/drm_drv.c
> > > +++ b/drivers/gpu/drm/drm_drv.c
> > > @@ -739,6 +739,29 @@ int devm_drm_dev_init(struct device *parent,
> > >  }
> > >  EXPORT_SYMBOL(devm_drm_dev_init);
> > >  
> > > +void* __devm_drm_dev_alloc(struct device *parent, struct drm_driver *driver,
> > > +			   size_t size, size_t offset)
> > > +{
> > > +	void *container;
> > > +	struct drm_device *drm;
> > > +	int ret;
> > > +
> > > +	container = kzalloc(size, GFP_KERNEL);
> > > +	if (!container)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	drm = container + offset;
> > > +	ret = devm_drm_dev_init(parent, drm, driver);
> > > +	if (ret) {
> > > +		kfree(container);
> > > +		return ERR_PTR(ret);
> > > +	}
> > > +	drmm_add_final_kfree(drm, container);
> > > +
> > > +	return container;
> > > +}
> > > +EXPORT_SYMBOL(__devm_drm_dev_alloc);
> > > +
> > >  /**
> > >   * drm_dev_alloc - Allocate new DRM device
> > >   * @driver: DRM driver to allocate device for
> > > diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> > > index e7c6ea261ed1..26776be5a21e 100644
> > > --- a/include/drm/drm_drv.h
> > > +++ b/include/drm/drm_drv.h
> > > @@ -626,6 +626,39 @@ int devm_drm_dev_init(struct device *parent,
> > >  		      struct drm_device *dev,
> > >  		      struct drm_driver *driver);
> > >  
> > > +void* __devm_drm_dev_alloc(struct device *parent, struct drm_driver *driver,
> > > +			   size_t size, size_t offset);
> > > +
> > > +/**
> > > + * devm_drm_dev_alloc - Resource managed allocation of a &drm_device instance
> > > + * @parent: Parent device object
> > > + * @driver: DRM driver
> > > + * @type: the type of the struct which contains struct &drm_device
> > > + * @member: the name of the &drm_device within @type.
> > I am confused about the naming here.
> > devm_ implies we allocate something with a lifetime equal that of a
> > driver. So when the driver are gone what we allocate is also gone.
> > Like everythign else devm_ prefixed.
> > 
> > But the lifetime of a drm_device is until the last userspace reference
> > is gone (final drm_dev_put() is called).
> 
> The kerneldoc for this is largely copied from the existing
> devm_drm_dev_init. And yes the lifetime is bound to the device, we do the
> drm_dev_put() when that disappears. Now other users of drm_device might
> still hold references and delay cleanup, but "cleanup is done as a devres
> action" is very much what devm_ signifies.

After discussing this on IRC I took one more look at the code.

We have something like this:

devm_drm_dev_alloc()
 |
 +-> devm_drm_dev_init()
 |    |
 |    +-> drm_dev_init()
 |    |    |
 |    |    +- kref_init(&dev->ref)
 |    |    |
 |    |    +- drmm_add_action(drm_dev_init_release)
 |    |
 |    +-> devm_add_action(devm_drm_dev_init_release)
 |
 +-> drmm_add_final_kfree()


drm_dev_init_release() - does all the release stuff
devm_drm_dev_init_release() do a simple drm_dev_put()

In other words we use the devres functionality to keep track of the
reference count for the structure allocated by devm_drm_dev_alloc()
So the naming makes some sense anyway.

When there are no users left of drm_dev_init() outside drm_drv.c this
can be simplified a little.

After re-reading the code it made sense again.

With the updated changelog:

Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

PS. There is a few trivial checkpatch warnings to look at before pushing
out.

	Sam


> "
> > > + *
> > > + * This allocates and initialize a new DRM device. No device registration is done.
> > > + * Call drm_dev_register() to advertice the device to user space and register it
> > > + * with other core subsystems. This should be done last in the device
> > s/This/Calling drm_dev_register()/ will make this sentence a bit more
> > explicit.
> > 
> > > + * initialization sequence to make sure userspace can't access an inconsistent
> > > + * state.
> > > + *
> > > + * The initial ref-count of the object is 1. Use drm_dev_get() and
> > > + * drm_dev_put() to take and drop further ref-counts.
> > > + *
> > > + * It is recommended that drivers embed &struct drm_device into their own device
> > > + * structure.
> > > + *
> > > + * Note that this manages the lifetime of the resulting &drm_device
> > > + * automatically using devres.
> > Hmm, no this is managed by drmres???
> 
> Yup, the next sentence explains how. And note that we're already using
> this in the form of devm_drm_dev_init. So not clear what's unclear here
> ...
> 
> Thanks for your comments.
> -Daniel
> 
> 
> > 
> > 
> > > + * The DRM device initialized with this function is
> > > + * automatically put on driver detach using drm_dev_put().
> > > + *
> > > + * RETURNS:
> > > + * Pointer to new DRM device, or ERR_PTR on failure.
> > > + */
> > > +#define devm_drm_dev_alloc(parent, driver, type, member) \
> > > +	((type *) __devm_drm_dev_alloc(parent, driver, sizeof(type), \
> > > +				       offsetof(type, member)))
> > > +
> > >  struct drm_device *drm_dev_alloc(struct drm_driver *driver,
> > >  				 struct device *parent);
> > >  int drm_dev_register(struct drm_device *dev, unsigned long flags);
> > > -- 
> > > 2.25.1
> > > 
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
