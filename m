Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1549FCB6478
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 16:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542A410E826;
	Thu, 11 Dec 2025 15:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="L0ZpFiyn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AAE810E824
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 15:08:47 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dRwvv5sG3z9tDp;
 Thu, 11 Dec 2025 16:08:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1765465723; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eqDmg3zc9dwnb6mE7hBkk2nelAbag76EmhON3qlOXtg=;
 b=L0ZpFiyn0hy+CGMIa1KY1WyYKWRekvQJYsYmVbjxNMzBfkVKYEmA7NvlAbiDSRYnPrIgu/
 y+BuRgqEUCFwFXMlf3kTK2JtfZvElQ/IVvkM0I9HuXJXTtqHM+TXRpm1QRJ4+dnQAVlwYL
 H8wTdIOYsFUh+fhKE69jZ1ii8soIjEG38ypQIbcHUv0DjtHF0Mi1Nz0Wh99StLqbW6yrUK
 27qXO+asrrb/KenHChvD3lpCG6JYl/VCP7f88zAL6y4hFn8U4zs1HzvT3GWgmqXFjemixz
 7uZznnop+io3NcP5ynG/6HBK/qhDk66y3c7/9IL/CezLO+Yl6cqdQaZQP6z1vw==
Message-ID: <2ef69b00035fe129bb3f8d4b4b4ad931fa26dc8a.camel@mailbox.org>
Subject: Re: [PATCH 14/19] drm/amdgpu: independence for the amdkfd_fence! v4
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 tursulin@ursulin.net, matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Date: Thu, 11 Dec 2025 16:08:40 +0100
In-Reply-To: <20251211122407.1709-15-christian.koenig@amd.com>
References: <20251211122407.1709-1-christian.koenig@amd.com>
 <20251211122407.1709-15-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 5dcc26d3d0b4f4ada74
X-MBO-RS-META: g17zgrig3ns3qcc6sr3sehb4nx4tmdh6
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2025-12-11 at 13:16 +0100, Christian K=C3=B6nig wrote:
> This allows amdkfd_fences to outlive the amdgpu module.
>=20
> v2: implement Felix suggestion to lock the fence while signaling it.
> v3: fix typos
> v4: fix return code in signal_eviction_fence
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 7 +++
> =C2=A0.../gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c=C2=A0 | 44 +++++++++--=
--------
> =C2=A0drivers/gpu/drm/amd/amdkfd/kfd_process.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/amd/amdkfd/kfd_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +-
> =C2=A04 files changed, 31 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_amdkfd.h
> index 8bdfcde2029b..2f2b277cfaed 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> @@ -196,6 +196,7 @@ int kfd_debugfs_kfd_mem_limits(struct seq_file *m, vo=
id *data);
> =C2=A0#endif
> =C2=A0#if IS_ENABLED(CONFIG_HSA_AMD)
> =C2=A0bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *m=
m);
> +bool amdkfd_fence_signal(struct dma_fence *f);
> =C2=A0struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence=
 *f);
> =C2=A0void amdgpu_amdkfd_remove_all_eviction_fences(struct amdgpu_bo *bo)=
;
> =C2=A0int amdgpu_amdkfd_evict_userptr(struct mmu_interval_notifier *mni,
> @@ -210,6 +211,12 @@ bool amdkfd_fence_check_mm(struct dma_fence *f, stru=
ct mm_struct *mm)
> =C2=A0	return false;
> =C2=A0}
> =C2=A0
> +static inline
> +bool amdkfd_fence_signal(struct dma_fence *f)
> +{
> +	return false;
> +}

Huh? What's that?

That function seems to be just a NOP. It's return code is used nowhere,
is it?



> +
> =C2=A0static inline
> =C2=A0struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence=
 *f)
