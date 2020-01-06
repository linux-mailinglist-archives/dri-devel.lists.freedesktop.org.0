Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F88F1316B8
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 18:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E9E6E4C7;
	Mon,  6 Jan 2020 17:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0CF6E4C1;
 Mon,  6 Jan 2020 17:28:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jan 2020 09:28:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,403,1571727600"; d="scan'208";a="225496088"
Received: from plaxmina-desktop.iind.intel.com ([10.106.124.119])
 by fmsmga001.fm.intel.com with ESMTP; 06 Jan 2020 09:28:15 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: rodrigo.vivi@intel.com, irlied@linux.ie, daniel@ffwll.ch,
 sudeep.dutt@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [Intel-gfx] [RFC 0/7] drm/i915: Convert WARN* to use device-specific
 variants
Date: Mon,  6 Jan 2020 22:53:19 +0530
Message-Id: <20200106172326.32592-1-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Device specific dev_WARN and dev_WARN_ONCE macros available in kernel
include device information in the backtrace, so we know what device
the warnings originate from.

Knowing the device specific information in the backtrace would be
helpful in development all around.

This patch series aims to convert calls of WARN(), WARN_ON(),
WARN_ONCE() and WARN_ON_ONCE() to use the device-specific variants
automatically wherever struct device pointer is available. 

To do this, this patch series -
  - modifies the existing dev_WARN macro to support conditional warning
    like WARN so that WARNs can be replaced with dev_WARN
  - add dev_WARN_ON and dev_WARN_ON_ONCE macros device specific macros
    similar to WARN_ON and WARN_ON_ONCE into i915
  - automatically convert WARN* with device specific dev_WARN*
    variants using coccinelle semantic patch scripts.

The goal is to convert all the calls of WARN* with dev_WARN*, but there
are still cases where device pointer is not readily available in some
functions (or I missed them somehow) having warning hence some manual
churning is needed. Handle such remaining cases separately later.


