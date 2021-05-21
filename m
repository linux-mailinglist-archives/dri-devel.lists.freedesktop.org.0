Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 613F338C3BC
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 11:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E976F60E;
	Fri, 21 May 2021 09:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957216F60E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 09:46:22 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id g11so13701128ilq.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 02:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PETi2cGKgOkzUGpOv4dmjs/DJ3aw/4zTyzih3rXf2OY=;
 b=WKWDK4DRN3ToTeA73B2/EOrnQBDSAq9lK3+UkgMn5gH3c1vs7tdu51IHF+NT1KP2o9
 dMa2jcG65hvl8rpg3xKQEwQDQBb2cZyA1sD83ojUFPAnwI4KNEp58vEocbgZtJ6GC2dj
 QorzIndTkWaUgHJYDbpxoE2q4HxWEW+jLxWPRgdvuNSisVa8pvP3DCHUnDZ68vMoSxvo
 NbPRJecynxdianCGR6c++wzjpFdkdJyV90Q245v+Tj3ZqP/ip1MDhQ/vgpBLq+P+bRAI
 /mAXo3BAzN9i+7AkTymuU7djrwO6xVkKy09AlduqtFS9CVjVlrEDgBI80LkflP8bZV8Q
 lfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PETi2cGKgOkzUGpOv4dmjs/DJ3aw/4zTyzih3rXf2OY=;
 b=NfgkrD+3v1puMA3wi2aatrNpZx0VW1x2mPalQQvNAKRnE0hjOxFCx/bHdOdmsR+5ci
 /kiFN60qK4Kdh36e0ykatK6398p0dYpgSE1qCU2ATNEcTksO7AfoUV0PuDGN4HdpS/qE
 6Udm2OVF7RiF2KQhmwfui5F+LaHQOoOhStlFigGubg+CYumXPJ+OG2XMkGvpUmx4HfX1
 AaMEJekbgbOzgfp3nDIqiEM+jpzxjMAA/vhY86nYSYbw7J4T/LRJD1nzGLL9lFBjFEQi
 XMxLKgKBf4w/6EY4WZr4mY0d4sf69b+I71c+/xAdbC+Btmzr4E/716DYuiX/CJWV4TOu
 dSZQ==
X-Gm-Message-State: AOAM531fLRgf9lB1CESHKBQz49Ljemc/esQJAt4zp+ZP2d9FdD4FT/DR
 VA4DyJUVc7Y1r7LEZXn1bqp4MayK3uszRfwykogXGA==
X-Google-Smtp-Source: ABdhPJwbLVYkaLaPKyiIa4hjusbCiBi7EeYNHKAcxHX9zxnFCfScHqQBUhvfH4uSkjTuFNdzDq6SUY/0e/7YXNnKHOw=
X-Received: by 2002:a05:6e02:1aa7:: with SMTP id
 l7mr10385843ilv.307.1621590381829; 
 Fri, 21 May 2021 02:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Fri, 21 May 2021 11:46:23 +0200
