Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 344164A9DF1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 18:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED0810E620;
	Fri,  4 Feb 2022 17:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B47E10E439;
 Fri,  4 Feb 2022 17:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643996709; x=1675532709;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MK0zDSNzIBn78M1AN1U3FO5D43IcTYkPVEuGEVdw+48=;
 b=jygxtGveTAR9c0m+lPuc5PcXhznLGWkWucA3DFJqa0TbNqFYdKoFfuIs
 3XbFWZtItZJxDe+AjZ7sH+kuFH2uajQgSDpCOfin7bZMcCzsu9bSxEh4X
 taBSIRHe4k9fsZ+AsKQRJbd7oUEvIRzF/rRQR6i+ZZADr7SnaefsdX3Ae
 Ftk0CI74EhB1Mc2t+e14Ou8qJASm9e8PLTFpXCG+fIt7AH8adEPWPK0zp
 5TogUBZUMa4iYsoVBJ9Wab2fpu/N5eynE/xMW8eaXG09t/kv71bhsPILp
 LSFRup7Y6lE9iUsGURuuUqnBRI+bNkiw48PibpBqq4cX7i2028sDCLR+G w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10248"; a="247242166"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="247242166"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 09:45:08 -0800
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="539240784"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 09:45:08 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 00/19] drm/i915/guc: Refactor ADS access to use iosys_map
Date: Fri,  4 Feb 2022 09:44:17 -0800
Message-Id: <20220204174436.830121-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

2nd version of https://patchwork.freedesktop.org/series/99378/

As first patch I'm including the dma-buf-map rename to iosys-map for
completeness and to allow the other patches to be reviewed. However the
first patch was also sent by itself.

I think all the feedback from v1 was incorporated in this version. All
the new helpers in iosys-map were squashed in a single patch as
requested.

Original cover letter:

While porting i915 to arm64 we noticed some issues accessing lmem.
Some writes were getting corrupted and the final state of the buffer
didn't have exactly what we wrote. This became evident when enabling
GuC submission: depending on the number of engines the ADS struct was
being corrupted and GuC would reject it, refusin to initialize.

From Documentation/core-api/bus-virt-phys-mapping.rst:

	This memory is called "PCI memory" or "shared memory" or "IO memory" or
	whatever, and there is only one way to access it: the readb/writeb and
	related functions. You should never take the address of such memory, because
	there is really nothing you can do with such an address: it's not
	conceptually in the same memory space as "real memory" at all, so you cannot
	just dereference a pointer. (Sadly, on x86 it **is** in the same memory space,
	so on x86 it actually works to just deference a pointer, but it's not
	portable).

When reading or writing words directly to IO memory, in order to be portable
the Linux kernel provides the abstraction detailed in section "Differences
between I/O access functions" of Documentation/driver-api/device-io.rst.

This limits our ability to simply overlay our structs on top a buffer
and directly access it since that buffer may come from IO memory rather than
system memory. Hence the approach taken in intel_guc_ads.c needs to be
refactored. This is not the only place in i915 that neeed to be changed, but
the one causing the most problems, with a real reproducer. This first set of
patch focuses on fixing the gem object to pass the ADS

After the addition of a few helpers in the dma_buf_map API, most of
intel_guc_ads.c can be converted to use it. The exception is the regset
initialization: we'd incur into a lot of extra indirection when
reading/writting each register. So the regset is converted to use a
temporary buffer allocated on probe, which is then copied to its
final location when finishing the initialization or on gt reset.

Testing on some discrete cards, after this change we can correctly pass the
ADS struct to GuC and have it initialized correctly.

thanks,
Lucas De Marchi

Lucas De Marchi (19):
  dma-buf-map: Rename to iosys-map
  iosys-map: Add offset to iosys_map_memcpy_to()
  iosys-map: Add a few more helpers
  drm/i915/gt: Add helper for shmem copy to iosys_map
  drm/i915/guc: Keep iosys_map of ads_blob around
  drm/i915/guc: Add read/write helpers for ADS blob
  drm/i915/guc: Convert golden context init to iosys_map
  drm/i915/guc: Convert policies update to iosys_map
  drm/i915/guc: Convert engine record to iosys_map
  drm/i915/guc: Convert guc_ads_private_data_reset to iosys_map
  drm/i915/guc: Convert golden context prep to iosys_map
  drm/i915/guc: Replace check for golden context size
  drm/i915/guc: Convert mapping table to iosys_map
  drm/i915/guc: Convert capture list to iosys_map
  drm/i915/guc: Prepare for error propagation
  drm/i915/guc: Use a single pass to calculate regset
  drm/i915/guc: Convert guc_mmio_reg_state_init to iosys_map
  drm/i915/guc: Convert __guc_ads_init to iosys_map
  drm/i915/guc: Remove plain ads_blob pointer

 Documentation/driver-api/device-io.rst        |   9 +
 Documentation/driver-api/dma-buf.rst          |   9 -
 Documentation/gpu/todo.rst                    |  20 +-
 MAINTAINERS                                   |   9 +-
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
 drivers/gpu/drm/i915/gt/shmem_utils.c         |  33 ++
 drivers/gpu/drm/i915/gt/shmem_utils.h         |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  14 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    | 383 +++++++++-------
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h    |   3 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  17 +-
 drivers/gpu/drm/lima/lima_gem.c               |   3 +-
 drivers/gpu/drm/lima/lima_sched.c             |   4 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c        |   7 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.h        |   5 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c        |   4 +-
 drivers/gpu/drm/msm/msm_drv.h                 |   4 +-
 drivers/gpu/drm/msm/msm_gem_prime.c           |   6 +-
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
 drivers/gpu/drm/ttm/ttm_resource.c            |  42 +-
 drivers/gpu/drm/ttm/ttm_tt.c                  |   8 +-
 drivers/gpu/drm/udl/udl_modeset.c             |   3 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c         |   4 +-
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
 include/linux/dma-buf-map.h                   | 266 ------------
 include/linux/dma-buf.h                       |  12 +-
 include/linux/iosys-map.h                     | 410 ++++++++++++++++++
 85 files changed, 1043 insertions(+), 730 deletions(-)
 delete mode 100644 include/linux/dma-buf-map.h
 create mode 100644 include/linux/iosys-map.h

-- 
2.35.1

