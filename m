Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2981648B4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 16:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E40D16EC2B;
	Wed, 19 Feb 2020 15:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6256EC2A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 15:34:53 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id p125so24162850oif.10
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 07:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aHUoPX7dN06V5U0I2mbGybnLscOkc5GUuXDULP0UiIU=;
 b=X5QmEn+YWPB6W5DAC1jF7hr+vJjfJgt4h0rMOfryVpi0vbJH67ljzsXC7odz4EYrhR
 fIKDjEU2OHm1HJMmvF6gi2o8Ijc8/RfnihtBoHCSqAkyLNB5xjn4TuQBvlQ7E9Hy/Au/
 4l5otRt0OJQ4iXyBUaSchAMerOZB+muOJdc4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aHUoPX7dN06V5U0I2mbGybnLscOkc5GUuXDULP0UiIU=;
 b=mOjTq6gUY63CAI8zZ4Thu346/oFyTTbDyO8p/FT+YO3WM8SQ8G5tDrCQzvkfgm+9yN
 AOuPJ2CqniFwJWPBRFRgwWtTcxzszghRD0KY8eA5+A94WYOeRBWonE+jwnVDy1yBtvAl
 s88qDoFMZgzFf9/NOXeW1yPIO2epLjuxGGL65Z03jpt8G0ZUkM4dKAe9/LzoKHUUimVk
 BPY5JeSm8I9C6NEQHlbfEFmCr9fUiK/9lZNkvPYkCRFWAEvcpjNolIk9fE1mRfYZ3vDX
 f4tLp9ZdAgLv5vVLBRbEAmoVoxNAF5k4nJyRp/IMEAw4icoj6bz9gYK4ZiCPFlV2ZOz7
 4WCw==
X-Gm-Message-State: APjAAAXYR2UPhZiyw8AisZxGnyrwf+PogUu0ahsHur48y3xNKJdjoWBv
 wIkKIvT1QDv2IZBRuYb2EALgg0kMuMD8x/I9TqKTbQ==
X-Google-Smtp-Source: APXvYqwdZeJPvXmld/rFcIa3wtEGnzuoWD6dhBotpKv3UThJz3/qmu5p7zPezxZWFE7jbyfHdCn5XyCFyicqC4/LBZ8=
X-Received: by 2002:aca:d985:: with SMTP id q127mr4785866oig.132.1582126492959; 
 Wed, 19 Feb 2020 07:34:52 -0800 (PST)
MIME-Version: 1.0
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-24-daniel.vetter@ffwll.ch>
 <20200219144711.GO5070@pendragon.ideasonboard.com>