Message-ID: <CAP+8YyEhRwgz2hCri3K7Kv1OusVa_LGEuKZqQEx5jv+NiDKZrA@mail.gmail.com>
Subject: Re: [PATCH 01/11] drm/amdgpu: Comply with implicit fencing rules
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Chen Li <chenli@uniontech.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 mesa-dev <mesa-dev@lists.freedesktop.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Dennis Li <Dennis.Li@amd.com>, Deepak R Varma <mh12gx2825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 21, 2021 at 11:10 AM Daniel Vetter <daniel.vetter@ffwll.ch> wro=
te:
>
> Docs for struct dma_resv are fairly clear:
>
> "A reservation object can have attached one exclusive fence (normally
> associated with write operations) or N shared fences (read
> operations)."
>
> https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html#reservation-=
objects
>
> Furthermore a review across all of upstream.
>
> First of render drivers and how they set implicit fences:
>
> - nouveau follows this contract, see in validate_fini_no_ticket()
>
>                         nouveau_bo_fence(nvbo, fence, !!b->write_domains)=
;
>
>   and that last boolean controls whether the exclusive or shared fence
>   slot is used.
>
> - radeon follows this contract by setting
>
>                 p->relocs[i].tv.num_shared =3D !r->write_domain;
>
>   in radeon_cs_parser_relocs(), which ensures that the call to
>   ttm_eu_fence_buffer_objects() in radeon_cs_parser_fini() will do the
>   right thing.
>
> - vmwgfx seems to follow this contract with the shotgun approach of
>   always setting ttm_val_buf->num_shared =3D 0, which means
>   ttm_eu_fence_buffer_objects() will only use the exclusive slot.
>
> - etnaviv follows this contract, as can be trivially seen by looking
>   at submit_attach_object_fences()
>
> - i915 is a bit a convoluted maze with multiple paths leading to
>   i915_vma_move_to_active(). Which sets the exclusive flag if
>   EXEC_OBJECT_WRITE is set. This can either come as a buffer flag for
>   softpin mode, or through the write_domain when using relocations. It
>   follows this contract.
>
> - lima follows this contract, see lima_gem_submit() which sets the
>   exclusive fence when the LIMA_SUBMIT_BO_WRITE flag is set for that
>   bo
>
> - msm follows this contract, see msm_gpu_submit() which sets the
>   exclusive flag when the MSM_SUBMIT_BO_WRITE is set for that buffer
>
> - panfrost follows this contract with the shotgun approach of just
>   always setting the exclusive fence, see
>   panfrost_attach_object_fences(). Benefits of a single engine I guess
>
> - v3d follows this contract with the same shotgun approach in
>   v3d_attach_fences_and_unlock_reservation(), but it has at least an
>   XXX comment that maybe this should be improved
>
> - v4c uses the same shotgun approach of always setting an exclusive
>   fence, see vc4_update_bo_seqnos()
>
> - vgem also follows this contract, see vgem_fence_attach_ioctl() and
>   the VGEM_FENCE_WRITE. This is used in some igts to validate prime
>   sharing with i915.ko without the need of a 2nd gpu
>
> - vritio follows this contract again with the shotgun approach of
>   always setting an exclusive fence, see virtio_gpu_array_add_fence()
>
> This covers the setting of the exclusive fences when writing.
>
> Synchronizing against the exclusive fence is a lot more tricky, and I
> only spot checked a few:
>
> - i915 does it, with the optional EXEC_OBJECT_ASYNC to skip all
>   implicit dependencies (which is used by vulkan)
>
> - etnaviv does this. Implicit dependencies are collected in
>   submit_fence_sync(), again with an opt-out flag
>   ETNA_SUBMIT_NO_IMPLICIT. These are then picked up in
>   etnaviv_sched_dependency which is the
>   drm_sched_backend_ops->dependency callback.
>
> - v4c seems to not do much here, maybe gets away with it by not having
>   a scheduler and only a single engine. Since all newer broadcom chips th=
an
>   the OG vc4 use v3d for rendering, which follows this contract, the
>   impact of this issue is fairly small.
>
> - v3d does this using the drm_gem_fence_array_add_implicit() helper,
>   which then it's drm_sched_backend_ops->dependency callback
>   v3d_job_dependency() picks up.
>
> - panfrost is nice here and tracks the implicit fences in
>   panfrost_job->implicit_fences, which again the
>   drm_sched_backend_ops->dependency callback panfrost_job_dependency()
>   picks up. It is mildly questionable though since it only picks up
>   exclusive fences in panfrost_acquire_object_fences(), but not buggy
>   in practice because it also always sets the exclusive fence. It
>   should pick up both sets of fences, just in case there's ever going
>   to be a 2nd gpu in a SoC with a mali gpu. Or maybe a mali SoC with a
>   pcie port and a real gpu, which might actually happen eventually. A
>   bug, but easy to fix. Should probably use the
>   drm_gem_fence_array_add_implicit() helper.
>
> - lima is nice an easy, uses drm_gem_fence_array_add_implicit() and
>   the same schema as v3d.
>
> - msm is mildly entertaining. It also supports MSM_SUBMIT_NO_IMPLICIT,
>   but because it doesn't use the drm/scheduler it handles fences from
>   the wrong context with a synchronous dma_fence_wait. See
>   submit_fence_sync() leading to msm_gem_sync_object(). Investing into
>   a scheduler might be a good idea.
>
> - all the remaining drivers are ttm based, where I hope they do
>   appropriately obey implicit fences already. I didn't do the full
>   audit there because a) not follow the contract would confuse ttm
>   quite well and b) reading non-standard scheduler and submit code
>   which isn't based on drm/scheduler is a pain.
>
> Onwards to the display side.
>
> - Any driver using the drm_gem_plane_helper_prepare_fb() helper will
>   correctly. Overwhelmingly most drivers get this right, except a few
>   totally dont. I'll follow up with a patch to make this the default
>   and avoid a bunch of bugs.
>
> - I didn't audit the ttm drivers, but given that dma_resv started
>   there I hope they get this right.
>
> In conclusion this IS the contract, both as documented and
> overwhelmingly implemented, specically as implemented by all render
> drivers except amdgpu.
>
> Amdgpu tried to fix this already in
>
> commit 049aca4363d8af87cab8d53de5401602db3b9999
> Author: Christian K=C3=B6nig <christian.koenig@amd.com>
> Date:   Wed Sep 19 16:54:35 2018 +0200
>
>     drm/amdgpu: fix using shared fence for exported BOs v2
>
> but this fix falls short on a number of areas:
>
> - It's racy, by the time the buffer is shared it might be too late. To
>   make sure there's definitely never a problem we need to set the
>   fences correctly for any buffer that's potentially exportable.
>
> - It's breaking uapi, dma-buf fds support poll() and differentitiate
>   between, which was introduced in
>
>         commit 9b495a5887994a6d74d5c261d012083a92b94738
>         Author: Maarten Lankhorst <maarten.lankhorst@canonical.com>
>         Date:   Tue Jul 1 12:57:43 2014 +0200
>
>             dma-buf: add poll support, v3
>
> - Christian K=C3=B6nig wants to nack new uapi building further on this
>   dma_resv contract because it breaks amdgpu, quoting
>
>   "Yeah, and that is exactly the reason why I will NAK this uAPI change.
>
>   "This doesn't works for amdgpu at all for the reasons outlined above."
>
>   https://lore.kernel.org/dri-devel/f2eb6751-2f82-9b23-f57e-548de5b729de@=
gmail.com/
>
>   Rejecting new development because your own driver is broken and
>   violates established cross driver contracts and uapi is really not
>   how upstream works.
>
> Now this patch will have a severe performance impact on anything that
> runs on multiple engines. So we can't just merge it outright, but need
> a bit a plan:
>
> - amdgpu needs a proper uapi for handling implicit fencing. The funny
>   thing is that to do it correctly, implicit fencing must be treated
>   as a very strange IPC mechanism for transporting fences, where both
>   setting the fence and dependency intercepts must be handled
>   explicitly. Current best practices is a per-bo flag to indicate
>   writes, and a per-bo flag to to skip implicit fencing in the CS
>   ioctl as a new chunk.
>
> - Since amdgpu has been shipping with broken behaviour we need an
>   opt-out flag from the butchered implicit fencing model to enable the
>   proper explicit implicit fencing model.
>
> - for kernel memory fences due to bo moves at least the i915 idea is
>   to use ttm_bo->moving. amdgpu probably needs the same.
>
> - since the current p2p dma-buf interface assumes the kernel memory
>   fence is in the exclusive dma_resv fence slot we need to add a new
>   fence slot for kernel fences, which must never be ignored. Since
>   currently only amdgpu supports this there's no real problem here
>   yet, until amdgpu gains a NO_IMPLICIT CS flag.
>
> - New userspace needs to ship in enough desktop distros so that users
>   wont notice the perf impact. I think we can ignore LTS distros who
>   upgrade their kernels but not their mesa3d snapshot.
>
> - Then when this is all in place we can merge this patch here.
>
> What is not a solution to this problem here is trying to make the
> dma_resv rules in the kernel more clever. The fundamental issue here
> is that the amdgpu CS uapi is the least expressive one across all
> drivers (only equalled by panfrost, which has an actual excuse) by not
> allowing any userspace control over how implicit sync is conducted.
>
> Until this is fixed it's completely pointless to make the kernel more
> clever to improve amdgpu, because all we're doing is papering over
> this uapi design issue. amdgpu needs to attain the status quo
> established by other drivers first, once that's achieved we can tackle
> the remaining issues in a consistent way across drivers.
>
> Cc: mesa-dev@lists.freedesktop.org
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Rob Clark <robdclark@chromium.org>
> Cc: Kristian H. Kristensen <hoegsberg@google.com>
> Cc: Michel D=C3=A4nzer <michel@daenzer.net>
> Cc: Daniel Stone <daniels@collabora.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Deepak R Varma <mh12gx2825@gmail.com>
> Cc: Chen Li <chenli@uniontech.com>
> Cc: Kevin Wang <kevin1.wang@amd.com>
> Cc: Dennis Li <Dennis.Li@amd.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: linaro-mm-sig@lists.linaro.org
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_cs.c
> index 88a24a0b5691..cc8426e1e8a8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -617,8 +617,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_pars=
er *p,
>         amdgpu_bo_list_for_each_entry(e, p->bo_list) {
>                 struct amdgpu_bo *bo =3D ttm_to_amdgpu_bo(e->tv.bo);
>
> -               /* Make sure we use the exclusive slot for shared BOs */
> -               if (bo->prime_shared_count)
> +               /* Make sure we use the exclusive slot for all potentiall=
y shared BOs */
> +               if (!(bo->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID))
>                         e->tv.num_shared =3D 0;

I think it also makes sense to skip this with
AMDGPU_GEM_CREATE_EXPLICIT_SYNC? It can be shared but I don't think
anyone expects implicit sync to happen with those.
>                 e->bo_va =3D amdgpu_vm_bo_find(vm, bo);
>         }
> --
> 2.31.0
>
