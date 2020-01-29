Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAD614CEA5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 17:45:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455776E400;
	Wed, 29 Jan 2020 16:45:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511C56E3F9;
 Wed, 29 Jan 2020 16:45:51 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 30107804E7;
 Wed, 29 Jan 2020 17:45:46 +0100 (CET)
Date: Wed, 29 Jan 2020 17:45:45 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 4/5] drm: Push drm_global_mutex locking in drm_open
Message-ID: <20200129164545.GA22331@ravnborg.org>
References: <20200129082410.1691996-1-daniel.vetter@ffwll.ch>
 <20200129082410.1691996-5-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129082410.1691996-5-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=taGs_qngAAAA:8
 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8 a=mkuqXOTpuORTtGt2Qt4A:9
 a=llfO7MrySwjLa4GP:21 a=mdBBOxew0v2lbHCs:21 a=CjuIK1q_8ugA:10
 a=DM_PlaNYpjARcMQr2apF:22 a=Vxmtnl_E_bksehYqCbjh:22
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

Hi Daniel.

On Wed, Jan 29, 2020 at 09:24:09AM +0100, Daniel Vetter wrote:
> We want to only take the BKL on crap drivers, but to know whether
The BKL was killed long time ago..
In other words I was confused until I realized that
- BKL
- drm_global_mutex BKL
- drm_global_mutex

Was all the same. At least my OCD color me confused as is.

> we have a crap driver we first need to look it up. Split this shuffle
> out from the main BKL-disabling patch, for more clarity.
> 
> Since the minors are refcounted drm_minor_acquire is purely internal
> and this does not have a driver visible effect.
> 
> v2: Push the locking even further into drm_open(), suggested by Chris.
> This gives us more symmetry with drm_release(), and maybe a futuer
> avenue where we make drm_globale_mutex locking (partially) opt-in like
s/drm_globale_mutex/drm_global_mutex/

> with drm_release_noglobal().
> 
> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Above is IMO fix-while-committing stuff.

	Sam

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
>  	DRM_DEBUG("\n");
>  
> -	mutex_lock(&drm_global_mutex);
>  	minor = drm_minor_acquire(iminor(inode));
> -	if (IS_ERR(minor)) {
> -		err = PTR_ERR(minor);
> -		goto out_unlock;
> -	}
> +	if (IS_ERR(minor))
> +		return PTR_ERR(minor);
>  
>  	new_fops = fops_get(minor->dev->driver->fops);
>  	if (!new_fops) {
>  		err = -ENODEV;
> -		goto out_release;
> +		goto out;
>  	}
>  
>  	replace_fops(filp, new_fops);
> @@ -1104,10 +1101,9 @@ static int drm_stub_open(struct inode *inode, struct file *filp)
>  	else
>  		err = 0;
>  
> -out_release:
> +out:
>  	drm_minor_release(minor);
> -out_unlock:
> -	mutex_unlock(&drm_global_mutex);
> +
>  	return err;
>  }
>  
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 1075b3a8b5b1..d36cb74ebe0c 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -378,6 +378,8 @@ int drm_open(struct inode *inode, struct file *filp)
>  	if (IS_ERR(minor))
>  		return PTR_ERR(minor);
>  
> +	mutex_unlock(&drm_global_mutex);
> +
>  	dev = minor->dev;
>  	if (!atomic_fetch_inc(&dev->open_count))
>  		need_setup = 1;
> @@ -395,10 +397,14 @@ int drm_open(struct inode *inode, struct file *filp)
>  			goto err_undo;
>  		}
>  	}
> +
> +	mutex_unlock(&drm_global_mutex);
> +
>  	return 0;
>  
>  err_undo:
>  	atomic_dec(&dev->open_count);
> +	mutex_unlock(&drm_global_mutex);
>  	drm_minor_release(minor);
>  	return retcode;
>  }
> -- 
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
