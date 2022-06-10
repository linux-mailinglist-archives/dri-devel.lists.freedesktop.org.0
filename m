Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A057546883
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 16:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E601132A7;
	Fri, 10 Jun 2022 14:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E85DE11327A;
 Fri, 10 Jun 2022 14:40:25 +0000 (UTC)
Received: from [192.168.2.145] (109-252-136-92.dynamic.spd-mgts.ru
 [109.252.136.92])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 83A966601719;
 Fri, 10 Jun 2022 15:40:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1654872024;
 bh=6JgrTd9VkJ1ZFFosiAo/vV8cwTThuk9Z72vQ6NWys/g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AoLXW6oXSBZwVImhJc2GgACmS9jxP2XcuDIfwZPyAahSDTWPlU1wD8yk7JJvjWsc2
 bRtW7PEsjkxYyL6DYiSQiQLBfGY6I28c6IXYBWoKS+b3ou3e+emkaBD13uUfhcbyMc
 t4Y7QprkwXCAf/16y1ntNhQzLenrm6CHAFKuzz9B/GnS11eLHlUdVSMaXE1am3becO
 2HsjdndjPfrc2INjygEllHPErAcYv8vO6XcQXpGc+iPioJk88YGxLr5+kaLuwVKeUL
 MJWGxd3oDU0Qt4wPhngT0udvhy6ensZb+rkAYM95t+RSj84huKHQwUmhFJ2AiUpThg
 e1CXYy5Aubqog==
