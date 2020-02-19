Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40697164789
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 15:56:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7FF56E804;
	Wed, 19 Feb 2020 14:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CC26E804
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 14:56:32 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id z2so24048568oih.6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 06:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3X+Eg8xw5wCpoJ+olJPk/5v8tV4h7n5gjtDcMcXY6c8=;
 b=lhy3KSwZtYd5nvn1kokm7e1Y2pQhmOYq2zQ6q5LyCTHGoIG5xqyAcVQAjiN4Hk02qx
 u1ezEZxqpMqpRmyvXT2bwaEtOZC2YK/BAxHVyEQ9l4j5SjL3EQMNuq2Somvu7EK8ED8U
 sf8xGuMu6n5jzdDrk9NGQJSJOf+jgfSOEhP9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3X+Eg8xw5wCpoJ+olJPk/5v8tV4h7n5gjtDcMcXY6c8=;
 b=OPVhjNBtFS+FbiFFaDUemnE03BKD3a9oPKUeCb5/nCaioS+3/dCFECY7MosmjOIFCD
 3o2Uv44yF2uGVYRWbKQEtO5YkcBMb/F0ms/TGXrK9ydfv0AV/gYIrk2koP9WP9nsvsXv
 Z8oUxDdlv9Fq9sIEA1GIe+MOB+JkRsjE1QZAT+PV9eq+MU+Mnnbf/g9hHpICpAgbM1dQ
 L3S341py7bkKHwLCi3AzX/2N68wM713owmDYIQetdCXOO9a7B6Z3KmN+rll3iI027SP8
 lIriBn0cCQJzuPNCn8fuT2grihrnVLqlWqQQwEZaUsd3TPeAJPZh/KXlm+l8CSGzdrlK
 YL6g==
X-Gm-Message-State: APjAAAWfY1pAyj9KUUIctjgLwZkYRbIYmJug0EpqZ1LxMudiOMXsYSH2
 bLMhFpcliZi8SXlpz+00adRmeaFHMceFYxVidEVyIw==
X-Google-Smtp-Source: APXvYqzc3rGKCRoaHM5Ry+Gm37f+1/FNIyRe78JvfSKEHebcpxSGTkbdDba2iaa4uLX4DOF/FzuNMAVl+wLH+Kpqn4c=
X-Received: by 2002:a05:6808:319:: with SMTP id
 i25mr4912552oie.128.1582124191351; 
 Wed, 19 Feb 2020 06:56:31 -0800 (PST)
MIME-Version: 1.0
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-25-daniel.vetter@ffwll.ch>
 <20200219142217.GK5070@pendragon.ideasonboard.com>
 <CAKMK7uELg2CBCho60Vb3nYcgq1RUaALA_ntRo1ac0GwpxRhHxw@mail.gmail.com>
 <20200219145221.GP5070@pendragon.ideasonboard.com>
In-Reply-To: <20200219145221.GP5070@pendragon.ideasonboard.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 19 Feb 2020 15:56:20 +0100
Message-ID: <CAKMK7uEbUzw2+5qh-Dg4QFkLTcx+AC7TyyXdSeaCN0fScKN=QQ@mail.gmail.com>
Subject: Re: [PATCH 24/52] drm: Manage drm_gem_init with drmm_
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

