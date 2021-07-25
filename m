Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6493D4FCD
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 22:03:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009D06E4AD;
	Sun, 25 Jul 2021 20:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A26E6E4AD
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 20:03:51 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 772e8183-ed83-11eb-8d1a-0050568cd888;
 Sun, 25 Jul 2021 20:04:06 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 14F79194B77;
 Sun, 25 Jul 2021 22:04:09 +0200 (CEST)
Date: Sun, 25 Jul 2021 22:03:48 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 4/5] drm/gud: Map framebuffer BOs with drm_gem_fb_vmap()
Message-ID: <YP3DpN++yZvRVZnE@ravnborg.org>
References: <20210725174438.24493-1-tzimmermann@suse.de>
 <20210725174438.24493-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210725174438.24493-5-tzimmermann@suse.de>
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

On Sun, Jul 25, 2021 at 07:44:37PM +0200, Thomas Zimmermann wrote:
> Abstract the framebuffer details by mapping its BOs with a call
> to drm_gem_fb_vmap(). Unmap with drm_gem_fb_vunmap().
> 
> The call to drm_gem_fb_vmap() ensures that all BOs are mapped
> correctly. Gud still only supports single-plane formats.
> 
> No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Noralf Trønnes <noralf@tronnes.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/gud/gud_pipe.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
> index 4d7a26b68a2e..7e009f562b30 100644
> --- a/drivers/gpu/drm/gud/gud_pipe.c
> +++ b/drivers/gpu/drm/gud/gud_pipe.c
> @@ -14,8 +14,8 @@
>  #include <drm/drm_format_helper.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_framebuffer.h>
> +#include <drm/drm_gem.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> -#include <drm/drm_gem_shmem_helper.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_rect.h>
>  #include <drm/drm_simple_kms_helper.h>
> @@ -152,7 +152,7 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
>  {
>  	struct dma_buf_attachment *import_attach = fb->obj[0]->import_attach;
>  	u8 compression = gdrm->compression;
> -	struct dma_buf_map map;
> +	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
>  	void *vaddr, *buf;
>  	size_t pitch, len;
>  	int ret = 0;
> @@ -162,11 +162,11 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
>  	if (len > gdrm->bulk_len)
>  		return -E2BIG;
>  
> -	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
> +	ret = drm_gem_fb_vmap(fb, map);
>  	if (ret)
>  		return ret;
>  
> -	vaddr = map.vaddr + fb->offsets[0];
> +	vaddr = map[0].vaddr + fb->offsets[0];
>  
>  	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
>  	if (ret)
> @@ -225,7 +225,7 @@ static int gud_prep_flush(struct gud_device *gdrm, struct drm_framebuffer *fb,
>  end_cpu_access:
>  	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
>  vunmap:
> -	drm_gem_shmem_vunmap(fb->obj[0], &map);
> +	drm_gem_fb_vunmap(fb, map);
>  
>  	return ret;
>  }
> -- 
> 2.32.0
