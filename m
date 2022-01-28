Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE90C49F53D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 09:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BA5112375;
	Fri, 28 Jan 2022 08:36:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F7B112372;
 Fri, 28 Jan 2022 08:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643358971; x=1674894971;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DLXlxavituReAC9ZkCslfVsSA1lC0SNjLHAttdTUiQs=;
 b=JUt/EqbRTeRcdIzIyni2oqbbChsa41WAIAxB1pHNy+YAcGSN6NUkh8Jk
 UMzU0L194CMvJdkbNJ8JkLleqhHnTg6e056hdnW0eQTeleOD8YHdhNPdh
 B4lbFqUgS++YJDyJZF1ViAGebfY0kxgmJhxgPv0h5ypJwBy17JIfz5iNC
 /3WAN25Qq9Ut4bpNduAM1DMZOJ49IZK/Dw8MO7/oo4tATVst1LDMQdD92
 YNRNS6UoGZ3jpTtV5sohj0DLsbs3F/pqCL69+TO2kKb01B49EPfFVwRj0
 7DbNsC4GasBOCNgfbr418Q61h9z9IJpaZOmVruPlJcURgLIaUTzNv1R6r A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="247025179"
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="247025179"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 00:36:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; d="scan'208";a="581788712"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 00:36:10 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 00/14] Rename dma-buf-map
Date: Fri, 28 Jan 2022 00:36:12 -0800
Message-Id: <20220128083626.3012259-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.0
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
Cc: airlied@linux.ie, daniel.vetter@ffwll.ch, christian.koenig@amd.com,
 srinivas.kandagatla@linaro.org, tzimmermann@suse.de,
 gregkh@linuxfoundation.org, nouveau@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Motivation for this started in
https://lore.kernel.org/lkml/20220126203702.1784589-1-lucas.demarchi@intel.com/
when trying to extend the dma-buf-map API to cover new use cases: help a
single driver with allocations and sharing code paths for IO and system
memory. I'm leaving the API additions aside and first renaming the
interface as requested.

There are already some users in tree outside the context of dma-buf
importer/exporter. So before extending the API, let's dissociate it from
dma-buf.

The iosys-map.h is introduced in the first patch in a way that allows
the conversion of each driver to happen separately. After all the
conversions are done we can remove the old one, which is the last patch.
Another possible way is to squash everything and merge together,
but I believe this would make much harder for review.

The conversion was done with the following semantic patch:

	@r1@
	@@
	- struct dma_buf_map
	+ struct iosys_map

	@r2@
	@@
	(
	- DMA_BUF_MAP_INIT_VADDR
	+ IOSYS_MAP_INIT_VADDR
	|
	- dma_buf_map_set_vaddr
	+ iosys_map_set_vaddr
	|
	- dma_buf_map_set_vaddr_iomem
	+ iosys_map_set_vaddr_iomem
	|
	- dma_buf_map_is_equal
	+ iosys_map_is_equal
	|
	- dma_buf_map_is_null
	+ iosys_map_is_null
	|
	- dma_buf_map_is_set
	+ iosys_map_is_set
	|
	- dma_buf_map_clear
	+ iosys_map_clear
	|
	- dma_buf_map_memcpy_to
	+ iosys_map_memcpy_to
	|
	- dma_buf_map_incr
	+ iosys_map_incr
	)

	@@
	@@
	- #include <linux/dma-buf-map.h>
	+ #include <linux/iosys-map.h>

and then some files had their includes adjusted so we can build
everything on each commit in this series. Also some comments were update
to remove mentions to dma-buf-map. Simply doing a sed to rename didn't
work as dma-buf has some APIs using the dma_buf_map prefix.

Once finalized, I think most of this, if not all, could go through the
drm-misc-next branch. I split i915, msm, nouveau, and radeon in their
own patches in case it's preferred to take those through their own
trees.

Lucas De Marchi

