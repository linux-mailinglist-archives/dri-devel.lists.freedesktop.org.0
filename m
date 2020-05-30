Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0AE1E8F1B
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 09:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDFE6E9BA;
	Sat, 30 May 2020 07:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F096E9BA
 for <dri-devel@lists.freedesktop.org>; Sat, 30 May 2020 07:44:22 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 1A3D920022;
 Sat, 30 May 2020 09:44:19 +0200 (CEST)
Date: Sat, 30 May 2020 09:44:17 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 1/2] drm: vmwgfx: remove drm_driver::master_set() return
 typ
Message-ID: <20200530074417.GA70485@ravnborg.org>
References: <20200529214807.3801851-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200529214807.3801851-1-emil.l.velikov@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=edQTgYMH c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=eh1Yez-EAAAA:8 a=pGLkceISAAAA:8 a=7gkXJVJtAAAA:8
 a=e5mUnYsNAAAA:8 a=VA2qm1DkpCCUpkopWjcA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Emil.

On Fri, May 29, 2020 at 10:48:06PM +0100, Emil Velikov wrote:
> The function always returns zero (success). Ideally we'll remove it all
> together - although that's requires a little more work.
> 
> For now, we can drop the return type and simplify the drm core code
> surrounding it.
> 
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
> Cc: Roland Scheidegger <sroland@vmware.com>
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
Nice cleanup.

> ---
> VMWare team, I'm planning to push this via drm-misc. Review, ack and
> comments are appreciated.
> ---
>  drivers/gpu/drm/drm_auth.c          | 33 +++++++----------------------
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c |  8 +++----
>  include/drm/drm_drv.h               |  4 ++--
>  3 files changed, 13 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index 800ac39f3213..db701a9e9393 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -122,27 +122,19 @@ struct drm_master *drm_master_create(struct drm_device *dev)
>  	return master;
>  }
>  
> -static int drm_set_master(struct drm_device *dev, struct drm_file *fpriv,
> -			  bool new_master)
> +static void drm_set_master(struct drm_device *dev, struct drm_file *fpriv,
> +			   bool new_master)
>  {
> -	int ret = 0;
> -
>  	dev->master = drm_master_get(fpriv->master);
> -	if (dev->driver->master_set) {
> -		ret = dev->driver->master_set(dev, fpriv, new_master);
> -		if (unlikely(ret != 0)) {
> -			drm_master_put(&dev->master);
> -		}
> -	}
> +	if (dev->driver->master_set)
> +		dev->driver->master_set(dev, fpriv, new_master);
>  
> -	fpriv->was_master = (ret == 0);
> -	return ret;
> +	fpriv->was_master = true;
>  }
>  
>  static int drm_new_set_master(struct drm_device *dev, struct drm_file *fpriv)
>  {
>  	struct drm_master *old_master;
> -	int ret;
>  
>  	lockdep_assert_held_once(&dev->master_mutex);
>  
> @@ -157,22 +149,12 @@ static int drm_new_set_master(struct drm_device *dev, struct drm_file *fpriv)
>  	fpriv->is_master = 1;
>  	fpriv->authenticated = 1;
>  
> -	ret = drm_set_master(dev, fpriv, true);
> -	if (ret)
> -		goto out_err;
> +	drm_set_master(dev, fpriv, true);
>  
>  	if (old_master)
>  		drm_master_put(&old_master);
>  
>  	return 0;
> -
> -out_err:
> -	/* drop references and restore old master on failure */
> -	drm_master_put(&fpriv->master);
> -	fpriv->master = old_master;
> -	fpriv->is_master = 0;
> -
> -	return ret;
>  }
>  
>  /*
> @@ -265,7 +247,8 @@ int drm_setmaster_ioctl(struct drm_device *dev, void *data,
>  		goto out_unlock;
>  	}
>  
> -	ret = drm_set_master(dev, file_priv, false);
> +	ret = 0;
This assignment is redundant.
ret is assigned a value here:
	ret = drm_master_check_perm(dev, file_priv);
	if (ret)
		goto out_unlock;

And all other places it is assigned and then goto out_unlock
The assignment when declared is btw. also redundant but that I think is
outside the scope of this patch.

If you remove the redundant assignment to ret then the patch is:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> +	drm_set_master(dev, file_priv, false);
>  out_unlock:
>  	mutex_unlock(&dev->master_mutex);
>  	return ret;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index c2247a893ed4..470428387878 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -1129,9 +1129,9 @@ static long vmw_compat_ioctl(struct file *filp, unsigned int cmd,
>  }
>  #endif
>  
> -static int vmw_master_set(struct drm_device *dev,
> -			  struct drm_file *file_priv,
> -			  bool from_open)
> +static void vmw_master_set(struct drm_device *dev,
> +			   struct drm_file *file_priv,
> +			   bool from_open)
>  {
>  	/*
>  	 * Inform a new master that the layout may have changed while
> @@ -1139,8 +1139,6 @@ static int vmw_master_set(struct drm_device *dev,
>  	 */
>  	if (!from_open)
>  		drm_sysfs_hotplug_event(dev);
> -
> -	return 0;
>  }
>  
>  static void vmw_master_drop(struct drm_device *dev,
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index bb924cddc09c..835c38a76ef6 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -311,8 +311,8 @@ struct drm_driver {
>  	 *
>  	 * Called whenever the minor master is set. Only used by vmwgfx.
>  	 */
> -	int (*master_set)(struct drm_device *dev, struct drm_file *file_priv,
> -			  bool from_open);
> +	void (*master_set)(struct drm_device *dev, struct drm_file *file_priv,
> +			   bool from_open);
>  	/**
>  	 * @master_drop:
>  	 *
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
