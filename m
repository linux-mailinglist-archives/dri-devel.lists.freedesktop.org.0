Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC411ED63D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 20:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7209E89294;
	Wed,  3 Jun 2020 18:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-001.vmware.com (ex13-edg-ou-001.vmware.com
 [208.91.0.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D550489294
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 18:37:46 +0000 (UTC)
Received: from sc9-mailhost2.vmware.com (10.113.161.72) by
 EX13-EDG-OU-001.vmware.com (10.113.208.155) with Microsoft SMTP Server id
 15.0.1156.6; Wed, 3 Jun 2020 11:37:42 -0700
Received: from [0.0.0.0] (oddjob.vmware.com [10.253.4.32])
 by sc9-mailhost2.vmware.com (Postfix) with ESMTP id E85D7B2746;
 Wed,  3 Jun 2020 14:37:42 -0400 (EDT)
Subject: Re: [PATCH v2 1/2] drm: vmwgfx: remove drm_driver::master_set()
 return typ
To: Emil Velikov <emil.l.velikov@gmail.com>, <dri-devel@lists.freedesktop.org>
References: <20200530124640.4176323-1-emil.l.velikov@gmail.com>
From: Roland Scheidegger <sroland@vmware.com>
Message-ID: <efe3f43b-e743-d4b8-e942-23fbf23b0118@vmware.com>
Date: Wed, 3 Jun 2020 20:37:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20200530124640.4176323-1-emil.l.velikov@gmail.com>
Content-Language: de-DE
Received-SPF: None (EX13-EDG-OU-001.vmware.com: sroland@vmware.com does not
 designate permitted sender hosts)
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks like a nice cleanup to me. (No idea if at some point there
actually was a reason for a return value...)

Reviewed-by: Roland Scheidegger <sroland@vmware.com>

Am 30.05.20 um 14:46 schrieb Emil Velikov:
> The function always returns zero (success). Ideally we'll remove it all
> together - although that's requires a little more work.
> 
> For now, we can drop the return type and simplify the drm core code
> surrounding it.
> 
> v2: remove redundant assignment (Sam)
> 
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
> Cc: Roland Scheidegger <sroland@vmware.com>
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> VMWare team, I'm planning to push this via drm-misc. Review, ack and
> comments are appreciated.
> ---
>  drivers/gpu/drm/drm_auth.c          | 32 +++++++----------------------
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c |  8 +++-----
>  include/drm/drm_drv.h               |  4 ++--
>  3 files changed, 12 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index 74ce0c29c960..4c723e3a689c 100644
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
> @@ -265,7 +247,7 @@ int drm_setmaster_ioctl(struct drm_device *dev, void *data,
>  		goto out_unlock;
>  	}
>  
> -	ret = drm_set_master(dev, file_priv, false);
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
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
