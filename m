Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A15A114B2FB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 11:49:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4446EDB7;
	Tue, 28 Jan 2020 10:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EDD36EDB5;
 Tue, 28 Jan 2020 10:49:52 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 20032619-1500050 for multiple; Tue, 28 Jan 2020 10:49:35 +0000
MIME-Version: 1.0
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200128104602.1459802-3-daniel.vetter@ffwll.ch>
References: <20200128104602.1459802-1-daniel.vetter@ffwll.ch>
 <20200128104602.1459802-3-daniel.vetter@ffwll.ch>
Message-ID: <158020857412.30113.8444620432464189015@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH 3/4] drm: Push drm_global_mutex locking in drm_open
Date: Tue, 28 Jan 2020 10:49:34 +0000
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

Quoting Daniel Vetter (2020-01-28 10:46:00)
> We want to only take the BKL on crap drivers, but to know whether
> we have a crap driver we first need to look it up. Split this shuffle
> out from the main BKL-disabling patch, for more clarity.
> 
> Since the minors are refcounted drm_minor_acquire is purely internal
> and this does not have a driver visible effect.
> 
> v2: Push the locking even further into drm_open(), suggested by Chris.
> This gives us more symmetry with drm_release(), and maybe a futuer
> avenue where we make drm_globale_mutex locking (partially) opt-in like
> with drm_release_noglobal().
> 
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_drv.c  | 14 +++++---------
>  drivers/gpu/drm/drm_file.c |  6 ++++++
>  2 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 8deff75b484c..05bdf0b9d2b3 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -1085,17 +1085,14 @@ static int drm_stub_open(struct inode *inode, struct file *filp)
>  
>         DRM_DEBUG("\n");
>  
> -       mutex_lock(&drm_global_mutex);
>         minor = drm_minor_acquire(iminor(inode));
> -       if (IS_ERR(minor)) {
> -               err = PTR_ERR(minor);
> -               goto out_unlock;
> -       }
> +       if (IS_ERR(minor))
> +               return PTR_ERR(minor);
>  
>         new_fops = fops_get(minor->dev->driver->fops);
>         if (!new_fops) {
>                 err = -ENODEV;
> -               goto out_release;
> +               goto out;
>         }
>  
>         replace_fops(filp, new_fops);
> @@ -1104,10 +1101,9 @@ static int drm_stub_open(struct inode *inode, struct file *filp)
>         else
>                 err = 0;
>  
> -out_release:
> +out:
>         drm_minor_release(minor);
> -out_unlock:
> -       mutex_unlock(&drm_global_mutex);
> +
>         return err;
>  }
>  
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 1075b3a8b5b1..d36cb74ebe0c 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -378,6 +378,8 @@ int drm_open(struct inode *inode, struct file *filp)
>         if (IS_ERR(minor))
>                 return PTR_ERR(minor);
>  
> +       mutex_unlock(&drm_global_mutex);
> +
>         dev = minor->dev;
>         if (!atomic_fetch_inc(&dev->open_count))
>                 need_setup = 1;
> @@ -395,10 +397,14 @@ int drm_open(struct inode *inode, struct file *filp)
>                         goto err_undo;
>                 }
>         }
> +
> +       mutex_unlock(&drm_global_mutex);

The only reason why I could think it was in drm_stub_open() not
drm_open() was for the possibility of some driver using a different
callback. Such a driver would not be partaking in the drm_global_mutex
so...
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
