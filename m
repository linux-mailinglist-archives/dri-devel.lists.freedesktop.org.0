Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D66A94E9AA
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 11:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4323C10E187;
	Mon, 12 Aug 2024 09:24:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="OwCWyDN4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06DA10E176
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 09:24:43 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5bd38125fd6so85684a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 02:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1723454682; x=1724059482; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qfDePbACNEJyXkn1NuDBaQVxTKPG+PH9QdgiWTsQFw4=;
 b=OwCWyDN4QDvPva7MR1CoL1V+5GOJrx5kPRSpK13qw6e2NqNckcJKbwv2y6Rac0Xn9J
 HbfrfiXg3yP6mZKQB9Gon+4JjLf2SlORzgxWSYq38+UQYaGtk8wF5i8T8uhrn8XIvGSj
 Sy5ecXYxRSpE/kQyQRwd1EY61rS0LFstlDdkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723454682; x=1724059482;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qfDePbACNEJyXkn1NuDBaQVxTKPG+PH9QdgiWTsQFw4=;
 b=NLJP4dTrbRjBX8ItkVHhFbOVrm+7zgglfnlXQLa+sIX0dOVxm+acNKcpq6HSMewpgQ
 I/1CzhCibpgENo34dSGGr3dYXDdqiN6dPb8qbs5POySgJDlfMU8xsidXbzK8vMLWqyFY
 jsIo4El1iGf5As7tCbpDznBQt4sW1DjYmjfHGr7hLmpd0ynnxBrPi8PzTZZrjhUqYDXq
 9VH2lqA2Rlblgk7tKrfVH+FbbTjGjvhORcZ94xT7HLtFf9Nd6rBzKZZD5BYkzodSIXRl
 9UttvTrZYY23ADPTUcusoo1bKggVsS+wz97W8OAmYP64knUh5MyKv/ZjFnIur6hXmALh
 oacA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMFfUTSz5YavwZXR4PTD9TfFHTc+XHVE+5lYZ0xKFYZ/HkuOdysIqZPvtQ7qLd+6cKAaSDKa2gXRE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEoCu0m+VDsKGBFcGaGGJbtDvMwiGu2xW4Kdy7fSwdZTr09jgd
 ES3e8TPp8W53YMaj0aPRwXigc7T4e3glgpqubSLxdX95QoTo2JHLyceXhCpWPNI=
X-Google-Smtp-Source: AGHT+IFflcfI+5IHwTwpaIz9O/DP2+uKDaA2O+8e1r+0AW9GSXVSUe9eIaE5je3jaPNmlMVnVKDTQg==
X-Received: by 2002:a05:6402:5203:b0:5a1:efd1:ca1e with SMTP id
 4fb4d7f45d1cf-5bd0a535968mr4084768a12.2.1723454682034; 
 Mon, 12 Aug 2024 02:24:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bd1a5dfeb9sm1958470a12.61.2024.08.12.02.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 02:24:41 -0700 (PDT)
Date: Mon, 12 Aug 2024 11:24:39 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 3/9] drm/nouveau: Do not set struct drm_driver.lastclose
Message-ID: <ZrnU16ATX9b3hJAP@phenom.ffwll.local>
References: <20240812083000.337744-1-tzimmermann@suse.de>
 <20240812083000.337744-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812083000.337744-4-tzimmermann@suse.de>
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

On Mon, Aug 12, 2024 at 10:28:24AM +0200, Thomas Zimmermann wrote:
> Remove the implementation of struct drm_driver.lastclose. The hook
> was only necessary before in-kernel DRM clients existed, but is now
> obsolete. The code in nouveau_vga_lastclose() is performed by
> drm_lastclose().
> 
> v2:
> - update commit description
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 1 -
>  drivers/gpu/drm/nouveau/nouveau_vga.c | 7 -------
>  drivers/gpu/drm/nouveau/nouveau_vga.h | 1 -
>  3 files changed, 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index ac7c60fb14d3..4a9a9b9c3935 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1303,7 +1303,6 @@ driver_stub = {
>  			   DRIVER_RENDER,
>  	.open = nouveau_drm_open,
>  	.postclose = nouveau_drm_postclose,
> -	.lastclose = nouveau_vga_lastclose,
>  
>  #if defined(CONFIG_DEBUG_FS)
>  	.debugfs_init = nouveau_drm_debugfs_init,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
> index 2525e08938b3..ee637f1fe03d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_vga.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
> @@ -127,10 +127,3 @@ nouveau_vga_fini(struct nouveau_drm *drm)
>  	if (runtime && nouveau_is_v1_dsm() && !nouveau_is_optimus())
>  		vga_switcheroo_fini_domain_pm_ops(drm->dev->dev);
>  }
> -
> -
> -void
> -nouveau_vga_lastclose(struct drm_device *dev)
> -{
> -	vga_switcheroo_process_delayed_switch();
> -}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.h b/drivers/gpu/drm/nouveau/nouveau_vga.h
> index 951a83f984dd..63be415d2a44 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_vga.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_vga.h
> @@ -4,6 +4,5 @@
>  
>  void nouveau_vga_init(struct nouveau_drm *);
>  void nouveau_vga_fini(struct nouveau_drm *);
> -void nouveau_vga_lastclose(struct drm_device *dev);
>  
>  #endif
> -- 
> 2.46.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
