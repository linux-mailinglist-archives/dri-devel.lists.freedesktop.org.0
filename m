Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B34F9293B55
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 14:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859146EC6D;
	Tue, 20 Oct 2020 12:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C466EC63;
 Tue, 20 Oct 2020 12:20:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E929FB1C6;
 Tue, 20 Oct 2020 12:20:51 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, sam@ravnborg.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, kraxel@redhat.com, l.stach@pengutronix.de,
 linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
 yuq825@gmail.com, bskeggs@redhat.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, hjc@rock-chips.com, heiko@sntech.de,
 hdegoede@redhat.com, sean@poorly.run, eric@anholt.net,
 oleksandr_andrushchenko@epam.com, ray.huang@amd.com,
 sumit.semwal@linaro.org, emil.velikov@collabora.com, luben.tuikov@amd.com,
 apaneers@amd.com, linus.walleij@linaro.org, melissa.srw@gmail.com,
 chris@chris-wilson.co.uk, miaoqinglang@huawei.com
Subject: [PATCH v5 00/10] Support GEM object mappings from I/O memory
Date: Tue, 20 Oct 2020 14:20:36 +0200
Message-Id: <20201020122046.31167-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
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
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 xen-devel@lists.xenproject.org, spice-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM's fbdev console uses regular load and store operations to update
framebuffer memory. The bochs driver on sparc64 requires the use of
I/O-specific load and store operations. We have a workaround, but need
a long-term solution to the problem.

This patchset changes GEM's vmap/vunmap interfaces to forward pointers
of type struct dma_buf_map and updates the generic fbdev emulation to
use them correctly. This enables I/O-memory operations on all framebuffers
that require and support them.

Patches #1 to #4 prepare VRAM helpers and drivers.

Next is the update of the GEM vmap functions. Patch #5 adds vmap and vunmap
that is usable with TTM-based GEM drivers, and patch #6 updates GEM's
vmap/vunmap callback to forward instances of type struct dma_buf_map. While
the patch touches many files throughout the DRM modules, the applied changes
are mostly trivial interface fixes. Several TTM-based GEM drivers now use
the new vmap code. Patch #7 updates GEM's internal vmap/vunmap functions to
forward struct dma_buf_map.

With struct dma_buf_map propagated through the layers, patches #8 to #10
convert DRM clients and generic fbdev emulation to use it. Updating the
fbdev framebuffer will select the correct functions, either for system or
I/O memory.

v5:
	* rebase onto latest TTM changes (Chrsitian)
	* support TTM premapped memory correctly (Christian)
	* implement fb_read/fb_write internally (Sam, Daniel)
	* cleanups
v4:
	* provide TTM vmap/vunmap plus GEM helpers and convert drivers
	  over (Christian, Daniel)
	* remove several empty functions
	* more TODOs and documentation (Daniel)
v3:
	* recreate the whole patchset on top of struct dma_buf_map
v2:
	* RFC patchset


Thomas Zimmermann (10):
  drm/vram-helper: Remove invariant parameters from internal kmap
    function
  drm/cma-helper: Remove empty drm_gem_cma_prime_vunmap()
  drm/etnaviv: Remove empty etnaviv_gem_prime_vunmap()
  drm/exynos: Remove empty exynos_drm_gem_prime_{vmap,vunmap}()
  drm/ttm: Add vmap/vunmap to TTM and TTM GEM helpers
  drm/gem: Use struct dma_buf_map in GEM vmap ops and convert GEM
    backends
  drm/gem: Update internal GEM vmap/vunmap interfaces to use struct
    dma_buf_map
  drm/gem: Store client buffer mappings as struct dma_buf_map
  dma-buf-map: Add memcpy and pointer-increment interfaces
  drm/fb_helper: Support framebuffers in I/O memory

 Documentation/gpu/todo.rst                  |  37 ++-
 drivers/gpu/drm/Kconfig                     |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  36 ---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h |   2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |   1 -
 drivers/gpu/drm/ast/ast_cursor.c            |  27 +--
 drivers/gpu/drm/ast/ast_drv.h               |   7 +-
 drivers/gpu/drm/bochs/bochs_kms.c           |   1 -
 drivers/gpu/drm/drm_client.c                |  38 +--
 drivers/gpu/drm/drm_fb_helper.c             | 248 ++++++++++++++++++--
 drivers/gpu/drm/drm_gem.c                   |  29 ++-
 drivers/gpu/drm/drm_gem_cma_helper.c        |  27 +--
 drivers/gpu/drm/drm_gem_shmem_helper.c      |  48 ++--
 drivers/gpu/drm/drm_gem_ttm_helper.c        |  38 +++
 drivers/gpu/drm/drm_gem_vram_helper.c       | 117 +++++----
 drivers/gpu/drm/drm_internal.h              |   5 +-
 drivers/gpu/drm/drm_prime.c                 |  14 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.h       |   3 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem.c       |   1 -
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |  12 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.c     |  12 -
 drivers/gpu/drm/exynos/exynos_drm_gem.h     |   2 -
 drivers/gpu/drm/lima/lima_gem.c             |   6 +-
 drivers/gpu/drm/lima/lima_sched.c           |  11 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c      |  10 +-
 drivers/gpu/drm/nouveau/Kconfig             |   1 +
 drivers/gpu/drm/nouveau/nouveau_bo.h        |   2 -
 drivers/gpu/drm/nouveau/nouveau_gem.c       |   6 +-
 drivers/gpu/drm/nouveau/nouveau_gem.h       |   2 -
 drivers/gpu/drm/nouveau/nouveau_prime.c     |  20 --
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c |  14 +-
 drivers/gpu/drm/qxl/qxl_display.c           |  11 +-
 drivers/gpu/drm/qxl/qxl_draw.c              |  14 +-
 drivers/gpu/drm/qxl/qxl_drv.h               |  11 +-
 drivers/gpu/drm/qxl/qxl_object.c            |  31 ++-
 drivers/gpu/drm/qxl/qxl_object.h            |   2 +-
 drivers/gpu/drm/qxl/qxl_prime.c             |  12 +-
 drivers/gpu/drm/radeon/radeon.h             |   1 -
 drivers/gpu/drm/radeon/radeon_gem.c         |   7 +-
 drivers/gpu/drm/radeon/radeon_prime.c       |  20 --
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c |  22 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.h |   4 +-
 drivers/gpu/drm/tiny/cirrus.c               |  10 +-
 drivers/gpu/drm/tiny/gm12u320.c             |  10 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c           |  72 ++++++
 drivers/gpu/drm/udl/udl_modeset.c           |   8 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c       |  11 +-
 drivers/gpu/drm/vc4/vc4_bo.c                |   7 +-
 drivers/gpu/drm/vc4/vc4_drv.h               |   2 +-
 drivers/gpu/drm/vgem/vgem_drv.c             |  16 +-
 drivers/gpu/drm/vkms/vkms_plane.c           |  15 +-
 drivers/gpu/drm/vkms/vkms_writeback.c       |  22 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c     |  18 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.h     |   6 +-
 include/drm/drm_client.h                    |   7 +-
 include/drm/drm_gem.h                       |   5 +-
 include/drm/drm_gem_cma_helper.h            |   3 +-
 include/drm/drm_gem_shmem_helper.h          |   4 +-
 include/drm/drm_gem_ttm_helper.h            |   6 +
 include/drm/drm_gem_vram_helper.h           |  14 +-
 include/drm/drm_mode_config.h               |  12 -
 include/drm/ttm/ttm_bo_api.h                |  28 +++
 include/linux/dma-buf-map.h                 |  93 +++++++-
 64 files changed, 852 insertions(+), 436 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
