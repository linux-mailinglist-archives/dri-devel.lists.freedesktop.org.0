Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A61F28D4551
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 08:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79C411B464;
	Thu, 30 May 2024 06:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XEIaVwoZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FCC11B462;
 Thu, 30 May 2024 06:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717049672; x=1748585672;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F1iqdKNPD48w2BmbKCBrR2vA13+k6uHLPy7SDMK1TS8=;
 b=XEIaVwoZ8JPnQLccUO1MD+TGEIo3EG/6qRrf8ZCzRUPftbTNc+spnw2o
 Wfz3x4Dw83DrfQ5plm9O+mur31ArqsTxWBFefWuxghWJJHlxahi2AKGmr
 0nefW2JIIzjjVbNgpNzDIc2hmtjRsoxumpQj7ZTtzAgi21t34BLERajwg
 es+0OhYC07kRKF9sYEvLq/Uj0MhmG6RXqqpFly+AcpZ0M9xVbjEVg2Lwf
 58pWwK2OQdlA2DHAcGVEWlpQ+rdndClpB9UnniHNsXxA4woqTdttmk/CF
 OoW5ehRJuE7/GHT+JcJYdy4vstVpXh2YZa1VG5VGOQDdo7ty3XQZrsD+m w==;
X-CSE-ConnectionGUID: awEVlJyERceB1jWa3Z/aJQ==
X-CSE-MsgGUID: y1ZeeSbPSqi4/E5UErr7hA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24915496"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="24915496"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 23:14:31 -0700
X-CSE-ConnectionGUID: hOOEyb1HQEWKPzErp1VeUg==
X-CSE-MsgGUID: LKqvZUtSQHGx6A6e2+FW/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="36335633"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa007.jf.intel.com with ESMTP; 29 May 2024 23:14:29 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 jani.nikula@intel.com
Subject: [PATCH v10 0/8] Implement CMRR Support
Date: Thu, 30 May 2024 11:34:00 +0530
Message-Id: <20240530060408.67027-1-mitulkumar.ajitkumar.golani@intel.com>
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

Mitul Golani (8):
  drm/i915: Separate VRR related register definitions
  drm/i915: Define and compute Transcoder CMRR registers
  drm/i915: Update trans_vrr_ctl flag when cmrr is computed
  drm/i915: Compute CMRR and calculate vtotal
  drm/dp: Add refresh rate divider to struct representing AS SDP
  drm/i915/display: Add support for pack and unpack
  drm/i915/display: Compute Adaptive sync SDP params
  drm/i915/display: Compute vrr vsync params

 drivers/gpu/drm/i915/display/intel_display.c  |  24 +++-
 .../drm/i915/display/intel_display_device.h   |   1 +
 .../drm/i915/display/intel_display_types.h    |   6 +
 drivers/gpu/drm/i915/display/intel_dp.c       |  21 ++-
 drivers/gpu/drm/i915/display/intel_vrr.c      | 124 ++++++++++++++--
 drivers/gpu/drm/i915/display/intel_vrr_regs.h | 133 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_reg.h               | 100 -------------
 include/drm/display/drm_dp_helper.h           |   1 +
 8 files changed, 290 insertions(+), 120 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_vrr_regs.h

-- 
2.25.1

