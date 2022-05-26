Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE22C53567F
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 01:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7272610EFB9;
	Thu, 26 May 2022 23:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA1610EF99;
 Thu, 26 May 2022 23:54:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 4483D1F40874
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653609249;
 bh=I1kxpdsP20qNcPlQ3S/qdgM736mICTGXs/ZrSWQ9ttc=;
 h=From:To:Cc:Subject:Date:From;
 b=SHTmQV0zLXeImrn1UeqN8m/fhyY2ZlGh7b2rESG1aXUjlVDdXNI3FpYp6JOICoEZh
 5GQ2IQpyAa6+nUjxNM3vdRz+3PsfbOvfvICH/GRnjGtourjs7kudOWxAtn1fOSFI2c
 R+Cmmthp+WNj6cUZOnsaaoF4uEoyolk89saEo7fhwOlfATSVvHgar+q2KcmLkKQlw4
 /5kuYHnGiQH0YLWwcbnz9PEUZNMprm1gTg4gWGImZfS3MwxoibI8dRcVa3r8hbKZgf
 GV+5b/rY9nDxIHehUUckXeVTx9PGzo1xn8PLR5JL69vXvnYsi5M36LXQgDHFmJHYEw
 wNCXZkqbwXICA==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Qiang Yu <yuq825@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH v6 00/22] Add generic memory shrinker to VirtIO-GPU and
 Panfrost DRM drivers
Date: Fri, 27 May 2022 02:50:18 +0300
Message-Id: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patchset introduces memory shrinker for the VirtIO-GPU DRM driver
and adds memory purging and eviction support to VirtIO-GPU driver.

The new dma-buf locking convention is introduced here as well.

During OOM, the shrinker will release BOs that are marked as "not needed"
by userspace using the new madvise IOCTL, it will also evict idling BOs
to SWAP. The userspace in this case is the Mesa VirGL driver, it will mark
the cached BOs as "not needed", allowing kernel driver to release memory
of the cached shmem BOs on lowmem situations, preventing OOM kills.

The Panfrost driver is switched to use generic memory shrinker.

This patchset includes improvements and fixes for various things that
I found while was working on the shrinker.

The Mesa and IGT patches will be kept on hold until this kernel series
will be approved and merged.

This patchset was tested using Qemu and crosvm, including both cases of
IOMMU off/on.

Mesa: https://gitlab.freedesktop.org/digetx/mesa/-/commits/virgl-madvise
IGT:  https://gitlab.freedesktop.org/digetx/igt-gpu-tools/-/commits/virtio-madvise
      https://gitlab.freedesktop.org/digetx/igt-gpu-tools/-/commits/panfrost-madvise

Changelog:

v6: - Added new VirtIO-related fix patch that previously was sent separately
      and didn't get much attention:

        drm/gem: Properly annotate WW context on drm_gem_lock_reservations() error

    - Added new patch that fixes mapping of imported dma-bufs for
      Tegra DRM and other affected drivers. It's also handy to have it
      for switching to the new dma-buf locking convention scheme:

        drm/gem: Move mapping of imported dma-bufs to drm_gem_mmap_obj()

    - Added new patch that fixes shrinker list corruption for stable Panfrost
      driver:

        drm/panfrost: Fix shrinker list corruption by madvise IOCTL

    - Added new minor patch-fix for drm-shmem:

        drm/shmem-helper: Add missing vunmap on error

    - Added fixes tag to the "Put mapping ..." patch like was suggested by
      Steven Price.

    - Added new VirtIO-GPU driver improvement patch:

        drm/virtio: Return proper error codes instead of -1

    - Reworked shrinker patches like was suggested by Daniel Vetter:

        - Introduced the new locking convention for dma-bufs. Tested on
          VirtIO-GPU, Panfrost, Lima, Tegra and Intel selftests.

        - Dropped separate purge() callback. Now single evict() does
          everything.

        - Dropped swap_in() callback from drm-shmem objects. DRM drivers
          now could and should restore only the required mappings.

        - Dropped dynamic counting of evictable pages. This simplifies
          code in exchange to *potentially* burning more CPU time on OOM.

