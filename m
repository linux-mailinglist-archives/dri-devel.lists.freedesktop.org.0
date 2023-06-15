Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE8C731817
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 14:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA3E10E4E0;
	Thu, 15 Jun 2023 12:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43BBB10E4DD
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 12:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686830657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YwIfyNf00FOW0x5vEJdsiq6ILVcL+0Ebta7YS8RnVmI=;
 b=M4DnSO6Zj1X8oAtU8S3FahNKGiDGmQ4dwLhXfYwFAdjqFyc1BIlFSS7/7xybp7Zr5lBF+n
 eqVT/Gs1qLsOnE9tJ1BEtT+TxkJaJkxu1NJDt3uX3xDWyPjQL8NZZGpxV/LCN6KRsyCTMQ
 zLUa5cJURtNv7DCEzPkCf18/WQ8zmfM=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-T8bSD4AzOfW7PT9kbmSfJQ-1; Thu, 15 Jun 2023 08:04:15 -0400
X-MC-Unique: T8bSD4AzOfW7PT9kbmSfJQ-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2b330fbc513so5874651fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 05:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686830653; x=1689422653;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YwIfyNf00FOW0x5vEJdsiq6ILVcL+0Ebta7YS8RnVmI=;
 b=Zit1+6ErD4dbogiBXUacM2BesT5OHTY9KRLXwySKNKIRLJthpu4o3sCeH+vJUqWO1M
 qIM+CGlXxiiRiEO5lZr4jgPeLbUudaECA4PrZhPt/tiIvH57wuQO186+Vwjuv9Fi7D3b
 k9dREaM8gw3dtTI7Jd1HbTlWUhfOaGsS+76+1CG9/edjUmokAyyjQ+D3VyL3o9scPpbc
 DRWD2ECcQQLK7oWdc35NWG/Lav7ZLzSBtmIS0wr2wqqfbINUG4bOa307/AU3OIFxb1ns
 aXg34QWoKBfIw50MGQHrebUpdeAYskTy6tMRNTIIZhSYFVYDDcC37hDysejekjCw9KPp
 SdUQ==
X-Gm-Message-State: AC+VfDwJKnuvsRCSUKhG+wUUfjy79Jb/yV4ieGMYHTg3QqnfXssymhfm
 nsONnhAcV7kHhWCr4pWUCXQFzfL8y93o7ke/v1w4PtRF5VYFZftMoE73DArzoLcRLoP5KZIIKYr
 Tc6bUsBeooV9yB0XITPi7VIyw8/qCoBR4fx0AxRq3AbPe
X-Received: by 2002:a2e:8e27:0:b0:2b3:4c3e:a61d with SMTP id
 r7-20020a2e8e27000000b002b34c3ea61dmr2359400ljk.2.1686830652848; 
 Thu, 15 Jun 2023 05:04:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ75UE0zWpu4kTN9cup9vpP4xAX76Aln4hMiO6v39pbq7AyR0UrCNUKH/JPh+4AaJvj3R6v5O1V9rZtR7NZ442Q=
X-Received: by 2002:a2e:8e27:0:b0:2b3:4c3e:a61d with SMTP id
 r7-20020a2e8e27000000b002b34c3ea61dmr2359376ljk.2.1686830652259; Thu, 15 Jun
 2023 05:04:12 -0700 (PDT)
MIME-Version: 1.0
References: <20221125102137.1801-1-christian.koenig@amd.com>
 <20221125102137.1801-3-christian.koenig@amd.com>
 <8ff841e3-8eef-9ec2-2ba5-4907f18873c0@amd.com>
 <a7c5f157-ff42-4e87-cc79-33ba6a15a138@amd.com>
 <CACO55tuNk16S2LgtuiSt9fwNHDXEdT3J+Rr_tuuGbrDXu-w45Q@mail.gmail.com>
 <8cb02812-1bc5-c1ff-13b0-eeec87c26859@amd.com>
 <CACO55tszco=o2itBSvVh-c6OreJOFv_=aL+wm3YhAi+1eDGVQA@mail.gmail.com>
 <f6bb0bc5-1cd4-0e88-65c7-6d05420699eb@gmail.com>
