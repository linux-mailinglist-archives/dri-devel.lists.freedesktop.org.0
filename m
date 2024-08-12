Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9413294E9A7
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 11:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03AEC10E172;
	Mon, 12 Aug 2024 09:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ORC2b1ta";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4C410E172
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 09:24:33 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52efd91dd28so687182e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 02:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1723454671; x=1724059471; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zJwwC7NvxOGNPRdGhNuQnaArLNnaQ9jdbr05HbVMu2U=;
 b=ORC2b1talxqve8Qg67L/j0WSyFQ25x73yAl8ngKsPSgqsOhk+L2JsjWhDbb0Yhzu6w
 3yIOfwo+9fVRlwIhFrlx1S6c6ntkcK7GoGzk6cyxI9DHW+HHo1DAEzVvgZT3MLIpMP/G
 N+Yl5gnpxiOwzwv/Ih0AQ/xjreWWVEqkuqGfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723454671; x=1724059471;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zJwwC7NvxOGNPRdGhNuQnaArLNnaQ9jdbr05HbVMu2U=;
 b=nglXaZ1fCwaBUpZjTX9OMQEo/Mp5kzKrQVfnqNK3vG0yOoCO845P7lmgcUNyAO0CVt
 oFbgEK0vKnFgOWa+G0vP2oyhRI4vIXYRm1+C8VTAMNxoSz91oUJOwVn2k4toJMkD7k2c
 5yWYgCPmIRq0SECMxVFY4/zARgTgoeVKoHu6FI4LjgAvkfhK9ru3jPElIA3TCayyeNk5
 yKE2GMbXL2gCGUAEUI35d1xHlcvTNOop2zFR2A57nyqhTzXCcg8loh4/ojEVlLPUAlTP
 aJcUJ14eqhLw1ooHbkPvTO968w2sxtTnMOl0c6cCDmR3zvxFth+gH8L6z9i4u7iapJoP
 aKdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2lE6rYKY77u+0Kq+6AYUjkJgziiHFUUDjeChNJZe8VG1Iru30xdpCabYzh5uDLbOzOTb5NPK8XEo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwI8Y4tmaOTHlbuNooBwPztpfmynX6JaL6ygTSo5YoAWtGW4CT/
 NxbdEjKeq+W2YnJvMTZAo7kSM0XWIwy2B0/jhQ076EFIfFb1GbOZxdpXpJGf6Vo=
X-Google-Smtp-Source: AGHT+IFIOZStpf2467iNtxAQsVDRYlOTXLEPZ8JwWq8jWhJ0qLTHijtbjmSXUOTaE4pjzbGxfBSY1Q==
X-Received: by 2002:a05:6512:ac9:b0:52c:def2:d8af with SMTP id
 2adb3069b0e04-530eea09fc4mr3227266e87.4.1723454670928; 
 Mon, 12 Aug 2024 02:24:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80bb2136f5sm216211466b.179.2024.08.12.02.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 02:24:30 -0700 (PDT)
Date: Mon, 12 Aug 2024 11:24:28 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 2/9] drm/amdgpu: Do not set struct drm_driver.lastclose
Message-ID: <ZrnUzGX2n6aeEyTr@phenom.ffwll.local>
References: <20240812083000.337744-1-tzimmermann@suse.de>
 <20240812083000.337744-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812083000.337744-3-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.9.10-amd64 
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

On Mon, Aug 12, 2024 at 10:28:23AM +0200, Thomas Zimmermann wrote:
> Remove the implementation of struct drm_driver.lastclose. The hook
> was only necessary before in-kernel DRM clients existed, but is now
> obsolete. The code in amdgpu_driver_lastclose_kms() is performed by
> drm_lastclose().
> 
> v2:
> - update commit message
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  2 --
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 17 -----------------
>  3 files changed, 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 137a88b8de45..4baeb6519fda 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1484,7 +1484,6 @@ extern const int amdgpu_max_kms_ioctl;
>  
>  int amdgpu_driver_load_kms(struct amdgpu_device *adev, unsigned long flags);
>  void amdgpu_driver_unload_kms(struct drm_device *dev);
> -void amdgpu_driver_lastclose_kms(struct drm_device *dev);
>  int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv);
>  void amdgpu_driver_postclose_kms(struct drm_device *dev,
>  				 struct drm_file *file_priv);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 094498a0964b..5dd39e6c6223 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2953,7 +2953,6 @@ static const struct drm_driver amdgpu_kms_driver = {
>  	    DRIVER_SYNCOBJ_TIMELINE,
>  	.open = amdgpu_driver_open_kms,
>  	.postclose = amdgpu_driver_postclose_kms,
> -	.lastclose = amdgpu_driver_lastclose_kms,
>  	.ioctls = amdgpu_ioctls_kms,
>  	.num_ioctls = ARRAY_SIZE(amdgpu_ioctls_kms),
>  	.dumb_create = amdgpu_mode_dumb_create,
> @@ -2980,7 +2979,6 @@ const struct drm_driver amdgpu_partition_driver = {
>  	    DRIVER_SYNCOBJ_TIMELINE,
>  	.open = amdgpu_driver_open_kms,
>  	.postclose = amdgpu_driver_postclose_kms,
> -	.lastclose = amdgpu_driver_lastclose_kms,
>  	.ioctls = amdgpu_ioctls_kms,
>  	.num_ioctls = ARRAY_SIZE(amdgpu_ioctls_kms),
>  	.dumb_create = amdgpu_mode_dumb_create,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index 66782be5917b..0a799942343d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -1269,23 +1269,6 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>  	return 0;
>  }
>  
> -
> -/*
> - * Outdated mess for old drm with Xorg being in charge (void function now).
> - */
> -/**
> - * amdgpu_driver_lastclose_kms - drm callback for last close
> - *
> - * @dev: drm dev pointer
> - *
> - * Switch vga_switcheroo state after last close (all asics).
> - */
> -void amdgpu_driver_lastclose_kms(struct drm_device *dev)
> -{
> -	drm_fb_helper_lastclose(dev);
> -	vga_switcheroo_process_delayed_switch();
> -}
> -
>  /**
>   * amdgpu_driver_open_kms - drm callback for open
>   *
> -- 
> 2.46.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
