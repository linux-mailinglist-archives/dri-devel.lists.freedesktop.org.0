Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7246852918
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 07:40:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E5010E111;
	Tue, 13 Feb 2024 06:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CyhJl5id";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D727510E0ED;
 Tue, 13 Feb 2024 06:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707806428; x=1739342428;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RjTqOnuu7po7gCswyvva63hczLs9Fcr4A+1dbg7E6QQ=;
 b=CyhJl5ideDud2x2dX8QHZ8kay6H52NyhSx+ze6NW4t0K7XraxshVFV2T
 IIBEt7le0KIonKZLKK3Ud2OhwlYDD6yUnExsMnJXGoWERjdwO5yUMHDd1
 MJBupiide3fWYDhl/E3/iybNCpiJOhaOvcVEHY6C8ZxzFWHiQCFTwC2/z
 WBCaTHaITZutV3eOXY+2IK27U4XMf4b14Du+Ho6dzT+ItmwXH88PLrmpK
 pClnVQENuz0Wcu4/67RvkwSnmu8rchzcFotY2eTOJkjLHBggSanCtuL+h
 w6Vw7kFYJ9LIIxH26s/9/C8PU6ULLHkH5pCoB3QEZJdpVXMveY0xkmOZz A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="436947608"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="436947608"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:40:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7450079"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa003.jf.intel.com with ESMTP; 12 Feb 2024 22:40:21 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, harry.wentland@amd.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, arthurgrillo@riseup.net, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com, sean@poorly.run,
 Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH 00/28] Plane Color Pipeline support for Intel platforms
Date: Tue, 13 Feb 2024 12:18:07 +0530
Message-ID: <20240213064835.139464-1-uma.shankar@intel.com>
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

We have added some changes/fixes to the Harry's core DRM changes,
being put up as separate patches on top of squashed patch. These are
expected to get included in the main series from Harry once agreed upon.

Changes added on core design:
1. Below patches implement some fixes on original series
drm: Add missing function declarations
drm: handle NULL next colorop in drm_colorop_set_next_property
drm: Fix error logging in set Color Pipeline

2. Implemented a HW capability property to expose segmented luts.
drm: Add Color lut range attributes
drm: Add Color ops capability property
drm: Define helper to create color ops capability property
drm: Define helper for adding capability property for 1D LUT

This helps in generically defining the hardware lut capabilities,
lut distribution, precision, segmented or PWL LUTS.

3. Added support for enhanced prescision, 3x3 matrix and 1d LUT:
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
FIXME: force disable legacy plane color properties for TGL and beyond
drm/i915/color: Enable Plane Color Pipelines
drm/i915: Define segmented Lut and add capabilities to colorop
drm/i915/color: Add plane CTM callback for TGL and beyond
drm/i915: Add register definitions for Plane Degamma
drm/i915: Add register definitions for Plane Post CSC
drm/i915/color: Program Pre-CSC registers
drm/i915/xelpd: Program Plane Post CSC Registers

Bhanu from Intel will be sending out the igt changes to help test the
color pipeline implementation based on the current igt changes sent out
by Harry.
https://patchwork.freedesktop.org/series/123448/

Planned Next Steps:
1. Work with Harry and community and get DRM core changes for color
pipeline merged.
2. Implement pipe color management (post blending) based on the current
color pipeline design.
3. Work with compositor maintainers to get color processing implemented
using display hardware, thereby avoid any GL or GPU shaders.

