Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8DF2755CC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 12:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320026E920;
	Wed, 23 Sep 2020 10:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9C26E918;
 Wed, 23 Sep 2020 10:22:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AC061B278;
 Wed, 23 Sep 2020 10:22:39 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, l.stach@pengutronix.de, christian.gmeiner@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
 patrik.r.jakobsson@gmail.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 robdclark@gmail.com, sean@poorly.run, bskeggs@redhat.com,
 tomi.valkeinen@ti.com, eric@anholt.net, hjc@rock-chips.com,
 heiko@sntech.de, thierry.reding@gmail.com, jonathanh@nvidia.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 oleksandr_andrushchenko@epam.com, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
 sumit.semwal@linaro.org, evan.quan@amd.com, Hawking.Zhang@amd.com,
 tianci.yin@amd.com, marek.olsak@amd.com, hdegoede@redhat.com,
 andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com, xinhui.pan@amd.com,
 aaron.liu@amd.com, nirmoy.das@amd.com, chris@chris-wilson.co.uk,
 matthew.auld@intel.com, tvrtko.ursulin@linux.intel.com,
 andi.shyti@intel.com, sam@ravnborg.org, miaoqinglang@huawei.com,
 emil.velikov@collabora.com, laurentiu.palcu@oss.nxp.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com
Subject: [PATCH v3 00/22] Convert all remaining drivers to GEM object functions
Date: Wed, 23 Sep 2020 12:21:37 +0200
Message-Id: <20200923102159.24084-1-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, nouveau@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GEM and PRIME related callbacks in struct drm_driver are deprecated in
favor of GEM object functions in struct drm_gem_object_funcs. This patchset
converts the remaining drivers to object functions and removes most of the
obsolete interfaces.

Version 3 of this patchset mostly fixes drm_gem_prime_handle_to_fd and
updates i.MX's dcss driver. The driver was missing from earlier versions
and still needs review.

Patches #1 to #6, #8 to #17 and #19 to #20 convert DRM drivers to GEM object
functions, one by one. Each patch moves existing callbacks from struct
drm_driver to an instance of struct drm_gem_object_funcs, and sets these
funcs when the GEM object is initialized. The expection is .gem_prime_mmap.
There are different ways of how drivers implement the callback, and moving
it to GEM object functions requires a closer review for each.

Patch #18 fixes virtgpu to use GEM object functions where possible. The
driver recently introduced a function for one of the deprecated callbacks.

Patches #7 and #20 convert i.MX's dcss and xlnx to CMA helper macros. There's
no apparent reason why the drivers do the GEM setup on their's own. Using CMA
helper macros adds GEM object functions implicitly.

With most of the GEM and PRIME moved to GEM object functions, related code
in struct drm_driver and in the DRM core/helpers is being removed by patch
#22.

Further testing is welcome. I tested the drivers for which I have HW
available. These are gma500, i915, nouveau, radeon and vc4. The console,
Weston and Xorg apparently work with the patches applied.

v3:
	* restore default call to drm_gem_prime_export() in
	  drm_gem_prime_handle_to_fd()
	* return -ENOSYS if get_sg_table is not set
	* drop all checks for obj->funcs
	* clean up TODO list and documentation
v2:
	* moved code in amdgpu and radeon
	* made several functions static in various drivers
	* updated TODO-list item
	* fix virtgpu

