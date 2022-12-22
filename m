Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6B1654863
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 23:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E761210E598;
	Thu, 22 Dec 2022 22:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B4810E594;
 Thu, 22 Dec 2022 22:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671748119; x=1703284119;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RQ20Ii0VCtNIoDQFRfmY0I75y8A4E7l3b+yp7/Ax53I=;
 b=UrG7slNdrMYjyhst/uOhEvYyqhoSLM3ta3g2SRDl3fPgV5ZZub4130yk
 vyaubX67Tn98HBnP63yk45jm8ENopUseAYUmB3mAHUGhMlXSAlOvjIICX
 I/ZCaj4rOcMlRyTrPYKf2EKw7cj1sNSuq8ivhvEG2AatzynLstYaD5/OY
 lI6dm2QijK1htr+QLQVHzaZaJJ0R1v0KmmdN6PmfmB2W+fVNUjX6elZN5
 Lvv79qiz3Ey3luZ55B+CTQmx8uk5Q6Sys3+QB6xScsPsMoeyzqyvrloEN
 qEm0oyQLNZrNzUAEm1UMg6FwVPeFiHAr2rzkdzCuqHgHwB8bJPWoGkJLJ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="406472845"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="406472845"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="645412302"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="645412302"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 14:28:37 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH 00/20] Initial Xe driver submission
Date: Thu, 22 Dec 2022 14:21:07 -0800
Message-Id: <20221222222127.34560-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This is a submission for Xe, a new driver for Intel GPUs that supports both
integrated and discrete platforms starting with Tiger Lake (first platform with
Intel Xe Architecture). The intention of this new driver is to have a fresh base
to work from that is unencumbered by older platforms, whilst also taking the
opportunity to rearchitect our driver to increase sharing across the drm
subsystem, both leveraging and allowing us to contribute more towards other
shared components like TTM and drm/scheduler. The memory model is based on VM
bind which is similar to the i915 implementation. Likewise the execbuf
implementation for Xe is very similar to execbuf3 in the i915 [1].

The code is at a stage where it is already functional and has experimental
support for multiple platforms starting from Tiger Lake, with initial support
implemented in Mesa (for Iris and Anv, our OpenGL and Vulkan drivers), as well
as in NEO (for OpenCL and Level0). A Mesa MR has been posted [2] and NEO
implementation will be released publicly early next year. We also have a suite
of IGTs for XE that will appear on the IGT list shortly.

It has been built with the assumption of supporting multiple architectures from
the get-go, right now with tests running both on X86 and ARM hosts. And we
intend to continue working on it and improving on it as part of the kernel
community upstream.

The new Xe driver leverages a lot from i915 and work on i915 continues as we
ready Xe for production throughout 2023.

As for display, the intent is to share the display code with the i915 driver so
that there is maximum reuse there. Currently this is being done by compiling the
display code twice, but alternatives to that are under consideration and we want
to have more discussion on what the best final solution will look like over the
next few months. Right now, work is ongoing in refactoring the display codebase
to remove as much as possible any unnecessary dependencies on i915 specific data
structures there..

We currently have 2 submission backends, execlists and GuC. The execlist is
meant mostly for testing and is not fully functional while GuC backend is fully
functional. As with the i915 and GuC submission, in Xe the GuC firmware is
required and should be placed in /lib/firmware/xe.

The GuC firmware can be found in the below location:
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915

The easiest way to setup firmware is:
cp -r /lib/firmware/i915 /lib/firmware/xe

The code has been organized such that we have all patches that touch areas
outside of drm/xe first for review, and then the actual new driver in a separate
commit. The code which is outside of drm/xe is included in this RFC while
drm/xe is not due to the size of the commit. The drm/xe is code is available in
a public repo listed below.

Xe driver commit:
https://cgit.freedesktop.org/drm/drm-xe/commit/?h=drm-xe-next&id=9cb016ebbb6a275f57b1cb512b95d5a842391ad7

Xe kernel repo:
https://cgit.freedesktop.org/drm/drm-xe/

