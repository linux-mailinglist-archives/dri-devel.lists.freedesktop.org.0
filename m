Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFA21D5054
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 16:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB82B6ECBA;
	Fri, 15 May 2020 14:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73AF46ECBA
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 14:24:55 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id i15so3736421wrx.10
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 07:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Nij6/uiEc9XvtIqZywsOLuW9LmWNtO7JLUsuW/gZPwY=;
 b=EUJeM7Gx4bMmEiVHs11RlCwZ0pIrcBSF3qMETEchbA1sb9fQ9fG9xBV9f+ivHRnBJw
 EHIJ074EHxJIsiIbl7e0ERqLyq+rpzK/DaGGSRI/PEZP0eW5N93KAvwXz/PE+m9atTfI
 808WYj5CpAluLskVLG4e4ljEWwxyLP3tHYA24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Nij6/uiEc9XvtIqZywsOLuW9LmWNtO7JLUsuW/gZPwY=;
 b=T7Mxf6XRzecC27XMmAQyZL2AFnB17KEOxG86MqCYIg48PqkEFIeSkGh/rAvSCLPCE7
 1iHvhg8zSrBWt6a9XyQ5YwDQwZVSruL+k3+p6s8Gc4laUiYH7eOJw2ZFLe7d1BDPP28e
 CsGVynp75HFI++BiwlwuBShoNaypMKnvnOOs3TAKlt6P5f7vsrvFYsQzgnIIIQzITAhS
 9Oxd/53crXIycdvXwT2tkdyMxnxLs/oKpfVNGa5rmmh1WFHf5Flj9aUu9keZqhD7wl/N
 WbOzW5ONWqCdmsuPe0c+QcxhXODthNgkKfWKmb2LlrIc+z5NYTzCcZhOi4LPKiCd+4fA
 2GHQ==
X-Gm-Message-State: AOAM533e55ge6Y4HJHsR9VUDjWIllWy6HL2gxF1RVsatDbjuCyEW1Qij
 8AQdI67Yv1uDeLPW+0fMd8JVEg==
X-Google-Smtp-Source: ABdhPJwJRzF7nOj/T73pz24oIt27hpkc7HU7BMG3vytJ5UnQPkl7UXozX6lAcZhf+ZG33WiH9o+zdQ==
X-Received: by 2002:a5d:4747:: with SMTP id o7mr4454636wrs.11.1589552694045;
 Fri, 15 May 2020 07:24:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g24sm4164552wrb.35.2020.05.15.07.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 07:24:53 -0700 (PDT)
Date: Fri, 15 May 2020 16:24:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2 10/38] drm/gem: fold drm_gem_object_put_unlocked and
 __drm_gem_object_put()
Message-ID: <20200515142451.GK206103@phenom.ffwll.local>
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
 <20200515095118.2743122-11-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515095118.2743122-11-emil.l.velikov@gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 15, 2020 at 10:50:50AM +0100, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> 
> With earlier patch we removed the overhead so now we can lift the helper
> into the header effectively folding it with __drm_object_put.
> 
> v2: drop struct_mutex references (Daniel)
> 
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org> (v1)
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_gem.c                  | 19 -------------------
>  drivers/gpu/drm/i915/gem/i915_gem_object.h |  2 +-
>  include/drm/drm_drv.h                      |  2 --
>  include/drm/drm_gem.h                      | 16 +++-------------
>  4 files changed, 4 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index dab8763b2e73..599d5ff53b73 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -982,25 +982,6 @@ drm_gem_object_free(struct kref *kref)
>  }
>  EXPORT_SYMBOL(drm_gem_object_free);
>  
> -/**
> - * drm_gem_object_put_unlocked - drop a GEM buffer object reference
> - * @obj: GEM buffer object
> - *
> - * This releases a reference to @obj. Callers must not hold the
> - * &drm_device.struct_mutex lock when calling this function.
> - *
> - * See also __drm_gem_object_put().
> - */
> -void
> -drm_gem_object_put_unlocked(struct drm_gem_object *obj)
> -{
> -	if (!obj)
> -		return;
> -
> -	kref_put(&obj->refcount, drm_gem_object_free);
> -}
> -EXPORT_SYMBOL(drm_gem_object_put_unlocked);
> -
>  /**
>   * drm_gem_object_put - release a GEM buffer object reference
>   * @obj: GEM buffer object
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> index 2faa481cc18f..41351cbf31b5 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -105,7 +105,7 @@ __attribute__((nonnull))
>  static inline void
>  i915_gem_object_put(struct drm_i915_gem_object *obj)
>  {
> -	__drm_gem_object_put(&obj->base);
> +	drm_gem_object_put_unlocked(&obj->base);
>  }
>  
>  #define assert_object_held(obj) dma_resv_assert_held((obj)->base.resv)
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index e6eff508f687..bb924cddc09c 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -332,8 +332,6 @@ struct drm_driver {
>  	 *
>  	 * This is deprecated and should not be used by new drivers. Use
>  	 * &drm_gem_object_funcs.free instead.
> -	 * Compared to @gem_free_object this is not encumbered with
> -	 * &drm_device.struct_mutex legacy locking schemes.

Ah here's the two lines removed that I missed in the earlier patch. If you
feel like moving that hunk or not, r-b: me on both is ok.
-Daniel

>  	 */
>  	void (*gem_free_object_unlocked) (struct drm_gem_object *obj);
>  
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index ec2d24a60a76..c3bdade093ae 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -364,27 +364,17 @@ static inline void drm_gem_object_get(struct drm_gem_object *obj)
>  }
>  
>  /**
> - * __drm_gem_object_put - raw function to release a GEM buffer object reference
> + * drm_gem_object_put_unlocked - drop a GEM buffer object reference
>   * @obj: GEM buffer object
>   *
> - * This function is meant to be used by drivers which are not encumbered with
> - * &drm_device.struct_mutex legacy locking and which are using the
> - * gem_free_object_unlocked callback. It avoids all the locking checks and
> - * locking overhead of drm_gem_object_put() and drm_gem_object_put_unlocked().
> - *
> - * Drivers should never call this directly in their code. Instead they should
> - * wrap it up into a ``driver_gem_object_put(struct driver_gem_object *obj)``
> - * wrapper function, and use that. Shared code should never call this, to
> - * avoid breaking drivers by accident which still depend upon
> - * &drm_device.struct_mutex locking.
> + * This releases a reference to @obj.
>   */
>  static inline void
> -__drm_gem_object_put(struct drm_gem_object *obj)
> +drm_gem_object_put_unlocked(struct drm_gem_object *obj)
>  {
>  	kref_put(&obj->refcount, drm_gem_object_free);
>  }
>  
> -void drm_gem_object_put_unlocked(struct drm_gem_object *obj);
>  void drm_gem_object_put(struct drm_gem_object *obj);
>  
>  int drm_gem_handle_create(struct drm_file *file_priv,
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
