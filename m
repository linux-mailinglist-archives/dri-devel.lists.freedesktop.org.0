Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F117C1CA46B
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 08:43:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B4E6EA7D;
	Fri,  8 May 2020 06:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76D76EA7D
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 06:43:47 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z8so535062wrw.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 23:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ELDuoD1imjy7smYxjRmmGmgUyi6qQ2eDlGPNUv2MfKQ=;
 b=FcL5QdW3vnktUSrFEtYXOFHhEcKBnXOwVWjoXy24f3eZYfZx0dwl+VObsJFVteTC8g
 wY0vJIJw5IKl249FpZKvKW7WYMQsBDmlzecEk8WFGYz1OOLHtbPXNQ1W8om2J4Ve6RuB
 2LR3p3aG4d3Bd21i0GwaoDxsNiMYzunrA/pLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ELDuoD1imjy7smYxjRmmGmgUyi6qQ2eDlGPNUv2MfKQ=;
 b=Z0ckrIrCcL+CJBjBKu1phtgNiQXIatQm5fWd1vO3MVEbuz0/xGH/D31HiH5ZlFl2yc
 dnF4I2AaqkCdR2Hz/bddaV8SLLoxNVMvleTq6iz8F5frgDbWsIli5Hqmx5ADKi49RuAw
 dON+h1b6knKDDlAbus8obdW/Z5C2cxxV5bARAB9TS8yrqR2ZrYse7G5F5dGLRqjHhqUQ
 v/YM9dSP9JSZUVi5tqBqsWeQ5B0QttLe1mILH3vgGxagObv4a0iDeak3ois3lGy8l9Oe
 ljgnJ7nERPULCgq52IuIaH1rLnqfeNov7qwqcPnkhbTfPmVqGdKP+1uka36L3rD+ofhC
 YKcA==
X-Gm-Message-State: AGi0PuZ1ieLKMLR+x1Zyck8cQEgvzFE4/GO6yiWYIu5giyeqcSud5lgA
 kK+p9sv6qBHCLROK5o9lZwoowaa7mlQ=
X-Google-Smtp-Source: APiQypJ81N6vvCuZwNsTgclrO8vv97TLwQgLmmuIQgbduYi2F4ETLLuGDfJdzz2+oLKL/MQ7W9+Row==
X-Received: by 2002:a5d:510f:: with SMTP id s15mr1166559wrt.103.1588920226274; 
 Thu, 07 May 2020 23:43:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i74sm1368112wri.49.2020.05.07.23.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 23:43:45 -0700 (PDT)
Date: Fri, 8 May 2020 08:43:43 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 09/36] drm/gem: fold drm_gem_object_put_unlocked and
 __drm_gem_object_put()
Message-ID: <20200508064343.GC1383626@phenom.ffwll.local>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-10-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507150822.114464-10-emil.l.velikov@gmail.com>
X-Operating-System: Linux phenom 5.4.0-4-amd64 
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

On Thu, May 07, 2020 at 04:07:55PM +0100, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> 
> With earlier patch we removed the normal overhead so now we can lift
> the helper to the header, folding it __drm_object_put.
> 
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem.c                  | 19 -------------------
>  drivers/gpu/drm/i915/gem/i915_gem_object.h |  2 +-
>  include/drm/drm_gem.h                      | 17 ++++-------------
>  3 files changed, 5 insertions(+), 33 deletions(-)
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
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index ec2d24a60a76..7c877bea7b3a 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -364,27 +364,18 @@ static inline void drm_gem_object_get(struct drm_gem_object *obj)
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
> + * This releases a reference to @obj. Callers must not hold the
> + * &drm_device.struct_mutex lock when calling this function.

2nd sentence talking about struct_mutex isn't true anymore, since nothing
in here calls mutex_lock(obj->dev->struct_mutex); With your cleanup here
we officially don't care about struct_mutex in the drm core!

Aside from that lgtm, with that sentence removed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>


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
