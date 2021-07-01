Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E763B9733
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 22:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 584316EBA0;
	Thu,  1 Jul 2021 20:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCFCE6EB8E;
 Thu,  1 Jul 2021 20:25:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="208567499"
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="208567499"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:19 -0700
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="644564397"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 00/53] Begin enabling Xe_HP SDV and DG2 platforms
Date: Thu,  1 Jul 2021 13:23:34 -0700
Message-Id: <20210701202427.1547543-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 James Ausmus <james.ausmus@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series provides some of the initial enablement patches for two
upcoming discrete GPUs:
 * XeHP SDV:  Xe_HP (version 12.50) graphics IP, no display IP
 * DG2:  Xe_HPG (version 12.55) graphics IP, Xe_LPD (version 13) display IP

Both platforms will need additional enablement patches beyond what's
present in this series before they're truly usable, including various
LMEM and GuC work that's already happening separately.  The new
features/functionality that these platforms bring (such as multi-tile
support, dedicated compute engines, etc.) may be referenced in passing
in some of these patches but will be fully enabled in future series.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: James Ausmus <james.ausmus@intel.com>


Akeem G Abodunrin (1):
  drm/i915/dg2: Add new LRI reg offsets

Animesh Manna (1):
  drm/i915/dg2: Update to bigjoiner path

Ankit Nautiyal (1):
  drm/i915/dg2: Configure PCON in DP pre-enable path

Anusha Srivatsa (2):
  drm/i915/display/dsc: Add Per connector debugfs node for DSC BPP
    enable
  drm/i915/display/dsc: Set BPP in the kernel

Daniele Ceraolo Spurio (1):
  drm/i915/xehp: handle new steering options

Gwan-gyeong Mun (1):
  drm/i915/dg2: Update lane disable power state during PSR

John Harrison (4):
  drm/i915/selftests: Allow for larger engine counts
  drm/i915/xehp: Extra media engines - Part 1 (engine definitions)
  drm/i915/xehp: Extra media engines - Part 2 (interrupts)
  drm/i915/xehp: Extra media engines - Part 3 (reset)

José Roberto de Souza (1):
  drm/i915/dg2: Add DG2 to the PSR2 defeature list

Lucas De Marchi (5):
  drm/i915: Add "release id" version
  drm/i915: Add XE_HP initial definitions
  drm/i915/xehpsdv: add initial XeHP SDV definitions
  drm/i915/xehpsdv: Define MOCS table for XeHP SDV
  drm/i915/xehpsdv: factor out function to read RP_STATE_CAP

Matt Roper (29):
  drm/i915/xehp: Xe_HP forcewake support
  drm/i915/xehp: Define multicast register ranges
  drm/i915/xehp: Loop over all gslices for INSTDONE processing
  drm/i915/xehpsdv: Add maximum sseu limits
  drm/i915/xehpsdv: Define steering tables
  drm/i915/xehpsdv: Read correct RP_STATE_CAP register
  drm/i915/dg2: add DG2 platform info
  drm/i915/dg2: DG2 uses the same sseu limits as XeHP SDV
  drm/i915/dg2: Add forcewake table
  drm/i915/dg2: Update LNCF steering ranges
  drm/i915/dg2: Add SQIDI steering
  drm/i915/dg2: Maintain backward-compatible nested batch behavior
  drm/i915/dg2: Report INSTDONE_GEOM values in error state
  drm/i915/dg2: Define MOCS table for DG2
  drm/i915/dg2: Add fake PCH
  drm/i915/dg2: Add cdclk table and reference clock
  drm/i915/dg2: Skip shared DPLL handling
  drm/i915/dg2: Don't wait for AUX power well enable ACKs
  drm/i915/dg2: Setup display outputs
  drm/i915/dg2: Add dbuf programming
  drm/i915/dg2: Don't program BW_BUDDY registers
  drm/i915/dg2: Don't read DRAM info
  drm/i915/dg2: DG2 has fixed memory bandwidth
  drm/i915/dg2: Add MPLLB programming for SNPS PHY
  drm/i915/dg2: Add MPLLB programming for HDMI
  drm/i915/dg2: Add vswing programming for SNPS phys
  drm/i915/dg2: Update modeset sequences
  drm/i915/dg2: Classify DG2 PHY types
  drm/i915/dg2: Wait for SNPS PHY calibration during display init

