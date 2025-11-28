Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2F1C924EF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 15:24:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12BE910E896;
	Fri, 28 Nov 2025 14:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="azIKeek0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B79610E100;
 Fri, 28 Nov 2025 14:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764339849;
 bh=6hwny2dvXZaBLS0XNeSSxGm59jFWwqSTWFMqnWUwnVQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=azIKeek0IkIXifDItlCHiL2CDj1Gl95S9JQC0RVkW5JkReNhpWQNVpulX7dtlw/Fl
 XDcxnoTi7g7NfzFiAjLWpWJse+G+8zSUeZc7allIf5lOkl/AryspiYo5sqt+cT5JuR
 iTYL92VM4zoKwkPULNyGiPnRFVELIBIu1pOO+2z/wOfMutQtRRbT04ifRkcjr3HE5m
 QPRAecX3VPcx6zX26VixGxgbvS+KU0+gaQI+8fa6+bZizCSOrXZOgdA32+uztfxXcb
 SVZmmminsqWZ4/h+tPT8yhefl5hA03dZzUA3GxSSCGK3KQd00wWf+8zGB0wSaJkkhW
 EkmeYsMljV0Fw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3B0FD17E0ECB;
 Fri, 28 Nov 2025 15:24:08 +0100 (CET)
Date: Fri, 28 Nov 2025 15:24:03 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, Matthew Brost <matthew.brost@intel.com>,
 "Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=" <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, "=?UTF-8?B?QmrDtnJu?= Roy Baron"
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Frank
 Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, Rob
 Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>, Lyude Paul <lyude@redhat.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "Christian =?UTF-8?B?S8O2bmln?=" <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 1/4] drm/gpuvm: take GEM lock inside
 drm_gpuvm_bo_obtain_prealloc()
Message-ID: <20251128152403.72aedafa@fedora>
In-Reply-To: <20251128-gpuvm-rust-v1-1-ebf66bf234e0@google.com>
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
 <20251128-gpuvm-rust-v1-1-ebf66bf234e0@google.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 28 Nov 2025 14:14:15 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> When calling drm_gpuvm_bo_obtain_prealloc() and using immediate mode,
> this may result in a call to ops->vm_bo_free(vm_bo) while holding the
> GEMs gpuva mutex. This is a problem if ops->vm_bo_free(vm_bo) performs
> any operations that are not safe in the fence signalling critical path,
> and it turns out that Panthor (the only current user of the method)
> calls drm_gem_shmem_unpin() which takes a resv lock internally.
> 
> This constitutes both a violation of signalling safety and lock
> inversion. To fix this, we modify the method to internally take the GEMs
> gpuva mutex so that the mutex can be unlocked before freeing the
> preallocated vm_bo.
> 
> Note that this modification introduces a requirement that the driver
> uses immediate mode to call drm_gpuvm_bo_obtain_prealloc() as it would
> otherwise take the wrong lock.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Should we add a Fixes tag?

