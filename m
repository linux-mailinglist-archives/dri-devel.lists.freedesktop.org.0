Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 536CB2F1BAA
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 18:01:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F9189B9A;
	Mon, 11 Jan 2021 17:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2067A89B9A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 17:01:08 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id g185so548742wmf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 09:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=h0Vcdr3u2Wixid8zktcI7cI+5TKj52I2FHlTJKRSBHc=;
 b=kIa/HvmC5VFVR+bpiDN8EWfF1Ft5f8oGplJEb1RRZB5iSBFjlp6S+gufUJW/+0Sg9p
 gEk7J80sOTVLe9dP0l7xmrvNCNZZtUvOKJ1YtJ+zgKhzTyL2EnZ/Q/8XISk0mNO4J2IQ
 CU/YWPaRXAbEo28w2H72Bj4Ao5TZKb+EhUuvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h0Vcdr3u2Wixid8zktcI7cI+5TKj52I2FHlTJKRSBHc=;
 b=tPvENaw+I5hPaky4KQeUOG1dyZN84EBL7FPns131jXTtVPpa4WhquW+BsxxyGSaARr
 MUJkOkQNJdforhZ53jw3qqVoZqKsCIj/CgPPGZYKqdp2APeWlRqlznLi5kqQqHiLnOsn
 YHlSzrH2wJvIBVlAelDv/oUIA9TxNiq3IwMHoniUSQd5IeRRW24sZ5BUqR62l6u2sMYz
 +SVDc/DIRsxIg4WGgvOSrAj6rxLEtBczW9pT5TmaLAHjGZUmzTgi9kHiJrTUe/eMSPpX
 Md6KOt5kvhtub0fym8Z8az3FjXwb1zLiIl0FZEgJR4ooLeyiWuIXYLR78s+5lEJsNvMN
 dlbA==
X-Gm-Message-State: AOAM531KIUjEF61acNb8fIkmzM1DH0/vkE2/lg4ho+++TdB+Jr67JgQp
 51PiiUs8OP8ZMrlTvDoLijXrpw==
X-Google-Smtp-Source: ABdhPJwL/K8/fonepgQIrr8Jh7d27AlEEHxuAM3nq6S2KLm42gWIC6KhBdKdioyLbnmUAZH47MqlaQ==
X-Received: by 2002:a7b:c3c8:: with SMTP id t8mr577402wmj.88.1610384466811;
 Mon, 11 Jan 2021 09:01:06 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b12sm431296wmj.2.2021.01.11.09.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 09:01:06 -0800 (PST)
Date: Mon, 11 Jan 2021 18:01:04 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 07/13] drm/gm12u320: Use drm_gem_shmem_vmap_local() in
 damage handling
Message-ID: <X/yEUPX+H66Q129T@phenom.ffwll.local>
References: <20210108094340.15290-1-tzimmermann@suse.de>
 <20210108094340.15290-8-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210108094340.15290-8-tzimmermann@suse.de>
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

On Fri, Jan 08, 2021 at 10:43:34AM +0100, Thomas Zimmermann wrote:
> Damage handling in gm12u320 requires a short-term mapping of the source
> BO. Use drm_gem_shmem_vmap_local().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/tiny/gm12u320.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
> index 33f65f4626e5..b0c6e350f2b3 100644
> --- a/drivers/gpu/drm/tiny/gm12u320.c
> +++ b/drivers/gpu/drm/tiny/gm12u320.c
> @@ -265,11 +265,16 @@ static void gm12u320_copy_fb_to_blocks(struct gm12u320_device *gm12u320)
>  	y1 = gm12u320->fb_update.rect.y1;
>  	y2 = gm12u320->fb_update.rect.y2;
>  
> -	ret = drm_gem_shmem_vmap(fb->obj[0], &map);
> +	ret = dma_resv_lock(fb->obj[0]->resv, NULL);
>  	if (ret) {
> -		GM12U320_ERR("failed to vmap fb: %d\n", ret);
> +		GM12U320_ERR("failed to reserve fb: %d\n", ret);
>  		goto put_fb;
>  	}
> +	ret = drm_gem_shmem_vmap_local(fb->obj[0], &map);
> +	if (ret) {
> +		GM12U320_ERR("failed to vmap fb: %d\n", ret);
> +		goto unlock_resv;
> +	}
>  	vaddr = map.vaddr; /* TODO: Use mapping abstraction properly */
>  
>  	if (fb->obj[0]->import_attach) {
> @@ -321,8 +326,11 @@ static void gm12u320_copy_fb_to_blocks(struct gm12u320_device *gm12u320)
>  		if (ret)
>  			GM12U320_ERR("dma_buf_end_cpu_access err: %d\n", ret);
>  	}
> +
> +unlock_resv:
> +	dma_resv_unlock(fb->obj[0]->resv);

Unlock before vunmap.
-Daniel

>  vunmap:
> -	drm_gem_shmem_vunmap(fb->obj[0], &map);
> +	drm_gem_shmem_vunmap_local(fb->obj[0], &map);
>  put_fb:
>  	drm_framebuffer_put(fb);
>  	gm12u320->fb_update.fb = NULL;
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
