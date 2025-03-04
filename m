Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E1AA4DAA1
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 11:33:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9FE10E569;
	Tue,  4 Mar 2025 10:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TjoOAbPY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9173710E55E;
 Tue,  4 Mar 2025 10:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741084410; x=1772620410;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ojiE97WKLCUdQFDxU2En/AcUEPGwQkNlV549p2jYp84=;
 b=TjoOAbPYDka58PgBnu3WtDTjkRH/S6N8V/9OLM7XO1gQqCJLlUZbfV2v
 EU1g0RG+tFSKB+01uKgQzQqQQ+BeyfujOJLPdj/MFKoRNs0iguzJ9fEpT
 dPgp58GNF1gJIzFPnrbqo6/hJvJbvUHuHRqcPv3eYuj5Vb7pjqcQeJt9+
 0mHmFjl3PCP/iD+tO8C4LnvCx9If2Pj6u2m8sSTQzkO0JegWjokj+ySAc
 L57/9vpvkX6OXUm6SoG24y4rIrq7hHF+6318dn/P2WNBrx2+U5W1ffwW8
 cblYG5zjYJ1D02sWGfoRt9EvQUnkJKKbtBpX+X6QKSaZSMj4lxCRcGVCV g==;
X-CSE-ConnectionGUID: HyMLihJYSt6vEJpkHfHqgA==
X-CSE-MsgGUID: ZI/iZZkERU+dW7BX09Lt1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="29584030"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="29584030"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 02:33:21 -0800
X-CSE-ConnectionGUID: 4ISFhChbRiKkoMp6abSmbQ==
X-CSE-MsgGUID: UzsEW6qhQEmIPiBoxAblpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="118063954"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa009.jf.intel.com with ESMTP; 04 Mar 2025 02:33:19 -0800
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 00/10]  Introduce drm sharpness property
Date: Tue,  4 Mar 2025 15:58:47 +0530
Message-Id: <20250304102857.326544-1-nemesa.garg@intel.com>
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
  drm/i915/display: Introduce HAS_CASF macro
  drm/i915/display: Add sharpness strength and winsize
  drm/i915/display: Add filter lut values
  drm/i915/display: Compute the scaler filter coefficients
  drm/i915/display: Add and compute scaler parameter
  drm/i915/display: Configure the second scaler for sharpness
  drm/i915/display: Call the compute function
  drm/i915/display: Enable/disable casf
  drm/i915/display: Expose casf property

 drivers/gpu/drm/drm_atomic_uapi.c             |   4 +
 drivers/gpu/drm/drm_crtc.c                    |  35 +++
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_casf.c     | 254 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_casf.h     |  23 ++
 .../gpu/drm/i915/display/intel_casf_regs.h    |  41 +++
 drivers/gpu/drm/i915/display/intel_crtc.c     |   3 +
 .../drm/i915/display/intel_crtc_state_dump.c  |   7 +
 drivers/gpu/drm/i915/display/intel_display.c  |  42 ++-
 .../drm/i915/display/intel_display_device.h   |   1 +
 .../drm/i915/display/intel_display_types.h    |  15 ++
 drivers/gpu/drm/i915/display/skl_scaler.c     | 107 +++++++-
 drivers/gpu/drm/i915/display/skl_scaler.h     |   1 +
 drivers/gpu/drm/xe/Makefile                   |   1 +
 include/drm/drm_crtc.h                        |  17 ++
 15 files changed, 537 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_casf_regs.h

-- 
2.25.1

