Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AF766665F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 23:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3763010E143;
	Wed, 11 Jan 2023 22:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C5E10E143
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 22:46:58 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so13780058wms.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 14:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I7lSRoUQi9zwbLm3tt3t+L05kXON7rdqCLIGDJWUjp8=;
 b=JTFIuck673A9v/lIr5RWrbz79nUhslqVi7RLh/Rx613rfkdeBHXBxo2BVJtU820Oa7
 cL8kQJ6GYC+rF//ZXxPMSQxXWiXFputrkars54D4BDcF2CksFP6R7TnG+F70lLExvcuw
 cJBWlC1VRZjNyiEXHofVrnN01Oz4dnVSb04Lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I7lSRoUQi9zwbLm3tt3t+L05kXON7rdqCLIGDJWUjp8=;
 b=4xdhPpeJX7jl0A9iVvXh4Kpj70OYn6eVLZm3hsGXBFuXL0tOYv37LFep2/aBcV49p1
 FLRfX/AQx97Oa9iJgwJZ07EUiqHQ2O3R9sJZJZk+lUL5Mk1ecC7Bn0z31cALFoNHs1QX
 e96irmGJNt31naSsPwIQCSQ32KCXiaqcugiGwjCHHZ9E7fsABmoRocJ+NOSZnJvGQfir
 fcNM9NLuyQ5NTW9sHbZR/qw/MyIP/LEiqkgaQnK7QFZmSg2BkB+KolTVB4pOqyzR7gp1
 L3pAQE2zziDMMeu6RLQqya5ovhcU1u699nTJg2ueMBI8XPHXsKGK2Ew6B4557citCkzE
 jQvA==
X-Gm-Message-State: AFqh2kqF2h4Xqu43Y08wXVyWyigibkBDbCw5OwbWR+jZbw30iJwpdxFX
 IpDI7GGoKc1jipMliVvKe+vliQ==
X-Google-Smtp-Source: AMrXdXvWiVjv7Ucp9zp9AlaBE78nIFFHjHN1lu2iS7UomHHt06nVcd52/Cg6yV2Sq+HdlD1fVK5qQg==
X-Received: by 2002:a05:600c:3589:b0:3d0:6c60:b4d1 with SMTP id
 p9-20020a05600c358900b003d06c60b4d1mr64400308wmq.6.1673477217426; 
 Wed, 11 Jan 2023 14:46:57 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 r10-20020a05600c458a00b003d35acb0fd7sm26134213wmo.34.2023.01.11.14.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 14:46:56 -0800 (PST)
Date: Wed, 11 Jan 2023 23:46:54 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH 1/2] drm: Add DRM-managed alloc_workqueue() and
 alloc_ordered_workqueue()
Message-ID: <Y788XhCPXCJFA5gO@phenom.ffwll.local>
Mail-Followup-To: Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230110152447.5611-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230110152447.5611-1-jiasheng@iscas.ac.cn>
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
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 10, 2023 at 11:24:47PM +0800, Jiasheng Jiang wrote:
> Add drmm_alloc_workqueue() and drmm_alloc_ordered_workqueue(), the helpers
> that provide managed workqueue cleanup. The workqueue will be destroyed
> with the final reference of the DRM device.
> 
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>

Yeah I think this looks nice.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I'm assuming driver maintainers will pick this up, if not please holler.

Also the threading seems broken, it's not a patch series. The b4 tool or
git send-email (of all the patches of the entire series at once, not each
individually) should get this right.

Unfortunately I did't find the right link in the kernel docs, or at least
they're not as detailed as I hoped.

Also your previous submission had iirc a bunch more patches, do you plan
to include them all in the next patch set?
-Daniel


> ---
>  drivers/gpu/drm/drm_managed.c | 66 +++++++++++++++++++++++++++++++++++
>  include/drm/drm_managed.h     |  8 +++++
>  2 files changed, 74 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
> index 4cf214de50c4..d3bd6247eec9 100644
> --- a/drivers/gpu/drm/drm_managed.c
> +++ b/drivers/gpu/drm/drm_managed.c
> @@ -271,6 +271,13 @@ static void drmm_mutex_release(struct drm_device *dev, void *res)
>  	mutex_destroy(lock);
>  }
>  
> +static void drmm_destroy_workqueue(struct drm_device *dev, void *res)
> +{
> +	struct workqueue_struct *wq = res;
> +
> +	destroy_workqueue(wq);
> +}
> +
>  /**
>   * drmm_mutex_init - &drm_device-managed mutex_init()
>   * @dev: DRM device
> @@ -289,3 +296,62 @@ int drmm_mutex_init(struct drm_device *dev, struct mutex *lock)
>  	return drmm_add_action_or_reset(dev, drmm_mutex_release, lock);
>  }
>  EXPORT_SYMBOL(drmm_mutex_init);
> +
> +/**
> + * drmm_alloc_workqueue - &drm_device-managed alloc_workqueue()
> + * @dev: DRM device
> + * @wq: workqueue to be allocated
> + *
> + * Returns:
> + * 0 on success, or a negative errno code otherwise.
> + *
> + * This is a &drm_device-managed version of alloc_workqueue().
> + * The initialized lock is automatically destroyed on the final
> + * drm_dev_put().
> + */
> +int drmm_alloc_workqueue(struct drm_device *dev,
> +			  struct workqueue_struct *wq, const char *fmt,
> +			  unsigned int flags, int max_active, ...)
> +{
> +	va_list args;
> +
> +	va_start(args, max_active);
> +	wq = alloc_workqueue(fmt, flags, max_active, args);
> +	va_end(args);
> +
> +	if (!wq)
> +		return -ENOMEM;
> +
> +	return drmm_add_action_or_reset(dev, drmm_destroy_workqueue, wq);
> +}
> +EXPORT_SYMBOL(drmm_alloc_workqueue);
> +
> +/**
> + * drmm_alloc_ordered_workqueue - &drm_device-managed
> + * alloc_ordered_workqueue()
> + * @dev: DRM device
> + * @wq: workqueue to be allocated
> + *
> + * Returns:
> + * 0 on success, or a negative errno code otherwise.
> + *
> + * This is a &drm_device-managed version of alloc_ordered_workqueue().
> + * The initialized lock is automatically destroyed on the final
> + * drm_dev_put().
> + */
> +int drmm_alloc_ordered_workqueue(struct drm_device *dev,
> +				  struct workqueue_struct *wq,
> +				  const char *fmt, unsigned int flags, ...)
> +{
> +	va_list args;
> +
> +	va_start(args, flags);
> +	wq = alloc_ordered_workqueue(fmt, flags, args);
> +	va_end(args);
> +
> +	if (!wq)
> +		return -ENOMEM;
> +
> +	return drmm_add_action_or_reset(dev, drmm_destroy_workqueue, wq);
> +}
> +EXPORT_SYMBOL(drmm_alloc_ordered_workqueue);
> diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> index 359883942612..68cecc14e1af 100644
> --- a/include/drm/drm_managed.h
> +++ b/include/drm/drm_managed.h
> @@ -107,4 +107,12 @@ void drmm_kfree(struct drm_device *dev, void *data);
>  
>  int drmm_mutex_init(struct drm_device *dev, struct mutex *lock);
>  
> +int drmm_alloc_workqueue(struct drm_device *dev,
> +			  struct workqueue_struct *wq, const char *fmt,
> +			  unsigned int flags, int max_active, ...);
> +
> +int drmm_alloc_ordered_workqueue(struct drm_device *dev,
> +				  struct workqueue_struct *wq,
> +				  const char *fmt, unsigned int flags, ...);
> +
>  #endif
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