Message-ID: <3cbc42df-fff1-5325-6c6f-17dfc6899283@collabora.com>
Date: Fri, 10 Jun 2022 17:40:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v6 00/22] Add generic memory shrinker to VirtIO-GPU and
 Panfrost DRM drivers
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>
References: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-tegra@vger.kernel.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, amd-gfx@lists.freedesktop.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, Qiang Yu <yuq825@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/27/22 02:50, Dmitry Osipenko wrote:
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
> 
> This patchset includes improvements and fixes for various things that
> I found while was working on the shrinker.
> 
> The Mesa and IGT patches will be kept on hold until this kernel series
> will be approved and merged.
> 
> This patchset was tested using Qemu and crosvm, including both cases of
> IOMMU off/on.
> 
> Mesa: https://gitlab.freedesktop.org/digetx/mesa/-/commits/virgl-madvise
> IGT:  https://gitlab.freedesktop.org/digetx/igt-gpu-tools/-/commits/virtio-madvise
>       https://gitlab.freedesktop.org/digetx/igt-gpu-tools/-/commits/panfrost-madvise
> 
> Changelog:
> 
> v6: - Added new VirtIO-related fix patch that previously was sent separately
>       and didn't get much attention:
> 
>         drm/gem: Properly annotate WW context on drm_gem_lock_reservations() error
> 
>     - Added new patch that fixes mapping of imported dma-bufs for
>       Tegra DRM and other affected drivers. It's also handy to have it
>       for switching to the new dma-buf locking convention scheme:
> 
>         drm/gem: Move mapping of imported dma-bufs to drm_gem_mmap_obj()
> 
>     - Added new patch that fixes shrinker list corruption for stable Panfrost
>       driver:
> 
>         drm/panfrost: Fix shrinker list corruption by madvise IOCTL
> 
>     - Added new minor patch-fix for drm-shmem:
> 
>         drm/shmem-helper: Add missing vunmap on error
> 
>     - Added fixes tag to the "Put mapping ..." patch like was suggested by
>       Steven Price.
> 
>     - Added new VirtIO-GPU driver improvement patch:
> 
>         drm/virtio: Return proper error codes instead of -1
> 
>     - Reworked shrinker patches like was suggested by Daniel Vetter:
> 
>         - Introduced the new locking convention for dma-bufs. Tested on
>           VirtIO-GPU, Panfrost, Lima, Tegra and Intel selftests.
> 
>         - Dropped separate purge() callback. Now single evict() does
>           everything.
> 
>         - Dropped swap_in() callback from drm-shmem objects. DRM drivers
>           now could and should restore only the required mappings.
> 
>         - Dropped dynamic counting of evictable pages. This simplifies
>           code in exchange to *potentially* burning more CPU time on OOM.
> 
> v5: - Added new for-stable patch "drm/panfrost: Put mapping instead of
>       shmem obj on panfrost_mmu_map_fault_addr() error" that corrects GEM's
>       refcounting in case of error.
> 
>     - The drm_gem_shmem_v[un]map() now takes a separate vmap_lock for
>       imported GEMs to avoid recursive locking of DMA reservations.
>       This addresses v4 comment from Thomas Zimmermann about the potential
>       deadlocking of vmapping.
> 
>     - Added ack from Thomas Zimmermann to "drm/shmem-helper: Correct
>       doc-comment of drm_gem_shmem_get_sg_table()" patch.
> 
>     - Dropped explicit shmem states from the generic shrinker patch as
>       was requested by Thomas Zimmermann.
> 
>     - Improved variable names and comments of the generic shrinker code.
> 
>     - Extended drm_gem_shmem_print_info() with the shrinker-state info in
>       the "drm/virtio: Support memory shrinking" patch.
> 
>     - Moved evict()/swap_in()/purge() callbacks from drm_gem_object_funcs
>       to drm_gem_shmem_object in the generic shrinker patch, for more
>       consistency.
> 
>     - Corrected bisectability of the patches that was broken in v4
>       by accident.
> 
>     - The virtio_gpu_plane_prepare_fb() now uses drm_gem_shmem_pin() instead
>       of drm_gem_shmem_set_unpurgeable_and_unevictable() and does it only for
>       shmem BOs in the "drm/virtio: Support memory shrinking" patch.
> 
>     - Made more functions private to drm_gem_shmem_helper.c as was requested
>       by Thomas Zimmermann. This minimizes number of the public shmem helpers.
> 
> v4: - Corrected minor W=1 warnings reported by kernel test robot for v3.
> 
>     - Renamed DRM_GEM_SHMEM_PAGES_STATE_ACTIVE/INACTIVE to PINNED/UNPINNED,
>       for more clarity.
> 
> v3: - Hardened shrinker's count() with usage of READ_ONCE() since we don't
>       use atomic type for counting and technically compiler is free to
>       re-fetch counter's variable.
> 
>     - "Correct drm_gem_shmem_get_sg_table() error handling" now uses
>       PTR_ERR_OR_ZERO(), fixing typo that was made in v2.
> 
>     - Removed obsoleted shrinker from the Panfrost driver, which I missed to
>       do in v2 by accident and Alyssa Rosenzweig managed to notice it.
> 
>     - CCed stable kernels in all patches that make fixes, even the minor ones,
>       like was suggested by Emil Velikov and added his r-b to the patches.
> 
>     - Added t-b from Steven Price to the Panfrost's shrinker patch.
> 
>     - Corrected doc-comment of drm_gem_shmem_object.madv, like was suggested
>       by Steven Price. Comment now says that madv=1 means "object is purged"
>       instead of saying that value is unused.
> 
>     - Added more doc-comments to the new shmem shrinker API.
> 
>     - The "Improve DMA API usage for shmem BOs" patch got more improvements
>       by removing the obsoleted drm_dev_set_unique() quirk and its comment.
> 
>     - Added patch that makes Virtio-GPU driver to use common dev_is_pci()
>       helper, which was suggested by Robin Murphy.
> 
>     - Added new "drm/shmem-helper: Take GEM reservation lock instead of
>       drm_gem_shmem locks" patch, which was suggested by Daniel Vetter.
> 
>     - Added new "drm/virtio: Simplify error handling of
>       virtio_gpu_object_create()" patch.
> 
>     - Improved "Correct doc-comment of drm_gem_shmem_get_sg_table()" patch,
>       like was suggested by Daniel Vetter, by saying that function returns
>       ERR_PTR() and not errno.
> 
>     - virtio_gpu_purge_object() is fenced properly now, turned out
>       virtio_gpu_notify() doesn't do fencing as I was supposing before.
>       Stress testing of memory eviction revealed that.
> 
>     - Added new patch that corrects virtio_gpu_plane_cleanup_fb() to use
>       appropriate atomic plane state.
> 
>     - SHMEM shrinker got eviction support.
> 
>     - VirtIO-GPU driver now supports memory eviction. It's enabled for a
>       non-blob GEMs only, i.e. for VirGL. The blobs don't support dynamic
>       attaching/detaching of guest's memory, so it's not trivial to enable
>       them.
> 
>     - Added patch that removes obsoleted drm_gem_shmem_purge()
> 
>     - Added patch that makes drm_gem_shmem_get_pages() private.
> 
>     - Added patch that fixes lockup on dma_resv_reserve_fences() error.
> 
> v2: - Improved shrinker by using a more fine-grained locking to reduce
>       contention during scan of objects and dropped locking from the
>       'counting' callback by tracking count of shrinkable pages. This
>       was suggested by Rob Clark in the comment to v1.
> 
>     - Factored out common shrinker code into drm_gem_shmem_helper.c
>       and switched Panfrost driver to use the new common memory shrinker.
>       This was proposed by Thomas Zimmermann in his prototype series that
>       he shared with us in the comment to v1. Note that I only compile-tested
>       the Panfrost driver.
> 
>     - Shrinker now takes object_name_lock during scan to prevent racing
>       with dma-buf exporting.
> 
>     - Shrinker now takes vmap_lock during scan to prevent racing with shmem
>       vmap/unmap code.
> 
>     - Added "Correct doc-comment of drm_gem_shmem_get_sg_table()" patch,
>       which I sent out previously as a standalone change, since the
>       drm_gem_shmem_helper.c is now touched by this patchset anyways and
>       it doesn't hurt to group all the patches together.
> 
> Dmitry Osipenko (22):
>   drm/gem: Properly annotate WW context on drm_gem_lock_reservations()
>     error
>   drm/gem: Move mapping of imported dma-bufs to drm_gem_mmap_obj()
>   drm/panfrost: Put mapping instead of shmem obj on
>     panfrost_mmu_map_fault_addr() error
>   drm/panfrost: Fix shrinker list corruption by madvise IOCTL
>   drm/virtio: Correct drm_gem_shmem_get_sg_table() error handling
>   drm/virtio: Check whether transferred 2D BO is shmem
>   drm/virtio: Unlock reservations on virtio_gpu_object_shmem_init()
>     error
>   drm/virtio: Unlock reservations on dma_resv_reserve_fences() error
>   drm/virtio: Use appropriate atomic state in
>     virtio_gpu_plane_cleanup_fb()
>   drm/shmem-helper: Add missing vunmap on error
>   drm/shmem-helper: Correct doc-comment of drm_gem_shmem_get_sg_table()
...

Thomas, do you think it will be possible for you to take the fix patches
1-11 into the drm-fixes or would you prefer me to re-send them separately?

The VirtIO patches 12-13 also are good to go into drm-next, IMO.

I'm going to factor out the new dma-buf convention into a separate
patchset, like was suggested by Christian. But it will take me some time
to get the dma-buf patches ready and I also will be on a vacation soon.

At minimum nothing should hold the fixes, so will be great if they could
land sooner.

Thank you!

-- 
Best regards,
Dmitry
