Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E84A5758BE
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 02:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7DF10EA0D;
	Fri, 15 Jul 2022 00:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9749A10E5AB;
 Fri, 15 Jul 2022 00:53:19 +0000 (UTC)
Received: from dimapc.. (109-252-119-232.nat.spd-mgts.ru [109.252.119.232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 56DEA6601A44;
 Fri, 15 Jul 2022 01:53:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657846397;
 bh=08a2nboQlEuWwlfAHFXkuoQn5obKyHZ/ZVFgCHrEt8s=;
 h=From:To:Cc:Subject:Date:From;
 b=VsAEIkbATEnA4Nbk3aERHQn8fLTLVUHNv8kWnssP/Qm3YXMVzWlFtWtdiMoahCGPS
 Kme2EsYIfptxjyFqr0HTYnhHM2YDrmur5rK32XO50Iv7OJMG9x+bqrwazS7dy309Hr
 1b+7CYfqa5NrdY/U09oRNR6aOmNsc2mF6BOnsa/ZBo+gnufnonFAu467YUDfXNnyVT
 2+7CcdCl1nQYdMBehjDmpbmWcCdsqMJ0HzNITuntSQayJH8o68ShuNneWHuMz+ft9f
 zsNlizMtyEmX65xBz2nEMDvbw5Q3Bpj+6ANqTt35ZjsRdjlP7HA6II7WWUrvegljIb
 rs2/bpj1V1R9Q==
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
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark <robdclark@gmail.com>,
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
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>
Subject: [PATCH v1 0/6] Move all drivers to a common dma-buf locking convention
Date: Fri, 15 Jul 2022 03:52:38 +0300
Message-Id: <20220715005244.42198-1-dmitry.osipenko@collabora.com>
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
Cc: linux-rdma@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This series moves all drivers to a dynamic dma-buf locking specification.
From now on all dma-buf importers are made responsible for holding
dma-buf's reservation lock around all operations performed over dma-bufs.
This common locking convention allows us to utilize reservation lock more
broadly around kernel without fearing of potential dead locks.

This patchset passes all i915 selftests. It was also tested using VirtIO,
Panfrost, Lima and Tegra drivers. I tested cases of display+GPU,
display+V4L and GPU+V4L dma-buf sharing, which covers majority of kernel
drivers since rest of the drivers share same or similar code paths.

This is a continuation of [1] where Christian König asked to factor out
the dma-buf locking changes into separate series.

[1] https://lore.kernel.org/dri-devel/20220526235040.678984-1-dmitry.osipenko@collabora.com/

Dmitry Osipenko (6):
  dma-buf: Add _unlocked postfix to function names
  drm/gem: Take reservation lock for vmap/vunmap operations
  dma-buf: Move all dma-bufs to dynamic locking specification
  dma-buf: Acquire wait-wound context on attachment
  media: videobuf2: Stop using internal dma-buf lock
  dma-buf: Remove internal lock

 drivers/dma-buf/dma-buf.c                     | 198 +++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c   |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |   4 +-
 drivers/gpu/drm/armada/armada_gem.c           |  14 +-
 drivers/gpu/drm/drm_client.c                  |   4 +-
 drivers/gpu/drm/drm_gem.c                     |  28 +++
 drivers/gpu/drm/drm_gem_cma_helper.c          |   6 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c  |   6 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        |   6 +-
 drivers/gpu/drm/drm_prime.c                   |  12 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |   6 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.c       |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  20 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |   6 +-
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  20 +-
 drivers/gpu/drm/i915/i915_gem_evict.c         |   2 +-
 drivers/gpu/drm/i915/i915_gem_ww.c            |  26 ++-
 drivers/gpu/drm/i915/i915_gem_ww.h            |  15 +-
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c     |   8 +-
 drivers/gpu/drm/qxl/qxl_object.c              |  17 +-
 drivers/gpu/drm/qxl/qxl_prime.c               |   4 +-
 drivers/gpu/drm/tegra/gem.c                   |  27 +--
 drivers/infiniband/core/umem_dmabuf.c         |  11 +-
 .../common/videobuf2/videobuf2-dma-contig.c   |  26 +--
 .../media/common/videobuf2/videobuf2-dma-sg.c |  23 +-
 .../common/videobuf2/videobuf2-vmalloc.c      |  17 +-
 .../platform/nvidia/tegra-vde/dmabuf-cache.c  |  12 +-
 drivers/misc/fastrpc.c                        |  12 +-
 drivers/xen/gntdev-dmabuf.c                   |  14 +-
 include/drm/drm_gem.h                         |   3 +
 include/linux/dma-buf.h                       |  49 ++---
 32 files changed, 347 insertions(+), 257 deletions(-)

-- 
2.36.1

