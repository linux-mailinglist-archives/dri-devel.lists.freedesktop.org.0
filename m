Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48294B2FBC4
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 16:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8970910E28D;
	Thu, 21 Aug 2025 14:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="CA7TRDPg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2EB110E28D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 14:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1755785152;
 bh=jrXTHilw3YCqitwncsxp/TnZdD5rGMxx9B9FTLWgRX0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CA7TRDPgsbu4SZkkpOsuoBMb7/o5GpaMacoUWRKtBv2Bhi4jmLvZmSGQSFPvHgIcx
 V445SguZi0r43f5a3s2y2OOsbbtP40RkKVdYkPJ/NkdRyPYNKfO1vQ1GNAMbUk50p3
 Td/Xvf9RFR6SEg2zICOXViekYhmtW8L7pFs5P18Q5y+j1gCrGD/LYqko4vXXCibOV9
 fZcEJBcyeGZfkmD6MkOvaDGHwa2byicyQrBG+Xy6XPKPmBtVh88P1FsjyI9+i/mlKl
 CUdsWMNeXWD9cg0rFjV8lnQ6csjWrSrGi0YPOKnls76pWj1WeTuPIilRtpgFuf84Lj
 nT139QBbyiB4g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9FAE817E03B0;
 Thu, 21 Aug 2025 16:05:51 +0200 (CEST)
Date: Thu, 21 Aug 2025 16:05:45 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Danilo Krummrich
 <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Steven
 Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Rob Clark
 <robin.clark@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, "=?UTF-8?B?QmrDtnJu?= Roy Baron"
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/2] panthor: use drm_gem_object.gpuva.lock instead of
 gpuva_list_lock
Message-ID: <20250821160545.70ca8d02@fedora>
In-Reply-To: <20250814-gpuva-mutex-in-gem-v1-2-e202cbfe6d77@google.com>
References: <20250814-gpuva-mutex-in-gem-v1-0-e202cbfe6d77@google.com>
 <20250814-gpuva-mutex-in-gem-v1-2-e202cbfe6d77@google.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

On Thu, 14 Aug 2025 13:53:15 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> Now that drm_gem_object has a dedicated mutex for the gpuva list that is
> intended to be used in cases that must be fence signalling safe, use it
> in Panthor.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/gpu/drm/panthor/panthor_gem.c |  4 +---
>  drivers/gpu/drm/panthor/panthor_gem.h | 12 ------------
>  drivers/gpu/drm/panthor/panthor_mmu.c | 16 ++++++++--------
>  3 files changed, 9 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index a123bc740ba1460f96882206f598b148b64dc5f6..c654a3377903cf7e067becdb481fb14895a4eaa5 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -74,7 +74,6 @@ static void panthor_gem_free_object(struct drm_gem_object *obj)
>  	mutex_destroy(&bo->label.lock);
>  
>  	drm_gem_free_mmap_offset(&bo->base.base);
> -	mutex_destroy(&bo->gpuva_list_lock);
>  	drm_gem_shmem_free(&bo->base);
>  	drm_gem_object_put(vm_root_gem);
>  }
> @@ -246,8 +245,7 @@ struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev, size_t
>  
>  	obj->base.base.funcs = &panthor_gem_funcs;
>  	obj->base.map_wc = !ptdev->coherent;
> -	mutex_init(&obj->gpuva_list_lock);
> -	drm_gem_gpuva_set_lock(&obj->base.base, &obj->gpuva_list_lock);
> +	drm_gem_gpuva_set_lock(&obj->base.base, &obj->base.base.gpuva.lock);

I guess this will go away in the previous patch in you follow Danilo's
advice to get rid of drm_gem_gpuva_set_lock(). The rest looks good to
me, so feel free to add

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

on the next version.

