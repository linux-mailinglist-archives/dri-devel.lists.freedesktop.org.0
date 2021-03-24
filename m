Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86379347AFF
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 15:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A896EA15;
	Wed, 24 Mar 2021 14:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465A56EA15
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 14:45:10 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v11so24705496wro.7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 07:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ps9qEbQgGB34O4fARf+U4c1qiAT+B+d/LT5jXsG6MHU=;
 b=BycgyW78dG8cPn+Wdermaq/zIv5vU+bxnC6rr1CC0peWTrTw5ZYRe6vjbpL7hFBnEs
 xwYRPWwf7112zo27PZHF9zIVEMD+czM4LAYvRlvJQxhSgVUhwcMDy2FI6rgPAzAcZILA
 Z9Myes15/LaMQRsG9tnIb29YK4DuESgekQdjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ps9qEbQgGB34O4fARf+U4c1qiAT+B+d/LT5jXsG6MHU=;
 b=UV2kD+WY0CkHMBwqZJDZP+BmKPaF01Wsar3GA71oXaLyiQ6Y7M2sc+iNqRxxgUT6zE
 sSnz0XAjIpWY84ebQUjYVixjJF59JMwDl5I+Bmaq52sjeRhJxASi6P21adAS2Br6lAbP
 PMLQbwAfoEjN998y9DVWjWNdFMPjkgu/Uk55SeSLFRxHf9aKXnFNEGWCNHD9hDauX6iH
 N1HRDCfQLl/ovseBiCOTIX5AvWXwgt/9j9XbYW3y8WLrO5Q2AVQEQM5vChvDbvrDV49B
 0UYYhVlXmSyWyU7wC8HPNxlQ5VUpBfXA/QygWugdThvVN0v3R2fdt8jBokf2MBlehrwT
 U6Fg==
X-Gm-Message-State: AOAM533oHHKCI2UE0cRzdn4+SVJhPonCx1w2f5+b+MgR19ca8gpGDTcB
 a0FwjRbMyAC1H9CvZRAicWZOug==
X-Google-Smtp-Source: ABdhPJwsWgS84B+kvHoXTFib7blRPJZOVJa/hV/x2EwQYG7o7m5PENfQa+waK+hChK6YqZRD1Lnm4w==
X-Received: by 2002:adf:9bce:: with SMTP id e14mr4082617wrc.29.1616597108781; 
 Wed, 24 Mar 2021 07:45:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q4sm2684282wma.20.2021.03.24.07.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 07:45:08 -0700 (PDT)
Date: Wed, 24 Mar 2021 15:45:06 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v9 30/70] drm/i915: Fix pread/pwrite to work
 with new locking rules.
Message-ID: <YFtQcojSJxLTUbDH@phenom.ffwll.local>
References: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
 <20210323155059.628690-31-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323155059.628690-31-maarten.lankhorst@linux.intel.com>
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 04:50:19PM +0100, Maarten Lankhorst wrote:
> We are removing obj->mm.lock, and need to take the reservation lock
> before we can pin pages. Move the pinning pages into the helper, and
> merge gtt pwrite/pread preparation and cleanup paths.
> =

> The fence lock is also removed; it will conflict with fence annotations,
> because of memory allocations done when pagefaulting inside copy_*_user.
> =

> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Reviewed-by: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>

Same here, I picked the old version from there

https://lore.kernel.org/intel-gfx/20210128162612.927917-31-maarten.lankhors=
t@linux.intel.com/

because too much conflicts with this version here.
-Daniel

> ---
>  drivers/gpu/drm/i915/Makefile              |   1 -
>  drivers/gpu/drm/i915/gem/i915_gem_fence.c  |  95 ---------
>  drivers/gpu/drm/i915/gem/i915_gem_object.h |   5 -
>  drivers/gpu/drm/i915/i915_gem.c            | 215 +++++++++++----------
>  4 files changed, 112 insertions(+), 204 deletions(-)
>  delete mode 100644 drivers/gpu/drm/i915/gem/i915_gem_fence.c
> =

> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 33c2100414a0..70a535798ef5 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -140,7 +140,6 @@ gem-y +=3D \
>  	gem/i915_gem_dmabuf.o \
>  	gem/i915_gem_domain.o \
>  	gem/i915_gem_execbuffer.o \
> -	gem/i915_gem_fence.o \
>  	gem/i915_gem_internal.o \
>  	gem/i915_gem_object.o \
>  	gem/i915_gem_object_blt.o \
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_fence.c b/drivers/gpu/drm/=
i915/gem/i915_gem_fence.c
> deleted file mode 100644
> index 8ab842c80f99..000000000000
> --- a/drivers/gpu/drm/i915/gem/i915_gem_fence.c
> +++ /dev/null
> @@ -1,95 +0,0 @@
> -/*
> - * SPDX-License-Identifier: MIT
> - *
> - * Copyright =A9 2019 Intel Corporation
> - */
> -
> -#include "i915_drv.h"
> -#include "i915_gem_object.h"
> -
> -struct stub_fence {
> -	struct dma_fence dma;
> -	struct i915_sw_fence chain;
> -};
> -
> -static int __i915_sw_fence_call
> -stub_notify(struct i915_sw_fence *fence, enum i915_sw_fence_notify state)
> -{
> -	struct stub_fence *stub =3D container_of(fence, typeof(*stub), chain);
> -
> -	switch (state) {
> -	case FENCE_COMPLETE:
> -		dma_fence_signal(&stub->dma);
> -		break;
> -
> -	case FENCE_FREE:
> -		dma_fence_put(&stub->dma);
> -		break;
> -	}
> -
> -	return NOTIFY_DONE;
> -}
> -
> -static const char *stub_driver_name(struct dma_fence *fence)
> -{
> -	return DRIVER_NAME;
> -}
> -
> -static const char *stub_timeline_name(struct dma_fence *fence)
> -{
> -	return "object";
> -}
> -
> -static void stub_release(struct dma_fence *fence)
> -{
> -	struct stub_fence *stub =3D container_of(fence, typeof(*stub), dma);
> -
> -	i915_sw_fence_fini(&stub->chain);
> -
> -	BUILD_BUG_ON(offsetof(typeof(*stub), dma));
> -	dma_fence_free(&stub->dma);
> -}
> -
> -static const struct dma_fence_ops stub_fence_ops =3D {
> -	.get_driver_name =3D stub_driver_name,
> -	.get_timeline_name =3D stub_timeline_name,
> -	.release =3D stub_release,
> -};
> -
> -struct dma_fence *
> -i915_gem_object_lock_fence(struct drm_i915_gem_object *obj)
> -{
> -	struct stub_fence *stub;
> -
> -	assert_object_held(obj);
> -
> -	stub =3D kmalloc(sizeof(*stub), GFP_KERNEL);
> -	if (!stub)
> -		return NULL;
> -
> -	i915_sw_fence_init(&stub->chain, stub_notify);
> -	dma_fence_init(&stub->dma, &stub_fence_ops, &stub->chain.wait.lock,
> -		       0, 0);
> -
> -	if (i915_sw_fence_await_reservation(&stub->chain,
> -					    obj->base.resv, NULL, true,
> -					    i915_fence_timeout(to_i915(obj->base.dev)),
> -					    I915_FENCE_GFP) < 0)
> -		goto err;
> -
> -	dma_resv_add_excl_fence(obj->base.resv, &stub->dma);
> -
> -	return &stub->dma;
> -
> -err:
> -	stub_release(&stub->dma);
> -	return NULL;
> -}
> -
> -void i915_gem_object_unlock_fence(struct drm_i915_gem_object *obj,
> -				  struct dma_fence *fence)
> -{
> -	struct stub_fence *stub =3D container_of(fence, typeof(*stub), dma);
> -
> -	i915_sw_fence_commit(&stub->chain);
> -}
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm=
/i915/gem/i915_gem_object.h
> index fef0d62f3eb7..6c3f75adb53c 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -189,11 +189,6 @@ static inline void i915_gem_object_unlock(struct drm=
_i915_gem_object *obj)
>  	dma_resv_unlock(obj->base.resv);
>  }
>  =

