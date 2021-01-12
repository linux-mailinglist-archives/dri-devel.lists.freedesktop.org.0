Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3AA2F2A70
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 09:59:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65C56E159;
	Tue, 12 Jan 2021 08:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E5B6E15A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 08:59:15 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id k10so1177619wmi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 00:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GqZbfd292c2sQog8Ere/PW5Jk+USpo47OxwE8iZOWRE=;
 b=O1Uq64y8MGmEjY260boCVRBtzTHkeoOUDqgQbqhA8mda6M4UheqmuJezOmf+T8KK+A
 GNBbcxrzA0ttNe8/yZ0IJLn28T55OFIdz0SK7dbbi/zCsuYGgz7Ne5MebMrNwORjiWVc
 QoMu94Jl4brzai2CRHOh4p/syXsterwuJIO+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GqZbfd292c2sQog8Ere/PW5Jk+USpo47OxwE8iZOWRE=;
 b=hpg/qAxOJRHj/E3dmC173en3H9t/MX80GDaoVkDFT1UJAVsPrHddhZmcHa+P79x8ky
 VHactLKxiTCVJ/pkOzdyqE+yaIAeieFD2D+Ypiu1sp2Z5wyV48xMXl14gRXjUkjpoIy+
 gJghW6Vi/Iis4vZMXjqyq/zlQj8f+k3dwlurC2wmTr0TzW/7gJBay1DQgDOctUwR2zK/
 KCxHlzcW4WMUNv3xqOGruEYG3giBur8DuKFj4obtuR2Pfb+K9m3h5ZH9TJW+DtiLpxy6
 OzmPaFaXgRJ4gLL2CyDnUIrGoIOD/pG4oQXhF3oUT5AQzUnd0yAtHpvIwj8c2mjcuWEO
 4ZEQ==
X-Gm-Message-State: AOAM531CImkDwpneoqv18aDAIuu7dNm+TcOEkLo5bkigXp+EyyUlORHl
 cHJEWSfY8rVb4ksK5/j0PfQeGl66ljElhydH
X-Google-Smtp-Source: ABdhPJzsyFVT25ad075mC5LNEzSH7DdnWIb8vRqny9Y1p7emZR+PdoVhFMTWXythQRAqpJjEfRkLCQ==
X-Received: by 2002:a05:600c:208:: with SMTP id
 8mr2564611wmi.146.1610441953979; 
 Tue, 12 Jan 2021 00:59:13 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o3sm3533801wrc.93.2021.01.12.00.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 00:59:13 -0800 (PST)
Date: Tue, 12 Jan 2021 09:59:11 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/6] drm: Inline AGP wrappers into their only callers
Message-ID: <X/1k30zps1I36JDd@phenom.ffwll.local>
References: <20210112081035.6882-1-tzimmermann@suse.de>
 <20210112081035.6882-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210112081035.6882-2-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 12, 2021 at 09:10:30AM +0100, Thomas Zimmermann wrote:
> The AGP wrapper functions serve no purpose.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

They do, without them we fail compiling (I think at least) when agp isn't
enabled. Did you check for that? I should all work if we have the dummy
inlines for relevant agp functions in linux/agp_backend.h.
-Daniel

