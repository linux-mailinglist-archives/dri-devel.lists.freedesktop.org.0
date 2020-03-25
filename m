Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B5D1923BB
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 10:10:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED516E7D2;
	Wed, 25 Mar 2020 09:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B0D6E5D5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 09:09:56 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id 22so1278626otf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 02:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l4QDFW7e4AtPtwbwTUFLSR+MBvjLDaDdnb+W/0pduzE=;
 b=ADxvlj8+gutduKalGkUNpRmWpxFNPzKXJV7nDvrcHNSJSdtojxfF93WLZsdOqmRkLA
 FV+ko2mCpIZCBA+38AQeFzcKHnBeQwwnG7p0338ndfGdObRDjSgO/dr1HWNGu1hRMoAb
 vsi8+EIgdq38kQm5idacVWnr2DM8F2VrGphFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l4QDFW7e4AtPtwbwTUFLSR+MBvjLDaDdnb+W/0pduzE=;
 b=hRD2+ysjWVNDl8DBjL97lRU0QmPYMvsTHkai1DjVDSfnpt35mO8ryC9easxI4Tgr9n
 bWYXJWQQl6EUhkas+/sjKk01RLmxR5VSJBRNT4Gbvt1uaEbZoXM3krHsIDRmNiWc808z
 a2bdCcLiaJck8pCCiLR8nBNW0tBNCtHP1QCz3mrDG8PoEqSuio6ruwAcCfdGo1lNPBuK
 J3zDH//ve7GhzYySjIg4o3FRlPdKjTt6vELeuVn/ssnICaE2XVcpbhRojnNqQOPxPLQD
 wmj6PsS3oAf0n2rZy+eAKPkelqeYPGpIv8vvXzSDGdoadRlNUZ7XS2H8me6WmCJ6xpG6
 mKlw==
X-Gm-Message-State: ANhLgQ2FezefYiC8GZaVM7QGY/+Wb10N0HNa+eLcfdTcXFyUCpGUVSwR
 0WyVYP4bTyswq0taV+LKPopG+V3EFnT+PuuacV+kWA==
X-Google-Smtp-Source: ADFU+vtvDMT0S5dQMnjf6nk5SNOyu7aSdYINUr0/EkRD1mouH5DX9yZoujNzP3y9ubIOOnMJWWbJR4j3gb6D81fa8bQ=
X-Received: by 2002:a9d:2056:: with SMTP id n80mr1776386ota.281.1585127396092; 
 Wed, 25 Mar 2020 02:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200323144950.3018436-23-daniel.vetter@ffwll.ch>
 <20200324203936.3330994-1-daniel.vetter@ffwll.ch>
 <20200324214201.GA26542@ravnborg.org>
In-Reply-To: <20200324214201.GA26542@ravnborg.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 25 Mar 2020 10:09:44 +0100
Message-ID: <CAKMK7uFjkCg+u76=UkrH692SxzSfoyJXGDg0e_1VaZ3LGreRWQ@mail.gmail.com>
Subject: Re: [PATCH] drm: manage drm_minor cleanup with drmm_
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 24, 2020 at 10:42 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Tue, Mar 24, 2020 at 09:39:36PM +0100, Daniel Vetter wrote:
> > The cleanup here is somewhat tricky, since we can't tell apart the
> > allocated minor index from 0. So register a cleanup action first, and
> > if the index allocation fails, unregister that cleanup action again to
> > avoid bad mistakes.
> >
> > The kdev for the minor already handles NULL, so no problem there.
> >
> > Hence add drmm_remove_action() to the drm_managed library.
> >
> > v2: Make pointer math around void ** consistent with what Laurent
> > suggested.
> >
> > v3: Use drmm_add_action_or_reset and remove drmm_remove_action. Noticed
> > because of some questions from Thomas. This also means we need to move
> > the drmm_add_action_or_reset helper earlier in the series.
> >
> > v4: Uh ... fix slightly embarrassing bug CI spotted.
> Looks like the one I spotted in my review.
> Saw your mail only after posting.

