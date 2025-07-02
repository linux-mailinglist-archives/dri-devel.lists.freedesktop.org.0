Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12686AF0EF0
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7437B10E34C;
	Wed,  2 Jul 2025 09:07:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kraPVEgo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86ED10E60E;
 Wed,  2 Jul 2025 09:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751447255; x=1782983255;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZsZVfldGjleN+SqR1tG+j1r9lz3LEzZRWhU7aC14rII=;
 b=kraPVEgoTgBzO/3bLGJu2jsDtmmtG85PGbwO85PUcUhJmXeGyRydakgj
 YqUzXyX+/VNaf5LGfz/9inS4pzcGagA/9a0eC1h85RktN1gu15sEl5Nn/
 ywhkOMGV8cLk4gIzhYuoxu+clsG3vGtp4TNFzIhRH4ktd45WDRIq3DsD1
 rghvbbQydSt5JH6VGi5pluFDLpqy41JFK6fv2TznP7fnpeUSJ3Zbx7TuJ
 U4yoNQalTGMCS1mh3LffHjSJCdGsOpMes5LWKOmbxqwivTyHWiJnvpu0b
 eycC7AVtTQCnYAMjObfBGyYUFSwuWGrhPTGbrCGCGE+zDC4WvN8cJ7YE2 g==;
X-CSE-ConnectionGUID: iqIDxFxiRk6K9q1Z9vQNKw==
X-CSE-MsgGUID: XwOkKuHvR3iy71CZWRhlxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64426934"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64426934"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:07:34 -0700
X-CSE-ConnectionGUID: ZRQaB3GfTa68lXEVbs1WPQ==
X-CSE-MsgGUID: n6Qfz1RrQoa8jMIwwYy+8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="159536323"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2025 02:07:26 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 Uma Shankar <uma.shankar@intel.com>, Alexander Goins <agoins@nvidia.com>,
 Joshua Ashton <joshua@froggi.es>,
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
Subject: [v5 00/24] Plane Color Pipeline support for Intel platforms
Date: Wed,  2 Jul 2025 14:49:12 +0530
Message-ID: <20250702091936.3004854-1-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
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
https://patchwork.freedesktop.org/series/123446/

The base work of above series is squashed under 1 patch and support
for Intel platform is added on top of it.
Any reviews on the original core design is expected to be done in 
Harry's series to avoid any forking of the discussion.

Changes added on core design:

Implemented a HW capability property to expose segmented luts.
drm: Add Color lut range attributes
drm: Add Color ops capability property
drm: Define helper to initialize segmented 1D LUT

This helps in generically defining the hardware lut capabilities,
lut distribution, precision, segmented or PWL LUTS.

On top of this base work for DRM core plane color pipeline design,
implementation is done for Intel hardware platforms.

IGT Changes to validate the same have been implemented and can be found
below:
https://patchwork.freedesktop.org/series/150455/

Changes in v5:
   - Exposing CTM as 3x4 instead of 3x3 using post offsets.
   - Exposing single segmented 1D LUT color op along with multi
     segmented lut in 2 different color pipelines
   - Add helper to extract LUT data from 32 bit samples
   - Enabled uapi to hardware state copy in driver
   - Add DSB support to program color Luts 
   - Fix some miscellaneous issues

Changes in v4:
  - Rebase

Changes in v3:
   - Rebased on latest plane color pipeline series (v7) from AMD
   - Updated documentation for 3x3 CTM colorop (Dmitry)
   - Fixed documentation for multi segmented 1D lut (Dmitry)
   - Squashed changes for 1d LUT helpers (Dmitry)

Changes in v2:
   - Added documentation for hardware capability detection for segmented luts
   - Added documentation for lut computation in userspace based on
     hardware caps
   - Updated drm_color_lut_range data structure and handling
   - Enhanced the structure to avoid ambiguity and cater to varying
     hardware implementations of 1D Lut blocks
   - replaced drm_color_lut_ext with drm_color_lut32
   - Changed namespace for drm_color_lut_range flags (Sebastien)
   - Program super fine post csc gamma lut segment for Intel hardware

ToDo:
   - Implement Checks for sanity of hardware capability structure
   - Implement and Enhance Checks for user data for Lut Blob
   - Implement post blending color API's

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

