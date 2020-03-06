Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1454117C6DF
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 21:15:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B336ED63;
	Fri,  6 Mar 2020 20:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4046ED63;
 Fri,  6 Mar 2020 20:15:01 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id F286920020;
 Fri,  6 Mar 2020 21:14:58 +0100 (CET)
Date: Fri, 6 Mar 2020 21:14:57 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 28/51] drm/bochs: Drop explicit drm_mode_config_cleanup
Message-ID: <20200306201457.GC13014@ravnborg.org>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-29-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302222631.3861340-29-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=P1BnusSwAAAA:8 a=QyXUC8HyAAAA:8 a=20KFwNOVAAAA:8 a=Z4Rwk6OoAAAA:8
 a=k5p89Q0gtKR_RmKz35gA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=D0XLA9XvdZm18NrgonBM:22 a=HkZW87K1Qel5hWWM3VKY:22
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
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 02, 2020 at 11:26:08PM +0100, Daniel Vetter wrote:
> Instead rely on the automatic clean, for which we just need to check
> that drm_mode_config_init succeeded. To avoid an inversion in the
> cleanup we also have to move the dev_private allocation over to
> drmm_kzalloc.
> 
> This is made possible by a preceeding patch which added a drmm_
> cleanup action to drm_mode_config_init(), hence all we need to do to
> ensure that drm_mode_config_cleanup() is run on final drm_device
> cleanup is check the new error code for _init().
> 
> v2: Explain why this cleanup is possible (Laurent).
> 
> v3: Use drmm_mode_config_init() for more clarity (Sam, Thomas)
> 
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: virtualization@lists.linux-foundation.org

Acked-by: Sam Ravnborg <sam@ravnborg.org>


> ---
>  drivers/gpu/drm/bochs/bochs.h     |  1 -
>  drivers/gpu/drm/bochs/bochs_drv.c |  6 ++----
>  drivers/gpu/drm/bochs/bochs_kms.c | 14 +++++---------
>  3 files changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bochs/bochs.h b/drivers/gpu/drm/bochs/bochs.h
> index 917767173ee6..e5bd1d517a18 100644
> --- a/drivers/gpu/drm/bochs/bochs.h
> +++ b/drivers/gpu/drm/bochs/bochs.h
> @@ -92,7 +92,6 @@ void bochs_mm_fini(struct bochs_device *bochs);
>  
>  /* bochs_kms.c */
>  int bochs_kms_init(struct bochs_device *bochs);
> -void bochs_kms_fini(struct bochs_device *bochs);
>  
>  /* bochs_fbdev.c */
>  extern const struct drm_mode_config_funcs bochs_mode_funcs;
> diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
> index addb0568c1af..e18c51de1196 100644
> --- a/drivers/gpu/drm/bochs/bochs_drv.c
> +++ b/drivers/gpu/drm/bochs/bochs_drv.c
> @@ -7,6 +7,7 @@
>  
>  #include <drm/drm_drv.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_managed.h>
>  
>  #include "bochs.h"
>  
> @@ -21,10 +22,7 @@ static void bochs_unload(struct drm_device *dev)
>  {
>  	struct bochs_device *bochs = dev->dev_private;
>  
> -	bochs_kms_fini(bochs);
>  	bochs_mm_fini(bochs);
> -	kfree(bochs);
> -	dev->dev_private = NULL;
>  }
>  
>  static int bochs_load(struct drm_device *dev)
> @@ -32,7 +30,7 @@ static int bochs_load(struct drm_device *dev)
>  	struct bochs_device *bochs;
>  	int ret;
>  
> -	bochs = kzalloc(sizeof(*bochs), GFP_KERNEL);
> +	bochs = drmm_kzalloc(dev, sizeof(*bochs), GFP_KERNEL);
>  	if (bochs == NULL)
>  		return -ENOMEM;
>  	dev->dev_private = bochs;
> diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
> index e8cc8156d773..7f4bcfad87e9 100644
> --- a/drivers/gpu/drm/bochs/bochs_kms.c
> +++ b/drivers/gpu/drm/bochs/bochs_kms.c
> @@ -134,7 +134,11 @@ const struct drm_mode_config_funcs bochs_mode_funcs = {
>  
>  int bochs_kms_init(struct bochs_device *bochs)
>  {
> -	drm_mode_config_init(bochs->dev);
> +	int ret;
> +
> +	ret = drmm_mode_config_init(bochs->dev);
> +	if (ret)
> +		return ret;
>  
>  	bochs->dev->mode_config.max_width = 8192;
>  	bochs->dev->mode_config.max_height = 8192;
> @@ -160,11 +164,3 @@ int bochs_kms_init(struct bochs_device *bochs)
>  
>  	return 0;
>  }
> -
> -void bochs_kms_fini(struct bochs_device *bochs)
> -{
> -	if (!bochs->dev->mode_config.num_connector)
> -		return;
> -
> -	drm_mode_config_cleanup(bochs->dev);
> -}
> -- 
> 2.24.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
