Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 913D5B10BED
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 15:51:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A67710E336;
	Thu, 24 Jul 2025 13:50:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eUCNf3ka";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BDB310E14A;
 Thu, 24 Jul 2025 13:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753365057; x=1784901057;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jx3G+0nLAbR2dZMP10qbAh4fkt2sL/eD6BAy5RhgDyo=;
 b=eUCNf3kaMjYPR7YSq/7z/rwR5a715YcH209pUxtCmU1InMjQlq/sc59C
 W5WHUsnXZ5em51QpLqIe72VdYv+Jd1xRNbqGs9n5voedxjHG940e8GrE1
 SJmk4us8ZNJzrrOJL2x5BYQNTkbfSqoUau+cnWy/ww4Bmpv8XIPF4PpQu
 hmDbuqzQSAPMM3W3cseoW2u2ctWkN7CCts4XDf4L6+siWA0HFlH0Dfqlw
 Kf44rUEjhzasK9jh4/y1s62WHFhC87OMCR7XhpLxlpkJMAFXHTNCLrY9x
 C4ZNGd6+MV2Y5Gq0tdt51l8MeeJEyoqxaBZ0Ckx7bnjHWGilh+gl13Vpe w==;
X-CSE-ConnectionGUID: wanEOrEARyqnizu7ddIIng==
X-CSE-MsgGUID: TppEjhgZQCmxxVC7MGo/gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55553871"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="55553871"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 06:50:57 -0700
X-CSE-ConnectionGUID: v+eu9EwoSoqtoxdqddnZbA==
X-CSE-MsgGUID: DxA2z6gCSKG5G0rA34Arpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="159826433"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa007.fm.intel.com with ESMTP; 24 Jul 2025 06:50:54 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 00/10]  Introduce drm sharpness property
Date: Thu, 24 Jul 2025 19:15:34 +0530
Message-Id: <20250724134544.284371-1-nemesa.garg@intel.com>
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

Nemesa Garg (10):
  drm/drm-crtc: Introduce sharpness strength property
  drm/i915/display: Introduce HAS_CASF for sharpness support
  drm/i915/display: Add strength and winsize register
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
 drivers/gpu/drm/i915/display/intel_casf.h     |  24 ++
 .../gpu/drm/i915/display/intel_casf_regs.h    |  33 ++
 drivers/gpu/drm/i915/display/intel_crtc.c     |   3 +
 .../drm/i915/display/intel_crtc_state_dump.c  |   7 +
 drivers/gpu/drm/i915/display/intel_display.c  |  37 ++-
 .../drm/i915/display/intel_display_device.h   |   1 +
 .../drm/i915/display/intel_display_types.h    |  15 +
 drivers/gpu/drm/i915/display/skl_scaler.c     |  90 +++++-
 drivers/gpu/drm/i915/display/skl_scaler.h     |   1 +
 drivers/gpu/drm/xe/Makefile                   |   1 +
 include/drm/drm_crtc.h                        |  17 +
 15 files changed, 549 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf_regs.h

-- 
2.25.1