On Wed, Feb 19, 2020 at 3:52 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Daniel,
>
> On Wed, Feb 19, 2020 at 03:37:46PM +0100, Daniel Vetter wrote:
> > On Wed, Feb 19, 2020 at 3:22 PM Laurent Pinchart wrote:
> > > On Wed, Feb 19, 2020 at 11:20:54AM +0100, Daniel Vetter wrote:
> > > > We might want to look into pushing this down into drm_mm_init, but
> > > > that would mean rolling out return codes to a pile of functions
> > > > unfortunately. So let's leave that for now.
> > > >
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_drv.c      |  8 +-------
> > > >  drivers/gpu/drm/drm_gem.c      | 21 ++++++++++-----------
> > > >  drivers/gpu/drm/drm_internal.h |  1 -
> > > >  3 files changed, 11 insertions(+), 19 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > > > index 03a1fb377830..7b3df1188da9 100644
> > > > --- a/drivers/gpu/drm/drm_drv.c
> > > > +++ b/drivers/gpu/drm/drm_drv.c
> > > > @@ -688,13 +688,10 @@ int drm_dev_init(struct drm_device *dev,
> > > >
> > > >       ret = drm_dev_set_unique(dev, dev_name(parent));
> > > >       if (ret)
> > > > -             goto err_setunique;
> > > > +             goto err;
> > > >
> > > >       return 0;
> > > >
> > > > -err_setunique:
> > > > -     if (drm_core_check_feature(dev, DRIVER_GEM))
> > > > -             drm_gem_destroy(dev);
> > > >  err:
> > > >       drm_managed_release(dev);
> > > >
> > > > @@ -756,9 +753,6 @@ EXPORT_SYMBOL(devm_drm_dev_init);
> > > >  void drm_dev_fini(struct drm_device *dev)
> > > >  {
> > > >       drm_vblank_cleanup(dev);
> > > > -
> > > > -     if (drm_core_check_feature(dev, DRIVER_GEM))
> > > > -             drm_gem_destroy(dev);
> > > >  }
> > > >  EXPORT_SYMBOL(drm_dev_fini);
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > > > index 0b6e6623735e..31095e0f6b9f 100644
> > > > --- a/drivers/gpu/drm/drm_gem.c
> > > > +++ b/drivers/gpu/drm/drm_gem.c
> > > > @@ -44,6 +44,7 @@
> > > >  #include <drm/drm_drv.h>
> > > >  #include <drm/drm_file.h>
> > > >  #include <drm/drm_gem.h>
> > > > +#include <drm/drm_managed.h>
> > > >  #include <drm/drm_print.h>
> > > >  #include <drm/drm_vma_manager.h>
> > > >
> > > > @@ -77,6 +78,12 @@
> > > >   * up at a later date, and as our interface with shmfs for memory allocation.
> > > >   */
> > > >
> > > > +static void
> > > > +drm_gem_init_release(struct drm_device *dev, void *ptr)
> > > > +{
> > > > +     drm_vma_offset_manager_destroy(dev->vma_offset_manager);
> > > > +}
> > > > +
> > > >  /**
> > > >   * drm_gem_init - Initialize the GEM device fields
> > > >   * @dev: drm_devic structure to initialize
> > > > @@ -89,7 +96,8 @@ drm_gem_init(struct drm_device *dev)
> > > >       mutex_init(&dev->object_name_lock);
> > > >       idr_init_base(&dev->object_name_idr, 1);
> > > >
> > > > -     vma_offset_manager = kzalloc(sizeof(*vma_offset_manager), GFP_KERNEL);
> > > > +     vma_offset_manager = drmm_kzalloc(dev, sizeof(*vma_offset_manager),
> > > > +                                       GFP_KERNEL);
> > > >       if (!vma_offset_manager) {
> > > >               DRM_ERROR("out of memory\n");
> > > >               return -ENOMEM;
> > > > @@ -100,16 +108,7 @@ drm_gem_init(struct drm_device *dev)
> > > >                                   DRM_FILE_PAGE_OFFSET_START,
> > > >                                   DRM_FILE_PAGE_OFFSET_SIZE);
> > > >
> > > > -     return 0;
> > > > -}
> > > > -
> > > > -void
> > > > -drm_gem_destroy(struct drm_device *dev)
> > > > -{
> > > > -
> > > > -     drm_vma_offset_manager_destroy(dev->vma_offset_manager);
> > > > -     kfree(dev->vma_offset_manager);
> > > > -     dev->vma_offset_manager = NULL;
> > > > +     return drmm_add_action(dev, drm_gem_init_release, NULL);
> > >
> > > This looks fine as such (although I'm not sure if the managed API
> > > overhead is really worth it for core code), but it leads to a potential
> > > issue: if we handle more of the cleanup through the managed API, how do
> > > we ensure that the cleanup functions are called in the right order (when
> > > order matters) ?
> >
> > KASAN essentially (already helped while developing this), plus review.
> > It's still the same problem like reviewing onion unwind code, it's
> > just less fragile for the normal case.
>
> That wasn't really my question though. If there are ordering
> constraints, and if we want to honour them, the ordering of cleanups
> need to be documented in the API (and of course implemented). We may for
> instance want to always do cleanups in the reverse order of the
> allocations.
>
> > I also think that if you have ordering constraints in your drm_device
> > release functions, there's a more fundamental problem going on.
> > Unfortunately we have a lot of these, which is why converting
> > everything in drm, including drivers, is not going to be easy nor
> > quick. There's a lot of problems. E.g. naively converting all
> > drm_connector allocations from devm_kzalloc to drmm_kzalloc still
> > means they get released too early, since the drm_mode_config_init
> > happens before you set up the connectors. So you still have the
> > problem that your connector_funcs->destroy gets called on already
> > freed memory. Lots of work ahead.
>
> Yes that's the kind of issue I was thinking about. We have ordering
> constraints, they will not go away. What's your idea on how to handle
> this ?

drmm_ guarantees that release actions are executed in reverse order of
how they're added. That's the right thing to do in 99% of cases. For
the others you need manual unwind logic, maybe with a combined release
action. Or some some safety checks in your release hook. I think the
drm_minor_alloc conversion is a useful example of some of the problems
that can lurk, and options for handling it all.
-Daniel

>
> > > >  }
> > > >
> > > >  /**
> > > > diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> > > > index 8c2628dfc6c7..cb09e95a795e 100644
> > > > --- a/drivers/gpu/drm/drm_internal.h
> > > > +++ b/drivers/gpu/drm/drm_internal.h
> > > > @@ -144,7 +144,6 @@ void drm_sysfs_lease_event(struct drm_device *dev);
> > > >  /* drm_gem.c */
> > > >  struct drm_gem_object;
> > > >  int drm_gem_init(struct drm_device *dev);
> > > > -void drm_gem_destroy(struct drm_device *dev);
> > > >  int drm_gem_handle_create_tail(struct drm_file *file_priv,
> > > >                              struct drm_gem_object *obj,
> > > >                              u32 *handlep);
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
