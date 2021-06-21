Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BA63AEB2F
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 16:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E856E182;
	Mon, 21 Jun 2021 14:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C0E6E182
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 14:25:13 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id f15so4457517wro.8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 07:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=N8KORs1w5sO5Pt8tvYP3PqKHK+tsp4Q8XjedmOUr0+I=;
 b=VHh+2mmwhGNltgxbiIC+DldZJb2u+ZHeIQQqrsWcN7mpfPYQ0GSjzxa8b7bf3x37Bz
 25EO6uOjhKyqOeC9APlx3BBggF6hPQKt60xGOpQISihSymf3JO5lS4b8NLYcsFMrnXIh
 +pZ9lkDoTUf9jhKJeWQsyBtTvzWptqRCh/OH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=N8KORs1w5sO5Pt8tvYP3PqKHK+tsp4Q8XjedmOUr0+I=;
 b=VhR9Op70tp3MnkbuTgtCEgcgFlVkL29t/Xb0pAHyg7smTQ2aJTJsMz5tkgxWJs4KfX
 JtFaUbxUbfU02VBXdJQGfL3NinR50Mj0EXJ4SXtNFoC6rlnjMGSi5doZO8W73ZB/Y0Yi
 /MWAY2t5k7p7vnoxVmVDPrcCH638fisc8C0uoOmHDr4yZsxTfj25XIdZPaYV9RzVQBH4
 0NC5bhe3pwgscSFuooXv0nMhAJ9OetB0xT8GK7YwzWXUPeKLi+ryT7B0NPMO/03qFxwH
 MoFrHQxOjmJrO4CKczGPY84m6BeLazJ+Yf6bPzqk32XDivPGPKecTAiu377mS0l9jZD7
 TDMg==
X-Gm-Message-State: AOAM533pZv3e8YBA45vdbP0UWeblwVPjtTNT0f1qPRQFBY2zNcziJy65
 si8jvQt75oqHAzelgX/2WNv/7w==
X-Google-Smtp-Source: ABdhPJzWikMDb6HRHwnrjRscIwfDp8Y3d+qprOGR+QBWeCWpaL374TxTEE7RKVa8r9yVS4mSkemp/Q==
X-Received: by 2002:adf:f743:: with SMTP id z3mr19302639wrp.329.1624285512590; 
 Mon, 21 Jun 2021 07:25:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z10sm16679734wmp.39.2021.06.21.07.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 07:25:12 -0700 (PDT)
Date: Mon, 21 Jun 2021 16:25:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH v3 1/2] drm: add a locked version of drm_is_current_master
Message-ID: <YNChRvGjIz6++jnd@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, sumit.semwal@linaro.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 emil.l.velikov@gmail.com
References: <20210620110327.4964-1-desmondcheongzx@gmail.com>
 <20210620110327.4964-2-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210620110327.4964-2-desmondcheongzx@gmail.com>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, gregkh@linuxfoundation.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com, linaro-mm-sig@lists.linaro.org,
 emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 20, 2021 at 07:03:26PM +0800, Desmond Cheong Zhi Xi wrote:
> While checking the master status of the DRM file in
> drm_is_current_master(), the device's master mutex should be
> held. Without the mutex, the pointer fpriv->master may be freed
> concurrently by another process calling drm_setmaster_ioctl(). This
> could lead to use-after-free errors when the pointer is subsequently
> dereferenced in drm_lease_owner().
> 
> The callers of drm_is_current_master() from drm_auth.c hold the
> device's master mutex, but external callers do not. Hence, we implement
> drm_is_current_master_locked() to be used within drm_auth.c, and
> modify drm_is_current_master() to grab the device's master mutex
> before checking the master status.
> 
> Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

Merged to drm-misc-fixes, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/drm_auth.c | 51 ++++++++++++++++++++++++--------------
>  1 file changed, 32 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index 232abbba3686..86d4b72e95cb 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -61,6 +61,35 @@
>   * trusted clients.
>   */
>  
> +static bool drm_is_current_master_locked(struct drm_file *fpriv)
> +{
> +	lockdep_assert_held_once(&fpriv->master->dev->master_mutex);
> +
> +	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
> +}
> +
> +/**
> + * drm_is_current_master - checks whether @priv is the current master
> + * @fpriv: DRM file private
> + *
> + * Checks whether @fpriv is current master on its device. This decides whether a
> + * client is allowed to run DRM_MASTER IOCTLs.
> + *
> + * Most of the modern IOCTL which require DRM_MASTER are for kernel modesetting
> + * - the current master is assumed to own the non-shareable display hardware.
> + */
> +bool drm_is_current_master(struct drm_file *fpriv)
> +{
> +	bool ret;
> +
> +	mutex_lock(&fpriv->master->dev->master_mutex);
> +	ret = drm_is_current_master_locked(fpriv);
> +	mutex_unlock(&fpriv->master->dev->master_mutex);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_is_current_master);
> +
>  int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
>  {
>  	struct drm_auth *auth = data;
> @@ -223,7 +252,7 @@ int drm_setmaster_ioctl(struct drm_device *dev, void *data,
>  	if (ret)
>  		goto out_unlock;
>  
> -	if (drm_is_current_master(file_priv))
> +	if (drm_is_current_master_locked(file_priv))
>  		goto out_unlock;
>  
>  	if (dev->master) {
> @@ -272,7 +301,7 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
>  	if (ret)
>  		goto out_unlock;
>  
> -	if (!drm_is_current_master(file_priv)) {
> +	if (!drm_is_current_master_locked(file_priv)) {
>  		ret = -EINVAL;
>  		goto out_unlock;
>  	}
> @@ -321,7 +350,7 @@ void drm_master_release(struct drm_file *file_priv)
>  	if (file_priv->magic)
>  		idr_remove(&file_priv->master->magic_map, file_priv->magic);
>  
> -	if (!drm_is_current_master(file_priv))
> +	if (!drm_is_current_master_locked(file_priv))
>  		goto out;
>  
>  	drm_legacy_lock_master_cleanup(dev, master);
> @@ -342,22 +371,6 @@ void drm_master_release(struct drm_file *file_priv)
>  	mutex_unlock(&dev->master_mutex);
>  }
>  
> -/**
> - * drm_is_current_master - checks whether @priv is the current master
> - * @fpriv: DRM file private
> - *
> - * Checks whether @fpriv is current master on its device. This decides whether a
> - * client is allowed to run DRM_MASTER IOCTLs.
> - *
> - * Most of the modern IOCTL which require DRM_MASTER are for kernel modesetting
> - * - the current master is assumed to own the non-shareable display hardware.
> - */
> -bool drm_is_current_master(struct drm_file *fpriv)
> -{
> -	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
> -}
> -EXPORT_SYMBOL(drm_is_current_master);
> -
>  /**
>   * drm_master_get - reference a master pointer
>   * @master: &struct drm_master
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
