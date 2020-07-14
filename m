Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE93821EE51
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 12:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31EEA6E949;
	Tue, 14 Jul 2020 10:49:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB366E8B4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 10:49:14 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z2so20758646wrp.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 03:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=XFyCObAFNGAkAD33iucRxardqlG+NdnL+BA8ka5PPr4=;
 b=bOeL2MUd2f8AlWSJD3wmjK7kX/u8xZmjsUmMQeJzGK+l98O+GbJDKEx2q+dtP0Ysuw
 ahdh9hOxfLzdYsrsSCIb4+jsBwaVOfOB9g1F7JaVOZ01TKCuMezHAGJnllnKMSUhc5F+
 Oz3Dlt8i1yKPbH5ek0krA47zpw8DZA2RsafPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XFyCObAFNGAkAD33iucRxardqlG+NdnL+BA8ka5PPr4=;
 b=lZX3D4BzkfkBZrV2KGLAkQAZ5Rz3KkpP7xi8YGG1SEXrSygmcl0EfWUwGTu3EudR5W
 rn0AVasNanuH4JAiB2KuvBlVkP5Gm2N4MWs5KQZZmE5JR5fpOALioKxO4n6tLxgkMavi
 E/N/3u/JSiTNXYB8S+/rEqx0Qv29/SwRRb/RoErrvdzDmpN5d287KS2SK1fSP4ikFU8V
 IWpNj7f0Jicyw6SFFgY+LKlBL/zrMnxcQ1VW+nzbCHH10N28gXbSS6B6fMxEtiTQSA8x
 FyopOL/CwY/yCawSysQzrmsQm/DWlY9jeblgB9H6S50e4RTTq8bfE3bd0BpxZgAqOex3
 MtPg==
X-Gm-Message-State: AOAM530s3TjGhVxtO2QD+Pz3XJx57MVBJN3Waf8TFScY67LZhOrCysjs
 4mRGFvnOttv8mYrs0EBXvmrGRmIEWpk=
X-Google-Smtp-Source: ABdhPJxzCDVzf3ULPsu9gK9KiSaB34ZTvYO1lf6Ch0WaVTCD95UxXPy23Q0JcDyFOFTm8A13sseYqQ==
X-Received: by 2002:adf:c44d:: with SMTP id a13mr4551346wrg.205.1594723752919; 
 Tue, 14 Jul 2020 03:49:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u17sm27474975wrp.70.2020.07.14.03.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 03:49:12 -0700 (PDT)
Date: Tue, 14 Jul 2020 12:49:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 19/25] drm/amdgpu: s/GFP_KERNEL/GFP_ATOMIC in scheduler
 code
Message-ID: <20200714104910.GC3278063@phenom.ffwll.local>
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
 <20200707201229.472834-20-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200707201229.472834-20-daniel.vetter@ffwll.ch>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 07, 2020 at 10:12:23PM +0200, Daniel Vetter wrote:
> My dma-fence lockdep annotations caught an inversion because we
> allocate memory where we really shouldn't:
> =

> 	kmem_cache_alloc+0x2b/0x6d0
> 	amdgpu_fence_emit+0x30/0x330 [amdgpu]
> 	amdgpu_ib_schedule+0x306/0x550 [amdgpu]
> 	amdgpu_job_run+0x10f/0x260 [amdgpu]
> 	drm_sched_main+0x1b9/0x490 [gpu_sched]
> 	kthread+0x12e/0x150
> =

> Trouble right now is that lockdep only validates against GFP_FS, which
> would be good enough for shrinkers. But for mmu_notifiers we actually
> need !GFP_ATOMIC, since they can be called from any page laundering,
> even if GFP_NOFS or GFP_NOIO are set.
> =

> I guess we should improve the lockdep annotations for
> fs_reclaim_acquire/release.
> =

> Ofc real fix is to properly preallocate this fence and stuff it into
> the amdgpu job structure. But GFP_ATOMIC gets the lockdep splat out of
> the way.
> =

> v2: Two more allocations in scheduler paths.
> =

> Frist one:
> =

> 	__kmalloc+0x58/0x720
> 	amdgpu_vmid_grab+0x100/0xca0 [amdgpu]
> 	amdgpu_job_dependency+0xf9/0x120 [amdgpu]
> 	drm_sched_entity_pop_job+0x3f/0x440 [gpu_sched]
> 	drm_sched_main+0xf9/0x490 [gpu_sched]
> =

> Second one:
> =

> 	kmem_cache_alloc+0x2b/0x6d0
> 	amdgpu_sync_fence+0x7e/0x110 [amdgpu]
> 	amdgpu_vmid_grab+0x86b/0xca0 [amdgpu]
> 	amdgpu_job_dependency+0xf9/0x120 [amdgpu]
> 	drm_sched_entity_pop_job+0x3f/0x440 [gpu_sched]
> 	drm_sched_main+0xf9/0x490 [gpu_sched]
> =

> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: linux-rdma@vger.kernel.org
> Cc: amd-gfx@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Christian K=F6nig <christian.koenig@amd.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Has anyone from amd side started looking into how to fix this properly?

I looked a bit into fixing this with mempool, and the big guarantee we
need is that
- there's a hard upper limit on how many allocations we minimally need to
  guarantee forward progress. And the entire vmid allocation and
  amdgpu_sync_fence stuff kinda makes me question that's a valid
  assumption.

- mempool_free must be called without any locks in the way which are held
  while we call mempool_alloc. Otherwise we again have a nice deadlock
  with no forward progress. I tried auditing that, but got lost in amdgpu
  and scheduler code. Some lockdep annotations for mempool.c might help,
  but they're not going to catch everything. Plus it would be again manual
  annotations because this is yet another cross-release issue. So not sure
  that helps at all.

iow, not sure what to do here. Ideas?

Cheers, Daniel

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c   | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c  | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_fence.c
> index 8d84975885cd..a089a827fdfe 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -143,7 +143,7 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struc=
t dma_fence **f,
>  	uint32_t seq;
>  	int r;
>  =

> -	fence =3D kmem_cache_alloc(amdgpu_fence_slab, GFP_KERNEL);
> +	fence =3D kmem_cache_alloc(amdgpu_fence_slab, GFP_ATOMIC);
>  	if (fence =3D=3D NULL)
>  		return -ENOMEM;
>  =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ids.c
> index 267fa45ddb66..a333ca2d4ddd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> @@ -208,7 +208,7 @@ static int amdgpu_vmid_grab_idle(struct amdgpu_vm *vm,
>  	if (ring->vmid_wait && !dma_fence_is_signaled(ring->vmid_wait))
>  		return amdgpu_sync_fence(sync, ring->vmid_wait);
>  =

> -	fences =3D kmalloc_array(sizeof(void *), id_mgr->num_ids, GFP_KERNEL);
> +	fences =3D kmalloc_array(sizeof(void *), id_mgr->num_ids, GFP_ATOMIC);
>  	if (!fences)
>  		return -ENOMEM;
>  =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_sync.c
> index 8ea6c49529e7..af22b526cec9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> @@ -160,7 +160,7 @@ int amdgpu_sync_fence(struct amdgpu_sync *sync, struc=
t dma_fence *f)
>  	if (amdgpu_sync_add_later(sync, f))
>  		return 0;
>  =

> -	e =3D kmem_cache_alloc(amdgpu_sync_slab, GFP_KERNEL);
> +	e =3D kmem_cache_alloc(amdgpu_sync_slab, GFP_ATOMIC);
>  	if (!e)
>  		return -ENOMEM;
>  =

> -- =

> 2.27.0
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
