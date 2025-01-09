Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE66A080FB
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 21:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2830910EF8C;
	Thu,  9 Jan 2025 20:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m0VuuKeT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39ABF10E49C;
 Thu,  9 Jan 2025 20:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736452849; x=1767988849;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=vynMtNauuUMbL3VtAvgCwi9somgL/5jlFXs0t1NCMUE=;
 b=m0VuuKeTHfTbRFb8xHbt2HTVsUXIR3lq0CRYyMe0JsBkfdThPGrvR1ud
 L9hzGHrpHL7UfbZqF+CbxSbkgiNK1WMmYcAv0vAHBMfSAaOdpK+yFf7bc
 txJbTKoKnHV6R9SRWAewFjHF9ZahA28QSsAXAaaf9AdJzDCu7nA3muHwx
 sdL+GRKxTlm9MiUDUXKxbmORP7PEw4WH5RZL4Hu9Kdfh8l7LTPg8Lx9PZ
 kXmxb8K3bbLgmqoccWQK1meYPtbkaN+5EdadpkYQRZRRjGPVAOX46KcIg
 zqARsq1DCNZ7NX4dgcPvEmZhH7FVnKE8Lx1aIO6LK54cBJWOrUEjKSLbL g==;
X-CSE-ConnectionGUID: DKmDK1UXQUypaXkvPr34vA==
X-CSE-MsgGUID: C6eksGWiS4SI7j9hY2hK+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36619165"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="36619165"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 12:00:48 -0800
X-CSE-ConnectionGUID: hCQ3ma4sTuyhSIiTS4s9qw==
X-CSE-MsgGUID: 9OXUmn45Rc+26oIhpLvGSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126798553"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 09 Jan 2025 12:00:45 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v7 00/14] Display Global Histogram
Date: Fri, 10 Jan 2025 01:15:28 +0530
Message-Id: <20250110-dpst-v7-0-605cb0271162@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFkngGcC/03MQQ7CIBCF4as0sxYCk0pbV97DuKB0akkEmoEaT
 dO7S1y5/JL/vR0ysacMl2YHppfPPsWK7tSAW2x8kPBTNaDCVqPuxbTmIlxPbta9MjiOUNOVafb
 v383tXj1zCqIsTPZvrAZt8Kxaibo1ZugECstblCzDxmX5XH0s9JQuBTiOL69IjfuZAAAA
X-Change-ID: 20241218-dpst-c8ecf18062bb
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: dmitry.baryshkov@linaro.org, suraj.kandpal@intel.com, 
 uma.shankar@intel.com, 
 "Imported from f20241218-dpst-v7-0-81bfe7d08c2d"@intel.com, 
 20240705091333.328322-1-mohammed.thasleem@intel.com, 
 Arun R Murthy <arun.r.murthy@intel.com>
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

EDITME: Imported from f20241218-dpst-v7-0-81bfe7d08c2d@intel.com
        Please review before sending.

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

Test-with: 20240705091333.328322-1-mohammed.thasleem@intel.com

Arun R Murthy (10):
  drm/crtc: Add histogram properties
  drm/crtc: Expose API to create drm crtc property for histogram
  drm/i915/histogram: Define registers for histogram
  drm/i915/histogram: Add support for histogram
  drm/xe: Add histogram support to Xe builds
  drm/i915/histogram: histogram interrupt handling
  drm/i915/display: handle drm-crtc histogram property updates
  drm/i915/histogram: histogram delay counter doesnt reset
  drm/i915/histogram: Histogram changes for Display 20+
  drm/i915/histogram: Enable pipe dithering

 drivers/gpu/drm/drm_atomic_state_helper.c     |   6 +
 drivers/gpu/drm/drm_atomic_uapi.c             |  17 +
 drivers/gpu/drm/drm_crtc.c                    |  30 ++
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_atomic.c   |   1 +
 drivers/gpu/drm/i915/display/intel_crtc.c     |   7 +
 drivers/gpu/drm/i915/display/intel_display.c  |  17 +
 .../gpu/drm/i915/display/intel_display_irq.c  |   6 +-
 .../drm/i915/display/intel_display_types.h    |   4 +
 .../gpu/drm/i915/display/intel_histogram.c    | 380 ++++++++++++++++++
 .../gpu/drm/i915/display/intel_histogram.h    |  40 ++
 .../drm/i915/display/intel_histogram_regs.h   |  75 ++++
 drivers/gpu/drm/i915/i915_reg.h               |   5 +-
 drivers/gpu/drm/xe/Makefile                   |   1 +
 include/drm/drm_crtc.h                        |  49 +++
 include/uapi/drm/drm_mode.h                   |  11 +
 16 files changed, 647 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_histogram.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_histogram.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_histogram_regs.h

