Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EA66014BD
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 19:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3028910E665;
	Mon, 17 Oct 2022 17:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE96610E3AE;
 Mon, 17 Oct 2022 17:24:13 +0000 (UTC)
Received: from dimapc.. (109-252-119-114.nat.spd-mgts.ru [109.252.119.114])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 98A5666022A5;
 Mon, 17 Oct 2022 18:24:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666027452;
 bh=mNL0kzS7mxVONeStFeS1gkBIV+KbRD8Qq/CCfksLxq4=;
 h=From:To:Cc:Subject:Date:From;
 b=UdEuGpXb5Xu/a6MmAi6b2MMlKj5Wvx+FTlQsX0Y59Jh3ql7lpscKlJbw8pcejDtre
 zqzLS33zCMoGmgGiW5v8iVQj7wFGS8Hrhq/Klz8t7HeWwX6NiWmeqSmNnHevBSxcZM
 n39n+ALXvsoYD99LbV3mSWi/oLOMeye4RjIMnugQzh8FID2INWwoco7gBh4dInDQIb
 X7Zt0xC6g53pGk8YqjOzUh45LMoXS5j8pZSI2F6WKRNjw8DAdu6djBwqb+cnUpjP63
 LL75HeASuunvHFE+TVRCSPxWK55UxrGf+3guyeWFgJOnmFRhFlCgg7/UPLcy1l6QSh
 juEIhna4ogrNA==
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
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
 Qiang Yu <yuq825@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Tomi Valkeinen <tomba@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Ruhl Michael J <michael.j.ruhl@intel.com>
Subject: [PATCH v7 00/21] Move all drivers to a common dma-buf locking
 convention
Date: Mon, 17 Oct 2022 20:22:08 +0300
Message-Id: <20221017172229.42269-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.3
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
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This series moves all drivers to a dynamic dma-buf locking specification.
From now on all dma-buf importers are made responsible for holding
dma-buf's reservation lock around all operations performed over dma-bufs
in accordance to the locking specification. This allows us to utilize
reservation lock more broadly around kernel without fearing of a potential
deadlocks.

This patchset passes all i915 selftests. It was also tested using VirtIO,
Panfrost, Lima, Tegra, udmabuf, AMDGPU and Nouveau drivers. I tested cases
of display+GPU, display+V4L and GPU+V4L dma-buf sharing (where appropriate),
which covers majority of kernel drivers since rest of the drivers share
same or similar code paths.

Changelog:

v7: - Rebased on top of recent drm-misc-next.

    - Added ack from Jason Gunthorpe to the RDMA patch.

    - Added iosys_map_clear() to dma_buf_vmap_unlocked(), making it fully
      consistent with dma_buf_vmap().

v6: - Added r-b from Michael Ruhl to the i915 patch.

    - Added acks from Sumit Semwal and updated commit message of the
      "Move dma_buf_vmap() to dynamic locking specification" patch like
      was suggested by Sumit.

    - Added "!dmabuf" check to dma_buf_vmap_unlocked() to match the locked
      variant of the function, for consistency.

v5: - Added acks and r-bs that were given to v4.

    - Changed i915 preparation patch like was suggested by Michael Ruhl.
      The scope of reservation locking is smaller now.

v4: - Added dma_buf_mmap() to the "locking convention" documentation,
      which was missed by accident in v3.

    - Added acks from Christian König, Tomasz Figa and Hans Verkuil that
      they gave to couple v3 patches.

    - Dropped the "_unlocked" postfix from function names that don't have
      the locked variant, as was requested by Christian König.

    - Factored out the per-driver preparations into separate patches
      to ease reviewing of the changes, which is now doable without the
      global dma-buf functions renaming.

    - Factored out the dynamic locking convention enforcements into separate
      patches which add the final dma_resv_assert_held(dmabuf->resv) to the
      dma-buf API functions.

