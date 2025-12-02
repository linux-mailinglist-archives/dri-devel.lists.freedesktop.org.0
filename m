Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBB0C9A417
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 07:26:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA11410E16C;
	Tue,  2 Dec 2025 06:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WP1fERCO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FE310E021;
 Tue,  2 Dec 2025 06:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764656798; x=1796192798;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=rR84XBalqo361KpDVCWv36ByhyhAfRVZ7uEX+A67LjY=;
 b=WP1fERCOgZd8aB3Kp2Gs8hdg8ekbEpQQ+Y/47/Rbj8DPH2tER6NIEpki
 YMum5iIQbpwGmQ/VJhg3wgTNZnn+V0Kqa5Z8vlM05az0m1gOaBEXevzGw
 aDpYsyOGvMc3HnImbKNh08gUGzbTpb1fAa3/A6WRvJFg94jBWAlqYJpjt
 g2SCypysQEZdkcW0Xgw/TuHkHmsT3UvUcMbJImRAPtShTvNNfiUWiKXqa
 Y/EwHsNhiQfVGBqCuPoZ2ITiKCue7AfoaPVWi3JHgo0u8nDpKMaWS/eVM
 FgaVxYQA4iVq2oCHlLMS0lNQ94j2EPX0d7uncbLyM0qP24epkEXS6zb6Q A==;
X-CSE-ConnectionGUID: cs2wbBSHSYyzd948KmJ0lQ==
X-CSE-MsgGUID: XsttsNkvQq6MXxMQJVSoPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66499782"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="66499782"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 22:26:38 -0800
X-CSE-ConnectionGUID: Zb4WXgQ4QrOVCcZJiIhTHQ==
X-CSE-MsgGUID: XaegD1u5QaGxxmb0vmaZow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="193961006"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa007.fm.intel.com with ESMTP; 01 Dec 2025 22:26:31 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH RESEND v9 00/20] Display Global Histogram
Date: Tue, 02 Dec 2025 11:56:54 +0530
Message-Id: <20251202-dpst-v9-0-f2abb2ca2465@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK+GLmkC/03OPQ+CMBAG4L9COlvSNrRSJwdZHXQkDHwc0kQKu
 RYiIfx3Ky6Mb+7uuXclDtCAI5doJQizcWawIehTROqutC+gpgmZCCYSLnhKm9F5WqdQtzxlSlQ
 VCasjQms+O5OT/JE9s/utIEWYtDj01HcI5YFhmishWRILniilz1TQEicbY9xP6LvlaqyHd1wP/
 Q/vjPMDLnvFWe8vAiMDw/9tZk0ZhUSJRsqmKpU83Bfbtn0BCuJtlOUAAAA=
X-Change-ID: 20241218-dpst-c8ecf18062bb
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 uma.shankar@intel.com, chaitanya.kumar.borah@intel.com, 
 suraj.kandpal@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Arun R Murthy <arun.r.murthy@intel.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.15-dev
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

Display histogram is a hardware functionality where a statistics for 'n'
number of frames is generated to form a histogram data. This is notified
to the user via histogram event. Compositor will then upon sensing the
histogram event will read the histogram data from KMD via crtc property.
User can use this histogram and apply various equilization techniques to
enhance the image or use this histogram for shaders.

Display ImageEnhancemenT is a hardware that interpolates the LUT value
to generate the enhanced output image. 1DLUT value is to be provided by
the user via crtc property.

One such library Global Histogram Enhancement(GHE) will take the histogram
as input and apply the algorithm to enhance the density and then
return the enhanced LUT factor. This library can be located @
https://github.com/intel/ghe

The corresponding mutter changes to enable/disable histogram, read the
histogram data, communicate with the library and write the enhanced data
back to the KMD is also pushed for review at https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3873
and https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3873/diffs?commit_id=270808ca7c8be48513553d95b4a47541f5d40206
The IGT changes for validating the histogram event and reading the
histogram is also pushed for review at https://patchwork.freedesktop.org/series/135789/