v5: - Added new for-stable patch "drm/panfrost: Put mapping instead of
      shmem obj on panfrost_mmu_map_fault_addr() error" that corrects GEM's
      refcounting in case of error.

    - The drm_gem_shmem_v[un]map() now takes a separate vmap_lock for
      imported GEMs to avoid recursive locking of DMA reservations.
      This addresses v4 comment from Thomas Zimmermann about the potential
      deadlocking of vmapping.

    - Added ack from Thomas Zimmermann to "drm/shmem-helper: Correct
      doc-comment of drm_gem_shmem_get_sg_table()" patch.

    - Dropped explicit shmem states from the generic shrinker patch as
      was requested by Thomas Zimmermann.

    - Improved variable names and comments of the generic shrinker code.

    - Extended drm_gem_shmem_print_info() with the shrinker-state info in
      the "drm/virtio: Support memory shrinking" patch.

    - Moved evict()/swap_in()/purge() callbacks from drm_gem_object_funcs
      to drm_gem_shmem_object in the generic shrinker patch, for more
      consistency.

    - Corrected bisectability of the patches that was broken in v4
      by accident.

    - The virtio_gpu_plane_prepare_fb() now uses drm_gem_shmem_pin() instead
      of drm_gem_shmem_set_unpurgeable_and_unevictable() and does it only for
      shmem BOs in the "drm/virtio: Support memory shrinking" patch.

    - Made more functions private to drm_gem_shmem_helper.c as was requested
      by Thomas Zimmermann. This minimizes number of the public shmem helpers.

v4: - Corrected minor W=1 warnings reported by kernel test robot for v3.

    - Renamed DRM_GEM_SHMEM_PAGES_STATE_ACTIVE/INACTIVE to PINNED/UNPINNED,
      for more clarity.

v3: - Hardened shrinker's count() with usage of READ_ONCE() since we don't
      use atomic type for counting and technically compiler is free to
      re-fetch counter's variable.

    - "Correct drm_gem_shmem_get_sg_table() error handling" now uses
      PTR_ERR_OR_ZERO(), fixing typo that was made in v2.

    - Removed obsoleted shrinker from the Panfrost driver, which I missed to
      do in v2 by accident and Alyssa Rosenzweig managed to notice it.

    - CCed stable kernels in all patches that make fixes, even the minor ones,
      like was suggested by Emil Velikov and added his r-b to the patches.

    - Added t-b from Steven Price to the Panfrost's shrinker patch.

    - Corrected doc-comment of drm_gem_shmem_object.madv, like was suggested
      by Steven Price. Comment now says that madv=1 means "object is purged"
      instead of saying that value is unused.

    - Added more doc-comments to the new shmem shrinker API.

    - The "Improve DMA API usage for shmem BOs" patch got more improvements
      by removing the obsoleted drm_dev_set_unique() quirk and its comment.

    - Added patch that makes Virtio-GPU driver to use common dev_is_pci()
      helper, which was suggested by Robin Murphy.

    - Added new "drm/shmem-helper: Take GEM reservation lock instead of
      drm_gem_shmem locks" patch, which was suggested by Daniel Vetter.

    - Added new "drm/virtio: Simplify error handling of
      virtio_gpu_object_create()" patch.

    - Improved "Correct doc-comment of drm_gem_shmem_get_sg_table()" patch,
      like was suggested by Daniel Vetter, by saying that function returns
      ERR_PTR() and not errno.

    - virtio_gpu_purge_object() is fenced properly now, turned out
      virtio_gpu_notify() doesn't do fencing as I was supposing before.
      Stress testing of memory eviction revealed that.

    - Added new patch that corrects virtio_gpu_plane_cleanup_fb() to use
      appropriate atomic plane state.

    - SHMEM shrinker got eviction support.

    - VirtIO-GPU driver now supports memory eviction. It's enabled for a
      non-blob GEMs only, i.e. for VirGL. The blobs don't support dynamic
      attaching/detaching of guest's memory, so it's not trivial to enable
      them.

    - Added patch that removes obsoleted drm_gem_shmem_purge()

    - Added patch that makes drm_gem_shmem_get_pages() private.

    - Added patch that fixes lockup on dma_resv_reserve_fences() error.