Yup, but thanks for spotting it in your review too, gives me lots of
confidence that you really checked all the details - I was totally
blind and took me an afternoon with the clue bat to find the bug I
created :-)

> One Q below.
>
> >
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  drivers/gpu/drm/drm_drv.c     | 69 ++++++++++++-----------------------
> >  drivers/gpu/drm/drm_managed.c | 14 +++++++
> >  include/drm/drm_managed.h     |  9 ++++-
> >  3 files changed, 46 insertions(+), 46 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index a710c53d13a8..50c56ff24c71 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -93,13 +93,25 @@ static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
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
> > @@ -117,46 +129,20 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
> >       idr_preload_end();
> >
> >       if (r < 0)
> > -             goto err_free;
> > +             return r;
> >
> >       minor->index = r;
> >
> > +     r = drmm_add_action_or_reset(dev, drm_minor_alloc_release, minor);
> > +     if (r)
> > +             return r;
> > +
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
>
> > -     *slot = NULL;
>
> In drm_minor_alloc_release() there is no equivalent to this
> NULL assignment.
> Did you consider if there was any real reason for the NULL assignment?

I think they're just prudence, so that you oops if you do a
use-after-free. But nowadays we have KASAN (and slab poisoning, and
lots more stuff), which is massively more powerful at catching these
kinds of bugs. There's a bunch of these "set to NULL" that I've
dropped, since with drmm you easily get access to the higher level
structure that has the pointer to the thing you're cleaning up.
-Daniel

>
>         Sam
>
>
> >  }
> >
> >  static int drm_minor_register(struct drm_device *dev, unsigned int type)
> > @@ -678,16 +664,16 @@ int drm_dev_init(struct drm_device *dev,
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
> > @@ -695,7 +681,7 @@ int drm_dev_init(struct drm_device *dev,
> >               ret = drm_gem_init(dev);
> >               if (ret) {
> >                       DRM_ERROR("Cannot initialize graphics execution manager (GEM)\n");
> > -                     goto err_ctxbitmap;
> > +                     goto err;
> >               }
> >       }
> >
> > @@ -708,10 +694,6 @@ int drm_dev_init(struct drm_device *dev,
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
> > @@ -776,9 +758,6 @@ void drm_dev_fini(struct drm_device *dev)
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
> > index 6bce1c892df3..7246a8318137 100644
> > --- a/drivers/gpu/drm/drm_managed.c
> > +++ b/drivers/gpu/drm/drm_managed.c
> > @@ -149,6 +149,20 @@ int __drmm_add_action(struct drm_device *dev,
> >  }
> >  EXPORT_SYMBOL(__drmm_add_action);
> >
> > +int __drmm_add_action_or_reset(struct drm_device *dev,
> > +                            drmres_release_t action,
> > +                            void *data, const char *name)
> > +{
> > +     int ret;
> > +
> > +     ret = __drmm_add_action(dev, action, data, name);
> > +     if (ret)
> > +             action(dev, data);
> > +
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL(__drmm_add_action_or_reset);
> > +
> >  void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp)
> >  {
> >       struct drmres *dr;
> > diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> > index 89e6fce9f689..2d1e29a2200c 100644
> > --- a/include/drm/drm_managed.h
> > +++ b/include/drm/drm_managed.h
> > @@ -17,7 +17,14 @@ int __must_check __drmm_add_action(struct drm_device *dev,
> >                                  drmres_release_t action,
> >                                  void *data, const char *name);
> >
> > -void drmm_add_final_kfree(struct drm_device *dev, void *parent);
> > +#define drmm_add_action_or_reset(dev, action, data) \
> > +     __drmm_add_action_or_reset(dev, action, data, #action)
> > +
> > +int __must_check __drmm_add_action_or_reset(struct drm_device *dev,
> > +                                         drmres_release_t action,
> > +                                         void *data, const char *name);
> > +
> > +void drmm_add_final_kfree(struct drm_device *dev, void *container);
> >
> >  void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp) __malloc;
> >  static inline void *drmm_kzalloc(struct drm_device *dev, size_t size, gfp_t gfp)
> > --
> > 2.25.1
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