NOTE: i915 driver changes for histogram and IET LUT is not fully tested
and the series is pushed to get the inital feel of the histogram/IET LUT
usage as well as to get started with the review.

---
Changes in v10:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v9: https://lore.kernel.org/r/20251201-dpst-v9-0-e462d55dba65@intel.com

---
Arun R Murthy (20):
      DO_NOT_REVIEW: plane/crtc color pipeline
      drm: Define histogram structures exposed to user
      drm: Add new element histogram for colorop
      drm/colorop: Export function to create pipeline element histogram
      drm: Define ImageEnhancemenT LUT structures exposed to user
      drm: Add new element Image EnhancemenT for colorop
      drm/colorop: Export function to create pipeline element iet lut
      drm/i915/histogram: Define registers for histogram
      drm/i915/histogram: Add support for histogram
      drm/xe: Add histogram support to Xe builds
      drm/i915/histogram: histogram interrupt handling
      [DO_NOT_RTEVIEW] Plane Color Pipeline support for Intel platforms
      drm/i915/colorop: Add crtc color pipeline for i915
      drm/i915/histogram: Hook i915 histogram with drm histogram
      drm/i915/iet: Add support to writing the IET LUT data
      drm/i915/colorop: create IET LUT properties
      drm/i915/crtc: Hook i915 IET LUT with the drm IET properties
      drm/i915/histogram: histogram delay counter doesn't reset
      drm/i915/histogram: Histogram changes for Display 20+
      drm/i915/histogram: Enable pipe dithering

 drivers/gpu/drm/Makefile                           |   2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c    |   6 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |   2 +-
 drivers/gpu/drm/drm_atomic.c                       |   3 +
 drivers/gpu/drm/drm_atomic_uapi.c                  | 103 +++++-
 drivers/gpu/drm/drm_colorop.c                      | 181 ++++++++-
 drivers/gpu/drm/drm_connector.c                    |   1 +
 drivers/gpu/drm/drm_crtc.c                         |  77 ++++
 drivers/gpu/drm/drm_crtc_internal.h                |   6 +
 drivers/gpu/drm/drm_ioctl.c                        |  12 +
 drivers/gpu/drm/drm_mode_object.c                  |  16 +
 drivers/gpu/drm/i915/Makefile                      |   3 +
 .../gpu/drm/i915/display/intel_color_pipeline.c    | 156 ++++++++
 .../gpu/drm/i915/display/intel_color_pipeline.h    |  15 +
 drivers/gpu/drm/i915/display/intel_colorop.c       |  35 ++
 drivers/gpu/drm/i915/display/intel_colorop.h       |  15 +
 drivers/gpu/drm/i915/display/intel_crtc.c          |   7 +
 drivers/gpu/drm/i915/display/intel_display.c       |  18 +
 drivers/gpu/drm/i915/display/intel_display_irq.c   |   6 +-
 .../gpu/drm/i915/display/intel_display_limits.h    |  15 +
 drivers/gpu/drm/i915/display/intel_display_regs.h  |   5 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   7 +
 drivers/gpu/drm/i915/display/intel_histogram.c     | 406 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_histogram.h     |  53 +++
 .../gpu/drm/i915/display/intel_histogram_regs.h    |  73 ++++
 drivers/gpu/drm/xe/Makefile                        |   3 +
 include/drm/drm_atomic.h                           |  20 +
 include/drm/drm_atomic_uapi.h                      |   2 +
 include/drm/drm_colorop.h                          |  76 ++++
 include/drm/drm_crtc.h                             |  27 ++
 include/drm/drm_drv.h                              |   6 +
 include/drm/drm_file.h                             |  21 +-
 include/uapi/drm/drm.h                             |  44 +++
 include/uapi/drm/drm_mode.h                        | 153 ++++++++
 34 files changed, 1545 insertions(+), 30 deletions(-)
---
base-commit: db56e7764a202da6c1f9583e9b9cc0365a973d7a
change-id: 20241218-dpst-c8ecf18062bb

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