> =C2=A0{
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> index 09c919f72b6c..9cd413e325f0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> @@ -127,29 +127,9 @@ static bool amdkfd_fence_enable_signaling(struct dma=
_fence *f)
> =C2=A0		if (!svm_range_schedule_evict_svm_bo(fence))
> =C2=A0			return true;
> =C2=A0	}
> -	return false;
> -}
> -
> -/**
> - * amdkfd_fence_release - callback that fence can be freed
> - *
> - * @f: dma_fence
> - *
> - * This function is called when the reference count becomes zero.
> - * Drops the mm_struct reference and RCU schedules freeing up the fence.
> - */
> -static void amdkfd_fence_release(struct dma_fence *f)
> -{
> -	struct amdgpu_amdkfd_fence *fence =3D to_amdgpu_amdkfd_fence(f);
> -
> -	/* Unconditionally signal the fence. The process is getting
> -	 * terminated.
> -	 */
> -	if (WARN_ON(!fence))
> -		return; /* Not an amdgpu_amdkfd_fence */
> -
> =C2=A0	mmdrop(fence->mm);
> -	kfree_rcu(f, rcu);
> +	fence->mm =3D NULL;
> +	return false;
> =C2=A0}
> =C2=A0
> =C2=A0/**
> @@ -174,9 +154,27 @@ bool amdkfd_fence_check_mm(struct dma_fence *f, stru=
ct mm_struct *mm)
> =C2=A0	return false;
> =C2=A0}
> =C2=A0
> +bool amdkfd_fence_signal(struct dma_fence *f)
> +{
> +	struct amdgpu_amdkfd_fence *fence =3D to_amdgpu_amdkfd_fence(f);
> +	unsigned long flags;
> +	bool was_signaled;
> +
> +	dma_fence_lock_irqsave(f, flags);
> +	if (fence->mm) {
> +		mmdrop(fence->mm);
> +		fence->mm =3D NULL;
> +	}
> +	was_signaled =3D dma_fence_is_signaled_locked(f);
> +	if (!was_signaled)
> +		dma_fence_signal_locked(f);
> +	dma_fence_unlock_irqrestore(f, flags);
> +
> +	return was_signaled;
> +}
> +
> =C2=A0static const struct dma_fence_ops amdkfd_fence_ops =3D {
> =C2=A0	.get_driver_name =3D amdkfd_fence_get_driver_name,
> =C2=A0	.get_timeline_name =3D amdkfd_fence_get_timeline_name,
> =C2=A0	.enable_signaling =3D amdkfd_fence_enable_signaling,
> -	.release =3D amdkfd_fence_release,
> =C2=A0};
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/a=
md/amdkfd/kfd_process.c
> index bb252ec43733..2cf39e3d3fae 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -1173,7 +1173,7 @@ static void kfd_process_wq_release(struct work_stru=
ct *work)
> =C2=A0	synchronize_rcu();
> =C2=A0	ef =3D rcu_access_pointer(p->ef);
> =C2=A0	if (ef)
> -		dma_fence_signal(ef);
> +		amdkfd_fence_signal(ef);
> =C2=A0
> =C2=A0	kfd_process_remove_sysfs(p);
> =C2=A0	kfd_debugfs_remove_process(p);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/a=
mdkfd/kfd_svm.c
> index 97c2270f278f..0e94f3a976b1 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -428,7 +428,7 @@ static void svm_range_bo_release(struct kref *kref)
> =C2=A0
> =C2=A0	if (!dma_fence_is_signaled(&svm_bo->eviction_fence->base))
> =C2=A0		/* We're not in the eviction worker. Signal the fence. */
> -		dma_fence_signal(&svm_bo->eviction_fence->base);
> +		amdkfd_fence_signal(&svm_bo->eviction_fence->base);
> =C2=A0	dma_fence_put(&svm_bo->eviction_fence->base);
> =C2=A0	amdgpu_bo_unref(&svm_bo->bo);
> =C2=A0	kfree(svm_bo);
> @@ -3628,7 +3628,7 @@ static void svm_range_evict_svm_bo_worker(struct wo=
rk_struct *work)
> =C2=A0	mmap_read_unlock(mm);
> =C2=A0	mmput(mm);
> =C2=A0
> -	dma_fence_signal(&svm_bo->eviction_fence->base);
> +	amdkfd_fence_signal(&svm_bo->eviction_fence->base);


And why do you do those changes and why doesn't the commit message
explain it?

You stop signalling those fences, after all.


P.

> =C2=A0
> =C2=A0	/* This is the last reference to svm_bo, after svm_range_vram_node=
_free
> =C2=A0	 * has been called in svm_migrate_vram_to_ram

