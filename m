Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FAA19BEE8
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 11:50:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D0686EA32;
	Thu,  2 Apr 2020 09:50:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A666EA33
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 09:50:12 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id x11so2772099otp.6
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Apr 2020 02:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lJ+Gd7zl++AIB6vBVszZaPVX2japyNbU4sA0+OrePBI=;
 b=bBDY2R8cak/8ek7OacyNwzhuQwvfjeh/35KuH0gXZjbZna0w3p5SxXtaFzoBRsqSr7
 NwqNjLlbd70wptaH4Dwkf9ArL+E+Z0dgAs0mOC1BkNGKy9EhcejtG3tMePzo3vKK8HUz
 azPrOixJQ7lQjJ2LWsTbFj2ygZEdgIVeBSrp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lJ+Gd7zl++AIB6vBVszZaPVX2japyNbU4sA0+OrePBI=;
 b=eAnirUV/2MNCG9NsCGnChIjBCVSDnct41imJouEjmZuw7Dqo5K6fwu0jb+PO+RWfRS
 GdVaCV3NnAQyX5C1sk0hjXb1vYhuwIMxp7CfZ51mpxKmwA5fUTjp67An9NPbUDUCpMGC
 xk4rEK7xipdWFurUXU/aWdqA/LQy0cR9PmSsDwGj94PEr9CZVy3oClcjOEcJ/lT80N6a
 j3Y3cjO7BJsZdgCLekLyuxlJCDG9yXJ43JpwOIqJBKuzoT58o6sYL5Lirbh66P+P9xNc
 p640FfB8svp6X63WWXatekJLwlQdsf1ZG57VV5SsVaTyz/oGo4iryFhu58Y0GbVWYSPU
 Pivw==
X-Gm-Message-State: AGi0PuaB0tOKvAa9c5PatQ7kk9G+XFhBaYyCAwd7Eqtw5LTBv+pfm3GZ
 96GxEQDX76JWc0CHZ7wks9xWvSpXA6f9I4IEJR92gA==
X-Google-Smtp-Source: APiQypKU6BkcGaf89tzW7fP1bFinCHE1e+HZazBqvXPg2x0Mpo/dEjgvHuHcKxI8P2/Uu5Phw7SsPaXevXTj2OI4j3c=
X-Received: by 2002:a05:6830:15d4:: with SMTP id
 j20mr1648690otr.303.1585821011449; 
 Thu, 02 Apr 2020 02:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
 <20200323144950.3018436-20-daniel.vetter@ffwll.ch>
 <20200402005008.GA18964@pendragon.ideasonboard.com>
 <CAKMK7uGqNEdaxLcpeW9sp-NM_OfOyL-duNzp_XN1WOHdOS3HfQ@mail.gmail.com>
 <20200402093950.GA4745@pendragon.ideasonboard.com>
