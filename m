Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0E61729DF
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 22:02:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832816E97E;
	Thu, 27 Feb 2020 21:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096266E97E;
 Thu, 27 Feb 2020 21:02:46 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 4835680441;
 Thu, 27 Feb 2020 22:02:43 +0100 (CET)
Date: Thu, 27 Feb 2020 22:02:42 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 13/51] drm/vgem: Use drmm_add_final_kfree
Message-ID: <20200227210242.GD29498@ravnborg.org>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
 <20200227181522.2711142-14-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227181522.2711142-14-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=QX4gbG5DAAAA:8 a=taGs_qngAAAA:8 a=cm27Pg_UAAAA:8 a=-VAfIpHNAAAA:8
 a=7gkXJVJtAAAA:8 a=0FZN23qlbBZI_fe2_qcA:9 a=CjuIK1q_8ugA:10
 a=AbAUZ8qAyYyZVLSsDulk:22 a=DM_PlaNYpjARcMQr2apF:22
 a=xmb-EsYY8bH0VWELuYED:22 a=srlwD-8ojaedGGhPAyx8:22
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Rob Clark <robdclark@chromium.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 m.felsch@pengutronix.de, DRI Development <dri-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 27, 2020 at 07:14:44PM +0100, Daniel Vetter wrote:
> With this we can drop the final kfree from the release function.
> 
> v2: After drm_dev_init/drmm_add_final_kfree we need to clean up
> everything through a drm_dev_put. Rework the unwind code to match
> that.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Emil Velikov <emil.velikov@collabora.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---

Acked-by: Sam Ravnborg <sam@ravnborg.org>

>  drivers/gpu/drm/vgem/vgem_drv.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> index 909eba43664a..7486014e9149 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -39,6 +39,7 @@
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_ioctl.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_prime.h>
>  
>  #include "vgem_drv.h"
> @@ -432,8 +433,6 @@ static void vgem_release(struct drm_device *dev)
>  
>  	platform_device_unregister(vgem->platform);
>  	drm_dev_fini(&vgem->drm);
> -
> -	kfree(vgem);
>  }
>  
>  static struct drm_driver vgem_driver = {
> @@ -489,16 +488,19 @@ static int __init vgem_init(void)
>  			   &vgem_device->platform->dev);
>  	if (ret)
>  		goto out_unregister;
> +	drmm_add_final_kfree(&vgem_device->drm, vgem_device);
>  
>  	/* Final step: expose the device/driver to userspace */
> -	ret  = drm_dev_register(&vgem_device->drm, 0);
> +	ret = drm_dev_register(&vgem_device->drm, 0);
>  	if (ret)
> -		goto out_fini;
> +		goto out_put;
>  
>  	return 0;
>  
> -out_fini:
> -	drm_dev_fini(&vgem_device->drm);
> +out_put:
> +	drm_dev_put(&vgem_device->drm);
> +	return ret;
> +
>  out_unregister:
>  	platform_device_unregister(vgem_device->platform);
>  out_free:
> -- 
> 2.24.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
