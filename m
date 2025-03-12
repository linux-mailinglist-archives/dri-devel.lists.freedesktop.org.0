Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4954A5D6E5
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 08:12:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7663810E0F9;
	Wed, 12 Mar 2025 07:12:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KYB29O/S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4CB10E029;
 Wed, 12 Mar 2025 07:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741763538; x=1773299538;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xjv4j0Lz5bKnTQ7XcJJHorp4xrT5wFZ442HDJf9tDX0=;
 b=KYB29O/SsMTD3SsKLUINo846B4eDIBrnE21XAsQWqMOBUQdOCnIwxV2d
 8AEI6tQxk1RvxBNz08FjkpOr9fIHkkCmJmGpWZwb3u1DTmgHf2zIW/Wgg
 hV0QOkVqRhcv1vlf4qUKktYVYfNjvswXcO+GHCxUeoQyv81x+jZBlRH6H
 WJJGopqFpSG9rX4UqC+HN3RuqvNS29mE4o8R6kfEwo43Qd/EoFjKN4vKT
 X2X6Z1uKhfGHYfE6qupsSOC1FwdzpuL1vhFnGFjZBTLHKt+KZu9MWpaN2
 eJe9zAVBWZAH6Vf/Q/d+vOlw3qkQ1EAceC+PSFyUXXfJlgKpTXOFcr0Gs Q==;
X-CSE-ConnectionGUID: 4H6mlg+5SUC1xdBJGXFSAw==
X-CSE-MsgGUID: e9h5/NQ1TJSRkTF/gY6j/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="65288674"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="65288674"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 00:12:18 -0700
X-CSE-ConnectionGUID: +iCMZO/NSq+PBUvMboXTeQ==
X-CSE-MsgGUID: 2EzCgPFvTMGz1FmxN4+twQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="120365620"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa006.fm.intel.com with ESMTP; 12 Mar 2025 00:12:09 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Uma Shankar <uma.shankar@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
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
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [v4 00/23] Plane Color Pipeline support for Intel platforms
Date: Wed, 12 Mar 2025 12:54:02 +0530
Message-ID: <20250312072425.3099205-1-uma.shankar@intel.com>
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
DRM core has been sent out by Harry Wentland and is under review
below:
https://patchwork.freedesktop.org/series/123446/

The base work of above series is squashed under 1 patch and support
for Intel platform is added on top of it.
Any reviews on the original core design is expected to be done in 
Harry's series to avoid any forking of the discussion.

Changes added on core design:

1. Implemented a HW capability property to expose segmented luts.
drm: Add Color lut range attributes
drm: Add Color ops capability property
drm: Define helper to initialize segmented 1D LUT

This helps in generically defining the hardware lut capabilities,
lut distribution, precision, segmented or PWL LUTS.

2. Added support for enhanced prescision, 3x3 matrix and 1d LUT:
drm: Add Enhanced LUT precision structure
drm: Add support for 3x3 CTM
drm: Add 1D LUT color op

On top of this base work for DRM core plane color pipeline design,
implementation is done for Intel hardware platforms. Below patches
include the same:

drm/i915: Add identifiers for intel color blocks
drm/i915: Add intel_color_op
drm/i915/color: Add helper to allocate intel colorop
drm/i915/color: Add helper to create intel colorop
drm/i915/color: Create a transfer function color pipeline
drm/i915/color: Add and attach COLORPIPELINE plane property
drm/i915/color: Add framework to set colorop
drm/i915/color: Add callbacks to set plane CTM
drm/i915/color: Add framework to program PRE/POST CSC LUT
drm/i915/color: Enable Plane Color Pipelines
drm/i915: Define segmented Lut and add capabilities to colorop
drm/i915/color: Add plane CTM callback for TGL and beyond
drm/i915: Add register definitions for Plane Degamma
drm/i915: Add register definitions for Plane Post CSC
drm/i915/color: Program Pre-CSC registers
drm/i915/xelpd: Program Plane Post CSC Registers

IGT Changes to validate the same have been implemented and can be found
in the below github repository:
https://github.com/ckborah/igt-sandbox/tree/amd-intel-color-pipeline-v5-new_seg

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

Changes in v3:
   - Rebased on latest plane color pipeline series (v7) from AMD
   - Updated documentation for 3x3 CTM colorop (Dmitry)
   - Fixed documentation for multi segmented 1D lut (Dmitry)
   - Squashed changes for 1d LUT helpers (Dmitry)

