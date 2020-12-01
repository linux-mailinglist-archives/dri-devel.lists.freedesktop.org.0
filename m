Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 389382C9F5D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 11:35:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C55EA89FDB;
	Tue,  1 Dec 2020 10:35:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8DE89FDB;
 Tue,  1 Dec 2020 10:35:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CF874ACC1;
 Tue,  1 Dec 2020 10:35:48 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v2 00/20] drm: Move struct drm_device.pdev to legacy
Date: Tue,  1 Dec 2020 11:35:22 +0100
Message-Id: <20201201103542.2182-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 spice-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pdev field in struct drm_device points to a PCI device structure and
goes back to UMS-only days when all DRM drivers were for PCI devices.
Meanwhile we also support USB, SPI and platform devices. Each of those
uses the generic device stored in struct drm_device.dev.

To reduce duplication and remove the special case of PCI, this patchset
converts all modesetting drivers from pdev to dev and makes pdev a field
for legacy UMS drivers.

For PCI devices, the pointer in struct drm_device.dev can be upcasted to
struct pci_device; or tested for PCI with dev_is_pci(). In several places
the code can use the dev field directly.

After converting all drivers and the DRM core, the pdev fields becomes
only relevant for legacy drivers. In a later patchset, we may want to
convert these as well and remove pdev entirely.

The patchset touches many files, but the individual changes are mostly
trivial. I suggest to merge each driver's patch through the respective
tree and later the rest through drm-misc-next.

v2:
	* move whitespace fixes into separate patches (Alex, Sam)
	* move i915 gt/ and gvt/ changes into separate patches (Joonas)

