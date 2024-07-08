Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BF6929E00
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 10:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A28F10E259;
	Mon,  8 Jul 2024 08:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Azx+Wlai";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5871C10E276;
 Mon,  8 Jul 2024 08:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720426195; x=1751962195;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ge60fDLro5WtDb5LTiPwlAmINyVqkBElchJJjxUmpQg=;
 b=Azx+WlaiNzez7W/O/pivCnfmMcc1K+/Da0pf07Z56MKb6xi6aXtoJUJL
 0WdKxTV+bXtW9mgW8d0rgJSHeX4zdLV1tHX+/ePzTGWVEAGBKOsyuYCdx
 snO5s8De9b7aSqjb/cg6zgEg4FPAiephv6p/6YFmkC2aY4GwpCznQpKuq
 8gRm50KWc1SZoDxr0ld8+q1s5KDTMGLRI1PweJkPoGh1OoDCzgrJM8qJ9
 6SGE30VyTfbtA4nkhwc7Ybq45kwFFt3iSQDuEalI71z24LTdqkiFjy8HT
 NDuOiBZnsUM0TgjoZ4pIkpHw8zEU/coLA98Ekd9eVVz3APWTFSXRdgrxJ A==;
X-CSE-ConnectionGUID: Yz2dcxqdTFysJjo9JS5WGw==
X-CSE-MsgGUID: i6KpWWwyQ32KvzkfKo9dzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17821557"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="17821557"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 01:09:54 -0700
X-CSE-ConnectionGUID: giR9ig1yRKKk33LIYo5ILw==
X-CSE-MsgGUID: oBcM9cQFTDW9IK+sd2aNRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="52255766"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa003.jf.intel.com with ESMTP; 08 Jul 2024 01:09:53 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [0/5]  Introduce drm sharpening property
Date: Mon,  8 Jul 2024 13:39:12 +0530
Message-Id: <20240708080917.257857-1-nemesa.garg@intel.com>
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

--v3: Added uapi documentation.
      Made sharpness word consistent.

Nemesa Garg (5):
  drm: Introduce sharpness mode property
  drm/i915/display: Compute the scaler filter coefficients
  drm/i915/display: Enable the second scaler for sharpness
  drm/i915/display: Add registers and compute the strength
  drm/i915/display: Load the lut values and enable sharpness

 drivers/gpu/drm/drm_atomic_uapi.c             |   4 +
 drivers/gpu/drm/drm_crtc.c                    |  35 +++
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_crtc.c     |   3 +
 drivers/gpu/drm/i915/display/intel_display.c  |  21 +-
 .../drm/i915/display/intel_display_types.h    |  11 +
 .../drm/i915/display/intel_modeset_verify.c   |   1 +
 drivers/gpu/drm/i915/display/intel_panel.c    |   4 +-
 .../drm/i915/display/intel_sharpen_filter.c   | 236 ++++++++++++++++++
 .../drm/i915/display/intel_sharpen_filter.h   |  33 +++
 drivers/gpu/drm/i915/display/skl_scaler.c     |  97 ++++++-
 drivers/gpu/drm/i915/display/skl_scaler.h     |   1 +
 drivers/gpu/drm/i915/i915_reg.h               |  19 ++
 drivers/gpu/drm/xe/Makefile                   |   1 +
 include/drm/drm_crtc.h                        |  17 ++
 15 files changed, 470 insertions(+), 14 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_sharpen_filter.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_sharpen_filter.h

-- 
2.25.1

