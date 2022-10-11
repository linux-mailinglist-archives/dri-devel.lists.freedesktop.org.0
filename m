Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 392E25FB86E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 18:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B951C10E407;
	Tue, 11 Oct 2022 16:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2816410E407;
 Tue, 11 Oct 2022 16:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665506511; x=1697042511;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=b+/kxLPxQD9huVT8ljIL2woYHjfBrUcjuPX577zgXT8=;
 b=k8UHsEUPD32MNpGtt+AsEZGhRHe/2gt7kmNmfIUUOQUV7f0F2kCf/Nsl
 2TOGEtC3eAoMtLz5940Ypb3PWEnj2fsNysDf/vT0BMqsxKGnRj1QkIkgj
 Urb1rGwJaLGM2n0+P3co1qiMXSnI7GSn+FT9jAXbWP7XbmVSTw2PPz9mi
 7qEsCTexcP8PLo/dBq4l+JzZMymYHQQ8tTYTsXYW6q7Do93FXNG6iCcso
 RM6tydgbpR3ImUI1haSPg/vgVUgObrjR64Trz7jNCtPS1hNHoZAZYTcSF
 MhD6comb0QPYD+KiXs8kdydIf5s7X2cFEuN5bT09Xs8OAeRZXih8hnB1U Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="331041441"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="331041441"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 09:27:50 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="604205349"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="604205349"
Received: from korubohx-mobl.ger.corp.intel.com (HELO [10.252.10.79])
 ([10.252.10.79])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 09:27:46 -0700
Message-ID: <e3e99b0e-5b2f-4e51-28f3-b04712b2f2ea@intel.com>
Date: Tue, 11 Oct 2022 17:27:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.1
Subject: Re: [PATCH v3 06/17] drm/i915/vm_bind: Support for VM private BOs
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20221010065826.32037-1-niranjana.vishwanathapura@intel.com>
 <20221010065826.32037-7-niranjana.vishwanathapura@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20221010065826.32037-7-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, jason@jlekstrand.net, andi.shyti@linux.intel.com,
 daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/10/2022 07:58, Niranjana Vishwanathapura wrote:
> Each VM creates a root_obj and shares it with all of its private objects
> to use it as dma_resv object. This has a performance advantage as it
> requires a single dma_resv object update for all private BOs vs list of
> dma_resv objects update for shared BOs, in the execbuf path.
> 
> VM private BOs can be only mapped on specified VM and cannot be dmabuf
> exported. Also, they are supported only in vm_bind mode.
> 
> v2: Pad struct drm_i915_gem_create_ext_vm_private for 64bit alignment,
>      add input validity checks.
> v3: Create root_obj only for ppgtt.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c   | 16 +++++-
>   drivers/gpu/drm/i915/gem/i915_gem_create.c    | 49 ++++++++++++++++++-
>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  6 +++
>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  4 ++
>   drivers/gpu/drm/i915/gem/i915_gem_object.c    |  3 ++
>   .../gpu/drm/i915/gem/i915_gem_object_types.h  |  3 ++
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  3 ++
>   .../drm/i915/gem/i915_gem_vm_bind_object.c    |  9 ++++
>   drivers/gpu/drm/i915/gt/intel_gtt.c           |  3 ++
>   drivers/gpu/drm/i915/gt/intel_gtt.h           |  2 +
>   drivers/gpu/drm/i915/i915_vma.c               |  1 +
>   drivers/gpu/drm/i915/i915_vma_types.h         |  2 +
>   include/uapi/drm/i915_drm.h                   | 33 +++++++++++++
>   13 files changed, 131 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 793345cbf99e..5ea7064805f3 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -83,6 +83,7 @@
>   
>   #include "i915_file_private.h"
>   #include "i915_gem_context.h"
> +#include "i915_gem_internal.h"
>   #include "i915_trace.h"
>   #include "i915_user_extensions.h"
>   
> @@ -1795,6 +1796,7 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
>   	struct drm_i915_private *i915 = to_i915(dev);
>   	struct drm_i915_gem_vm_control *args = data;
>   	struct drm_i915_file_private *file_priv = file->driver_priv;
> +	struct drm_i915_gem_object *obj;
>   	struct i915_ppgtt *ppgtt;
>   	u32 id;
>   	int err;
> @@ -1817,15 +1819,27 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
>   			goto err_put;
>   	}
>   
> +	obj = i915_gem_object_create_internal(i915, PAGE_SIZE);
> +	if (IS_ERR(obj)) {
> +		err = PTR_ERR(obj);
> +		goto err_put;
> +	}
> +
> +	ppgtt->vm.root_obj = obj;
> +	ppgtt->vm.vm_bind_mode = true;

