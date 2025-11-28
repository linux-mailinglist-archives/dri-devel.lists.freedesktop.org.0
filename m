Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2706AC92504
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 15:25:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5164110E8FA;
	Fri, 28 Nov 2025 14:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fzUZZDuo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 040F010E100;
 Fri, 28 Nov 2025 14:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764339929;
 bh=w7buVGtjVorAxVd8DdXKCDZDZJvXAiqAbTDH/zKZvHs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fzUZZDuo0h9Yxh9gpWjPlvZMzvy77FF3Rh2sK286J0EFZnwCwXU+91msIDE5yAgpD
 EfYAjJQx6tHBXwCChpgQ3+FsRMrlfsnN70exw6ll0GH6ohuEVmVLJ/p0UTTomOy0Na
 KJvZc68VkQmJq3PsgHawlpRnJ2JV2wRK3DRg7AsrPt8VIEPTPuwgXXzlDQ98sA5voD
 sm+h7d4Ml83OQqJfsUMXDa7Zq6iWhk3pgNlnhAf0GDnEN9z8R3A3FE0yWJdfIGr3jK
 CgueGOgxcClRJTg6BmNuPwDcL8SbK3dCShCM/1m1mXu9Lq4tdTRCaYEA+IzwAI2ltr
 k+p7pteTXj0SA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 54BEC17E12C5;
 Fri, 28 Nov 2025 15:25:28 +0100 (CET)
Date: Fri, 28 Nov 2025 15:25:24 +0100
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
Subject: Re: [PATCH 2/4] drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and
 staged mode
Message-ID: <20251128152524.4a2e4fe0@fedora>
In-Reply-To: <20251128-gpuvm-rust-v1-2-ebf66bf234e0@google.com>
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
 <20251128-gpuvm-rust-v1-2-ebf66bf234e0@google.com>
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

On Fri, 28 Nov 2025 14:14:16 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> In the previous commit we updated drm_gpuvm_bo_obtain_prealloc() to take
> locks internally, which means that it's only usable in immediate mode.
> In this commit, we notice that drm_gpuvm_bo_obtain() requires you to use
> staged mode. This means that we now have one variant of obtain for each
> mode you might use gpuvm in.
> 
> To reflect this information, we add a warning about using it in
> immediate mode, and to make the distinction clearer we rename the method
> with a _locked() suffix so that it's clear that it requires the caller
> to take the locks.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/gpu/drm/drm_gpuvm.c            | 16 +++++++++++++---

The gpuvm changes are

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

