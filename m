Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1B35623D8
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 22:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6AA912B1A2;
	Thu, 30 Jun 2022 20:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB06C12B19D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 20:07:53 +0000 (UTC)
Received: from dimapc.. (109-252-118-164.nat.spd-mgts.ru [109.252.118.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BC295660196E;
 Thu, 30 Jun 2022 21:07:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1656619672;
 bh=fQe6WVtNw91cgalOE6ap7AAoTYhUnv0DEj4h8o7y0kg=;
 h=From:To:Cc:Subject:Date:From;
 b=I4mOxE+b3FLSxEWjlF5GUcaaFgE19c4EftxLhQyBqemag+g0287kinB/kLyArR+v+
 lIr182adlq+d/xUwX1iIJ8jhw+78J5C5eu1T3h5FpbrUOSTdD+VT2Q0rAca9uDWBDK
 RD+478eFmLtPN2wuTV29IOWC0ExD/KpIaA4EXCP7Pb4H1ZX1UlUnuIR/Gw93F3Blhc
 2n2iQTJKQpPlf/r97QphltQUx1Ikbv/lGdOM2qtr367DFCvJs24sCXeySUeRLbiOr3
 4L9D8rLbLdxhCaXpmcjTiWSAZYcFnxOnhrC/p4D8ETGhB83T5iBsIhNMfUJ3vDSLdZ
 t+8h4nyhmHDnA==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>
Subject: [PATCH v7 0/9] VirtIO-GPU driver fixes and improvements
Date: Thu, 30 Jun 2022 23:07:17 +0300
Message-Id: <20220630200726.1884320-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This series fixes few problem found in the VirtIO-GPU driver and makes
couple improvements. The "DMA API usage improvement" patch will be needed
later on when we will be about to add memory shrinker support to the driver,
it also cleans up code nicely.

Changelog:

v7: - Factored out VirtIO fixes from [1] since I'll be working on the
      dma-buf locking in a separate patchset now.

[1] https://lore.kernel.org/all/20220526235040.678984-1-dmitry.osipenko@collabora.com/

    - Added r-b from Thomas Hellström.

    - Added more fixes-tags to the patches.

    - The part of the v6 "Correct drm_gem_shmem_get_sg_table() error handling"
      patch got merged into linux-next recent from another patch [2],
      but that patch missed to zero out shmem->pages on error. Hence I
      updated my patch to fix the merged fix.

[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c24968734abfed81c8f93dc5f44a7b7a9aecadfa

Dmitry Osipenko (9):
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
  drm/virtio: Return proper error codes instead of -1

 drivers/gpu/drm/virtio/virtgpu_drv.c    | 53 +++++---------------
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  5 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c    |  4 +-
 drivers/gpu/drm/virtio/virtgpu_kms.c    |  7 ++-
 drivers/gpu/drm/virtio/virtgpu_object.c | 65 ++++++-------------------
 drivers/gpu/drm/virtio/virtgpu_plane.c  |  6 +--
 drivers/gpu/drm/virtio/virtgpu_vq.c     | 21 ++++----
 7 files changed, 47 insertions(+), 114 deletions(-)

-- 
2.36.1