Lucas De Marchi (14):
  iosys-map: Introduce renamed dma-buf-map
  misc: fastrpc: Replace dma-buf-map with iosys-map
  dma-buf: Replace dma-buf-map with iosys-map
  media: Replace dma-buf-map with iosys-map
  drm/ttm: Replace dma-buf-map with iosys-map
  drm: Replace dma-buf-map with iosys-map in drivers
  drm/i915: Replace dma-buf-map with iosys-map
  drm/msm: Replace dma-buf-map with iosys-map
  drm/nouveau: Replace dma-buf-map with iosys-map
  drm/tegra: Replace dma-buf-map with iosys-map
  drm/radeon: Replace dma-buf-map with iosys-map
  drm: Replace dma-buf-map with iosys-map in common code
  Documentation: Refer to iosys-map instead of dma-buf-map
  dma-buf-map: Remove API in favor of iosys-map

 Documentation/driver-api/dma-buf.rst          |   4 +-
 Documentation/gpu/todo.rst                    |  20 +-
 MAINTAINERS                                   |   2 +-
 drivers/dma-buf/dma-buf.c                     |  22 +-
 drivers/dma-buf/heaps/cma_heap.c              |  10 +-
 drivers/dma-buf/heaps/system_heap.c           |  10 +-
 drivers/gpu/drm/ast/ast_drv.h                 |   2 +-
 drivers/gpu/drm/ast/ast_mode.c                |   8 +-
 drivers/gpu/drm/drm_cache.c                   |  18 +-
 drivers/gpu/drm/drm_client.c                  |   9 +-
 drivers/gpu/drm/drm_fb_helper.c               |  12 +-
 drivers/gpu/drm/drm_gem.c                     |  12 +-
 drivers/gpu/drm/drm_gem_cma_helper.c          |   9 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c  |  16 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        |  15 +-
 drivers/gpu/drm/drm_gem_ttm_helper.c          |   4 +-
 drivers/gpu/drm/drm_gem_vram_helper.c         |  25 +-
 drivers/gpu/drm/drm_internal.h                |   6 +-
 drivers/gpu/drm/drm_mipi_dbi.c                |   8 +-
 drivers/gpu/drm/drm_prime.c                   |   4 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.h         |   2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c   |   8 +-
 drivers/gpu/drm/gud/gud_pipe.c                |   4 +-
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c   |   5 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |   8 +-
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |   6 +-
 .../gpu/drm/i915/gem/selftests/mock_dmabuf.c  |   6 +-
 drivers/gpu/drm/lima/lima_gem.c               |   3 +-
 drivers/gpu/drm/lima/lima_sched.c             |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c        |   7 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.h        |   5 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c        |   4 +-
 drivers/gpu/drm/msm/msm_drv.h                 |   4 +-
 drivers/gpu/drm/msm/msm_gem_prime.c           |   6 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c         |   2 +
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |  13 +-
 drivers/gpu/drm/qxl/qxl_display.c             |   8 +-
 drivers/gpu/drm/qxl/qxl_draw.c                |   6 +-
 drivers/gpu/drm/qxl/qxl_drv.h                 |  10 +-
 drivers/gpu/drm/qxl/qxl_object.c              |   8 +-
 drivers/gpu/drm/qxl/qxl_object.h              |   4 +-
 drivers/gpu/drm/qxl/qxl_prime.c               |   4 +-
 drivers/gpu/drm/radeon/radeon_gem.c           |   1 +
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |   9 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.h   |   5 +-
 drivers/gpu/drm/tegra/gem.c                   |  10 +-
 drivers/gpu/drm/tiny/cirrus.c                 |   8 +-
 drivers/gpu/drm/tiny/gm12u320.c               |   7 +-
 drivers/gpu/drm/ttm/ttm_bo_util.c             |  16 +-
 drivers/gpu/drm/ttm/ttm_resource.c            |  26 +-
 drivers/gpu/drm/ttm/ttm_tt.c                  |   6 +-
 drivers/gpu/drm/udl/udl_modeset.c             |   3 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c         |   4 +-
 drivers/gpu/drm/virtio/virtgpu_prime.c        |   1 +
 drivers/gpu/drm/vkms/vkms_composer.c          |   4 +-
 drivers/gpu/drm/vkms/vkms_drv.h               |   6 +-
 drivers/gpu/drm/vkms/vkms_plane.c             |   2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c         |   2 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c       |   7 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.h       |   6 +-
 .../common/videobuf2/videobuf2-dma-contig.c   |   8 +-
 .../media/common/videobuf2/videobuf2-dma-sg.c |   9 +-
 .../common/videobuf2/videobuf2-vmalloc.c      |  11 +-
 drivers/misc/fastrpc.c                        |   4 +-
 include/drm/drm_cache.h                       |   6 +-
 include/drm/drm_client.h                      |   7 +-
 include/drm/drm_gem.h                         |   6 +-
 include/drm/drm_gem_atomic_helper.h           |   6 +-
 include/drm/drm_gem_cma_helper.h              |   6 +-
 include/drm/drm_gem_framebuffer_helper.h      |   8 +-
 include/drm/drm_gem_shmem_helper.h            |  12 +-
 include/drm/drm_gem_ttm_helper.h              |   6 +-
 include/drm/drm_gem_vram_helper.h             |   9 +-
 include/drm/drm_prime.h                       |   6 +-
 include/drm/ttm/ttm_bo_api.h                  |  10 +-
 include/drm/ttm/ttm_kmap_iter.h               |  10 +-
 include/drm/ttm/ttm_resource.h                |   6 +-
 include/linux/dma-buf-map.h                   | 266 ------------------
 include/linux/dma-buf.h                       |  12 +-
 include/linux/iosys-map.h                     | 257 +++++++++++++++++
 80 files changed, 579 insertions(+), 552 deletions(-)
 delete mode 100644 include/linux/dma-buf-map.h
 create mode 100644 include/linux/iosys-map.h

-- 
2.35.0

