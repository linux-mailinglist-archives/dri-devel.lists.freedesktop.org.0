Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2998B6C3D
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 09:54:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F8510E144;
	Tue, 30 Apr 2024 07:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="eFRoIJm+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE9710E144
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 07:54:00 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-41be416455bso1788345e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 00:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1714463639; x=1715068439; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dkIznsTVPsWYIptHZrNf6W0WMgEhcy53Bkvb87OnqM4=;
 b=eFRoIJm+K8yAN6eyJGvKVNRlTLvg1GesMOLM9v2FR4SDwNUte7VnmNs/A2zYqgtrxv
 ARV+IK4JYo6+hCF/LKZewtX3KXTILvPfUzg5pOiujuKixvBQ5Fuup6O+RuL9x8S8MtpM
 h0TqkLXsir3AARYGQj2rxntI2BfkvEr7bXcnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714463639; x=1715068439;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dkIznsTVPsWYIptHZrNf6W0WMgEhcy53Bkvb87OnqM4=;
 b=vI9K5ajenHyRgBrsC9IYMr1CMTvrAr8C+JeXzUjRyln2lxj8ACxs2HYJz0GeHJXiLZ
 WCjRib7+HdW334hzJnJsGZq4HniZc05j23fu+/SYYH1Lg4j9Z5w7NY25YRD6ZfEyPaK4
 gxixAE1hwdmkngDfUYixd1vXfmUPJw5pp8UBmkPghrkzc4rDAQtEUJPwoc9zIOPAAzVN
 FHHNgtShccdeeCKG09klu1NnFfxEo58bbbC1J4DMy9eNvCZMUL72/OPeaeL5bwaDVuVy
 YcdNvzIteKXdNvNykMuFQ/qaD6saTKmy0yVlWcGTkrN8vOrvDz7Nmo4S63SZBBnp1rO6
 AlmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo3pDUQ9giSrTN1Akm3HpoA6o3wDgh1wN4PsrOZEPLLpq6dxJSJa4zLUc/7GLbVhFyPRb9ysWBhM6WwunkENZSjg42uklr4tqa88zzNt21
X-Gm-Message-State: AOJu0YygBcpICuHppYM06hGdsQxKBY0TPY8TyFZRG0hou871f1ayDRVe
 Iiw1ladYmopK55HfZRbnhl7VNKm9s6EuDnZ6brQCz1+0UTUVLZhjJUinnSfrddw=
X-Google-Smtp-Source: AGHT+IF5QJ367cq45nSQHfCcZslzlgZVTvJqzpl8dAKwFWUxnET91L9bCT+v3YL9D4AYgPYGEvBhHA==
X-Received: by 2002:a5d:5f52:0:b0:34a:a754:eb51 with SMTP id
 cm18-20020a5d5f52000000b0034aa754eb51mr9835367wrb.3.1714463639173; 
 Tue, 30 Apr 2024 00:53:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 v2-20020adfe282000000b00346ceb9e060sm31316803wri.103.2024.04.30.00.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 00:53:58 -0700 (PDT)
Date: Tue, 30 Apr 2024 09:53:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Brandon Pollack <brpol@chromium.org>
Cc: marius.vlad@collabora.com, mairacanal@riseup.net, jshargo@chromium.org,
 hamohammed.sa@gmail.com, rodrigosiqueiramelo@gmail.com,
 linux-doc@vger.kernel.org, hirono@chromium.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com, mduggan@chromium.org, mripard@kernel.org,
 tzimmermann@suse.de
Subject: Re: [PATCH v6 3/7] drm/vkms: Provide platform data when creating
 VKMS devices
Message-ID: <ZjCjlCmMQjOzrdD0@phenom.ffwll.local>
Mail-Followup-To: Brandon Pollack <brpol@chromium.org>,
 marius.vlad@collabora.com, mairacanal@riseup.net,
 jshargo@chromium.org, hamohammed.sa@gmail.com,
 rodrigosiqueiramelo@gmail.com, linux-doc@vger.kernel.org,
 hirono@chromium.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 mduggan@chromium.org, mripard@kernel.org, tzimmermann@suse.de
References: <20230829053201.423261-1-brpol@chromium.org>
 <20230829053201.423261-4-brpol@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829053201.423261-4-brpol@chromium.org>
X-Operating-System: Linux phenom 6.6.15-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 29, 2023 at 05:30:55AM +0000, Brandon Pollack wrote:
> From: Jim Shargo <jshargo@chromium.org>
> 
> This is a small refactor to make ConfigFS support easier. This should be
> a no-op refactor.
> 
> Signed-off-by: Jim Shargo <jshargo@chromium.org>
> Signed-off-by: Brandon Pollack <brpol@chromium.org>

