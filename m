Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 497726619A2
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 22:05:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D4C10E035;
	Sun,  8 Jan 2023 21:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1252710E035
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 21:05:08 +0000 (UTC)
Received: from workpc.. (109-252-117-89.nat.spd-mgts.ru [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1A27E6602CBA;
 Sun,  8 Jan 2023 21:05:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1673211906;
 bh=zSMRvvUXipDPdrB92livtKXWWP8DZB+V6PU+CR6yJrE=;
 h=From:To:Cc:Subject:Date:From;
 b=aQrAdMC2T48OHmOZTffhELUNaUDwuCku4foUBV5iP0tW8l0N1YYkRKqvElBBr63bm
 Xo/XGce9U6M062QFHs1IivkaW9CmlgzqjhQzv9WOEby/+3DzU9kZkdnZaIroQq1qLm
 BQC7GXZr3ZmE50OShH5x/gMGmhb2PjP7ItlTMBnZP1J7sM1YkpU68KCAFzHn1UXmv0
 saGufqm/lsNpBgHpnZdaZrp5vHFChY2rpQLbAnCvsErL+AwYCJwpOm0PHLdx2iFcoz
 CjVHIsgC/DJIlfemHM7Q2TRaGeBwokVuY9kt52PBmgKFDQfkziT4RvxP4CenHjHKIg
 CQ07IHAFVRpyA==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark <robdclark@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Herring <robh@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v10 00/11] Add generic memory shrinker to VirtIO-GPU and
 Panfrost DRM drivers
Date: Mon,  9 Jan 2023 00:04:34 +0300
Message-Id: <20230108210445.3948344-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.38.1
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

  1. Makes minor fixes for drm_gem_lru and Panfrost
  2. Brings refactoring for older code
  3. Adds common drm-shmem memory shrinker
  4. Enables shrinker for VirtIO-GPU driver
  5. Switches Panfrost driver to the common shrinker

Changelog:

v10:- Rebased on a recent linux-next.

    - Added Rob's ack to MSM "Prevent blocking within shrinker loop" patch.

    - Added Steven's ack/r-b/t-b for the Panfrost patches.

    - Fixed missing export of the new drm_gem_object_evict() function.

    - Added fixes tags to the first two patches that are making minor fixes,
      for consistency.

v9: - Replaced struct drm_gem_shmem_shrinker with drm_gem_shmem and
      moved it to drm_device, like was suggested by Thomas Zimmermann.

    - Replaced drm_gem_shmem_shrinker_register() with drmm_gem_shmem_init(),
      like was suggested by Thomas Zimmermann.

    - Moved evict() callback to drm_gem_object_funcs and added common
      drm_gem_object_evict() helper, like was suggested by Thomas Zimmermann.

    - The shmem object now is evictable by default, like was suggested by
      Thomas Zimmermann. Dropped the set_evictable/purgeble() functions
      as well, drivers will decide whether BO is evictable within theirs
      madvise IOCTL.

    - Added patches that convert drm-shmem code to use drm_WARN_ON() and
      drm_dbg_kms(), like was requested by Thomas Zimmermann.

    - Turned drm_gem_shmem_object booleans into 1-bit bit fields, like was
      suggested by Thomas Zimmermann.

    - Switched to use drm_dev->unique for the shmem shrinker name. Drivers
      don't need to specify the name explicitly anymore.

    - Re-added dma_resv_test_signaled() that was missing in v8 and also
      fixed its argument to DMA_RESV_USAGE_READ. See comment to
      dma_resv_usage_rw().

    - Added new fix for Panfrost driver that silences lockdep warning
      caused by shrinker. Both Panfrost old and new shmem shrinkers are
      affected.

v8: - Rebased on top of recent linux-next that now has dma-buf locking
      convention patches merged, which was blocking shmem shrinker before.

    - Shmem shrinker now uses new drm_gem_lru helper.

    - Dropped Steven Price t-b from the Panfrost patch because code
      changed significantly since v6 and should be re-tested.

v7: - dma-buf locking convention

v6: https://lore.kernel.org/dri-devel/20220526235040.678984-1-dmitry.osipenko@collabora.com/

Related patches:

Mesa: https://gitlab.freedesktop.org/digetx/mesa/-/commits/virgl-madvise
igt:  https://gitlab.freedesktop.org/digetx/igt-gpu-tools/-/commits/virtio-madvise
      https://gitlab.freedesktop.org/digetx/igt-gpu-tools/-/commits/panfrost-madvise

The Mesa and IGT patches will be sent out once the kernel part will land.

Dmitry Osipenko (11):
  drm/msm/gem: Prevent blocking within shrinker loop
  drm/panfrost: Don't sync rpm suspension after mmu flushing
  drm/gem: Add evict() callback to drm_gem_object_funcs
  drm/shmem: Put booleans in the end of struct drm_gem_shmem_object
  drm/shmem: Switch to use drm_* debug helpers
  drm/shmem-helper: Don't use vmap_use_count for dma-bufs
  drm/shmem-helper: Switch to reservation lock
  drm/shmem-helper: Add memory shrinker
  drm/gem: Add drm_gem_pin_unlocked()
  drm/virtio: Support memory shrinking
  drm/panfrost: Switch to generic memory shrinker

 drivers/gpu/drm/drm_gem.c                     |  54 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        | 646 +++++++++++++-----
 drivers/gpu/drm/lima/lima_gem.c               |   8 +-
 drivers/gpu/drm/msm/msm_gem_shrinker.c        |   8 +-
 drivers/gpu/drm/panfrost/Makefile             |   1 -
 drivers/gpu/drm/panfrost/panfrost_device.h    |   4 -
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  34 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c       |  30 +-
 drivers/gpu/drm/panfrost/panfrost_gem.h       |   9 -
 .../gpu/drm/panfrost/panfrost_gem_shrinker.c  | 122 ----
 drivers/gpu/drm/panfrost/panfrost_job.c       |  18 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c       |  21 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h          |  18 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c          |  52 ++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c        |  37 +
 drivers/gpu/drm/virtio/virtgpu_kms.c          |   8 +
 drivers/gpu/drm/virtio/virtgpu_object.c       | 132 +++-
 drivers/gpu/drm/virtio/virtgpu_plane.c        |  22 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c           |  40 ++
 include/drm/drm_device.h                      |  10 +-
 include/drm/drm_gem.h                         |  19 +-
 include/drm/drm_gem_shmem_helper.h            | 112 +--
 include/uapi/drm/virtgpu_drm.h                |  14 +
 23 files changed, 1010 insertions(+), 409 deletions(-)
 delete mode 100644 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c

-- 
2.38.1

