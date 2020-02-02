Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F29B714FEA6
	for <lists+dri-devel@lfdr.de>; Sun,  2 Feb 2020 18:38:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C886EB18;
	Sun,  2 Feb 2020 17:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6F46E086;
 Sun,  2 Feb 2020 17:38:32 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 20092098-1500050 for multiple; Sun, 02 Feb 2020 17:37:33 +0000
MIME-Version: 1.0
To: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200202132133.1891846-1-daniel.vetter@ffwll.ch>
References: <20200202132133.1891846-1-daniel.vetter@ffwll.ch>
Message-ID: <158066505178.17828.178213696291677257@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/vgem: Close use-after-free race in vgem_gem_create
Date: Sun, 02 Feb 2020 17:37:31 +0000
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
Cc: Rob Clark <robdclark@chromium.org>, Hillf Danton <hdanton@sina.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 stable@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Daniel Vetter (2020-02-02 13:21:33)
> There's two references floating around here (for the object reference,
> not the handle_count reference, that's a different thing):
> 
> - The temporary reference held by vgem_gem_create, acquired by
>   creating the object and released by calling
>   drm_gem_object_put_unlocked.
> 
> - The reference held by the object handle, created by
>   drm_gem_handle_create. This one generally outlives the function,
>   except if a 2nd thread races with a GEM_CLOSE ioctl call.
> 
> So usually everything is correct, except in that race case, where the
> access to gem_object->size could be looking at freed data already.
> Which again isn't a real problem (userspace shot its feet off already
> with the race, we could return garbage), but maybe someone can exploit
> this as an information leak.
> 
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: Hillf Danton <hdanton@sina.com>
> Cc: Reported-by: syzbot+0dc4444774d419e916c8@syzkaller.appspotmail.com
> Cc: stable@vger.kernel.org
> Cc: Emil Velikov <emil.velikov@collabora.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/vgem/vgem_drv.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> index 5bd60ded3d81..909eba43664a 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -196,9 +196,10 @@ static struct drm_gem_object *vgem_gem_create(struct drm_device *dev,
>                 return ERR_CAST(obj);
>  
>         ret = drm_gem_handle_create(file, &obj->base, handle);
> -       drm_gem_object_put_unlocked(&obj->base);
> -       if (ret)
> +       if (ret) {
> +               drm_gem_object_put_unlocked(&obj->base);
>                 return ERR_PTR(ret);
> +       }
>  
>         return &obj->base;
>  }
> @@ -221,7 +222,9 @@ static int vgem_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
>         args->size = gem_object->size;
>         args->pitch = pitch;
>  
> -       DRM_DEBUG("Created object of size %lld\n", size);
> +       drm_gem_object_put_unlocked(gem_object);
> +
> +       DRM_DEBUG("Created object of size %llu\n", args->size);

I was thinking we either should return size from vgem_gem_create (the
strategy we took in i915) or simply remove the vgem_gem_create() as that
doesn't improve readability.

-static struct drm_gem_object *vgem_gem_create(struct drm_device *dev,
-                                             struct drm_file *file,
-                                             unsigned int *handle,
-                                             unsigned long size)
+static int vgem_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
+                               struct drm_mode_create_dumb *args)
 {
        struct drm_vgem_gem_object *obj;
-       int ret;
+       u64 pitch, size;
+       u32 handle;
+
+       pitch = args->width * DIV_ROUND_UP(args->bpp, 8);
+       size = mul_u32_u32(args->height, pitch);
+       if (size == 0 || pitch < args->width)
+               return -EINVAL;

        obj = __vgem_gem_create(dev, size);
        if (IS_ERR(obj))
-               return ERR_CAST(obj);
+               return PTR_ERR(obj);
+
+       size = obj->base.size;

-       ret = drm_gem_handle_create(file, &obj->base, handle);
+       ret = drm_gem_handle_create(file, &obj->base, &handle);
        drm_gem_object_put_unlocked(&obj->base);
        if (ret)
                return ERR_PTR(ret);

-       return &obj->base;
-}
-
-static int vgem_gem_dumb_create(struct drm_file *file, struct drm_device *dev,
-                               struct drm_mode_create_dumb *args)
-{
-       struct drm_gem_object *gem_object;
-       u64 pitch, size;
-
-       pitch = args->width * DIV_ROUND_UP(args->bpp, 8);
-       size = args->height * pitch;
-       if (size == 0)
-               return -EINVAL;
-
-       gem_object = vgem_gem_create(dev, file, &args->handle, size);
-       if (IS_ERR(gem_object))
-               return PTR_ERR(gem_object);
-
-       args->size = gem_object->size;
+       args->size = size;
        args->pitch = pitch;
+       args->handle = handle;


At the end of the day, it makes no difference,
Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
