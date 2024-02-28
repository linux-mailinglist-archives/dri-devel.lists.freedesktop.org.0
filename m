Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E9986B225
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 15:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0353F10E681;
	Wed, 28 Feb 2024 14:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jP3LqWlC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FAD10E992;
 Wed, 28 Feb 2024 14:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709131511; x=1740667511;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xj+wzDCtHPX8yNxQJdD4djHzoys6IJbBpvnp9SN24xg=;
 b=jP3LqWlCFooL9mJUC/Q/IRMTNE+KyHtv6+at8LOP+ow6LNzArR+cmBrx
 vwT34FAKYBZGzJX9qYJ8bsDP8tS0oeFHuM8Zmp39E4yjDaUT6wUZxnWG8
 fILrXpxI9wAs5UlUdBf+owpUhsylWJT+0KdN+zgMf5sXjEWU9nuRXBYMb
 4GDFgrrWkcx+Ui1jq+2N6/td1ZTSS0aQYrwAWFSVVrpnJKCqFsNWpIuso
 iC8V1nAsh2GFpE41nN/5Ut+Fkq7ag5xCu5uy4xJVrngLKVURQ6hvlrhUk
 1xBXyI86wxC5gN4VdLjAXiIHL+e/HlAdGHp+WR+4dWCbYGhQ+d+uBEHSD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="7356118"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7356118"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:45:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7663076"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa006.fm.intel.com with ESMTP; 28 Feb 2024 06:45:08 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, jani.nikula@intel.com,
 ankit.k.nautiyal@intel.com,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [PATCH v12 0/8] Enable Adaptive Sync SDP Support for DP
Date: Wed, 28 Feb 2024 20:08:15 +0530
Message-Id: <20240228143823.2762595-1-mitulkumar.ajitkumar.golani@intel.com>
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

An Adaptive-Sync-capable DP protocol
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

-v11:
- Remove as_sdp_mode and enable from crtc_state.
- For consistency, update ADL_ prefix or post fix as required.
- Add a comment mentioning current support of
  DP_AS_SDP_AVT_FIXED_VTOTAL.
- Add state checker for AS_SDP infoframe enable.
- Add PIPE_CONF_CHECK_I(vrr.vsync_start/end).
- Read/write vrr_vsync params only when we intend to send
adaptive_sync sdp.

-v12:
- Update cover letter

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

Mitul Golani (8):
  drm/dp: Add support to indicate if sink supports AS SDP
  drm: Add Adaptive Sync SDP logging
  drm/i915/dp: Add Read/Write support for Adaptive Sync SDP
  drm/i915/display/dp: Add wrapper function to check AS SDP
  drm/i915/display: Compute AS SDP parameters.
  drm/i915/display: Add state checker for Adaptive Sync SDP
  drm/i915/display: Compute vrr_vsync params
  drm/i915/display: Read/Write AS sdp only when sink/source has enabled

 drivers/gpu/drm/display/drm_dp_helper.c       |  37 +++++
 .../drm/i915/display/intel_crtc_state_dump.c  |  12 ++
 drivers/gpu/drm/i915/display/intel_ddi.c      |   4 +
 drivers/gpu/drm/i915/display/intel_display.c  |  48 +++++++
 .../drm/i915/display/intel_display_device.h   |   1 +
 .../drm/i915/display/intel_display_types.h    |   2 +
 drivers/gpu/drm/i915/display/intel_dp.c       | 127 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_dp.h       |   1 +
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  12 +-
 drivers/gpu/drm/i915/display/intel_vrr.c      |  29 +++-
 drivers/gpu/drm/i915/i915_reg.h               |  15 +++
 include/drm/display/drm_dp.h                  |   9 ++
 include/drm/display/drm_dp_helper.h           |  35 +++++
 13 files changed, 327 insertions(+), 5 deletions(-)

-- 
2.25.1

