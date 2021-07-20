Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 309303CFB8C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 16:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE9889B8E;
	Tue, 20 Jul 2021 14:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CCC89B8E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 14:05:11 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 a23-20020a05600c2257b0290236ec98bebaso2136890wmm.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 07:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Tfj+buWkLDT2+Tmek8Ri2qt32cS2LnCKWbpQbR3cgN8=;
 b=Zbe+82lL6QOsdJVgkgRvPgzy8mRG4Yy4tCkCS7/saf2DekSXDFUxx4QJkKJjl6Cyhd
 pM8C3HWcb+mSwIB14giwVo2lnoYu2kzPMtO4GAmbVCug0hhDlS6TP6eVQVmATibz23ev
 4Z0PBQgefDyZ/msTEK5fmSd0/IiYcsNGaYv2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Tfj+buWkLDT2+Tmek8Ri2qt32cS2LnCKWbpQbR3cgN8=;
 b=beKZCqZF27ZptF3Cc3pFe5wBgzknycl+xXRKmWZv/Qdrlbno2Z6PC1CBQ7rcfTjOSo
 tGMpTdTKhHZkrJNSm6mCSFYpk0JHkRJAfgF50mgdHWMOdoxYh0H0nKUnK0oA5DuclUR3
 HqvF4FXOGheCYYBjJX/PWD21Z2AtnJsjcrlX4p7/5adJFkHJ5215SgxIiUTJ/B+LLewE
 cYU4RMTxpyLukP5M5VwyIFwzSJZw+mQg13BYNGIfL6EqWzaD3Z37SbBrYyLhPUODVmy2
 SAOhq2VV58zC9quq5eNvsD2LrC+oJH1k5GQx3tqGM9J9Wbqaut/xqokNum+V7T8r0cXV
 Hp4Q==
X-Gm-Message-State: AOAM530w2huuQCcoxKKnAehbtWmuLI2T7LB2RkF3jMBJ2Z2j0k6NYjWo
 Ny3PVrthcHB8M5SmyxSpdXeVVw==
X-Google-Smtp-Source: ABdhPJzviaWv1ficXDfNSRFDOdP3wixO2JxuLx9mYPxL2QgfP/j0X4lqWWM+1vKAQz15aJaPLXS95A==
X-Received: by 2002:a7b:c7c5:: with SMTP id z5mr37085121wmk.71.1626789909835; 
 Tue, 20 Jul 2021 07:05:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u2sm2647452wmm.37.2021.07.20.07.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 07:05:09 -0700 (PDT)
Date: Tue, 20 Jul 2021 16:05:07 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/7] drm/gem: Provide drm_gem_fb_{begin, end}_cpu_access()
 helpers
Message-ID: <YPbYE0nC7WC9WvEv@phenom.ffwll.local>
References: <20210716140801.1215-1-tzimmermann@suse.de>
 <20210716140801.1215-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210716140801.1215-2-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: david@lechnology.com, airlied@linux.ie, hdegoede@redhat.com,
 noralf@tronnes.org, dri-devel@lists.freedesktop.org, airlied@redhat.com,
 sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 16, 2021 at 04:07:55PM +0200, Thomas Zimmermann wrote:
