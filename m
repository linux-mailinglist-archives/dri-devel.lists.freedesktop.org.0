Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C0D50D460
	for <lists+dri-devel@lfdr.de>; Sun, 24 Apr 2022 21:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FE210ED59;
	Sun, 24 Apr 2022 19:04:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91D810ED59
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Apr 2022 19:04:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 170AB1F40651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650827073;
 bh=/Sq0CgadNuKu1m8WARXcI6mIVI1F3TUPMPGhne2Iyi8=;
 h=From:To:Cc:Subject:Date:From;
 b=QWNdN5/pw9aLq+SCp3c0MrHRjCBixX3rhMd6asCvkBIaSKHsp/qrmHo1ldjcvbkC1
 Lq9OGxlt82ZlUovwn8pBHIqt1UOoQLl7RicPC4TmzwZjH5jmWspLhYbevor4iTrWJ1
 sow0uNYDyKVuR0cOcHnZvi/NY2PbDopQaXwyQN1Q0P/b/p78yrWvImZ6Od3TfENJmq
 Qo3zCRyxkM2DheDNTgB1+ftety2Ny2vrXxUHQCcfVV371vycdvE9OpBCyy/4vU5lNz
 T97r/iX+xVpIkFh1E4c6Z9GoxfUC6W4BPmSdwTtdbzTaUB1fxVy5wcfOGL2PWqWZ0L
 RODI2AfCANO8w==
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v5 00/17] Add generic memory shrinker to VirtIO-GPU and
 Panfrost DRM drivers
Date: Sun, 24 Apr 2022 22:04:07 +0300
Message-Id: <20220424190424.540501-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Dmitry Osipenko <digetx@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patchset introduces memory shrinker for the VirtIO-GPU DRM driver.
During OOM, the shrinker will release BOs that are marked as "not needed"
by userspace using the new madvise IOCTL, it will also evict idling BOs
to SWAP. The userspace in this case is the Mesa VirGL driver, it will mark
the cached BOs as "not needed", allowing kernel driver to release memory
of the cached shmem BOs on lowmem situations, preventing OOM kills.

This patchset adds memory purging and eviction support to VirtIO-GPU driver.

The Panfrost driver is switched to use generic memory shrinker. Eviction
support will come later on, after resolving the blocker bug in Panfrost.

This patchset also includes couple improvements and fixes for various
minor things that I found while was working on the shrinker.

The Mesa and IGT patches will be kept on hold until this kernel series
will be approved and merged.

This patchset was tested using Qemu and crosvm, including both cases of
IOMMU off/on.

Mesa: https://gitlab.freedesktop.org/digetx/mesa/-/commits/virgl-madvise
IGT:  https://gitlab.freedesktop.org/digetx/igt-gpu-tools/-/commits/virtio-madvise
      https://gitlab.freedesktop.org/digetx/igt-gpu-tools/-/commits/panfrost-madvise

Changelog:

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

Dmitry Osipenko (17):
  drm/panfrost: Put mapping instead of shmem obj on
    panfrost_mmu_map_fault_addr() error
  drm/virtio: Correct drm_gem_shmem_get_sg_table() error handling
  drm/virtio: Check whether transferred 2D BO is shmem
  drm/virtio: Unlock reservations on virtio_gpu_object_shmem_init()
    error
  drm/virtio: Unlock reservations on dma_resv_reserve_fences() error
  drm/virtio: Use appropriate atomic state in
    virtio_gpu_plane_cleanup_fb()
  drm/virtio: Simplify error handling of virtio_gpu_object_create()
  drm/virtio: Improve DMA API usage for shmem BOs
  drm/virtio: Use dev_is_pci()
  drm/shmem-helper: Correct doc-comment of drm_gem_shmem_get_sg_table()
  drm/shmem-helper: Take reservation lock instead of drm_gem_shmem locks
  drm/shmem-helper: Add generic memory shrinker
  drm/virtio: Support memory shrinking
  drm/panfrost: Switch to generic memory shrinker
  drm/shmem-helper: Make drm_gem_shmem_get_pages() private
  drm/shmem-helper: Make drm_gem_shmem_is_purgeable() private
  drm/shmem-helper: Remove drm_gem_shmem_purge_locked()

 drivers/gpu/drm/drm_gem_shmem_helper.c        | 800 ++++++++++++++++--
 drivers/gpu/drm/lima/lima_gem.c               |   8 +-
 drivers/gpu/drm/panfrost/Makefile             |   1 -
 drivers/gpu/drm/panfrost/panfrost_device.h    |   4 -
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  19 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c       |  28 +-
 drivers/gpu/drm/panfrost/panfrost_gem.h       |   9 -
 .../gpu/drm/panfrost/panfrost_gem_shrinker.c  | 122 ---
 drivers/gpu/drm/panfrost/panfrost_job.c       |  18 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c       |  17 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c          |  53 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h          |  20 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c          |  50 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c        |  37 +
 drivers/gpu/drm/virtio/virtgpu_kms.c          |  16 +-
 drivers/gpu/drm/virtio/virtgpu_object.c       | 195 +++--
 drivers/gpu/drm/virtio/virtgpu_plane.c        |  28 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c           |  55 +-
 include/drm/drm_device.h                      |   4 +
 include/drm/drm_gem_shmem_helper.h            | 127 ++-
 include/uapi/drm/virtgpu_drm.h                |  14 +
 21 files changed, 1227 insertions(+), 398 deletions(-)
 delete mode 100644 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c

-- 
2.35.1

