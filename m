Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1F82F1BA8
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 18:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE30899E8;
	Mon, 11 Jan 2021 17:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C1E899E8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 17:00:46 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id g25so270969wmh.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 09:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2g3cL0wvqzFtjOXKvL27N3/6q4I3I6VjBCf04+f3nDE=;
 b=YSeFsVkQUGuMr6ClwjwgyiCvAMpCC8zdnAEfvKUnXOz1m8X1YoR8E6Ep7qChYjNulz
 wDn2DK37HTP8OCjHIFqqy7aqBu4NZnEbFccLp70XXGNqgl4xfWvDq8Tgdu68wSZ6bf6B
 1YvgKovLReX1CPlXQkswsENSMsfBD/xsMmOEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2g3cL0wvqzFtjOXKvL27N3/6q4I3I6VjBCf04+f3nDE=;
 b=muV5QO9aLvwSLZk8eniGPtBRew3J3/ipbFwspA8QUTb9cX+bo0tpuPXQbgKKE9aQpp
 BtcEEDMFhU3VXtdz+Xir+pmW9173vfpq6lptx6cO38EjwBExr7ccWyh9El1AL5thjVH3
 3S8km8Lip0kAjVkoBt6kL97hdC2xrg26BSu4u/nnf19HRQ3ynqZYbpos9cuwmUHyYzEn
 QDG9dHUeRn6DiCvh4vfIU14KmAwditnWQyOCxw6RaI/d9bRi7jM8Z5xgqHghSvJrTOWV
 XbWUKT7zVyugFgVerZMZuXQIaJ43JQacMEWHKQ4grJYR1Fb2YpQq4OdO/+p119O0wrwD
 aWiQ==
X-Gm-Message-State: AOAM531oh1Nx4n34P09dAuV724fRcz26C5uJnUAEP8cqABaEYThSLz2W
 lqHsvDMCKvfwZSqi+BMoErGiRg==
X-Google-Smtp-Source: ABdhPJyG0LrXbaUIyyZRlVK36Q2xpcxqNl5BuI6ZeTG2aGDwDFmf1Yi6zoWIMIlGAfmk+GjScniy3Q==
X-Received: by 2002:a7b:cc94:: with SMTP id p20mr590675wma.22.1610384445461;
 Mon, 11 Jan 2021 09:00:45 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z13sm432713wmz.3.2021.01.11.09.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 09:00:44 -0800 (PST)
Date: Mon, 11 Jan 2021 18:00:42 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 06/13] drm/cirrus: Use drm_gem_shmem_vmap_local() in
 damage handling
Message-ID: <X/yEOiDNYmRo+17/@phenom.ffwll.local>
References: <20210108094340.15290-1-tzimmermann@suse.de>
 <20210108094340.15290-7-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210108094340.15290-7-tzimmermann@suse.de>
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

On Fri, Jan 08, 2021 at 10:43:33AM +0100, Thomas Zimmermann wrote:
> Damage handling in cirrus requires a short-term mapping of the source
> BO. Use drm_gem_shmem_vmap_local().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Hm more possible errors that we don't report to userspace ... Why don't we
vmap/vunmap these in prepare/cleanup_fb? Generally we'd want a long-term
vmap here to make sure this all works nicely.

Since it's nothing new, on this patch:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/tiny/cirrus.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
> index a043e602199e..21cd7056d45f 100644
> --- a/drivers/gpu/drm/tiny/cirrus.c
> +++ b/drivers/gpu/drm/tiny/cirrus.c
> @@ -315,6 +315,7 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
>  			       struct drm_rect *rect)
>  {
>  	struct cirrus_device *cirrus = to_cirrus(fb->dev);
> +	struct drm_gem_object *obj = fb->obj[0];
>  	struct dma_buf_map map;
>  	void *vmap;
>  	int idx, ret;
> @@ -323,9 +324,12 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
>  	if (!drm_dev_enter(&cirrus->dev, &idx))
>  		goto out;
>  
> -	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
> +	ret = dma_resv_lock(obj->resv, NULL);
>  	if (ret)
>  		goto out_dev_exit;
> +	ret = drm_gem_shmem_vmap_local(fb->obj[0], &map);
> +	if (ret)
> +		goto out_dma_resv_unlock;
>  	vmap = map.vaddr; /* TODO: Use mapping abstraction properly */
>  
>  	if (cirrus->cpp == fb->format->cpp[0])
> @@ -345,9 +349,11 @@ static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
>  	else
>  		WARN_ON_ONCE("cpp mismatch");
>  
> -	drm_gem_shmem_vunmap(fb->obj[0], &map);
>  	ret = 0;
>  
> +	drm_gem_shmem_vunmap_local(obj, &map);
> +out_dma_resv_unlock:
> +	dma_resv_unlock(obj->resv);
>  out_dev_exit:
>  	drm_dev_exit(idx);
>  out:
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
