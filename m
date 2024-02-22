Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 885E685F7E8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 13:19:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D1010E471;
	Thu, 22 Feb 2024 12:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MAjQY9Sv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E59110E133;
 Thu, 22 Feb 2024 12:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708604357; x=1740140357;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q6vaOuiSCW4fh1KKi9ftfHtP7ZXEbIjDGQdooyMMJJk=;
 b=MAjQY9SvOEWBYzcFpUBsxYL5Ows6sgY2UtwAO4v50c9SnYUf+RGTJhGx
 X3lWNHtquCzUs7t2txwlVPYbq2ulo1eMeWbGlTkyZx5vk+BPa2Ttvyrvd
 ATKL6dmsqJWhzt3lD6jdegTj1nAe9xWw6pc2nW71J5UFf0XEghi10Jl3h
 FsnrDXv1xCsWsrYhK18N4PBrsz+ZGwlTAl+DTx5DA74ciOS7pstwOFVlT
 lnKE1frW35GQ0TDykglh8VNGxX4HF9a/5zMW0YBsIduPYX6wZR22srVHQ
 O2tLOggKiZmCjjv1/DkvYtEcfBvPe6z6kl3q2cBS9R/hJKbLveZmZpvZ/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="20257333"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="20257333"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 04:19:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="5682088"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa006.fm.intel.com with ESMTP; 22 Feb 2024 04:19:14 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [PATCH 0/6] Enable Adaptive Sync SDP Support for DP 
Date: Thu, 22 Feb 2024 17:42:17 +0530
Message-Id: <20240222121223.2257958-1-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
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

An Adaptive Sync SDP allows a DP protocol converter to
forward Adaptive Sync video with minimal buffering overhead
within the converter. An Adaptive-Sync-capable DP protocol
converter indicates its support by setting the related bit
in the DPCD register.

Computes AS SDP values based on the display configuration,
ensuring proper handling of Variable Refresh Rate (VRR)
in the context of Adaptive Sync.

--v2:
- Update logging to Patch-1
- use as_sdp instead of async
- Put definitions to correct placeholders from where it is defined.
- Update member types of as_sdp for uniformity.
- Correct use of REG_BIT and REG_GENMASK.
- Remove unrelated comments and changes.
- Correct code indents.
- separate out patch changes for intel_read/write_dp_sdp.

--v3:
- Add VIDEO_DIP_ASYNC_DATA_SIZE definition and comment in as_sdp_pack
  function to patch 2 as originally used there. [Patch 2].
- Add VIDEO_DIP_ENABLE_AS_HSW flag to intel_dp_set_infoframes [Patch 3].

--v4:
- Add check for HAS_VRR before writing AS SDP. [Patch 3].

--v5:
- Add missing check for HAS_VRR before reading AS SDP as well [Patch 3].

--v6:
- Rebase all patches.
- Compute TRANS_VRR_VSYNC.

-v7:
- Move vrr_vsync_start/end to compute config.
- Use correct function for drm_debug_printer.

-v8:
- Code refactoring.
- Update, VSYNC_START/END macros to VRR_VSYNC_START/END.(Ankit)
- Update bit fields of VRR_VSYNC_START/END.(Ankit)
- Send patches to dri-devel.(Ankit)
- Update definition names for AS SDP which are starting from
HSW, as these defines are applicable for ADLP+.(Ankit)
- Remove unused bitfield define, AS_SDP_ENABLE.
- Add support in drm for Adaptive Sync sink status, which can be
used later as a check for read/write sdp. (Ankit)

-v9:
- Add enum to operation mode to represent different AVT and
FAVT modes. (Ankit)
- Operation_mode, target_rr etc should be filled from as_sdp struct. (Ankit)
- Fill as_sdp->*All Params* from compute config, read from the sdp. (Ankit)
- Move configs to the appropriate patch where it used first.(Ankit)
- There should be a check if as sdp is enable is set or not. (Ankit)
- Add variables in crtc state->vrr for ad sdp enable and operation mode. (Ankit)
- Use above variables for tracking AS SDP. (Ankit)
- Revert unused changes. (Ankit)

-v10:
- Send Patches to dri-devel (Ankit).

Mitul Golani (6):
  drm/dp: Add an support to indicate if sink supports AS SDP
  drm: Add Adaptive Sync SDP logging
  drm/i915/dp: Add Read/Write support for Adaptive Sync SDP
  drm/i915/display: Compute AS SDP parameters.
  drm/i915/display: Compute vrr_vsync params
  drm/i915/display: Read/Write AS sdp only when sink/source has enabled

 drivers/gpu/drm/display/drm_dp_helper.c       |  37 ++++++
 .../drm/i915/display/intel_crtc_state_dump.c  |  12 ++
 drivers/gpu/drm/i915/display/intel_ddi.c      |   5 +
 drivers/gpu/drm/i915/display/intel_display.c  |   1 +
 .../drm/i915/display/intel_display_device.h   |   1 +
 .../drm/i915/display/intel_display_types.h    |   4 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 122 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  12 +-
 drivers/gpu/drm/i915/display/intel_vrr.c      |  23 ++++
 drivers/gpu/drm/i915/i915_reg.h               |  15 +++
 include/drm/display/drm_dp.h                  |   9 ++
 include/drm/display/drm_dp_helper.h           |  34 +++++
 12 files changed, 271 insertions(+), 4 deletions(-)

-- 
2.25.1