> Implement helpers drm_gem_fb_begin_cpu_access() and _end_cpu_access(),
> which call the rsp dma-buf functions for all GEM BOs of the given
> framebuffer.
> 
> Calls to dma_buf_end_cpu_access() can return an error code on failure,
> while drm_gem_fb_end_cpu_access() does not. The latter runs during DRM's
> atomic commit or during cleanup. Both cases don't allow for errors, so
> leave out the return value.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 89 ++++++++++++++++++++
>  include/drm/drm_gem_framebuffer_helper.h     |  6 ++
>  2 files changed, 95 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index e2c68822e05c..94a1c0b0edfd 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -306,6 +306,95 @@ drm_gem_fb_create_with_dirty(struct drm_device *dev, struct drm_file *file,
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_fb_create_with_dirty);
>  
> +/**
> + * drm_gem_fb_begin_cpu_access - prepares GEM buffer objects for CPU access
> + * @fb: the framebuffer
> + * @dir: access mode
> + *
> + * Prepares a framebuffer'S GEM buffer objects for CPU access. This function

			s/S/s/

> + * must be called before accessing the BO data within the kernel. For imported
> + * BOs, the function calls dma_buf_begin_cpu_access().
> + *
> + * See drm_gem_fb_end_cpu_access() for signalling the end of CPU access.
> + *
> + * Returns:
> + * 0 on success, or a negative errno code otherwise.
> + */
> +int drm_gem_fb_begin_cpu_access(struct drm_framebuffer *fb, enum dma_data_direction dir)
> +{
> +	struct dma_buf_attachment *import_attach;
> +	struct drm_gem_object *obj;
> +	size_t i;
> +	int ret, ret2;
> +
> +	for (i = 0; i < ARRAY_SIZE(fb->obj); ++i) {
> +		obj = drm_gem_fb_get_obj(fb, i);
> +		if (!obj)
> +			continue;
> +		import_attach = obj->import_attach;
> +		if (!import_attach)
> +			continue;
> +		ret = dma_buf_begin_cpu_access(import_attach->dmabuf, dir);
> +		if (ret)
> +			goto err_dma_buf_end_cpu_access;
> +	}
> +
> +	return 0;
> +
> +err_dma_buf_end_cpu_access:
> +	while (i) {
> +		--i;
> +		obj = drm_gem_fb_get_obj(fb, i);
> +		if (!obj)
> +			continue;
> +		import_attach = obj->import_attach;
> +		if (!import_attach)
> +			continue;
> +		ret2 = dma_buf_end_cpu_access(import_attach->dmabuf, dir);
> +		if (ret2) {
> +			drm_err(fb->dev,
> +				"dma_buf_end_cpu_access() failed during error handling: %d\n",
> +				ret2);
> +		}
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_gem_fb_begin_cpu_access);
> +
> +/**
> + * drm_gem_fb_end_cpu_access - signals end of CPU access to GEM buffer objects
> + * @fb: the framebuffer
> + * @dir: access mode
> + *
> + * Signals the end of CPU access to the given framebuffer'S GEM buffer objects. This

							s/S/s/

> + * function must be paired with a corresponding call to drm_gem_fb_begin_cpu_access().
> + * For imported BOs, the function calls dma_buf_end_cpu_access().
> + *
> + * See also drm_gem_fb_begin_cpu_access().
> + */
> +void drm_gem_fb_end_cpu_access(struct drm_framebuffer *fb, enum dma_data_direction dir)
> +{
> +	size_t i = ARRAY_SIZE(fb->obj);
> +	struct dma_buf_attachment *import_attach;
> +	struct drm_gem_object *obj;
> +	int ret;
> +
> +	while (i) {
> +		--i;
> +		obj = drm_gem_fb_get_obj(fb, i);
> +		if (!obj)
> +			continue;
> +		import_attach = obj->import_attach;
> +		if (!import_attach)
> +			continue;
> +		ret = dma_buf_end_cpu_access(import_attach->dmabuf, dir);
> +		if (ret)
> +			drm_err(fb->dev, "dma_buf_end_cpu_access() failed: %d\n", ret);
> +	}
> +}
> +EXPORT_SYMBOL(drm_gem_fb_end_cpu_access);
> +
>  static __u32 drm_gem_afbc_get_bpp(struct drm_device *dev,
>  				  const struct drm_mode_fb_cmd2 *mode_cmd)
>  {
> diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
> index 6bdffc7aa124..5705722f0855 100644
> --- a/include/drm/drm_gem_framebuffer_helper.h
> +++ b/include/drm/drm_gem_framebuffer_helper.h
> @@ -1,6 +1,9 @@
>  #ifndef __DRM_GEM_FB_HELPER_H__
>  #define __DRM_GEM_FB_HELPER_H__
>  
> +#include <linux/dma-buf.h>
> +#include <linux/dma-buf-map.h>
> +
>  struct drm_afbc_framebuffer;
>  struct drm_device;
>  struct drm_fb_helper_surface_size;
> @@ -34,6 +37,9 @@ struct drm_framebuffer *
>  drm_gem_fb_create_with_dirty(struct drm_device *dev, struct drm_file *file,
>  			     const struct drm_mode_fb_cmd2 *mode_cmd);
>  
> +int drm_gem_fb_begin_cpu_access(struct drm_framebuffer *fb, enum dma_data_direction dir);
> +void drm_gem_fb_end_cpu_access(struct drm_framebuffer *fb, enum dma_data_direction dir);
> +
>  #define drm_is_afbc(modifier) \
>  	(((modifier) & AFBC_VENDOR_AND_TYPE_MASK) == DRM_FORMAT_MOD_ARM_AFBC(0))

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