v3: - Factored out dma_buf_mmap_unlocked() and attachment functions
      into aseparate patches, like was suggested by Christian König.

    - Corrected and factored out dma-buf locking documentation into
      a separate patch, like was suggested by Christian König.

    - Intel driver dropped the reservation locking fews days ago from
      its BO-release code path, but we need that locking for the imported
      GEMs because in the end that code path unmaps the imported GEM.
      So I added back the locking needed by the imported GEMs, updating
      the "dma-buf attachment locking specification" patch appropriately.

    - Tested Nouveau+Intel dma-buf import/export combo.

    - Tested udmabuf import to i915/Nouveau/AMDGPU.

    - Fixed few places in Etnaviv, Panfrost and Lima drivers that I missed
      to switch to locked dma-buf vmapping in the drm/gem: Take reservation
      lock for vmap/vunmap operations" patch. In a result invalidated the
      Christian's r-b that he gave to v2.

    - Added locked dma-buf vmap/vunmap functions that are needed for fixing
      vmappping of Etnaviv, Panfrost and Lima drivers mentioned above.
      I actually had this change stashed for the drm-shmem shrinker patchset,
      but then realized that it's already needed by the dma-buf patches.
      Also improved my tests to better cover these code paths.

v2: - Changed locking specification to avoid problems with a cross-driver
      ww locking, like was suggested by Christian König. Now the attach/detach
      callbacks are invoked without the held lock and exporter should take the
      lock.

    - Added "locking convention" documentation that explains which dma-buf
      functions and callbacks are locked/unlocked for importers and exporters,
      which was requested by Christian König.

    - Added ack from Tomasz Figa to the V4L patches that he gave to v1.

Dmitry Osipenko (21):
  dma-buf: Add unlocked variant of vmapping functions
  dma-buf: Add unlocked variant of attachment-mapping functions
  drm/gem: Take reservation lock for vmap/vunmap operations
  drm/prime: Prepare to dynamic dma-buf locking specification
  drm/armada: Prepare to dynamic dma-buf locking specification
  drm/i915: Prepare to dynamic dma-buf locking specification
  drm/omapdrm: Prepare to dynamic dma-buf locking specification
  drm/tegra: Prepare to dynamic dma-buf locking specification
  drm/etnaviv: Prepare to dynamic dma-buf locking specification
  RDMA/umem: Prepare to dynamic dma-buf locking specification
  misc: fastrpc: Prepare to dynamic dma-buf locking specification
  xen/gntdev: Prepare to dynamic dma-buf locking specification
  media: videobuf2: Prepare to dynamic dma-buf locking specification
  media: tegra-vde: Prepare to dynamic dma-buf locking specification
  dma-buf: Move dma_buf_vmap() to dynamic locking specification
  dma-buf: Move dma_buf_attach() to dynamic locking specification
  dma-buf: Move dma_buf_map_attachment() to dynamic locking
    specification
  dma-buf: Move dma_buf_mmap() to dynamic locking specification
  dma-buf: Document dynamic locking convention
  media: videobuf2: Stop using internal dma-buf lock
  dma-buf: Remove obsoleted internal lock

 Documentation/driver-api/dma-buf.rst          |   6 +
 drivers/dma-buf/dma-buf.c                     | 216 +++++++++++++++---
 drivers/gpu/drm/armada/armada_gem.c           |   8 +-
 drivers/gpu/drm/drm_client.c                  |   4 +-
 drivers/gpu/drm/drm_gem.c                     |  24 ++
 drivers/gpu/drm/drm_gem_dma_helper.c          |   6 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c  |   6 +-
 drivers/gpu/drm/drm_gem_ttm_helper.c          |   9 +-
 drivers/gpu/drm/drm_prime.c                   |   6 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  14 ++
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  16 +-
 drivers/gpu/drm/lima/lima_sched.c             |   4 +-
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c     |   4 +-
 drivers/gpu/drm/panfrost/panfrost_dump.c      |   4 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |   6 +-
 drivers/gpu/drm/qxl/qxl_object.c              |  17 +-
 drivers/gpu/drm/qxl/qxl_prime.c               |   4 +-
 drivers/gpu/drm/tegra/gem.c                   |  17 +-
 drivers/infiniband/core/umem_dmabuf.c         |   7 +-
 .../common/videobuf2/videobuf2-dma-contig.c   |  22 +-
 .../media/common/videobuf2/videobuf2-dma-sg.c |  19 +-
 .../common/videobuf2/videobuf2-vmalloc.c      |  17 +-
 .../platform/nvidia/tegra-vde/dmabuf-cache.c  |   6 +-
 drivers/misc/fastrpc.c                        |   6 +-
 drivers/xen/gntdev-dmabuf.c                   |   8 +-
 include/drm/drm_gem.h                         |   3 +
 include/linux/dma-buf.h                       |  17 +-
 29 files changed, 325 insertions(+), 155 deletions(-)

-- 
2.37.3

