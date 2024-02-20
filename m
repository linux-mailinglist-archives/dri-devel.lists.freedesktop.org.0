Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F5585C7FB
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 22:18:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0339410E54C;
	Tue, 20 Feb 2024 21:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L4CnV5HE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5113E10E0B6;
 Tue, 20 Feb 2024 21:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708463902; x=1739999902;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JG9YS4Jv1ER5tbgXkwhNzA2JztsWIvsFJiCsF/jGzzs=;
 b=L4CnV5HEzfHRX7lGaNPY0cfv783KhGmVQ2mL8L3WdI/ADvhr9UBr/N+0
 ldls44947oPAZk19/4oy8mBrLeS30E3Mq/xJbd4abSkdmIhHU5n/FeTui
 yUGctY4dGf+COB93nE3MTWFDck1zET4DTMidpV9SWWsY4ZUs+y5Chntfb
 BbIgKDMnv1y9UgdyQHicJaLDt4I0jqYtC2jEICfhsuMx6p9mCHvgZRCtY
 LUlDhSMzIJ7ozAl85nFn1+VYzCCZV1R+34I/q+JJtuUbjq69rnnPW/Ssj
 BkCXMkFetDMwVKEbE7BS3Wewkqd+glr/8BsQ4NPTntbsKzqGZacez2iLh g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2738640"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2738640"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5061570"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 13:18:18 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Uma Shankar <uma.shankar@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Saranya Gopal <saranya.gopal@intel.com>,
 Rajaram Regupathy <rajaram.regupathy@intel.com>,
 Gil Fine <gil.fine@intel.com>, Naama Shachar <naamax.shachar@intel.com>,
 Pengfei Xu <pengfei.xu@intel.com>
Subject: [PATCH v2 00/21] drm/i915: Add Display Port tunnel BW allocation
 support
Date: Tue, 20 Feb 2024 23:18:20 +0200
Message-Id: <20240220211841.448846-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.39.2
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

This is v2 of [1], with the following changes:

- Several functional/typo/formatting fixes, detailed in the patches.
- Move the BW allocation from encoder hooks to
  intel_atomic_commit_tail() fixing the allocation for MST streams
  enabled/disabled w/o a full modeset (i.e. w/o re-enabling the master
  stream).
- Fix an MST mode restore issue during system resume, which also lead
  to a tunnel BW allocation failure. (Patch 3)
- Ensure a DPCD DPRX cap read as required by the TBT CM any time a long
  HPD pulse is detected. (Patch 20)
- Explicitly disable the BW allocation mode during system suspend.

The patchset is also available at:
https://github.com/ideak/linux/commits/dp_tun_bw_alloc

Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Jouni Högander <jouni.hogander@intel.com>
Cc: Saranya Gopal <saranya.gopal@intel.com>
Cc: Rajaram Regupathy <rajaram.regupathy@intel.com>
Cc: Gil Fine <gil.fine@intel.com>
Cc: Naama Shachar <naamax.shachar@intel.com>
Cc: Pengfei Xu <pengfei.xu@intel.com>

[1] https://lore.kernel.org/all/20240123102850.390126-1-imre.deak@intel.com

Imre Deak (21):
  drm/dp: Add drm_dp_max_dprx_data_rate()
  drm/dp: Add support for DP tunneling
  drm/i915: Fix display bpp limit computation during system resume
  drm/i915/dp: Add support to notify MST connectors to retry modesets
  drm/i915/dp: Use drm_dp_max_dprx_data_rate()
  drm/i915/dp: Factor out intel_dp_config_required_rate()
  drm/i915/dp: Export intel_dp_max_common_rate/lane_count()
  drm/i915/dp: Factor out intel_dp_update_sink_caps()
  drm/i915/dp: Factor out intel_dp_read_dprx_caps()
  drm/i915/dp: Add intel_dp_max_link_data_rate()
  drm/i915/dp: Add way to get active pipes with syncing commits
  drm/i915/dp: Add support for DP tunnel BW allocation
  drm/i915/dp: Add DP tunnel atomic state and check BW limit
  drm/i915/dp: Account for tunnel BW limit in
    intel_dp_max_link_data_rate()
  drm/i915/dp: Compute DP tunnel BW during encoder state computation
  drm/i915/dp: Allocate/free DP tunnel BW in the encoder enable/disable
    hooks
  drm/i915/dp: Handle DP tunnel IRQs
  drm/i915/dp: Call intel_dp_sync_state() always for DDI DP encoders
  drm/i915/dp: Suspend/resume DP tunnels
  drm/i915/dp: Read DPRX for all long HPD pulses
  drm/i915/dp: Enable DP tunnel BW allocation mode

 drivers/gpu/drm/display/Kconfig               |   21 +
 drivers/gpu/drm/display/Makefile              |    2 +
 drivers/gpu/drm/display/drm_dp_helper.c       |   30 +
 drivers/gpu/drm/display/drm_dp_tunnel.c       | 1929 +++++++++++++++++
 drivers/gpu/drm/i915/Kconfig                  |   14 +
 drivers/gpu/drm/i915/Kconfig.debug            |    1 +
 drivers/gpu/drm/i915/Makefile                 |    3 +
 drivers/gpu/drm/i915/display/intel_atomic.c   |   10 +
 drivers/gpu/drm/i915/display/intel_crtc.c     |   52 +
 drivers/gpu/drm/i915/display/intel_crtc.h     |    2 +
 drivers/gpu/drm/i915/display/intel_ddi.c      |    3 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   26 +-
 .../gpu/drm/i915/display/intel_display_core.h |    1 +
 .../drm/i915/display/intel_display_driver.c   |   20 +-
 .../drm/i915/display/intel_display_types.h    |    9 +
 drivers/gpu/drm/i915/display/intel_dp.c       |  292 ++-
 drivers/gpu/drm/i915/display/intel_dp.h       |   13 +-
 .../drm/i915/display/intel_dp_link_training.c |   33 +-
 .../drm/i915/display/intel_dp_link_training.h |    1 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   18 +-
 .../gpu/drm/i915/display/intel_dp_tunnel.c    |  815 +++++++
 .../gpu/drm/i915/display/intel_dp_tunnel.h    |  133 ++
 drivers/gpu/drm/i915/display/intel_link_bw.c  |   27 +-
 drivers/gpu/drm/i915/display/intel_link_bw.h  |    2 +-
 drivers/gpu/drm/i915/display/intel_tc.c       |    7 +
 include/drm/display/drm_dp.h                  |   61 +
 include/drm/display/drm_dp_helper.h           |    2 +
 include/drm/display/drm_dp_tunnel.h           |  248 +++
 28 files changed, 3650 insertions(+), 125 deletions(-)
 create mode 100644 drivers/gpu/drm/display/drm_dp_tunnel.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dp_tunnel.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dp_tunnel.h
 create mode 100644 include/drm/display/drm_dp_tunnel.h

-- 
2.39.2

