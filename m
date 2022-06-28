Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB52155C0F6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 14:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F198A112793;
	Tue, 28 Jun 2022 12:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5DFA01129A9;
 Tue, 28 Jun 2022 12:31:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAD50152B;
 Tue, 28 Jun 2022 05:31:12 -0700 (PDT)
Received: from [10.57.85.130] (unknown [10.57.85.130])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0667E3F5A1;
 Tue, 28 Jun 2022 05:31:06 -0700 (PDT)
Message-ID: <49cc6f0c-e90e-8edd-52e7-4188620e2c28@arm.com>
Date: Tue, 28 Jun 2022 13:31:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 00/22] Add generic memory shrinker to VirtIO-GPU and
 Panfrost DRM drivers
Content-Language: en-GB
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Qiang Yu <yuq825@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Thierry Reding
 <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-05-27 00:50, Dmitry Osipenko wrote:
> Hello,
> 
> This patchset introduces memory shrinker for the VirtIO-GPU DRM driver
> and adds memory purging and eviction support to VirtIO-GPU driver.
> 
> The new dma-buf locking convention is introduced here as well.
> 
> During OOM, the shrinker will release BOs that are marked as "not needed"
> by userspace using the new madvise IOCTL, it will also evict idling BOs
> to SWAP. The userspace in this case is the Mesa VirGL driver, it will mark
> the cached BOs as "not needed", allowing kernel driver to release memory
> of the cached shmem BOs on lowmem situations, preventing OOM kills.
> 
> The Panfrost driver is switched to use generic memory shrinker.

I think we still have some outstanding issues here - Alyssa reported 
some weirdness yesterday, so I just tried provoking a low-memory 
condition locally with this series applied and a few debug options 
enabled, and the results as below were... interesting.

Thanks,
Robin.

