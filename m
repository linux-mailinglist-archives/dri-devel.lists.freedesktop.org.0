Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E81B3142A
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 11:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C614910E073;
	Fri, 22 Aug 2025 09:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="nB2uBX1d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843C310E073
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 09:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1755856345;
 bh=jfoOjycqNQZf36ZYHkgozD3Xli5JPO0u/7CtBBxQepM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nB2uBX1dLFPHsb2pBHVJLB2rWMp1MNNQblPU5wKU4NrOafY69EQUymKMaEDYUijfn
 r14fTSx+VMDqDRTv4X0bD33n1jK20CF19KndGdDKBILph0d0JQDJGuoeKOKHLVGDOh
 HzwJcqox/BrPqYqqa9tNHxNH+xnqWBK/e0b9LmkLY/gsgPK9g1QTKFAdXBrDadtXxB
 aZnpiyQSA0dD8lnHwNCwXWCLFGGy2wJOt/Nfo7TlNe2zZ9aIXt6J6hzjYnECK7p/uB
 K6frOh6zeJW8Lh74ssTwTIPXNosM9oyukAZpCivKyhS9yqwrrWdN4fvR4T1wFuLvWv
 O9Jvh6fTAKXvA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6826217E12DF;
 Fri, 22 Aug 2025 11:52:24 +0200 (CEST)
Date: Fri, 22 Aug 2025 11:52:21 +0200
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
Subject: Re: [PATCH v2 1/3] drm_gem: add mutex to drm_gem_object.gpuva
Message-ID: <20250822115221.24fffc2c@fedora>
In-Reply-To: <20250822-gpuva-mutex-in-gem-v2-1-c41a10d1d3b9@google.com>
References: <20250822-gpuva-mutex-in-gem-v2-0-c41a10d1d3b9@google.com>
 <20250822-gpuva-mutex-in-gem-v2-1-c41a10d1d3b9@google.com>
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

On Fri, 22 Aug 2025 09:28:24 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> There are two main ways that GPUVM might be used:
> 
> * staged mode, where VM_BIND ioctls update the GPUVM immediately so that
>   the GPUVM reflects the state of the VM *including* staged changes that
>   are not yet applied to the GPU's virtual address space.
> * immediate mode, where the GPUVM state is updated during run_job(),
>   i.e., in the DMA fence signalling critical path, to ensure that the
>   GPUVM and the GPU's virtual address space has the same state at all
>   times.
> 
> Currently, only Panthor uses GPUVM in immediate mode, but the Rust
> drivers Tyr and Nova will also use GPUVM in immediate mode, so it is
> worth to support both staged and immediate mode well in GPUVM. To use
> immediate mode, the GEMs gpuva list must be modified during the fence
> signalling path, which means that it must be protected by a lock that is
> fence signalling safe.
> 
> For this reason, a mutex is added to struct drm_gem_object that is
> intended to achieve this purpose. Adding it directly in the GEM object
> both makes it easier to use GPUVM in immediate mode, but also makes it
> possible to take the gpuva lock from core drm code.
> 
> As a follow-up, another change that should probably be made to support
> immediate mode is a mechanism to postpone cleanup of vm_bo objects, as
> dropping a vm_bo object in the fence signalling path is problematic for
> two reasons:
> 
> * When using DRM_GPUVM_RESV_PROTECTED, you cannot remove the vm_bo from
>   the extobj/evicted lists during the fence signalling path.
> * Dropping a vm_bo could lead to the GEM object getting destroyed.
>   The requirement that GEM object cleanup is fence signalling safe is
>   dubious and likely to be violated in practice.
> 
> Panthor already has its own custom implementation of postponing vm_bo
> cleanup.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

One minor thing below.

> ---
>  drivers/gpu/drm/drm_gem.c | 2 ++
>  include/drm/drm_gem.h     | 4 +++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 4a89b6acb6af39720451ac24033b89e144d282dc..8d25cc65707d5b44d931beb0207c9d08a3e2de5a 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -187,6 +187,7 @@ void drm_gem_private_object_init(struct drm_device *dev,
>  	kref_init(&obj->refcount);
>  	obj->handle_count = 0;
>  	obj->size = size;
> +	mutex_init(&obj->gpuva.lock);
>  	dma_resv_init(&obj->_resv);
>  	if (!obj->resv)
>  		obj->resv = &obj->_resv;
> @@ -210,6 +211,7 @@ void drm_gem_private_object_fini(struct drm_gem_object *obj)
>  	WARN_ON(obj->dma_buf);
>  
>  	dma_resv_fini(&obj->_resv);
> +	mutex_destroy(&obj->gpuva.lock);
>  }
>  EXPORT_SYMBOL(drm_gem_private_object_fini);
>  
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index d3a7b43e2c637b164eba5af7cc2fc8ef09d4f0a4..5934d8dc267a65aaf62d2d025869221cd110b325 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -403,11 +403,13 @@ struct drm_gem_object {
>  	 * Provides the list of GPU VAs attached to this GEM object.
>  	 *
>  	 * Drivers should lock list accesses with the GEMs &dma_resv lock
> -	 * (&drm_gem_object.resv) or a custom lock if one is provided.
> +	 * (&drm_gem_object.resv) or a custom lock if one is provided. The
> +	 * mutex inside this struct may be used as the custom lock.
>  	 */
>  	struct {
>  		struct list_head list;
>  
> +		struct mutex lock;

Maybe it's time we start moving some bits of the gpuva field docs next
to the fields they describe:

	/**
	 * @gpuva: Fields used by GPUVM to manage mappings pointing to this GEM object.
	 */
	struct {
		/**
		 * @gpuva.list: list of GPU VAs attached to this GEM object.
		 *
		 * Drivers should lock list accesses with the GEMs &dma_resv lock
		 * (&drm_gem_object.resv) or &drm_gem_object.gpuva.lock if the
		 * list is being updated in places where the resv lock can't be
		 * acquired (fence signalling path).
		 */
		struct list_head list;

		/**
		 * @gpuva.lock: lock protecting access to &drm_gem_object.gpuva.list
		 * when the resv lock can't be used.
		 *
		 * Should only be used when the VM is being modified in a fence
		 * signalling path, otherwise you should use &drm_gem_object.resv to
		 * protect accesses to &drm_gem_object.gpuva.list.
		 */
		struct mutex lock;

		...
	};

>  #ifdef CONFIG_LOCKDEP
>  		struct lockdep_map *lock_dep_map;
>  #endif
> 

