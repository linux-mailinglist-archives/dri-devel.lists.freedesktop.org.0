Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCCEC9E402
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 09:40:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A76C10E10C;
	Wed,  3 Dec 2025 08:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XqOU+GNx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D17A10E10C;
 Wed,  3 Dec 2025 08:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764751220; x=1796287220;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U1BYM3YpY5e7XTuOraaEq1lM0ZXbMGT+EyqtAOWgW8Q=;
 b=XqOU+GNx4UwQH45ZiY+oWXJ7VtB8Q2jLSZ1TYI6taMeLrG1t00WRiw3+
 h9rPQg86YKCBC4iMpJTO+1JmykOyIwLZ8+U+VAcw0K9uFlgaKkFEQfye8
 JitktTnti3NM5i7K++SxlCXS9wEFqaBh8mFJWMb7+stYxDJ/s/bcNp3D2
 Kcd2I7gyTcuEtkPAlly96voqzU9TqyBb3goaO5+lwvIiLrtagy+jIBjCb
 Dl5VGTrZgJolXnmlGy8304JWQ9P7o3UFyd9rJIgT14ut0yGVCen957C11
 S7Z/3CXiJ3Vf9qRl7NrVpzvDGXH5PbfpOoql8c4N4wyu6ebiTlzD0GNyR w==;
X-CSE-ConnectionGUID: Z9MVQ53VTgGqk2Pck7HsRA==
X-CSE-MsgGUID: CpPkrT2tSLKpVGmGNYlCfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66812086"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="66812086"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 00:40:20 -0800
X-CSE-ConnectionGUID: pqDcrc2+SoKck4Tt+UT7+g==
X-CSE-MsgGUID: /jrODMXLSmKdFZBGyokJJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="217945334"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 03 Dec 2025 00:40:14 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 swati2.sharma@intel.com, alex.hung@amd.com, jani.nikula@intel.com,
 suraj.kandpal@intel.com, Uma Shankar <uma.shankar@intel.com>,
 Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Xaver Hugl <xaver.hugl@gmail.com>,
 Victoria Brekenfeld <victoria@system76.com>, Sima <daniel@ffwll.ch>,
 Liviu Dudau <Liviu.Dudau@arm.com>
Subject: [v8 00/15] Plane Color Pipeline support for Intel platforms
Date: Wed,  3 Dec 2025 14:21:56 +0530
Message-ID: <20251203085211.3663374-1-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

This series intends to add support for Plane Color Management for
Intel platforms. This is based on the design which has been agreed
upon by the community. Series implementing the design for generic
DRM core has been sent out by Alex Hung and Harry Wentland and is
merged to upstream tree:
https://patchwork.freedesktop.org/series/152970/

IGT Changes to validate the same have been implemented and can be found
below:
https://patchwork.freedesktop.org/series/150455/

Follow On work:
Changes for Multi Segmented/PWL LUT's will be taken up in a separate
series to align with implementation of basic color pipeline first in
upstream. This is as per agreement and alignment in Hackfest discussion.

Changes in v8:
   - Review comments addressed (Arun, Suraj)

Changes in v7:
   - Review comments addressed (Jani, Suraj)
   - Rebased on AMD series for core API's
   - Some fixes

Changes in v6:
   - Remove Multi Segmented LUT implementations. This will be taken up
     as a separate series.
   - Code Refactoring and review comments addressed (Jani, Suraj, Simon)
   - Propogate Plane Color changes to crtc state
   - Fix DSB programming for Luts
   - Add 3D Lut support
   - Plane color callbacks updated to TGL+
   - Rebase on AMD's Color series v12 version

Changes in v5:
   - Exposing CTM as 3x4 instead of 3x3 using post offsets.
   - Exposing single segmented 1D LUT color op along with multi
     segmented lut in 2 different color pipelines
   - Add helper to extract LUT data from 32 bit samples
   - Enable uapi to hardware state copy in driver
   - Add DSB support to program color Luts 
   - Fix some miscellaneous issues

Changes in v4:
  - Rebase

Changes in v3:
   - Rebase on latest plane color pipeline series (v7) from AMD
   - Update documentation for 3x3 CTM colorop (Dmitry)
   - Fix documentation for multi segmented 1D lut (Dmitry)
   - Squash changes for 1d LUT helpers (Dmitry)

Changes in v2:
   - Add documentation for hardware capability detection for segmented luts
   - Add documentation for lut computation in userspace based on
     hardware caps
   - Update drm_color_lut_range data structure and handling
   - Enhance the structure to avoid ambiguity and cater to varying
     hardware implementations of 1D Lut blocks
   - Replace drm_color_lut_ext with drm_color_lut32
   - Change namespace for drm_color_lut_range flags (Sebastien)
   - Program super fine post csc gamma lut segment for Intel hardware

Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Michel Dänzer <mdaenzer@redhat.com>
Cc: Xaver Hugl <xaver.hugl@gmail.com>
Cc: Victoria Brekenfeld <victoria@system76.com>
Cc: Sima <daniel@ffwll.ch>
Cc: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>

Chaitanya Kumar Borah (8):
  drm/i915/display: Add identifiers for driver specific blocks
  drm/i915: Add intel_color_op
  drm/i915/color: Add helper to create intel colorop
  drm/i915/color: Create a transfer function color pipeline
  drm/i915/color: Add framework to program CSC
  drm/i915/color: Preserve sign bit when int_bits is Zero
  drm/i915/color: Add registers for 3D LUT
  drm/i915/color: Add 3D LUT to color pipeline

Uma Shankar (7):
  drm/i915/color: Add plane CTM callback for D12 and beyond
  drm/i915: Add register definitions for Plane Degamma
  drm/i915: Add register definitions for Plane Post CSC
  drm/i915/color: Add framework to program PRE/POST CSC LUT
  drm/i915/color: Program Pre-CSC registers
  drm/i915/color: Program Plane Post CSC Registers
  drm/i915/color: Enable Plane Color Pipelines

 drivers/gpu/drm/i915/Makefile                 |   2 +
 drivers/gpu/drm/i915/display/intel_color.c    | 335 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_color.h    |   8 +-
 .../drm/i915/display/intel_color_pipeline.c   |  99 ++++++
 .../drm/i915/display/intel_color_pipeline.h   |  14 +
 .../gpu/drm/i915/display/intel_color_regs.h   |  29 ++
 drivers/gpu/drm/i915/display/intel_colorop.c  |  35 ++
 drivers/gpu/drm/i915/display/intel_colorop.h  |  15 +
 drivers/gpu/drm/i915/display/intel_display.c  |   5 +-
 .../drm/i915/display/intel_display_limits.h   |   9 +
 .../drm/i915/display/intel_display_types.h    |   9 +
 drivers/gpu/drm/i915/display/intel_plane.c    |  55 +++
 .../drm/i915/display/skl_universal_plane.c    |  21 ++
 .../i915/display/skl_universal_plane_regs.h   | 115 ++++++
 drivers/gpu/drm/xe/Makefile                   |   2 +
 15 files changed, 751 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_color_pipeline.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_color_pipeline.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_colorop.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_colorop.h

-- 
2.50.1

