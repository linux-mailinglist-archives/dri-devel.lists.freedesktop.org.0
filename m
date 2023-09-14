Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E77FC7A11AF
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 01:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2B310E14D;
	Thu, 14 Sep 2023 23:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D948F10E14D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 23:28:57 +0000 (UTC)
Received: from workpc.. (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 121316607346;
 Fri, 15 Sep 2023 00:28:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1694734136;
 bh=/LKbx1rP6xdPUE67bARCVL0MUAfs+uHRw9zpOlZewF8=;
 h=From:To:Cc:Subject:Date:From;
 b=PEeGU18Gbonz85N/EQMNph8flI4wlC3ad0Vw17X2i/LR0nUlvMkPY3wtiqs31Nc5W
 9pRq4HGvF6yRgtPk5RQBaB3fQi35Zu3rCUNuciYCOrqyFWKNr0L1LtWJMcUeX8tieq
 VPhVQCi/z3+rmZLw0/X5sGBxRfxVSz8oUH+fGSyFxXau2pbVdOVJmfggkbkC79KIx3
 4c09dM1VBnGoNNCnpO/dH9id8VRS0zb5PEIt9qsIv2rsTnGDg4YXe4sUnOKhZrv7op
 VGuZT/YRaBBrOnNXzexaVS06GX8oFpy9+9eeidklOr8ckHvoQHwbTUgbSKj04e5TPN
 XBKOErCxbhhew==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>
Subject: [PATCH v17 00/18] Add generic memory shrinker to VirtIO-GPU and
 Panfrost DRM drivers
Date: Fri, 15 Sep 2023 02:27:03 +0300
Message-ID: <20230914232721.408581-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.41.0
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series:

  1. Adds common drm-shmem memory shrinker
  2. Enables shrinker for VirtIO-GPU driver
  3. Switches Panfrost driver to the common shrinker
  4. Fixes bugs and improves drm-shmem code

Mesa: https://gitlab.freedesktop.org/digetx/mesa/-/commits/virgl-madvise
IGT:  https://gitlab.freedesktop.org/digetx/igt-gpu-tools/-/commits/virtio-madvise
      https://gitlab.freedesktop.org/digetx/igt-gpu-tools/-/commits/panfrost-madvise

Changelog:

v17:- Dropped patches that added new drm-shmem sgt flags, fixing dma-buf UAF
      in drm-prime error code path and preventing invalid page_count when GEM
      is freed. Will revist them later on and then factor them out into a
      seprate patchset.

    - Dropped patches that replaced drm_gem_shmem_free() with
      drm_gem_object_put(), they not needed anymore after changing
      drm_gem_shmem_free() to not touch reservation lock.

    - Addressed review comments from Boris Brezillon:

        - Added new patch to clean up error unwinding in
          drm_gem_shmem_vmap_locked()

        - Added new __drm_gem_shmem_put_pages() to let the callers
          to assert the held reservation lock themselves

        - Moved replacement of shmem->pages check with refcount_read()
          in drm_gem_shmem_free() to the shrinker addition patch

        - Improved commit message of the vmap_use_count patch

    - Added r-bs from Boris Brezillon that he gave to v16

v16:- Added more comments to the code for the new drm-shmem flags

    - Added r-bs from Boris Brezillon

    - Fixed typos and made impovements pointed out by Boris Brezillon

    - Replaced kref with refcount_t as was suggested by Boris Brezillon

    - Corrected placement of got_sgt flag in the Lima driver, also renamed
      flag to got_pages_sgt

    - Removed drm_gem_shmem_resv_assert_held() and made drm_gem_shmem_free()
      to free pages without a new func that doesn't touch resv lock, as was
      suggested by Boris Brezillon

    - Added pages_pin_count to drm_gem_shmem_print_info()

v15:- Moved drm-shmem reference counters to use kref that allows to
      optimize unlocked functions, like was suggested by Boris Brezillon.

    - Changed drm/gem/shmem function names to use _locked postfix and
      dropped the _unlocked, making the naming scheme consistent across
      DRM code, like was suggested by Boris Brezillon.

    - Added patch that fixes UAF in drm-shmem for drivers that import
      dma-buf and then release buffer in the import error code path.

    - Added patch that makes drm-shmem use new flag for SGT's get_pages()
      refcounting, preventing unbalanced refcounting when GEM is freed.

    - Fixed guest blob pinning in virtio-gpu driver that was missed
      previously in the shrinker patch.

    - Moved VC4 and virtio-gpu drivers to use drm_gem_put() in
      GEM-creation error code paths, which is now required by drm-shmem
      and was missed in a previous patch versions.

    - Virtio-GPU now attaches shmem pages to host on first use and not
      when BO is created. In older patch versions there was a potential
      race condition in the BO creation code path where both
      get_sgt()+object_attach() should've been made under same resv lock,
      otherwise pages could be evicted before attachment is invoked.

    - Virtio-GPU and drm-shmem shrinker patches are split into smaller
      ones.

v14:- All the prerequisite reservation locking patches landed upstream,
      previously were a part of this series in v13 and older.

        https://lore.kernel.org/dri-devel/20230529223935.2672495-1-dmitry.osipenko@collabora.com/

    - Added patches to improve locked/unlocked function names, like was
      suggested by Boris Brezillon for v13.

    - Made all exported drm-shmem symbols GPL, like was previously
      discussed with Thomas Zimmermann on this series.

    - Improved virtio-gpu shrinker patch. Now it won't detach purged BO
      when userspace closes GEM. Crosvm (and not qemu) checks res_id on
      CMD_CTX_DETACH_RESOURCE and prints noisy error message if ID is
      invalid, which wasn't noticed before.

v13:- Updated virtio-gpu shrinker patch to use drm_gem_shmem_object_pin()
      directly instead of drm_gem_pin() and dropped patch that exported
      drm_gem_pin() functions, like was requested by Thomas Zimmermann in
      v12.

v12:- Fixed the "no previous prototype for function" warning reported by
      kernel build bot for v11.

    - Fixed the missing reservation lock reported by Intel CI for VGEM
      driver. Other drivers using drm-shmem were affected similarly to
      VGEM. The problem was in the dma-buf attachment code path that led
      to drm-shmem pinning function which assumed the held reservation lock
      by drm_gem_pin(). In the past that code path was causing trouble for
      i915 driver and we've changed the locking scheme for the attachment
      code path in the dma-buf core to let exporters to handle the locking
      themselves. After a closer investigation, I realized that my assumption
      about testing of dma-buf export code path using Panfrost driver was
      incorrect. Now I created additional local test to exrecise the Panfrost
      export path. I also reproduced the issue reported by the Intel CI for
      v10. It's all fixed now by making the drm_gem_shmem_pin() to take the
      resv lock by itself.

    - Patches are based on top of drm-tip, CC'd intel-gfx CI for testing.

v11:- Rebased on a recent linux-next. Added new patch as a result:

        drm/shmem-helper: Export drm_gem_shmem_get_pages_sgt_locked()

        It's needed by the virtio-gpu driver to swap-in/unevict shmem
        object, previously get_pages_sgt() didn't use locking.

    - Separated the "Add memory shrinker" patch into smaller parts to ease
      the reviewing, as was requested by Thomas Zimmermann:

        drm/shmem-helper: Factor out pages alloc/release from
          drm_gem_shmem_get/put_pages()
        drm/shmem-helper: Add pages_pin_count field
        drm/shmem-helper: Switch drm_gem_shmem_vmap/vunmap to use pin/unpin
        drm/shmem-helper: Factor out unpinning part from drm_gem_shmem_purge()

    - Addessed the v10 review comments from Thomas Zimmermann: return errno
      instead of bool, sort code alphabetically, rename function and etc
      minor changes.

    - Added new patch to remove the "map->is_iomem" from drm-shmem, as
      was suggested by Thomas Zimmermann.

    - Added acks and r-b's that were given to v10.

v10:- Was partially applied to misc-fixes/next.

      https://lore.kernel.org/dri-devel/6c16f303-81df-7ebe-85e9-51bb40a8b301@collabora.com/T/

Dmitry Osipenko (18):
  drm/gem: Change locked/unlocked postfix of drm_gem_v/unmap() function
    names
  drm/gem: Add _locked postfix to functions that have unlocked
    counterpart
  drm/shmem-helper: Make all exported symbols GPL
  drm/shmem-helper: Refactor locked/unlocked functions
  drm/shmem-helper: Remove obsoleted is_iomem test
  drm/shmem-helper: Add and use pages_pin_count
  drm/shmem-helper: Use refcount_t for pages_use_count
  drm/shmem-helper: Add and use lockless drm_gem_shmem_get_pages()
  drm/shmem-helper: Switch drm_gem_shmem_vmap/vunmap to use pin/unpin
  drm/shmem-helper: Use refcount_t for vmap_use_count
  drm/shmem-helper: Improve drm_gem_shmem_vmap_locked() error handling
  drm/shmem-helper: Prepare drm_gem_shmem_free() to shrinker addition
  drm/shmem-helper: Add memory shrinker
  drm/shmem-helper: Export drm_gem_shmem_get_pages_sgt_locked()
  drm/virtio: Pin display framebuffer BO
  drm/virtio: Attach shmem BOs dynamically
  drm/virtio: Support memory shrinking
  drm/panfrost: Switch to generic memory shrinker

 drivers/gpu/drm/drm_client.c                  |   6 +-
 drivers/gpu/drm/drm_gem.c                     |  26 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c  |   6 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        | 588 +++++++++++++++---
 drivers/gpu/drm/drm_internal.h                |   4 +-
 drivers/gpu/drm/drm_prime.c                   |   4 +-
 drivers/gpu/drm/lima/lima_gem.c               |  10 +-
 drivers/gpu/drm/lima/lima_sched.c             |   4 +-
 drivers/gpu/drm/panfrost/Makefile             |   1 -
 drivers/gpu/drm/panfrost/panfrost_device.h    |   4 -
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  29 +-
 drivers/gpu/drm/panfrost/panfrost_dump.c      |   4 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c       |  36 +-
 drivers/gpu/drm/panfrost/panfrost_gem.h       |   9 -
 .../gpu/drm/panfrost/panfrost_gem_shrinker.c  | 122 ----
 drivers/gpu/drm/panfrost/panfrost_job.c       |  18 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c       |   4 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |   6 +-
 drivers/gpu/drm/v3d/v3d_bo.c                  |   4 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h          |  22 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c          |  80 +++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c        |  57 +-
 drivers/gpu/drm/virtio/virtgpu_kms.c          |   8 +
 drivers/gpu/drm/virtio/virtgpu_object.c       | 145 ++++-
 drivers/gpu/drm/virtio/virtgpu_plane.c        |  17 +-
 drivers/gpu/drm/virtio/virtgpu_submit.c       |  15 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c           |  40 ++
 include/drm/drm_device.h                      |  10 +-
 include/drm/drm_gem.h                         |   6 +-
 include/drm/drm_gem_shmem_helper.h            | 127 +++-
 include/uapi/drm/virtgpu_drm.h                |  14 +
 31 files changed, 1050 insertions(+), 376 deletions(-)
 delete mode 100644 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c

-- 
2.41.0

