Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F78566701D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 11:46:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8630110E190;
	Thu, 12 Jan 2023 10:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1999B10E190
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 10:46:27 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id i9so26283637edj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 02:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pdjVCDoYuER8aQX000mRwMme0SEyh6/Rn/WjB88pdXU=;
 b=SGkOzrMRBs+WJkdAwJMVHebyjXXCD08ZuSgMpnqCq+E4xUUs2Ck1XBaQteVhjO6H7v
 ufEwDvWfwY1cFpR85tM5HmeLvxJmoWeJdvfmV2PqzU2wS3prTQoINwoPu8Ksv5PY09qd
 XabQicDdq79rsTpVbnCu+2Zn8o8wqdZ5dAPrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pdjVCDoYuER8aQX000mRwMme0SEyh6/Rn/WjB88pdXU=;
 b=Y67DJhfxNN1oUztO/yMSnmH0EDW3iaEed1Rq6fYc9EJAmjbnwv1YQq4w79s1VfRhm6
 562rAesj9GHkNq92w5UygeGAHxEcuYVtcw41pXvHQPLtEZGJ7IKtQjlXaNa0WHtjDAgY
 mdXSd30LMVu/x6kU1o0bSLrh5P7WNUk11Af0XRjfg6acOZpJx4bpRx/8quBXQIMMINGu
 Mxckw9znFsChMWMY7USiVz5vOa4mBT6f+7z41UG7iiEnSj3vuv+zOC2ZwD/7paiJZhon
 2qZ8asos9+IR1D7DY/HvtNevSjgexbEFTLISFe4isZ1DEfuudj7zlCcPVK9DQoL7uPKw
 jaaw==
X-Gm-Message-State: AFqh2kpeckMDiSpgwl9DhE/+86xncs/LjcFWZpdmdbn7BGLu8NhXbWf3
 O1/8tzt3z5/crhYqlxqtPXC9RQ==
X-Google-Smtp-Source: AMrXdXsZr7a5IlECty9pSJ3LfzCMBSrhoqnDA85Zh/t82K+Sr6SaS+AKXMsOzvVnYSgfcRGPB2iMJQ==
X-Received: by 2002:a50:ff02:0:b0:491:6897:c5cb with SMTP id
 a2-20020a50ff02000000b004916897c5cbmr23617282edu.41.1673520386535; 
 Thu, 12 Jan 2023 02:46:26 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 cz26-20020a0564021cba00b0048ea96cb900sm7077841edb.23.2023.01.12.02.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 02:46:25 -0800 (PST)
Date: Thu, 12 Jan 2023 11:46:23 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm/vc4: bo: Fix drmm_mutex_init memory hog
Message-ID: <Y7/k/w9qtT5/Yur0@phenom.ffwll.local>
References: <20230112091243.490799-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230112091243.490799-1-maxime@cerno.tech>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 12, 2023 at 10:12:43AM +0100, Maxime Ripard wrote:
> Commit 374146cad469 ("drm/vc4: Switch to drmm_mutex_init") converted,
> among other functions, vc4_create_object() to use drmm_mutex_init().
> 
> However, that function is used to allocate a BO, and therefore the
> mutex needs to be freed much sooner than when the DRM device is removed
> from the system.
> 
> For each buffer allocation we thus end up allocating a small structure
> as part of the DRM-managed mechanism that is never freed, eventually
> leading us to no longer having any free memory anymore.
> 
> Let's switch back to mutex_init/mutex_destroy to deal with it properly.
> 
> Fixes: 374146cad469 ("drm/vc4: Switch to drmm_mutex_init")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

oops :-)

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/vc4/vc4_bo.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
> index c2b7573bd92b..49320e4d595d 100644
> --- a/drivers/gpu/drm/vc4/vc4_bo.c
> +++ b/drivers/gpu/drm/vc4/vc4_bo.c
> @@ -179,6 +179,7 @@ static void vc4_bo_destroy(struct vc4_bo *bo)
>  		bo->validated_shader = NULL;
>  	}
>  
> +	mutex_destroy(&bo->madv_lock);
>  	drm_gem_dma_free(&bo->base);
>  }
>  
> @@ -406,9 +407,7 @@ struct drm_gem_object *vc4_create_object(struct drm_device *dev, size_t size)
>  	bo->madv = VC4_MADV_WILLNEED;
>  	refcount_set(&bo->usecnt, 0);
>  
> -	ret = drmm_mutex_init(dev, &bo->madv_lock);
> -	if (ret)
> -		return ERR_PTR(ret);
> +	mutex_init(&bo->madv_lock);
>  
>  	mutex_lock(&vc4->bo_lock);
>  	bo->label = VC4_BO_TYPE_KERNEL;
> -- 
> 2.39.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