Thomas Zimmermann (22):
  drm/amdgpu: Introduce GEM object functions
  drm/armada: Introduce GEM object functions
  drm/etnaviv: Introduce GEM object functions
  drm/exynos: Introduce GEM object functions
  drm/gma500: Introduce GEM object functions
  drm/i915: Introduce GEM object functions
  drm/imx/dcss: Initialize DRM driver instance with CMA helper macro
  drm/mediatek: Introduce GEM object functions
  drm/msm: Introduce GEM object funcs
  drm/nouveau: Introduce GEM object functions
  drm/omapdrm: Introduce GEM object functions
  drm/pl111: Introduce GEM object functions
  drm/radeon: Introduce GEM object functions
  drm/rockchip: Convert to drm_gem_object_funcs
  drm/tegra: Introduce GEM object functions
  drm/vc4: Introduce GEM object functions
  drm/vgem: Introduce GEM object functions
  drm/virtgpu: Set PRIME export function in struct drm_gem_object_funcs
  drm/vkms: Introduce GEM object functions
  drm/xen: Introduce GEM object functions
  drm/xlnx: Initialize DRM driver instance with CMA helper macro
  drm: Remove obsolete GEM and PRIME callbacks from struct drm_driver

 Documentation/gpu/drm-mm.rst                  |  4 +-
 Documentation/gpu/todo.rst                    |  9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  6 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 23 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h       |  5 --
 drivers/gpu/drm/armada/armada_drv.c           |  3 -
 drivers/gpu/drm/armada/armada_gem.c           | 12 ++-
 drivers/gpu/drm/armada/armada_gem.h           |  2 -
 drivers/gpu/drm/drm_gem.c                     | 53 ++++--------
 drivers/gpu/drm/drm_gem_cma_helper.c          |  8 +-
 drivers/gpu/drm/drm_prime.c                   | 14 +--
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         | 13 ---
 drivers/gpu/drm/etnaviv/etnaviv_drv.h         |  1 -
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         | 19 ++++-
 drivers/gpu/drm/exynos/exynos_drm_drv.c       | 10 ---
 drivers/gpu/drm/exynos/exynos_drm_gem.c       | 15 ++++
 drivers/gpu/drm/gma500/framebuffer.c          |  2 +
 drivers/gpu/drm/gma500/gem.c                  | 18 +++-
 drivers/gpu/drm/gma500/gem.h                  |  3 +
 drivers/gpu/drm/gma500/psb_drv.c              |  9 --
 drivers/gpu/drm/gma500/psb_drv.h              |  2 -
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 21 ++++-
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  3 -
 drivers/gpu/drm/i915/i915_drv.c               |  4 -
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  3 -
 drivers/gpu/drm/imx/dcss/dcss-kms.c           | 14 +--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  5 --
 drivers/gpu/drm/mediatek/mtk_drm_gem.c        | 11 +++
 drivers/gpu/drm/msm/msm_drv.c                 | 13 ---
 drivers/gpu/drm/msm/msm_drv.h                 |  1 -
 drivers/gpu/drm/msm/msm_gem.c                 | 19 ++++-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  9 --
 drivers/gpu/drm/nouveau/nouveau_gem.c         | 13 +++
 drivers/gpu/drm/nouveau/nouveau_gem.h         |  2 +
 drivers/gpu/drm/nouveau/nouveau_prime.c       |  2 +
 drivers/gpu/drm/omapdrm/omap_drv.c            |  9 --
 drivers/gpu/drm/omapdrm/omap_gem.c            | 18 +++-
 drivers/gpu/drm/omapdrm/omap_gem.h            |  2 -
 drivers/gpu/drm/pl111/pl111_drv.c             |  5 +-
 drivers/gpu/drm/radeon/radeon_drv.c           | 23 +----
 drivers/gpu/drm/radeon/radeon_gem.c           | 31 ++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  5 --
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   | 12 ++-
 drivers/gpu/drm/tegra/drm.c                   |  4 -
 drivers/gpu/drm/tegra/gem.c                   |  8 ++
 drivers/gpu/drm/vc4/vc4_bo.c                  | 21 ++++-
 drivers/gpu/drm/vc4/vc4_drv.c                 | 12 ---
 drivers/gpu/drm/vc4/vc4_drv.h                 |  1 -
 drivers/gpu/drm/vgem/vgem_drv.c               | 21 +++--
 drivers/gpu/drm/virtio/virtgpu_drv.c          |  1 -
 drivers/gpu/drm/virtio/virtgpu_object.c       |  1 +
 drivers/gpu/drm/vkms/vkms_drv.c               |  8 --
 drivers/gpu/drm/vkms/vkms_gem.c               | 13 +++
 drivers/gpu/drm/xen/xen_drm_front.c           | 44 ++++------
 drivers/gpu/drm/xen/xen_drm_front.h           |  2 +
 drivers/gpu/drm/xen/xen_drm_front_gem.c       | 15 ++++
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c           | 14 +--
 include/drm/drm_drv.h                         | 85 +------------------
 include/drm/drm_gem.h                         |  2 +-
 59 files changed, 333 insertions(+), 375 deletions(-)

--
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
