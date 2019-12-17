Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7769F12354D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 19:57:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CEDF6E0C6;
	Tue, 17 Dec 2019 18:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26FF6E0C6;
 Tue, 17 Dec 2019 18:57:15 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 1666D2003E;
 Tue, 17 Dec 2019 19:57:14 +0100 (CET)
Date: Tue, 17 Dec 2019 19:57:12 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 4/8] drm/gem-fb-helper: convert to drm device based logging
Message-ID: <20191217185712.GC30809@ravnborg.org>
References: <20191210123050.8799-1-jani.nikula@intel.com>
 <20191210123050.8799-4-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210123050.8799-4-jani.nikula@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=Jrw2BFW5fQ4Wm3mvv7sA:9
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 10, 2019 at 02:30:46PM +0200, Jani Nikula wrote:
> Prefer drm_dbg_kms() and drm_err() over all other logging.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index b9bcd310ca2d..3a7ace19a902 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -74,8 +74,7 @@ drm_gem_fb_alloc(struct drm_device *dev,
>  
>  	ret = drm_framebuffer_init(dev, fb, funcs);
>  	if (ret) {
> -		DRM_DEV_ERROR(dev->dev, "Failed to init framebuffer: %d\n",
> -			      ret);
> +		drm_err(dev, "Failed to init framebuffer: %d\n", ret);
>  		kfree(fb);
>  		return ERR_PTR(ret);
>  	}
> @@ -160,7 +159,7 @@ drm_gem_fb_create_with_funcs(struct drm_device *dev, struct drm_file *file,
>  
>  		objs[i] = drm_gem_object_lookup(file, mode_cmd->handles[i]);
>  		if (!objs[i]) {
> -			DRM_DEBUG_KMS("Failed to lookup GEM object\n");
> +			drm_dbg_kms(dev, "Failed to lookup GEM object\n");
>  			ret = -ENOENT;
>  			goto err_gem_object_put;
>  		}
> -- 
> 2.20.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