--
2.25.1

---
Arun R Murthy (4):
      drm: Define histogram structures exposed to user
      drm: Define ImageEnhancemenT LUT structures exposed to user
      drm/crtc: Expose API to create drm crtc property for histogram
      drm/crtc: Expose API to create drm crtc property for IET LUT

 drivers/gpu/drm/drm_atomic_state_helper.c |  23 +++++++
 drivers/gpu/drm/drm_atomic_uapi.c         |  28 ++++++++
 drivers/gpu/drm/drm_crtc.c                |  97 +++++++++++++++++++++++++++
 include/drm/drm_crtc.h                    |  77 ++++++++++++++++++++++
 include/uapi/drm/drm_mode.h               | 105 ++++++++++++++++++++++++++++++
 5 files changed, 330 insertions(+)
---
base-commit: 78526dfb8799485890dae3877fea308e9501879c
change-id: 20241218-dpst-c8ecf18062bb

Best regards,
--
Arun R Murthy <arun.r.murthy@intel.com>

---
Arun R Murthy (14):
      drm: Define histogram structures exposed to user
      drm: Define ImageEnhancemenT LUT structures exposed to user
      drm/crtc: Expose API to create drm crtc property for histogram
      drm/crtc: Expose API to create drm crtc property for IET LUT
      drm/i915/histogram: Define registers for histogram
      drm/i915/histogram: Add support for histogram
      drm/xe: Add histogram support to Xe builds
      drm/i915/histogram: histogram interrupt handling
      drm/i915/histogram: Hook i915 histogram with drm histogram
      drm/i915/iet: Add support to writing the IET LUT data
      drm/i915/crtc: Hook i915 IET LUT with the drm IET properties
      drm/i915/histogram: histogram delay counter doesnt reset
      drm/i915/histogram: Histogram changes for Display 20+
      drm/i915/histogram: Enable pipe dithering

 drivers/gpu/drm/drm_atomic_state_helper.c          |  23 ++
 drivers/gpu/drm/drm_atomic_uapi.c                  |  28 ++
 drivers/gpu/drm/drm_crtc.c                         | 127 +++++++
 drivers/gpu/drm/i915/Makefile                      |   1 +
 drivers/gpu/drm/i915/display/intel_crtc.c          |  10 +
 drivers/gpu/drm/i915/display/intel_display.c       |  14 +
 drivers/gpu/drm/i915/display/intel_display_irq.c   |   6 +-
 drivers/gpu/drm/i915/display/intel_display_types.h |   2 +
 drivers/gpu/drm/i915/display/intel_histogram.c     | 396 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_histogram.h     |  55 +++
 .../gpu/drm/i915/display/intel_histogram_regs.h    |  75 ++++
 drivers/gpu/drm/i915/i915_reg.h                    |   5 +-
 drivers/gpu/drm/xe/Makefile                        |   1 +
 include/drm/drm_crtc.h                             |  80 +++++
 include/uapi/drm/drm_mode.h                        | 109 ++++++
 15 files changed, 929 insertions(+), 3 deletions(-)
---
base-commit: 78526dfb8799485890dae3877fea308e9501879c
change-id: 20241218-dpst-c8ecf18062bb

Best regards,
-- 
Arun R Murthy <arun.r.murthy@intel.com>

