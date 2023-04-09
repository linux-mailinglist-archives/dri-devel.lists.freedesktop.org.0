Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4923A6DBFDC
	for <lists+dri-devel@lfdr.de>; Sun,  9 Apr 2023 14:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9388710E170;
	Sun,  9 Apr 2023 12:40:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271AE10E150
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Apr 2023 12:40:41 +0000 (UTC)
Received: from workpc.. (109-252-119-170.nat.spd-mgts.ru [109.252.119.170])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EB7D066020BC;
 Sun,  9 Apr 2023 13:40:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681044039;
 bh=bPrSkwuEqRmI1vpmXrQbCoxtf7GIDRJuWjcQetr4Ejo=;
 h=From:To:Cc:Subject:Date:From;
 b=DcOzSPwDRjPPSx1bIPWUZVUzmeVK3QIQS2tNITDWtR8fM1mOqn7BX9qLB0FInPYaX
 4Tg2GQFL0a1CGQfxnh4SkIyWaarmdWRFPjS9T4q4N/dTr37aQvHhYV4qxDpzTtbjob
 184tBIIuTrlC3bu3PoN9hWGTRWEYIQKplT1exevA1AUJkqaPDlitMh9+/XXJA0RGDB
 uEn2lJzW/dtHwdzvvacewM5hFlU0X1kDsYbEAsTDotNP2deH7FFEK7Uo3XIO3kUL0C
 eYO0CYrHoopc716vVzG6zZEC6vdi1Qh2x4HXNN/3sMuM1Tks6Vg1wTQ4LiUmrER5rX
 mJ6CDw6TNa3ng==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Emil Velikov <emil.velikov@collabora.com>
Subject: [PATCH v5 0/3] Add sync object UAPI support to VirtIO-GPU driver
Date: Sun,  9 Apr 2023 15:39:54 +0300
Message-Id: <20230409123957.29553-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.39.2
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

We have multiple Vulkan context types that are awaiting for the addition
of the sync object DRM UAPI support to the VirtIO-GPU kernel driver:

 1. Venus context
 2. Native contexts (virtio-freedreno, virtio-intel, virtio-amdgpu)

Mesa core supports DRM sync object UAPI, providing Vulkan drivers with a
generic fencing implementation that we want to utilize.

This patch adds initial sync objects support. It creates fundament for a
further fencing improvements. Later on we will want to extend the VirtIO-GPU
fencing API with passing fence IDs to host for waiting, it will be a new
additional VirtIO-GPU IOCTL and more. Today we have several VirtIO-GPU context
drivers in works that require VirtIO-GPU to support sync objects UAPI.

The patch is heavily inspired by the sync object UAPI implementation of the
MSM driver.

Changelog:

v5: - Factored out dma-fence unwrap API usage into separate patch as was
      suggested by Emil Velikov.

    - Improved and documented the job submission reorderings as was
      requested by Emil Velikov. Sync file FD is now installed after
      job is submitted to virtio to further optimize reorderings.

    - Added comment for the kvalloc, as was requested by Emil Velikov.

    - The num_in/out_syncobjs now is set only after completed parsing
      of pre/post deps, as was requested by Emil Velikov.

v4: - Added r-b from Rob Clark to the "refactoring" patch.

    - Replaced for/while(ptr && itr) with if (ptr), like was suggested by
      Rob Clark.

    - Dropped NOWARN and NORETRY GFP flags and switched syncobj patch
      to use kvmalloc.

    - Removed unused variables from syncobj patch that were borrowed by
      accident from another (upcoming) patch after one of git rebases.

v3: - Switched to use dma_fence_unwrap_for_each(), like was suggested by
      Rob Clark.

    - Fixed missing dma_fence_put() in error code path that was spotted by
      Rob Clark.

    - Removed obsoleted comment to virtio_gpu_execbuffer_ioctl(), like was
      suggested by Rob Clark.

v2: - Fixed chain-fence context matching by making use of
      dma_fence_chain_contained().

    - Fixed potential uninitialized var usage in error code patch of
      parse_post_deps(). MSM driver had a similar issue that is fixed
      already in upstream.

    - Added new patch that refactors job submission code path. I found
      that it was very difficult to add a new/upcoming host-waits feature
      because of how variables are passed around the code, the virtgpu_ioctl.c
      also was growing to unmanageable size.

Dmitry Osipenko (3):
  drm/virtio: Refactor and optimize job submission code path
  drm/virtio: Wait for each dma-fence of in-fence array individually
  drm/virtio: Support sync objects

 drivers/gpu/drm/virtio/Makefile         |   2 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c    |   3 +-
 drivers/gpu/drm/virtio/virtgpu_drv.h    |   4 +
 drivers/gpu/drm/virtio/virtgpu_ioctl.c  | 182 --------
 drivers/gpu/drm/virtio/virtgpu_submit.c | 525 ++++++++++++++++++++++++
 include/uapi/drm/virtgpu_drm.h          |  16 +-
 6 files changed, 547 insertions(+), 185 deletions(-)
 create mode 100644 drivers/gpu/drm/virtio/virtgpu_submit.c

-- 
2.39.2

