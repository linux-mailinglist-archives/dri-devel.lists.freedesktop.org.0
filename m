Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B3A8749B5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 09:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA7A1136C8;
	Thu,  7 Mar 2024 08:35:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hGK6kqHi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B525910EF12;
 Thu,  7 Mar 2024 08:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709800518; x=1741336518;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QbkiNvbOCkBe6g/9H9GqMUk3HmNRFCmZHlALEYofPIg=;
 b=hGK6kqHi8m0ap+nyZFAt99mnoZUObxL/Z7NUxc5yAvBZL+BKStiYgCTU
 m3ljFiA7uUx83h8dJTRJ7YaQFcSi5meeS+y3MAr4IDV/fsDyEWiUgkLei
 +eEPc079fgrt9sZAvRuo/jGxRVU5F81BLnz17CmB3ENQFFSOftBJ73PBG
 GhH8OTOf0p5OH8qhzvfgSPSu1canAnM3KZRSCZHJ/7olR8VlQg/bG54hE
 Z7uQ5qzrzXdjXvXQvGl82Fbf4Qxwx4PY2/US+9ySII9wWD59QONGGor+K
 IV7iKQFG/VwITm6gTYunV6dkqDPg+YZk2N/h7i0n3p/veF5nlETLuX80B Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15597893"
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; d="scan'208";a="15597893"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 00:35:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="9937294"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa009.fm.intel.com with ESMTP; 07 Mar 2024 00:35:15 -0800
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 0/5]  Introduce drm sharpening property
Date: Thu,  7 Mar 2024 14:02:32 +0530
Message-Id: <20240307083237.576177-1-nemesa.garg@intel.com>
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

This RFC is an attempt to introduce an adaptive sharpness solution which
helps in improving the image quality. For this new CRTC property is added.
The user can set this property with desired sharpness strength value with
0-255. A value of 1 representing minimum sharpening strength and 255
representing maximum sharpness strength. A strength value of 0 means no
sharpening or sharpening feature disabled.
It works on a region of pixels depending on the tap size. The coefficients
are used to generate an alpha value which is used to blend the sharpened
image to original image.
 
Userspace implementation for sharpening feature and IGT implementation
is in progress.

Nemesa Garg (5):
  drm: Introduce sharpness mode property
  drm/i915/display: Compute the scaler filter coefficients
  drm/i915/display: Enable the second scaler
  drm/i915/display: Add registers and compute the strength
  drm/i915/display: Load the lut values and enable sharpness

 drivers/gpu/drm/drm_atomic_uapi.c             |   4 +
 drivers/gpu/drm/drm_crtc.c                    |  17 ++
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_crtc.c     |   3 +
 drivers/gpu/drm/i915/display/intel_display.c  |  22 +-
 .../drm/i915/display/intel_display_types.h    |  11 +
 .../drm/i915/display/intel_modeset_verify.c   |   1 +
 .../drm/i915/display/intel_sharpen_filter.c   | 211 ++++++++++++++++++
 .../drm/i915/display/intel_sharpen_filter.h   |  31 +++
 drivers/gpu/drm/i915/display/skl_scaler.c     |  97 +++++++-
 drivers/gpu/drm/i915/display/skl_scaler.h     |   1 +
 drivers/gpu/drm/i915/i915_reg.h               |  19 ++
 drivers/gpu/drm/xe/Makefile                   |   1 +
 include/drm/drm_crtc.h                        |  17 ++
 14 files changed, 425 insertions(+), 11 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_sharpen_filter.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_sharpen_filter.h

-- 
2.25.1