This should be part of the series to switch over to a real platform
driver, since we only need that with that design and not with the current
setup/init code.
-Sima

> ---
>  drivers/gpu/drm/vkms/vkms_drv.c    | 14 ++++++++++++--
>  drivers/gpu/drm/vkms/vkms_drv.h    |  9 ++++++---
>  drivers/gpu/drm/vkms/vkms_output.c |  2 +-
>  3 files changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 65b1e2c52106..6c94c2b5d529 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -9,6 +9,7 @@
>   * the GPU in DRM API tests.
>   */
>  
> +#include "asm-generic/errno-base.h"
>  #include <linux/device.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> @@ -171,12 +172,14 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
>  	dev->mode_config.preferred_depth = 0;
>  	dev->mode_config.helper_private = &vkms_mode_config_helpers;
>  
> -	return vkms_output_init(vkmsdev, 0);
> +	return vkmsdev->is_default ? vkms_output_init_default(vkmsdev) :
> +				     -EINVAL;
>  }
>  
>  static int vkms_platform_probe(struct platform_device *pdev)
>  {
>  	int ret;
> +	struct vkms_device_setup *vkms_device_setup = pdev->dev.platform_data;
>  	struct vkms_device *vkms_device;
>  	void *grp;
>  
> @@ -195,6 +198,7 @@ static int vkms_platform_probe(struct platform_device *pdev)
>  	vkms_device->config.cursor = enable_cursor;
>  	vkms_device->config.writeback = enable_writeback;
>  	vkms_device->config.overlay = enable_overlay;
> +	vkms_device->is_default = vkms_device_setup->is_default;
>  
>  	ret = dma_coerce_mask_and_coherent(vkms_device->drm.dev,
>  					   DMA_BIT_MASK(64));
> @@ -258,6 +262,9 @@ static int __init vkms_init(void)
>  {
>  	int ret;
>  	struct platform_device *pdev;
> +	struct vkms_device_setup vkms_device_setup = {
> +		.is_default = true,
> +	};
>  
>  	ret = platform_driver_register(&vkms_platform_driver);
>  	if (ret) {
> @@ -265,8 +272,11 @@ static int __init vkms_init(void)
>  		return ret;
>  	}
>  
> -	pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
> +	pdev = platform_device_register_data(NULL, DRIVER_NAME, 0,
> +					     &vkms_device_setup,
> +					     sizeof(vkms_device_setup));
>  	if (IS_ERR(pdev)) {
> +		DRM_ERROR("Unable to register default vkms device\n");
>  		platform_driver_unregister(&vkms_platform_driver);
>  		return PTR_ERR(pdev);
>  	}
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 761cd809617e..4262dcffd7e1 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -132,17 +132,20 @@ struct vkms_output {
>  	struct vkms_plane planes[VKMS_MAX_PLANES];
>  };
>  
> -struct vkms_device;
> -
>  struct vkms_config {
>  	bool writeback;
>  	bool cursor;
>  	bool overlay;
>  };
>  
> +struct vkms_device_setup {
> +	bool is_default;
> +};
> +
>  struct vkms_device {
>  	struct drm_device drm;
>  	struct platform_device *platform;
> +	bool is_default;
>  	struct vkms_output output;
>  	struct vkms_config config;
>  };
> @@ -166,7 +169,7 @@ struct vkms_crtc *vkms_crtc_init(struct vkms_device *vkmsdev,
>  				 struct drm_plane *primary,
>  				 struct drm_plane *cursor);
>  
> -int vkms_output_init(struct vkms_device *vkmsdev, int index);
> +int vkms_output_init_default(struct vkms_device *vkmsdev);
>  
>  struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>  				   enum drm_plane_type type);
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 86faf94f7408..bfc2e2362c6d 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -80,7 +80,7 @@ static struct drm_encoder *vkms_encoder_init(struct vkms_device *vkms_device)
>  	return encoder;
>  }
>  
> -int vkms_output_init(struct vkms_device *vkmsdev, int index)
> +int vkms_output_init_default(struct vkms_device *vkmsdev)
>  {
>  	struct vkms_output *output = &vkmsdev->output;
>  	struct drm_device *dev = &vkmsdev->drm;
> -- 
> 2.42.0.rc2.253.gd59a3bf2b4-goog
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
