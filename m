Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1BFC8DE76
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 12:10:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25FEA10E169;
	Thu, 27 Nov 2025 11:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="IjhxU24y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616C910E169;
 Thu, 27 Nov 2025 11:10:33 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dHDHT1hXdz9tKb;
 Thu, 27 Nov 2025 12:10:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764241829; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0X9sUYFosKQhovpORm+Bz7gQNHf//aLsnKpOQbiijb4=;
 b=IjhxU24yblnv5qhu5aU+yZJzPief2jwFCNLeqo/B0e28R0Et3FhqAAc13jtq6tppo+jSR0
 wxHyyX4Wy6egdgWs5bRONMpeVaWQ3WAC9ZFWxtdn8mylPQdY1OCvn6e5hBZWCTX14BSw7M
 DyYKVg8zFVbeCdofoeh7NGuCM4uxYlYnc7zFvG3ojdusqri0fH1K3oP+g0M0nO08hlgyWD
 KaVcH7r6z/KgKWWzNfmQYkdgnAL59OBwP6hDSA9W+ZZas3P/iAvk08K2cHvGZaXKFtng0k
 KX9ate8bL8RdWMGX7hWxPMML3rMZB85YyCzYp/BihNDU8C5B5RjeLsGq8+hRhQ==
Message-ID: <3cf92ff5fa9c9c73c8464434b0e8e13e402091fd.camel@mailbox.org>
Subject: Re: [PATCH 13/18] drm/amdgpu: independence for the amdkfd_fence! v2
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 alexdeucher@gmail.com, simona.vetter@ffwll.ch, tursulin@ursulin.net, 
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 sumit.semwal@linaro.org
Date: Thu, 27 Nov 2025 12:10:25 +0100
In-Reply-To: <20251113145332.16805-14-christian.koenig@amd.com>
References: <20251113145332.16805-1-christian.koenig@amd.com>
 <20251113145332.16805-14-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 80acb9fb273bab064c2
X-MBO-RS-META: hh1ggsgdeiuchgemkhh4qd1wowhmuemg
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

On Thu, 2025-11-13 at 15:51 +0100, Christian K=C3=B6nig wrote:
> This should allow amdkfd_fences to outlive the amdgpu module.
>=20
> v2: implement Felix suggestion to lock the fence while signaling it.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
> =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 6 +++
> =C2=A0.../gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c=C2=A0 | 39 ++++++++---=
--------
> =C2=A0drivers/gpu/drm/amd/amdkfd/kfd_process.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 7 ++--
> =C2=A0drivers/gpu/drm/amd/amdkfd/kfd_svm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +-
> =C2=A04 files changed, 27 insertions(+), 29 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_amdkfd.h
> index 8bdfcde2029b..6254cef04213 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> @@ -196,6 +196,7 @@ int kfd_debugfs_kfd_mem_limits(struct seq_file *m, vo=
id *data);
> =C2=A0#endif
> =C2=A0#if IS_ENABLED(CONFIG_HSA_AMD)
> =C2=A0bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *m=
m);
> +void amdkfd_fence_signal(struct dma_fence *f);
> =C2=A0struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence=
 *f);
> =C2=A0void amdgpu_amdkfd_remove_all_eviction_fences(struct amdgpu_bo *bo)=
;
> =C2=A0int amdgpu_amdkfd_evict_userptr(struct mmu_interval_notifier *mni,
> @@ -210,6 +211,11 @@ bool amdkfd_fence_check_mm(struct dma_fence *f, stru=
ct mm_struct *mm)
> =C2=A0	return false;
> =C2=A0}
> =C2=A0
> +static inline
> +void amdkfd_fence_signal(struct dma_fence *f)
> +{

I would add a short comment here: "Empty function because =E2=80=A6"

> +}
> +
> =C2=A0static inline
> =C2=A0struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence=
 *f)
> =C2=A0{
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> index 09c919f72b6c..f76c3c52a2a1 100644
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

That the storage actually takes place is guaranteed by the lock taken
when calling the fence ops?

> +	return false;
> =C2=A0}
> =C2=A0
> =C2=A0/**
> @@ -174,9 +154,22 @@ bool amdkfd_fence_check_mm(struct dma_fence *f, stru=
ct mm_struct *mm)
> =C2=A0	return false;
> =C2=A0}
> =C2=A0
> +void amdkfd_fence_signal(struct dma_fence *f)
> +{
> +	struct amdgpu_amdkfd_fence *fence =3D to_amdgpu_amdkfd_fence(f);
> +	long flags;
> +
> +	dma_fence_lock_irqsafe(f, flags)
> +	if (fence->mm) {
> +		mmdrop(fence->mm);
> +		fence->mm =3D NULL;
> +	}
> +	dma_fence_signal_locked(f);
> +	dma_fence_unlock_irqrestore(f, flags)
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
> index a085faac9fe1..8fac70b839ed 100644
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
> @@ -1990,7 +1990,6 @@ kfd_process_gpuid_from_node(struct kfd_process *p, =
struct kfd_node *node,
> =C2=A0static int signal_eviction_fence(struct kfd_process *p)
> =C2=A0{
> =C2=A0	struct dma_fence *ef;
> -	int ret;
> =C2=A0
> =C2=A0	rcu_read_lock();
> =C2=A0	ef =3D dma_fence_get_rcu_safe(&p->ef);
> @@ -1998,10 +1997,10 @@ static int signal_eviction_fence(struct kfd_proce=
ss *p)
> =C2=A0	if (!ef)
> =C2=A0		return -EINVAL;
> =C2=A0
> -	ret =3D dma_fence_signal(ef);
> +	amdkfd_fence_signal(ef);
> =C2=A0	dma_fence_put(ef);
> =C2=A0
> -	return ret;
> +	return 0;

Oh wait, that's the code I'm also touching in my return code series!

https://lore.kernel.org/dri-devel/cef83fed-5994-4c77-962c-9c7aac9f7306@amd.=
com/


Does this series then solve the problem Felix pointed out in
evict_process_worker()?


P.


> =C2=A0}
> =C2=A0
> =C2=A0static void evict_process_worker(struct work_struct *work)
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/a=
mdkfd/kfd_svm.c
> index c30dfb8ec236..566950702b7d 100644
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
> =C2=A0
> =C2=A0	/* This is the last reference to svm_bo, after svm_range_vram_node=
_free
> =C2=A0	 * has been called in svm_migrate_vram_to_ram