In-Reply-To: <f6bb0bc5-1cd4-0e88-65c7-6d05420699eb@gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 15 Jun 2023 14:04:00 +0200
Message-ID: <CACO55tu8Q9QtAL1bNtb6eSxsCtAeE_eLvEPCSV0S+DcSWGhqRQ@mail.gmail.com>
Subject: Re: [PATCH 3/9] drm/ttm: use per BO cleanup workers
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Felix Kuehling <felix.kuehling@amd.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 15, 2023 at 1:19=E2=80=AFPM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 13.06.23 um 16:18 schrieb Karol Herbst:
> > On Tue, Jun 13, 2023 at 3:59=E2=80=AFPM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 13.06.23 um 15:05 schrieb Karol Herbst:
> >>> On Mon, Dec 5, 2022 at 2:40=E2=80=AFPM Christian K=C3=B6nig <christia=
n.koenig@amd.com> wrote:
> >>>> Am 29.11.22 um 22:14 schrieb Felix Kuehling:
> >>>>> On 2022-11-25 05:21, Christian K=C3=B6nig wrote:
> >>>>>> Instead of a single worker going over the list of delete BOs in re=
gular
> >>>>>> intervals use a per BO worker which blocks for the resv object and
> >>>>>> locking of the BO.
> >>>>>>
> >>>>>> This not only simplifies the handling massively, but also results =
in
> >>>>>> much better response time when cleaning up buffers.
> >>>>>>
> >>>>>> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>>>> Just thinking out loud: If I understand it correctly, this can caus=
e a
> >>>>> lot of sleeping worker threads when
> >>>>> AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE is used and many BOs are fre=
ed
> >>>>> at the same time. This happens e.g. when a KFD process terminates o=
r
> >>>>> crashes. I guess with a concurrency-managed workqueue this isn't go=
ing
> >>>>> to be excessive. And since it's on a per device workqueue, it doesn=
't
> >>>>> stall work items on the system work queue or from other devices.
> >>>> Yes, exactly that. The last parameter to alloc_workqueue() limits ho=
w
> >>>> many work items can be sleeping.
> >>>>
> >>>>> I'm trying to understand why you set WQ_MEM_RECLAIM. This work queu=
e
> >>>>> is not about freeing ttm_resources but about freeing the BOs. But i=
t
> >>>>> affects freeing of ghost_objs that are holding the ttm_resources be=
ing
> >>>>> freed.
> >>>> Well if the BO is idle, but not immediately lockable we delegate fre=
eing
> >>>> the backing pages in the TT object to those workers as well. It migh=
t
> >>>> even be a good idea to use a separate wq for this case.
> >>>>
> >>>>> If those assumptions all make sense, patches 1-3 are
> >>>>>
> >>>>> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
> >>>> Thanks,
> >>>> Christian.
> >>>>
> >>> This patch causes a heap use-after-free when using nouveau with the
> >>> potential of trashing filesystems, is there a way to revert it until
> >>> we figure out a proper solution to the problem?
> >> Uff I don't think so, we have quite some work based on top of this. Bu=
t
> >> let me double check.
> >>
> > yeah.. I already talked with Dave about fixing this issue as Dave has
> > more knowledge on this part of the driver (I hope), so we might have a
> > fix soonish, but the concerning part is, that it's already out to
> > users, so might be better to be able to revert it if the fix takes a
> > while to emerge.
>
> We at least can't revert easily. This was fixing issues where we have
> seen OOM situations because TTM wasn't releasing resources fast enough.
>
> >> On the other hand have you tried running this with KASAN to catch use
> >> after free errors?
> > yes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/213#note_19427=
77
> >
> >> Since we now block for work to finish and not check every few
> >> milliseconds to garbage collect memory will now be reclaimed much fast=
er
> >> after freeing it.
> > yeah, that kinda makes sense. This entire issue feels like a race
> > happening as I need to run the OpenGL CTS in parallel with 8+ threads
> > to trigger it reliably.
>
> Yeah, from the bug report that's a classic use after free because of a ra=
ce.
>
> Easiest would be to make sure everybody has a reference to the fence.
>

turns out nouveau was using `dma_fence_is_signaled_locked` without
taking the lock. Fixing that seems to improve the situation by a lot,
so I think we have a fix to resolve this problem.

