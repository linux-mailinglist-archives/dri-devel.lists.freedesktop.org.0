Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2438C3598A
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 13:22:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBCEB10E714;
	Wed,  5 Nov 2025 12:22:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hu49CX2c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E230210E729;
 Wed,  5 Nov 2025 12:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762345342; x=1793881342;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/OxhvMmV5gwOHQ3XyadceUmNz1bN5d5kHeiI/rKg9C0=;
 b=Hu49CX2cFewkTlNcrwVwW9zu3u5sggL72OJEBaLdRv8LyR1PrxR2ADnM
 iRMjTffPeOxZyrg/fnWUIYZMiHviD8uYpMuXJPlqPywAP5p/a+2caM+2w
 LgAy3ddB7BDgpyQQMrIc7JwOig3io6nctmgPNodH4Ft/3wKokOZCE+BVD
 EAAWO9qMDEpctSEZZh/zptucITH9Krb9cRjfDt14jHdflY17yZwlcG22e
 vBE2iVO+R0krVG7Nq8lgplPb0F3BodspdwFXWrch+vLoMv2LtSpezwO+O
 o1lheetlWWohEaMS1tufUeFRNN5qTjb5G0EFYHGTsIWUDMSYnCe2maQnn g==;
X-CSE-ConnectionGUID: 41Rx95SzTGS0nHBd2Km/Bw==
X-CSE-MsgGUID: gpfPy9GiRWaG6iG+mufnkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="52027070"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="52027070"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:22:21 -0800
X-CSE-ConnectionGUID: FKMQpqp4T6ST2Oqwu2D/Yw==
X-CSE-MsgGUID: s30stSR0TYCnQvyXRQv9lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="187740171"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa008.fm.intel.com with ESMTP; 05 Nov 2025 04:22:14 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 jani.nikula@intel.com, Uma Shankar <uma.shankar@intel.com>,
 Alexander Goins <agoins@nvidia.com>, Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Aleix Pol <aleixpol@kde.org>, Xaver Hugl <xaver.hugl@gmail.com>,
 Victoria Brekenfeld <victoria@system76.com>, Sima <daniel@ffwll.ch>,
 Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Arthur Grillo <arthurgrillo@riseup.net>, Hector Martin <marcan@marcan.st>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 Sasha McIntosh <sashamcintosh@google.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [v6 00/16] Plane Color Pipeline support for Intel platforms
Date: Wed,  5 Nov 2025 18:03:56 +0530
Message-ID: <20251105123413.2671075-1-uma.shankar@intel.com>
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
DRM core has been sent out by Alex Hung and Harry Wentland and is under
review below:
https://patchwork.freedesktop.org/series/152970/

The base work of above series is squashed under 1 patch and support
for Intel platform is added on top of it.
Any reviews on the original core design is expected to be done in 
Alex's series to avoid any forking of the discussion.

IGT Changes to validate the same have been implemented and can be found
below:
https://patchwork.freedesktop.org/series/150455/

Follow On work:
Changes for Multi Segmented/PWL LUT's will be taken up in a separate
series to align with implementation of basic color pipeline first in
upstream. This is as per agreement and alignment in Hackfest discussion.

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
Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Alexander Goins <agoins@nvidia.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Michel Dänzer <mdaenzer@redhat.com>
Cc: Aleix Pol <aleixpol@kde.org>
Cc: Xaver Hugl <xaver.hugl@gmail.com>
Cc: Victoria Brekenfeld <victoria@system76.com>
Cc: Sima <daniel@ffwll.ch>
Cc: Naseer Ahmed <quic_naseer@quicinc.com>
Cc: Christopher Braga <quic_cbraga@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Hector Martin <marcan@marcan.st>
Cc: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Sasha McIntosh <sashamcintosh@google.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>

Chaitanya Kumar Borah (8):
  drm/i915: Add identifiers for driver specific blocks
  drm/i915: Add intel_color_op
  drm/i915/color: Add helper to create intel colorop
  drm/i915/color: Create a transfer function color pipeline
  drm/i915/color: Add framework to program CSC
  drm/i915/color: Preserve sign bit when int_bits is Zero
  drm/i915/display: Add registers for 3D LUT
  drm/i915/color: Add 3D LUT to color pipeline

Harry Wentland (1):
  [NOT FOR REVIEW] drm: AMD series squashed