v2: - Improved shrinker by using a more fine-grained locking to reduce
      contention during scan of objects and dropped locking from the
      'counting' callback by tracking count of shrinkable pages. This
      was suggested by Rob Clark in the comment to v1.

    - Factored out common shrinker code into drm_gem_shmem_helper.c
      and switched Panfrost driver to use the new common memory shrinker.
      This was proposed by Thomas Zimmermann in his prototype series that
      he shared with us in the comment to v1. Note that I only compile-tested
      the Panfrost driver.

    - Shrinker now takes object_name_lock during scan to prevent racing
      with dma-buf exporting.

    - Shrinker now takes vmap_lock during scan to prevent racing with shmem
      vmap/unmap code.

    - Added "Correct doc-comment of drm_gem_shmem_get_sg_table()" patch,
      which I sent out previously as a standalone change, since the
      drm_gem_shmem_helper.c is now touched by this patchset anyways and
      it doesn't hurt to group all the patches together.

Dmitry Osipenko (22):
  drm/gem: Properly annotate WW context on drm_gem_lock_reservations()
    error
  drm/gem: Move mapping of imported dma-bufs to drm_gem_mmap_obj()
  drm/panfrost: Put mapping instead of shmem obj on
    panfrost_mmu_map_fault_addr() error
  drm/panfrost: Fix shrinker list corruption by madvise IOCTL
  drm/virtio: Correct drm_gem_shmem_get_sg_table() error handling
  drm/virtio: Check whether transferred 2D BO is shmem
  drm/virtio: Unlock reservations on virtio_gpu_object_shmem_init()
    error
  drm/virtio: Unlock reservations on dma_resv_reserve_fences() error
  drm/virtio: Use appropriate atomic state in
    virtio_gpu_plane_cleanup_fb()
  drm/shmem-helper: Add missing vunmap on error
  drm/shmem-helper: Correct doc-comment of drm_gem_shmem_get_sg_table()
  drm/virtio: Simplify error handling of virtio_gpu_object_create()
  drm/virtio: Improve DMA API usage for shmem BOs
  dma-buf: Introduce new locking convention
  drm/shmem-helper: Don't use vmap_use_count for dma-bufs
  drm/shmem-helper: Use reservation lock
  drm/shmem-helper: Add generic memory shrinker
  drm/gem: Add drm_gem_pin_unlocked()
  drm/virtio: Support memory shrinking
  drm/virtio: Use dev_is_pci()
  drm/virtio: Return proper error codes instead of -1
  drm/panfrost: Switch to generic memory shrinker

 drivers/dma-buf/dma-buf.c                     | 270 ++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   6 +-
 drivers/gpu/drm/drm_client.c                  |   4 +-
 drivers/gpu/drm/drm_gem.c                     |  69 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c  |   6 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        | 718 ++++++++++++++----
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  10 +-
 drivers/gpu/drm/lima/lima_gem.c               |   8 +-
 drivers/gpu/drm/lima/lima_sched.c             |   4 +-
 drivers/gpu/drm/panfrost/Makefile             |   1 -
 drivers/gpu/drm/panfrost/panfrost_device.h    |   4 -
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  26 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c       |  33 +-
 drivers/gpu/drm/panfrost/panfrost_gem.h       |   9 -
 .../gpu/drm/panfrost/panfrost_gem_shrinker.c  | 122 ---
 drivers/gpu/drm/panfrost/panfrost_job.c       |  18 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c       |  21 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |   6 +-
 drivers/gpu/drm/qxl/qxl_object.c              |  17 +-
 drivers/gpu/drm/qxl/qxl_prime.c               |   4 +-
 drivers/gpu/drm/tegra/gem.c                   |   4 +
 drivers/gpu/drm/virtio/virtgpu_drv.c          |  53 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h          |  23 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c          |  59 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c        |  37 +
 drivers/gpu/drm/virtio/virtgpu_kms.c          |  16 +-
 drivers/gpu/drm/virtio/virtgpu_object.c       | 203 +++--
 drivers/gpu/drm/virtio/virtgpu_plane.c        |  28 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c           |  61 +-
 .../common/videobuf2/videobuf2-dma-contig.c   |  11 +-
 .../media/common/videobuf2/videobuf2-dma-sg.c |  11 +-
 .../common/videobuf2/videobuf2-vmalloc.c      |  11 +-
 include/drm/drm_device.h                      |   4 +
 include/drm/drm_gem.h                         |   6 +
 include/drm/drm_gem_shmem_helper.h            |  99 ++-
 include/linux/dma-buf.h                       |  14 +-
 include/uapi/drm/virtgpu_drm.h                |  14 +
 37 files changed, 1349 insertions(+), 661 deletions(-)
 delete mode 100644 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c

-- 
2.35.3

