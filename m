Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA6819B99E
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 02:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EABA36E9BF;
	Thu,  2 Apr 2020 00:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C446E0F9;
 Thu,  2 Apr 2020 00:50:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1C5B80E;
 Thu,  2 Apr 2020 02:50:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1585788616;
 bh=f+N86Qmo9hTitSTIr/mHRqjAQ+qSTEk0QtizQ5ODC5Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nYg9liIMzNGgt/Hi4+F0ZKbhw8S06QN0nyrnFtSaeGK00Fu1ImppUW1qrYTaT26Za
 KwSQyc8hFAm1sRE6LDgIgzYxtTwknCijAtXpUAAEyQhWgKwq+KwGNl/nzLIFHRSPXz
 lY3NwkwW3GYJGXOUP+r4dwQV0MvOpcwPEznDfwok=
Date: Thu, 2 Apr 2020 03:50:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 19/51] drm: Cleanups after drmm_add_final_kfree rollout
Message-ID: <20200402005008.GA18964@pendragon.ideasonboard.com>
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
 <20200323144950.3018436-20-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200323144950.3018436-20-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

(On a side note, git-format-patch accepts a -v argument to specify the
version, I didn't realize you were not aware of it :-))

On Mon, Mar 23, 2020 at 03:49:18PM +0100, Daniel Vetter wrote:
> A few things:
> - Update the example driver in the documentation.
> - We can drop the old kfree in drm_dev_release.
> - Add a WARN_ON check in drm_dev_register to make sure everyone calls
>   drmm_add_final_kfree and there's no leaks.
> 
> v2: Restore the full cleanup, I accidentally left some moved code
> behind when fixing the bisectability of the series.
> 
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_drv.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 877ded348b6e..7f9d7ea543a0 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -297,8 +297,6 @@ void drm_minor_release(struct drm_minor *minor)
>   *
>   *		drm_mode_config_cleanup(drm);
>   *		drm_dev_fini(drm);
> - *		kfree(priv->userspace_facing);
> - *		kfree(priv);
>   *	}
>   *
>   *	static struct drm_driver driver_drm_driver = {
> @@ -326,10 +324,11 @@ void drm_minor_release(struct drm_minor *minor)
>   *			kfree(drm);
>   *			return ret;
>   *		}
> + *		drmm_add_final_kfree(drm, priv);
>   *
>   *		drm_mode_config_init(drm);
>   *
> - *		priv->userspace_facing = kzalloc(..., GFP_KERNEL);
> + *		priv->userspace_facing = drmm_kzalloc(..., GFP_KERNEL);
>   *		if (!priv->userspace_facing)
>   *			return -ENOMEM;
>   *
> @@ -837,10 +836,7 @@ static void drm_dev_release(struct kref *ref)
>  
>  	drm_managed_release(dev);
>  
> -	if (!dev->driver->release && !dev->managed.final_kfree) {
> -		WARN_ON(!list_empty(&dev->managed.resources));
> -		kfree(dev);
> -	} else if (dev->managed.final_kfree)
> +	if (dev->managed.final_kfree)
>  		kfree(dev->managed.final_kfree);
>  }
>  
> @@ -961,6 +957,8 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
>  	if (!driver->load)
>  		drm_mode_config_validate(dev);
>  
> +	WARN_ON(!dev->managed.final_kfree);

That's too aggressive. Driver freeing their private object in .release()
isn't wrong. I'd even go as far as saying that it should be the norm,
until we manage to find a better way to handle that (which this series
doesn't achieve). Many drivers need to allocate resources at probe time
before they get a chance to init the drm device. Those resources must be
released in the error handling paths of probe. By requiring
drmm_add_final_kfree(), you're making that much more complex. I can't
release those resources in the error path anymore after calling
drmm_add_final_kfree(), or they will be released twice. And I can't rely
on drmm_* to release them in all cases, as the error path may be hit
before touching anything drm-related.

Until we figure out a good way forward and test it on a significant
number of drivers, let's not add WARN_ON() that will be hit with the
majority of drivers, forcing them to be converted to something that is
clearly half-baked.

> +
>  	if (drm_dev_needs_global_mutex(dev))
>  		mutex_lock(&drm_global_mutex);
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
