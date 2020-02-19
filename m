Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 310A0164721
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 15:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E30886EC08;
	Wed, 19 Feb 2020 14:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1798A6EC09
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 14:37:58 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id q84so24009572oic.4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 06:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ObPQE+DBw5pZHN+Mvhj65CPR4WmR40e+MfNafVBPdrA=;
 b=K57px62FJ2FrBbNSmYRgjlZkBIPsvYw3eQNgY5O5FUfqEEN5ZbKT5u917tnXQOfza2
 m8l3/E7TkYGPKxG20ReuHNdEOEqPysOuD71MC5R9ChDT4VDLT1LYNImg73TfwM5cvWnn
 7Rsx+H63AgmNkf0WFyUIC1366uIicw4P25PNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ObPQE+DBw5pZHN+Mvhj65CPR4WmR40e+MfNafVBPdrA=;
 b=PyVXL7yC46snSBKcshmQh/eQ0Bi1OOcJ+VaaHQpZnvcnK7lHdxDeG1OGHv5XEins7B
 hzcSsBpvhtDW8nRTDJVbW1p0d+rpUq3GxFesFzspat5zX/UIIGaSmrBij42957nClwUK
 QDIL2MpI/YN8KJGR0df8aQOV6f2FlzpJkrsdrQjhSis47NudHdrmsDdGFpAMkICLli3l
 LGfnYnYo5YQrlW2GeKfcJoS5b2zi2E1E44aamnWl1kl0aa7SNq3pphntH5pgmf8dySIU
 xnbXHSUdWmaLy/RrKkNgAv/OCRy1BbldJb4WNO84ZJH+IHOk2m73IiuPlVGhaJtA9u+z
 4f3Q==
X-Gm-Message-State: APjAAAVtsYV2cAxVY1wVW164TUuhKY68vTCbsT4j6/G9QpGnhq4KfrPI
 HdfqFXzz+Nt5Mztz09Wp0XTwMy83W7Fubqin+b6Vmg==
X-Google-Smtp-Source: APXvYqw0C+mIbP+wd/8PF8c4lKXlz99wkC3F5dYnO60ch4YSxe8+FcCix2735tXyvMu9YplxiDI3uN62GSRVoEvO4IQ=
X-Received: by 2002:a05:6808:319:: with SMTP id
 i25mr4860103oie.128.1582123077395; 
 Wed, 19 Feb 2020 06:37:57 -0800 (PST)
MIME-Version: 1.0
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-25-daniel.vetter@ffwll.ch>
 <20200219142217.GK5070@pendragon.ideasonboard.com>
In-Reply-To: <20200219142217.GK5070@pendragon.ideasonboard.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 19 Feb 2020 15:37:46 +0100
Message-ID: <CAKMK7uELg2CBCho60Vb3nYcgq1RUaALA_ntRo1ac0GwpxRhHxw@mail.gmail.com>
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

