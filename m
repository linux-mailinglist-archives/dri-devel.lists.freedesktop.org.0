Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AF34FC727
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 00:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A9410E0B5;
	Mon, 11 Apr 2022 22:00:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE9110E094
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 22:00:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id D34901F438CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649714416;
 bh=Zj0A0fzxQ/xiG7S0M9AkB26np2h8FJSwI3psIJC6OpA=;
 h=From:To:Cc:Subject:Date:From;
 b=AKYKzBKVRM1S6hljeMY2MZq/UIptbjzgUzGtK+D2RameAmAnV7Hqi60m0Z5T52Sft
 CSUL2Syf5v29005sBZOChCfaWLa8ISstlTpP52fxk5+beKvsjSZPZQLzOKpH2iPmED
 1WCrtMzsoKIB2Cr7s/xKWU1Yi4jpF6yxvPLjXo9FC7/uLdwjXVD0qco/ak6yyhWghK
 QQokW7YH9nStl3L4az327DFZn2HKUv4w+irhyysJdvUJDpvBXWcKvfXe229CwoD0sV
 fUd6xY42kxfUr1UObzSGY/CP84JGzQKa8gJwRnkiEEQ9VfmNJdajIumuf/YvY3WrGZ
 7xvQk8RFcQRLw==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>
Subject: [PATCH v3 00/15] Add generic memory shrinker to VirtIO-GPU and
 Panfrost DRM drivers
Date: Tue, 12 Apr 2022 00:59:22 +0300
Message-Id: <20220411215937.281655-1-dmitry.osipenko@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>
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

Dmitry Osipenko (15):
  drm/virtio: Correct drm_gem_shmem_get_sg_table() error handling
  drm/virtio: Check whether transferred 2D BO is shmem
  drm/virtio: Unlock GEM reservations on virtio_gpu_object_shmem_init()
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
  drm/shmem-helper: Remove drm_gem_shmem_purge()

 drivers/gpu/drm/drm_gem_shmem_helper.c        | 815 ++++++++++++++++--
 drivers/gpu/drm/lima/lima_gem.c               |   8 +-
 drivers/gpu/drm/panfrost/Makefile             |   1 -
 drivers/gpu/drm/panfrost/panfrost_device.h    |   4 -
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  19 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c       |  30 +-
 drivers/gpu/drm/panfrost/panfrost_gem.h       |   9 -
 .../gpu/drm/panfrost/panfrost_gem_shrinker.c  | 122 ---
 drivers/gpu/drm/panfrost/panfrost_job.c       |  18 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c       |  15 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c          |  53 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h          |  20 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c          |  50 +-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c        |  37 +
 drivers/gpu/drm/virtio/virtgpu_kms.c          |  16 +-
 drivers/gpu/drm/virtio/virtgpu_object.c       | 204 +++--
 drivers/gpu/drm/virtio/virtgpu_plane.c        |  23 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c           |  55 +-
 include/drm/drm_device.h                      |   4 +
 include/drm/drm_gem.h                         |  35 +
 include/drm/drm_gem_shmem_helper.h            | 114 ++-
 include/uapi/drm/virtgpu_drm.h                |  14 +
 22 files changed, 1278 insertions(+), 388 deletions(-)
 delete mode 100644 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c

-- 
2.35.1