----->8-----
[   68.295951] ======================================================
[   68.295956] WARNING: possible circular locking dependency detected
[   68.295963] 5.19.0-rc3+ #400 Not tainted
[   68.295972] ------------------------------------------------------
[   68.295977] cc1/295 is trying to acquire lock:
[   68.295986] ffff000008d7f1a0 
(reservation_ww_class_mutex){+.+.}-{3:3}, at: drm_gem_shmem_free+0x7c/0x198
[   68.296036]
[   68.296036] but task is already holding lock:
[   68.296041] ffff80000c14b820 (fs_reclaim){+.+.}-{0:0}, at: 
__alloc_pages_slowpath.constprop.0+0x4d8/0x1470
[   68.296080]
[   68.296080] which lock already depends on the new lock.
[   68.296080]
[   68.296085]
[   68.296085] the existing dependency chain (in reverse order) is:
[   68.296090]
[   68.296090] -> #1 (fs_reclaim){+.+.}-{0:0}:
[   68.296111]        fs_reclaim_acquire+0xb8/0x150
[   68.296130]        dma_resv_lockdep+0x298/0x3fc
[   68.296148]        do_one_initcall+0xe4/0x5f8
[   68.296163]        kernel_init_freeable+0x414/0x49c
[   68.296180]        kernel_init+0x2c/0x148
[   68.296195]        ret_from_fork+0x10/0x20
[   68.296207]
[   68.296207] -> #0 (reservation_ww_class_mutex){+.+.}-{3:3}:
[   68.296229]        __lock_acquire+0x1724/0x2398
[   68.296246]        lock_acquire+0x218/0x5b0
[   68.296260]        __ww_mutex_lock.constprop.0+0x158/0x2378
[   68.296277]        ww_mutex_lock+0x7c/0x4d8
[   68.296291]        drm_gem_shmem_free+0x7c/0x198
[   68.296304]        panfrost_gem_free_object+0x118/0x138
[   68.296318]        drm_gem_object_free+0x40/0x68
[   68.296334]        drm_gem_shmem_shrinker_run_objects_scan+0x42c/0x5b8
[   68.296352]        drm_gem_shmem_shrinker_scan_objects+0xa4/0x170
[   68.296368]        do_shrink_slab+0x220/0x808
[   68.296381]        shrink_slab+0x11c/0x408
[   68.296392]        shrink_node+0x6ac/0xb90
[   68.296403]        do_try_to_free_pages+0x1dc/0x8d0
[   68.296416]        try_to_free_pages+0x1ec/0x5b0
[   68.296429]        __alloc_pages_slowpath.constprop.0+0x528/0x1470
[   68.296444]        __alloc_pages+0x4e0/0x5b8
[   68.296455]        __folio_alloc+0x24/0x60
[   68.296467]        vma_alloc_folio+0xb8/0x2f8
[   68.296483]        alloc_zeroed_user_highpage_movable+0x58/0x68
[   68.296498]        __handle_mm_fault+0x918/0x12a8
[   68.296513]        handle_mm_fault+0x130/0x300
[   68.296527]        do_page_fault+0x1d0/0x568
[   68.296539]        do_translation_fault+0xa0/0xb8
[   68.296551]        do_mem_abort+0x68/0xf8
[   68.296562]        el0_da+0x74/0x100
[   68.296572]        el0t_64_sync_handler+0x68/0xc0
[   68.296585]        el0t_64_sync+0x18c/0x190
[   68.296596]
[   68.296596] other info that might help us debug this:
[   68.296596]
[   68.296601]  Possible unsafe locking scenario:
[   68.296601]
[   68.296604]        CPU0                    CPU1
[   68.296608]        ----                    ----
[   68.296612]   lock(fs_reclaim);
[   68.296622] 
lock(reservation_ww_class_mutex);
[   68.296633]                                lock(fs_reclaim);
[   68.296644]   lock(reservation_ww_class_mutex);
[   68.296654]
[   68.296654]  *** DEADLOCK ***
[   68.296654]
[   68.296658] 3 locks held by cc1/295:
[   68.296666]  #0: ffff00000616e898 (&mm->mmap_lock){++++}-{3:3}, at: 
do_page_fault+0x144/0x568
[   68.296702]  #1: ffff80000c14b820 (fs_reclaim){+.+.}-{0:0}, at: 
__alloc_pages_slowpath.constprop.0+0x4d8/0x1470
[   68.296740]  #2: ffff80000c1215b0 (shrinker_rwsem){++++}-{3:3}, at: 
shrink_slab+0xc0/0x408
[   68.296774]
[   68.296774] stack backtrace:
[   68.296780] CPU: 2 PID: 295 Comm: cc1 Not tainted 5.19.0-rc3+ #400
[   68.296794] Hardware name: ARM LTD ARM Juno Development Platform/ARM 
Juno Development Platform, BIOS EDK II Sep  3 2019
[   68.296803] Call trace:
[   68.296808]  dump_backtrace+0x1e4/0x1f0
[   68.296821]  show_stack+0x20/0x70
[   68.296832]  dump_stack_lvl+0x8c/0xb8
[   68.296849]  dump_stack+0x1c/0x38
[   68.296864]  print_circular_bug.isra.0+0x284/0x378
[   68.296881]  check_noncircular+0x1d8/0x1f8
[   68.296896]  __lock_acquire+0x1724/0x2398
[   68.296911]  lock_acquire+0x218/0x5b0
[   68.296926]  __ww_mutex_lock.constprop.0+0x158/0x2378
[   68.296942]  ww_mutex_lock+0x7c/0x4d8
[   68.296956]  drm_gem_shmem_free+0x7c/0x198
[   68.296970]  panfrost_gem_free_object+0x118/0x138
[   68.296984]  drm_gem_object_free+0x40/0x68
[   68.296999]  drm_gem_shmem_shrinker_run_objects_scan+0x42c/0x5b8
[   68.297017]  drm_gem_shmem_shrinker_scan_objects+0xa4/0x170
[   68.297033]  do_shrink_slab+0x220/0x808
[   68.297045]  shrink_slab+0x11c/0x408
[   68.297056]  shrink_node+0x6ac/0xb90
[   68.297068]  do_try_to_free_pages+0x1dc/0x8d0
[   68.297081]  try_to_free_pages+0x1ec/0x5b0
[   68.297094]  __alloc_pages_slowpath.constprop.0+0x528/0x1470
[   68.297110]  __alloc_pages+0x4e0/0x5b8
[   68.297122]  __folio_alloc+0x24/0x60
[   68.297134]  vma_alloc_folio+0xb8/0x2f8
[   68.297148]  alloc_zeroed_user_highpage_movable+0x58/0x68
[   68.297163]  __handle_mm_fault+0x918/0x12a8
[   68.297178]  handle_mm_fault+0x130/0x300
[   68.297193]  do_page_fault+0x1d0/0x568
[   68.297205]  do_translation_fault+0xa0/0xb8
[   68.297218]  do_mem_abort+0x68/0xf8
[   68.297229]  el0_da+0x74/0x100
[   68.297239]  el0t_64_sync_handler+0x68/0xc0
[   68.297252]  el0t_64_sync+0x18c/0x190
[   68.471812] arm-scmi firmware:scmi: timed out in resp(caller: 
scmi_power_state_set+0x11c/0x190)
[   68.501947] arm-scmi firmware:scmi: Message for 119 type 0 is not 
expected!
[   68.939686] panfrost 2d000000.gpu: gpu sched timeout, js=1, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=00000000915e2d34
[   69.739386] panfrost 2d000000.gpu: gpu sched timeout, js=0, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=00000000ac77ac55
[   70.415329] panfrost 2d000000.gpu: gpu sched timeout, js=1, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=00000000ee980c7e
[   70.987166] panfrost 2d000000.gpu: gpu sched timeout, js=0, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=00000000ffb7ff37
[   71.914939] panfrost 2d000000.gpu: gpu sched timeout, js=1, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=000000000e92b26e
[   72.426987] panfrost 2d000000.gpu: gpu sched timeout, js=0, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=00000000c036a911
[   73.578683] panfrost 2d000000.gpu: gpu sched timeout, js=1, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=000000001c6fc094
[   74.090555] panfrost 2d000000.gpu: gpu sched timeout, js=0, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=00000000075d00f9
[   74.922709] panfrost 2d000000.gpu: gpu sched timeout, js=1, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=0000000005add546
[   75.434401] panfrost 2d000000.gpu: gpu sched timeout, js=0, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=000000000154189b
[   76.394300] panfrost 2d000000.gpu: gpu sched timeout, js=1, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=00000000ac77ac55
[   76.906236] panfrost 2d000000.gpu: gpu sched timeout, js=0, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=00000000ee980c7e
[   79.657234] panfrost 2d000000.gpu: gpu sched timeout, js=1, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=00000000f6d059fb
[   80.168831] panfrost 2d000000.gpu: gpu sched timeout, js=0, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=0000000061a0f6bf
[   80.808354] panfrost 2d000000.gpu: gpu sched timeout, js=1, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=00000000071ade02
[   81.319967] panfrost 2d000000.gpu: gpu sched timeout, js=0, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=00000000b0afea73
[   81.831574] panfrost 2d000000.gpu: gpu sched timeout, js=1, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=00000000d78f36c2
[   82.343160] panfrost 2d000000.gpu: gpu sched timeout, js=0, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=000000000f689397
[   83.046689] panfrost 2d000000.gpu: gpu sched timeout, js=1, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=00000000412c2a2f
[   83.558352] panfrost 2d000000.gpu: gpu sched timeout, js=0, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=0000000020e551b3
[   84.261913] panfrost 2d000000.gpu: gpu sched timeout, js=1, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=000000009437aace
[   84.773576] panfrost 2d000000.gpu: gpu sched timeout, js=0, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=000000001c6fc094
[   85.317275] panfrost 2d000000.gpu: gpu sched timeout, js=1, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=00000000c036a911
[   85.829035] panfrost 2d000000.gpu: gpu sched timeout, js=0, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=000000000e92b26e
[   86.660555] panfrost 2d000000.gpu: gpu sched timeout, js=1, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=00000000ac77ac55
[   87.172126] panfrost 2d000000.gpu: gpu sched timeout, js=0, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=00000000b940e406
[   87.875846] panfrost 2d000000.gpu: gpu sched timeout, js=1, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=000000001c6fc094
[   88.387443] panfrost 2d000000.gpu: gpu sched timeout, js=0, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=000000009437aace
[   89.059175] panfrost 2d000000.gpu: gpu sched timeout, js=1, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=0000000075dadb7f
[   89.570960] panfrost 2d000000.gpu: gpu sched timeout, js=0, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=0000000005add546
[   90.146687] panfrost 2d000000.gpu: gpu sched timeout, js=1, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=00000000cba2873c
[   90.662497] panfrost 2d000000.gpu: gpu sched timeout, js=0, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=00000000a4beb490
[   95.392748] panfrost 2d000000.gpu: gpu sched timeout, js=1, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=000000005b5fc4ec
[   95.904179] panfrost 2d000000.gpu: gpu sched timeout, js=0, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=00000000a17436ee
[   96.416085] panfrost 2d000000.gpu: gpu sched timeout, js=1, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=000000003888d2a7
[   96.927874] panfrost 2d000000.gpu: gpu sched timeout, js=0, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=0000000093e04a98
[   97.439742] panfrost 2d000000.gpu: gpu sched timeout, js=1, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=00000000c036a911
[   97.954109] panfrost 2d000000.gpu: gpu sched timeout, js=0, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=0000000084c51113
[   98.467374] panfrost 2d000000.gpu: gpu sched timeout, js=1, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=00000000664663ce
[   98.975192] panfrost 2d000000.gpu: gpu sched timeout, js=0, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=0000000060f2d45c
[   99.487231] panfrost 2d000000.gpu: gpu sched timeout, js=1, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=00000000b29288f8
[   99.998833] panfrost 2d000000.gpu: gpu sched timeout, js=0, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=000000002f07ab24
[  100.510744] panfrost 2d000000.gpu: gpu sched timeout, js=1, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=000000008c15c751
[  100.511411] 
==================================================================
[  100.511419] BUG: KASAN: use-after-free in irq_work_single+0xa4/0x110
[  100.511445] Write of size 4 at addr ffff0000107f5830 by task 
glmark2-es2-drm/280
[  100.511458]
[  100.511464] CPU: 1 PID: 280 Comm: glmark2-es2-drm Not tainted 
5.19.0-rc3+ #400
[  100.511479] Hardware name: ARM LTD ARM Juno Development Platform/ARM 
Juno Development Platform, BIOS EDK II Sep  3 2019
[  100.511489] Call trace:
[  100.511494]  dump_backtrace+0x1e4/0x1f0
[  100.511512]  show_stack+0x20/0x70
[  100.511523]  dump_stack_lvl+0x8c/0xb8
[  100.511543]  print_report+0x16c/0x668
[  100.511559]  kasan_report+0x80/0x208
[  100.511574]  kasan_check_range+0x100/0x1b8
[  100.511590]  __kasan_check_write+0x34/0x60
[  100.511607]  irq_work_single+0xa4/0x110
[  100.511619]  irq_work_run_list+0x6c/0x88
[  100.511632]  irq_work_run+0x28/0x48
[  100.511644]  ipi_handler+0x254/0x468
[  100.511664]  handle_percpu_devid_irq+0x11c/0x518
[  100.511681]  generic_handle_domain_irq+0x50/0x70
[  100.511699]  gic_handle_irq+0xd4/0x118
[  100.511711]  call_on_irq_stack+0x2c/0x58
[  100.511725]  do_interrupt_handler+0xc0/0xc8
[  100.511741]  el1_interrupt+0x40/0x68
[  100.511754]  el1h_64_irq_handler+0x18/0x28
[  100.511767]  el1h_64_irq+0x64/0x68
[  100.511778]  irq_work_queue+0xc0/0xd8
[  100.511790]  drm_sched_entity_fini+0x2c4/0x3b0
[  100.511805]  drm_sched_entity_destroy+0x2c/0x40
[  100.511818]  panfrost_job_close+0x44/0x1c0
[  100.511833]  panfrost_postclose+0x38/0x60
[  100.511845]  drm_file_free.part.0+0x33c/0x4b8
[  100.511862]  drm_close_helper.isra.0+0xc0/0xd8
[  100.511877]  drm_release+0xe4/0x1e0
[  100.511891]  __fput+0xf8/0x390
[  100.511904]  ____fput+0x18/0x28
[  100.511917]  task_work_run+0xc4/0x1e0
[  100.511929]  do_exit+0x554/0x1168
[  100.511945]  do_group_exit+0x60/0x108
[  100.511960]  __arm64_sys_exit_group+0x34/0x38
[  100.511977]  invoke_syscall+0x64/0x180
[  100.511993]  el0_svc_common.constprop.0+0x13c/0x170
[  100.512012]  do_el0_svc+0x48/0xe8
[  100.512028]  el0_svc+0x5c/0xe0
[  100.512038]  el0t_64_sync_handler+0xb8/0xc0
[  100.512051]  el0t_64_sync+0x18c/0x190
[  100.512064]
[  100.512068] Allocated by task 280:
[  100.512075]  kasan_save_stack+0x2c/0x58
[  100.512091]  __kasan_kmalloc+0x90/0xb8
[  100.512105]  kmem_cache_alloc_trace+0x1d4/0x330
[  100.512118]  panfrost_ioctl_submit+0x100/0x630
[  100.512131]  drm_ioctl_kernel+0x160/0x250
[  100.512147]  drm_ioctl+0x36c/0x628
[  100.512161]  __arm64_sys_ioctl+0xd8/0x120
[  100.512178]  invoke_syscall+0x64/0x180
[  100.512194]  el0_svc_common.constprop.0+0x13c/0x170
[  100.512211]  do_el0_svc+0x48/0xe8
[  100.512226]  el0_svc+0x5c/0xe0
[  100.512236]  el0t_64_sync_handler+0xb8/0xc0
[  100.512248]  el0t_64_sync+0x18c/0x190
[  100.512259]
[  100.512262] Freed by task 280:
[  100.512268]  kasan_save_stack+0x2c/0x58
[  100.512283]  kasan_set_track+0x2c/0x40
[  100.512296]  kasan_set_free_info+0x28/0x50
[  100.512312]  __kasan_slab_free+0xf0/0x170
[  100.512326]  kfree+0x124/0x418
[  100.512337]  panfrost_job_cleanup+0x1f0/0x298
[  100.512350]  panfrost_job_free+0x80/0xb0
[  100.512363]  drm_sched_entity_kill_jobs_irq_work+0x80/0xa0
[  100.512377]  irq_work_single+0x88/0x110
[  100.512389]  irq_work_run_list+0x6c/0x88
[  100.512401]  irq_work_run+0x28/0x48
[  100.512413]  ipi_handler+0x254/0x468
[  100.512427]  handle_percpu_devid_irq+0x11c/0x518
[  100.512443]  generic_handle_domain_irq+0x50/0x70
[  100.512460]  gic_handle_irq+0xd4/0x118
[  100.512471]
[  100.512474] The buggy address belongs to the object at ffff0000107f5800
[  100.512474]  which belongs to the cache kmalloc-512 of size 512
[  100.512484] The buggy address is located 48 bytes inside of
[  100.512484]  512-byte region [ffff0000107f5800, ffff0000107f5a00)
[  100.512497]
[  100.512500] The buggy address belongs to the physical page:
[  100.512506] page:000000000a626feb refcount:1 mapcount:0 
mapping:0000000000000000 index:0x0 pfn:0x907f4
[  100.512520] head:000000000a626feb order:2 compound_mapcount:0 
compound_pincount:0
[  100.512530] flags: 
0xffff00000010200(slab|head|node=0|zone=0|lastcpupid=0xffff)
[  100.512556] raw: 0ffff00000010200 fffffc0000076400 dead000000000002 
ffff000000002600
[  100.512569] raw: 0000000000000000 0000000080100010 00000001ffffffff 
0000000000000000
[  100.512577] page dumped because: kasan: bad access detected
[  100.512582]
[  100.512585] Memory state around the buggy address:
[  100.512592]  ffff0000107f5700: fc fc fc fc fc fc fc fc fc fc fc fc fc 
fc fc fc
[  100.512602]  ffff0000107f5780: fc fc fc fc fc fc fc fc fc fc fc fc fc 
fc fc fc
[  100.512612] >ffff0000107f5800: fa fb fb fb fb fb fb fb fb fb fb fb fb 
fb fb fb
[  100.512619]                                      ^
[  100.512627]  ffff0000107f5880: fb fb fb fb fb fb fb fb fb fb fb fb fb 
fb fb fb
[  100.512636]  ffff0000107f5900: fb fb fb fb fb fb fb fb fb fb fb fb fb 
fb fb fb
[  100.512643] 
==================================================================
[  101.022573] panfrost 2d000000.gpu: gpu sched timeout, js=1, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=00000000be4b1b31
[  101.534469] panfrost 2d000000.gpu: gpu sched timeout, js=1, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=00000000a8ff2c8a
[  101.535981] BUG: sleeping function called from invalid context at 
kernel/locking/mutex.c:870
[  101.535994] in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 
280, name: glmark2-es2-drm
[  101.536006] preempt_count: 10000, expected: 0
[  101.536012] RCU nest depth: 0, expected: 0
[  101.536019] INFO: lockdep is turned off.
[  101.536023] irq event stamp: 1666508
[  101.536029] hardirqs last  enabled at (1666507): [<ffff80000997ed70>] 
exit_to_kernel_mode.isra.0+0x40/0x140
[  101.536056] hardirqs last disabled at (1666508): [<ffff800009985030>] 
__schedule+0xb38/0xea8
[  101.536076] softirqs last  enabled at (1664950): [<ffff800008010ac8>] 
__do_softirq+0x6b8/0x89c
[  101.536092] softirqs last disabled at (1664941): [<ffff8000080e4fdc>] 
irq_exit_rcu+0x27c/0x2b0
[  101.536118] CPU: 1 PID: 280 Comm: glmark2-es2-drm Tainted: G    B 
          5.19.0-rc3+ #400