>  	mutex_init(&obj->label.lock);
>  
>  	panthor_gem_debugfs_bo_init(obj);
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
> index 8fc7215e9b900ed162e03aebeae999fda00eeb7a..80c6e24112d0bd0f1561ae4d2224842afb735a59 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -79,18 +79,6 @@ struct panthor_gem_object {
>  	 */
>  	struct drm_gem_object *exclusive_vm_root_gem;
>  
> -	/**
> -	 * @gpuva_list_lock: Custom GPUVA lock.
> -	 *
> -	 * Used to protect insertion of drm_gpuva elements to the
> -	 * drm_gem_object.gpuva.list list.
> -	 *
> -	 * We can't use the GEM resv for that, because drm_gpuva_link() is
> -	 * called in a dma-signaling path, where we're not allowed to take
> -	 * resv locks.
> -	 */
> -	struct mutex gpuva_list_lock;
> -
>  	/** @flags: Combination of drm_panthor_bo_flags flags. */
>  	u32 flags;
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 4140f697ba5af5769492d3bbb378e18aec8ade98..49ca416c7c2c5a01ab0513029697ba9c7a35832d 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1074,9 +1074,9 @@ static void panthor_vm_bo_put(struct drm_gpuvm_bo *vm_bo)
>  	 * GEM vm_bo list.
>  	 */
>  	dma_resv_lock(drm_gpuvm_resv(vm), NULL);
> -	mutex_lock(&bo->gpuva_list_lock);
> +	mutex_lock(&bo->base.base.gpuva.lock);
>  	unpin = drm_gpuvm_bo_put(vm_bo);
> -	mutex_unlock(&bo->gpuva_list_lock);
> +	mutex_unlock(&bo->base.base.gpuva.lock);
>  	dma_resv_unlock(drm_gpuvm_resv(vm));
>  
>  	/* If the vm_bo object was destroyed, release the pin reference that
> @@ -1249,9 +1249,9 @@ static int panthor_vm_prepare_map_op_ctx(struct panthor_vm_op_ctx *op_ctx,
>  	 * calling this function.
>  	 */
>  	dma_resv_lock(panthor_vm_resv(vm), NULL);
> -	mutex_lock(&bo->gpuva_list_lock);
> +	mutex_lock(&bo->base.base.gpuva.lock);
>  	op_ctx->map.vm_bo = drm_gpuvm_bo_obtain_prealloc(preallocated_vm_bo);
> -	mutex_unlock(&bo->gpuva_list_lock);
> +	mutex_unlock(&bo->base.base.gpuva.lock);
>  	dma_resv_unlock(panthor_vm_resv(vm));
>  
>  	/* If the a vm_bo for this <VM,BO> combination exists, it already
> @@ -2003,10 +2003,10 @@ static void panthor_vma_link(struct panthor_vm *vm,
>  {
>  	struct panthor_gem_object *bo = to_panthor_bo(vma->base.gem.obj);
>  
> -	mutex_lock(&bo->gpuva_list_lock);
> +	mutex_lock(&bo->base.base.gpuva.lock);
>  	drm_gpuva_link(&vma->base, vm_bo);
>  	drm_WARN_ON(&vm->ptdev->base, drm_gpuvm_bo_put(vm_bo));
> -	mutex_unlock(&bo->gpuva_list_lock);
> +	mutex_unlock(&bo->base.base.gpuva.lock);
>  }
>  
>  static void panthor_vma_unlink(struct panthor_vm *vm,
> @@ -2015,9 +2015,9 @@ static void panthor_vma_unlink(struct panthor_vm *vm,
>  	struct panthor_gem_object *bo = to_panthor_bo(vma->base.gem.obj);
>  	struct drm_gpuvm_bo *vm_bo = drm_gpuvm_bo_get(vma->base.vm_bo);
>  
> -	mutex_lock(&bo->gpuva_list_lock);
> +	mutex_lock(&bo->base.base.gpuva.lock);
>  	drm_gpuva_unlink(&vma->base);
> -	mutex_unlock(&bo->gpuva_list_lock);
> +	mutex_unlock(&bo->base.base.gpuva.lock);
>  
>  	/* drm_gpuva_unlink() release the vm_bo, but we manually retained it
>  	 * when entering this function, so we can implement deferred VMA
> 

