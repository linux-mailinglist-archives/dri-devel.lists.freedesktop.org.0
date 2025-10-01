Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC0CBAF411
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 08:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3BB10E66D;
	Wed,  1 Oct 2025 06:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J8NieKlq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5FF10E340;
 Wed,  1 Oct 2025 06:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759300766; x=1790836766;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/895hZounMtXKh5/Ub9aXmvghXz7fAsEIcMCznrPbJM=;
 b=J8NieKlq9NHQAPL4SfioHfyZXPmxETFbeUZSsGDL5WOtjPzTOFZZQ9dP
 CaVPx4CA33hwp+1dL5JdEg/7Iph6KLVs+2JpAxGUtpdBBPnjdSD8NaaGm
 JwofWrbl3ttjxhfa+EkdsFQMh8kWS6prUbQuWTRgNGcVvSf+URQ+sU+HZ
 Yo9U2n1xwjtmAJsNvJB+zNhnYNyGtPdntjXEDzjfcD3n3fmLvP+p288zs
 oA+cspxV8H3/IC3YJLZjtSWcmTD2Q4vc4z5fmav/C0LMb8PLb09UtKZ5E
 8TtFXyk+Sj6LrugAFRLnbyek053xBGeUp/7mjc/iMjh+9V0RFI6mW/2VH g==;
X-CSE-ConnectionGUID: qZOtDNRKSx69AH6A+AyL6g==
X-CSE-MsgGUID: JYHiF+MNQJeDu/F0Ovg/cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="65422477"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="65422477"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 23:39:25 -0700
X-CSE-ConnectionGUID: EW+1GuvZTz2Ai4OYoUoskQ==
X-CSE-MsgGUID: /BQkHyyMRdeWT4YQbIyoSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="177841892"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa006.jf.intel.com with ESMTP; 30 Sep 2025 23:39:24 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 00/10]  Introduce drm sharpness property
Date: Wed,  1 Oct 2025 12:04:50 +0530
Message-Id: <20251001063500.1259687-1-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
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

 Many a times images are blurred or upscaled content is also not as
crisp as original rendered image. Traditional sharpening techniques often
apply a uniform level of enhancement across entire image, which sometimes
result in over-sharpening of some areas and potential loss of natural details.

Intel has come up with Display Engine based adaptive sharpening filter
with minimal power and performance impact. From LNL onwards, the Display
hardware can use one of the pipe scaler for adaptive sharpness filter.
This can be used for both gaming and non-gaming use cases like photos,
image viewing. It works on a region of pixels depending on the tap size.

This is an attempt to introduce an adaptive sharpness solution which
helps in improving the image quality. For this new CRTC property is added.
The user can set this property with desired sharpness strength value with
0-255. A value of 1 representing minimum sharpening strength and 255
representing maximum sharpness strength. A strength value of 0 means no
sharpening or sharpening feature disabled.
It works on a region of pixels depending on the tap size. The coefficients
are used to generate an alpha value which is used to blend the sharpened
image to original image.

Middleware MR link: https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3665
IGT patchwork link: https://patchwork.freedesktop.org/series/130218/

Continuing discussions from:  https://patchwork.freedesktop.org/series/129888/

https://invent.kde.org/plasma/kwin/-/merge_requests/7689
Got ack from kwin maintainer on the UAPI patch.

Minor changes in patch 3, 4 and 5 hence require rb.

Nemesa Garg (10):
  drm/drm_crtc: Introduce sharpness strength property
  drm/i915/display: Introduce HAS_CASF for sharpness support
  drm/i915/display: Add CASF strength and winsize
  drm/i915/display: Add filter lut values
  drm/i915/display: Compute the scaler coefficients
  drm/i915/display: Add and compute scaler parameter
  drm/i915/display: Configure the second scaler
  drm/i915/display: Set and get the casf config
  drm/i915/display: Enable/disable casf
  drm/i915/display: Expose sharpness strength property

 drivers/gpu/drm/drm_atomic_uapi.c             |   4 +
 drivers/gpu/drm/drm_crtc.c                    |  35 +++
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_casf.c     | 293 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_casf.h     |  22 ++
 .../gpu/drm/i915/display/intel_casf_regs.h    |  33 ++
 drivers/gpu/drm/i915/display/intel_crtc.c     |   3 +
 .../drm/i915/display/intel_crtc_state_dump.c  |   5 +
 drivers/gpu/drm/i915/display/intel_display.c  |  37 ++-
 .../drm/i915/display/intel_display_device.h   |   1 +
 .../drm/i915/display/intel_display_types.h    |  15 +
 drivers/gpu/drm/i915/display/skl_scaler.c     |  91 +++++-
 drivers/gpu/drm/i915/display/skl_scaler.h     |   2 +
 drivers/gpu/drm/xe/Makefile                   |   1 +
 include/drm/drm_crtc.h                        |  18 ++
 15 files changed, 548 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf_regs.h

-- 
2.25.1

