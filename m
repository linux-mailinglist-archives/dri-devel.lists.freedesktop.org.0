Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 331FF55F1D1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 01:11:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911B711AD73;
	Tue, 28 Jun 2022 23:11:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36BD511AD73;
 Tue, 28 Jun 2022 23:11:50 +0000 (UTC)
Received: from [192.168.2.145] (109-252-118-164.nat.spd-mgts.ru
 [109.252.118.164])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id F409E66015BE;
 Wed, 29 Jun 2022 00:11:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1656457908;
 bh=BA41yYfLT+6vyzRskX6cnhL0zlM1lLgsIKATGMY5aeM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZS/cW2rfL9Ygb/l35nyWmuYV3/6ynQOsxbTwnftEsGGSL+CV6X5iR3BiH0Baf2cUQ
 8c3bWg8pxfzCivOLh+LdND7yk9jyyoGLDdl2Pon3cDspMYvvdnQM42yIcxbuHt/LdZ
 lkbyAFEv4eVhlK9GPp5PkIzmRZH73ALKqkhcTDLNKTbqQ9XdrdmWXnO3sGp/vqmw1h
 ZyVarCa2UvULBPKqtgJ6vNI1NToR5rP+LfAhPZ2qZlVNJrCzv1NPPS058AhUfhROoG
 IDY/2Zv20X+iWcV832GGsJcXQ4b9UQjL/wOTpzmovXmkAj0vFuOgMOH7rJZkakmZ+Z
 KwZ2Xj4IHgezA==
Message-ID: <ce214fb9-c1bb-42db-a777-ccce15af388b@collabora.com>
Date: Wed, 29 Jun 2022 02:11:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 00/22] Add generic memory shrinker to VirtIO-GPU and
 Panfrost DRM drivers
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
 <49cc6f0c-e90e-8edd-52e7-4188620e2c28@arm.com>
 <f77c1c2d-d9f9-db00-906a-ec10b535621d@collabora.com>
 <CAF6AEGsQBcHbU6Ps5fp5v6ANaZwMAtig-3i-ekQzwG=7BBDNwA@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAF6AEGsQBcHbU6Ps5fp5v6ANaZwMAtig-3i-ekQzwG=7BBDNwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>, Qiang Yu <yuq825@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/28/22 19:48, Rob Clark wrote:
> On Tue, Jun 28, 2022 at 5:51 AM Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
>>
>> On 6/28/22 15:31, Robin Murphy wrote:
>>> ----->8-----
>>> [   68.295951] ======================================================
>>> [   68.295956] WARNING: possible circular locking dependency detected
>>> [   68.295963] 5.19.0-rc3+ #400 Not tainted
>>> [   68.295972] ------------------------------------------------------
>>> [   68.295977] cc1/295 is trying to acquire lock:
>>> [   68.295986] ffff000008d7f1a0
>>> (reservation_ww_class_mutex){+.+.}-{3:3}, at: drm_gem_shmem_free+0x7c/0x198
>>> [   68.296036]
>>> [   68.296036] but task is already holding lock:
>>> [   68.296041] ffff80000c14b820 (fs_reclaim){+.+.}-{0:0}, at:
>>> __alloc_pages_slowpath.constprop.0+0x4d8/0x1470
>>> [   68.296080]
>>> [   68.296080] which lock already depends on the new lock.
>>> [   68.296080]
>>> [   68.296085]
>>> [   68.296085] the existing dependency chain (in reverse order) is:
>>> [   68.296090]
>>> [   68.296090] -> #1 (fs_reclaim){+.+.}-{0:0}:
>>> [   68.296111]        fs_reclaim_acquire+0xb8/0x150
>>> [   68.296130]        dma_resv_lockdep+0x298/0x3fc
>>> [   68.296148]        do_one_initcall+0xe4/0x5f8
>>> [   68.296163]        kernel_init_freeable+0x414/0x49c
>>> [   68.296180]        kernel_init+0x2c/0x148
>>> [   68.296195]        ret_from_fork+0x10/0x20
>>> [   68.296207]
>>> [   68.296207] -> #0 (reservation_ww_class_mutex){+.+.}-{3:3}:
>>> [   68.296229]        __lock_acquire+0x1724/0x2398
>>> [   68.296246]        lock_acquire+0x218/0x5b0
>>> [   68.296260]        __ww_mutex_lock.constprop.0+0x158/0x2378
>>> [   68.296277]        ww_mutex_lock+0x7c/0x4d8
>>> [   68.296291]        drm_gem_shmem_free+0x7c/0x198
>>> [   68.296304]        panfrost_gem_free_object+0x118/0x138
>>> [   68.296318]        drm_gem_object_free+0x40/0x68
>>> [   68.296334]        drm_gem_shmem_shrinker_run_objects_scan+0x42c/0x5b8
>>> [   68.296352]        drm_gem_shmem_shrinker_scan_objects+0xa4/0x170
>>> [   68.296368]        do_shrink_slab+0x220/0x808
>>> [   68.296381]        shrink_slab+0x11c/0x408
>>> [   68.296392]        shrink_node+0x6ac/0xb90
>>> [   68.296403]        do_try_to_free_pages+0x1dc/0x8d0
>>> [   68.296416]        try_to_free_pages+0x1ec/0x5b0
>>> [   68.296429]        __alloc_pages_slowpath.constprop.0+0x528/0x1470
>>> [   68.296444]        __alloc_pages+0x4e0/0x5b8
>>> [   68.296455]        __folio_alloc+0x24/0x60
>>> [   68.296467]        vma_alloc_folio+0xb8/0x2f8
>>> [   68.296483]        alloc_zeroed_user_highpage_movable+0x58/0x68
>>> [   68.296498]        __handle_mm_fault+0x918/0x12a8
>>> [   68.296513]        handle_mm_fault+0x130/0x300
>>> [   68.296527]        do_page_fault+0x1d0/0x568
>>> [   68.296539]        do_translation_fault+0xa0/0xb8
>>> [   68.296551]        do_mem_abort+0x68/0xf8
>>> [   68.296562]        el0_da+0x74/0x100
>>> [   68.296572]        el0t_64_sync_handler+0x68/0xc0
>>> [   68.296585]        el0t_64_sync+0x18c/0x190
>>> [   68.296596]
>>> [   68.296596] other info that might help us debug this:
>>> [   68.296596]
>>> [   68.296601]  Possible unsafe locking scenario:
>>> [   68.296601]
>>> [   68.296604]        CPU0                    CPU1
>>> [   68.296608]        ----                    ----
>>> [   68.296612]   lock(fs_reclaim);
>>> [   68.296622] lock(reservation_ww_class_mutex);
>>> [   68.296633]                                lock(fs_reclaim);
>>> [   68.296644]   lock(reservation_ww_class_mutex);
>>> [   68.296654]
>>> [   68.296654]  *** DEADLOCK ***
>>
>> This splat could be ignored for now. I'm aware about it, although
>> haven't looked closely at how to fix it since it's a kind of a lockdep
>> misreporting.
> 
> The lockdep splat could be fixed with something similar to what I've
> done in msm, ie. basically just not acquire the lock in the finalizer:
> 
> https://patchwork.freedesktop.org/patch/489364/
> 
> There is one gotcha to watch for, as danvet pointed out
> (scan_objects() could still see the obj in the LRU before the
> finalizer removes it), but if scan_objects() does the
> kref_get_unless_zero() trick, it is safe.

Nice, thank you!

-- 
Best regards,
Dmitry