Won't this temporarily break execbuf2? Only in the final patch does this 
depend on the new flag? Perhaps the patch split could be improved, or 
maybe we can just keep this as false here, until the final patch? Could 
also maybe also keep root_obj = NULL, until the last patch also?

> +
>   	err = xa_alloc(&file_priv->vm_xa, &id, &ppgtt->vm,
>   		       xa_limit_32b, GFP_KERNEL);
>   	if (err)
> -		goto err_put;
> +		goto err_root_obj_put;
>   
>   	GEM_BUG_ON(id == 0); /* reserved for invalid/unassigned ppgtt */
>   	args->vm_id = id;
>   	return 0;
>   
> +err_root_obj_put:
> +	if (ppgtt->vm.root_obj)
> +		i915_gem_object_put(ppgtt->vm.root_obj);
>   err_put:
>   	i915_vm_put(&ppgtt->vm);
>   	return err;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> index 5c6e396ab74d..694d4638ac8b 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> @@ -11,6 +11,7 @@
>   #include "pxp/intel_pxp.h"
>   
>   #include "i915_drv.h"
> +#include "i915_gem_context.h"
>   #include "i915_gem_create.h"
>   #include "i915_trace.h"
>   #include "i915_user_extensions.h"
> @@ -251,6 +252,7 @@ struct create_ext {
>   	unsigned int n_placements;
>   	unsigned int placement_mask;
>   	unsigned long flags;
> +	u32 vm_id;
>   };
>   
>   static void repr_placements(char *buf, size_t size,
> @@ -400,9 +402,32 @@ static int ext_set_protected(struct i915_user_extension __user *base, void *data
>   	return 0;
>   }
>   
> +static int ext_set_vm_private(struct i915_user_extension __user *base,
> +			      void *data)
> +{
> +	struct drm_i915_gem_create_ext_vm_private ext;
> +	struct create_ext *ext_data = data;
> +
> +	if (copy_from_user(&ext, base, sizeof(ext)))
> +		return -EFAULT;
> +
> +	/* Reserved fields must be 0 */
> +	if (ext.rsvd)
> +		return -EINVAL;
> +
> +	/* vm_id 0 is reserved */
> +	if (!ext.vm_id)
> +		return -ENOENT;
> +
> +	ext_data->vm_id = ext.vm_id;
> +
> +	return 0;
> +}
> +
>   static const i915_user_extension_fn create_extensions[] = {
>   	[I915_GEM_CREATE_EXT_MEMORY_REGIONS] = ext_set_placements,
>   	[I915_GEM_CREATE_EXT_PROTECTED_CONTENT] = ext_set_protected,
> +	[I915_GEM_CREATE_EXT_VM_PRIVATE] = ext_set_vm_private,
>   };
>   
>   /**
> @@ -418,6 +443,7 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
>   	struct drm_i915_private *i915 = to_i915(dev);
>   	struct drm_i915_gem_create_ext *args = data;
>   	struct create_ext ext_data = { .i915 = i915 };
> +	struct i915_address_space *vm = NULL;
>   	struct drm_i915_gem_object *obj;
>   	int ret;
>   
> @@ -431,6 +457,12 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
>   	if (ret)
>   		return ret;
>   
> +	if (ext_data.vm_id) {
> +		vm = i915_gem_vm_lookup(file->driver_priv, ext_data.vm_id);
> +		if (unlikely(!vm))
> +			return -ENOENT;
> +	}
> +
>   	if (!ext_data.n_placements) {
>   		ext_data.placements[0] =
>   			intel_memory_region_by_type(i915, INTEL_MEMORY_SYSTEM);
> @@ -457,8 +489,21 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
>   						ext_data.placements,
>   						ext_data.n_placements,
>   						ext_data.flags);
> -	if (IS_ERR(obj))
> -		return PTR_ERR(obj);
> +	if (IS_ERR(obj)) {
> +		ret = PTR_ERR(obj);
> +		goto vm_put;
> +	}
> +
> +	if (vm) {
> +		obj->base.resv = vm->root_obj->base.resv;
> +		obj->priv_root = i915_gem_object_get(vm->root_obj);
> +		i915_vm_put(vm);
> +	}
>   
>   	return i915_gem_publish(obj, file, &args->size, &args->handle);
> +vm_put:
> +	if (vm)
> +		i915_vm_put(vm);
> +
> +	return ret;
>   }
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> index f5062d0c6333..6433173c3e84 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -218,6 +218,12 @@ struct dma_buf *i915_gem_prime_export(struct drm_gem_object *gem_obj, int flags)
>   	struct drm_i915_gem_object *obj = to_intel_bo(gem_obj);
>   	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>   
> +	if (obj->priv_root) {
> +		drm_dbg(obj->base.dev,
> +			"Exporting VM private objects is not allowed\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
>   	exp_info.ops = &i915_dmabuf_ops;
>   	exp_info.size = gem_obj->size;
>   	exp_info.flags = flags;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 9fb9f6faafd8..4673e0812277 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -864,6 +864,10 @@ static struct i915_vma *eb_lookup_vma(struct i915_execbuffer *eb, u32 handle)
>   		if (unlikely(!obj))
>   			return ERR_PTR(-ENOENT);
>   
> +		/* VM private objects are not supported here */
> +		if (obj->priv_root)
> +			return ERR_PTR(-EINVAL);
> +
>   		/*
>   		 * If the user has opted-in for protected-object tracking, make
>   		 * sure the object encryption can be used.
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> index 62495d5d0038..b799c53ac4b1 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> @@ -108,6 +108,9 @@ void i915_gem_object_init(struct drm_i915_gem_object *obj,
>    */
>   void __i915_gem_object_fini(struct drm_i915_gem_object *obj)
>   {
> +	if (obj->priv_root && !obj->ttm.created)
> +		i915_gem_object_put(obj->priv_root);

Can we not ignore the ttm.created here? And then drop the object_put() 
below?

> +
>   	mutex_destroy(&obj->mm.get_page.lock);
>   	mutex_destroy(&obj->mm.get_dma_page.lock);
>   	dma_resv_fini(&obj->base._resv);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> index d0d6772e6f36..b77bf0e07fe1 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> @@ -242,6 +242,9 @@ struct drm_i915_gem_object {
>   
>   	const struct drm_i915_gem_object_ops *ops;
>   
> +	/* For VM private BO, points to root_obj in VM. NULL otherwise */
> +	struct drm_i915_gem_object *priv_root;
> +
>   	struct {
>   		/**
>   		 * @vma.lock: protect the list/tree of vmas
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index d63f30efd631..233d670a91de 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -1200,6 +1200,9 @@ void i915_ttm_bo_destroy(struct ttm_buffer_object *bo)
>   	mutex_destroy(&obj->ttm.get_io_page.lock);
>   
>   	if (obj->ttm.created) {
> +		if (obj->priv_root)
> +			i915_gem_object_put(obj->priv_root);
> +