> ---
>  drivers/gpu/drm/drm_agpsupport.c | 12 ++++++------
>  drivers/gpu/drm/drm_memory.c     | 18 ------------------
>  include/drm/drm_agpsupport.h     | 18 ------------------
>  3 files changed, 6 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_agpsupport.c b/drivers/gpu/drm/drm_agpsupport.c
> index 4c7ad46fdd21..8b690ef306de 100644
> --- a/drivers/gpu/drm/drm_agpsupport.c
> +++ b/drivers/gpu/drm/drm_agpsupport.c
> @@ -285,7 +285,7 @@ int drm_agp_unbind(struct drm_device *dev, struct drm_agp_binding *request)
>  	entry = drm_agp_lookup_entry(dev, request->handle);
>  	if (!entry || !entry->bound)
>  		return -EINVAL;
> -	ret = drm_unbind_agp(entry->memory);
> +	ret = agp_unbind_memory(entry->memory);
>  	if (ret == 0)
>  		entry->bound = 0;
>  	return ret;
> @@ -326,7 +326,7 @@ int drm_agp_bind(struct drm_device *dev, struct drm_agp_binding *request)
>  	if (!entry || entry->bound)
>  		return -EINVAL;
>  	page = DIV_ROUND_UP(request->offset, PAGE_SIZE);
> -	retcode = drm_bind_agp(entry->memory, page);
> +	retcode = agp_bind_memory(entry->memory, page);
>  	if (retcode)
>  		return retcode;
>  	entry->bound = dev->agp->base + (page << PAGE_SHIFT);
> @@ -369,11 +369,11 @@ int drm_agp_free(struct drm_device *dev, struct drm_agp_buffer *request)
>  	if (!entry)
>  		return -EINVAL;
>  	if (entry->bound)
> -		drm_unbind_agp(entry->memory);
> +		agp_unbind_memory(entry->memory);
>  
>  	list_del(&entry->head);
>  
> -	drm_free_agp(entry->memory, entry->pages);
> +	agp_free_memory(entry->memory);
>  	kfree(entry);
>  	return 0;
>  }
> @@ -453,8 +453,8 @@ void drm_legacy_agp_clear(struct drm_device *dev)
>  
>  	list_for_each_entry_safe(entry, tempe, &dev->agp->memory, head) {
>  		if (entry->bound)
> -			drm_unbind_agp(entry->memory);
> -		drm_free_agp(entry->memory, entry->pages);
> +			agp_unbind_memory(entry->memory);
> +		agp_free_memory(entry->memory);
>  		kfree(entry);
>  	}
>  	INIT_LIST_HEAD(&dev->agp->memory);
> diff --git a/drivers/gpu/drm/drm_memory.c b/drivers/gpu/drm/drm_memory.c
> index fbea69d6f909..f4f2bffdd5bd 100644
> --- a/drivers/gpu/drm/drm_memory.c
> +++ b/drivers/gpu/drm/drm_memory.c
> @@ -100,24 +100,6 @@ static void *agp_remap(unsigned long offset, unsigned long size,
>  	return addr;
>  }
>  
> -/** Wrapper around agp_free_memory() */
> -void drm_free_agp(struct agp_memory *handle, int pages)
> -{
> -	agp_free_memory(handle);
> -}
> -
> -/** Wrapper around agp_bind_memory() */
> -int drm_bind_agp(struct agp_memory *handle, unsigned int start)
> -{
> -	return agp_bind_memory(handle, start);
> -}
> -
> -/** Wrapper around agp_unbind_memory() */
> -int drm_unbind_agp(struct agp_memory *handle)
> -{
> -	return agp_unbind_memory(handle);
> -}
> -
>  #else /*  CONFIG_AGP  */
>  static inline void *agp_remap(unsigned long offset, unsigned long size,
>  			      struct drm_device *dev)
> diff --git a/include/drm/drm_agpsupport.h b/include/drm/drm_agpsupport.h
> index 664e120b93e6..f3136750c490 100644
> --- a/include/drm/drm_agpsupport.h
> +++ b/include/drm/drm_agpsupport.h
> @@ -28,10 +28,6 @@ struct drm_agp_head {
>  
>  #if IS_ENABLED(CONFIG_AGP)
>  
> -void drm_free_agp(struct agp_memory * handle, int pages);
> -int drm_bind_agp(struct agp_memory * handle, unsigned int start);
> -int drm_unbind_agp(struct agp_memory * handle);
> -
>  struct drm_agp_head *drm_agp_init(struct drm_device *dev);
>  void drm_legacy_agp_clear(struct drm_device *dev);
>  int drm_agp_acquire(struct drm_device *dev);
> @@ -61,20 +57,6 @@ int drm_agp_bind_ioctl(struct drm_device *dev, void *data,
>  
>  #else /* CONFIG_AGP */
>  
> -static inline void drm_free_agp(struct agp_memory * handle, int pages)
> -{
> -}
> -
> -static inline int drm_bind_agp(struct agp_memory * handle, unsigned int start)
> -{
> -	return -ENODEV;
> -}
> -
> -static inline int drm_unbind_agp(struct agp_memory * handle)
> -{
> -	return -ENODEV;
> -}
> -
>  static inline struct drm_agp_head *drm_agp_init(struct drm_device *dev)
>  {
>  	return NULL;
> -- 
> 2.29.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
