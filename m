Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B773D4FC9
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 21:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68DD896DD;
	Sun, 25 Jul 2021 19:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063976E4A1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 19:58:37 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id b5aa65f6-ed82-11eb-9082-0050568c148b;
 Sun, 25 Jul 2021 19:58:41 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 97472194B04;
 Sun, 25 Jul 2021 21:58:54 +0200 (CEST)
Date: Sun, 25 Jul 2021 21:58:33 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 3/5] drm/gem: Clear mapping addresses for unused
 framebuffer planes
Message-ID: <YP3CaVPRsq9OXinm@ravnborg.org>
References: <20210725174438.24493-1-tzimmermann@suse.de>
 <20210725174438.24493-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210725174438.24493-4-tzimmermann@suse.de>
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
Cc: hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 melissa.srw@gmail.com, noralf@tronnes.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 25, 2021 at 07:44:36PM +0200, Thomas Zimmermann wrote:
> Set the returned mapping address to NULL if a framebuffer plane does
> not have a BO associated with it. Likewise, ignore mappings of NULL
> during framebuffer unmap operations. Allows users of the functions to
> perform unmap operations of certain BOs by themselfes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index 243affbad437..02928607a716 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -336,8 +336,10 @@ int drm_gem_fb_vmap(struct drm_framebuffer *fb,
>  
>  	for (i = 0; i < DRM_FORMAT_MAX_PLANES; ++i) {
>  		obj = drm_gem_fb_get_obj(fb, i);
> -		if (!obj)
> +		if (!obj) {
> +			dma_buf_map_clear(&map[i]);
>  			continue;
> +		}
>  		ret = drm_gem_vmap(obj, &map[i]);
>  		if (ret)
>  			goto err_drm_gem_vunmap;
> @@ -377,6 +379,8 @@ void drm_gem_fb_vunmap(struct drm_framebuffer *fb,
>  		obj = drm_gem_fb_get_obj(fb, i);
>  		if (!obj)
>  			continue;
> +		if (dma_buf_map_is_null(&map[i]))
> +			continue;
>  		drm_gem_vunmap(obj, &map[i]);
>  	}
>  }
> -- 
> 2.32.0
