Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A10B39710F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 12:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4C16E9E1;
	Tue,  1 Jun 2021 10:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA306E9D9;
 Tue,  1 Jun 2021 10:16:01 +0000 (UTC)
IronPort-SDR: Kwf104kHRfsRShwzjF3Gt2EjMC9LYYOZXTRj9yAz26Hrll7eTKab8m2ETHUTjeMkLavt01TUqv
 TkcPHdN9EpvQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="203549919"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="203549919"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:16:00 -0700
IronPort-SDR: 6NVnKJLIXKRSq7BaIhQEG088/oEdNOljDWrve0QFRCvQeV5wgjNVHkopoO2KmfOAAr/vgPKIWy
 AQ95b2Cn6ylQ==
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="482431132"
Received: from linux-desktop.iind.intel.com ([10.223.34.178])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:15:58 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 00/21] Add Support for Plane Color Lut and CSC features
Date: Tue,  1 Jun 2021 16:21:57 +0530
Message-Id: <20210601105218.29185-1-uma.shankar@intel.com>
X-Mailer: git-send-email 2.26.2
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
Cc: Uma Shankar <uma.shankar@intel.com>, bhanuprakash.modem@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is how a typical display color hardware pipeline looks like:
 +-------------------------------------------+
 |                RAM                        |
 |  +------+    +---------+    +---------+   |
 |  | FB 1 |    |  FB 2   |    | FB N    |   |
 |  +------+    +---------+    +---------+   |
 +-------------------------------------------+
       |  Plane Color Hardware Block |
 +--------------------------------------------+
 | +---v-----+   +---v-------+   +---v------+ |
 | | Plane A |   | Plane B   |   | Plane N  | |
 | | DeGamma |   | Degamma   |   | Degamma  | |
 | +---+-----+   +---+-------+   +---+------+ |
 |     |             |               |        |
 | +---v-----+   +---v-------+   +---v------+ |
 | |Plane A  |   | Plane B   |   | Plane N  | |
 | |CSC/CTM  |   | CSC/CTM   |   | CSC/CTM  | |
 | +---+-----+   +----+------+   +----+-----+ |
 |     |              |               |       |
 | +---v-----+   +----v------+   +----v-----+ |
 | | Plane A |   | Plane B   |   | Plane N  | |
 | | Gamma   |   | Gamma     |   | Gamma    | |
 | +---+-----+   +----+------+   +----+-----+ |
 |     |              |               |       |
 +--------------------------------------------+
+------v--------------v---------------v-------|
||                                           ||
||           Pipe Blender                    ||
+--------------------+------------------------+
|                    |                        |
|        +-----------v----------+             |
|        |  Pipe DeGamma        |             |
|        |                      |             |
|        +-----------+----------+             |
|                    |            Pipe Color  |
|        +-----------v----------+ Hardware    |
|        |  Pipe CSC/CTM        |             |
|        |                      |             |
|        +-----------+----------+             |
|                    |                        |
|        +-----------v----------+             |
|        |  Pipe Gamma          |             |
|        |                      |             |
|        +-----------+----------+             |
|                    |                        |
+---------------------------------------------+
                     |
                     v
               Pipe Output

This patch series adds properties for plane color features. It adds
properties for degamma used to linearize data and CSC used for gamut
conversion. It also includes Gamma support used to again non-linearize
data as per panel supported color space. These can be utilize by user
space to convert planes from one format to another, one color space to
another etc.

Userspace can take smart blending decisions and utilize these hardware
supported plane color features to get accurate color profile. The same
can help in consistent color quality from source to panel taking
advantage of advanced color features in hardware.

These patches add the property interfaces and enable helper functions.
This series adds Intel's XE_LPD hw specific plane gamma feature. We
can build up and add other platform/hardware specific implementation
on top of this series.

Credits: Special mention and credits to Ville Syrjala for coming up
with a design for this feature and inputs. This series is based on
his original design and idea.

Note: Userspace support for this new UAPI will be done on Chrome. We
will notify the list once we have that ready for review.

ToDo: State readout for this feature will be added next.

Uma Shankar (21):
  drm: Add Enhanced Gamma and color lut range attributes
  drm: Add Plane Degamma Mode property
  drm: Add Plane Degamma Lut property
  drm/i915/xelpd: Define Degamma Lut range struct for HDR planes
  drm/i915/xelpd: Add register definitions for Plane Degamma
  drm/i915/xelpd: Enable plane color features
  drm/i915/xelpd: Add color capabilities of SDR planes
  drm/i915/xelpd: Program Plane Degamma Registers
  drm/i915/xelpd: Add plane color check to glk_plane_color_ctl
  drm/i915/xelpd: Initialize plane color features
  drm/i915/xelpd: Load plane color luts from atomic flip
  drm: Add Plane CTM property
  drm: Add helper to attach Plane ctm property
  drm/i915/xelpd: Define Plane CSC Registers
  drm/i915/xelpd: Enable Plane CSC
  drm: Add Plane Gamma Mode property
  drm: Add Plane Gamma Lut property
  drm/i915/xelpd: Define and Initialize Plane Gamma Lut range
  drm/i915/xelpd: Add register definitions for Plane Gamma
  drm/i915/xelpd: Program Plane Gamma Registers
  drm/i915/xelpd: Enable plane gamma

 Documentation/gpu/drm-kms.rst                 |  90 +++
 drivers/gpu/drm/drm_atomic.c                  |   1 +
 drivers/gpu/drm/drm_atomic_state_helper.c     |  12 +
 drivers/gpu/drm/drm_atomic_uapi.c             |  38 ++
 drivers/gpu/drm/drm_color_mgmt.c              | 177 +++++-
 .../gpu/drm/i915/display/intel_atomic_plane.c |   6 +
 .../gpu/drm/i915/display/intel_atomic_plane.h |   2 +
 drivers/gpu/drm/i915/display/intel_color.c    | 513 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_color.h    |   2 +
 .../drm/i915/display/skl_universal_plane.c    |  15 +-
 drivers/gpu/drm/i915/i915_drv.h               |   3 +
 drivers/gpu/drm/i915/i915_reg.h               | 176 +++++-
 include/drm/drm_mode_object.h                 |   2 +-
 include/drm/drm_plane.h                       |  81 +++
 include/uapi/drm/drm_mode.h                   |  58 ++
 15 files changed, 1170 insertions(+), 6 deletions(-)

-- 
2.26.2