Matthew Auld (1):
  drm/i915/xehp: Changes to ss/eu definitions

Paulo Zanoni (1):
  drm/i915: Fork DG1 interrupt handler

Prathap Kumar Valsan (1):
  drm/i915/xehp: New engine context offsets

Stuart Summers (2):
  drm/i915/xehp: Handle new device context ID format
  drm/i915/xehpsdv: Add compute DSS type

Tvrtko Ursulin (1):
  drm/i915/xehp: VDBOX/VEBOX fusing registers are enable-based

Venkata Sandeep Dhanalakota (1):
  drm/i915/gen12: Use fuse info to enable SFC

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_bw.c       |  24 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  24 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      | 165 +++-
 drivers/gpu/drm/i915/display/intel_display.c  |  94 +-
 drivers/gpu/drm/i915/display/intel_display.h  |   1 +
 .../drm/i915/display/intel_display_debugfs.c  | 103 ++-
 .../drm/i915/display/intel_display_power.c    |  25 +
 .../drm/i915/display/intel_display_power.h    |  10 +
 .../drm/i915/display/intel_display_types.h    |  18 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |  23 +-
 drivers/gpu/drm/i915/display/intel_dpll.c     |  12 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |   5 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  11 +
 drivers/gpu/drm/i915/display/intel_psr.c      |  10 +-
 drivers/gpu/drm/i915/display/intel_snps_phy.c | 862 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_snps_phy.h |  35 +
 drivers/gpu/drm/i915/gt/debugfs_gt_pm.c       |   8 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      |   7 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 144 ++-
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |  29 +-
 .../drm/i915/gt/intel_execlists_submission.c  |  78 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            |  66 +-
 drivers/gpu/drm/i915/gt/intel_gt.h            |   1 +
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  13 +-
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |   7 +
 drivers/gpu/drm/i915/gt/intel_lrc.c           | 156 +++-
 drivers/gpu/drm/i915/gt/intel_lrc_reg.h       |   2 +
 drivers/gpu/drm/i915/gt/intel_mocs.c          |  66 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c   |   1 +
 drivers/gpu/drm/i915/gt/intel_reset.c         |   6 +
 drivers/gpu/drm/i915/gt/intel_rps.c           |  19 +-
 drivers/gpu/drm/i915/gt/intel_rps.h           |   1 +
 drivers/gpu/drm/i915/gt/intel_sseu.c          | 116 ++-
 drivers/gpu/drm/i915/gt/intel_sseu.h          |  20 +-
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c  |   2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   | 175 +++-
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |  10 +-
 .../gpu/drm/i915/gt/selftest_workarounds.c    |  32 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |   8 +-
 drivers/gpu/drm/i915/i915_drv.h               |  48 +-
 drivers/gpu/drm/i915/i915_getparam.c          |   6 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         |  36 +-
 drivers/gpu/drm/i915/i915_irq.c               | 141 ++-
 drivers/gpu/drm/i915/i915_pci.c               |  63 +-
 drivers/gpu/drm/i915/i915_perf.c              |  29 +-
 drivers/gpu/drm/i915/i915_reg.h               | 109 ++-
 drivers/gpu/drm/i915/intel_device_info.c      |   4 +
 drivers/gpu/drm/i915/intel_device_info.h      |  10 +-
 drivers/gpu/drm/i915/intel_dram.c             |   6 +-
 drivers/gpu/drm/i915/intel_pch.c              |   3 +
 drivers/gpu/drm/i915/intel_pch.h              |   2 +
 drivers/gpu/drm/i915/intel_pm.c               | 120 ++-
 drivers/gpu/drm/i915/intel_step.c             |  20 +-
 drivers/gpu/drm/i915/intel_step.h             |   1 +
 drivers/gpu/drm/i915/intel_uncore.c           | 367 ++++++--
 drivers/gpu/drm/i915/intel_uncore.h           |  14 +-
 drivers/gpu/drm/i915/selftests/intel_uncore.c |   2 +
 include/uapi/drm/i915_drm.h                   |   3 -
 59 files changed, 3085 insertions(+), 289 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_snps_phy.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_snps_phy.h

-- 
2.25.4