[  101.536134] Hardware name: ARM LTD ARM Juno Development Platform/ARM 
Juno Development Platform, BIOS EDK II Sep  3 2019
[  101.536143] Call trace:
[  101.536147]  dump_backtrace+0x1e4/0x1f0
[  101.536161]  show_stack+0x20/0x70
[  101.536171]  dump_stack_lvl+0x8c/0xb8
[  101.536189]  dump_stack+0x1c/0x38
[  101.536204]  __might_resched+0x1f0/0x2b0
[  101.536220]  __might_sleep+0x74/0xd0
[  101.536234]  ww_mutex_lock+0x40/0x4d8
[  101.536249]  drm_gem_shmem_free+0x7c/0x198
[  101.536264]  panfrost_gem_free_object+0x118/0x138
[  101.536278]  drm_gem_object_free+0x40/0x68
[  101.536295]  panfrost_job_cleanup+0x1bc/0x298
[  101.536309]  panfrost_job_free+0x80/0xb0
[  101.536322]  drm_sched_entity_kill_jobs_irq_work+0x80/0xa0
[  101.536337]  irq_work_single+0x88/0x110
[  101.536351]  irq_work_run_list+0x6c/0x88
[  101.536364]  irq_work_run+0x28/0x48
[  101.536375]  ipi_handler+0x254/0x468
[  101.536392]  handle_percpu_devid_irq+0x11c/0x518
[  101.536409]  generic_handle_domain_irq+0x50/0x70
[  101.536428]  gic_handle_irq+0xd4/0x118
[  101.536439]  call_on_irq_stack+0x2c/0x58
[  101.536453]  do_interrupt_handler+0xc0/0xc8
[  101.536468]  el1_interrupt+0x40/0x68
[  101.536479]  el1h_64_irq_handler+0x18/0x28
[  101.536492]  el1h_64_irq+0x64/0x68
[  101.536503]  __asan_load8+0x30/0xd0
[  101.536519]  drm_sched_entity_fini+0x1e8/0x3b0
[  101.536532]  drm_sched_entity_destroy+0x2c/0x40
[  101.536545]  panfrost_job_close+0x44/0x1c0
[  101.536559]  panfrost_postclose+0x38/0x60
[  101.536571]  drm_file_free.part.0+0x33c/0x4b8
[  101.536586]  drm_close_helper.isra.0+0xc0/0xd8
[  101.536601]  drm_release+0xe4/0x1e0
[  101.536615]  __fput+0xf8/0x390
[  101.536628]  ____fput+0x18/0x28
[  101.536640]  task_work_run+0xc4/0x1e0
[  101.536652]  do_exit+0x554/0x1168
[  101.536667]  do_group_exit+0x60/0x108
[  101.536682]  __arm64_sys_exit_group+0x34/0x38
[  101.536698]  invoke_syscall+0x64/0x180
[  101.536714]  el0_svc_common.constprop.0+0x13c/0x170
[  101.536733]  do_el0_svc+0x48/0xe8
[  101.536748]  el0_svc+0x5c/0xe0
[  101.536759]  el0t_64_sync_handler+0xb8/0xc0
[  101.536771]  el0t_64_sync+0x18c/0x190
[  101.541928] ------------[ cut here ]------------
[  101.541934] kernel BUG at kernel/irq_work.c:235!
[  101.541944] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
[  101.541961] Modules linked in:
[  101.541978] CPU: 1 PID: 280 Comm: glmark2-es2-drm Tainted: G    B   W 
         5.19.0-rc3+ #400
