Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D236261DFA8
	for <lists+dri-devel@lfdr.de>; Sun,  6 Nov 2022 00:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E1A310E17B;
	Sat,  5 Nov 2022 23:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6760210E17B
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Nov 2022 23:29:03 +0000 (UTC)
Received: from dimapc.. (109-252-117-140.nat.spd-mgts.ru [109.252.117.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 95158660238B;
 Sat,  5 Nov 2022 23:28:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667690941;
 bh=HY3jByZOhIouY34XB68EiSAMQWVk92uiCiyD+1rVWoc=;
 h=From:To:Cc:Subject:Date:From;
 b=Hlx8GuJfaALO5LgKJC9VAc76F84DLXDaUgW1ytwSU/0+3CCpiuJbzErfB/YfRCJph
 5aEWQZweA2Z2h3c8s2Z1PMtDsotCXTYzyIjD0UQDuX8aBFzjjRsM/zVM5QcIMgg6nk
 ayzfiAtRJFl2dEyXxaRW2CS6REyU/0jp72qXH4tkx4sL7bhZUqVZ0P9bgzvx3EKKY9
 sBd+eapxhMt02ZIOlNDcrau14SGStR3qznRxBQgkfeBYXkJ1eY6vgZjSQBVrN+kMpM
 OQ4it0siEorvr0S5vvB5iA+xTbfpGRXn22v9Zvl0T5eYAHVPtPxV/7yXochXIwH35E
 xUDpObMozLH6Q==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
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
Subject: [PATCH v8 0/7] Add generic memory shrinker to VirtIO-GPU and Panfrost
 DRM drivers
Date: Sun,  6 Nov 2022 02:27:12 +0300
Message-Id: <20221105232719.302619-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.3
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
Cc: Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series:

  1. Adds common drm-shmem memory shrinker
  2. Enables shrinker for VirtIO-GPU driver
  3. Switches Panfrost driver to the common shrinker

Related patches:

Mesa: https://gitlab.freedesktop.org/digetx/mesa/-/commits/virgl-madvise
igt:  https://gitlab.freedesktop.org/digetx/igt-gpu-tools/-/commits/virtio-madvise
      https://gitlab.freedesktop.org/digetx/igt-gpu-tools/-/commits/panfrost-madvise

I'll upstream Mesa and igt patches once kernel part will be merged.

Changelog:

v8: - Rebased on top of recent linux-next that now has dma-buf locking
      convention patches merged, which was blocking shmem shrinker before.

    - Shmem shrinker now uses new drm_gem_lru helper.

    - Dropped Steven Price t-b from the Panfrost patch because code
      changed significantly since v6 and should be re-tested.

v7: - dma-buf locking convention

v6: https://lore.kernel.org/dri-devel/20220526235040.678984-1-dmitry.osipenko@collabora.com/

Dmitry Osipenko (7):
  drm/msm/gem: Prevent blocking within shrinker loop
  drm/shmem-helper: Don't use vmap_use_count for dma-bufs
  drm/shmem-helper: Switch to reservation lock
  drm/shmem-helper: Add memory shrinker
  drm/gem: Add drm_gem_pin_unlocked()
  drm/virtio: Support memory shrinking
  drm/panfrost: Switch to generic memory shrinker

 drivers/gpu/drm/drm_gem.c                     |  38 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        | 648 ++++++++++++++----
 drivers/gpu/drm/lima/lima_gem.c               |   8 +-
 drivers/gpu/drm/msm/msm_gem_shrinker.c        |   8 +-
 drivers/gpu/drm/panfrost/Makefile             |   1 -
 drivers/gpu/drm/panfrost/panfrost_device.h    |   4 -
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  26 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c       |  33 +-
 drivers/gpu/drm/panfrost/panfrost_gem.h       |   9 -
 .../gpu/drm/panfrost/panfrost_gem_shrinker.c  | 122 ----
 drivers/gpu/drm/panfrost/panfrost_job.c       |  18 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c       |  19 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h          |  18 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c          |  55 ++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c        |  37 +
 drivers/gpu/drm/virtio/virtgpu_kms.c          |   9 +
 drivers/gpu/drm/virtio/virtgpu_object.c       | 138 +++-
 drivers/gpu/drm/virtio/virtgpu_plane.c        |  22 +-
 drivers/gpu/drm/virtio/virtgpu_vq.c           |  40 ++
 include/drm/drm_device.h                      |   4 +
 include/drm/drm_gem.h                         |   7 +-
 include/drm/drm_gem_shmem_helper.h            |  99 ++-
 include/uapi/drm/virtgpu_drm.h                |  14 +
 23 files changed, 1003 insertions(+), 374 deletions(-)
 delete mode 100644 drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c

-- 
2.37.3

