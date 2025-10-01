Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BC8BB0985
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 16:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7825210E0F5;
	Wed,  1 Oct 2025 14:01:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Upl0g4JH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13FE10E0F5
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 14:01:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E14C8627B5;
 Wed,  1 Oct 2025 14:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0870C4CEF5;
 Wed,  1 Oct 2025 14:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759327275;
 bh=r85epxj1S8/kVdZVGxmdiIeI6rwjPQ1l48+L1/U0Tww=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=Upl0g4JH6zAuEVCYf02fmbkC5OpXz8mHyAxjlXC7Id+GB6gFYM1yJMmabBs9jS1Hq
 KKX+oD/l280gjahMRpa/NT5oJtq/PrPanbe1Wgkh+ZME7FMuw52DsM7/4WCk13c1iC
 LCXXk/jRN8lQr0XG9UySaHgsM7++hedzTXhdtnX3tM9c2+vk0FQHfkQJTflh9aM9bv
 I2hWRcjLmXT3RBBL35i5PMqadBBboZgq47BDyuNiI0jyES1LEuBzFHDFOKjEOAAA66
 fQA59NXWQ6mOPvvngcB+rKbSi2X1qzt0zXwb3vKN8e5JLsjHW8Anxu9zGVHF5YqLpx
 NYpcMjs3SkkRg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Oct 2025 16:01:10 +0200
Message-Id: <DD71GUKZKFPR.2OVPQ9KOI89YG@kernel.org>
Subject: Re: [PATCH v3 1/2] drm/gpuvm: add deferred vm_bo cleanup
Cc: "Matthew Brost" <matthew.brost@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Boris
 Brezillon" <boris.brezillon@collabora.com>, "Steven Price"
 <steven.price@arm.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Liviu Dudau" <liviu.dudau@arm.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251001-vmbo-defer-v3-0-a3fe6b6ae185@google.com>
 <20251001-vmbo-defer-v3-1-a3fe6b6ae185@google.com>
In-Reply-To: <20251001-vmbo-defer-v3-1-a3fe6b6ae185@google.com>
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

On Wed Oct 1, 2025 at 12:41 PM CEST, Alice Ryhl wrote:
> +/*
> + * Must be called with GEM mutex held. After releasing GEM mutex,
> + * drm_gpuvm_bo_defer_free_unlocked() must be called.
> + */
> +static void
> +drm_gpuvm_bo_defer_free_locked(struct kref *kref)
> +{
> +	struct drm_gpuvm_bo *vm_bo =3D container_of(kref, struct drm_gpuvm_bo,
> +						  kref);
> +	struct drm_gpuvm *gpuvm =3D vm_bo->vm;
> +
> +	if (!drm_gpuvm_resv_protected(gpuvm)) {
> +		drm_gpuvm_bo_list_del(vm_bo, extobj, true);
> +		drm_gpuvm_bo_list_del(vm_bo, evict, true);
> +	}
> +
> +	list_del(&vm_bo->list.entry.gem);
> +}
> +
> +/*
> + * GEM mutex must not be held. Called after drm_gpuvm_bo_defer_free_lock=
ed().
> + */
> +static void
> +drm_gpuvm_bo_defer_free_unlocked(struct drm_gpuvm_bo *vm_bo)
> +{
> +	struct drm_gpuvm *gpuvm =3D vm_bo->vm;
> +
> +	llist_add(&vm_bo->list.entry.bo_defer, &gpuvm->bo_defer);
> +}
> +
> +static void
> +drm_gpuvm_bo_defer_free(struct kref *kref)
> +{
> +	struct drm_gpuvm_bo *vm_bo =3D container_of(kref, struct drm_gpuvm_bo,
> +						  kref);
> +
> +	mutex_lock(&vm_bo->obj->gpuva.lock);
> +	drm_gpuvm_bo_defer_free_locked(kref);
> +	mutex_unlock(&vm_bo->obj->gpuva.lock);
> +
> +	/*
> +	 * It's important that the GEM stays alive for the duration in which we
> +	 * hold the mutex, but the instant we add the vm_bo to bo_defer,
> +	 * another thread might call drm_gpuvm_bo_deferred_cleanup() and put
> +	 * the GEM. Therefore, to avoid kfreeing a mutex we are holding, we add
> +	 * the vm_bo to bo_defer *after* releasing the GEM's mutex.
> +	 */
> +	drm_gpuvm_bo_defer_free_unlocked(vm_bo);
> +}

So, you're splitting drm_gpuvm_bo_defer_free() into two functions, one doin=
g the
work that is required to be called with the gpuva lock held and one that do=
es
the work that does not require a lock, which makes perfect sense.

However, the naming chosen for the two functions, i.e.
drm_gpuvm_bo_defer_free_unlocked() and drm_gpuvm_bo_defer_free_locked() is
confusing:

What you mean semantically mean is "do part 1 with lock held" and "do part =
2
without lock held", but the the chosen names suggest that both functions ar=
e
identical, with the only difference that one takes the lock internally and =
the
other one requires the caller to take the lock.

It's probably better to name them after what they do and not what they're p=
art
of. If you prefer the latter, that's fine with me too, but please choose a =
name
that makes this circumstance obvious.

With that addressed,

Acked-by: Danilo Krummrich <dakr@kernel.org>
