Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB384519C4E
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 11:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2CA310F765;
	Wed,  4 May 2022 09:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E98D6112091
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 09:51:01 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id g6so1860696ejw.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 02:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OxcesquTdbHkTeCfs8Cwf3lhBo3qlME1HYaTFBiqb5o=;
 b=fRR1ZXNy/Ui6TMWLwjP3KMK1tOm7IVl7o/MrG8zKa1ZUnyYmCIxsVQ+TADMTrcoGa0
 TUtrSfTiWzuVXepk02/2KMe8sD3SuukWPvhNeshuBXzDvBTr5qXRuWaMId+I96wdLRzu
 ShLDxjsT6CLpHcV73z9d3sl37jleqoNg3dwTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OxcesquTdbHkTeCfs8Cwf3lhBo3qlME1HYaTFBiqb5o=;
 b=LBH97OmAiOmdQbHQg9/3dY8Gt3FAXhc5EvyrcxlFiMeMSL2GOO1mYUFLHl/yqfAXj6
 EP47nZA6VktaZqjXE/+5XRrbIFlbPnP+8cUnwba0kGGvTb2a/aPF8llFZgr+RfqMNkXT
 u+JbLMTU7IevZVIcbcaKB5PGmsw1uYky0K2SMEtvej8UDzFcjlkfE2mslb/qLILAkP4P
 Bj2ZXflhVADjMpTwT9D+Jg8z4wqpfbeVY6Gv2icHeei2mTMwN36JSpjQdRVeL38XuXyI
 wGpZ+3G99AXdQFjhlm/awBAAUHBs9NvutsdqXaPPBzmiP5Y4LPJKGx+cjcemGJCnn2KO
 OHeQ==
X-Gm-Message-State: AOAM532fMv2KJX8KKTdpNx4kzs0mI0BVaZfV0mnuWPNYWN0lU38q/eqY
 yE06FspGUhpOX1k/Q94GPudYZg==
X-Google-Smtp-Source: ABdhPJz4PuZTgc2eG4hG9ADti4+LiV0KHeo4t+DTzHoJDt3Dm7/35XZcdUd8u38a4pbn7OKEa7vehg==
X-Received: by 2002:a17:906:9c82:b0:6e1:1d6c:914c with SMTP id
 fj2-20020a1709069c8200b006e11d6c914cmr19103039ejc.769.1651657860439; 
 Wed, 04 May 2022 02:51:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 hx8-20020a170906846800b006f3ef214dd0sm5450890ejc.54.2022.05.04.02.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 02:51:00 -0700 (PDT)
Date: Wed, 4 May 2022 11:50:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/3] drm: Add DRM-managed mutex_init()
Message-ID: <YnJMghyZ48UTXlcZ@phenom.ffwll.local>
References: <20220502142514.2174-1-tzimmermann@suse.de>
 <20220502142514.2174-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220502142514.2174-2-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 02, 2022 at 04:25:12PM +0200, Thomas Zimmermann wrote:
> Add drmm_mutex_init(), a helper that provides managed mutex cleanup. The
> mutex will be destroyed with the final reference of the DRM device.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch> on this one, ack for
the other two driver patches.
-Daniel

> ---
>  drivers/gpu/drm/drm_managed.c | 27 +++++++++++++++++++++++++++
>  include/drm/drm_managed.h     |  3 +++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
> index 37d7db6223be6..4cf214de50c40 100644
> --- a/drivers/gpu/drm/drm_managed.c
> +++ b/drivers/gpu/drm/drm_managed.c
> @@ -8,6 +8,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include <linux/list.h>
> +#include <linux/mutex.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  
> @@ -262,3 +263,29 @@ void drmm_kfree(struct drm_device *dev, void *data)
>  	free_dr(dr_match);
>  }
>  EXPORT_SYMBOL(drmm_kfree);
> +
> +static void drmm_mutex_release(struct drm_device *dev, void *res)
> +{
> +	struct mutex *lock = res;
> +
> +	mutex_destroy(lock);
> +}
> +
> +/**
> + * drmm_mutex_init - &drm_device-managed mutex_init()
> + * @dev: DRM device
> + * @lock: lock to be initialized
> + *
> + * Returns:
> + * 0 on success, or a negative errno code otherwise.
> + *
> + * This is a &drm_device-managed version of mutex_init(). The initialized
> + * lock is automatically destroyed on the final drm_dev_put().
> + */
> +int drmm_mutex_init(struct drm_device *dev, struct mutex *lock)
> +{
> +	mutex_init(lock);
> +
> +	return drmm_add_action_or_reset(dev, drmm_mutex_release, lock);
> +}
> +EXPORT_SYMBOL(drmm_mutex_init);
> diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
> index b45c6fbf53ac4..359883942612e 100644
> --- a/include/drm/drm_managed.h
> +++ b/include/drm/drm_managed.h
> @@ -8,6 +8,7 @@
>  #include <linux/types.h>
>  
>  struct drm_device;
> +struct mutex;
>  
>  typedef void (*drmres_release_t)(struct drm_device *dev, void *res);
>  
> @@ -104,4 +105,6 @@ char *drmm_kstrdup(struct drm_device *dev, const char *s, gfp_t gfp);
>  
>  void drmm_kfree(struct drm_device *dev, void *data);
>  
> +int drmm_mutex_init(struct drm_device *dev, struct mutex *lock);
> +
>  #endif
> -- 
> 2.36.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