On Wed, Feb 19, 2020 at 3:22 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Daniel,
>
> Thank you for the patch.
>
> On Wed, Feb 19, 2020 at 11:20:54AM +0100, Daniel Vetter wrote:
> > We might want to look into pushing this down into drm_mm_init, but
> > that would mean rolling out return codes to a pile of functions
> > unfortunately. So let's leave that for now.
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  drivers/gpu/drm/drm_drv.c      |  8 +-------
> >  drivers/gpu/drm/drm_gem.c      | 21 ++++++++++-----------
> >  drivers/gpu/drm/drm_internal.h |  1 -
> >  3 files changed, 11 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index 03a1fb377830..7b3df1188da9 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -688,13 +688,10 @@ int drm_dev_init(struct drm_device *dev,
> >
> >       ret = drm_dev_set_unique(dev, dev_name(parent));
> >       if (ret)
> > -             goto err_setunique;
> > +             goto err;
> >
> >       return 0;
> >
> > -err_setunique:
> > -     if (drm_core_check_feature(dev, DRIVER_GEM))
> > -             drm_gem_destroy(dev);
> >  err:
> >       drm_managed_release(dev);
> >
> > @@ -756,9 +753,6 @@ EXPORT_SYMBOL(devm_drm_dev_init);
> >  void drm_dev_fini(struct drm_device *dev)
> >  {
> >       drm_vblank_cleanup(dev);
> > -
> > -     if (drm_core_check_feature(dev, DRIVER_GEM))
> > -             drm_gem_destroy(dev);
> >  }
> >  EXPORT_SYMBOL(drm_dev_fini);
> >
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index 0b6e6623735e..31095e0f6b9f 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -44,6 +44,7 @@
> >  #include <drm/drm_drv.h>
> >  #include <drm/drm_file.h>
> >  #include <drm/drm_gem.h>
> > +#include <drm/drm_managed.h>
> >  #include <drm/drm_print.h>
> >  #include <drm/drm_vma_manager.h>
> >
> > @@ -77,6 +78,12 @@
> >   * up at a later date, and as our interface with shmfs for memory allocation.
> >   */
> >
> > +static void
> > +drm_gem_init_release(struct drm_device *dev, void *ptr)
> > +{
> > +     drm_vma_offset_manager_destroy(dev->vma_offset_manager);
> > +}
> > +
> >  /**
> >   * drm_gem_init - Initialize the GEM device fields
> >   * @dev: drm_devic structure to initialize
> > @@ -89,7 +96,8 @@ drm_gem_init(struct drm_device *dev)
> >       mutex_init(&dev->object_name_lock);
> >       idr_init_base(&dev->object_name_idr, 1);
> >
> > -     vma_offset_manager = kzalloc(sizeof(*vma_offset_manager), GFP_KERNEL);
> > +     vma_offset_manager = drmm_kzalloc(dev, sizeof(*vma_offset_manager),
> > +                                       GFP_KERNEL);
> >       if (!vma_offset_manager) {
> >               DRM_ERROR("out of memory\n");
> >               return -ENOMEM;
> > @@ -100,16 +108,7 @@ drm_gem_init(struct drm_device *dev)
> >                                   DRM_FILE_PAGE_OFFSET_START,
> >                                   DRM_FILE_PAGE_OFFSET_SIZE);
> >
> > -     return 0;
> > -}
> > -
> > -void
> > -drm_gem_destroy(struct drm_device *dev)
> > -{
> > -
> > -     drm_vma_offset_manager_destroy(dev->vma_offset_manager);
> > -     kfree(dev->vma_offset_manager);
> > -     dev->vma_offset_manager = NULL;
> > +     return drmm_add_action(dev, drm_gem_init_release, NULL);
>
> This looks fine as such (although I'm not sure if the managed API
> overhead is really worth it for core code), but it leads to a potential
> issue: if we handle more of the cleanup through the managed API, how do
> we ensure that the cleanup functions are called in the right order (when
> order matters) ?

KASAN essentially (already helped while developing this), plus review.
It's still the same problem like reviewing onion unwind code, it's
just less fragile for the normal case.

I also think that if you have ordering constraints in your drm_device
release functions, there's a more fundamental problem going on.
Unfortunately we have a lot of these, which is why converting
everything in drm, including drivers, is not going to be easy nor
quick. There's a lot of problems. E.g. naively converting all
drm_connector allocations from devm_kzalloc to drmm_kzalloc still
means they get released too early, since the drm_mode_config_init
happens before you set up the connectors. So you still have the
problem that your connector_funcs->destroy gets called on already
freed memory. Lots of work ahead.
-Daniel


> >  }
> >
> >  /**
> > diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> > index 8c2628dfc6c7..cb09e95a795e 100644
> > --- a/drivers/gpu/drm/drm_internal.h
> > +++ b/drivers/gpu/drm/drm_internal.h
> > @@ -144,7 +144,6 @@ void drm_sysfs_lease_event(struct drm_device *dev);
> >  /* drm_gem.c */
> >  struct drm_gem_object;
> >  int drm_gem_init(struct drm_device *dev);
> > -void drm_gem_destroy(struct drm_device *dev);
> >  int drm_gem_handle_create_tail(struct drm_file *file_priv,
> >                              struct drm_gem_object *obj,
> >                              u32 *handlep);
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