Thanks to all the community maintainers and contributors who have helped
to get this support in upstream Linux. Looking forward to collaborate,
work together and get this merged.

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
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Chaitanya Kumar Borah (16):
  drm: Add missing function declarations
  drm: handle NULL next colorop in drm_colorop_set_next_property
  drm: Fix error logging in set Color Pipeline
  drm: Add support for 3x3 CTM
  drm: Add 1D LUT color op
  drm/i915: Add identifiers for intel color blocks
  drm/i915: Add intel_color_op
  drm/i915/color: Add helper to allocate intel colorop
  drm/i915/color: Add helper to create intel colorop
  drm/i915/color: Create a transfer function color pipeline
  drm/i915/color: Add and attach COLORPIPELINE plane property
  drm/i915/color: Add framework to set colorop
  drm/i915/color: Add callbacks to set plane CTM
  drm/i915/color: Add framework to program PRE/POST CSC LUT
  FIXME: force disable legacy plane color properties for TGL and beyond
  drm/i915/color: Enable Plane Color Pipelines

Harry Wentland (1):
  [NOT FOR REVIEW] drm: color pipeline base work

Uma Shankar (11):
  drm: Add Enhanced LUT precision structure
  drm: Add Color lut range attributes
  drm: Add Color ops capability property
  drm: Define helper to create color ops capability property
  drm: Define helper for adding capability property for 1D LUT
  drm/i915: Define segmented Lut and add capabilities to colorop
  drm/i915/color: Add plane CTM callback for TGL and beyond
  drm/i915: Add register definitions for Plane Degamma
  drm/i915: Add register definitions for Plane Post CSC
  drm/i915/color: Program Pre-CSC registers
  drm/i915/xelpd: Program Plane Post CSC Registers

 Documentation/gpu/rfc/color_pipeline.rst      | 352 ++++++++
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/drm_atomic.c                  | 147 ++++
 drivers/gpu/drm/drm_atomic_helper.c           |  12 +
 drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
 drivers/gpu/drm/drm_atomic_uapi.c             | 170 ++++
 drivers/gpu/drm/drm_colorop.c                 | 335 ++++++++
 drivers/gpu/drm/drm_ioctl.c                   |   7 +
 drivers/gpu/drm/drm_mode_config.c             |   7 +
 drivers/gpu/drm/i915/display/intel_color.c    | 562 ++++++++++++
 drivers/gpu/drm/i915/display/intel_color.h    |  16 +
 .../drm/i915/display/intel_display_limits.h   |  13 +
 .../drm/i915/display/intel_display_types.h    |  17 +
 .../drm/i915/display/skl_universal_plane.c    |  19 +-
 drivers/gpu/drm/i915/i915_reg.h               | 124 +++
 drivers/gpu/drm/tests/Makefile                |   4 +-
 drivers/gpu/drm/tests/drm_fixp_test.c         |  69 ++
 drivers/gpu/drm/vkms/Kconfig                  |   5 +
 drivers/gpu/drm/vkms/Makefile                 |   4 +-
 drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
 drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 355 ++++++++
 drivers/gpu/drm/vkms/vkms_colorop.c           | 115 +++
 drivers/gpu/drm/vkms/vkms_composer.c          | 117 ++-
 drivers/gpu/drm/vkms/vkms_drv.h               |   8 +
 drivers/gpu/drm/vkms/vkms_luts.c              | 802 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_luts.h              |  12 +
 drivers/gpu/drm/vkms/vkms_plane.c             |   2 +
 include/drm/drm_atomic.h                      |  87 ++
 include/drm/drm_atomic_uapi.h                 |   3 +
 include/drm/drm_color_mgmt.h                  |  23 +
 include/drm/drm_colorop.h                     | 274 ++++++
 include/drm/drm_file.h                        |   7 +
 include/drm/drm_fixed.h                       |  18 +
 include/drm/drm_mode_config.h                 |  18 +
 include/drm/drm_plane.h                       |  10 +
 include/uapi/drm/drm.h                        |  18 +
 include/uapi/drm/drm_mode.h                   |  83 ++
 37 files changed, 3815 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/gpu/rfc/color_pipeline.rst
 create mode 100644 drivers/gpu/drm/drm_colorop.c
 create mode 100644 drivers/gpu/drm/tests/drm_fixp_test.c
 create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_tests.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_luts.h
 create mode 100644 include/drm/drm_colorop.h

-- 
2.42.0

