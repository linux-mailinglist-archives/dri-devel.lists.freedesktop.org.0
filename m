Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E95854844
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 12:27:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796FD10E22B;
	Wed, 14 Feb 2024 11:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cQah1lxq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9E010E226;
 Wed, 14 Feb 2024 11:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707910068; x=1739446068;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o4KzElueeiq4yz1b+6Q9X1xk1rhBxSoSIUAg6/V4x7I=;
 b=cQah1lxqGR+o/+g9Z4m9boebbBFZFGJXcXpLUDeBVc9pqVN7GTvFoHP9
 wsoncaY4rloZTgaipIVDauVOAjE4MtIEaEUyjOBZVOxyZHsrPXfZgESz4
 4fFKU1q7A3X9/PxFxCPM4+MMAA6o5bClXfzi2PzVa9SMunQQbKXP5N1lN
 WzegKaWOhZAV4MTkAOTUf3QC9sMGpmWL/2a7vPhWq24VeXf/K1iTIFgkT
 naLTlVS3A4G5Xl3FyvB/snCZ5ikeHItnINfbiQza3gegS6/bB3UNKAVpQ
 JRFkYcGlGmmfqLroIgAVrzjJJj5iCc4w+aXF9JFxXnZm6EVK+Fqeij6My g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1826918"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="1826918"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 03:27:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="7827961"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa003.jf.intel.com with ESMTP; 14 Feb 2024 03:27:47 -0800
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [RFC 0/5]  Introduce drm sharpening property
Date: Wed, 14 Feb 2024 16:54:52 +0530
Message-Id: <20240214112457.3734871-1-nemesa.garg@intel.com>
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
  drm: Introduce sharpeness mode property
  drm/i915/display/: Compute the scaler filter coefficients
  drm/i915/dispaly/: Enable the second scaler
  drm/i915/display/: Add registers and compute the strength
  drm/i915/display: Load the lut values and enable sharpness

 drivers/gpu/drm/drm_atomic_uapi.c             |   4 +
 drivers/gpu/drm/drm_crtc.c                    |  17 ++
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_crtc.c     |   3 +
 drivers/gpu/drm/i915/display/intel_display.c  |  20 +-
 .../drm/i915/display/intel_display_types.h    |  11 +
 .../drm/i915/display/intel_modeset_verify.c   |   1 +
 .../drm/i915/display/intel_sharpen_filter.c   | 214 ++++++++++++++++++
 .../drm/i915/display/intel_sharpen_filter.h   |  31 +++
 drivers/gpu/drm/i915/display/skl_scaler.c     |  86 ++++++-
 drivers/gpu/drm/i915/display/skl_scaler.h     |   1 +
 drivers/gpu/drm/i915/i915_reg.h               |  19 ++
 drivers/gpu/drm/xe/Makefile                   |   1 +
 include/drm/drm_crtc.h                        |  17 ++
 14 files changed, 416 insertions(+), 10 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_sharpen_filter.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_sharpen_filter.h

-- 
2.25.1

