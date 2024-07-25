Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D7F93C18D
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 14:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FFC10E22B;
	Thu, 25 Jul 2024 12:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="VHVFYcYl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92ACA10E22B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 12:16:06 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52f022bd00cso14247e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 05:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1721909765; x=1722514565; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=FeRZJ5nIDcu41geXtWDqfm+tSJT4lrTayGPhD35MvjU=;
 b=VHVFYcYldfzEDUEpGBTqEDCijMzSmEZDyiL6t9iDtKCotVUL8T/2Hjq1fJd4Jx3lYg
 W5Q/o6zb3svkxi3fRboGD7aEzbl5GJMRABz8Io2ZZBqohMOipzWYaaxrQKqT34Dp+SzA
 ILiAewXYcjmMxHYqcG/U+ypmC9h9Y2ZSIB1TY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721909765; x=1722514565;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FeRZJ5nIDcu41geXtWDqfm+tSJT4lrTayGPhD35MvjU=;
 b=VEIyoz11v1hSJZBrhejCLHGnV7A9ngZL8EEozETmoYdVmNByqGCZdJGvdyJhqUWa9E
 HdSGkoHkPmb0DHUdU5D4zSk+lYx3C1rZbqmvCxIZMNGtb5MfddFElR0zCEgoR9CisZxg
 fGrw/YzXQQSFmPEH72cg1INWyW8liBq2VkdEqsmNScrez2wwtR9JhxxUaVPUviMUSJ6H
 vW1l+PWbodzvExRZ/q2IZ7WaS2QvEXDhiGl8fukk6adGjbkTspj0DEzwgDXKNS+TUhme
 tH92vlMFmyNA21nKds99kyIcfWbEqZaGqRKItqo8x8uJuNPQBMd269YPmVQczVEy1VmJ
 nl2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoJ8Y8DSOBhIgFA5KEF33u6n5HVeGF9GP2WSbff1qt5gYsuRM5TZnG+xAoBd75YTdTB1qCI1487Z4svkC4mj+glZqIS/UQHH9fXb1HYg7y
X-Gm-Message-State: AOJu0YyhzJ5anrDNIzwSXaRc0AcJi1gPn8rEBuHiSc4zvZEPRUGMRNOu
 p7tDVvg7olnT0DEoUL1JcvnOw71QwZrsZWIwoMviJwpxQoeMltzhEr5XSdYFTX0=
X-Google-Smtp-Source: AGHT+IEoLflpaDVjh8OLvCkfCMnN2BRkKyidVq9s2AR0IgR5zpXewpVfl/Tghy7DRVyhQmTUM55xTw==
X-Received: by 2002:a05:6512:e91:b0:52e:ccf4:c5e2 with SMTP id
 2adb3069b0e04-52fd52e97dfmr939282e87.8.1721909764482; 
 Thu, 25 Jul 2024 05:16:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad41976sm66620966b.130.2024.07.25.05.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 05:16:03 -0700 (PDT)
Date: Thu, 25 Jul 2024 14:16:02 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/8] drm/vmwgfx: use GEM references instead of TTMs
Message-ID: <ZqJCAolDFvhQ7ysI@phenom.ffwll.local>
References: <20240723121750.2086-1-christian.koenig@amd.com>
 <20240723121750.2086-4-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240723121750.2086-4-christian.koenig@amd.com>
X-Operating-System: Linux phenom 6.9.7-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 23, 2024 at 02:17:46PM +0200, Christian König wrote:
> Instead of a TTM reference grab a GEM reference whenever necessary.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Cc: Zack Rusin <zack.rusin@broadcom.com>
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>

There's a ttm_bo_put in vmwgfx_mob.c that you didn't convert, is there a
reason for that? And the mix of vmw_bo_(un)reference and
drm_gem_object_get/put in vmwgfx_resource.c is a bit confusing, I'd just
refcount the res->guest_memory_bo instead so that you can use the vmw_bo_
functions.
-Sima

> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c       |  4 ++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.h       | 19 ++-----------------
>  drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c  |  4 ++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c  |  4 ++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c      |  6 +++---
>  drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c  |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 16 ++++++++--------
>  drivers/gpu/drm/vmwgfx/vmwgfx_shader.c   |  4 ++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c  |  2 +-
>  9 files changed, 23 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> index 00144632c600..3caaacb124ec 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -501,7 +501,7 @@ static int vmw_user_bo_synccpu_release(struct drm_file *filp,
>  		if (!(flags & drm_vmw_synccpu_allow_cs)) {
>  			atomic_dec(&vmw_bo->cpu_writers);
>  		}
> -		vmw_user_bo_unref(&vmw_bo);
> +		vmw_bo_unreference(&vmw_bo);
>  	}
>  
>  	return ret;
> @@ -543,7 +543,7 @@ int vmw_user_bo_synccpu_ioctl(struct drm_device *dev, void *data,
>  			return ret;
>  
>  		ret = vmw_user_bo_synccpu_grab(vbo, arg->flags);
> -		vmw_user_bo_unref(&vbo);
> +		vmw_bo_unreference(&vbo);
>  		if (unlikely(ret != 0)) {
>  			if (ret == -ERESTARTSYS || ret == -EBUSY)
>  				return -EBUSY;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> index f349642e6190..42a58d57409d 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> @@ -188,30 +188,15 @@ static inline void vmw_bo_unreference(struct vmw_bo **buf)
>  
>  	*buf = NULL;
>  	if (tmp_buf)
> -		ttm_bo_put(&tmp_buf->tbo);
> +		drm_gem_object_put(&tmp_buf->tbo.base);
>  }
>  
>  static inline struct vmw_bo *vmw_bo_reference(struct vmw_bo *buf)
>  {
> -	ttm_bo_get(&buf->tbo);
> +	drm_gem_object_get(&buf->tbo.base);
>  	return buf;
>  }
>  
> -static inline struct vmw_bo *vmw_user_bo_ref(struct vmw_bo *vbo)
> -{
> -	drm_gem_object_get(&vbo->tbo.base);
> -	return vbo;
> -}
> -
> -static inline void vmw_user_bo_unref(struct vmw_bo **buf)
> -{
> -	struct vmw_bo *tmp_buf = *buf;
> -
> -	*buf = NULL;
> -	if (tmp_buf)
> -		drm_gem_object_put(&tmp_buf->tbo.base);
> -}
> -
>  static inline struct vmw_bo *to_vmw_bo(struct drm_gem_object *gobj)
>  {
>  	return container_of((gobj), struct vmw_bo, tbo.base);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
> index a7c07692262b..6b700ebd71b1 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
> @@ -502,7 +502,7 @@ static int vmw_cotable_resize(struct vmw_resource *res, size_t new_size)
>  
>  	vmw_resource_mob_attach(res);
>  	/* Let go of the old mob. */
> -	vmw_user_bo_unref(&old_buf);
> +	vmw_bo_unreference(&old_buf);
>  	res->id = vcotbl->type;
>  
>  	ret = dma_resv_reserve_fences(bo->base.resv, 1);
> @@ -521,7 +521,7 @@ static int vmw_cotable_resize(struct vmw_resource *res, size_t new_size)
>  out_wait:
>  	ttm_bo_unpin(bo);
>  	ttm_bo_unreserve(bo);
> -	vmw_user_bo_unref(&buf);
> +	vmw_bo_unreference(&buf);
>  
>  out_done:
>  	MKS_STAT_TIME_POP(MKSSTAT_KERN_COTABLE_RESIZE);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> index 2e52d73eba48..be29b9ff8901 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -1166,7 +1166,7 @@ static int vmw_translate_mob_ptr(struct vmw_private *dev_priv,
>  	vmw_bo_placement_set(vmw_bo, VMW_BO_DOMAIN_MOB, VMW_BO_DOMAIN_MOB);
>  	ret = vmw_validation_add_bo(sw_context->ctx, vmw_bo);
>  	tmp_bo = vmw_bo;
> -	vmw_user_bo_unref(&tmp_bo);
> +	vmw_bo_unreference(&tmp_bo);
>  	if (unlikely(ret != 0))
>  		return ret;
>  
> @@ -1223,7 +1223,7 @@ static int vmw_translate_guest_ptr(struct vmw_private *dev_priv,
>  			     VMW_BO_DOMAIN_GMR | VMW_BO_DOMAIN_VRAM);
>  	ret = vmw_validation_add_bo(sw_context->ctx, vmw_bo);
>  	tmp_bo = vmw_bo;
> -	vmw_user_bo_unref(&tmp_bo);
> +	vmw_bo_unreference(&tmp_bo);
>  	if (unlikely(ret != 0))
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index 13b2820cae51..f8158b8d2843 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -1476,8 +1476,8 @@ static int vmw_create_bo_proxy(struct drm_device *dev,
>  	/* Reserve and switch the backing mob. */
>  	mutex_lock(&res->dev_priv->cmdbuf_mutex);
>  	(void) vmw_resource_reserve(res, false, true);
> -	vmw_user_bo_unref(&res->guest_memory_bo);
> -	res->guest_memory_bo = vmw_user_bo_ref(bo_mob);
> +	vmw_bo_unreference(&res->guest_memory_bo);
> +	res->guest_memory_bo = vmw_bo_reference(bo_mob);
>  	res->guest_memory_offset = 0;
>  	vmw_resource_unreserve(res, false, false, false, NULL, 0);
>  	mutex_unlock(&res->dev_priv->cmdbuf_mutex);
> @@ -1670,7 +1670,7 @@ static struct drm_framebuffer *vmw_kms_fb_create(struct drm_device *dev,
>  err_out:
>  	/* vmw_user_lookup_handle takes one ref so does new_fb */
>  	if (bo)
> -		vmw_user_bo_unref(&bo);
> +		vmw_bo_unreference(&bo);
>  	if (surface)
>  		vmw_surface_unreference(&surface);
>  
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
> index c45b4724e414..c5860f62ec53 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
> @@ -451,7 +451,7 @@ int vmw_overlay_ioctl(struct drm_device *dev, void *data,
>  
>  	ret = vmw_overlay_update_stream(dev_priv, buf, arg, true);
>  
> -	vmw_user_bo_unref(&buf);
> +	vmw_bo_unreference(&buf);
>  
>  out_unlock:
>  	mutex_unlock(&overlay->mutex);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> index 848dba09981b..cb786da99fd3 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> @@ -141,7 +141,7 @@ static void vmw_resource_release(struct kref *kref)
>  		if (res->coherent)
>  			vmw_bo_dirty_release(res->guest_memory_bo);
>  		ttm_bo_unreserve(bo);
> -		vmw_user_bo_unref(&res->guest_memory_bo);
> +		vmw_bo_unreference(&res->guest_memory_bo);
>  	}
>  
>  	if (likely(res->hw_destroy != NULL)) {
> @@ -457,11 +457,11 @@ void vmw_resource_unreserve(struct vmw_resource *res,
>  			vmw_resource_mob_detach(res);
>  			if (res->coherent)
>  				vmw_bo_dirty_release(res->guest_memory_bo);
> -			vmw_user_bo_unref(&res->guest_memory_bo);
> +			vmw_bo_unreference(&res->guest_memory_bo);
>  		}
>  
>  		if (new_guest_memory_bo) {
> -			res->guest_memory_bo = vmw_user_bo_ref(new_guest_memory_bo);
> +			res->guest_memory_bo = vmw_bo_reference(new_guest_memory_bo);
>  
>  			/*
>  			 * The validation code should already have added a
> @@ -522,7 +522,7 @@ vmw_resource_check_buffer(struct ww_acquire_ctx *ticket,
>  	}
>  
>  	INIT_LIST_HEAD(&val_list);
> -	ttm_bo_get(&res->guest_memory_bo->tbo);
> +	drm_gem_object_get(&res->guest_memory_bo->tbo.base);
>  	val_buf->bo = &res->guest_memory_bo->tbo;
>  	val_buf->num_shared = 0;
>  	list_add_tail(&val_buf->head, &val_list);
> @@ -548,10 +548,10 @@ vmw_resource_check_buffer(struct ww_acquire_ctx *ticket,
>  out_no_validate:
>  	ttm_eu_backoff_reservation(ticket, &val_list);
>  out_no_reserve:
> -	ttm_bo_put(val_buf->bo);
> +	drm_gem_object_put(&val_buf->bo->base);
>  	val_buf->bo = NULL;
>  	if (guest_memory_dirty)
> -		vmw_user_bo_unref(&res->guest_memory_bo);
> +		vmw_bo_unreference(&res->guest_memory_bo);
>  
>  	return ret;
>  }
> @@ -610,7 +610,7 @@ vmw_resource_backoff_reservation(struct ww_acquire_ctx *ticket,
>  	INIT_LIST_HEAD(&val_list);
>  	list_add_tail(&val_buf->head, &val_list);
>  	ttm_eu_backoff_reservation(ticket, &val_list);
> -	ttm_bo_put(val_buf->bo);
> +	drm_gem_object_put(&val_buf->bo->base);
>  	val_buf->bo = NULL;
>  }
>  
> @@ -727,7 +727,7 @@ int vmw_resource_validate(struct vmw_resource *res, bool intr,
>  		goto out_no_validate;
>  	else if (!res->func->needs_guest_memory && res->guest_memory_bo) {
>  		WARN_ON_ONCE(vmw_resource_mob_attached(res));
> -		vmw_user_bo_unref(&res->guest_memory_bo);
> +		vmw_bo_unreference(&res->guest_memory_bo);
>  	}
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
> index a01ca3226d0a..6b8e984695ed 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
> @@ -180,7 +180,7 @@ static int vmw_gb_shader_init(struct vmw_private *dev_priv,
>  
>  	res->guest_memory_size = size;
>  	if (byte_code) {
> -		res->guest_memory_bo = vmw_user_bo_ref(byte_code);
> +		res->guest_memory_bo = vmw_bo_reference(byte_code);
>  		res->guest_memory_offset = offset;
>  	}
>  	shader->size = size;
> @@ -809,7 +809,7 @@ static int vmw_shader_define(struct drm_device *dev, struct drm_file *file_priv,
>  				    shader_type, num_input_sig,
>  				    num_output_sig, tfile, shader_handle);
>  out_bad_arg:
> -	vmw_user_bo_unref(&buffer);
> +	vmw_bo_unreference(&buffer);
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> index e7a744dfcecf..c275bb074a60 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> @@ -1505,7 +1505,7 @@ vmw_gb_surface_define_internal(struct drm_device *dev,
>  		if (ret == 0) {
>  			if (res->guest_memory_bo->tbo.base.size < res->guest_memory_size) {
>  				VMW_DEBUG_USER("Surface backup buffer too small.\n");
> -				vmw_user_bo_unref(&res->guest_memory_bo);
> +				vmw_bo_unreference(&res->guest_memory_bo);
>  				ret = -EINVAL;
>  				goto out_unlock;
>  			} else {
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
