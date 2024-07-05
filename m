Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B17928483
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 11:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4275D10E238;
	Fri,  5 Jul 2024 09:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fhQQGvzG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8CB10E22E;
 Fri,  5 Jul 2024 09:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720170229; x=1751706229;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dU2zPazzjTGN9qLgg8zEiNhIsxktDn8YpckDFP1UUB0=;
 b=fhQQGvzGZKHQPE8mWkthqhqufuDYiUVPOVF5+FLLlc6mZlEAImwG7mhg
 QzoIiBHZmjv5h+uXdvjfE9uOgZpwsJqABJITG1KkL4+rwDyxZBRaoEH+W
 Vk54LHIkSgdTA9C1wecJ3EfjtD3t06J8M+KgREFw8z8YYBOGRkzTQWA1d
 cdCC+jjFy6k9gW7W9PEbsZYZp+hTPkKUc26va/pvC+H8pnr154Gpl+yZX
 +y/Qyatt+rCa0TxygqUp3J3mdcUSfP4KIueptbsxoBU0SAJPtcb6/eWGq
 84tOngh1djp8i8HWqNTQ3vqIEyxmf0SgzEyWH261L3HaGvOMFHVqPu+sX w==;
X-CSE-ConnectionGUID: Aj/6Zll5QxSC4j27MKoXzA==
X-CSE-MsgGUID: zYptAqK7RMyjB9FdJEjLGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17324179"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; d="scan'208";a="17324179"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 02:03:48 -0700
X-CSE-ConnectionGUID: u9bSuSXFT0ycOIsvJZ2Axw==
X-CSE-MsgGUID: IHZeozTcRWGPKzhKlAG98w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; d="scan'208";a="51676128"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa003.jf.intel.com with ESMTP; 05 Jul 2024 02:03:47 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH 0/5]  Introduce drm sharpening property
Date: Fri,  5 Jul 2024 14:32:00 +0530
Message-Id: <20240705090205.72302-1-nemesa.garg@intel.com>
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

