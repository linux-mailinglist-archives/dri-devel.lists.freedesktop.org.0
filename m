Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B41149F77
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 09:08:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A056EA17;
	Mon, 27 Jan 2020 08:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53FF86EA15;
 Mon, 27 Jan 2020 08:08:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jan 2020 00:08:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,369,1574150400"; d="scan'208";a="304553393"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 27 Jan 2020 00:08:25 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [Intel-gfx] [PATCH v4 0/4] drm: Introduce struct drm_device based
 WARN* and use them in i915
Date: Mon, 27 Jan 2020 13:26:49 +0530
Message-Id: <20200127075653.8523-1-pankaj.laxminarayan.bharadiya@intel.com>
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

Similar to this, add new struct drm_device based drm_WARN* macros. These
macros include device information in the backtrace, so we know
what device the warnings originate from. Knowing the device specific
information in the backtrace would be helpful in development all
around.

This patch series aims to convert calls of WARN(), WARN_ON(),
WARN_ONCE() and WARN_ON_ONCE() in i915 driver to use the drm
device-specific variants automatically wherever struct device pointer
is available.

To do this, this patch series -
  - introduces new struct drm_device based WARN* macros
  - automatically converts WARN* with device specific dev_WARN*
    variants using coccinelle semantic patch scripts.

The goal is to convert all the calls of WARN* with drm_WARN* in i915,
but there are still cases where device pointer is not readily
available in some functions (or I missed them somehow) using WARN*
hence some manual churning is needed. Handle such remaining cases
separately later.

changes since v3:
  - rebase pending unmerged patches on drm-tip
	(bc626bbb5b6e drm-tip: 2020y-01m-25d-14h-28m-41s UTC integration manifest)

changes since v2:
  - rebase pending unmerged patches on drm-tip

changes since v1:
  - Address Jani's review comments
    - Fix typo in comment of patch 0001
    - Get rid of helper functions
    - Split patches by directory

Changes since RFC at [1]
  - Introduce drm_WARN* macros and use them as suggested by Sam and Jani
  - Get rid of extra local variables

[1] https://patchwork.freedesktop.org/series/71668/


Pankaj Bharadiya (4):
  drm/i915/display: Make WARN* drm specific where drm_device ptr is available
  drm/i915/display: Make WARN* drm specific where drm_priv ptr is available
  drm/i915/gvt: Make WARN* drm specific where drm_priv ptr is available
  drm/i915/gvt: Make WARN* drm specific where vgpu ptr is available

 drivers/gpu/drm/i915/display/icl_dsi.c        |  14 +-
 drivers/gpu/drm/i915/display/intel_atomic.c   |   6 +-
 drivers/gpu/drm/i915/display/intel_audio.c    |  19 +-
 drivers/gpu/drm/i915/display/intel_bios.c     |  10 +-
 drivers/gpu/drm/i915/display/intel_bw.c       |   3 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  81 ++++---
 drivers/gpu/drm/i915/display/intel_color.c    |   4 +-
 .../gpu/drm/i915/display/intel_combo_phy.c    |   2 +-
 .../gpu/drm/i915/display/intel_connector.c    |   3 +-
 drivers/gpu/drm/i915/display/intel_crt.c      |  10 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |  94 ++++----
 drivers/gpu/drm/i915/display/intel_display.c  | 218 ++++++++++--------
 .../drm/i915/display/intel_display_power.c    | 167 ++++++++------
 drivers/gpu/drm/i915/display/intel_dp.c       | 117 ++++++----
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  10 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c |   3 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |  37 +--
 drivers/gpu/drm/i915/display/intel_dsb.c      |   6 +-
 .../i915/display/intel_dsi_dcs_backlight.c    |   2 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |   5 +-
 drivers/gpu/drm/i915/display/intel_fbc.c      |  23 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    |  13 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c    |   3 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     |  21 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  51 ++--
 drivers/gpu/drm/i915/display/intel_hotplug.c  |   7 +-
 .../gpu/drm/i915/display/intel_lpe_audio.c    |   2 +-
 drivers/gpu/drm/i915/display/intel_lvds.c     |   7 +-
 drivers/gpu/drm/i915/display/intel_opregion.c |   7 +-
 drivers/gpu/drm/i915/display/intel_overlay.c  |  12 +-
 drivers/gpu/drm/i915/display/intel_panel.c    |  19 +-
 drivers/gpu/drm/i915/display/intel_pipe_crc.c |   7 +-
 drivers/gpu/drm/i915/display/intel_psr.c      |  34 +--
 drivers/gpu/drm/i915/display/intel_sdvo.c     |  14 +-
 drivers/gpu/drm/i915/display/intel_sprite.c   |   5 +-
 drivers/gpu/drm/i915/display/intel_tc.c       |  17 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c     |   2 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c        |   2 +-
 drivers/gpu/drm/i915/gvt/aperture_gm.c        |   6 +-
 drivers/gpu/drm/i915/gvt/cfg_space.c          |  23 +-
 drivers/gpu/drm/i915/gvt/cmd_parser.c         |   4 +-
 drivers/gpu/drm/i915/gvt/display.c            |   6 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c             |   4 +-
 drivers/gpu/drm/i915/gvt/edid.c               |  19 +-
 drivers/gpu/drm/i915/gvt/gtt.c                |  21 +-
 drivers/gpu/drm/i915/gvt/gvt.c                |   4 +-
 drivers/gpu/drm/i915/gvt/handlers.c           |  22 +-
 drivers/gpu/drm/i915/gvt/interrupt.c          |  15 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c              |  10 +-
 drivers/gpu/drm/i915/gvt/mmio.c               |  30 ++-
 drivers/gpu/drm/i915/gvt/mmio_context.c       |   8 +-
 drivers/gpu/drm/i915/gvt/scheduler.c          |   6 +-
 drivers/gpu/drm/i915/gvt/vgpu.c               |   6 +-
 53 files changed, 714 insertions(+), 527 deletions(-)

-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