Uma Shankar (7):
  drm/i915/color: Add plane CTM callback for D12 and beyond
  drm/i915: Add register definitions for Plane Degamma
  drm/i915/color: Add framework to program PRE/POST CSC LUT
  drm/i915: Add register definitions for Plane Post CSC
  drm/i915/color: Program Pre-CSC registers
  drm/i915/xelpd: Program Plane Post CSC Registers
  drm/i915/color: Enable Plane Color Pipelines

 Documentation/gpu/drm-kms.rst                 |  15 +
 Documentation/gpu/rfc/color_pipeline.rst      | 378 ++++++++
 Documentation/gpu/rfc/index.rst               |   3 +
 drivers/gpu/drm/Makefile                      |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   3 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   4 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 768 ++++++++++++++++-
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 208 +++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  36 +
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  26 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  39 +
 drivers/gpu/drm/drm_atomic.c                  | 170 +++-
 drivers/gpu/drm/drm_atomic_helper.c           |  12 +
 drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
 drivers/gpu/drm/drm_atomic_uapi.c             | 159 ++++
 drivers/gpu/drm/drm_color_mgmt.c              |  43 +
 drivers/gpu/drm/drm_colorop.c                 | 600 +++++++++++++
 drivers/gpu/drm/drm_connector.c               |   1 +
 drivers/gpu/drm/drm_crtc_internal.h           |   1 +
 drivers/gpu/drm/drm_ioctl.c                   |   7 +
 drivers/gpu/drm/drm_mode_config.c             |   7 +
 drivers/gpu/drm/drm_mode_object.c             |  18 +
 drivers/gpu/drm/drm_plane.c                   |  59 ++
 drivers/gpu/drm/i915/Makefile                 |   2 +
 drivers/gpu/drm/i915/display/intel_color.c    | 314 +++++++
 drivers/gpu/drm/i915/display/intel_color.h    |   6 +-
 .../drm/i915/display/intel_color_pipeline.c   | 130 +++
 .../drm/i915/display/intel_color_pipeline.h   |  14 +
 drivers/gpu/drm/i915/display/intel_colorop.c  |  35 +
 drivers/gpu/drm/i915/display/intel_colorop.h  |  15 +
 drivers/gpu/drm/i915/display/intel_display.c  |   5 +-
 .../drm/i915/display/intel_display_limits.h   |   9 +
 .../drm/i915/display/intel_display_types.h    |   9 +
 drivers/gpu/drm/i915/display/intel_plane.c    |  55 ++
 .../drm/i915/display/skl_universal_plane.c    |  21 +
 .../i915/display/skl_universal_plane_regs.h   | 153 ++++
 drivers/gpu/drm/tests/Makefile                |   3 +-
 drivers/gpu/drm/tests/drm_fixp_test.c         |  71 ++
 drivers/gpu/drm/vkms/Makefile                 |   4 +-
 drivers/gpu/drm/vkms/tests/Makefile           |   2 +-
 drivers/gpu/drm/vkms/tests/vkms_color_test.c  | 417 +++++++++
 drivers/gpu/drm/vkms/vkms_colorop.c           | 120 +++
 drivers/gpu/drm/vkms/vkms_composer.c          | 135 ++-
 drivers/gpu/drm/vkms/vkms_composer.h          |  28 +
 drivers/gpu/drm/vkms/vkms_drv.c               |   1 +
 drivers/gpu/drm/vkms/vkms_drv.h               |   7 +
 drivers/gpu/drm/vkms/vkms_luts.c              | 811 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_luts.h              |  12 +
 drivers/gpu/drm/vkms/vkms_plane.c             |   2 +
 drivers/gpu/drm/xe/Makefile                   |   2 +
 include/drm/drm_atomic.h                      | 111 +++
 include/drm/drm_atomic_uapi.h                 |   3 +
 include/drm/drm_color_mgmt.h                  |  29 +
 include/drm/drm_colorop.h                     | 462 ++++++++++
 include/drm/drm_file.h                        |   7 +
 include/drm/drm_fixed.h                       |  18 +
 include/drm/drm_mode_config.h                 |  18 +
 include/drm/drm_plane.h                       |  19 +
 include/uapi/drm/amdgpu_drm.h                 |   9 -
 include/uapi/drm/drm.h                        |  15 +
 include/uapi/drm/drm_mode.h                   | 134 +++
 61 files changed, 5704 insertions(+), 67 deletions(-)
 create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
 create mode 100644 drivers/gpu/drm/drm_colorop.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_color_pipeline.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_color_pipeline.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_colorop.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_colorop.h
 create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_test.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_composer.h
 create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
 create mode 100644 include/drm/drm_colorop.h

-- 
2.50.1

