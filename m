Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4936AB1178F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD8CC10E416;
	Fri, 25 Jul 2025 05:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FJr7chxy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6289E10E011;
 Fri, 25 Jul 2025 05:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753419856; x=1784955856;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=av8pUOsXgEx/80UEoFGy/DvDbtkSooNJ71jVAh/bb+Y=;
 b=FJr7chxyf/8XnVrJtFHuQ9YqTd0ae3XrqVHgUUyktnpCKzklo9Pbap3P
 Y4+hCMiNUzwk9coVyWSJw1RWQeRr01gQW8y48Ud+9BaVOQZ69hJmCYifp
 IJpmTBfhcNW5g4FIlYkdpPD5T3b64tLHXiqjlvKvQR+MYe0OGtxAZjp2K
 VokKi1thpCnz3ovXQjytYVdFszvyBss5UmEkhvjdUwXehrnGC1O9TLUGV
 eg2WIwyZF/IbiZRVG1KsP8km+FvGwneYPdd7+FlX73Bgbzre5GHMDOy9c
 bmxPcNaGVAi/baQOWuugfWL1KWVPSA+qXEBBIpa7wYk9pDSG05TzgpIa6 g==;
X-CSE-ConnectionGUID: 7EL04eTaTt+RGpYCuBAeRg==
X-CSE-MsgGUID: j/V9JruIT8SaxGq+7DHyFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78299510"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="78299510"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:04:16 -0700
X-CSE-ConnectionGUID: 4vINix+mQT+IpgKJRpRhRA==
X-CSE-MsgGUID: kHUZ9M9ARcen+O3QORy5Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160956469"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 22:04:13 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Harry Wetland <harry.wentland@amd.com>
Subject: [PATCH 00/28] Enable Pipe writeback  
Date: Fri, 25 Jul 2025 10:33:41 +0530
Message-Id: <20250725050409.2687242-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series aims to enable pipe writeback functionality on
ADLP where it has been tested. The plan is to slowly accomodate
all supported hardware after this functionality is tested on them.
This series also brings change to drm core but not in a drastic way.
We introduce a helper which lets drivers have their own preallocated
conenctor keeping the connector in drm_writeback_conenctor blank.
This lets driver have more control over their connector but still use
the drm core queues for job creation and signalling. Some new helpers
have been added to aid drivers so that derivation of drm_connector
from drm_writeback_connector and vice versa becomes easy for drivers
that will use this helper since it won't be as straight forward as
wb_conn->connector anymore. Driver not using these API will not be
affected in anyways.
This series enables the triggered captured mode where we need to
trigger a capture.

Cc: Harry Wetland <harry.wentland@amd.com>
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (28):
  drm/writeback: Add function that takes preallocated connector
  drm/writeback: Add a helper function to get writeback connector
  drm/writeback: Define function to get drm_connector from writeback
  drm/i915/writeback: Add writeback registers
  drm/i915/writeback: Add some preliminary writeback definitions
  drm/i915/writeback: Init writeback connector
  drm/i915/writeback: Add function for get_writeback_connector
  drm/i915/writeback: Define the get_connector_from_writeback hook
  drm/i915/writeback: Add function to get modes
  drm/i915/writeback: Add hook to check modes
  drm/i915/writeback: Define encoder->get_hw_state
  drm/i915/writeback: Fill encoder->get_config
  drm/i915/writeback: Add private structure for writeback job
  drm/i915/writeback: Define function for prepare and cleanup hooks
  drm/i915/writeback: Define compute_config for writeback
  drm/i915/writeback: Define function for connector function detect
  drm/i915/writeback: Define function to destroy writeback connector
  drm/i915/writeback: Add connector atomic check
  drm/i915/writeback: Add the enable sequence from writeback
  drm/i915/writeback: Add writeback to xe Makefile
  drm/i915/writeback: Define writeback frame capture function
  drm/i915/writeback: Configure WD_STRIDE reg
  drm/i915/writeback: Configure WD_SURF register
  drm/i915/writeback: Enable writeback interrupts
  drm/i915/writeback: Initialize writeback encoder.
  drm/i915/writeback: Define the disable sequence for writeback
  drm/i915/writeback: Make exception for writeback connector
  drm/i915/writeback: Modify state verify function

 drivers/gpu/drm/drm_writeback.c               | 123 +++-
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_acpi.c     |   1 +
 .../drm/i915/display/intel_crtc_state_dump.c  |   2 +-
 drivers/gpu/drm/i915/display/intel_display.c  | 178 +++--
 drivers/gpu/drm/i915/display/intel_display.h  |   4 +
 .../drm/i915/display/intel_display_debugfs.c  |   3 +
 .../drm/i915/display/intel_display_device.c   |  29 +-
 .../drm/i915/display/intel_display_device.h   |   2 +-
 .../gpu/drm/i915/display/intel_display_irq.c  |  10 +
 .../drm/i915/display/intel_display_limits.h   |   2 +
 .../drm/i915/display/intel_display_power.c    |   4 +
 .../drm/i915/display/intel_display_power.h    |   2 +
 .../gpu/drm/i915/display/intel_display_regs.h |   1 +
 .../drm/i915/display/intel_display_types.h    |   1 +
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c |   3 +
 drivers/gpu/drm/i915/display/intel_opregion.c |   2 +-
 drivers/gpu/drm/i915/display/intel_pmdemand.c |   3 +
 drivers/gpu/drm/i915/display/intel_vdsc.c     |   4 +
 .../gpu/drm/i915/display/intel_writeback.c    | 686 ++++++++++++++++++
 .../gpu/drm/i915/display/intel_writeback.h    |  23 +
 .../drm/i915/display/intel_writeback_reg.h    | 142 ++++
 drivers/gpu/drm/xe/Makefile                   |   1 +
 include/drm/drm_modeset_helper_vtables.h      |  59 ++
 include/drm/drm_writeback.h                   |  21 +-
 25 files changed, 1238 insertions(+), 69 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_writeback.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_writeback.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_writeback_reg.h

-- 
2.34.1

