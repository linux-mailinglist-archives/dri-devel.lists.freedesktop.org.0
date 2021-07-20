Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5604C3CFB93
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 16:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888526E3EF;
	Tue, 20 Jul 2021 14:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00236E3F4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 14:08:36 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso2130335wmj.4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 07:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=vdj/876kbj9otjV0SXLMGMJadLoRz/MWE+rabeKCiRs=;
 b=ez54kYqit1kD8uQyQxcQe8M9Z5tOkNmZnsUiOZGUePvnwGXLbG946Dkr03BbDFCQpf
 s8/LFEKMgoxoja8qKu2j/lNl53l/KhEzxNacpIh4zg1yF6wm3BbMo2EjzOu7JKkpGMPn
 Ye0fDTd99UcNVzQ9C+eWxJhBhNj1sn4lZIbr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=vdj/876kbj9otjV0SXLMGMJadLoRz/MWE+rabeKCiRs=;
 b=K81r4OFxt0vNiy6HM5rKe03rQIyIsM3uPoEL89X2dLHGYbFaMXMBB3alUa4nWg1sO2
 77ax8OqUpTjb+40OAUXEB/ws5qSocwsVfjrrwN+D/BNhokYxMOubP9xqgIE+eUp+Hr72
 q0vEbOnDngFlhlE6IPIKo9CSj8JCOAXMPNzddQg+XJraSDrNJaonEloqr9+TEvyCiBid
 Hz6iYzAJ4X24GPLtko/UO6XK3j8CtgjeEUAuzOTG1wPgBy6tktlyqlQfs87tdtgC1UWn
 kqZiScfuRdApDAqbP7BsqkNqaUde1DO8dZjlaPmkZX4JcLw7KUKiDQNPUB886aqcVk3S
 6xgA==
X-Gm-Message-State: AOAM5312R5Pk9C9WAyGnn33maaNCTu/I0TGMJgitMy6YRCMt7fk7q3ia
 M14ws8vhKfNBlkyAi/ax4vNeSw==
X-Google-Smtp-Source: ABdhPJxMU++IY5nRb5dHWOBB6cPsmCpD91+OygobkfIENh5fKb+3nWKdQaWO6CUlP10eV7boXeOv2Q==
X-Received: by 2002:a05:600c:35c1:: with SMTP id
 r1mr31996863wmq.0.1626790115511; 
 Tue, 20 Jul 2021 07:08:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a207sm3004661wme.27.2021.07.20.07.08.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 07:08:35 -0700 (PDT)
Date: Tue, 20 Jul 2021 16:08:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 04/11] drm: Drop drm_gem_object_put_locked()
Message-ID: <YPbY4RG2VV+5Cd65@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>
References: <20210717202924.987514-1-robdclark@gmail.com>
 <20210717202924.987514-5-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210717202924.987514-5-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 17, 2021 at 01:29:06PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Now that no one is using it, remove it.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Yay!

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_gem.c | 22 ----------------------
>  include/drm/drm_gem.h     |  2 --
>  2 files changed, 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 9989425e9875..c8866788b761 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -974,28 +974,6 @@ drm_gem_object_free(struct kref *kref)
>  }
>  EXPORT_SYMBOL(drm_gem_object_free);
>  
> -/**
> - * drm_gem_object_put_locked - release a GEM buffer object reference
> - * @obj: GEM buffer object
> - *
> - * This releases a reference to @obj. Callers must hold the
> - * &drm_device.struct_mutex lock when calling this function, even when the
> - * driver doesn't use &drm_device.struct_mutex for anything.
> - *
> - * For drivers not encumbered with legacy locking use
> - * drm_gem_object_put() instead.
> - */
> -void
> -drm_gem_object_put_locked(struct drm_gem_object *obj)
> -{
> -	if (obj) {
> -		WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
> -
> -		kref_put(&obj->refcount, drm_gem_object_free);
> -	}
> -}
> -EXPORT_SYMBOL(drm_gem_object_put_locked);
> -
>  /**
>   * drm_gem_vm_open - vma->ops->open implementation for GEM
>   * @vma: VM area structure
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 240049566592..35e7f44c2a75 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -384,8 +384,6 @@ drm_gem_object_put(struct drm_gem_object *obj)
>  		__drm_gem_object_put(obj);
>  }
>  
> -void drm_gem_object_put_locked(struct drm_gem_object *obj);
> -
>  int drm_gem_handle_create(struct drm_file *file_priv,
>  			  struct drm_gem_object *obj,
>  			  u32 *handlep);
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
