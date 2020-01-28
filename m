Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6890514B32A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 12:00:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCAD6EDBC;
	Tue, 28 Jan 2020 11:00:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CED6EDBC;
 Tue, 28 Jan 2020 11:00:42 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 20032765-1500050 for multiple; Tue, 28 Jan 2020 11:00:33 +0000
MIME-Version: 1.0
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200128104602.1459802-4-daniel.vetter@ffwll.ch>
References: <20200128104602.1459802-1-daniel.vetter@ffwll.ch>
 <20200128104602.1459802-4-daniel.vetter@ffwll.ch>
Message-ID: <158020923209.30113.10407723076410497120@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH 4/4] drm: Nerv drm_global_mutex BKL for good drivers
Date: Tue, 28 Jan 2020 11:00:32 +0000
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
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Daniel Vetter (2020-01-28 10:46:01)
> This catches the majority of drivers (unfortunately not if we take
> users into account, because all the big drivers have at least a
> lastclose hook).

Yeah, that lastclose for switching back to fbcon, and ensuring that
switch is started before the next client takes over the console, does
nerf the ability of avoiding the global_mutex.

> 
> With the prep patches out of the way all drm state is fully protected
> and either prevents or can deal with the races from dropping the BKL
> around open/close. The only thing left to audit are the various driver
> hooks - by keeping the BKL around if any of them are set we have a
> very simple cop-out!
> 
> Note that one of the biggest prep pieces to get here was making
> dev->open_count atomic, which was done in
> 
> commit 7e13ad896484a0165a68197a2e64091ea28c9602
> Author: Chris Wilson <chris@chris-wilson.co.uk>
> Date:   Fri Jan 24 13:01:07 2020 +0000
> 
>     drm: Avoid drm_global_mutex for simple inc/dec of dev->open_count
> 
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_drv.c      |  6 +++--
>  drivers/gpu/drm/drm_file.c     | 46 ++++++++++++++++++++++++++++++----
>  drivers/gpu/drm/drm_internal.h |  1 +
>  3 files changed, 46 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 05bdf0b9d2b3..9fcd6ab3c154 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -946,7 +946,8 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
>         struct drm_driver *driver = dev->driver;
>         int ret;
>  
> -       mutex_lock(&drm_global_mutex);
> +       if (drm_dev_needs_global_mutex(dev))
> +               mutex_lock(&drm_global_mutex);
>  
>         if (dev->driver->load) {
>                 if (!drm_core_check_feature(dev, DRIVER_LEGACY))
> @@ -992,7 +993,8 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
>         drm_minor_unregister(dev, DRM_MINOR_PRIMARY);
>         drm_minor_unregister(dev, DRM_MINOR_RENDER);
>  out_unlock:
> -       mutex_unlock(&drm_global_mutex);
> +       if (drm_dev_needs_global_mutex(dev))
> +               mutex_unlock(&drm_global_mutex);
>         return ret;
>  }
>  EXPORT_SYMBOL(drm_dev_register);
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index d36cb74ebe0c..efd6fe0b6b4f 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -51,6 +51,37 @@
>  /* from BKL pushdown */
>  DEFINE_MUTEX(drm_global_mutex);
>  
> +bool drm_dev_needs_global_mutex(struct drm_device *dev)
> +{
> +       /*
> +        * Legacy drivers rely on all kinds of BKL locking semantics, don't
> +        * bother. They also still need BKL locking for their ioctls, so better
> +        * safe than sorry.
> +        */
> +       if (drm_core_check_feature(dev, DRIVER_LEGACY))
> +               return true;
> +
> +       /*
> +        * The deprecated ->load callback must be called after the driver is
> +        * already registered. This means such drivers rely on the BKL to make
> +        * sure an open can't proceed until the driver is actually fully set up.
> +        * Similar hilarity holds for the unload callback.
> +        */
> +       if (dev->driver->load || dev->driver->unload)
> +               return true;
> +
> +       /*
> +        * Drivers with the lastclose callback assume that it's synchronized
> +        * against concurrent opens, which again needs the BKL. The proper fix
> +        * is to use the drm_client infrastructure with proper locking for each
> +        * client.
> +        */
> +       if (dev->driver->lastclose)
> +               return true;
> +
> +       return false;

Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>

I'm not particularly fussed by this patch, maybe a bit too obviously
midlayer.

I was wondering if we should have a *dev->global_mutex which drivers can
set to be any level they need (with a bit of care on our part to make
sure it is not destroyed across dev->driver->lastclose).
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
