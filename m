Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 219FD14BC7A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 15:59:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1528289AB9;
	Tue, 28 Jan 2020 14:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0440789D9A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 14:59:13 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id s10so2861171wmh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2020 06:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ve5Wxc2CRHRK7ZkIdFspQjUeR0iypIBJN4jUv9nnS2Y=;
 b=C+lN/Z/3KFBiCX2AIampNudg+aId1JaJqcZ88JCtCcF3zowHA+TNw1ttwINesecNMg
 fogWg7nql0pPZJDvW/SD9Emz91Fp6YqkZRy4YNUSt4vlMfw/Jni9+aL/dcse9EKO7Lht
 7vZVstNt/QpH3LCPNLkVQoZiMsW1egk0YrnTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ve5Wxc2CRHRK7ZkIdFspQjUeR0iypIBJN4jUv9nnS2Y=;
 b=HlmHtGU1gt87kMYsyDU6sPJrbnz44HTJkwVkEhKVeIVMAvhEh80OpPE1gwGkgN4Thb
 ID0t200JkOtG5tXjLlIgSvIhMbEKeXUOJyhpq2ZNzxUi3wiy+HPf+mC5EGeKVDaNxYzk
 OX721uuVTzgGuHkDxkakYfhXfPw2T14SSbPQSjivPVniDGcwRaLySzpQ7twLwSPN8JIC
 iqMHRH042JpOSl2MU10jk6DG06ObdD25ULoXW0QCWSRSBo0EM5G+r3yfF3WZxKDKJ9oW
 2RiPU+xCREYcOtkGR69qAlO60e540VuTXFZOg7G4b60lxeuHX8dfTUd0TvqgUqCZlGFp
 QPoQ==
X-Gm-Message-State: APjAAAVEWBLKesokmV8Sf4qg23meZGrF+cNVLMnM/wsnWC20KsAGfp9T
 Jk5N/zws8aYL0lmb4aX4AzTuiA==
X-Google-Smtp-Source: APXvYqxJdg+6nW8Ld6uoWx5AXOpTsAoHiyVVKbdqnErV0bI7eBtYlPHCaXVSyrxrTHskIfrS9DKciQ==
X-Received: by 2002:a1c:3803:: with SMTP id f3mr5722715wma.134.1580223551576; 
 Tue, 28 Jan 2020 06:59:11 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g25sm4662995wmh.3.2020.01.28.06.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2020 06:59:11 -0800 (PST)
Date: Tue, 28 Jan 2020 15:59:09 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 4/4] drm: Nerv drm_global_mutex BKL for good drivers
Message-ID: <20200128145909.GF43062@phenom.ffwll.local>
References: <20200128104602.1459802-1-daniel.vetter@ffwll.ch>
 <20200128104602.1459802-4-daniel.vetter@ffwll.ch>
 <158020923209.30113.10407723076410497120@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158020923209.30113.10407723076410497120@skylake-alporthouse-com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 28, 2020 at 11:00:32AM +0000, Chris Wilson wrote:
> Quoting Daniel Vetter (2020-01-28 10:46:01)
> > This catches the majority of drivers (unfortunately not if we take
> > users into account, because all the big drivers have at least a
> > lastclose hook).
> 
> Yeah, that lastclose for switching back to fbcon, and ensuring that
> switch is started before the next client takes over the console, does
> nerf the ability of avoiding the global_mutex.
> 
> > 
> > With the prep patches out of the way all drm state is fully protected
> > and either prevents or can deal with the races from dropping the BKL
> > around open/close. The only thing left to audit are the various driver
> > hooks - by keeping the BKL around if any of them are set we have a
> > very simple cop-out!
> > 
> > Note that one of the biggest prep pieces to get here was making
> > dev->open_count atomic, which was done in
> > 
> > commit 7e13ad896484a0165a68197a2e64091ea28c9602
> > Author: Chris Wilson <chris@chris-wilson.co.uk>
> > Date:   Fri Jan 24 13:01:07 2020 +0000
> > 
> >     drm: Avoid drm_global_mutex for simple inc/dec of dev->open_count
> > 
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  drivers/gpu/drm/drm_drv.c      |  6 +++--
> >  drivers/gpu/drm/drm_file.c     | 46 ++++++++++++++++++++++++++++++----
> >  drivers/gpu/drm/drm_internal.h |  1 +
> >  3 files changed, 46 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index 05bdf0b9d2b3..9fcd6ab3c154 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -946,7 +946,8 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
> >         struct drm_driver *driver = dev->driver;
> >         int ret;
> >  
> > -       mutex_lock(&drm_global_mutex);
> > +       if (drm_dev_needs_global_mutex(dev))
> > +               mutex_lock(&drm_global_mutex);
> >  
> >         if (dev->driver->load) {
> >                 if (!drm_core_check_feature(dev, DRIVER_LEGACY))
> > @@ -992,7 +993,8 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
> >         drm_minor_unregister(dev, DRM_MINOR_PRIMARY);
> >         drm_minor_unregister(dev, DRM_MINOR_RENDER);
> >  out_unlock:
> > -       mutex_unlock(&drm_global_mutex);
> > +       if (drm_dev_needs_global_mutex(dev))
> > +               mutex_unlock(&drm_global_mutex);
> >         return ret;
> >  }
> >  EXPORT_SYMBOL(drm_dev_register);
> > diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> > index d36cb74ebe0c..efd6fe0b6b4f 100644
> > --- a/drivers/gpu/drm/drm_file.c
> > +++ b/drivers/gpu/drm/drm_file.c
> > @@ -51,6 +51,37 @@
> >  /* from BKL pushdown */
> >  DEFINE_MUTEX(drm_global_mutex);
> >  
> > +bool drm_dev_needs_global_mutex(struct drm_device *dev)
> > +{
> > +       /*
> > +        * Legacy drivers rely on all kinds of BKL locking semantics, don't
> > +        * bother. They also still need BKL locking for their ioctls, so better
> > +        * safe than sorry.
> > +        */
> > +       if (drm_core_check_feature(dev, DRIVER_LEGACY))
> > +               return true;
> > +
> > +       /*
> > +        * The deprecated ->load callback must be called after the driver is
> > +        * already registered. This means such drivers rely on the BKL to make
> > +        * sure an open can't proceed until the driver is actually fully set up.
> > +        * Similar hilarity holds for the unload callback.
> > +        */
> > +       if (dev->driver->load || dev->driver->unload)
> > +               return true;
> > +
> > +       /*
> > +        * Drivers with the lastclose callback assume that it's synchronized
> > +        * against concurrent opens, which again needs the BKL. The proper fix
> > +        * is to use the drm_client infrastructure with proper locking for each
> > +        * client.
> > +        */
> > +       if (dev->driver->lastclose)
> > +               return true;
> > +
> > +       return false;
> 
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
> 
> I'm not particularly fussed by this patch, maybe a bit too obviously
> midlayer.

Yeah it's not great. But I think long-term we might have a chance to limit
this to DRIVER_LEGACY:
- load/unload is on the way out
- generic fbdev won't need lastclose
- I have an idea for fixing the vgaswitcheroo locking, now that I starred
  at this wall a bit more. Should be a good undependent cleanup.
- we could perhaps do a ->lastclose_unlocked for reducing that midlayer
  smell a tad. Same way we slowly managed to get rid of the
  dev->struct_mutex locking midlayer.

> I was wondering if we should have a *dev->global_mutex which drivers can
> set to be any level they need (with a bit of care on our part to make
> sure it is not destroyed across dev->driver->lastclose).

I feel like outside of legacy driver the drm_global_mutex protection is
limited enough that there's no need to give driver writers ideas :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