> Regards,
> Christian.
>
> >
> >> Regards,
> >> Christian.
> >>
> >>> Bug: https://gitlab.freedesktop.org/drm/nouveau/-/issues/213
> >>>
> >>> example trace on affected systems:
> >>>
> >>> [ 4102.946946] general protection fault, probably for non-canonical
> >>> address 0x5f775ce3bd949b45: 0000 [#3] PREEMPT SMP NOPTI
> >>> [ 4102.957794] CPU: 12 PID: 89561 Comm: glcts Tainted: G      D
> >>>       6.3.5-200.fc38.x86_64 #1
> >>> [ 4102.966556] Hardware name: ASUS System Product Name/PRIME B660-PLU=
S
> >>> D4, BIOS 0418 10/13/2021
> >>> [ 4102.974972] RIP: 0010:__kmem_cache_alloc_node+0x1ba/0x320
> >>> [ 4102.980362] Code: 2b 14 25 28 00 00 00 0f 85 74 01 00 00 48 83 c4
> >>> 18 5b 5d 41 5c 41 5d 41 5e 41 5f c3 cc cc cc cc 41 8b 47 28 4d 8b 07
> >>> 48 01 f8 <48> 8b 18 48 89 c1 49 33 9f b8 00 00 00 48 0f c9 48 31 cb 4=
1
> >>> f6 c0
> >>> [ 4102.999073] RSP: 0018:ffff9764e0057b40 EFLAGS: 00010202
> >>> [ 4103.004291] RAX: 5f775ce3bd949b45 RBX: 0000000000000dc0 RCX: 00000=
00000000046
> >>> [ 4103.011408] RDX: 00000002cf87600c RSI: 0000000000000dc0 RDI: 5f775=
ce3bd949b15
> >>> [ 4103.018528] RBP: 0000000000000dc0 R08: 00000000000390c0 R09: 00000=
00030302d6d
> >>> [ 4103.025649] R10: 00000000756c7473 R11: 0000000020090298 R12: 00000=
00000000000
> >>> [ 4103.032767] R13: 00000000ffffffff R14: 0000000000000046 R15: ffff8=
bda80042600
> >>> [ 4103.039887] FS:  00007f386a85ef00(0000) GS:ffff8be1df700000(0000)
> >>> knlGS:0000000000000000
> >>> [ 4103.047958] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >>> [ 4103.053692] CR2: 000000000493b868 CR3: 000000014c3ba000 CR4: 00000=
00000f50ee0
> >>> [ 4103.060812] PKRU: 55555554
> >>> [ 4103.063520] Call Trace:
> >>> [ 4103.065970]  <TASK>
> >>> [ 4103.068071]  ? die_addr+0x36/0x90
> >>> [ 4103.071384]  ? exc_general_protection+0x1be/0x420
> >>> [ 4103.076081]  ? asm_exc_general_protection+0x26/0x30
> >>> [ 4103.080952]  ? __kmem_cache_alloc_node+0x1ba/0x320
> >>> [ 4103.085734]  ? ext4_htree_store_dirent+0x42/0x180
> >>> [ 4103.090431]  ? ext4_htree_store_dirent+0x42/0x180
> >>> [ 4103.095132]  __kmalloc+0x4d/0x150
> >>> [ 4103.098444]  ext4_htree_store_dirent+0x42/0x180
> >>> [ 4103.102970]  htree_dirblock_to_tree+0x1ed/0x370
> >>> [ 4103.107494]  ext4_htree_fill_tree+0x109/0x3d0
> >>> [ 4103.111846]  ext4_readdir+0x6d4/0xa80
> >>> [ 4103.115505]  iterate_dir+0x178/0x1c0
> >>> [ 4103.119076]  __x64_sys_getdents64+0x88/0x130
> >>> [ 4103.123341]  ? __pfx_filldir64+0x10/0x10
> >>> [ 4103.127260]  do_syscall_64+0x5d/0x90
> >>> [ 4103.130835]  ? handle_mm_fault+0x11e/0x310
> >>> [ 4103.134927]  ? do_user_addr_fault+0x1e0/0x720
> >>> [ 4103.139278]  ? exc_page_fault+0x7c/0x180
> >>> [ 4103.143195]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> >>> [ 4103.148240] RIP: 0033:0x7f386a418047
> >>> [ 4103.151828] Code: 24 fb ff 4c 89 e0 5b 41 5c 5d c3 0f 1f 84 00 00
> >>> 00 00 00 f3 0f 1e fa b8 ff ff ff 7f 48 39 c2 48 0f 47 d0 b8 d9 00 00
> >>> 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 8b 15 91 cd 0f 00 f7 d8 64 8=
9
> >>> 02 48
> >>> [ 4103.170543] RSP: 002b:00007ffd4793ff38 EFLAGS: 00000293 ORIG_RAX:
> >>> 00000000000000d9
> >>> [ 4103.178095] RAX: ffffffffffffffda RBX: 0000000004933830 RCX: 00007=
f386a418047
> >>> [ 4103.185214] RDX: 0000000000008000 RSI: 0000000004933860 RDI: 00000=
00000000006
> >>> [ 4103.192335] RBP: 00007ffd4793ff70 R08: 0000000000000000 R09: 00000=
00000000001
> >>> [ 4103.199454] R10: 0000000000000004 R11: 0000000000000293 R12: 00000=
00004933834
> >>> [ 4103.206573] R13: 0000000004933860 R14: ffffffffffffff60 R15: 00000=
00000000000
> >>> [ 4103.213695]  </TASK>
> >>> [ 4103.215883] Modules linked in: snd_seq_dummy snd_hrtimer
> >>> nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet
> >>> nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4
> >>> nf_reject_ipv6 nft_reject nft_ct nft_chain_nat ip6table_nat
> >>> ip6table_mangle ip6table_raw ip6table
> >>> [ 4103.215911]  kvm_intel snd_hwdep snd_seq eeepc_wmi kvm
> >>> snd_seq_device asus_wmi iTCO_wdt mei_pxp mei_hdcp ledtrig_audio
> >>> irqbypass snd_pcm ee1004 intel_pmc_bxt sparse_keymap rapl snd_timer
> >>> pmt_telemetry mei_me iTCO_vendor_support platform_profile joydev
> >>> intel_cstate pmt_class snde
> >>> [ 4103.366194] ---[ end trace 0000000000000000 ]---
> >>>
> >>>>>> ---
> >>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   2 +-
> >>>>>>     drivers/gpu/drm/i915/i915_gem.c            |   2 +-
> >>>>>>     drivers/gpu/drm/i915/intel_region_ttm.c    |   2 +-
> >>>>>>     drivers/gpu/drm/ttm/ttm_bo.c               | 112 ++++++++-----=
--------
> >>>>>>     drivers/gpu/drm/ttm/ttm_bo_util.c          |   1 -
> >>>>>>     drivers/gpu/drm/ttm/ttm_device.c           |  24 ++---
> >>>>>>     include/drm/ttm/ttm_bo_api.h               |  18 +---
> >>>>>>     include/drm/ttm/ttm_device.h               |   7 +-
> >>>>>>     8 files changed, 57 insertions(+), 111 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >>>>>> index 2b1db37e25c1..74ccbd566777 100644
> >>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >>>>>> @@ -3984,7 +3984,7 @@ void amdgpu_device_fini_hw(struct amdgpu_dev=
ice
> >>>>>> *adev)
> >>>>>>         amdgpu_fence_driver_hw_fini(adev);
> >>>>>>           if (adev->mman.initialized)
> >>>>>> -        flush_delayed_work(&adev->mman.bdev.wq);
> >>>>>> +        drain_workqueue(adev->mman.bdev.wq);
> >>>>>>           if (adev->pm_sysfs_en)
> >>>>>>             amdgpu_pm_sysfs_fini(adev);
> >>>>>> diff --git a/drivers/gpu/drm/i915/i915_gem.c
> >>>>>> b/drivers/gpu/drm/i915/i915_gem.c
> >>>>>> index 8468ca9885fd..c38306f156d6 100644
> >>>>>> --- a/drivers/gpu/drm/i915/i915_gem.c
> >>>>>> +++ b/drivers/gpu/drm/i915/i915_gem.c
> >>>>>> @@ -1099,7 +1099,7 @@ void i915_gem_drain_freed_objects(struct
> >>>>>> drm_i915_private *i915)
> >>>>>>     {
> >>>>>>         while (atomic_read(&i915->mm.free_count)) {
> >>>>>>             flush_work(&i915->mm.free_work);
> >>>>>> -        flush_delayed_work(&i915->bdev.wq);
> >>>>>> +        drain_workqueue(i915->bdev.wq);
> >>>>>>             rcu_barrier();
> >>>>>>         }
> >>>>>>     }
> >>>>>> diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c
> >>>>>> b/drivers/gpu/drm/i915/intel_region_ttm.c
> >>>>>> index cf89d0c2a2d9..657bbc16a48a 100644
> >>>>>> --- a/drivers/gpu/drm/i915/intel_region_ttm.c
> >>>>>> +++ b/drivers/gpu/drm/i915/intel_region_ttm.c
> >>>>>> @@ -132,7 +132,7 @@ int intel_region_ttm_fini(struct
> >>>>>> intel_memory_region *mem)
> >>>>>>                 break;
> >>>>>>               msleep(20);
> >>>>>> -        flush_delayed_work(&mem->i915->bdev.wq);
> >>>>>> +        drain_workqueue(mem->i915->bdev.wq);
> >>>>>>         }
> >>>>>>           /* If we leaked objects, Don't free the region causing u=
se
> >>>>>> after free */
> >>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/tt=
m_bo.c
> >>>>>> index b77262a623e0..4749b65bedc4 100644
> >>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> >>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> >>>>>> @@ -280,14 +280,13 @@ static int ttm_bo_cleanup_refs(struct
> >>>>>> ttm_buffer_object *bo,
> >>>>>>             ret =3D 0;
> >>>>>>         }
> >>>>>>     -    if (ret || unlikely(list_empty(&bo->ddestroy))) {
> >>>>>> +    if (ret) {
> >>>>>>             if (unlock_resv)
> >>>>>>                 dma_resv_unlock(bo->base.resv);
> >>>>>>             spin_unlock(&bo->bdev->lru_lock);
> >>>>>>             return ret;
> >>>>>>         }
> >>>>>>     -    list_del_init(&bo->ddestroy);
> >>>>>>         spin_unlock(&bo->bdev->lru_lock);
> >>>>>>         ttm_bo_cleanup_memtype_use(bo);
> >>>>>>     @@ -300,47 +299,21 @@ static int ttm_bo_cleanup_refs(struct
> >>>>>> ttm_buffer_object *bo,
> >>>>>>     }
> >>>>>>       /*
> >>>>>> - * Traverse the delayed list, and call ttm_bo_cleanup_refs on all
> >>>>>> - * encountered buffers.
> >>>>>> + * Block for the dma_resv object to become idle, lock the buffer =
and
> >>>>>> clean up
> >>>>>> + * the resource and tt object.
> >>>>>>      */
> >>>>>> -bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_a=
ll)
> >>>>>> +static void ttm_bo_delayed_delete(struct work_struct *work)
> >>>>>>     {
> >>>>>> -    struct list_head removed;
> >>>>>> -    bool empty;
> >>>>>> -
> >>>>>> -    INIT_LIST_HEAD(&removed);
> >>>>>> -
> >>>>>> -    spin_lock(&bdev->lru_lock);
> >>>>>> -    while (!list_empty(&bdev->ddestroy)) {
> >>>>>> -        struct ttm_buffer_object *bo;
> >>>>>> -
> >>>>>> -        bo =3D list_first_entry(&bdev->ddestroy, struct
> >>>>>> ttm_buffer_object,
> >>>>>> -                      ddestroy);
> >>>>>> -        list_move_tail(&bo->ddestroy, &removed);
> >>>>>> -        if (!ttm_bo_get_unless_zero(bo))
> >>>>>> -            continue;
> >>>>>> -
> >>>>>> -        if (remove_all || bo->base.resv !=3D &bo->base._resv) {
> >>>>>> -            spin_unlock(&bdev->lru_lock);
> >>>>>> -            dma_resv_lock(bo->base.resv, NULL);
> >>>>>> -
> >>>>>> -            spin_lock(&bdev->lru_lock);
> >>>>>> -            ttm_bo_cleanup_refs(bo, false, !remove_all, true);
> >>>>>> -
> >>>>>> -        } else if (dma_resv_trylock(bo->base.resv)) {
> >>>>>> -            ttm_bo_cleanup_refs(bo, false, !remove_all, true);
> >>>>>> -        } else {
> >>>>>> -            spin_unlock(&bdev->lru_lock);
> >>>>>> -        }
> >>>>>> +    struct ttm_buffer_object *bo;
> >>>>>>     -        ttm_bo_put(bo);
> >>>>>> -        spin_lock(&bdev->lru_lock);
> >>>>>> -    }
> >>>>>> -    list_splice_tail(&removed, &bdev->ddestroy);
> >>>>>> -    empty =3D list_empty(&bdev->ddestroy);
> >>>>>> -    spin_unlock(&bdev->lru_lock);
> >>>>>> +    bo =3D container_of(work, typeof(*bo), delayed_delete);
> >>>>>>     -    return empty;
> >>>>>> +    dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP,
> >>>>>> false,
> >>>>>> +                  MAX_SCHEDULE_TIMEOUT);
> >>>>>> +    dma_resv_lock(bo->base.resv, NULL);
> >>>>>> +    ttm_bo_cleanup_memtype_use(bo);
> >>>>>> +    dma_resv_unlock(bo->base.resv);
> >>>>>> +    ttm_bo_put(bo);
> >>>>>>     }
> >>>>>>       static void ttm_bo_release(struct kref *kref)
> >>>>>> @@ -369,44 +342,40 @@ static void ttm_bo_release(struct kref *kref=
)
> >>>>>>               drm_vma_offset_remove(bdev->vma_manager,
> >>>>>> &bo->base.vma_node);
> >>>>>>             ttm_mem_io_free(bdev, bo->resource);
> >>>>>> -    }
> >>>>>> -
> >>>>>> -    if (!dma_resv_test_signaled(bo->base.resv,
> >>>>>> DMA_RESV_USAGE_BOOKKEEP) ||
> >>>>>> -        !dma_resv_trylock(bo->base.resv)) {
> >>>>>> -        /* The BO is not idle, resurrect it for delayed destroy *=
/
> >>>>>> -        ttm_bo_flush_all_fences(bo);
> >>>>>> -        bo->deleted =3D true;
> >>>>>>     -        spin_lock(&bo->bdev->lru_lock);
> >>>>>> +        if (!dma_resv_test_signaled(bo->base.resv,
> >>>>>> +                        DMA_RESV_USAGE_BOOKKEEP) ||
> >>>>>> +            !dma_resv_trylock(bo->base.resv)) {
> >>>>>> +            /* The BO is not idle, resurrect it for delayed destr=
oy */
> >>>>>> +            ttm_bo_flush_all_fences(bo);
> >>>>>> +            bo->deleted =3D true;
> >>>>>>     -        /*
> >>>>>> -         * Make pinned bos immediately available to
> >>>>>> -         * shrinkers, now that they are queued for
> >>>>>> -         * destruction.
> >>>>>> -         *
> >>>>>> -         * FIXME: QXL is triggering this. Can be removed when the
> >>>>>> -         * driver is fixed.
> >>>>>> -         */
> >>>>>> -        if (bo->pin_count) {
> >>>>>> -            bo->pin_count =3D 0;
> >>>>>> -            ttm_resource_move_to_lru_tail(bo->resource);
> >>>>>> -        }
> >>>>>> +            spin_lock(&bo->bdev->lru_lock);
> >>>>>>     -        kref_init(&bo->kref);
> >>>>>> -        list_add_tail(&bo->ddestroy, &bdev->ddestroy);
> >>>>>> -        spin_unlock(&bo->bdev->lru_lock);
> >>>>>> +            /*
> >>>>>> +             * Make pinned bos immediately available to
> >>>>>> +             * shrinkers, now that they are queued for
> >>>>>> +             * destruction.
> >>>>>> +             *
> >>>>>> +             * FIXME: QXL is triggering this. Can be removed when=
 the
> >>>>>> +             * driver is fixed.
> >>>>>> +             */
> >>>>>> +            if (bo->pin_count) {
> >>>>>> +                bo->pin_count =3D 0;
> >>>>>> +                ttm_resource_move_to_lru_tail(bo->resource);
> >>>>>> +            }
> >>>>>>     -        schedule_delayed_work(&bdev->wq,
> >>>>>> -                      ((HZ / 100) < 1) ? 1 : HZ / 100);
> >>>>>> -        return;
> >>>>>> -    }
> >>>>>> +            kref_init(&bo->kref);
> >>>>>> +            spin_unlock(&bo->bdev->lru_lock);
> >>>>>>     -    spin_lock(&bo->bdev->lru_lock);
> >>>>>> -    list_del(&bo->ddestroy);
> >>>>>> -    spin_unlock(&bo->bdev->lru_lock);
> >>>>>> +            INIT_WORK(&bo->delayed_delete, ttm_bo_delayed_delete)=
;
> >>>>>> +            queue_work(bdev->wq, &bo->delayed_delete);
> >>>>>> +            return;
> >>>>>> +        }
> >>>>>>     -    ttm_bo_cleanup_memtype_use(bo);
> >>>>>> -    dma_resv_unlock(bo->base.resv);
> >>>>>> +        ttm_bo_cleanup_memtype_use(bo);
> >>>>>> +        dma_resv_unlock(bo->base.resv);
> >>>>>> +    }
> >>>>>>           atomic_dec(&ttm_glob.bo_count);
> >>>>>>         bo->destroy(bo);
> >>>>>> @@ -946,7 +915,6 @@ int ttm_bo_init_reserved(struct ttm_device *bd=
ev,
> >>>>>> struct ttm_buffer_object *bo,
> >>>>>>         int ret;
> >>>>>>           kref_init(&bo->kref);
> >>>>>> -    INIT_LIST_HEAD(&bo->ddestroy);
> >>>>>>         bo->bdev =3D bdev;
> >>>>>>         bo->type =3D type;
> >>>>>>         bo->page_alignment =3D alignment;
> >>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
> >>>>>> b/drivers/gpu/drm/ttm/ttm_bo_util.c
> >>>>>> index ba3aa0a0fc43..ae4b7922ee1a 100644
> >>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> >>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> >>>>>> @@ -230,7 +230,6 @@ static int ttm_buffer_object_transfer(struct
> >>>>>> ttm_buffer_object *bo,
> >>>>>>          */
> >>>>>>           atomic_inc(&ttm_glob.bo_count);
> >>>>>> -    INIT_LIST_HEAD(&fbo->base.ddestroy);
> >>>>>>         drm_vma_node_reset(&fbo->base.base.vma_node);
> >>>>>>           kref_init(&fbo->base.kref);
> >>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c
> >>>>>> b/drivers/gpu/drm/ttm/ttm_device.c
> >>>>>> index e7147e304637..e9bedca4dfdc 100644
> >>>>>> --- a/drivers/gpu/drm/ttm/ttm_device.c
> >>>>>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> >>>>>> @@ -175,16 +175,6 @@ int ttm_device_swapout(struct ttm_device *bde=
v,
> >>>>>> struct ttm_operation_ctx *ctx,
> >>>>>>     }
> >>>>>>     EXPORT_SYMBOL(ttm_device_swapout);
> >>>>>>     -static void ttm_device_delayed_workqueue(struct work_struct *=
work)
> >>>>>> -{
> >>>>>> -    struct ttm_device *bdev =3D
> >>>>>> -        container_of(work, struct ttm_device, wq.work);
> >>>>>> -
> >>>>>> -    if (!ttm_bo_delayed_delete(bdev, false))
> >>>>>> -        schedule_delayed_work(&bdev->wq,
> >>>>>> -                      ((HZ / 100) < 1) ? 1 : HZ / 100);
> >>>>>> -}
> >>>>>> -
> >>>>>>     /**
> >>>>>>      * ttm_device_init
> >>>>>>      *
> >>>>>> @@ -215,15 +205,19 @@ int ttm_device_init(struct ttm_device *bdev,
> >>>>>> struct ttm_device_funcs *funcs,
> >>>>>>         if (ret)
> >>>>>>             return ret;
> >>>>>>     +    bdev->wq =3D alloc_workqueue("ttm", WQ_MEM_RECLAIM | WQ_H=
IGHPRI,
> >>>>>> 16);
> >>>>>> +    if (!bdev->wq) {
> >>>>>> +        ttm_global_release();
> >>>>>> +        return -ENOMEM;
> >>>>>> +    }
> >>>>>> +
> >>>>>>         bdev->funcs =3D funcs;
> >>>>>>           ttm_sys_man_init(bdev);
> >>>>>>         ttm_pool_init(&bdev->pool, dev, use_dma_alloc, use_dma32);
> >>>>>>           bdev->vma_manager =3D vma_manager;
> >>>>>> -    INIT_DELAYED_WORK(&bdev->wq, ttm_device_delayed_workqueue);
> >>>>>>         spin_lock_init(&bdev->lru_lock);
> >>>>>> -    INIT_LIST_HEAD(&bdev->ddestroy);
> >>>>>>         INIT_LIST_HEAD(&bdev->pinned);
> >>>>>>         bdev->dev_mapping =3D mapping;
> >>>>>>         mutex_lock(&ttm_global_mutex);
> >>>>>> @@ -247,10 +241,8 @@ void ttm_device_fini(struct ttm_device *bdev)
> >>>>>>         list_del(&bdev->device_list);
> >>>>>>         mutex_unlock(&ttm_global_mutex);
> >>>>>>     -    cancel_delayed_work_sync(&bdev->wq);
> >>>>>> -
> >>>>>> -    if (ttm_bo_delayed_delete(bdev, true))
> >>>>>> -        pr_debug("Delayed destroy list was clean\n");
> >>>>>> +    drain_workqueue(bdev->wq);
> >>>>>> +    destroy_workqueue(bdev->wq);
> >>>>>>           spin_lock(&bdev->lru_lock);
> >>>>>>         for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i)
> >>>>>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo=
_api.h
> >>>>>> index 7758347c461c..69e62bbb01e3 100644
> >>>>>> --- a/include/drm/ttm/ttm_bo_api.h
> >>>>>> +++ b/include/drm/ttm/ttm_bo_api.h
> >>>>>> @@ -92,7 +92,6 @@ struct ttm_tt;
> >>>>>>      * @ttm: TTM structure holding system pages.
> >>>>>>      * @evicted: Whether the object was evicted without user-space
> >>>>>> knowing.
> >>>>>>      * @deleted: True if the object is only a zombie and already d=
eleted.
> >>>>>> - * @ddestroy: List head for the delayed destroy list.
> >>>>>>      * @swap: List head for swap LRU list.
> >>>>>>      * @offset: The current GPU offset, which can have different m=
eanings
> >>>>>>      * depending on the memory type. For SYSTEM type memory, it sh=
ould
> >>>>>> be 0.
> >>>>>> @@ -135,19 +134,14 @@ struct ttm_buffer_object {
> >>>>>>         struct ttm_tt *ttm;
> >>>>>>         bool deleted;
> >>>>>>         struct ttm_lru_bulk_move *bulk_move;
> >>>>>> +    unsigned priority;
> >>>>>> +    unsigned pin_count;
> >>>>>>           /**
> >>>>>> -     * Members protected by the bdev::lru_lock.
> >>>>>> -     */
> >>>>>> -
> >>>>>> -    struct list_head ddestroy;
> >>>>>> -
> >>>>>> -    /**
> >>>>>> -     * Members protected by a bo reservation.
> >>>>>> +     * @delayed_delete: Work item used when we can't delete the B=
O
> >>>>>> +     * immediately
> >>>>>>          */
> >>>>>> -
> >>>>>> -    unsigned priority;
> >>>>>> -    unsigned pin_count;
> >>>>>> +    struct work_struct delayed_delete;
> >>>>>>           /**
> >>>>>>          * Special members that are protected by the reserve lock
> >>>>>> @@ -448,8 +442,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vm=
a);
> >>>>>>       int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned lo=
ng addr,
> >>>>>>                  void *buf, int len, int write);
> >>>>>> -bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_a=
ll);
> >>>>>> -
> >>>>>>     vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t=
 prot);
> >>>>>>       #endif
> >>>>>> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_de=
vice.h
> >>>>>> index 95b3c04b1ab9..4f3e81eac6f3 100644
> >>>>>> --- a/include/drm/ttm/ttm_device.h
> >>>>>> +++ b/include/drm/ttm/ttm_device.h
> >>>>>> @@ -251,11 +251,6 @@ struct ttm_device {
> >>>>>>          */
> >>>>>>         spinlock_t lru_lock;
> >>>>>>     -    /**
> >>>>>> -     * @ddestroy: Destroyed but not yet cleaned up buffer objects=
.
> >>>>>> -     */
> >>>>>> -    struct list_head ddestroy;
> >>>>>> -
> >>>>>>         /**
> >>>>>>          * @pinned: Buffer objects which are pinned and so not on =
any
> >>>>>> LRU list.
> >>>>>>          */
> >>>>>> @@ -270,7 +265,7 @@ struct ttm_device {
> >>>>>>         /**
> >>>>>>          * @wq: Work queue structure for the delayed delete workqu=
eue.
> >>>>>>          */
> >>>>>> -    struct delayed_work wq;
> >>>>>> +    struct workqueue_struct *wq;
> >>>>>>     };
> >>>>>>       int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t
> >>>>>> gfp_flags);
>