> -struct dma_fence *
> -i915_gem_object_lock_fence(struct drm_i915_gem_object *obj);
> -void i915_gem_object_unlock_fence(struct drm_i915_gem_object *obj,
> -				  struct dma_fence *fence);
> -
>  static inline void
>  i915_gem_object_set_readonly(struct drm_i915_gem_object *obj)
>  {
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_=
gem.c
> index 8373662e4b5f..eeb952889e4a 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -204,7 +204,6 @@ i915_gem_shmem_pread(struct drm_i915_gem_object *obj,
>  {
>  	unsigned int needs_clflush;
>  	unsigned int idx, offset;
> -	struct dma_fence *fence;
>  	char __user *user_data;
>  	u64 remain;
>  	int ret;
> @@ -213,19 +212,17 @@ i915_gem_shmem_pread(struct drm_i915_gem_object *ob=
j,
>  	if (ret)
>  		return ret;
>  =

> +	ret =3D i915_gem_object_pin_pages(obj);
> +	if (ret)
> +		goto err_unlock;
> +
>  	ret =3D i915_gem_object_prepare_read(obj, &needs_clflush);
> -	if (ret) {
> -		i915_gem_object_unlock(obj);
> -		return ret;
> -	}
> +	if (ret)
> +		goto err_unpin;
>  =

> -	fence =3D i915_gem_object_lock_fence(obj);
>  	i915_gem_object_finish_access(obj);
>  	i915_gem_object_unlock(obj);
>  =

> -	if (!fence)
> -		return -ENOMEM;
> -
>  	remain =3D args->size;
>  	user_data =3D u64_to_user_ptr(args->data_ptr);
>  	offset =3D offset_in_page(args->offset);
> @@ -243,7 +240,13 @@ i915_gem_shmem_pread(struct drm_i915_gem_object *obj,
>  		offset =3D 0;
>  	}
>  =

> -	i915_gem_object_unlock_fence(obj, fence);
> +	i915_gem_object_unpin_pages(obj);
> +	return ret;
> +
> +err_unpin:
> +	i915_gem_object_unpin_pages(obj);
> +err_unlock:
> +	i915_gem_object_unlock(obj);
>  	return ret;
>  }
>  =

> @@ -271,48 +274,99 @@ gtt_user_read(struct io_mapping *mapping,
>  	return unwritten;
>  }
>  =

> -static int
> -i915_gem_gtt_pread(struct drm_i915_gem_object *obj,
> -		   const struct drm_i915_gem_pread *args)
> +static struct i915_vma *i915_gem_gtt_prepare(struct drm_i915_gem_object =
*obj,
> +					     struct drm_mm_node *node,
> +					     bool write)
>  {
>  	struct drm_i915_private *i915 =3D to_i915(obj->base.dev);
>  	struct i915_ggtt *ggtt =3D &i915->ggtt;
> -	intel_wakeref_t wakeref;
> -	struct drm_mm_node node;
> -	struct dma_fence *fence;
> -	void __user *user_data;
>  	struct i915_vma *vma;
> -	u64 remain, offset;
> +	struct i915_gem_ww_ctx ww;
>  	int ret;
>  =

> -	wakeref =3D intel_runtime_pm_get(&i915->runtime_pm);
> +	i915_gem_ww_ctx_init(&ww, true);
> +retry:
>  	vma =3D ERR_PTR(-ENODEV);
> +	ret =3D i915_gem_object_lock(obj, &ww);
> +	if (ret)
> +		goto err_ww;
> +
> +	i915_gem_object_set_to_gtt_domain(obj, write);
>  	if (!i915_gem_object_is_tiled(obj))
> -		vma =3D i915_gem_object_ggtt_pin(obj, NULL, 0, 0,
> -					       PIN_MAPPABLE |
> -					       PIN_NONBLOCK /* NOWARN */ |
> -					       PIN_NOEVICT);
> -	if (!IS_ERR(vma)) {
> -		node.start =3D i915_ggtt_offset(vma);
> -		node.flags =3D 0;
> +		vma =3D i915_gem_object_ggtt_pin_ww(obj, &ww, NULL, 0, 0,
> +						  PIN_MAPPABLE |
> +						  PIN_NONBLOCK /* NOWARN */ |
> +						  PIN_NOEVICT);
> +	if (vma =3D=3D ERR_PTR(-EDEADLK)) {
> +		ret =3D -EDEADLK;
> +		goto err_ww;
> +	} else if (!IS_ERR(vma)) {
> +		node->start =3D i915_ggtt_offset(vma);
> +		node->flags =3D 0;
>  	} else {
> -		ret =3D insert_mappable_node(ggtt, &node, PAGE_SIZE);
> +		ret =3D insert_mappable_node(ggtt, node, PAGE_SIZE);
>  		if (ret)
> -			goto out_rpm;
> -		GEM_BUG_ON(!drm_mm_node_allocated(&node));
> +			goto err_ww;
> +		GEM_BUG_ON(!drm_mm_node_allocated(node));
> +		vma =3D NULL;
>  	}
>  =

> -	ret =3D i915_gem_object_lock_interruptible(obj, NULL);
> -	if (ret)
> -		goto out_unpin;
> +	ret =3D i915_gem_object_pin_pages(obj);
> +	if (ret) {
> +		if (drm_mm_node_allocated(node)) {
> +			ggtt->vm.clear_range(&ggtt->vm, node->start, node->size);
> +			remove_mappable_node(ggtt, node);
> +		} else {
> +			i915_vma_unpin(vma);
> +		}
> +	}
> +
> +err_ww:
> +	if (ret =3D=3D -EDEADLK) {
> +		ret =3D i915_gem_ww_ctx_backoff(&ww);
> +		if (!ret)
> +			goto retry;
> +	}
> +	i915_gem_ww_ctx_fini(&ww);
>  =

> -	i915_gem_object_set_to_gtt_domain(obj, false);
> +	return ret ? ERR_PTR(ret) : vma;
> +}
>  =

> -	fence =3D i915_gem_object_lock_fence(obj);
> -	i915_gem_object_unlock(obj);
> -	if (!fence) {
> -		ret =3D -ENOMEM;
> -		goto out_unpin;
> +static void i915_gem_gtt_cleanup(struct drm_i915_gem_object *obj,
> +				 struct drm_mm_node *node,
> +				 struct i915_vma *vma)
> +{
> +	struct drm_i915_private *i915 =3D to_i915(obj->base.dev);
> +	struct i915_ggtt *ggtt =3D &i915->ggtt;
> +
> +	i915_gem_object_unpin_pages(obj);
> +	if (drm_mm_node_allocated(node)) {
> +		ggtt->vm.clear_range(&ggtt->vm, node->start, node->size);
> +		remove_mappable_node(ggtt, node);
> +	} else {
> +		i915_vma_unpin(vma);
> +	}
> +}
> +
> +static int
> +i915_gem_gtt_pread(struct drm_i915_gem_object *obj,
> +		   const struct drm_i915_gem_pread *args)
> +{
> +	struct drm_i915_private *i915 =3D to_i915(obj->base.dev);
> +	struct i915_ggtt *ggtt =3D &i915->ggtt;
> +	intel_wakeref_t wakeref;
> +	struct drm_mm_node node;
> +	void __user *user_data;
> +	struct i915_vma *vma;
> +	u64 remain, offset;
> +	int ret =3D 0;
> +
> +	wakeref =3D intel_runtime_pm_get(&i915->runtime_pm);
> +
> +	vma =3D i915_gem_gtt_prepare(obj, &node, false);
> +	if (IS_ERR(vma)) {
> +		ret =3D PTR_ERR(vma);
> +		goto out_rpm;
>  	}
>  =

>  	user_data =3D u64_to_user_ptr(args->data_ptr);
> @@ -349,14 +403,7 @@ i915_gem_gtt_pread(struct drm_i915_gem_object *obj,
>  		offset +=3D page_length;
>  	}
>  =

> -	i915_gem_object_unlock_fence(obj, fence);
> -out_unpin:
> -	if (drm_mm_node_allocated(&node)) {
> -		ggtt->vm.clear_range(&ggtt->vm, node.start, node.size);
> -		remove_mappable_node(ggtt, &node);
> -	} else {
> -		i915_vma_unpin(vma);
> -	}
> +	i915_gem_gtt_cleanup(obj, &node, vma);
>  out_rpm:
>  	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
>  	return ret;
> @@ -421,15 +468,10 @@ i915_gem_pread_ioctl(struct drm_device *dev, void *=
data,
>  	if (ret)
>  		goto out;
>  =

> -	ret =3D i915_gem_object_pin_pages(obj);
> -	if (ret)
> -		goto out;
> -
>  	ret =3D i915_gem_shmem_pread(obj, args);
>  	if (ret =3D=3D -EFAULT || ret =3D=3D -ENODEV)
>  		ret =3D i915_gem_gtt_pread(obj, args);
>  =

> -	i915_gem_object_unpin_pages(obj);
>  out:
>  	i915_gem_object_put(obj);
>  	return ret;
> @@ -477,11 +519,10 @@ i915_gem_gtt_pwrite_fast(struct drm_i915_gem_object=
 *obj,
>  	struct intel_runtime_pm *rpm =3D &i915->runtime_pm;
>  	intel_wakeref_t wakeref;
>  	struct drm_mm_node node;
> -	struct dma_fence *fence;
>  	struct i915_vma *vma;
>  	u64 remain, offset;
>  	void __user *user_data;
> -	int ret;
> +	int ret =3D 0;
>  =

>  	if (i915_gem_object_has_struct_page(obj)) {
>  		/*
> @@ -499,33 +540,10 @@ i915_gem_gtt_pwrite_fast(struct drm_i915_gem_object=
 *obj,
>  		wakeref =3D intel_runtime_pm_get(rpm);
>  	}
>  =

> -	vma =3D ERR_PTR(-ENODEV);
> -	if (!i915_gem_object_is_tiled(obj))
> -		vma =3D i915_gem_object_ggtt_pin(obj, NULL, 0, 0,
> -					       PIN_MAPPABLE |
> -					       PIN_NONBLOCK /* NOWARN */ |
> -					       PIN_NOEVICT);
> -	if (!IS_ERR(vma)) {
> -		node.start =3D i915_ggtt_offset(vma);
> -		node.flags =3D 0;
> -	} else {
> -		ret =3D insert_mappable_node(ggtt, &node, PAGE_SIZE);
> -		if (ret)
> -			goto out_rpm;
> -		GEM_BUG_ON(!drm_mm_node_allocated(&node));
> -	}
> -
> -	ret =3D i915_gem_object_lock_interruptible(obj, NULL);
> -	if (ret)
> -		goto out_unpin;
> -
> -	i915_gem_object_set_to_gtt_domain(obj, true);
> -
> -	fence =3D i915_gem_object_lock_fence(obj);
> -	i915_gem_object_unlock(obj);
> -	if (!fence) {
> -		ret =3D -ENOMEM;
> -		goto out_unpin;
> +	vma =3D i915_gem_gtt_prepare(obj, &node, true);
> +	if (IS_ERR(vma)) {
> +		ret =3D PTR_ERR(vma);
> +		goto out_rpm;
>  	}
>  =

>  	i915_gem_object_invalidate_frontbuffer(obj, ORIGIN_CPU);
> @@ -574,14 +592,7 @@ i915_gem_gtt_pwrite_fast(struct drm_i915_gem_object =
*obj,
>  	intel_gt_flush_ggtt_writes(ggtt->vm.gt);
>  	i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
>  =

> -	i915_gem_object_unlock_fence(obj, fence);
> -out_unpin:
> -	if (drm_mm_node_allocated(&node)) {
> -		ggtt->vm.clear_range(&ggtt->vm, node.start, node.size);
> -		remove_mappable_node(ggtt, &node);
> -	} else {
> -		i915_vma_unpin(vma);
> -	}
> +	i915_gem_gtt_cleanup(obj, &node, vma);
>  out_rpm:
>  	intel_runtime_pm_put(rpm, wakeref);
>  	return ret;
> @@ -621,7 +632,6 @@ i915_gem_shmem_pwrite(struct drm_i915_gem_object *obj,
>  	unsigned int partial_cacheline_write;
>  	unsigned int needs_clflush;
>  	unsigned int offset, idx;
> -	struct dma_fence *fence;
>  	void __user *user_data;
>  	u64 remain;
>  	int ret;
> @@ -630,19 +640,17 @@ i915_gem_shmem_pwrite(struct drm_i915_gem_object *o=
bj,
>  	if (ret)
>  		return ret;
>  =

> +	ret =3D i915_gem_object_pin_pages(obj);
> +	if (ret)
> +		goto err_unlock;
> +
>  	ret =3D i915_gem_object_prepare_write(obj, &needs_clflush);
> -	if (ret) {
> -		i915_gem_object_unlock(obj);
> -		return ret;
> -	}
> +	if (ret)
> +		goto err_unpin;
>  =

> -	fence =3D i915_gem_object_lock_fence(obj);
>  	i915_gem_object_finish_access(obj);
>  	i915_gem_object_unlock(obj);
>  =

> -	if (!fence)
> -		return -ENOMEM;
> -
>  	/* If we don't overwrite a cacheline completely we need to be
>  	 * careful to have up-to-date data by first clflushing. Don't
>  	 * overcomplicate things and flush the entire patch.
> @@ -670,8 +678,14 @@ i915_gem_shmem_pwrite(struct drm_i915_gem_object *ob=
j,
>  	}
>  =

>  	i915_gem_object_flush_frontbuffer(obj, ORIGIN_CPU);
> -	i915_gem_object_unlock_fence(obj, fence);
>  =

> +	i915_gem_object_unpin_pages(obj);
> +	return ret;
> +
> +err_unpin:
> +	i915_gem_object_unpin_pages(obj);
> +err_unlock:
> +	i915_gem_object_unlock(obj);
>  	return ret;
>  }
>  =

> @@ -735,10 +749,6 @@ i915_gem_pwrite_ioctl(struct drm_device *dev, void *=
data,
>  	if (ret)
>  		goto err;
>  =

> -	ret =3D i915_gem_object_pin_pages(obj);
> -	if (ret)
> -		goto err;
> -
>  	ret =3D -EFAULT;
>  	/* We can only do the GTT pwrite on untiled buffers, as otherwise
>  	 * it would end up going through the fenced access, and we'll get
> @@ -759,7 +769,6 @@ i915_gem_pwrite_ioctl(struct drm_device *dev, void *d=
ata,
>  			ret =3D i915_gem_shmem_pwrite(obj, args);
>  	}
>  =

> -	i915_gem_object_unpin_pages(obj);
>  err:
>  	i915_gem_object_put(obj);
>  	return ret;
> -- =

> 2.31.0
> =

> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
