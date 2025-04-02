Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBB1A78F4E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 15:02:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6738410E799;
	Wed,  2 Apr 2025 13:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZOvv5SEV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DEA10E787;
 Wed,  2 Apr 2025 13:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743598913; x=1775134913;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HCFl5k9I0wIgmvuMRCjwSH0FGKRRqoVUihsZPCcZldQ=;
 b=ZOvv5SEV0eBXFaHdS1FzZuMwDJR0CYu9+KHaI8TYPNKJl0lrdKgV2YN3
 5FBoLt/qL8ffxq9bkw/Sk6nh6DYfeQNa9foeTEF5qY656AQ6Z5g4FURvK
 nB6u+eRo7uU7CunsA2ejzWR7f6BYBaZnGXo9OZICwb5X0dXnD+I8Pitxm
 fXhJUbSL/CVYOt5+TQbNFL6J0XRW8tJZZXaEmoNRrf/zsbh7BfCAKWF1q
 JQxRCFDu7jxB2EoTHhbHDB6YMHUSQgDvYNv9ed/cScOQ33MmKh2TewT1e
 A1XjZuHign8vLz8nHLSG5oW08iPmKoH7F8FbZUPaZq/KGueRkl0+gXW7C g==;
X-CSE-ConnectionGUID: vt+RxAxHTreZUaAx0Yv4eQ==
X-CSE-MsgGUID: axRGXZmnQzikNizdagpkJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44219005"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="44219005"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 06:01:44 -0700
X-CSE-ConnectionGUID: K0hw9xF/TEGD6c7oCKDwqA==
X-CSE-MsgGUID: n54u48CNRi2K/CjcMfkPsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="127528150"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa009.fm.intel.com with ESMTP; 02 Apr 2025 06:01:40 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 00/10]  Introduce drm sharpness property
Date: Wed,  2 Apr 2025 18:26:37 +0530
Message-Id: <20250402125647.361295-1-nemesa.garg@intel.com>
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
  drm/i915/display: Introduce sharpness strength property
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
 drivers/gpu/drm/i915/display/intel_casf.c     | 280 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_casf.h     |  24 ++
 .../gpu/drm/i915/display/intel_casf_regs.h    |  40 +++
 drivers/gpu/drm/i915/display/intel_crtc.c     |   3 +
 .../drm/i915/display/intel_crtc_state_dump.c  |   7 +
 drivers/gpu/drm/i915/display/intel_display.c  |  37 ++-
 .../drm/i915/display/intel_display_device.h   |   1 +
 .../drm/i915/display/intel_display_types.h    |  15 +
 drivers/gpu/drm/i915/display/skl_scaler.c     |  90 +++++-
 drivers/gpu/drm/i915/display/skl_scaler.h     |   1 +
 drivers/gpu/drm/xe/Makefile                   |   1 +
 include/drm/drm_crtc.h                        |  17 ++
 15 files changed, 543 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf_regs.h

-- 
2.25.1

