Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7F57E7BC8
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 12:21:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42F110E990;
	Fri, 10 Nov 2023 11:21:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB9010E990;
 Fri, 10 Nov 2023 11:21:18 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D191566071D4;
 Fri, 10 Nov 2023 11:21:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1699615277;
 bh=XlfK0cZ7e+Elesjbsv7sYANR5q9yqJ5B618x/9UvH3Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IRny5HLJNiTBhTGDIjtZeuCwFe1yGtc4lvqLWqckDIK96IB/m5VeNHQmz5h4yQXxA
 wecs4KRjKDkzteQ7tmeB23cGyzwj6c+AALTMZD6b2QvN9qlpYZRj4PRcYWZB9YoRRZ
 UexE5wpqJ0QTgpc8bDp55N/UoV38RKw7zqHigRY8/HYiWwaT/6xDCoQHgAZ3cipN6y
 IRi3a1RUtFItBvvFMDu4vLIflbHlTuX9uTWrN8hTO8mcjZDoH6Jkt8ngBs021YJlWx
 VTrVVX+zYfbfmpu794HTLRHYQ46kivXAK+aB29MCrJsfdqWs9qUkogmzFiOCVmsPqY
 LRM5ZL3bBTvCA==
Date: Fri, 10 Nov 2023 12:21:12 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v9 09/12] drm/gpuvm: reference count
 drm_gpuvm structures
Message-ID: <20231110122112.4aeb2b39@collabora.com>
In-Reply-To: <20231108001259.15123-10-dakr@redhat.com>
References: <20231108001259.15123-1-dakr@redhat.com>
 <20231108001259.15123-10-dakr@redhat.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 faith@gfxstrand.net, donald.robson@imgtec.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  8 Nov 2023 01:12:39 +0100
Danilo Krummrich <dakr@redhat.com> wrote:

