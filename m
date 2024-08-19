Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0D2956D1A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 16:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F4CB10E28D;
	Mon, 19 Aug 2024 14:23:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Ap+l+7eU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C024D10E28D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 14:23:14 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4281ddd3ae8so1493505e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 07:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724077393; x=1724682193; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mu1Dv77/v+aGNumYuKz9BtkcW9O4WIITisX7d70NEY8=;
 b=Ap+l+7eUuSh0IVFnfK2C8DNzCbvwTJUjJxxn8LQw5I04TWyWP3/DR3ZUw9JTHqbQgr
 9EGtZV+qCNooTwjAlPdJ/j2wT+LsfCwJqoAd96F6XvNXX7V3qXW5OmCIjGJpJz8ilV2T
 Iy3ndKWxvfooVTV91XfMnJTCdy+BdBMFDqFV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724077393; x=1724682193;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mu1Dv77/v+aGNumYuKz9BtkcW9O4WIITisX7d70NEY8=;
 b=Xz397Gbjp2n1GaVIw0Du01SLp0cyhL1suH2KBd0MZa9deht0IxpsWx6N2mDjWj7irw
 Bln2tuHtz6PagWOzLvoGoFoklJKhIc+lzdYW2nUs87UAfiIkEsNpVZk+aY//YqOGQ5Sy
 G74f+s6yqU89iOUZ98++3GTGQTMWOqjQwUyis4ow6CyiKCvAKLvj8WbsGfDogZQ7Ez65
 eqdl7U987SUpvoiFc+QmXLJwx/aZ+jpRFMACP2Xyfh98NU/lnJgmHkGpqKQl79/qsvIN
 gMg2176YhfjOjdl74m0oDJQ8vLzBrK18E15zzzxKVDG2VSVJT0w9OJSG/atOgNpbVK2R
 f0Zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdOcXbpGdbq3xu3rtcBGqbw7J1sYQe8c6SYmVNWsSq1rbcUCsvC/bs9B3G5zK2jtJi/h0QsYnSIEg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRXeyznQu91Gm5T17UciRM+xlTgOksZvyCYJB4RGb6NL8z8Rhm
 C9Nx2HMzucPZMU6ks0trZ/XOWzQliXZG3CZa4xLdVRntn4Z8AfoWkwsX7wW1IeI=
X-Google-Smtp-Source: AGHT+IGOTBdNpg06e70Ewc3V/FepRlszCw1O4wXZJQ5pRmXl45gvZm7p5LblQvwGecCiIwcwO+f79Q==
X-Received: by 2002:a05:600c:3b0f:b0:426:6cd1:d104 with SMTP id
 5b1f17b1804b1-429ed7f72ccmr47380995e9.4.1724077392871; 
 Mon, 19 Aug 2024 07:23:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ed6507c4sm114012625e9.15.2024.08.19.07.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 07:23:12 -0700 (PDT)
Date: Mon, 19 Aug 2024 16:23:10 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 arthurgrillo@riseup.net, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH RFC 01/15] drm/vkms: Remove useles devres group
Message-ID: <ZsNVTtigz4F4-npb@phenom.ffwll.local>
Mail-Followup-To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 arthurgrillo@riseup.net, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com,
 nicolejadeyee@google.com
References: <20240814-google-remove-crtc-index-from-parameter-v1-0-6e179abf9fd4@bootlin.com>
 <20240814-google-remove-crtc-index-from-parameter-v1-1-6e179abf9fd4@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814-google-remove-crtc-index-from-parameter-v1-1-6e179abf9fd4@bootlin.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Wed, Aug 14, 2024 at 04:36:23PM +0200, Louis Chauvet wrote:
> As the driver now uses drm managed allocation, the devres group is not
> needed anymore, so remove it.

drmm isn't devres, and you still have a devres managed resource here,
namely devm_drm_dev_alloc. The reason I suggest in the review on google's
series for configfs to nuke this is that they switched over to making vkms
a proper platform driver, in which case you get a devres group
automatically for your driver binding.

But neither the explicit one or the driver binding is one devres too few
:-)

Cheers, Sima
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index e79832e10f3c..7ac3ab7e16e5 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -297,16 +297,11 @@ static int vkms_create(struct vkms_config *config)
>  	if (IS_ERR(pdev))
>  		return PTR_ERR(pdev);
>  
> -	if (!devres_open_group(&pdev->dev, NULL, GFP_KERNEL)) {
> -		ret = -ENOMEM;
> -		goto out_unregister;
> -	}
> -
>  	vkms_device = devm_drm_dev_alloc(&pdev->dev, &vkms_driver,
>  					 struct vkms_device, drm);
>  	if (IS_ERR(vkms_device)) {
>  		ret = PTR_ERR(vkms_device);
> -		goto out_devres;
> +		goto out_unregister;
>  	}
>  	vkms_device->platform = pdev;
>  	vkms_device->config = config;
> @@ -317,32 +312,30 @@ static int vkms_create(struct vkms_config *config)
>  
>  	if (ret) {
>  		DRM_ERROR("Could not initialize DMA support\n");
> -		goto out_devres;
> +		goto out_unregister;
>  	}
>  
>  	ret = drm_vblank_init(&vkms_device->drm, 1);
>  	if (ret) {
>  		DRM_ERROR("Failed to vblank\n");
> -		goto out_devres;
> +		goto out_unregister;
>  	}
>  
>  	ret = vkms_modeset_init(vkms_device);
>  	if (ret)
> -		goto out_devres;
> +		goto out_unregister;
>  
>  	drm_debugfs_add_files(&vkms_device->drm, vkms_config_debugfs_list,
>  			      ARRAY_SIZE(vkms_config_debugfs_list));
>  
>  	ret = drm_dev_register(&vkms_device->drm, 0);
>  	if (ret)
> -		goto out_devres;
> +		goto out_unregister;
>  
>  	drm_fbdev_shmem_setup(&vkms_device->drm, 0);
>  
>  	return 0;
>  
> -out_devres:
> -	devres_release_group(&pdev->dev, NULL);
>  out_unregister:
>  	platform_device_unregister(pdev);
>  	return ret;
> @@ -383,7 +376,6 @@ static void vkms_destroy(struct vkms_config *config)
>  
>  	drm_dev_unregister(&config->dev->drm);
>  	drm_atomic_helper_shutdown(&config->dev->drm);
> -	devres_release_group(&pdev->dev, NULL);
>  	platform_device_unregister(pdev);
>  
>  	config->dev = NULL;
> 
> -- 
> 2.44.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
