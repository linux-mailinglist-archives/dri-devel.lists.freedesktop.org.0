Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9A31645CE
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 14:39:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABBF6EBDE;
	Wed, 19 Feb 2020 13:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB846E7E6;
 Wed, 19 Feb 2020 13:39:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4FB2E2F9;
 Wed, 19 Feb 2020 14:39:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582119558;
 bh=LyUONTSrdds7t3gz62H8MOFqWkmg+wPrBzed1rOyYiQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GDZDd/u5eH4Y/7GygTdJqJJmFrn3hhVkcuts6v0LOA7RJL/e7uodMW5U5n6fz2MZI
 92Fp3L2aSCKUoNZV4opTYicob4qbQIKcipwE7wIMeglUpHc3hPgEvCwqLeO6TnLFg4
 /cUkChpTe5Lrq1QfAAqfOTQKzMKaQUWFr5EvKF60=
Date: Wed, 19 Feb 2020 15:39:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 04/52] drm: Set final_kfree in drm_dev_alloc
Message-ID: <20200219133900.GE5070@pendragon.ideasonboard.com>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
 <20200219102122.1607365-5-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219102122.1607365-5-daniel.vetter@ffwll.ch>
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

Hi Daniel,

Thank you for the patch.

On Wed, Feb 19, 2020 at 11:20:34AM +0100, Daniel Vetter wrote:
> I also did a full review of all callers, and only the xen driver
> forgot to call drm_dev_put in the failure path. Fix that up too.

I'd split this patch in two then, with the Xen first coming first, and
with an explanation in the commit message of the second patch about why
you call drmm_add_final_kfree() in drm_dev_alloc().

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
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: xen-devel@lists.xenproject.org
> ---
>  drivers/gpu/drm/drm_drv.c           | 3 +++
>  drivers/gpu/drm/xen/xen_drm_front.c | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 3e5627d6eba6..9e62e28bbc62 100644
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

drmm_add_final_kfree() can only be called once. Does this mean that a
driver using drm_dev_alloc() isn't allowed to use drmm_add_final_kfree()
to tract its own private structure ?

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

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