>  drivers/gpu/drm/imagination/pvr_vm.c   |  2 +-
>  drivers/gpu/drm/msm/msm_gem.h          |  2 +-
>  drivers/gpu/drm/msm/msm_gem_vma.c      |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c             |  4 ++--
>  include/drm/drm_gpuvm.h                |  4 ++--
>  7 files changed, 21 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index f08a5cc1d611f971862c1272987e5ecd6d97c163..9cd06c7600dc32ceee0f0beb5e3daf31698a66b3 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -1832,16 +1832,26 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_bo_find);
>   * count of the &drm_gpuvm_bo accordingly. If not found, allocates a new
>   * &drm_gpuvm_bo.
>   *
> + * Requires the lock for the GEMs gpuva list.
> + *
>   * A new &drm_gpuvm_bo is added to the GEMs gpuva list.
>   *
>   * Returns: a pointer to the &drm_gpuvm_bo on success, an ERR_PTR on failure
>   */
>  struct drm_gpuvm_bo *
> -drm_gpuvm_bo_obtain(struct drm_gpuvm *gpuvm,
> -		    struct drm_gem_object *obj)
> +drm_gpuvm_bo_obtain_locked(struct drm_gpuvm *gpuvm,
> +			   struct drm_gem_object *obj)
>  {
>  	struct drm_gpuvm_bo *vm_bo;
>  
> +	/*
> +	 * In immediate mode this would require the caller to hold the GEMs
> +	 * gpuva mutex, but it's not okay to allocate while holding that lock,
> +	 * and this method allocates. Immediate mode drivers should use
> +	 * drm_gpuvm_bo_obtain_prealloc() instead.
> +	 */
> +	drm_WARN_ON(gpuvm->drm, drm_gpuvm_immediate_mode(gpuvm));
> +
>  	vm_bo = drm_gpuvm_bo_find(gpuvm, obj);
>  	if (vm_bo)
>  		return vm_bo;
> @@ -1855,7 +1865,7 @@ drm_gpuvm_bo_obtain(struct drm_gpuvm *gpuvm,
>  
>  	return vm_bo;
>  }
> -EXPORT_SYMBOL_GPL(drm_gpuvm_bo_obtain);
> +EXPORT_SYMBOL_GPL(drm_gpuvm_bo_obtain_locked);
>  
>  /**
>   * drm_gpuvm_bo_obtain_prealloc() - obtains an instance of the &drm_gpuvm_bo
> diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
> index 3d97990170bf6b1341116c5c8b9d01421944eda4..30ff9b84eb14f2455003e76108de6d489a13f61a 100644
> --- a/drivers/gpu/drm/imagination/pvr_vm.c
> +++ b/drivers/gpu/drm/imagination/pvr_vm.c
> @@ -255,7 +255,7 @@ pvr_vm_bind_op_map_init(struct pvr_vm_bind_op *bind_op,
>  	bind_op->type = PVR_VM_BIND_TYPE_MAP;
>  
>  	dma_resv_lock(obj->resv, NULL);
> -	bind_op->gpuvm_bo = drm_gpuvm_bo_obtain(&vm_ctx->gpuvm_mgr, obj);
> +	bind_op->gpuvm_bo = drm_gpuvm_bo_obtain_locked(&vm_ctx->gpuvm_mgr, obj);
>  	dma_resv_unlock(obj->resv);
>  	if (IS_ERR(bind_op->gpuvm_bo))
>  		return PTR_ERR(bind_op->gpuvm_bo);
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index a4cf31853c5008e171c3ad72cde1004c60fe5212..26dfe3d22e3e847f7e63174481d03f72878a8ced 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -60,7 +60,7 @@ struct msm_gem_vm_log_entry {
>   * embedded in any larger driver structure.  The GEM object holds a list of
>   * drm_gpuvm_bo, which in turn holds a list of msm_gem_vma.  A linked vma
>   * holds a reference to the vm_bo, and drops it when the vma is unlinked.
> - * So we just need to call drm_gpuvm_bo_obtain() to return a ref to an
> + * So we just need to call drm_gpuvm_bo_obtain_locked() to return a ref to an
>   * existing vm_bo, or create a new one.  Once the vma is linked, the ref
>   * to the vm_bo can be dropped (since the vma is holding one).
>   */
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
> index 8316af1723c227f919594446c3721e1a948cbc9e..239b6168a26e636b511187b4993945d1565d149f 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -413,7 +413,7 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
>  	if (!obj)
>  		return &vma->base;
>  
> -	vm_bo = drm_gpuvm_bo_obtain(&vm->base, obj);
> +	vm_bo = drm_gpuvm_bo_obtain_locked(&vm->base, obj);
>  	if (IS_ERR(vm_bo)) {
>  		ret = PTR_ERR(vm_bo);
>  		goto err_va_remove;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index 79eefdfd08a2678fedf69503ddf7e9e17ed14c6f..d8888bd29cccef4b8dad9eff2bf6e2b1fd1a7e4d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -1207,7 +1207,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
>  				return -ENOENT;
>  
>  			dma_resv_lock(obj->resv, NULL);
> -			op->vm_bo = drm_gpuvm_bo_obtain(&uvmm->base, obj);
> +			op->vm_bo = drm_gpuvm_bo_obtain_locked(&uvmm->base, obj);
>  			dma_resv_unlock(obj->resv);
>  			if (IS_ERR(op->vm_bo))
>  				return PTR_ERR(op->vm_bo);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index f602b874e0547591d9008333c18f3de0634c48c7..de52d01b0921cc8ac619deeed47b578e0ae69257 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1004,7 +1004,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  
>  		xe_bo_assert_held(bo);
>  
> -		vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo->ttm.base);
> +		vm_bo = drm_gpuvm_bo_obtain_locked(vma->gpuva.vm, &bo->ttm.base);
>  		if (IS_ERR(vm_bo)) {
>  			xe_vma_free(vma);
>  			return ERR_CAST(vm_bo);
> @@ -2249,7 +2249,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>  		if (err)
>  			return ERR_PTR(err);
>  
> -		vm_bo = drm_gpuvm_bo_obtain(&vm->gpuvm, obj);
> +		vm_bo = drm_gpuvm_bo_obtain_locked(&vm->gpuvm, obj);
>  		if (IS_ERR(vm_bo)) {
>  			xe_bo_unlock(bo);
>  			return ERR_CAST(vm_bo);
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index fdfc575b260360611ff8ce16c327acede787929f..0d3fc1f6cac9966a42f3bc82b0b491bfefaf5b96 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -736,8 +736,8 @@ drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
>  		    struct drm_gem_object *obj);
>  
>  struct drm_gpuvm_bo *
> -drm_gpuvm_bo_obtain(struct drm_gpuvm *gpuvm,
> -		    struct drm_gem_object *obj);
> +drm_gpuvm_bo_obtain_locked(struct drm_gpuvm *gpuvm,
> +			   struct drm_gem_object *obj);
>  struct drm_gpuvm_bo *
>  drm_gpuvm_bo_obtain_prealloc(struct drm_gpuvm_bo *vm_bo);
>  
> 

