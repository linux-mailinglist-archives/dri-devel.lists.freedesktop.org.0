Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B978FD3A2
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 19:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A811110E5E7;
	Wed,  5 Jun 2024 17:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WWinMKUN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F71F10E0E4;
 Wed,  5 Jun 2024 17:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717607490; x=1749143490;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Yjknk4NvV8Z3x2LRqNEKSbd0sjuSLVX8iTA/sVcps14=;
 b=WWinMKUNmCOcvyOGYuF7RQbsPiO5sDLb+7QJ2iVm6dY788H2c9fZiJve
 6LbCd7HRrZn+GpPFS6AGkRJ87mwG3xpuXjaFVGnElLU88EswloO/rxwNm
 RtDJUv7pdCLrveaFJ/wc0/AFbeMsx+QeCZzxkBSLYDOWRK0g6dVUNIMaV
 n96h6ZW/cRMUbRZS/nhKkA41jHsUOzHRXtz31gG8Lo3XGXzpOTNshebBb
 tDAqjSMggAI1gqAQZfALDpGdIay41/mCHt2oz13ZBl20wUDJc9bKzY6kS
 wfO/qAJUXOipktuwiXFHxoMCEV7oenTrj3A39kdEeHauguM3zofsuUXYq Q==;
X-CSE-ConnectionGUID: 7BoPJSG9TDaIe6JPYSOGBw==
X-CSE-MsgGUID: fGxgWvkmTFSALnmrKCi/lw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14452399"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="14452399"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 10:11:29 -0700
X-CSE-ConnectionGUID: QKM9XOJhTAyuBKvbexvDKQ==
X-CSE-MsgGUID: pW42mTuOQVSWZ2xWcdrqug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="60848385"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa002.fm.intel.com with ESMTP; 05 Jun 2024 10:11:28 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v13 0/9] Implement CMRR Support
Date: Wed,  5 Jun 2024 22:31:02 +0530
Message-Id: <20240605170111.494784-1-mitulkumar.ajitkumar.golani@intel.com>
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

CMRR is a display feature that uses adaptive sync
framework to vary Vtotal slightly to match the
content rate exactly without frame drops. This
feature is a variation of VRR where it varies Vtotal
slightly (between additional 0 and 1 Vtotal scanlines)
to match content rate exactly without frame drops
using the adaptive sync framework.

enable this feature by programing new registers for
CMRR enable, CMRR_M, CMRR_N, vmin=vmax=flipline.The
CMRR_M/CMRR_N ratio represents the fractional part
in (actual refresh rate/target refresh rate) * origVTotal.

--v6:
- CMRR handling in co-existatnce of LRR and DRRS
- Correct vtotal paramas accuracy and add 2 digit precision.

--v7:
- Rebased patches in-accordance to AS SDP merge.
- Add neccessary gaurd to prevent crtc_state mismatch
during intel_vrr_get_config.

-v8:
- Add support for AS SDP for CMRR.
- update palce holder for CMRR register(Jani).
- Make CMRR as subset of FAVT, as per comments in patch#3.

-v9:
- Add CMRR register definitions to separate intel_vrr_reg.h.
- Remove cmrr_enabling/disabling, use vrr.enable instead.
- Update AS SDP pack function to accomodate target_rr_divider.
- Remove duplicated lines to compute vrr_vsync params.
- Set cmrr.enable with a separate patch at last.

-v10:
- Separate VRR related register definitions.
- Add dependency header intel_display_reg_defs.h.
- Rename file name to intel_vrr_regs.h instead of reg.h.
- Revert removed line.
- Since vrr.enable and cmrr.enable are not mutually exclusive,
handle accordingly.
- is_edp is not required inside is_cmrr_frac_required function.
- Add video_mode_required flag for future enhancement.
- Correct cmrr_m/cmrr_n calculation.
- target_rr_divider is bools so handle accordingly.

-v11:
- Move VRR related register and bits to separate file
intel_vrr_regs.h.
- Correct file header macro to intel_vrr_regs.h.
- Remove adding CMRR flag to vrr_ctl register during
set_transcoder_timing.
- Replace vrr.enable flag to cmrr.enable where added mistakenly.
- Move cmrr computation patch to last and set other other required
  params before computing cmrr.enable.

-v12:
- Add patch to fix check patch issues for VRR related registers
in i915_reg.h then move them to intel_vrr_regs.h with separate
patch.

-v13:
- Reverted unrelated patches while rebase.

Mitul Golani (9):
  gpu/drm/i915: Update indentation for VRR registers and bits
  drm/i915: Separate VRR related register definitions
  drm/i915: Define and compute Transcoder CMRR registers
  drm/i915: Update trans_vrr_ctl flag when cmrr is computed
  drm/dp: Add refresh rate divider to struct representing AS SDP
  drm/i915/display: Add support for pack and unpack
  drm/i915/display: Compute Adaptive sync SDP params
  drm/i915/display: Compute vrr vsync params
  drm/i915: Compute CMRR and calculate vtotal

 drivers/gpu/drm/i915/display/intel_display.c  |  24 +++-
 .../drm/i915/display/intel_display_device.h   |   1 +
 .../drm/i915/display/intel_display_types.h    |   6 +
 drivers/gpu/drm/i915/display/intel_dp.c       |  18 ++-
 drivers/gpu/drm/i915/display/intel_vrr.c      | 128 ++++++++++++++++--
 drivers/gpu/drm/i915/display/intel_vrr_regs.h | 128 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_reg.h               | 100 --------------
 include/drm/display/drm_dp_helper.h           |   1 +
 8 files changed, 287 insertions(+), 119 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_vrr_regs.h

-- 
2.25.1