There's a lot of work still to happen on Xe but we're very excited about it and
wanted to share it early and welcome feedback and discussion.

Cheers,
Matthew Brost

[1] https://patchwork.freedesktop.org/series/105879/
[2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/20418

Maarten Lankhorst (12):
  drm/amd: Convert amdgpu to use suballocation helper.
  drm/radeon: Use the drm suballocation manager implementation.
  drm/i915: Remove gem and overlay frontbuffer tracking
  drm/i915/display: Neuter frontbuffer tracking harder
  drm/i915/display: Add more macros to remove all direct calls to uncore
  drm/i915/display: Remove all uncore mmio accesses in favor of intel_de
  drm/i915: Rename find_section to find_bdb_section
  drm/i915/regs: Set DISPLAY_MMIO_BASE to 0 for xe
  drm/i915/display: Fix a use-after-free when intel_edp_init_connector
    fails
  drm/i915/display: Remaining changes to make xe compile
  sound/hda: Allow XE as i915 replacement for sound
  mei/hdcp: Also enable for XE

Matthew Brost (5):
  drm/sched: Convert drm scheduler to use a work queue rather than
    kthread
  drm/sched: Add generic scheduler message interface
  drm/sched: Start run wq before TDR in drm_sched_start
  drm/sched: Submit job before starting TDR
  drm/sched: Add helper to set TDR timeout

Thomas Hellström (3):
  drm/suballoc: Introduce a generic suballocation manager
  drm: Add a gpu page-table walker helper
  drm/ttm: Don't print error message if eviction was interrupted

 drivers/gpu/drm/Kconfig                       |   5 +
 drivers/gpu/drm/Makefile                      |   4 +
 drivers/gpu/drm/amd/amdgpu/Kconfig            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c   |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c        |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |  23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h      |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c        | 320 +-----------------
 drivers/gpu/drm/drm_pt_walk.c                 | 159 +++++++++
 drivers/gpu/drm/drm_suballoc.c                | 301 ++++++++++++++++
 drivers/gpu/drm/i915/Makefile                 |   2 +-
 drivers/gpu/drm/i915/display/hsw_ips.c        |   7 +-
 drivers/gpu/drm/i915/display/i9xx_plane.c     |   1 +
 drivers/gpu/drm/i915/display/intel_atomic.c   |   2 +
 .../gpu/drm/i915/display/intel_atomic_plane.c |  25 +-
 .../gpu/drm/i915/display/intel_backlight.c    |   2 +-
 drivers/gpu/drm/i915/display/intel_bios.c     |  71 ++--
 drivers/gpu/drm/i915/display/intel_bw.c       |  36 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  68 ++--
 drivers/gpu/drm/i915/display/intel_color.c    |   1 +
 drivers/gpu/drm/i915/display/intel_crtc.c     |  14 +-
 drivers/gpu/drm/i915/display/intel_cursor.c   |  14 +-
 drivers/gpu/drm/i915/display/intel_de.h       |  38 +++
 drivers/gpu/drm/i915/display/intel_display.c  | 155 +++++++--
 drivers/gpu/drm/i915/display/intel_display.h  |   9 +-
 .../gpu/drm/i915/display/intel_display_core.h |   5 +-
 .../drm/i915/display/intel_display_debugfs.c  |   8 +
 .../drm/i915/display/intel_display_power.c    |  40 ++-
 .../drm/i915/display/intel_display_power.h    |   6 +
 .../i915/display/intel_display_power_map.c    |   7 +
 .../i915/display/intel_display_power_well.c   |  24 +-
 .../drm/i915/display/intel_display_reg_defs.h |   4 +
 .../drm/i915/display/intel_display_trace.h    |   6 +
 .../drm/i915/display/intel_display_types.h    |  32 +-
 drivers/gpu/drm/i915/display/intel_dmc.c      |  17 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |  11 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c   |   6 +
 drivers/gpu/drm/i915/display/intel_dpio_phy.c |   9 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.h |  15 +
 drivers/gpu/drm/i915/display/intel_dpll.c     |   8 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |   4 +
 drivers/gpu/drm/i915/display/intel_drrs.c     |   1 +
 drivers/gpu/drm/i915/display/intel_dsb.c      | 124 +++++--
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |  26 +-
 drivers/gpu/drm/i915/display/intel_fb.c       | 108 ++++--
 drivers/gpu/drm/i915/display/intel_fb_pin.c   |   6 -
 drivers/gpu/drm/i915/display/intel_fbc.c      |  49 ++-
 drivers/gpu/drm/i915/display/intel_fbdev.c    | 108 +++++-
 .../gpu/drm/i915/display/intel_frontbuffer.c  | 103 +-----
 .../gpu/drm/i915/display/intel_frontbuffer.h  |  67 +---
 drivers/gpu/drm/i915/display/intel_gmbus.c    |   2 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     |   9 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |   1 -
 .../gpu/drm/i915/display/intel_lpe_audio.h    |   8 +
 .../drm/i915/display/intel_modeset_setup.c    |  11 +-
 drivers/gpu/drm/i915/display/intel_opregion.c |   2 +-
 drivers/gpu/drm/i915/display/intel_overlay.c  |  14 -
 .../gpu/drm/i915/display/intel_pch_display.h  |  16 +
 .../gpu/drm/i915/display/intel_pch_refclk.h   |   8 +
 drivers/gpu/drm/i915/display/intel_pipe_crc.c |   1 +
 .../drm/i915/display/intel_plane_initial.c    |   3 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |   1 +
 drivers/gpu/drm/i915/display/intel_sprite.c   |  21 ++
 drivers/gpu/drm/i915/display/intel_vbt_defs.h |   2 +-
 drivers/gpu/drm/i915/display/intel_vga.c      |   5 +
 drivers/gpu/drm/i915/display/skl_scaler.c     |   2 +
 .../drm/i915/display/skl_universal_plane.c    |  52 ++-
 drivers/gpu/drm/i915/display/skl_watermark.c  |  25 +-
 drivers/gpu/drm/i915/gem/i915_gem_clflush.c   |   4 -
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    |   7 -
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   2 -
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  25 --
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  22 --
 drivers/gpu/drm/i915/gem/i915_gem_phys.c      |   4 -
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   3 +-
 drivers/gpu/drm/i915/i915_driver.c            |   1 +
 drivers/gpu/drm/i915/i915_gem.c               |   8 -
 drivers/gpu/drm/i915/i915_gem_gtt.c           |   1 -
 drivers/gpu/drm/i915/i915_reg_defs.h          |   8 +
 drivers/gpu/drm/i915/i915_vma.c               |  12 -
 drivers/gpu/drm/radeon/radeon.h               |  55 +--
 drivers/gpu/drm/radeon/radeon_ib.c            |  12 +-
 drivers/gpu/drm/radeon/radeon_object.h        |  25 +-
 drivers/gpu/drm/radeon/radeon_sa.c            | 314 ++---------------
 drivers/gpu/drm/radeon/radeon_semaphore.c     |   6 +-
 drivers/gpu/drm/scheduler/sched_main.c        | 182 +++++++---
 drivers/gpu/drm/ttm/ttm_bo.c                  |   3 +-
 drivers/misc/mei/hdcp/Kconfig                 |   2 +-
 drivers/misc/mei/hdcp/mei_hdcp.c              |   3 +-
 include/drm/drm_pt_walk.h                     | 161 +++++++++
 include/drm/drm_suballoc.h                    | 112 ++++++
 include/drm/gpu_scheduler.h                   |  41 ++-
 sound/hda/hdac_i915.c                         |  17 +-
 sound/pci/hda/hda_intel.c                     |  56 +--
 sound/soc/intel/avs/core.c                    |  13 +-
 sound/soc/sof/intel/hda.c                     |   7 +-
 98 files changed, 2076 insertions(+), 1325 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_pt_walk.c
 create mode 100644 drivers/gpu/drm/drm_suballoc.c
 create mode 100644 include/drm/drm_pt_walk.h
 create mode 100644 include/drm/drm_suballoc.h

-- 
2.37.3

