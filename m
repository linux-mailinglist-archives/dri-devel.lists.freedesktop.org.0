Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42101838BCC
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 11:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B54010E756;
	Tue, 23 Jan 2024 10:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C135710E76E;
 Tue, 23 Jan 2024 10:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706005717; x=1737541717;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dVwP26HpGCZQ4pUupuLU+++/SbfCa474D2l11q8V9l0=;
 b=Zh100MVOOpGf25+H4ve+Fsyzv+4OJajRgKerjn4j5C2sd24D7xiZZnAf
 lX7AX9szAr9/pwxhgEG+gGBMsJCA8TALwpbDDnXsG4YD5jQCtHsy9DgM0
 f+8F+ssbDCqYaOiVRZa7JXYGHxhZ83vbWsqFAxeOqkGnYNPgc6yaz+5lp
 JYLwHRux+xNN+6S2ahO0kdAi4QQpWOFUeqb33ZJhleA3aERpO4T9oGmUW
 SfZIBSfbsjSt9bfWvGRSdVFhbEUQoAoK+Lw82Gjur3/L886wbJ12J6m1i
 ELIgZCqdUBq36Qyp9K/pt6b0tCyBjATwOsQPmSS5SwPArSYYAO3Y6yz1E A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="401134079"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="401134079"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:28:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="856283359"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; d="scan'208";a="856283359"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 02:28:34 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 00/19] drm/i915: Add Display Port tunnel BW allocation support
Date: Tue, 23 Jan 2024 12:28:31 +0200
Message-Id: <20240123102850.390126-1-imre.deak@intel.com>
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
Cc: Gil Fine <gil.fine@intel.com>, dri-devel@lists.freedesktop.org,
 Naama Shachar <naamax.shachar@intel.com>,
 Saranya Gopal <saranya.gopal@intel.com>, Pengfei Xu <pengfei.xu@intel.com>,
 Rajaram Regupathy <rajaram.regupathy@intel.com>,
 Mika Westerberg <notifications@github.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for detecting DP tunnels on (Thunderbolt) display links and
enabling the Bandwidth Allocation mode on the link. This helps in
enabling the maximum resolution in any scenario on displays sharing the
BW on such links.

Kudos to all Cc'd for advices, co-development and testing.

Cc: Mika Westerberg <notifications@github.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Saranya Gopal <saranya.gopal@intel.com>
Cc: Rajaram Regupathy <rajaram.regupathy@intel.com>
Cc: Gil Fine <gil.fine@intel.com>
Cc: Naama Shachar <naamax.shachar@intel.com>
Cc: Pengfei Xu <pengfei.xu@intel.com>

Imre Deak (19):
  drm/dp: Add drm_dp_max_dprx_data_rate()
  drm/dp: Add support for DP tunneling
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
  drm/i915/dp: Compute DP tunel BW during encoder state computation
  drm/i915/dp: Allocate/free DP tunnel BW in the encoder enable/disable
    hooks
  drm/i915/dp: Handle DP tunnel IRQs
  drm/i915/dp: Call intel_dp_sync_state() always for DDI DP encoders
  drm/i915/dp: Suspend/resume DP tunnels
  drm/i915/dp: Enable DP tunnel BW allocation mode

 drivers/gpu/drm/display/Kconfig               |   17 +
 drivers/gpu/drm/display/Makefile              |    2 +
 drivers/gpu/drm/display/drm_dp_helper.c       |   58 +
 drivers/gpu/drm/display/drm_dp_tunnel.c       | 1715 +++++++++++++++++
 drivers/gpu/drm/i915/Kconfig                  |   13 +
 drivers/gpu/drm/i915/Kconfig.debug            |    1 +
 drivers/gpu/drm/i915/Makefile                 |    3 +
 drivers/gpu/drm/i915/display/g4x_dp.c         |   28 +
 drivers/gpu/drm/i915/display/intel_atomic.c   |   10 +
 drivers/gpu/drm/i915/display/intel_ddi.c      |    9 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   26 +-
 .../gpu/drm/i915/display/intel_display_core.h |    1 +
 .../drm/i915/display/intel_display_driver.c   |   20 +-
 .../drm/i915/display/intel_display_types.h    |    9 +
 drivers/gpu/drm/i915/display/intel_dp.c       |  309 ++-
 drivers/gpu/drm/i915/display/intel_dp.h       |   21 +-
 .../drm/i915/display/intel_dp_link_training.c |   33 +-
 .../drm/i915/display/intel_dp_link_training.h |    1 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   18 +-
 .../gpu/drm/i915/display/intel_dp_tunnel.c    |  642 ++++++
 .../gpu/drm/i915/display/intel_dp_tunnel.h    |  131 ++
 drivers/gpu/drm/i915/display/intel_link_bw.c  |    5 +
 drivers/gpu/drm/i915/display/intel_tc.c       |    4 +-
 include/drm/display/drm_dp.h                  |   61 +
 include/drm/display/drm_dp_helper.h           |    2 +
 include/drm/display/drm_dp_tunnel.h           |  270 +++
 26 files changed, 3292 insertions(+), 117 deletions(-)
 create mode 100644 drivers/gpu/drm/display/drm_dp_tunnel.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dp_tunnel.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_dp_tunnel.h
 create mode 100644 include/drm/display/drm_dp_tunnel.h

-- 
2.39.2