Thomas Zimmermann (20):
  drm/amdgpu: Fix trailing whitespaces
  drm/amdgpu: Remove references to struct drm_device.pdev
  drm/ast: Remove references to struct drm_device.pdev
  drm/bochs: Remove references to struct drm_device.pdev
  drm/cirrus: Remove references to struct drm_device.pdev
  drm/gma500: Fix trailing whitespaces
  drm/gma500: Remove references to struct drm_device.pdev
  drm/hibmc: Remove references to struct drm_device.pdev
  drm/i915: Remove references to struct drm_device.pdev
  drm/i915/gt: Remove references to struct drm_device.pdev
  drm/i915/gvt: Remove references to struct drm_device.pdev
  drm/mgag200: Remove references to struct drm_device.pdev
  drm/nouveau: Remove references to struct drm_device.pdev
  drm/qxl: Remove references to struct drm_device.pdev
  drm/radeon: Fix trailing whitespaces
  drm/radeon: Remove references to struct drm_device.pdev
  drm/vboxvideo: Remove references to struct drm_device.pdev
  drm/virtgpu: Remove references to struct drm_device.pdev
  drm/vmwgfx: Remove references to struct drm_device.pdev
  drm: Upcast struct drm_device.dev to struct pci_device; replace pdev

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 23 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 10 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       | 10 +--
 drivers/gpu/drm/ast/ast_drv.c                 |  4 +-
 drivers/gpu/drm/ast/ast_main.c                | 25 +++---
 drivers/gpu/drm/ast/ast_mm.c                  | 17 ++--
 drivers/gpu/drm/ast/ast_mode.c                |  5 +-
 drivers/gpu/drm/ast/ast_post.c                |  8 +-
 drivers/gpu/drm/bochs/bochs_drv.c             |  1 -
 drivers/gpu/drm/bochs/bochs_hw.c              |  4 +-
 drivers/gpu/drm/drm_agpsupport.c              |  9 +-
 drivers/gpu/drm/drm_bufs.c                    |  4 +-
 drivers/gpu/drm/drm_edid.c                    |  7 +-
 drivers/gpu/drm/drm_irq.c                     | 12 +--
 drivers/gpu/drm/drm_pci.c                     | 26 +++---
 drivers/gpu/drm/drm_vm.c                      |  2 +-
 drivers/gpu/drm/gma500/cdv_device.c           | 30 ++++---
 drivers/gpu/drm/gma500/cdv_intel_crt.c        |  3 +-
 drivers/gpu/drm/gma500/cdv_intel_lvds.c       |  4 +-
 drivers/gpu/drm/gma500/framebuffer.c          |  9 +-
 drivers/gpu/drm/gma500/gma_device.c           |  3 +-
 drivers/gpu/drm/gma500/gma_display.c          |  4 +-
 drivers/gpu/drm/gma500/gtt.c                  | 20 +++--
 drivers/gpu/drm/gma500/intel_bios.c           |  6 +-
 drivers/gpu/drm/gma500/intel_gmbus.c          |  4 +-
 drivers/gpu/drm/gma500/intel_i2c.c            |  2 +-
 drivers/gpu/drm/gma500/mdfld_device.c         |  4 +-
 drivers/gpu/drm/gma500/mdfld_dsi_dpi.c        |  8 +-
 drivers/gpu/drm/gma500/mid_bios.c             |  9 +-
 drivers/gpu/drm/gma500/oaktrail_device.c      |  5 +-
 drivers/gpu/drm/gma500/oaktrail_lvds.c        |  2 +-
 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c    |  2 +-
 drivers/gpu/drm/gma500/opregion.c             |  3 +-
 drivers/gpu/drm/gma500/power.c                | 13 +--
 drivers/gpu/drm/gma500/psb_drv.c              | 16 ++--
 drivers/gpu/drm/gma500/psb_drv.h              |  8 +-
 drivers/gpu/drm/gma500/psb_intel_lvds.c       |  6 +-
 drivers/gpu/drm/gma500/psb_intel_sdvo.c       |  2 +-
 drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c    | 36 ++++----
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   | 10 +--
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c   |  2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c   |  4 +-
 drivers/gpu/drm/i915/display/intel_bios.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    | 14 +--
 drivers/gpu/drm/i915/display/intel_csr.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |  2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c    |  2 +-
 .../gpu/drm/i915/display/intel_lpe_audio.c    |  5 +-
 drivers/gpu/drm/i915/display/intel_opregion.c |  6 +-
 drivers/gpu/drm/i915/display/intel_overlay.c  |  2 +-
 drivers/gpu/drm/i915/display/intel_panel.c    |  4 +-
 drivers/gpu/drm/i915/display/intel_quirks.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_vga.c      |  8 +-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c      |  6 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  2 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          | 10 +--
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  2 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c           |  4 +-
 drivers/gpu/drm/i915/gt/intel_reset.c         |  6 +-
 drivers/gpu/drm/i915/gvt/cfg_space.c          |  5 +-
 drivers/gpu/drm/i915/gvt/firmware.c           | 10 +--
 drivers/gpu/drm/i915/gvt/gtt.c                | 12 +--
 drivers/gpu/drm/i915/gvt/gvt.c                |  6 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c              |  4 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |  2 +-
 drivers/gpu/drm/i915/i915_drv.c               | 20 ++---
 drivers/gpu/drm/i915/i915_drv.h               |  2 +-
 drivers/gpu/drm/i915/i915_gem_gtt.c           |  4 +-
 drivers/gpu/drm/i915/i915_getparam.c          |  5 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         |  2 +-
 drivers/gpu/drm/i915/i915_irq.c               |  6 +-
 drivers/gpu/drm/i915/i915_pmu.c               |  5 +-
 drivers/gpu/drm/i915/i915_suspend.c           |  4 +-
 drivers/gpu/drm/i915/i915_switcheroo.c        |  4 +-
 drivers/gpu/drm/i915/i915_vgpu.c              |  2 +-
 drivers/gpu/drm/i915/intel_device_info.c      |  2 +-
 drivers/gpu/drm/i915/intel_region_lmem.c      |  8 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c       |  2 +-
 drivers/gpu/drm/i915/intel_uncore.c           |  4 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  1 -
 drivers/gpu/drm/i915/selftests/mock_gtt.c     |  2 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c         | 20 +++--
 drivers/gpu/drm/mgag200/mgag200_i2c.c         |  2 +-
 drivers/gpu/drm/mgag200/mgag200_mm.c          | 10 ++-
 drivers/gpu/drm/nouveau/dispnv04/arb.c        | 12 +--
 drivers/gpu/drm/nouveau/dispnv04/disp.h       | 14 +--
 drivers/gpu/drm/nouveau/dispnv04/hw.c         | 10 ++-
 drivers/gpu/drm/nouveau/nouveau_abi16.c       |  7 +-
 drivers/gpu/drm/nouveau/nouveau_acpi.c        |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bios.c        | 11 ++-
 drivers/gpu/drm/nouveau/nouveau_connector.c   | 10 ++-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  5 +-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c       |  6 +-
 drivers/gpu/drm/nouveau/nouveau_vga.c         | 20 +++--
 drivers/gpu/drm/qxl/qxl_drv.c                 |  2 +-
 drivers/gpu/drm/qxl/qxl_ioctl.c               |  3 +-
 drivers/gpu/drm/qxl/qxl_irq.c                 |  3 +-
 drivers/gpu/drm/qxl/qxl_kms.c                 |  1 -
 drivers/gpu/drm/radeon/atombios_encoders.c    |  6 +-
 drivers/gpu/drm/radeon/r100.c                 | 27 +++---
 drivers/gpu/drm/radeon/radeon.h               | 32 +++----
 drivers/gpu/drm/radeon/radeon_atombios.c      | 89 ++++++++++---------
 drivers/gpu/drm/radeon/radeon_bios.c          |  6 +-
 drivers/gpu/drm/radeon/radeon_combios.c       | 55 ++++++------
 drivers/gpu/drm/radeon/radeon_cs.c            |  3 +-
 drivers/gpu/drm/radeon/radeon_device.c        | 17 ++--
 drivers/gpu/drm/radeon/radeon_display.c       |  2 +-
 drivers/gpu/drm/radeon/radeon_drv.c           |  3 +-
 drivers/gpu/drm/radeon/radeon_fb.c            |  2 +-
 drivers/gpu/drm/radeon/radeon_gem.c           |  6 +-
 drivers/gpu/drm/radeon/radeon_i2c.c           |  2 +-
 drivers/gpu/drm/radeon/radeon_irq_kms.c       |  2 +-
 drivers/gpu/drm/radeon/radeon_kms.c           | 20 ++---
 .../gpu/drm/radeon/radeon_legacy_encoders.c   |  6 +-
 drivers/gpu/drm/radeon/rs780_dpm.c            |  7 +-
 drivers/gpu/drm/tiny/cirrus.c                 |  1 -
 drivers/gpu/drm/vboxvideo/vbox_drv.c          | 11 +--
 drivers/gpu/drm/vboxvideo/vbox_irq.c          |  4 +-
 drivers/gpu/drm/vboxvideo/vbox_main.c         |  8 +-
 drivers/gpu/drm/vboxvideo/vbox_ttm.c          |  7 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c          |  1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c        |  8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           | 27 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c            |  2 +-
 include/drm/drm_device.h                      | 12 ++-
 132 files changed, 584 insertions(+), 507 deletions(-)

--
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
