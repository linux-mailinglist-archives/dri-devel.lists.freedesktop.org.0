Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E8172E3BB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 15:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A61C10E22E;
	Tue, 13 Jun 2023 13:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D85710E238
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 13:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686661553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g9il1UHpCWpV6HTMPW69z8er1iESFooHcG8w8VfB9JI=;
 b=Cuxnmgg/toCrVFfz3oRXlwDENjY3OYjsZfxE3NTdSfpTUUzOFxR7TeTuiP1TC1fBjnVQ5B
 mqYTWbT+5J/lAHHpSA0Z988znflFyIw6R1okesSU9jeZEwNOkfo8KS/EzFwAUoOPJFF35k
 GlhqjWsSpXnFt5yfANBGM8RLgXXnz78=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-55CBjc59N9yYeRR_8hzYZQ-1; Tue, 13 Jun 2023 09:05:52 -0400
X-MC-Unique: 55CBjc59N9yYeRR_8hzYZQ-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2b32a11b31bso3061351fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 06:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686661550; x=1689253550;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g9il1UHpCWpV6HTMPW69z8er1iESFooHcG8w8VfB9JI=;
 b=UE0gJYVAOHi3UPowZNpLD150PvXLtcKUi1VdCXbWMOcKzqiZx0VVlrusy0SZUPy6h8
 4vP5+PpNQ9FZ46yh+KdXNJqKDxjRfPqicWtwzztDdfSqm0/cgcLSHvQecx18xcDERa1M
 K5z+xvo4x1UCn5dLhqrnhRVAttnPvaEKy6q7RIV0KFtT51zJ5GzmkOfHrNy+YIiiS/e3
 kwr0SCbKUJAIr6ahySHKXWZkjotPC3pNfPFL6BZEU1tN8FMOw7qFio/A+3wPEHE9VO5Z
 IocqrFewDnXewOUSq9XHAz4xFGxgjLv1zaZL6wth/TyT8JfoxehYBYMDv2ovZQsZH1kf
 jn9g==
X-Gm-Message-State: AC+VfDwNRWhz0Qdv9xfgU6jIuR1rQfuBA1YLGKgJMj3WTcrk85Z9jck4
 QZO/om9nT8t+EEOyme6WvfIMz/Tyloe7VPvax/5LBPeBxhKbwS/uj4ovpG60C7FBHgCTOrFsPh7
 MhYM03Z+IqWo43w2z6Q5dFdjuP+D+YUn/RL++8g6kL/02
X-Received: by 2002:a2e:b90a:0:b0:2b1:d72b:162a with SMTP id
 b10-20020a2eb90a000000b002b1d72b162amr6304512ljb.3.1686661549945; 
 Tue, 13 Jun 2023 06:05:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7emfO0PHDKaUibCuTFeI6uXKAjQqI/BgqVMG2+kXj+AIpzzi1sgtU7YPSUpPcBeLGKYO9jKMqFA2Uddq0TaA4=
X-Received: by 2002:a2e:b90a:0:b0:2b1:d72b:162a with SMTP id
 b10-20020a2eb90a000000b002b1d72b162amr6304494ljb.3.1686661549352; Tue, 13 Jun
 2023 06:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <20221125102137.1801-1-christian.koenig@amd.com>
 <20221125102137.1801-3-christian.koenig@amd.com>
 <8ff841e3-8eef-9ec2-2ba5-4907f18873c0@amd.com>
 <a7c5f157-ff42-4e87-cc79-33ba6a15a138@amd.com>
