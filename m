Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BD48D7B1C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 07:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6B010E26F;
	Mon,  3 Jun 2024 05:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XLXO9DT0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB1D10E10B;
 Mon,  3 Jun 2024 05:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717394365; x=1748930365;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v+sDR6SQm4cJENbsECXEDYuCrk4opGKalohlbUGdoLk=;
 b=XLXO9DT0RdYf7dnBTSnrl/OADU+O6uNtsI+LBXJOM4yGghkbsEfJprwu
 0V/hcuFhkyfXOFGp/Kt8HuB+8rNPmXhmmKtYTWplkoQCam+6wXX8ggS4y
 OBPf2fgMHop8Ay+1gi6XnCmS31xz8LFo0HyoTYRs3afUBf2z7t8+usi/z
 BYLJ8Hv/9NrspAER9zC1RyIUXPIVO2uUp+lKwjAkuUnDNTW36tjDgRGQw
 Vr9gIbHsuRrHdRwMepAvjXYGOYuYpWEsaGHlpY6IU+8CszwkNW72AL9/z
 uW00kavJn/z4fK4QqFNWpnKorEeXb7TsbVYspKaJELdyrkUBvEWbI89yT g==;
X-CSE-ConnectionGUID: tHrMkqKnQWmQOOsRRNxrwg==
X-CSE-MsgGUID: mI3vRqWEQWq+4UPJ9QbB/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="24527509"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="24527509"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2024 22:59:24 -0700
X-CSE-ConnectionGUID: pvmiE4mlQ+yZVDSCbseF0A==
X-CSE-MsgGUID: GGI4rja9R3Kz205nAyIyoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="67616478"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa002.jf.intel.com with ESMTP; 02 Jun 2024 22:59:23 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 jani.nikula@intel.com
Subject: [PATCH v11 0/8] Implement CMRR Support
Date: Mon,  3 Jun 2024 11:18:56 +0530
Message-Id: <20240603054904.222589-1-mitulkumar.ajitkumar.golani@intel.com>
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

Mitul Golani (8):
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
 drivers/gpu/drm/i915/display/intel_dp.c       |  19 ++-
 drivers/gpu/drm/i915/display/intel_vrr.c      | 128 +++++++++++++++--
 drivers/gpu/drm/i915/display/intel_vrr_regs.h | 129 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_reg.h               | 100 --------------
 include/drm/display/drm_dp_helper.h           |   1 +
 8 files changed, 289 insertions(+), 119 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_vrr_regs.h

-- 
2.25.1