In-Reply-To: <20200402093950.GA4745@pendragon.ideasonboard.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 2 Apr 2020 11:50:00 +0200
Message-ID: <CAKMK7uEDRW5u2Uceb2-ytDdkSjXmszcBufqW1YOMyKPjdNnf9w@mail.gmail.com>
Subject: Re: [PATCH 19/51] drm: Cleanups after drmm_add_final_kfree rollout
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 2, 2020 at 11:39 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Daniel,
>
> On Thu, Apr 02, 2020 at 07:17:40AM +0200, Daniel Vetter wrote:
> > On Thu, Apr 2, 2020 at 2:50 AM Laurent Pinchart wrote:
> > > On Mon, Mar 23, 2020 at 03:49:18PM +0100, Daniel Vetter wrote:
> > > > A few things:
> > > > - Update the example driver in the documentation.
> > > > - We can drop the old kfree in drm_dev_release.
> > > > - Add a WARN_ON check in drm_dev_register to make sure everyone calls
> > > >   drmm_add_final_kfree and there's no leaks.
> > > >
> > > > v2: Restore the full cleanup, I accidentally left some moved code
> > > > behind when fixing the bisectability of the series.
> > > >
> > > > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > > > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > > Cc: Dan Carpenter <dan.carpenter@oracle.com>
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_drv.c | 12 +++++-------
> > > >  1 file changed, 5 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > > > index 877ded348b6e..7f9d7ea543a0 100644
> > > > --- a/drivers/gpu/drm/drm_drv.c
> > > > +++ b/drivers/gpu/drm/drm_drv.c
> > > > @@ -297,8 +297,6 @@ void drm_minor_release(struct drm_minor *minor)
> > > >   *
> > > >   *           drm_mode_config_cleanup(drm);
> > > >   *           drm_dev_fini(drm);
> > > > - *           kfree(priv->userspace_facing);
> > > > - *           kfree(priv);
> > > >   *   }
> > > >   *
> > > >   *   static struct drm_driver driver_drm_driver = {
> > > > @@ -326,10 +324,11 @@ void drm_minor_release(struct drm_minor *minor)
> > > >   *                   kfree(drm);
> > > >   *                   return ret;
> > > >   *           }
> > > > + *           drmm_add_final_kfree(drm, priv);
> > > >   *
> > > >   *           drm_mode_config_init(drm);
> > > >   *
> > > > - *           priv->userspace_facing = kzalloc(..., GFP_KERNEL);
> > > > + *           priv->userspace_facing = drmm_kzalloc(..., GFP_KERNEL);
> > > >   *           if (!priv->userspace_facing)
> > > >   *                   return -ENOMEM;
> > > >   *
> > > > @@ -837,10 +836,7 @@ static void drm_dev_release(struct kref *ref)
> > > >
> > > >       drm_managed_release(dev);
> > > >
> > > > -     if (!dev->driver->release && !dev->managed.final_kfree) {
> > > > -             WARN_ON(!list_empty(&dev->managed.resources));
> > > > -             kfree(dev);
> > > > -     } else if (dev->managed.final_kfree)
> > > > +     if (dev->managed.final_kfree)
> > > >               kfree(dev->managed.final_kfree);
> > > >  }
> > > >
> > > > @@ -961,6 +957,8 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
> > > >       if (!driver->load)
> > > >               drm_mode_config_validate(dev);
> > > >
> > > > +     WARN_ON(!dev->managed.final_kfree);
> > >
> > > That's too aggressive. Driver freeing their private object in .release()
> > > isn't wrong. I'd even go as far as saying that it should be the norm,
> > > until we manage to find a better way to handle that (which this series
> > > doesn't achieve). Many drivers need to allocate resources at probe time
> > > before they get a chance to init the drm device. Those resources must be
> > > released in the error handling paths of probe. By requiring
> > > drmm_add_final_kfree(), you're making that much more complex. I can't
> > > release those resources in the error path anymore after calling
> > > drmm_add_final_kfree(), or they will be released twice. And I can't rely
> > > on drmm_* to release them in all cases, as the error path may be hit
> > > before touching anything drm-related.
> > >
> > > Until we figure out a good way forward and test it on a significant
> > > number of drivers, let's not add WARN_ON() that will be hit with the
> > > majority of drivers, forcing them to be converted to something that is
> > > clearly half-baked.
> >
> > Hm, is this conjecture, or did you actually hit this WARN_ON with a
> > driver? Because I did audit them all, none should hit this, all are
> > fixed up.
>
> I'm sorry, I should have been clear about that. I hit the issue
> yesterday after rebasing the Xilinx ZynqMP DPSUB driver. I took Sam's
> suggestion to embed struct drm_device instead of allocating it
> dynamically, and then hit the WARN_ON. You're of course not responsible
> for a driver that is still out-of-tree. I then looked at how to convert
> other drivers I work on in a similar way (rcar-du and omapdrm in
> particular), and realized it could actually make cleanup more complex to
> always enforce usage of managed memory for everything.
>
> I apologize for the harsh tone of the previous e-mail, you certainly
> didn't deserve that (even more so as I've only reviewed the initial
> version of the series).
>
> > Also, I'm now actually going through all the places where I've added
> > the drmm_add_final_kfree and remove it again, they are _all_ about 5
> > lines after the kzalloc that allocates the driver structure which has
> > drm_device embedded.
> >
> > So I'd like to understand where you get your seemingly rather sure
> > convinction from that this is a horrible mistake here ...
>
> Overall this features simplifies lots of drivers, and, even more
> importantly, remove lots of actual or potential bugs, so it's far from
> horrible. My words were too harsh, and I apologize for that again.
>
> I however still think that before enforcing a model where everything has
> to be managed, we need to try and deploy it to more drivers, especially
> ones that initialize the drm_device fairly late in the probe process.
> That's where it gets painful, as the unwind-style cleanup path needs to
> handle memory free, but as soon as drmm_add_final_kfree() is called,
> some of the code right at the bottom of the unwind stack suddenly needs
> to be skipped. In some cases we can rearrange the code to initialize the
> drm_device earlier, before doing much other initialization that would
> need a cleanup unwind, but it's not always possible. I'm thinking in
> particular about drivers that would expose multiple interfaces and want
> to embed the data structures that correspond to all of them, or about
> drivers based on the component framework (or similar systems). For these
> drivers a manual .release() is needed, and while the current
> implementation of the managed helpers doesn't prevent that, it forbits
> embedding drm_device in situations where there nothing to final_kfree.

I'd need to look in detail at your code, but a few things I've seen
from all other drivers:
- The unroll code shouldn't ever get more complicated. Before you call
drm_dev_init you have to explicitly kfree() your own allocation that
contains drm_device. After that call you have to use drm_dev_put. The
addition of drmm_add_final_kfree has changed nothing of that. Whether
using drmm_add_final_kfree, or having an explicit kfree in your
drm_driver->release callback doesn't change that, in both cases this
kfree will happen when the final drm_dev_put() is called.

- Wrt why is this mandatory? If you unload your driver with KASAN
enabled and have not set the final_kfree pointer, but instead free the
drm_device at the least step in your drm_driver->release hook, you'll
splat. That's why my patch series was so tedious and had to change
everything in a multi-step process, and why I didn't want to blow it
up to 100 patches to also include the removal of drmm_add_final_kfree.
I'm working on that right now, it's somewhere between 40-50 patches on
top (ok so not quite all of them are required, I've done a handful of
drive-by cleanups in some drivers too). So yeah hopefully real soon
the drmm_add_final_kfree should be gone again.

Hope this explains a bit what's going on here, I'm happy to look at
your driver code specifically and come up with ideas how to structure
it. Thus far (I think about 25 drivers in with my devm_drm_dev_alloc
roll-out, which will clean this all up for good) I've not encountered
any surprises.
-Daniel

>
> > > > +
> > > >       if (drm_dev_needs_global_mutex(dev))
> > > >               mutex_lock(&drm_global_mutex);
> > > >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