In-Reply-To: <a7c5f157-ff42-4e87-cc79-33ba6a15a138@amd.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 13 Jun 2023 15:05:38 +0200
Message-ID: <CACO55tuNk16S2LgtuiSt9fwNHDXEdT3J+Rr_tuuGbrDXu-w45Q@mail.gmail.com>
Subject: Re: [PATCH 3/9] drm/ttm: use per BO cleanup workers
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Felix Kuehling <felix.kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 5, 2022 at 2:40=E2=80=AFPM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> Am 29.11.22 um 22:14 schrieb Felix Kuehling:
> > On 2022-11-25 05:21, Christian K=C3=B6nig wrote:
> >> Instead of a single worker going over the list of delete BOs in regula=
r
> >> intervals use a per BO worker which blocks for the resv object and
> >> locking of the BO.
> >>
> >> This not only simplifies the handling massively, but also results in
> >> much better response time when cleaning up buffers.
> >>
> >> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >
> > Just thinking out loud: If I understand it correctly, this can cause a
> > lot of sleeping worker threads when
> > AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE is used and many BOs are freed
> > at the same time. This happens e.g. when a KFD process terminates or
> > crashes. I guess with a concurrency-managed workqueue this isn't going
> > to be excessive. And since it's on a per device workqueue, it doesn't
> > stall work items on the system work queue or from other devices.
>
> Yes, exactly that. The last parameter to alloc_workqueue() limits how
> many work items can be sleeping.
>
> > I'm trying to understand why you set WQ_MEM_RECLAIM. This work queue
> > is not about freeing ttm_resources but about freeing the BOs. But it
> > affects freeing of ghost_objs that are holding the ttm_resources being
> > freed.
>
> Well if the BO is idle, but not immediately lockable we delegate freeing
> the backing pages in the TT object to those workers as well. It might
> even be a good idea to use a separate wq for this case.
>
> >
> > If those assumptions all make sense, patches 1-3 are
> >
> > Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
>
> Thanks,
> Christian.
>

This patch causes a heap use-after-free when using nouveau with the
potential of trashing filesystems, is there a way to revert it until
we figure out a proper solution to the problem?

Bug: https://gitlab.freedesktop.org/drm/nouveau/-/issues/213

example trace on affected systems:

[ 4102.946946] general protection fault, probably for non-canonical
address 0x5f775ce3bd949b45: 0000 [#3] PREEMPT SMP NOPTI
[ 4102.957794] CPU: 12 PID: 89561 Comm: glcts Tainted: G      D
    6.3.5-200.fc38.x86_64 #1
[ 4102.966556] Hardware name: ASUS System Product Name/PRIME B660-PLUS
D4, BIOS 0418 10/13/2021
[ 4102.974972] RIP: 0010:__kmem_cache_alloc_node+0x1ba/0x320
[ 4102.980362] Code: 2b 14 25 28 00 00 00 0f 85 74 01 00 00 48 83 c4
18 5b 5d 41 5c 41 5d 41 5e 41 5f c3 cc cc cc cc 41 8b 47 28 4d 8b 07
48 01 f8 <48> 8b 18 48 89 c1 49 33 9f b8 00 00 00 48 0f c9 48 31 cb 41
f6 c0
[ 4102.999073] RSP: 0018:ffff9764e0057b40 EFLAGS: 00010202
[ 4103.004291] RAX: 5f775ce3bd949b45 RBX: 0000000000000dc0 RCX: 00000000000=
00046
[ 4103.011408] RDX: 00000002cf87600c RSI: 0000000000000dc0 RDI: 5f775ce3bd9=
49b15
[ 4103.018528] RBP: 0000000000000dc0 R08: 00000000000390c0 R09: 00000000303=
02d6d
[ 4103.025649] R10: 00000000756c7473 R11: 0000000020090298 R12: 00000000000=
00000
[ 4103.032767] R13: 00000000ffffffff R14: 0000000000000046 R15: ffff8bda800=
42600
[ 4103.039887] FS:  00007f386a85ef00(0000) GS:ffff8be1df700000(0000)
knlGS:0000000000000000
[ 4103.047958] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 4103.053692] CR2: 000000000493b868 CR3: 000000014c3ba000 CR4: 0000000000f=
50ee0
[ 4103.060812] PKRU: 55555554
[ 4103.063520] Call Trace:
[ 4103.065970]  <TASK>
[ 4103.068071]  ? die_addr+0x36/0x90
[ 4103.071384]  ? exc_general_protection+0x1be/0x420
[ 4103.076081]  ? asm_exc_general_protection+0x26/0x30
[ 4103.080952]  ? __kmem_cache_alloc_node+0x1ba/0x320
[ 4103.085734]  ? ext4_htree_store_dirent+0x42/0x180
[ 4103.090431]  ? ext4_htree_store_dirent+0x42/0x180
[ 4103.095132]  __kmalloc+0x4d/0x150
[ 4103.098444]  ext4_htree_store_dirent+0x42/0x180
[ 4103.102970]  htree_dirblock_to_tree+0x1ed/0x370
[ 4103.107494]  ext4_htree_fill_tree+0x109/0x3d0
[ 4103.111846]  ext4_readdir+0x6d4/0xa80
[ 4103.115505]  iterate_dir+0x178/0x1c0
[ 4103.119076]  __x64_sys_getdents64+0x88/0x130
[ 4103.123341]  ? __pfx_filldir64+0x10/0x10
[ 4103.127260]  do_syscall_64+0x5d/0x90
[ 4103.130835]  ? handle_mm_fault+0x11e/0x310
[ 4103.134927]  ? do_user_addr_fault+0x1e0/0x720
[ 4103.139278]  ? exc_page_fault+0x7c/0x180
[ 4103.143195]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
[ 4103.148240] RIP: 0033:0x7f386a418047
[ 4103.151828] Code: 24 fb ff 4c 89 e0 5b 41 5c 5d c3 0f 1f 84 00 00
00 00 00 f3 0f 1e fa b8 ff ff ff 7f 48 39 c2 48 0f 47 d0 b8 d9 00 00
00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 8b 15 91 cd 0f 00 f7 d8 64 89
02 48
[ 4103.170543] RSP: 002b:00007ffd4793ff38 EFLAGS: 00000293 ORIG_RAX:
00000000000000d9
[ 4103.178095] RAX: ffffffffffffffda RBX: 0000000004933830 RCX: 00007f386a4=
18047
[ 4103.185214] RDX: 0000000000008000 RSI: 0000000004933860 RDI: 00000000000=
00006
[ 4103.192335] RBP: 00007ffd4793ff70 R08: 0000000000000000 R09: 00000000000=
00001
[ 4103.199454] R10: 0000000000000004 R11: 0000000000000293 R12: 00000000049=
33834
[ 4103.206573] R13: 0000000004933860 R14: ffffffffffffff60 R15: 00000000000=
00000
[ 4103.213695]  </TASK>
[ 4103.215883] Modules linked in: snd_seq_dummy snd_hrtimer
nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet
nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4
nf_reject_ipv6 nft_reject nft_ct nft_chain_nat ip6table_nat
ip6table_mangle ip6table_raw ip6table
[ 4103.215911]  kvm_intel snd_hwdep snd_seq eeepc_wmi kvm
snd_seq_device asus_wmi iTCO_wdt mei_pxp mei_hdcp ledtrig_audio
irqbypass snd_pcm ee1004 intel_pmc_bxt sparse_keymap rapl snd_timer
pmt_telemetry mei_me iTCO_vendor_support platform_profile joydev
intel_cstate pmt_class snde
[ 4103.366194] ---[ end trace 0000000000000000 ]---

