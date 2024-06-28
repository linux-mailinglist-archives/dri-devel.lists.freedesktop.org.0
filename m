Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED7A91C3FC
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 18:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2E910ECB4;
	Fri, 28 Jun 2024 16:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QzXnLCjS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8048310EC8C;
 Fri, 28 Jun 2024 16:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719593085; x=1751129085;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Hrzx0tYKglsjJaaFBqrkA9aNoCKO/WLkAqjL0968RxI=;
 b=QzXnLCjSGrdVzGSy7mcJMb5IWuOS65O0U0mAvz85YpGa/TLtBB1+mGx/
 hzEsIIimbsQdpaeBibNpmP0XsKxeNDpxcLVUh+6SP5Dy9nLlfUgbGd2DE
 GhNo6nA9aCZoRBi2qTD/OkOgEY8z2nsHxxb6KHpZtgHvlj3GG5VTG15+g
 yLZzLk3EOq7I1TxmrNQXBKV1S8uSegUVtJ4yc+nZFjifpjTqkSyvST0Sz
 UK1tHzYJ1u3TSzDqTRDc0StYX78OgXPpPM1wQ2DE7rtANIUOdQx5802+H
 4FEBazBFryyu2TYTVh5tsuHE20DbAHBzzGSG/OhJA5d3mUxZoKF+vyGO6 Q==;
X-CSE-ConnectionGUID: m++4BgnYR2izPZflaIMPDg==
X-CSE-MsgGUID: EsY26W+lQKG4N8U/nEtnqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16620064"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="16620064"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 09:44:45 -0700
X-CSE-ConnectionGUID: 830SMrKRSfqy5FWt9/8D4g==
X-CSE-MsgGUID: ngL2ajgNTZajG8Mh10xxTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="75519907"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 09:44:44 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 0/9] drm/i915: Dump DSC state to dmesg/debugfs
Date: Fri, 28 Jun 2024 19:44:41 +0300
Message-ID: <20240628164451.1177612-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.43.3
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

This is v2 of [1], renaming the helpers from drm_x16 to fxp_q4 as
suggested by Jani.

[1] https://lore.kernel.org/all/20240614173911.3743172-1-imre.deak@intel.com

Cc: Jani Nikula <jani.nikula@intel.com>

Imre Deak (9):
  drm: Add helpers for q4 fixed point values
  drm/display/dsc: Add a helper to dump the DSC configuration
  drm/i915: Replace to_bpp_x16() with fxp_q4_from_int()
  drm/i915: Replace to_bpp_int() with fxp_q4_to_int()
  drm/i915: Replace to_bpp_int_roundup() with fxp_q4_to_int_roundup()
  drm/i915: Replace to_bpp_frac() with fxp_q4_to_frac()
  drm/i915: Replace BPP_X16_FMT()/ARGS() with FXP_Q4_FMT()/ARGS()
  drm/i915: Dump DSC state to dmesg and debugfs/i915_display_info
  drm/i915: Remove DSC register dump

 drivers/gpu/drm/display/drm_dp_helper.c       |  5 +-
 drivers/gpu/drm/display/drm_dsc_helper.c      | 91 +++++++++++++++++++
 drivers/gpu/drm/i915/display/icl_dsi.c        |  9 +-
 drivers/gpu/drm/i915/display/intel_audio.c    |  5 +-
 drivers/gpu/drm/i915/display/intel_bios.c     |  5 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  5 +-
 .../drm/i915/display/intel_crtc_state_dump.c  |  3 +
 drivers/gpu/drm/i915/display/intel_display.c  |  7 +-
 .../drm/i915/display/intel_display_debugfs.c  |  4 +
 .../drm/i915/display/intel_display_types.h    | 23 -----
 drivers/gpu/drm/i915/display/intel_dp.c       | 51 ++++++-----
 drivers/gpu/drm/i915/display/intel_dp_mst.c   | 26 +++---
 drivers/gpu/drm/i915/display/intel_fdi.c      |  6 +-
 drivers/gpu/drm/i915/display/intel_link_bw.c  |  4 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c     | 51 ++++++-----
 drivers/gpu/drm/i915/display/intel_vdsc.h     |  4 +
 include/drm/display/drm_dsc_helper.h          |  3 +
 include/drm/drm_fixed.h                       | 23 +++++
 18 files changed, 222 insertions(+), 103 deletions(-)

-- 
2.43.3

