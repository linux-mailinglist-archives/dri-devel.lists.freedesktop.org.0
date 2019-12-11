Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4093111BC8A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2019 20:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C8A6E0C8;
	Wed, 11 Dec 2019 19:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1E06E0C8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 19:11:34 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 298ED803EF;
 Wed, 11 Dec 2019 20:11:29 +0100 (CET)
Date: Wed, 11 Dec 2019 20:11:28 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 3/3] drm/vram-helper: Support struct
 drm_driver.gem_create_object
Message-ID: <20191211191128.GA8889@ravnborg.org>
References: <20191211180832.7159-1-tzimmermann@suse.de>
 <20191211180832.7159-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211180832.7159-4-tzimmermann@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=mAVxtZN7FGmLj0ggHvMA:9 a=CjuIK1q_8ugA:10 a=G6c-CccJbY1ROsotQExW:22
 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
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
Cc: puck.chen@hisilicon.com, dri-devel@lists.freedesktop.org,
 z.liuxinliang@hisilicon.com, kong.kongxinwei@hisilicon.com, kraxel@redhat.com,
 zourongrong@gmail.com, airlied@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Wed, Dec 11, 2019 at 07:08:32PM +0100, Thomas Zimmermann wrote:
> Drivers that what to allocate VRAM GEM objects with additional fields
> can now do this by implementing struct drm_driver.gem_create_object.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index b760fd27f3c0..d475d94e2e3e 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -2,6 +2,7 @@
>  
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_framebuffer.h>
>  #include <drm/drm_gem_ttm_helper.h>
> @@ -142,13 +143,19 @@ struct drm_gem_vram_object *drm_gem_vram_create(struct drm_device *dev,
>  						size_t size,
>  						unsigned long pg_align)
>  {
> +	struct drm_gem_object *gem;
>  	struct drm_gem_vram_object *gbo;
>  	int ret;
>  
> -	gbo = kzalloc(sizeof(*gbo), GFP_KERNEL);
> -	if (!gbo)
> +	if (dev->driver->gem_create_object)
> +		gem = dev->driver->gem_create_object(dev, size);
> +	else
> +		gem = kzalloc(sizeof(*gbo), GFP_KERNEL);
The size is (*gbo) but you assume it is a gem.
Looks wrong at first glance???

	Sam


> +	if (!gem)
>  		return ERR_PTR(-ENOMEM);
>  
> +	gbo = drm_gem_vram_of_gem(gem);
> +
>  	ret = drm_gem_vram_init(dev, gbo, size, pg_align);
>  	if (ret < 0)
>  		goto err_kfree;
> -- 
> 2.24.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