> >
> >
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   2 +-
> >>   drivers/gpu/drm/i915/i915_gem.c            |   2 +-
> >>   drivers/gpu/drm/i915/intel_region_ttm.c    |   2 +-
> >>   drivers/gpu/drm/ttm/ttm_bo.c               | 112 ++++++++-----------=
--
> >>   drivers/gpu/drm/ttm/ttm_bo_util.c          |   1 -
> >>   drivers/gpu/drm/ttm/ttm_device.c           |  24 ++---
> >>   include/drm/ttm/ttm_bo_api.h               |  18 +---
> >>   include/drm/ttm/ttm_device.h               |   7 +-
> >>   8 files changed, 57 insertions(+), 111 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >> index 2b1db37e25c1..74ccbd566777 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >> @@ -3984,7 +3984,7 @@ void amdgpu_device_fini_hw(struct amdgpu_device
> >> *adev)
> >>       amdgpu_fence_driver_hw_fini(adev);
> >>         if (adev->mman.initialized)
> >> -        flush_delayed_work(&adev->mman.bdev.wq);
> >> +        drain_workqueue(adev->mman.bdev.wq);
> >>         if (adev->pm_sysfs_en)
> >>           amdgpu_pm_sysfs_fini(adev);
> >> diff --git a/drivers/gpu/drm/i915/i915_gem.c
> >> b/drivers/gpu/drm/i915/i915_gem.c
> >> index 8468ca9885fd..c38306f156d6 100644
> >> --- a/drivers/gpu/drm/i915/i915_gem.c
> >> +++ b/drivers/gpu/drm/i915/i915_gem.c
> >> @@ -1099,7 +1099,7 @@ void i915_gem_drain_freed_objects(struct
> >> drm_i915_private *i915)
> >>   {
> >>       while (atomic_read(&i915->mm.free_count)) {
> >>           flush_work(&i915->mm.free_work);
> >> -        flush_delayed_work(&i915->bdev.wq);
> >> +        drain_workqueue(i915->bdev.wq);
> >>           rcu_barrier();
> >>       }
> >>   }
> >> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c
> >> b/drivers/gpu/drm/i915/intel_region_ttm.c
> >> index cf89d0c2a2d9..657bbc16a48a 100644
> >> --- a/drivers/gpu/drm/i915/intel_region_ttm.c
> >> +++ b/drivers/gpu/drm/i915/intel_region_ttm.c
> >> @@ -132,7 +132,7 @@ int intel_region_ttm_fini(struct
> >> intel_memory_region *mem)
> >>               break;
> >>             msleep(20);
> >> -        flush_delayed_work(&mem->i915->bdev.wq);
> >> +        drain_workqueue(mem->i915->bdev.wq);
> >>       }
> >>         /* If we leaked objects, Don't free the region causing use
> >> after free */
> >> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo=
.c
> >> index b77262a623e0..4749b65bedc4 100644
> >> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> >> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> >> @@ -280,14 +280,13 @@ static int ttm_bo_cleanup_refs(struct
> >> ttm_buffer_object *bo,
> >>           ret =3D 0;
> >>       }
> >>   -    if (ret || unlikely(list_empty(&bo->ddestroy))) {
> >> +    if (ret) {
> >>           if (unlock_resv)
> >>               dma_resv_unlock(bo->base.resv);
> >>           spin_unlock(&bo->bdev->lru_lock);
> >>           return ret;
> >>       }
> >>   -    list_del_init(&bo->ddestroy);
> >>       spin_unlock(&bo->bdev->lru_lock);
> >>       ttm_bo_cleanup_memtype_use(bo);
> >>   @@ -300,47 +299,21 @@ static int ttm_bo_cleanup_refs(struct
> >> ttm_buffer_object *bo,
> >>   }
> >>     /*
> >> - * Traverse the delayed list, and call ttm_bo_cleanup_refs on all
> >> - * encountered buffers.
> >> + * Block for the dma_resv object to become idle, lock the buffer and
> >> clean up
> >> + * the resource and tt object.
> >>    */
> >> -bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all)
> >> +static void ttm_bo_delayed_delete(struct work_struct *work)
> >>   {
> >> -    struct list_head removed;
> >> -    bool empty;
> >> -
> >> -    INIT_LIST_HEAD(&removed);
> >> -
> >> -    spin_lock(&bdev->lru_lock);
> >> -    while (!list_empty(&bdev->ddestroy)) {
> >> -        struct ttm_buffer_object *bo;
> >> -
> >> -        bo =3D list_first_entry(&bdev->ddestroy, struct
> >> ttm_buffer_object,
> >> -                      ddestroy);
> >> -        list_move_tail(&bo->ddestroy, &removed);
> >> -        if (!ttm_bo_get_unless_zero(bo))
> >> -            continue;
> >> -
> >> -        if (remove_all || bo->base.resv !=3D &bo->base._resv) {
> >> -            spin_unlock(&bdev->lru_lock);
> >> -            dma_resv_lock(bo->base.resv, NULL);
> >> -
> >> -            spin_lock(&bdev->lru_lock);
> >> -            ttm_bo_cleanup_refs(bo, false, !remove_all, true);
> >> -
> >> -        } else if (dma_resv_trylock(bo->base.resv)) {
> >> -            ttm_bo_cleanup_refs(bo, false, !remove_all, true);
> >> -        } else {
> >> -            spin_unlock(&bdev->lru_lock);
> >> -        }
> >> +    struct ttm_buffer_object *bo;
> >>   -        ttm_bo_put(bo);
> >> -        spin_lock(&bdev->lru_lock);
> >> -    }
> >> -    list_splice_tail(&removed, &bdev->ddestroy);
> >> -    empty =3D list_empty(&bdev->ddestroy);
> >> -    spin_unlock(&bdev->lru_lock);
> >> +    bo =3D container_of(work, typeof(*bo), delayed_delete);
> >>   -    return empty;
> >> +    dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP,
> >> false,
> >> +                  MAX_SCHEDULE_TIMEOUT);
> >> +    dma_resv_lock(bo->base.resv, NULL);
> >> +    ttm_bo_cleanup_memtype_use(bo);
> >> +    dma_resv_unlock(bo->base.resv);
> >> +    ttm_bo_put(bo);
> >>   }
> >>     static void ttm_bo_release(struct kref *kref)
> >> @@ -369,44 +342,40 @@ static void ttm_bo_release(struct kref *kref)
> >>             drm_vma_offset_remove(bdev->vma_manager,
> >> &bo->base.vma_node);
> >>           ttm_mem_io_free(bdev, bo->resource);
> >> -    }
> >> -
> >> -    if (!dma_resv_test_signaled(bo->base.resv,
> >> DMA_RESV_USAGE_BOOKKEEP) ||
> >> -        !dma_resv_trylock(bo->base.resv)) {
> >> -        /* The BO is not idle, resurrect it for delayed destroy */
> >> -        ttm_bo_flush_all_fences(bo);
> >> -        bo->deleted =3D true;
> >>   -        spin_lock(&bo->bdev->lru_lock);
> >> +        if (!dma_resv_test_signaled(bo->base.resv,
> >> +                        DMA_RESV_USAGE_BOOKKEEP) ||
> >> +            !dma_resv_trylock(bo->base.resv)) {
> >> +            /* The BO is not idle, resurrect it for delayed destroy *=
/
> >> +            ttm_bo_flush_all_fences(bo);
> >> +            bo->deleted =3D true;
> >>   -        /*
> >> -         * Make pinned bos immediately available to
> >> -         * shrinkers, now that they are queued for
> >> -         * destruction.
> >> -         *
> >> -         * FIXME: QXL is triggering this. Can be removed when the
> >> -         * driver is fixed.
> >> -         */
> >> -        if (bo->pin_count) {
> >> -            bo->pin_count =3D 0;
> >> -            ttm_resource_move_to_lru_tail(bo->resource);
> >> -        }
> >> +            spin_lock(&bo->bdev->lru_lock);
> >>   -        kref_init(&bo->kref);
> >> -        list_add_tail(&bo->ddestroy, &bdev->ddestroy);
> >> -        spin_unlock(&bo->bdev->lru_lock);
> >> +            /*
> >> +             * Make pinned bos immediately available to
> >> +             * shrinkers, now that they are queued for
> >> +             * destruction.
> >> +             *
> >> +             * FIXME: QXL is triggering this. Can be removed when the
> >> +             * driver is fixed.
> >> +             */
> >> +            if (bo->pin_count) {
> >> +                bo->pin_count =3D 0;
> >> +                ttm_resource_move_to_lru_tail(bo->resource);
> >> +            }
> >>   -        schedule_delayed_work(&bdev->wq,
> >> -                      ((HZ / 100) < 1) ? 1 : HZ / 100);
> >> -        return;
> >> -    }
> >> +            kref_init(&bo->kref);
> >> +            spin_unlock(&bo->bdev->lru_lock);
> >>   -    spin_lock(&bo->bdev->lru_lock);
> >> -    list_del(&bo->ddestroy);
> >> -    spin_unlock(&bo->bdev->lru_lock);
> >> +            INIT_WORK(&bo->delayed_delete, ttm_bo_delayed_delete);
> >> +            queue_work(bdev->wq, &bo->delayed_delete);
> >> +            return;
> >> +        }
> >>   -    ttm_bo_cleanup_memtype_use(bo);
> >> -    dma_resv_unlock(bo->base.resv);
> >> +        ttm_bo_cleanup_memtype_use(bo);
> >> +        dma_resv_unlock(bo->base.resv);
> >> +    }
> >>         atomic_dec(&ttm_glob.bo_count);
> >>       bo->destroy(bo);
> >> @@ -946,7 +915,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
> >> struct ttm_buffer_object *bo,
> >>       int ret;
> >>         kref_init(&bo->kref);
> >> -    INIT_LIST_HEAD(&bo->ddestroy);
> >>       bo->bdev =3D bdev;
> >>       bo->type =3D type;
> >>       bo->page_alignment =3D alignment;
> >> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
> >> b/drivers/gpu/drm/ttm/ttm_bo_util.c
> >> index ba3aa0a0fc43..ae4b7922ee1a 100644
> >> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> >> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> >> @@ -230,7 +230,6 @@ static int ttm_buffer_object_transfer(struct
> >> ttm_buffer_object *bo,
> >>        */
> >>         atomic_inc(&ttm_glob.bo_count);
> >> -    INIT_LIST_HEAD(&fbo->base.ddestroy);
> >>       drm_vma_node_reset(&fbo->base.base.vma_node);
> >>         kref_init(&fbo->base.kref);
> >> diff --git a/drivers/gpu/drm/ttm/ttm_device.c
> >> b/drivers/gpu/drm/ttm/ttm_device.c
> >> index e7147e304637..e9bedca4dfdc 100644
> >> --- a/drivers/gpu/drm/ttm/ttm_device.c
> >> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> >> @@ -175,16 +175,6 @@ int ttm_device_swapout(struct ttm_device *bdev,
> >> struct ttm_operation_ctx *ctx,
> >>   }
> >>   EXPORT_SYMBOL(ttm_device_swapout);
> >>   -static void ttm_device_delayed_workqueue(struct work_struct *work)
> >> -{
> >> -    struct ttm_device *bdev =3D
> >> -        container_of(work, struct ttm_device, wq.work);
> >> -
> >> -    if (!ttm_bo_delayed_delete(bdev, false))
> >> -        schedule_delayed_work(&bdev->wq,
> >> -                      ((HZ / 100) < 1) ? 1 : HZ / 100);
> >> -}
> >> -
> >>   /**
> >>    * ttm_device_init
> >>    *
> >> @@ -215,15 +205,19 @@ int ttm_device_init(struct ttm_device *bdev,
> >> struct ttm_device_funcs *funcs,
> >>       if (ret)
> >>           return ret;
> >>   +    bdev->wq =3D alloc_workqueue("ttm", WQ_MEM_RECLAIM | WQ_HIGHPRI=
,
> >> 16);
> >> +    if (!bdev->wq) {
> >> +        ttm_global_release();
> >> +        return -ENOMEM;
> >> +    }
> >> +
> >>       bdev->funcs =3D funcs;
> >>         ttm_sys_man_init(bdev);
> >>       ttm_pool_init(&bdev->pool, dev, use_dma_alloc, use_dma32);
> >>         bdev->vma_manager =3D vma_manager;
> >> -    INIT_DELAYED_WORK(&bdev->wq, ttm_device_delayed_workqueue);
> >>       spin_lock_init(&bdev->lru_lock);
> >> -    INIT_LIST_HEAD(&bdev->ddestroy);
> >>       INIT_LIST_HEAD(&bdev->pinned);
> >>       bdev->dev_mapping =3D mapping;
> >>       mutex_lock(&ttm_global_mutex);
> >> @@ -247,10 +241,8 @@ void ttm_device_fini(struct ttm_device *bdev)
> >>       list_del(&bdev->device_list);
> >>       mutex_unlock(&ttm_global_mutex);
> >>   -    cancel_delayed_work_sync(&bdev->wq);
> >> -
> >> -    if (ttm_bo_delayed_delete(bdev, true))
> >> -        pr_debug("Delayed destroy list was clean\n");
> >> +    drain_workqueue(bdev->wq);
> >> +    destroy_workqueue(bdev->wq);
> >>         spin_lock(&bdev->lru_lock);
> >>       for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i)
> >> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api=
.h
> >> index 7758347c461c..69e62bbb01e3 100644
> >> --- a/include/drm/ttm/ttm_bo_api.h
> >> +++ b/include/drm/ttm/ttm_bo_api.h
> >> @@ -92,7 +92,6 @@ struct ttm_tt;
> >>    * @ttm: TTM structure holding system pages.
> >>    * @evicted: Whether the object was evicted without user-space
> >> knowing.
> >>    * @deleted: True if the object is only a zombie and already deleted=
.
> >> - * @ddestroy: List head for the delayed destroy list.
> >>    * @swap: List head for swap LRU list.
> >>    * @offset: The current GPU offset, which can have different meaning=
s
> >>    * depending on the memory type. For SYSTEM type memory, it should
> >> be 0.
> >> @@ -135,19 +134,14 @@ struct ttm_buffer_object {
> >>       struct ttm_tt *ttm;
> >>       bool deleted;
> >>       struct ttm_lru_bulk_move *bulk_move;
> >> +    unsigned priority;
> >> +    unsigned pin_count;
> >>         /**
> >> -     * Members protected by the bdev::lru_lock.
> >> -     */
> >> -
> >> -    struct list_head ddestroy;
> >> -
> >> -    /**
> >> -     * Members protected by a bo reservation.
> >> +     * @delayed_delete: Work item used when we can't delete the BO
> >> +     * immediately
> >>        */
> >> -
> >> -    unsigned priority;
> >> -    unsigned pin_count;
> >> +    struct work_struct delayed_delete;
> >>         /**
> >>        * Special members that are protected by the reserve lock
> >> @@ -448,8 +442,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma);
> >>     int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long add=
r,
> >>                void *buf, int len, int write);
> >> -bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);
> >> -
> >>   vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot)=
;
> >>     #endif
> >> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device=
.h
> >> index 95b3c04b1ab9..4f3e81eac6f3 100644
> >> --- a/include/drm/ttm/ttm_device.h
> >> +++ b/include/drm/ttm/ttm_device.h
> >> @@ -251,11 +251,6 @@ struct ttm_device {
> >>        */
> >>       spinlock_t lru_lock;
> >>   -    /**
> >> -     * @ddestroy: Destroyed but not yet cleaned up buffer objects.
> >> -     */
> >> -    struct list_head ddestroy;
> >> -
> >>       /**
> >>        * @pinned: Buffer objects which are pinned and so not on any
> >> LRU list.
> >>        */
> >> @@ -270,7 +265,7 @@ struct ttm_device {
> >>       /**
> >>        * @wq: Work queue structure for the delayed delete workqueue.
> >>        */
> >> -    struct delayed_work wq;
> >> +    struct workqueue_struct *wq;
> >>   };
> >>     int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t
> >> gfp_flags);
>

