Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6D817CCC2
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 09:06:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF28389E98;
	Sat,  7 Mar 2020 08:06:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC0289E98;
 Sat,  7 Mar 2020 08:06:15 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7B71B804D5;
 Sat,  7 Mar 2020 09:06:10 +0100 (CET)
Date: Sat, 7 Mar 2020 09:06:08 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 04/51] drm: Set final_kfree in drm_dev_alloc
Message-ID: <20200307080608.GA28810@ravnborg.org>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-5-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302222631.3861340-5-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=20KFwNOVAAAA:8
 a=DBfv99YmAAAA:8 a=cWRNjhkoAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=LthJQcoHPxg11W9in8gA:9
 a=CjuIK1q_8ugA:10 a=c73wXdw0ADZYY2z2LwuN:22 a=sVa6W5Aao32NNC1mekxh:22
 a=AjGcO6oz07-iQ99wixmX:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 02, 2020 at 11:25:44PM +0100, Daniel Vetter wrote:
> I also did a full review of all callers, and only the xen driver
> forgot to call drm_dev_put in the failure path. Fix that up too.

So ~40 callers - phew..

> 
> v2: I noticed that xen has a drm_driver.release hook, and uses
> drm_dev_alloc(). We need to remove the kfree from
> xen_drm_drv_release().
> 
> bochs also has a release hook, but leaked the drm_device ever since
> 
> commit 0a6659bdc5e8221da99eebb176fd9591435e38de
> Author: Gerd Hoffmann <kraxel@redhat.com>
> Date:   Tue Dec 17 18:04:46 2013 +0100
> 
>     drm/bochs: new driver
> 
> This patch here fixes that leak.
> 
> Same for virtio, started leaking with
> 
> commit b1df3a2b24a917f8853d43fe9683c0e360d2c33a
> Author: Gerd Hoffmann <kraxel@redhat.com>
> Date:   Tue Feb 11 14:58:04 2020 +0100
> 
>     drm/virtio: add drm_driver.release callback.
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: xen-devel@lists.xenproject.org

The above will be picked up by tools as regular Cc: lines.
But I guess it is fine.

> 
> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: xen-devel@lists.xenproject.org

For the drivers I looked at everything looked fine.

Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/drm_drv.c           | 3 +++
>  drivers/gpu/drm/xen/xen_drm_front.c | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 153050fc926c..7b84ee8a5eb5 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -39,6 +39,7 @@
>  #include <drm/drm_color_mgmt.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_mode_object.h>
>  #include <drm/drm_print.h>
>  
> @@ -819,6 +820,8 @@ struct drm_device *drm_dev_alloc(struct drm_driver *driver,
>  		return ERR_PTR(ret);
>  	}
>  
> +	drmm_add_final_kfree(dev, dev);
> +
>  	return dev;
>  }
>  EXPORT_SYMBOL(drm_dev_alloc);
> diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
> index 4be49c1aef51..d22b5da38935 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front.c
> @@ -461,7 +461,6 @@ static void xen_drm_drv_release(struct drm_device *dev)
>  	drm_mode_config_cleanup(dev);
>  
>  	drm_dev_fini(dev);
> -	kfree(dev);
>  
>  	if (front_info->cfg.be_alloc)
>  		xenbus_switch_state(front_info->xb_dev,
> @@ -561,6 +560,7 @@ static int xen_drm_drv_init(struct xen_drm_front_info *front_info)
>  fail_modeset:
>  	drm_kms_helper_poll_fini(drm_dev);
>  	drm_mode_config_cleanup(drm_dev);
> +	drm_dev_put(drm_dev);
>  fail:
>  	kfree(drm_info);
>  	return ret;
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
