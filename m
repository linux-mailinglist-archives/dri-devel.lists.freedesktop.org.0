Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C66C9D3337
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 06:45:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D52510E38A;
	Wed, 20 Nov 2024 05:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hC3YrrIG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D33110E38A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 05:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732081498; x=1763617498;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qaGX5D6vHVOqoHepDuZEEYhHiggL1J8V7BQMjLnmsvQ=;
 b=hC3YrrIGJ9BlREDsxUWpMITaSNskoCGt8Cr5VccnqOWuVw5tyiwXmcD+
 QI2JdMgzrrdgqUtcgHK+iD3diieFIQzN0ErvfOAULKRFptfdC59NNYWSG
 Xrls30d4ryY/DDalJjGxfCfMiWLBn8ladmW2omwMhcsLv76MBIve5qhri
 FTs5Kv/HgZcLTiF1XMhGP3lyR3tEoNyYg+Vr4jrqKQ7yDyB48RYspjbAD
 GfQA8x08illU07zBWsooDiRcBTNDvVhg1Vkc4uMhCGQ24mKBUqikjlFlz
 IUZyS98xgxRN6lxZN1X/0duvUOJ/NZ/GE+on2tAnEabIGZOdkx+Ym7cKj g==;
X-CSE-ConnectionGUID: TtJVRERiSzmOnJ0P13FQDQ==
X-CSE-MsgGUID: 4Is/0ZZkQYmpLHwm0RMXlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31867785"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="31867785"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 21:44:58 -0800
X-CSE-ConnectionGUID: yKHtKIZKR0CJcyQTzYvDCQ==
X-CSE-MsgGUID: 9bDk9Y1WS/mkYPgAI4oU1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="89606855"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa007.fm.intel.com with ESMTP; 19 Nov 2024 21:44:57 -0800
From: Nemesa Garg <nemesa.garg@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 0/5]  Introduce drm sharpness property
Date: Wed, 20 Nov 2024 11:16:08 +0530
Message-Id: <20241120054613.3797587-1-nemesa.garg@intel.com>
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

Nemesa Garg (5):
  drm: Introduce sharpness strength property
  drm/i915/display: Compute the scaler filter coefficients
  drm/i915/display: Enable the second scaler for sharpness
  drm/i915/display: Add registers and compute the strength
  drm/i915/display: Load the lut values and enable sharpness

 drivers/gpu/drm/drm_atomic_uapi.c             |   4 +
 drivers/gpu/drm/drm_crtc.c                    |  35 +++
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_casf.c     | 252 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_casf.h     |  24 ++
 .../gpu/drm/i915/display/intel_casf_regs.h    |  36 +++
 drivers/gpu/drm/i915/display/intel_crtc.c     |   3 +
 drivers/gpu/drm/i915/display/intel_display.c  |  24 +-
 .../drm/i915/display/intel_display_types.h    |  16 ++
 .../drm/i915/display/intel_modeset_verify.c   |   2 +
 drivers/gpu/drm/i915/display/intel_pfit.c     |   6 +
 drivers/gpu/drm/i915/display/skl_scaler.c     | 101 ++++++-
 drivers/gpu/drm/i915/display/skl_scaler.h     |   1 +
 drivers/gpu/drm/i915/i915_reg.h               |   2 +
 drivers/gpu/drm/xe/Makefile                   |   1 +
 include/drm/drm_crtc.h                        |  17 ++
 16 files changed, 508 insertions(+), 17 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf_regs.h

-- 
2.25.1

