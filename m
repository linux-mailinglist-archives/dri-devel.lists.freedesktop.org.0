Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6896A17C70E
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 21:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5556ED75;
	Fri,  6 Mar 2020 20:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA836ED74;
 Fri,  6 Mar 2020 20:29:12 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id BC70F20020;
 Fri,  6 Mar 2020 21:29:10 +0100 (CET)
Date: Fri, 6 Mar 2020 21:29:09 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 19/51] drm: Cleanups after drmm_add_final_kfree rollout
Message-ID: <20200306202909.GE14757@ravnborg.org>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-20-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302222631.3861340-20-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=cBBtiGV41hfk0zP-BIUA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=Vxmtnl_E_bksehYqCbjh:22
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

On Mon, Mar 02, 2020 at 11:25:59PM +0100, Daniel Vetter wrote:
> A few things:
> - Update the example driver in the documentation.
> - We can drop the old kfree in drm_dev_release.
> - Add a WARN_ON check in drm_dev_register to make sure everyone calls
>   drmm_add_final_kfree and there's no leaks.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/drm_drv.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 7b84ee8a5eb5..1a048325f30e 100644
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
> @@ -961,6 +960,8 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
>  	struct drm_driver *driver = dev->driver;
>  	int ret;
>  
> +	WARN_ON(!dev->managed.final_kfree);
> +
>  	if (drm_dev_needs_global_mutex(dev))
>  		mutex_lock(&drm_global_mutex);
>  
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
