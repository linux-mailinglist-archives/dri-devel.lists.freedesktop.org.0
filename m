Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B552F1B83
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 17:53:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 109C889DDF;
	Mon, 11 Jan 2021 16:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA1D89DDF
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 16:53:45 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id r4so512729wmh.5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 08:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BKC0evkXZWcyXdGHOdDWdLxv+2YIG23jjrv2ITmXGIQ=;
 b=f2cIISkhKkxD+6ziwoDlFIC/KnEne4zqVI9ATW8WxcwU7HfEthL+03Wj3lkxUchqS3
 /WGreq/q3CYEM1yc7ykmE2LcR8/EDk3++qTMvmg2dDKFRxjFyuVKdjbu82HfncPHeu2C
 4Mqi+7z550gOUOI+aHrTfXZ2RuzUNOGr1tf3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BKC0evkXZWcyXdGHOdDWdLxv+2YIG23jjrv2ITmXGIQ=;
 b=epbtT+qKgvQR8x/HSe2cRxXsJw2jV7CmITAnlr51NO5rr60ATyXHZkrPbCAs/4kkLr
 UJCL5tDAVEV0h+9t9szCfkXsblgfT8vjnk6mIBZDeSn+B27ssaLZtseTrW8Uc+4q7xyL
 yZOgwmABZeWBpTpMmmiRBZp5XmyBsal/TIGsxQg5iLRm21q5x5b4ZyudPL2TyfYJqtSA
 /1jezvsQbI/3wck5nHs3xcYWs99o20xH4WEJmFKIEm5n+ByCkNalZh9rnWIvTMYUxUqZ
 ggJ/280I96kKosmQHajW5i/gJVjvGGXixIjNMy5kpwaKkErlndmf5Q8hCwnIrHFR2hPm
 xzCA==
X-Gm-Message-State: AOAM532mDUxS7EfkWmbZQBYTKr0Pr17KKqKtW1HvZN4pPwN1SVzmDXKe
 NbILz+kLsLvFDQUoMsy3+CPkmA==
X-Google-Smtp-Source: ABdhPJyVeudWNsRG/VKpD0MFuEfV8F2YrsSfFQ/sscFBJ0jdG0Vu75xdwPKdNjqVKbdnVXqp/usYtQ==
X-Received: by 2002:a1c:2182:: with SMTP id h124mr545791wmh.25.1610384024539; 
 Mon, 11 Jan 2021 08:53:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u83sm440737wmu.12.2021.01.11.08.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 08:53:43 -0800 (PST)
Date: Mon, 11 Jan 2021 17:53:41 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 05/13] drm/mgag200: Use drm_gem_shmem_vmap_local() in
 damage handling
Message-ID: <X/yClQZQ0B5AMfEP@phenom.ffwll.local>
References: <20210108094340.15290-1-tzimmermann@suse.de>
 <20210108094340.15290-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210108094340.15290-6-tzimmermann@suse.de>
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
Cc: sam@ravnborg.org, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, hdegoede@redhat.com, kraxel@redhat.com,
 airlied@redhat.com, virtualization@lists.linux-foundation.org, sean@poorly.run,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 08, 2021 at 10:43:32AM +0100, Thomas Zimmermann wrote:
> Damage handling in mgag200 requires a short-term mapping of the source
> BO. Use drm_gem_shmem_vmap_local().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/mgag200/mgag200_mode.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index 1dfc42170059..a33e28d4c5e9 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -1552,22 +1552,32 @@ mgag200_handle_damage(struct mga_device *mdev, struct drm_framebuffer *fb,
>  		      struct drm_rect *clip)
>  {
>  	struct drm_device *dev = &mdev->base;
> +	struct drm_gem_object *obj = fb->obj[0];
>  	struct dma_buf_map map;
>  	void *vmap;
>  	int ret;
>  
> -	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
> +	ret = dma_resv_lock(obj->resv, NULL);
>  	if (drm_WARN_ON(dev, ret))
> -		return; /* BUG: SHMEM BO should always be vmapped */
> +		return;
> +	ret = drm_gem_shmem_vmap_local(obj, &map);
> +	if (drm_WARN_ON(dev, ret))
> +		goto err_dma_resv_unlock; /* BUG: SHMEM BO should always be vmapped */
>  	vmap = map.vaddr; /* TODO: Use mapping abstraction properly */
>  
>  	drm_fb_memcpy_dstclip(mdev->vram, vmap, fb, clip);
>  
> -	drm_gem_shmem_vunmap(fb->obj[0], &map);
> +	drm_gem_shmem_vunmap_local(obj, &map);
> +	dma_resv_unlock(obj->resv);
>  
>  	/* Always scanout image at VRAM offset 0 */
>  	mgag200_set_startadd(mdev, (u32)0);
>  	mgag200_set_offset(mdev, fb);
> +
> +	return;
> +
> +err_dma_resv_unlock:
> +	dma_resv_unlock(obj->resv);
>  }
>  
>  static void
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