In-Reply-To: <20200219144711.GO5070@pendragon.ideasonboard.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 19 Feb 2020 16:34:41 +0100
Message-ID: <CAKMK7uFfngw9Xf0YS97SLsKDh8y4zhVoBtnajpa45+ROuDZCFw@mail.gmail.com>
Subject: Re: [PATCH 23/52] drm: manage drm_minor cleanup with drmm_
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 19, 2020 at 3:47 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Daniel,
>
> Thank you for the patch.
>
> On Wed, Feb 19, 2020 at 11:20:53AM +0100, Daniel Vetter wrote:
> > The cleanup here is somewhat tricky, since we can't tell apart the
> > allocated minor index from 0. So register a cleanup action first, and
> > if the index allocation fails, unregister that cleanup action again to
> > avoid bad mistakes.
> >
> > The kdev for the minor already handles NULL, so no problem there.
> >
> > Hence add drmm_remove_action() to the drm_managed library.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  drivers/gpu/drm/drm_drv.c     | 74 +++++++++++++----------------------
> >  drivers/gpu/drm/drm_managed.c | 28 +++++++++++++
> >  include/drm/drm_managed.h     |  4 ++
> >  3 files changed, 59 insertions(+), 47 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index 1f7ab88d9435..03a1fb377830 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -93,19 +93,35 @@ static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
> >       }
> >  }
> >
> > +static void drm_minor_alloc_release(struct drm_device *dev, void *data)
> > +{
> > +     struct drm_minor *minor = data;
> > +     unsigned long flags;
> > +
> > +     put_device(minor->kdev);
> > +
> > +     spin_lock_irqsave(&drm_minor_lock, flags);
> > +     idr_remove(&drm_minors_idr, minor->index);
> > +     spin_unlock_irqrestore(&drm_minor_lock, flags);
> > +}
> > +
> >  static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
> >  {
> >       struct drm_minor *minor;
> >       unsigned long flags;
> >       int r;
> >
> > -     minor = kzalloc(sizeof(*minor), GFP_KERNEL);
> > +     minor = drmm_kzalloc(dev, sizeof(*minor), GFP_KERNEL);
> >       if (!minor)
> >               return -ENOMEM;
> >
> >       minor->type = type;
> >       minor->dev = dev;
> >
> > +     r = drmm_add_action(dev, drm_minor_alloc_release, minor);
> > +     if (r)
> > +             return r;
> > +
> >       idr_preload(GFP_KERNEL);
> >       spin_lock_irqsave(&drm_minor_lock, flags);
> >       r = idr_alloc(&drm_minors_idr,
> > @@ -116,47 +132,18 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
> >       spin_unlock_irqrestore(&drm_minor_lock, flags);
> >       idr_preload_end();
> >
> > -     if (r < 0)
> > -             goto err_free;
> > +     if (r < 0) {
> > +             drmm_remove_action(dev, drm_minor_alloc_release, minor);
> > +             return r;
> > +     }
> >
> >       minor->index = r;
> > -
> >       minor->kdev = drm_sysfs_minor_alloc(minor);
> > -     if (IS_ERR(minor->kdev)) {
> > -             r = PTR_ERR(minor->kdev);
> > -             goto err_index;
> > -     }
> > +     if (IS_ERR(minor->kdev))
> > +             return PTR_ERR(minor->kdev);
> >
> >       *drm_minor_get_slot(dev, type) = minor;
> >       return 0;
> > -
> > -err_index:
> > -     spin_lock_irqsave(&drm_minor_lock, flags);
> > -     idr_remove(&drm_minors_idr, minor->index);
> > -     spin_unlock_irqrestore(&drm_minor_lock, flags);
>
> The need to do the drmm_remove_action() dance, with the need for
> drmm_remove_action() in the first place, just to remove those three
> lines of manual cleanup really seems overkill to me. Automation is nice,
> but not everything is a nail even if all you have is a hammer.

Still the same thing, I wanted to have onion unwinding for everything.
If we keep some things outside of drmm_ then I have to carefully
interleave the drm_managed_release with the cleanup actions, and
review that across all drivers. Which I had to do anyway, but this way
it's at least somewhat of a split-up.

Essentially for a safe conversion you need to look at what's the last
thing the code right before drm_managed_release manually cleans up
(whether drm core or drivers doesn't matter, so lots of reviewing).
And then converting that over to drmm_. Repeat until everything is
handled.

If you decide to not handle something because it's not worth it the
review complexity across all our drivers goes through the roof (and
there's soooooooo many special cases). Plus the core cleanup sequence
gets real nasty where you have to interleave all kinds of things.

I guess you could say I could just register one action for the
drm_dev_fini stuff, but I kinda wanted to start out with an example of
what this could look like in driver cleanup code. Ofc since it's core
code there's not going to be amplified code savings, but as an example
it's still useful I think.
-Daniel

> > -err_free:
> > -     kfree(minor);
> > -     return r;
> > -}
> > -
> > -static void drm_minor_free(struct drm_device *dev, unsigned int type)
> > -{
> > -     struct drm_minor **slot, *minor;
> > -     unsigned long flags;
> > -
> > -     slot = drm_minor_get_slot(dev, type);
> > -     minor = *slot;
> > -     if (!minor)
> > -             return;
> > -
> > -     put_device(minor->kdev);
> > -
> > -     spin_lock_irqsave(&drm_minor_lock, flags);
> > -     idr_remove(&drm_minors_idr, minor->index);
> > -     spin_unlock_irqrestore(&drm_minor_lock, flags);
> > -
> > -     kfree(minor);
> > -     *slot = NULL;
> >  }
> >
> >  static int drm_minor_register(struct drm_device *dev, unsigned int type)
> > @@ -678,16 +665,16 @@ int drm_dev_init(struct drm_device *dev,
> >       if (drm_core_check_feature(dev, DRIVER_RENDER)) {
> >               ret = drm_minor_alloc(dev, DRM_MINOR_RENDER);
> >               if (ret)
> > -                     goto err_minors;
> > +                     goto err;
> >       }
> >
> >       ret = drm_minor_alloc(dev, DRM_MINOR_PRIMARY);
> >       if (ret)
> > -             goto err_minors;
> > +             goto err;
> >
> >       ret = drm_legacy_create_map_hash(dev);
> >       if (ret)
> > -             goto err_minors;
> > +             goto err;
> >
> >       drm_legacy_ctxbitmap_init(dev);
> >
> > @@ -695,7 +682,7 @@ int drm_dev_init(struct drm_device *dev,
> >               ret = drm_gem_init(dev);
> >               if (ret) {
> >                       DRM_ERROR("Cannot initialize graphics execution manager (GEM)\n");
> > -                     goto err_ctxbitmap;
> > +                     goto err;
> >               }
> >       }
> >
> > @@ -708,10 +695,6 @@ int drm_dev_init(struct drm_device *dev,
> >  err_setunique:
> >       if (drm_core_check_feature(dev, DRIVER_GEM))
> >               drm_gem_destroy(dev);
> > -err_ctxbitmap:
> > -err_minors:
> > -     drm_minor_free(dev, DRM_MINOR_PRIMARY);
> > -     drm_minor_free(dev, DRM_MINOR_RENDER);
> >  err:
> >       drm_managed_release(dev);
> >
> > @@ -776,9 +759,6 @@ void drm_dev_fini(struct drm_device *dev)
> >
> >       if (drm_core_check_feature(dev, DRIVER_GEM))
> >               drm_gem_destroy(dev);
> > -
> > -     drm_minor_free(dev, DRM_MINOR_PRIMARY);
> > -     drm_minor_free(dev, DRM_MINOR_RENDER);
> >  }
> >  EXPORT_SYMBOL(drm_dev_fini);
> >
> > diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
> > index d8a484e19830..fb44fe65c2cd 100644
> > --- a/drivers/gpu/drm/drm_managed.c
> > +++ b/drivers/gpu/drm/drm_managed.c
> > @@ -132,6 +132,34 @@ int __drmm_add_action(struct drm_device *dev,
> >  }
> >  EXPORT_SYMBOL(__drmm_add_action);
> >
> > +void drmm_remove_action(struct drm_device *dev,
> > +                     drmres_release_t action,
> > +                     void *data)
> > +{
> > +     struct drmres *dr = NULL, *tmp;
> > +     unsigned long flags;
> > +
> > +     if (!data)
> > +             return;
> > +
> > +     spin_lock_irqsave(&dev->managed.lock, flags);
> > +     list_for_each_entry(tmp, &dev->managed.resources, node.entry) {
> > +             if (tmp->node.release == action &&
> > +                 * (void **) tmp->data == data) {
>
> As before, &tmp->data, and let's rename tmp.
>
> > +                     dr = tmp;
> > +                     del_dr(dev, dr);
> > +                     break;
> > +             }
> > +     }
> > +     spin_unlock_irqrestore(&dev->managed.lock, flags);
> > +
> > +     if (WARN_ON(!dr))
> > +             return;
> > +
> > +     kfree(dr);
> > +}
> > +EXPORT_SYMBOL(drmm_remove_action);
> > +
> >  void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp)
> >  {
> >       struct drmres *dr;
> > diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> > index 240edd395e88..df30f9355902 100644
> > --- a/include/drm/drm_managed.h
> > +++ b/include/drm/drm_managed.h
> > @@ -14,6 +14,10 @@ int __must_check __drmm_add_action(struct drm_device *dev,
> >                                  drmres_release_t action,
> >                                  void *data, const char *name);
> >
> > +void drmm_remove_action(struct drm_device *dev,
> > +                     drmres_release_t action,
> > +                     void *data);
> > +
> >  void drmm_add_final_kfree(struct drm_device *dev, void *parent);
> >
> >  void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp) __malloc;
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
