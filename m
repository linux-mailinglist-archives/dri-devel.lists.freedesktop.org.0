Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 000A6174667
	for <lists+dri-devel@lfdr.de>; Sat, 29 Feb 2020 12:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86A06E2ED;
	Sat, 29 Feb 2020 11:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28CCE6E225;
 Sat, 29 Feb 2020 11:17:14 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7D6E580650;
 Sat, 29 Feb 2020 12:17:11 +0100 (CET)
Date: Sat, 29 Feb 2020 12:17:10 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 03/51] drm: add managed resources tied to drm_device
Message-ID: <20200229111710.GB3674@ravnborg.org>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
 <20200227181522.2711142-4-daniel.vetter@ffwll.ch>
 <20200228224504.GA23961@ravnborg.org>
 <CAKMK7uHPWZ=F2EyqnM7x1GpXY_SGu3e_jGXX4cg0OGyx_+C8ig@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uHPWZ=F2EyqnM7x1GpXY_SGu3e_jGXX4cg0OGyx_+C8ig@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=DRRiGCmsZTF5usyg21AA:9 a=CjuIK1q_8ugA:10
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Marco Felsch <m.felsch@pengutronix.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel.

> > > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > > index 9fcd6ab3c154..3e5627d6eba6 100644
> > > --- a/drivers/gpu/drm/drm_drv.c
> > > +++ b/drivers/gpu/drm/drm_drv.c
> > > @@ -629,6 +629,9 @@ int drm_dev_init(struct drm_device *dev,
> > >       dev->dev = get_device(parent);
> > >       dev->driver = driver;
> > >
> > > +     INIT_LIST_HEAD(&dev->managed.resources);
> > > +     spin_lock_init(&dev->managed.lock);
> > > +
> > >       /* no per-device feature limits by default */
> > >       dev->driver_features = ~0u;
> > >
> > > @@ -828,8 +831,16 @@ static void drm_dev_release(struct kref *ref)
> > >               dev->driver->release(dev);
> > >       } else {
> > >               drm_dev_fini(dev);
> > > -             kfree(dev);
> > > +             if (!dev->managed.final_kfree) {
> > > +                     WARN_ON(!list_empty(&dev->managed.resources));
> > > +                     kfree(dev);
> > > +             }
> >
> > This looks sub-optimal.
> > We cannot be sure a driver have used drmm_add_final_kfree() if it makes
> > use of drmm_.
> > So we may not WARN in all relavant cases.
> > Also, we cannot expect all drivers that uses devmm_ to have managed
> > to get rid of their ->release call-back.
> 
> The above is purely transition code. It gets cleaned up once all
> drivers call drmm_add_final_kfree(). This all disappears again, but
> indeed looks like the interim state isn't quite what we want.
> 
> > So the right thing looks to me like we should move it out to be
> > unconditional. Se we will WARN_ON(!list_empty(&dev->managed.resources))
> > always.
> 
> Until the driver has set drmm_add_final_kfree it's actually dangerous
> to use the drmm stuff. Exactly because of the use-after-free you point
> out below. Hence the warning to make sure there's no release actions.
> I'll shuffle this around to make sure we call kfree last for all
> possible paths and make sure this bisects all correctly.

I was just reviewing the code I had on hand, and did not look further in
the set of patches.
Very good if we can keep is bisectable.

> > > + *
> > > + * Based on drivers/base/devres.c
> > > + */
> > > +
> > > +#include <drm/drm_managed.h>
> > > +
> > > +#include <linux/list.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/spinlock.h>
> > > +
> > > +#include <drm/drm_device.h>
> > > +#include <drm/drm_print.h>
> >
> > It is good practice to group the include files.
> > And drm/ comes after linux/
> 
> I try to put the main header first to make sure it's stand-alone, but
> I guess that works with the header check now? Do I need to do anything
> to get that checked?

The header-check infrastructure was dropped again - see:
fcbb8461fd2376ba3782b5b8bd440c929b8e4980

So including it as the first header in the implmentation
file is likely the best way to keep it self contained.
We will spot errors sooner.

> > > +static __always_inline struct drmres * alloc_dr(drmres_release_t release,
> > > +                                             size_t size, gfp_t gfp, int nid)
> > Why do we force the compiler to inline this?
> > Seems a little agressive.
> 
> It's not for performance, but for kmalloc_trace_caller. No point if
> our caller is always some boring function from drm_managed.c that
> calls alloc_dr. If we force alloc_dr to inline, then we get the caller
> of the drm_managed.c function traced as allocator. Much better.
> 
> (I stole that trick from devres.c)
> 
> I'll add a comment to explain this.
Thanks.

> 
> > All the two users so far uses dev_to_node(dev->dev) for the nid.
> > Maybe let this function take a drm_device * and thus move the
> > calculation to this function?
> 
> Copypastes like that :-) I feel somewhat meh here ...
Well - keep the diff for devres smaller for now and leave it.
It was just an observation.

> > > +     /**
> > > +      * @managed:
> > > +      *
> > > +      * Managed resources linked to the lifetime of this &drm_device as
> > > +      * tracked by @ref.
> > > +      */
> > > +     struct {
> > > +             struct list_head resources;
> > > +             void *final_kfree;
> > > +             spinlock_t lock;
> > > +     } managed;
> >
> > I am missing kernel-doc here.
> > At least document that lock is used to guard access to resources.
> > (s/lock/lock_resources/ ?)
> 
> Dunno why, but the support for name sub-structures seems to have
> broken in kerneldoc. So I can type it, but it's not showing up, so I
> didn't bother. Well I had it, but deleted it again. It's still
> documented to work, but I have no idea what I'm doing wrong.

Most readers prefer the .c files as the source.
I personally read the generated kernel doc when I google
and when I check that my own stuff looks good in kernel-doc format.
So comments are still valueable despite not being picked up by
kernel-doc.
You know this - but I just wanted to encourage you to write the few
lines that may help me and others :-)

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