Chaitanya Kumar Borah (16):
  drm: Add 1D LUT multi-segmented color op
  drm: Add helper to extract lut from struct drm_color_lut_32
  drm/i915: Add identifiers for intel color blocks
  drm/i915: Add intel_color_op
  drm/i915/color: Add helper to create intel colorop
  drm/i915/color: Create a transfer function color pipeline
  drm/i915/color: Add and attach COLORPIPELINE plane property
  drm/i915/color: Add framework to program CSC
  drm/i915/color: Add callbacks to set plane CTM
  drm/i915/color: Add new color callbacks for Xelpd
  drm/i915/color: Preserve sign bit when int_bits is Zero
  drm/i915/color: Add framework to program PRE/POST CSC LUT
  drm/i915/color: Program Pre-CSC registers
  drm/i915/xelpd: Program Plane Post CSC Registers
  drm/i915/color: Enable Plane Color Pipelines
  drm/i915/color: Create color pipeline with multisegmented LUT

Harry Wentland (1):
  [NOT FOR REVIEW] drm: AMD series squashed

Uma Shankar (7):
  drm: Add Color lut range attributes
  drm: Add Color ops capability property
  drm: Define helper to initialize segmented 1D LUT
  drm/i915/color: Add plane CTM callback for D13 and beyond
  drm/i915: Add register definitions for Plane Degamma
  drm/i915: Add register definitions for Plane Post CSC
  drm/doc/rfc: Add documentation for multi-segmented 1D LUT

 Documentation/gpu/drm-kms.rst                 |  15 +
 Documentation/gpu/rfc/color_pipeline.rst      | 518 +++++++++++
 Documentation/gpu/rfc/index.rst               |   3 +
 drivers/gpu/drm/Makefile                      |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   3 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   4 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 762 ++++++++++++++++-
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 205 +++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  36 +
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  15 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  39 +
 drivers/gpu/drm/drm_atomic.c                  | 174 +++-
 drivers/gpu/drm/drm_atomic_helper.c           |  12 +
 drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
 drivers/gpu/drm/drm_atomic_uapi.c             | 187 ++++
 drivers/gpu/drm/drm_color_mgmt.c              |  43 +
 drivers/gpu/drm/drm_colorop.c                 | 667 +++++++++++++++
 drivers/gpu/drm/drm_ioctl.c                   |   7 +
 drivers/gpu/drm/drm_mode_config.c             |   7 +
 drivers/gpu/drm/drm_plane.c                   |  59 ++
 drivers/gpu/drm/i915/display/intel_color.c    | 693 ++++++++++++++-
 drivers/gpu/drm/i915/display/intel_color.h    |  14 +-
 .../drm/i915/display/intel_display_limits.h   |  13 +
 .../drm/i915/display/intel_display_types.h    |  20 +
 drivers/gpu/drm/i915/display/intel_plane.c    |  43 +
 .../drm/i915/display/skl_universal_plane.c    |  17 +
 .../i915/display/skl_universal_plane_regs.h   | 127 +++
 drivers/gpu/drm/tests/Makefile                |   3 +-
 drivers/gpu/drm/tests/drm_fixp_test.c         |  71 ++
 drivers/gpu/drm/vkms/Makefile                 |   4 +-
 drivers/gpu/drm/vkms/tests/Makefile           |   2 +-
 drivers/gpu/drm/vkms/tests/vkms_color_test.c  | 459 ++++++++++
 drivers/gpu/drm/vkms/vkms_colorop.c           | 115 +++
 drivers/gpu/drm/vkms/vkms_composer.c          | 134 ++-
 drivers/gpu/drm/vkms/vkms_composer.h          |  27 +
 drivers/gpu/drm/vkms/vkms_drv.h               |   6 +
 drivers/gpu/drm/vkms/vkms_luts.c              | 808 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_luts.h              |  12 +
 drivers/gpu/drm/vkms/vkms_plane.c             |   1 +
 include/drm/drm_atomic.h                      | 111 +++
 include/drm/drm_atomic_uapi.h                 |   3 +
 include/drm/drm_color_mgmt.h                  |  29 +
 include/drm/drm_colorop.h                     | 463 ++++++++++
 include/drm/drm_file.h                        |   7 +
 include/drm/drm_fixed.h                       |  18 +
 include/drm/drm_mode_config.h                 |  18 +
 include/drm/drm_plane.h                       |  19 +
 include/uapi/drm/amdgpu_drm.h                 |   9 -
 include/uapi/drm/drm.h                        |  15 +
 include/uapi/drm/drm_mode.h                   | 207 +++++
 50 files changed, 6173 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.h
 create mode 100644 drivers/gpu/drm/drm_colorop.c
 create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_test.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_composer.h
 create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
 create mode 100644 include/drm/drm_colorop.h

-- 
2.42.0