> Implement reference counting for struct drm_gpuvm.
> 
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/drm_gpuvm.c            | 56 +++++++++++++++++++++-----
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c | 20 ++++++---
>  include/drm/drm_gpuvm.h                | 31 +++++++++++++-
>  3 files changed, 90 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 53e2c406fb04..ef968eba6fe6 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -746,6 +746,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
>  	gpuvm->rb.tree = RB_ROOT_CACHED;
>  	INIT_LIST_HEAD(&gpuvm->rb.list);
>  
> +	kref_init(&gpuvm->kref);
> +
>  	gpuvm->name = name ? name : "unknown";
>  	gpuvm->flags = flags;
>  	gpuvm->ops = ops;
> @@ -770,15 +772,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
>  }
>  EXPORT_SYMBOL_GPL(drm_gpuvm_init);
>  
> -/**
> - * drm_gpuvm_destroy() - cleanup a &drm_gpuvm
> - * @gpuvm: pointer to the &drm_gpuvm to clean up
> - *
> - * Note that it is a bug to call this function on a manager that still
> - * holds GPU VA mappings.
> - */
> -void
> -drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
> +static void
> +drm_gpuvm_fini(struct drm_gpuvm *gpuvm)
>  {
>  	gpuvm->name = NULL;
>  
> @@ -790,7 +785,35 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
>  
>  	drm_gem_object_put(gpuvm->r_obj);
>  }
> -EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
> +
> +static void
> +drm_gpuvm_free(struct kref *kref)
> +{
> +	struct drm_gpuvm *gpuvm = container_of(kref, struct drm_gpuvm, kref);
> +
> +	drm_gpuvm_fini(gpuvm);
> +
> +	if (drm_WARN_ON(gpuvm->drm, !gpuvm->ops->vm_free))
> +		return;
> +
> +	gpuvm->ops->vm_free(gpuvm);
> +}
> +
> +/**
> + * drm_gpuvm_put() - drop a struct drm_gpuvm reference
> + * @gpuvm: the &drm_gpuvm to release the reference of
> + *
> + * This releases a reference to @gpuvm.
> + *
> + * This function may be called from atomic context.
> + */
> +void
> +drm_gpuvm_put(struct drm_gpuvm *gpuvm)
> +{
> +	if (gpuvm)
> +		kref_put(&gpuvm->kref, drm_gpuvm_free);
> +}
> +EXPORT_SYMBOL_GPL(drm_gpuvm_put);
>  
>  static int
>  __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
> @@ -839,11 +862,21 @@ drm_gpuva_insert(struct drm_gpuvm *gpuvm,
>  {
>  	u64 addr = va->va.addr;
>  	u64 range = va->va.range;
> +	int ret;
>  
>  	if (unlikely(!drm_gpuvm_range_valid(gpuvm, addr, range)))
>  		return -EINVAL;
>  
> -	return __drm_gpuva_insert(gpuvm, va);
> +	ret = __drm_gpuva_insert(gpuvm, va);
> +	if (likely(!ret))
> +		/* Take a reference of the GPUVM for the successfully inserted
> +		 * drm_gpuva. We can't take the reference in
> +		 * __drm_gpuva_insert() itself, since we don't want to increse
> +		 * the reference count for the GPUVM's kernel_alloc_node.
> +		 */
> +		drm_gpuvm_get(gpuvm);
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(drm_gpuva_insert);
>  
> @@ -876,6 +909,7 @@ drm_gpuva_remove(struct drm_gpuva *va)
>  	}
>  
>  	__drm_gpuva_remove(va);
> +	drm_gpuvm_put(va->vm);
>  }
>  EXPORT_SYMBOL_GPL(drm_gpuva_remove);
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index 54be12c1272f..cb2f06565c46 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -1780,6 +1780,18 @@ nouveau_uvmm_bo_unmap_all(struct nouveau_bo *nvbo)
>  	}
>  }
>  
> +static void
> +nouveau_uvmm_free(struct drm_gpuvm *gpuvm)
> +{
> +	struct nouveau_uvmm *uvmm = uvmm_from_gpuvm(gpuvm);
> +
> +	kfree(uvmm);
> +}
> +
> +static const struct drm_gpuvm_ops gpuvm_ops = {
> +	.vm_free = nouveau_uvmm_free,
> +};
> +
>  int
>  nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
>  			   void *data,
> @@ -1830,7 +1842,7 @@ nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
>  		       NOUVEAU_VA_SPACE_END,
>  		       init->kernel_managed_addr,
>  		       init->kernel_managed_size,
> -		       NULL);
> +		       &gpuvm_ops);
>  	/* GPUVM takes care from here on. */
>  	drm_gem_object_put(r_obj);
>  
> @@ -1849,8 +1861,7 @@ nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
>  	return 0;
>  
>  out_gpuvm_fini:
> -	drm_gpuvm_destroy(&uvmm->base);
> -	kfree(uvmm);
> +	drm_gpuvm_put(&uvmm->base);
>  out_unlock:
>  	mutex_unlock(&cli->mutex);
>  	return ret;
> @@ -1902,7 +1913,6 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
>  
>  	mutex_lock(&cli->mutex);
>  	nouveau_vmm_fini(&uvmm->vmm);
> -	drm_gpuvm_destroy(&uvmm->base);
> -	kfree(uvmm);
> +	drm_gpuvm_put(&uvmm->base);
>  	mutex_unlock(&cli->mutex);
>  }
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 0c2e24155a93..4e6e1fd3485a 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -247,6 +247,11 @@ struct drm_gpuvm {
>  		struct list_head list;
>  	} rb;
>  
> +	/**
> +	 * @kref: reference count of this object
> +	 */
> +	struct kref kref;
> +
>  	/**
>  	 * @kernel_alloc_node:
>  	 *
> @@ -273,7 +278,23 @@ void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
>  		    u64 start_offset, u64 range,
>  		    u64 reserve_offset, u64 reserve_range,
>  		    const struct drm_gpuvm_ops *ops);
> -void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
> +
> +/**
> + * drm_gpuvm_get() - acquire a struct drm_gpuvm reference
> + * @gpuvm: the &drm_gpuvm to acquire the reference of
> + *
> + * This function acquires an additional reference to @gpuvm. It is illegal to
> + * call this without already holding a reference. No locks required.
> + */
> +static inline struct drm_gpuvm *
> +drm_gpuvm_get(struct drm_gpuvm *gpuvm)
> +{
> +	kref_get(&gpuvm->kref);
> +
> +	return gpuvm;
> +}
> +
> +void drm_gpuvm_put(struct drm_gpuvm *gpuvm);
>  
>  bool drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
>  bool drm_gpuvm_interval_empty(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
> @@ -673,6 +694,14 @@ static inline void drm_gpuva_init_from_op(struct drm_gpuva *va,
>   * operations to drivers.
>   */
>  struct drm_gpuvm_ops {
> +	/**
> +	 * @vm_free: called when the last reference of a struct drm_gpuvm is
> +	 * dropped
> +	 *
> +	 * This callback is mandatory.
> +	 */
> +	void (*vm_free)(struct drm_gpuvm *gpuvm);
> +
>  	/**
>  	 * @op_alloc: called when the &drm_gpuvm allocates
>  	 * a struct drm_gpuva_op