Change in v4:
  - Rebase

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

Chaitanya Kumar Borah (12):
  drm: Add support for 3x3 CTM
  drm: Add 1D LUT multi-segmented color op
  drm/i915: Add identifiers for intel color blocks
  drm/i915: Add intel_color_op
  drm/i915/color: Add helper to create intel colorop
  drm/i915/color: Create a transfer function color pipeline
  drm/i915/color: Add and attach COLORPIPELINE plane property
  drm/i915/color: Add framework to set colorop
  drm/i915/color: Add callbacks to set plane CTM
  drm/i915/color: Add new color callbacks for Xelpd
  drm/i915/color: Add framework to program PRE/POST CSC LUT
  drm/i915/color: Enable Plane Color Pipelines

Harry Wentland (1):
  drm: color pipeline base work

Uma Shankar (10):
  drm: Add Enhanced LUT precision structure
  drm: Add Color lut range attributes
  drm: Add Color ops capability property
  drm: Define helper to initialize segmented 1D LUT
  drm/i915/color: Add plane CTM callback for D13 and beyond
  drm/i915: Add register definitions for Plane Degamma
  drm/i915: Add register definitions for Plane Post CSC
  drm/i915/color: Program Pre-CSC registers
  drm/i915/xelpd: Program Plane Post CSC Registers
  drm/doc/rfc: Add documentation for multi-segmented 1D LUT

 Documentation/gpu/drm-kms.rst                 |  15 +
 Documentation/gpu/rfc/color_pipeline.rst      | 518 +++++++++++
 Documentation/gpu/rfc/index.rst               |   3 +
 drivers/gpu/drm/Makefile                      |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   3 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   4 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 566 ++++++++++++-
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 206 +++++
 .../amd/display/amdgpu_dm/amdgpu_dm_colorop.h |  36 +
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  32 +
 drivers/gpu/drm/drm_atomic.c                  | 177 +++-
 drivers/gpu/drm/drm_atomic_helper.c           |  12 +
 drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
 drivers/gpu/drm/drm_atomic_uapi.c             | 174 ++++
 drivers/gpu/drm/drm_color_mgmt.c              |  43 +
 drivers/gpu/drm/drm_colorop.c                 | 707 ++++++++++++++++
 drivers/gpu/drm/drm_ioctl.c                   |   7 +
 drivers/gpu/drm/drm_mode_config.c             |   7 +
 drivers/gpu/drm/drm_plane.c                   |  52 ++
 drivers/gpu/drm/i915/display/intel_color.c    | 628 +++++++++++++-
 drivers/gpu/drm/i915/display/intel_color.h    |  17 +-
 .../drm/i915/display/intel_display_limits.h   |  13 +
 .../drm/i915/display/intel_display_types.h    |  19 +
 .../drm/i915/display/skl_universal_plane.c    |   5 +
 .../i915/display/skl_universal_plane_regs.h   | 126 +++
 drivers/gpu/drm/tests/Makefile                |   3 +-
 drivers/gpu/drm/tests/drm_fixp_test.c         |  71 ++
 drivers/gpu/drm/vkms/Makefile                 |   4 +-
 drivers/gpu/drm/vkms/tests/vkms_color_test.c  | 459 ++++++++++
 drivers/gpu/drm/vkms/vkms_colorop.c           | 113 +++
 drivers/gpu/drm/vkms/vkms_composer.c          | 131 ++-
 drivers/gpu/drm/vkms/vkms_composer.h          |  27 +
 drivers/gpu/drm/vkms/vkms_drv.h               |   7 +
 drivers/gpu/drm/vkms/vkms_luts.c              | 801 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_luts.h              |  12 +
 drivers/gpu/drm/vkms/vkms_plane.c             |   1 +
 include/drm/drm_atomic.h                      | 130 +++
 include/drm/drm_atomic_uapi.h                 |   3 +
 include/drm/drm_color_mgmt.h                  |  13 +
 include/drm/drm_colorop.h                     | 473 +++++++++++
 include/drm/drm_file.h                        |   7 +
 include/drm/drm_fixed.h                       |  18 +
 include/drm/drm_mode_config.h                 |  18 +
 include/drm/drm_plane.h                       |  19 +
 include/uapi/drm/amdgpu_drm.h                 |   9 -
 include/uapi/drm/drm.h                        |  16 +
 include/uapi/drm/drm_mode.h                   | 192 +++++
 47 files changed, 5853 insertions(+), 50 deletions(-)
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

