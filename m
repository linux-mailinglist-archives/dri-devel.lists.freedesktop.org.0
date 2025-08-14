Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C7CB26A44
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 16:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5383710E89F;
	Thu, 14 Aug 2025 14:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HwJY7R5Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6456310E89F
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 14:59:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 16FD544623;
 Thu, 14 Aug 2025 14:59:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC0AC4CEED;
 Thu, 14 Aug 2025 14:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755183588;
 bh=nhCkSzRoamaC2x6YatM8AEEAlKpcan3l13anynVtDVs=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=HwJY7R5YAC0+cWuEW9IFGPuZ262x7OjBrTIbVN0pPGtIcJ7DR8tQEVn+khZflTm9R
 XIHsEG4IVQmAUeK64NTGVkFV9GX6RwpNjdEU9J48Z6IAujyEc3s5baikGQPqi2upgu
 puZAdm3EQEV2HmByevPQPy6tpSqBoJY5FBGQ9k4w+AA33Ctcd9USN5U7auncolSa2e
 wSltFxJf1P/WCvSapNAZDZPQevT382REwfSRcfy0sSYpsJUN8/eFjNPqZRAz9I4ME1
 x6YHN2/9e/wkxwKHgd7R5Yk4DUVEQxAd2gOorEbQAVS6MmYfTu+CAoRg5z2zu9g8NU
 sL2O+KCX7t19A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 14 Aug 2025 16:59:42 +0200
Message-Id: <DC28NIMIPF5I.2P17OZFA06GXL@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/2] drm_gem: add mutex to drm_gem_object.gpuva
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Boris
 Brezillon" <boris.brezillon@collabora.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Steven Price" <steven.price@arm.com>,
 "Liviu Dudau" <liviu.dudau@arm.com>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Rob Herring" <robh@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
References: <20250814-gpuva-mutex-in-gem-v1-0-e202cbfe6d77@google.com>
 <20250814-gpuva-mutex-in-gem-v1-1-e202cbfe6d77@google.com>
In-Reply-To: <20250814-gpuva-mutex-in-gem-v1-1-e202cbfe6d77@google.com>
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

On Thu Aug 14, 2025 at 3:53 PM CEST, Alice Ryhl wrote:
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
> ---
>  drivers/gpu/drm/drm_gem.c | 2 ++
>  include/drm/drm_gem.h     | 4 +++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 6a44351e58b7741c358406c8a576b6660b5ca904..24c109ab3fadd5af2e5d9de3f=
e330b105217a9ce 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -187,6 +187,7 @@ void drm_gem_private_object_init(struct drm_device *d=
ev,
>  	kref_init(&obj->refcount);
>  	obj->handle_count =3D 0;
>  	obj->size =3D size;
> +	mutex_init(&obj->gpuva.lock);
>  	dma_resv_init(&obj->_resv);
>  	if (!obj->resv)
>  		obj->resv =3D &obj->_resv;
> @@ -1057,6 +1058,7 @@ drm_gem_object_free(struct kref *kref)
>  	if (WARN_ON(!obj->funcs->free))
>  		return;
> =20
> +	mutex_destroy(&obj->gpuva.lock);
>  	obj->funcs->free(obj);

I really can't think of a valid case where we need to access this mutex fro=
m the
GEM's free() callback, yet it probably doesn't hurt to mention it in the
documentation of struct drm_gem_object_funcs.

>  }
>  EXPORT_SYMBOL(drm_gem_object_free);
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index d3a7b43e2c637b164eba5af7cc2fc8ef09d4f0a4..5934d8dc267a65aaf62d2d025=
869221cd110b325 100644
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
> =20
> +		struct mutex lock;
>  #ifdef CONFIG_LOCKDEP
>  		struct lockdep_map *lock_dep_map;
>  #endif

We should remove this and the corresponding functions (i.e.
drm_gem_gpuva_set_lock(), drm_gem_gpuva_assert_lock_held()) in a subsequent
patch and let GPUVM assert for this mutex directly rather than for the
lockdep_map.