[  101.541997] Hardware name: ARM LTD ARM Juno Development Platform/ARM 
Juno Development Platform, BIOS EDK II Sep  3 2019
[  101.542009] pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[  101.542027] pc : irq_work_run_list+0x80/0x88
[  101.542044] lr : irq_work_run+0x34/0x48
[  101.542060] sp : ffff80000da37eb0
[  101.542069] x29: ffff80000da37eb0 x28: ffff000006bb0000 x27: 
ffff000006bb0008
[  101.542107] x26: ffff80000da37f20 x25: ffff8000080304d8 x24: 
0000000000000001
[  101.542142] x23: ffff80000abcd008 x22: ffff80000da37ed0 x21: 
ffff80001c0de000
[  101.542177] x20: ffff80000abcd008 x19: ffff80000abdbad0 x18: 
0000000000000000
[  101.542212] x17: 616e202c30383220 x16: 3a646970202c3020 x15: 
ffff8000082df9d0
[  101.542246] x14: ffff800008dfada8 x13: 0000000000000003 x12: 
1fffe000018b2a06
[  101.542280] x11: ffff6000018b2a06 x10: dfff800000000000 x9 : 
ffff00000c595033
[  101.542315] x8 : ffff6000018b2a07 x7 : 0000000000000001 x6 : 
00000000000000fb
[  101.542349] x5 : ffff00000c595030 x4 : 0000000000000000 x3 : 
ffff00000c595030
[  101.542382] x2 : 0000000000000000 x1 : 0000000000000000 x0 : 
ffff000026cb9ad0
[  101.542416] Call trace:
[  101.542424]  irq_work_run_list+0x80/0x88
[  101.542441]  ipi_handler+0x254/0x468
[  101.542460]  handle_percpu_devid_irq+0x11c/0x518
[  101.542480]  generic_handle_domain_irq+0x50/0x70
[  101.542501]  gic_handle_irq+0xd4/0x118
[  101.542516]  call_on_irq_stack+0x2c/0x58
[  101.542534]  do_interrupt_handler+0xc0/0xc8
[  101.542553]  el1_interrupt+0x40/0x68
[  101.542568]  el1h_64_irq_handler+0x18/0x28
[  101.542584]  el1h_64_irq+0x64/0x68
[  101.542599]  __asan_load8+0x30/0xd0
[  101.542617]  drm_sched_entity_fini+0x1e8/0x3b0
[  101.542634]  drm_sched_entity_destroy+0x2c/0x40
[  101.542651]  panfrost_job_close+0x44/0x1c0
[  101.542669]  panfrost_postclose+0x38/0x60
[  101.542685]  drm_file_free.part.0+0x33c/0x4b8
[  101.542704]  drm_close_helper.isra.0+0xc0/0xd8
[  101.542723]  drm_release+0xe4/0x1e0
[  101.542740]  __fput+0xf8/0x390
[  101.542756]  ____fput+0x18/0x28
[  101.542773]  task_work_run+0xc4/0x1e0
[  101.542788]  do_exit+0x554/0x1168
[  101.542806]  do_group_exit+0x60/0x108
[  101.542825]  __arm64_sys_exit_group+0x34/0x38
[  101.542845]  invoke_syscall+0x64/0x180
[  101.542865]  el0_svc_common.constprop.0+0x13c/0x170
[  101.542887]  do_el0_svc+0x48/0xe8
[  101.542906]  el0_svc+0x5c/0xe0
[  101.542921]  el0t_64_sync_handler+0xb8/0xc0
[  101.542938]  el0t_64_sync+0x18c/0x190
[  101.542960] Code: a94153f3 a8c27bfd d50323bf d65f03c0 (d4210000)
[  101.542979] ---[ end trace 0000000000000000 ]---
[  101.678650] Kernel panic - not syncing: Oops - BUG: Fatal exception 
in interrupt
[  102.046301] panfrost 2d000000.gpu: gpu sched timeout, js=1, 
config=0x0, status=0x0, head=0x0, tail=0x0, sched_job=000000001da14c98
[  103.227334] SMP: stopping secondary CPUs
[  103.241055] Kernel Offset: disabled
[  103.254316] CPU features: 0x800,00184810,00001086
[  103.268904] Memory Limit: 800 MB
[  103.411625] ---[ end Kernel panic - not syncing: Oops - BUG: Fatal 
exception in interrupt ]---
