Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB44F3D439B
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 02:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4852E6FD1B;
	Sat, 24 Jul 2021 00:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEA36FD16;
 Sat, 24 Jul 2021 00:11:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10054"; a="191563439"
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="191563439"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 17:11:27 -0700
X-IronPort-AV: E=Sophos;i="5.84,265,1620716400"; d="scan'208";a="434269958"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 17:11:26 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 00/30] Remove CNL support
Date: Fri, 23 Jul 2021 17:10:44 -0700
Message-Id: <20210724001114.249295-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Jose Souza <jose.souza@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Patches 1 and 2 are already being reviewed elsewhere. Discussion on 2nd
patch made me revive something I started after comment from Ville
at https://patchwork.freedesktop.org/patch/428168/?series=88988&rev=1#comment_768918

This removes CNL completely from the driver, while trying to rename
functions and macros where appropriate (usually to GLK when dealing with
display or with ICL otherwise). It starts with display, which is more
straightforward, and then proceed to the rest of i915.

diff stat removing 1600 lines of dead code seems to pay the pain of
doing this.


Lucas De Marchi (30):
  drm/i915: fix not reading DSC disable fuse in GLK
  drm/i915/display: split DISPLAY_VER 9 and 10 in intel_setup_outputs()
  drm/i915/display: remove PORT_F workaround for CNL
  drm/i915/display: remove explicit CNL handling from intel_cdclk.c
  drm/i915/display: remove explicit CNL handling from intel_color.c
  drm/i915/display: remove explicit CNL handling from intel_combo_phy.c
  drm/i915/display: remove explicit CNL handling from intel_crtc.c
  drm/i915/display: remove explicit CNL handling from intel_ddi.c
  drm/i915/display: remove explicit CNL handling from
    intel_display_debugfs.c
  drm/i915/display: remove explicit CNL handling from intel_dmc.c
  drm/i915/display: remove explicit CNL handling from intel_dp.c
  drm/i915/display: remove explicit CNL handling from intel_dpll_mgr.c
  drm/i915/display: remove explicit CNL handling from intel_vdsc.c
  drm/i915/display: remove explicit CNL handling from
    skl_universal_plane.c
  drm/i915/display: remove explicit CNL handling from
    intel_display_power.c
  drm/i915/display: remove CNL ddi buf translation tables
  drm/i915/display: rename CNL references in skl_scaler.c
  drm/i915: remove explicit CNL handling from i915_irq.c
  drm/i915: remove explicit CNL handling from intel_pm.c
  drm/i915: remove explicit CNL handling from intel_mocs.c
  drm/i915: remove explicit CNL handling from intel_pch.c
  drm/i915: remove explicit CNL handling from intel_wopcm.c
  drm/i915/gt: remove explicit CNL handling from intel_sseu.c
  drm/i915: rename CNL references in intel_dram.c
  drm/i915/gt: rename CNL references in intel_engine.h
  drm/i915: finish removal of CNL
  drm/i915: remove GRAPHICS_VER == 10
  drm/i915: rename/remove CNL registers
  drm/i915: replace random CNL comments
  drm/i915: switch num_scalers/num_sprites to consider DISPLAY_VER

 drivers/gpu/drm/i915/display/intel_bios.c     |   8 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  72 +-
 drivers/gpu/drm/i915/display/intel_color.c    |   5 +-
 .../gpu/drm/i915/display/intel_combo_phy.c    | 106 +--
 drivers/gpu/drm/i915/display/intel_crtc.c     |   2 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      | 266 +-------
 .../drm/i915/display/intel_ddi_buf_trans.c    | 616 +++++-------------
 .../drm/i915/display/intel_ddi_buf_trans.h    |   4 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   3 +-
 .../drm/i915/display/intel_display_debugfs.c  |   2 +-
 .../drm/i915/display/intel_display_power.c    | 289 --------
 .../drm/i915/display/intel_display_power.h    |   2 -
 drivers/gpu/drm/i915/display/intel_dmc.c      |   9 -
 drivers/gpu/drm/i915/display/intel_dp.c       |  35 +-
 drivers/gpu/drm/i915/display/intel_dp_aux.c   |   1 -
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 586 +++--------------
 drivers/gpu/drm/i915/display/intel_dpll_mgr.h |   1 -
 drivers/gpu/drm/i915/display/intel_vbt_defs.h |   2 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c     |   5 +-
 drivers/gpu/drm/i915/display/skl_scaler.c     |  10 +-
 .../drm/i915/display/skl_universal_plane.c    |  14 +-
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |   1 -
 drivers/gpu/drm/i915/gt/debugfs_gt_pm.c       |  10 +-
 drivers/gpu/drm/i915/gt/intel_engine.h        |   2 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   3 -
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |   4 +-
 .../gpu/drm/i915/gt/intel_gt_clock_utils.c    |  10 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c           |   6 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c           |  42 +-
 drivers/gpu/drm/i915/gt/intel_mocs.c          |   2 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c           |   2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c           |   4 +-
 drivers/gpu/drm/i915/gt/intel_sseu.c          |  79 ---
 drivers/gpu/drm/i915/gt/intel_sseu.h          |   2 +-
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c  |   6 +-
 drivers/gpu/drm/i915/gvt/gtt.c                |   2 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |   6 +-
 drivers/gpu/drm/i915/i915_drv.h               |  13 +-
 drivers/gpu/drm/i915/i915_irq.c               |   7 +-
 drivers/gpu/drm/i915/i915_pci.c               |  23 +-
 drivers/gpu/drm/i915/i915_perf.c              |  22 +-
 drivers/gpu/drm/i915/i915_reg.h               | 245 ++-----
 drivers/gpu/drm/i915/intel_device_info.c      |  23 +-
 drivers/gpu/drm/i915/intel_device_info.h      |   4 +-
 drivers/gpu/drm/i915/intel_dram.c             |  32 +-
 drivers/gpu/drm/i915/intel_pch.c              |   5 +-
 drivers/gpu/drm/i915/intel_pm.c               |  41 +-
 drivers/gpu/drm/i915/intel_wopcm.c            |  10 +-
 48 files changed, 516 insertions(+), 2128 deletions(-)

-- 
2.31.1

