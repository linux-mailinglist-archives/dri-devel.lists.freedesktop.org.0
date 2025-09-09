Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C17B4FF2E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 16:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC87510E729;
	Tue,  9 Sep 2025 14:20:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ui8qjKCv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE9B10E729
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 14:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757427635; x=1788963635;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=9duqgX9fp6sWfF5QruNj80hrtd81w9SbJf6/XjHYUP0=;
 b=Ui8qjKCv4t96TQkjZb5KObjWtXrK9Hr3v1F+1hu6oskre5H+dqFzMbMV
 xeChtnjzzftHEc6f70eDKSUl74ajLeBOEgrSYQLAWccnJ2Me2be7w+dXJ
 YC8G6COihhLi7rn+W1OfZ7Gp5pOND+Xtpj1iXHVf4rcduBDPfHVWAZdNK
 JYcS1nwFCie9A7weYm/WOM3MqtEj6DtXoeBahEFQa+03sxIP19mXGnh+6
 VnlqiZHGPzQStB2P+c3jMewmxZJ8wZoIWY/t9VPtfloP/2zHbwty1Zp5D
 FK1kVzb/p34rf+ez82x0UN0Zv5okzZ/0LRuf0O/FoqOwSq40NbxHYNS2O Q==;
X-CSE-ConnectionGUID: 1q61zzZaSMCsLpgDx/WRwQ==
X-CSE-MsgGUID: cJrsZ2GEQeyuy5Q1oYP+Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59407805"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="59407805"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 07:20:34 -0700
X-CSE-ConnectionGUID: CPSFohp6TIOyyPaUzAUk6Q==
X-CSE-MsgGUID: G6Z0XHwCQNGOPZtUW0YjeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="173011980"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.244.108])
 ([10.245.244.108])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 07:20:30 -0700
Message-ID: <c7a7aac3e82fde7a20970e6a65d200ab79804b0f.camel@linux.intel.com>
Subject: Re: [PATCH v2 1/2] drm/gpuvm: add deferred vm_bo cleanup
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard	
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Boris Brezillon	
 <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, Liviu Dudau
 <liviu.dudau@arm.com>, 	dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 	rust-for-linux@vger.kernel.org
Date: Tue, 09 Sep 2025 16:20:32 +0200
In-Reply-To: <20250909-vmbo-defer-v2-1-9835d7349089@google.com>
References: <20250909-vmbo-defer-v2-0-9835d7349089@google.com>
 <20250909-vmbo-defer-v2-1-9835d7349089@google.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
MIME-Version: 1.0
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

On Tue, 2025-09-09 at 13:36 +0000, Alice Ryhl wrote:
> When using GPUVM in immediate mode, it is necessary to call
> drm_gpuvm_unlink() from the fence signalling critical path. However,
> unlink may call drm_gpuvm_bo_put(), which causes some challenges:
>=20
> 1. drm_gpuvm_bo_put() often requires you to take resv locks, which
> you
> =C2=A0=C2=A0 can't do from the fence signalling critical path.
> 2. drm_gpuvm_bo_put() calls drm_gem_object_put(), which is often
> going
> =C2=A0=C2=A0 to be unsafe to call from the fence signalling critical path=
.
>=20
> To solve these issues, add a deferred version of drm_gpuvm_unlink()
> that
> adds the vm_bo to a deferred cleanup list, and then clean it up
> later.
>=20
> The new methods take the GEMs GPUVA lock internally rather than
> letting
> the caller do it because it also needs to perform an operation after
> releasing the mutex again. This is to prevent freeing the GEM while
> holding the mutex (more info as comments in the patch). This means
> that
> the new methods can only be used with DRM_GPUVM_IMMEDIATE_MODE.
>=20
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> =C2=A0drivers/gpu/drm/drm_gpuvm.c | 174
> ++++++++++++++++++++++++++++++++++++++++++++
> =C2=A0include/drm/drm_gpuvm.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 26 +++++++
> =C2=A02 files changed, 200 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_gpuvm.c
> b/drivers/gpu/drm/drm_gpuvm.c
> index
> 78a1a4f095095e9379bdf604d583f6c8b9863ccb..5aa8b3813019705f70101950af2
> d8fe4e648e9d0 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -876,6 +876,27 @@ __drm_gpuvm_bo_list_add(struct drm_gpuvm *gpuvm,
> spinlock_t *lock,
> =C2=A0	cond_spin_unlock(lock, !!lock);
> =C2=A0}
> =C2=A0
> +/**
> + * drm_gpuvm_bo_is_dead() - check whether this vm_bo is scheduled

NIT: Is zombie a better name than dead?

> for cleanup
> + * @vm_bo: the &drm_gpuvm_bo
> + *
> + * When a vm_bo is scheduled for cleanup using the bo_defer list, it
> is not
> + * immediately removed from the evict and extobj lists if they are
> protected by
> + * the resv lock, as we can't take that lock during run_job() in
> immediate
> + * mode. Therefore, anyone iterating these lists should skip entries
> that are
> + * being destroyed.
> + *
> + * Checking the refcount without incrementing it is okay as long as
> the lock
> + * protecting the evict/extobj list is held for as long as you are
> using the
> + * vm_bo, because even if the refcount hits zero while you are using
> it, freeing
> + * the vm_bo requires taking the list's lock.
> + */
> +static bool
> +drm_gpuvm_bo_is_dead(struct drm_gpuvm_bo *vm_bo)
> +{
> +	return !kref_read(&vm_bo->kref);
> +}
> +
> =C2=A0/**
> =C2=A0 * drm_gpuvm_bo_list_add() - insert a vm_bo into the given list
> =C2=A0 * @__vm_bo: the &drm_gpuvm_bo
> @@ -1081,6 +1102,9 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const
> char *name,
> =C2=A0	INIT_LIST_HEAD(&gpuvm->evict.list);
> =C2=A0	spin_lock_init(&gpuvm->evict.lock);
> =C2=A0
> +	INIT_LIST_HEAD(&gpuvm->bo_defer.list);
> +	spin_lock_init(&gpuvm->bo_defer.lock);
> +

This list appears to exactly follow the pattern a lockless list was
designed for. Saves some space in the vm_bo and gets rid of the
excessive locking. <include/linux/llist.h>

Otherwise LGTM.

/Thomas

