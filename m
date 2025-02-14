Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73442A36137
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 16:15:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D686610ECD7;
	Fri, 14 Feb 2025 15:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cx7airFR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6645610ECD7;
 Fri, 14 Feb 2025 15:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739546137; x=1771082137;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gCVJji8leIROlY7ozX7yTfhZGvFGHGdRzNucA3PHeZU=;
 b=Cx7airFR4HLbVO/ZUXSq8hxjkCsC5hTdMwVtuHti92V/2rkRDzoGs/hZ
 25Mhz9kOXqxeShQJteHau8h0eioblvg0fpdAMIw108rvnNZYSE7MIIiVo
 G2w4qjcGYhwqdxW3Q/4CBFW64m1R0z3U7lfFUa9Jmi0JkFpJIysRRcvP5
 BvuF1TE9JpB5LIj6eWwLBY35mU6COVoNxz8QIhLKrDTivaEoAo96JT2gS
 /q8dr53HMQSXOs3HiZPPNgiQbp0OSRkyq6p5GCorKCyyPM6my2gc/aOfh
 Y5BCANZXsmSdYvfPzwPdU//E/vf/f9VsmJQpBYssxzFQndPZ3P3hV1xfe g==;
X-CSE-ConnectionGUID: AXD1weCrQa2L2f8eJBTfOg==
X-CSE-MsgGUID: 04nLVsUrRFOCBkqgqU27rA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="50510827"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="50510827"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 07:15:37 -0800
X-CSE-ConnectionGUID: Cz42cxb8QCaBEM3n4jPtGg==
X-CSE-MsgGUID: l292TM9WTyeonx7raGiA+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="118413137"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa003.jf.intel.com with ESMTP; 14 Feb 2025 07:15:35 -0800
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 0/6]  Introduce drm sharpness property
Date: Fri, 14 Feb 2025 20:41:26 +0530
Message-Id: <20250214151132.1811682-1-nemesa.garg@intel.com>
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

Nemesa Garg (6):
  drm: Introduce sharpness strength property
  drm/i915/display: Compute the scaler filter coefficients
  drm/i915/display: Enable the second scaler
  drm/i915/display: Configure the second scaler for sharpness
  drm/i915/display: Add registers and compute the strength
  drm/i915/display: Load the lut values and enable sharpness

 drivers/gpu/drm/drm_atomic_uapi.c             |   4 +
 drivers/gpu/drm/drm_crtc.c                    |  35 +++
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_casf.c     | 272 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_casf.h     |  24 ++
 .../gpu/drm/i915/display/intel_casf_regs.h    |  41 +++
 drivers/gpu/drm/i915/display/intel_crtc.c     |   3 +
 .../drm/i915/display/intel_crtc_state_dump.c  |   5 +
 drivers/gpu/drm/i915/display/intel_display.c  |  44 ++-
 .../drm/i915/display/intel_display_device.h   |   1 +
 .../drm/i915/display/intel_display_types.h    |  16 ++
 drivers/gpu/drm/i915/display/intel_pfit.c     |   8 +
 drivers/gpu/drm/i915/display/skl_scaler.c     | 105 ++++++-
 drivers/gpu/drm/i915/display/skl_scaler.h     |   1 +
 drivers/gpu/drm/xe/Makefile                   |   1 +
 include/drm/drm_crtc.h                        |  17 ++
 16 files changed, 562 insertions(+), 16 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf_regs.h

-- 
2.25.1