> ---
>  drivers/gpu/drm/drm_gpuvm.c           | 58 ++++++++++++++++++++++-------------
>  drivers/gpu/drm/panthor/panthor_mmu.c | 10 ------
>  2 files changed, 37 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 936e6c1a60c16ed5a6898546bf99e23a74f6b58b..f08a5cc1d611f971862c1272987e5ecd6d97c163 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -1601,14 +1601,37 @@ drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
>  }
>  EXPORT_SYMBOL_GPL(drm_gpuvm_bo_create);
>  
> +static void
> +drm_gpuvm_bo_destroy_not_in_lists(struct drm_gpuvm_bo *vm_bo)
> +{
> +	struct drm_gpuvm *gpuvm = vm_bo->vm;
> +	const struct drm_gpuvm_ops *ops = gpuvm->ops;
> +	struct drm_gem_object *obj = vm_bo->obj;
> +
> +	if (ops && ops->vm_bo_free)
> +		ops->vm_bo_free(vm_bo);
> +	else
> +		kfree(vm_bo);
> +
> +	drm_gpuvm_put(gpuvm);
> +	drm_gem_object_put(obj);
> +}
> +
> +static void
> +drm_gpuvm_bo_destroy_not_in_lists_kref(struct kref *kref)
> +{
> +	struct drm_gpuvm_bo *vm_bo = container_of(kref, struct drm_gpuvm_bo,
> +						  kref);
> +
> +	drm_gpuvm_bo_destroy_not_in_lists(vm_bo);
> +}
> +
>  static void
>  drm_gpuvm_bo_destroy(struct kref *kref)
>  {
>  	struct drm_gpuvm_bo *vm_bo = container_of(kref, struct drm_gpuvm_bo,
>  						  kref);
>  	struct drm_gpuvm *gpuvm = vm_bo->vm;
> -	const struct drm_gpuvm_ops *ops = gpuvm->ops;
> -	struct drm_gem_object *obj = vm_bo->obj;
>  	bool lock = !drm_gpuvm_resv_protected(gpuvm);
>  
>  	if (!lock)
> @@ -1617,16 +1640,10 @@ drm_gpuvm_bo_destroy(struct kref *kref)
>  	drm_gpuvm_bo_list_del(vm_bo, extobj, lock);
>  	drm_gpuvm_bo_list_del(vm_bo, evict, lock);
>  
> -	drm_gem_gpuva_assert_lock_held(gpuvm, obj);
> +	drm_gem_gpuva_assert_lock_held(gpuvm, vm_bo->obj);
>  	list_del(&vm_bo->list.entry.gem);
>  
> -	if (ops && ops->vm_bo_free)
> -		ops->vm_bo_free(vm_bo);
> -	else
> -		kfree(vm_bo);
> -
> -	drm_gpuvm_put(gpuvm);
> -	drm_gem_object_put(obj);
> +	drm_gpuvm_bo_destroy_not_in_lists(vm_bo);
>  }
>  
>  /**
> @@ -1744,9 +1761,7 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_bo_put_deferred);
>  void
>  drm_gpuvm_bo_deferred_cleanup(struct drm_gpuvm *gpuvm)
>  {
> -	const struct drm_gpuvm_ops *ops = gpuvm->ops;
>  	struct drm_gpuvm_bo *vm_bo;
> -	struct drm_gem_object *obj;
>  	struct llist_node *bo_defer;
>  
>  	bo_defer = llist_del_all(&gpuvm->bo_defer);
> @@ -1765,14 +1780,7 @@ drm_gpuvm_bo_deferred_cleanup(struct drm_gpuvm *gpuvm)
>  	while (bo_defer) {
>  		vm_bo = llist_entry(bo_defer, struct drm_gpuvm_bo, list.entry.bo_defer);
>  		bo_defer = bo_defer->next;
> -		obj = vm_bo->obj;
> -		if (ops && ops->vm_bo_free)
> -			ops->vm_bo_free(vm_bo);
> -		else
> -			kfree(vm_bo);
> -
> -		drm_gpuvm_put(gpuvm);
> -		drm_gem_object_put(obj);
> +		drm_gpuvm_bo_destroy_not_in_lists(vm_bo);
>  	}
>  }
>  EXPORT_SYMBOL_GPL(drm_gpuvm_bo_deferred_cleanup);
> @@ -1860,6 +1868,9 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_bo_obtain);
>   * count is decreased. If not found @__vm_bo is returned without further
>   * increase of the reference count.
>   *
> + * The provided @__vm_bo must not already be in the gpuva, evict, or extobj
> + * lists prior to calling this method.
> + *
>   * A new &drm_gpuvm_bo is added to the GEMs gpuva list.
>   *
>   * Returns: a pointer to the found &drm_gpuvm_bo or @__vm_bo if no existing
> @@ -1872,14 +1883,19 @@ drm_gpuvm_bo_obtain_prealloc(struct drm_gpuvm_bo *__vm_bo)
>  	struct drm_gem_object *obj = __vm_bo->obj;
>  	struct drm_gpuvm_bo *vm_bo;
>  
> +	drm_WARN_ON(gpuvm->drm, !drm_gpuvm_immediate_mode(gpuvm));
> +
> +	mutex_lock(&obj->gpuva.lock);
>  	vm_bo = drm_gpuvm_bo_find(gpuvm, obj);
>  	if (vm_bo) {
> -		drm_gpuvm_bo_put(__vm_bo);
> +		mutex_unlock(&obj->gpuva.lock);
> +		kref_put(&__vm_bo->kref, drm_gpuvm_bo_destroy_not_in_lists_kref);
>  		return vm_bo;
>  	}
>  
>  	drm_gem_gpuva_assert_lock_held(gpuvm, obj);
>  	list_add_tail(&__vm_bo->list.entry.gem, &obj->gpuva.list);
> +	mutex_unlock(&obj->gpuva.lock);
>  
>  	return __vm_bo;
>  }
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 9f5f4ddf291024121f3fd5644f2fdeba354fa67c..be8811a70e1a3adec87ca4a85cad7c838f54bebf 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1224,17 +1224,7 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
>  		goto err_cleanup;
>  	}
>  
> -	/* drm_gpuvm_bo_obtain_prealloc() will call drm_gpuvm_bo_put() on our
> -	 * pre-allocated BO if the <BO,VM> association exists. Given we
> -	 * only have one ref on preallocated_vm_bo, drm_gpuvm_bo_destroy() will
> -	 * be called immediately, and we have to hold the VM resv lock when
> -	 * calling this function.
> -	 */
> -	dma_resv_lock(panthor_vm_resv(vm), NULL);
> -	mutex_lock(&bo->base.base.gpuva.lock);
>  	op_ctx->map.vm_bo = drm_gpuvm_bo_obtain_prealloc(preallocated_vm_bo);
> -	mutex_unlock(&bo->base.base.gpuva.lock);
> -	dma_resv_unlock(panthor_vm_resv(vm));
>  
>  	op_ctx->map.bo_offset = offset;
>  
> 

