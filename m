Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B7E17703F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 08:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D22E6E9B1;
	Tue,  3 Mar 2020 07:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC156E9B2
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 07:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583221451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=396rp1lUjwAwuzlXsp/iww2VoRLvmaxeWWTiZaWuL+g=;
 b=gh1fcWFY9HCYTBo7xItp2Jc5I5eAx2ovAEfloIwQbvLq5oZlS5NlX/EVOEQjwTCTcVxM1+
 14ujKFqYj/g3NmmX1LHDne4xS9TT5szMAEAsBHjxcSMud1LzfKV+pe9qAcChB629Xqwir2
 f/AeqoyysDErEf5J4/PKX/glrfTZmSU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-KzIT24rXOWCelZL0WLI-RA-1; Tue, 03 Mar 2020 02:44:06 -0500
X-MC-Unique: KzIT24rXOWCelZL0WLI-RA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BF72800D4E;
 Tue,  3 Mar 2020 07:44:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-150.ams2.redhat.com
 [10.36.116.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 001228D561;
 Tue,  3 Mar 2020 07:44:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 357E317449; Tue,  3 Mar 2020 08:44:02 +0100 (CET)
Date: Tue, 3 Mar 2020 08:44:02 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 04/51] drm: Set final_kfree in drm_dev_alloc
Message-ID: <20200303074402.wcb7a3lxjwnhqilo@sirius.home.kraxel.org>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-5-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20200302222631.3861340-5-daniel.vetter@ffwll.ch>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
 Thomas Zimmermann <tzimmermann@suse.de>, xen-devel@lists.xenproject.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 02, 2020 at 11:25:44PM +0100, Daniel Vetter wrote:
> I also did a full review of all callers, and only the xen driver
> forgot to call drm_dev_put in the failure path. Fix that up too.
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

Acked-by: Gerd Hoffmann <kraxel@redhat.com>

> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: xen-devel@lists.xenproject.org
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
