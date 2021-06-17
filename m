Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E419F3ABA31
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 19:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DFFD6E947;
	Thu, 17 Jun 2021 17:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6886E947
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 17:03:33 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id n7so7602573wri.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 10:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=P2OqZXWKAR/Nh7o7FiibEBbsTU6CctnyyZIJIra5gAA=;
 b=cvvPQLBdUOqIj79dOux/F+t0GCmXHos+aHXHdeFtZfyHfVVSDKe0AQRWNWG+vf36Jh
 RDiiIh+3j5dSM1eHga3sJwJzGxkOKtWFyTRGn/12TvTMX2xLbt3K+Cj5zIkgkZI+EcYR
 xX8+gfGE5Z7meEKVw+rj5pUK7yYB5jb0ZSgsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=P2OqZXWKAR/Nh7o7FiibEBbsTU6CctnyyZIJIra5gAA=;
 b=fnS0cRHhQC+k100SV3lNv5DOs90bkVTJb4w6c2bwFrxukUsdl7XQm96XLzmJuGETNn
 V65SRHIKPmDjEJEvrNqgMQcOGD+FURYb/Bi64f5tBjZ2+SxjDeWvZldFEW6IV1OgRAvP
 TOO0dh1XewLWtgj0/MHE0wk9y3RqMhySRaSqajYjLs4Y8FV7Nn63qO08bu4j5ojs6f4d
 dFB5WcCmoVoOaT2Odn1s49lOzOU5krNeEmoJ755gbrwfnDxX3t2vjRcB/KTE00Gmk9+p
 d2DvU16NyFiU9MRBSxBr/loEyTP9M/ZYrWhTNVgq/BA0EqNh66THsK0XL7E/tTpyizpE
 ct9g==
X-Gm-Message-State: AOAM532rqZwuojbiVDxPttiP6TeC9s3n5UzMxSejOsCfElVoP3Zo66o1
 mOBRCchhYUNqXwhmQ0d3voyYOA==
X-Google-Smtp-Source: ABdhPJwTwjrqCv16JL9cAsH58inHK2BluIVvwN7+zmPuBW9wkMsE6yrgGS+C7hKAYSLGaPPb+7o4nA==
X-Received: by 2002:adf:ea49:: with SMTP id j9mr7082442wrn.366.1623949412107; 
 Thu, 17 Jun 2021 10:03:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t9sm5414660wmq.14.2021.06.17.10.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 10:03:31 -0700 (PDT)
Date: Thu, 17 Jun 2021 19:03:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add a locked version of drm_is_current_master
Message-ID: <YMuAYaZF+qW7GUFT@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 emil.l.velikov@gmail.com
References: <20210615023645.6535-1-desmondcheongzx@gmail.com>
 <20210615023645.6535-2-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615023645.6535-2-desmondcheongzx@gmail.com>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, emil.l.velikov@gmail.com,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 15, 2021 at 10:36:44AM +0800, Desmond Cheong Zhi Xi wrote:
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
> ---
>  drivers/gpu/drm/drm_auth.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index 232abbba3686..c6bf52c310a9 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -61,6 +61,8 @@
>   * trusted clients.
>   */
>  
> +static bool drm_is_current_master_locked(struct drm_file *fpriv);

A bit a bikeshed, but we try to avoid forward declarations when they're
not needed. If you don't want to tear apart drm_is_current_master and the
_locked version then just move them together.

Can you pls do that and respin?

Otherwise looks all great.
-Daniel


> +
>  int drm_getmagic(struct drm_device *dev, void *data, struct drm_file *file_priv)
>  {
>  	struct drm_auth *auth = data;
> @@ -223,7 +225,7 @@ int drm_setmaster_ioctl(struct drm_device *dev, void *data,
>  	if (ret)
>  		goto out_unlock;
>  
> -	if (drm_is_current_master(file_priv))
> +	if (drm_is_current_master_locked(file_priv))
>  		goto out_unlock;
>  
>  	if (dev->master) {
> @@ -272,7 +274,7 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
>  	if (ret)
>  		goto out_unlock;
>  
> -	if (!drm_is_current_master(file_priv)) {
> +	if (!drm_is_current_master_locked(file_priv)) {
>  		ret = -EINVAL;
>  		goto out_unlock;
>  	}
> @@ -321,7 +323,7 @@ void drm_master_release(struct drm_file *file_priv)
>  	if (file_priv->magic)
>  		idr_remove(&file_priv->master->magic_map, file_priv->magic);
>  
> -	if (!drm_is_current_master(file_priv))
> +	if (!drm_is_current_master_locked(file_priv))
>  		goto out;
>  
>  	drm_legacy_lock_master_cleanup(dev, master);
> @@ -342,6 +344,13 @@ void drm_master_release(struct drm_file *file_priv)
>  	mutex_unlock(&dev->master_mutex);
>  }
>  
> +static bool drm_is_current_master_locked(struct drm_file *fpriv)
> +{
> +	lockdep_assert_held_once(&fpriv->master->dev->master_mutex);
> +
> +	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
> +}
> +
>  /**
>   * drm_is_current_master - checks whether @priv is the current master
>   * @fpriv: DRM file private
> @@ -354,7 +363,13 @@ void drm_master_release(struct drm_file *file_priv)
>   */
>  bool drm_is_current_master(struct drm_file *fpriv)
>  {
> -	return fpriv->is_master && drm_lease_owner(fpriv->master) == fpriv->minor->dev->master;
> +	bool ret;
> +
> +	mutex_lock(&fpriv->master->dev->master_mutex);
> +	ret = drm_is_current_master_locked(fpriv);
> +	mutex_unlock(&fpriv->master->dev->master_mutex);
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL(drm_is_current_master);
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
