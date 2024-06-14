Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 012619091C9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 19:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE2F10EE05;
	Fri, 14 Jun 2024 17:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mE5n/Ygu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A9710EDFE;
 Fri, 14 Jun 2024 17:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718386745; x=1749922745;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/dCkzcZW0Kzw7lxTTcdwRaH1JQiierOMo8mBIVqgnjQ=;
 b=mE5n/Yguwc2j3jO7+LYqW+W2TT76E7CHCo9T9qz9nLRUmIyDdf0j5X/4
 XOtSEMoE1hmAo2cJHqds72WTEf7y54q+i6veYgUcwyUkKEapL62NUdQcN
 3es9l6CVUIALL6hRHBsRrvpxlYHj/r9tOlcpIDKNKlSJsqijlDVo7d7AO
 YxBIbltm4AfjQ2RSwhJoelYRdFgtC5GX6hO+5kAzh8JCneke1ZxGvz+mA
 BvKTQI18Nsi3Wg5r34HsB7ImE+EqqT7456FcmL5jnZbu/yDSEL5xK5z3Q
 DJbZcOywesZ780tNbeDPeNkRcdNYkylQslLw0xf+sE2G105N/brcZ/E5k Q==;
X-CSE-ConnectionGUID: jxo1cp7pRU6bc+4zXn2pfg==
X-CSE-MsgGUID: FNQ7i/w2SCaLnex6ZZk4QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19069291"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="19069291"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 10:39:04 -0700
X-CSE-ConnectionGUID: KwhYy1HNQAmXEbx9PQN4lA==
X-CSE-MsgGUID: zLpMUd0qQYqmNByDCiJG+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="40712423"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 10:39:02 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/9] drm/i915: Dump DSC state to dmesg/debugfs
Date: Fri, 14 Jun 2024 20:39:00 +0300
Message-ID: <20240614173911.3743172-1-imre.deak@intel.com>
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

Add a DRM core helper to dump the DSC state and take this into use in
the i915 driver to dump the state to dmesg after state computation and
HW readout as well as to the i915_display_info debugfs entry. The state
contains an x16 fixed point value, so also move the corresponding
bpp_x16 helpers from i915 to DRM core.

Imre Deak (9):
  drm: Add helpers for x16 fixed point values
  drm/display/dsc: Add a helper to dump the DSC configuration
  drm/i915: Replace to_bpp_x16() with drm_x16_from_int()
  drm/i915: Replace to_bpp_int() with drm_x16_to_int()
  drm/i915: Replace to_bpp_int_roundup() with drm_x16_to_int_roundup()
  drm/i915: Replace to_bpp_frac() with drm_x16_to_frac()
  drm/i915: Replace BPP_X16_FMT()/ARGS() with DRM_X16_FMT()/ARGS()
  drm/i915: Dump DSC state to dmesg and debugfs/i915_display_info
  drm/i915: Remove DSC register dump

 drivers/gpu/drm/display/drm_dp_helper.c       |  5 +-
 drivers/gpu/drm/display/drm_dsc_helper.c      | 91 +++++++++++++++++++
 drivers/gpu/drm/i915/display/icl_dsi.c        |  9 +-
 drivers/gpu/drm/i915/display/intel_audio.c    |  5 +-
 drivers/gpu/drm/i915/display/intel_bios.c     |  5 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    |  4 +-
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
 18 files changed, 221 insertions(+), 103 deletions(-)

-- 
2.43.3