Pankaj Bharadiya (7):
  treewide: device: add condition support to dev_WARN
  drm/i915/i915_utils: add dev_WARN_ON and dev_WARN_ON_ONCE macros
  drm/i915: add helper functions to get device ptr
  drm/i915: Make WARN* device specific where drm_device ptr available
  drm/i915: Make WARN* device specific where drm_priv ptr is available
  drm/i915: Make WARN* device specific where dev_priv can be extracted.
  drm/i915: Make WARN* device specific for various cases.

 arch/x86/platform/intel-mid/pwr.c             |   3 +-
 drivers/base/core.c                           |   2 +-
 drivers/base/dd.c                             |   3 +-
 drivers/dax/bus.c                             |   2 +-
 drivers/dma/dw/core.c                         |   3 +-
 drivers/dma/ioat/init.c                       |   2 +-
 drivers/dma/tegra210-adma.c                   |   6 +-
 drivers/gnss/core.c                           |   2 +-
 drivers/gpu/drm/i915/display/icl_dsi.c        |  14 +-
 drivers/gpu/drm/i915/display/intel_atomic.c   |   8 +-
 drivers/gpu/drm/i915/display/intel_audio.c    |  23 +-
 drivers/gpu/drm/i915/display/intel_bios.c     |  13 +-
 drivers/gpu/drm/i915/display/intel_bw.c       |   3 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  85 +++---
 drivers/gpu/drm/i915/display/intel_color.c    |   4 +-
 .../gpu/drm/i915/display/intel_combo_phy.c    |   3 +-
 .../gpu/drm/i915/display/intel_connector.c    |   3 +-
 drivers/gpu/drm/i915/display/intel_crt.c      |  15 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      | 118 +++++---
 drivers/gpu/drm/i915/display/intel_display.c  | 261 +++++++++++-------
 .../drm/i915/display/intel_display_power.c    | 190 ++++++++-----
 .../drm/i915/display/intel_display_types.h    |  14 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 137 +++++----
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  10 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c |   3 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  49 ++--
 drivers/gpu/drm/i915/display/intel_dsb.c      |   9 +-
 .../i915/display/intel_dsi_dcs_backlight.c    |   2 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |   5 +-
 drivers/gpu/drm/i915/display/intel_fbc.c      |  30 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    |  15 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c    |   4 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     |  26 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  81 +++---
 drivers/gpu/drm/i915/display/intel_hotplug.c  |   8 +-
 .../gpu/drm/i915/display/intel_lpe_audio.c    |   3 +-
 drivers/gpu/drm/i915/display/intel_lvds.c     |   7 +-
 drivers/gpu/drm/i915/display/intel_opregion.c |   8 +-
 drivers/gpu/drm/i915/display/intel_overlay.c  |  23 +-
 drivers/gpu/drm/i915/display/intel_panel.c    |  30 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c |   9 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |  38 ++-
 drivers/gpu/drm/i915/display/intel_sdvo.c     |  18 +-
 drivers/gpu/drm/i915/display/intel_sprite.c   |   6 +-
 drivers/gpu/drm/i915/display/intel_tc.c       |  24 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c     |   3 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c        |   3 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_pm.c        |   3 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  15 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  15 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  11 +-
 drivers/gpu/drm/i915/gt/intel_engine_user.c   |   3 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  15 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm_irq.c     |   2 +-
 drivers/gpu/drm/i915/gt/intel_mocs.c          |   5 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c           |   3 +-
 .../gpu/drm/i915/gt/intel_ring_submission.c   |   8 +-
 drivers/gpu/drm/i915/gt/intel_rps.c           |  23 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   |   3 +-
 drivers/gpu/drm/i915/gvt/aperture_gm.c        |   8 +-
 drivers/gpu/drm/i915/gvt/cfg_space.c          |  20 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c         |   5 +-
 drivers/gpu/drm/i915/gvt/display.c            |   5 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c             |   5 +-
 drivers/gpu/drm/i915/gvt/edid.c               |  14 +-
 drivers/gpu/drm/i915/gvt/gtt.c                |  15 +-
 drivers/gpu/drm/i915/gvt/gvt.c                |   6 +-
 drivers/gpu/drm/i915/gvt/gvt.h                |   5 +
 drivers/gpu/drm/i915/gvt/handlers.c           |  19 +-
 drivers/gpu/drm/i915/gvt/interrupt.c          |  11 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c              |   8 +-
 drivers/gpu/drm/i915/gvt/mmio.c               |  31 ++-
 drivers/gpu/drm/i915/gvt/mmio_context.c       |   7 +-
 drivers/gpu/drm/i915/gvt/scheduler.c          |   5 +-
 drivers/gpu/drm/i915/gvt/vgpu.c               |   5 +-
 drivers/gpu/drm/i915/i915_drv.c               |  23 +-
 drivers/gpu/drm/i915/i915_drv.h               |  11 +
 drivers/gpu/drm/i915/i915_gem.c               |   9 +-
 drivers/gpu/drm/i915/i915_gem_gtt.c           |   7 +-
 drivers/gpu/drm/i915/i915_irq.c               |  95 ++++---
 drivers/gpu/drm/i915/i915_perf.c              |  40 +--
 drivers/gpu/drm/i915/i915_pmu.c               |   9 +-
 drivers/gpu/drm/i915/i915_utils.h             |   8 +
 drivers/gpu/drm/i915/intel_csr.c              |   7 +-
 drivers/gpu/drm/i915/intel_pch.c              |  65 +++--
 drivers/gpu/drm/i915/intel_pm.c               | 101 ++++---
 drivers/gpu/drm/i915/intel_sideband.c         |   9 +-
 drivers/gpu/drm/i915/intel_uncore.c           |  58 ++--
 .../drm/nouveau/include/nvkm/subdev/timer.h   |   2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c       |   3 +-
 drivers/gpu/drm/tegra/dc.c                    |   2 +-
 drivers/gpu/drm/tegra/hub.c                   |   7 +-
 drivers/greybus/core.c                        |   3 +-
 drivers/i2c/i2c-core.h                        |   2 +-
 drivers/media/platform/exynos4-is/fimc-is.c   |   2 +-
 drivers/media/platform/exynos4-is/mipi-csis.c |   2 +-
 drivers/nvdimm/label.c                        |   2 +-
 drivers/nvdimm/namespace_devs.c               |   3 +-
 drivers/nvdimm/nd-core.h                      |   2 +-
 drivers/pci/controller/pci-mvebu.c            |   2 +-
 drivers/pci/endpoint/pci-epf-core.c           |   6 +-
 drivers/pci/iov.c                             |   2 +-
 drivers/phy/phy-core.c                        |   2 +-
 drivers/regulator/pbias-regulator.c           |   2 +-
 drivers/scsi/ufs/ufshcd.c                     |   3 +-
 drivers/thunderbolt/ctl.c                     |   2 +-
 drivers/thunderbolt/nhi.c                     |  12 +-
 drivers/thunderbolt/tb.h                      |   2 +-
 drivers/usb/core/urb.c                        |   8 +-
 drivers/usb/dwc3/dwc3-omap.c                  |   4 +-
 drivers/usb/dwc3/ep0.c                        |   2 +-
 drivers/usb/dwc3/gadget.c                     |   6 +-
 drivers/usb/host/uhci-q.c                     |   8 +-
 drivers/usb/typec/tcpm/wcove.c                |   4 +-
 drivers/vfio/vfio.c                           |   4 +-
 include/linux/device.h                        |   6 +-
 118 files changed, 1336 insertions(+), 822 deletions(-)

-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
