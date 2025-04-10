Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6073FA849C9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 18:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BCCD10EA0B;
	Thu, 10 Apr 2025 16:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gy8KGxgg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B4110EA0B;
 Thu, 10 Apr 2025 16:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744302754; x=1775838754;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Wg0QhbU9tm2HSTDVnAmFJBazYlZTUnwhvDGx2Tz6FwU=;
 b=Gy8KGxggaZUxbe90enX98mgopNCyczloTUR65Pinl5tiRDkc9kAr2S3e
 K/j+uGeiy+1ppeEFJi7GqOOaDWWjgGPtKL7n/FVEv0r+4l6XBMTL/DtfJ
 WM7mM+Xbtdj/DrLOni6zu42xU98zZOzcbTJhuDs3UcXL7Z82rUuLLPMQF
 6mxQ54Oo5qI5ilOrNoJy8jinLqapJaIwJyzyx2loBU1TTiNqrRbm0+zmk
 2Iulkyd74DK8VM08Rm4K/ZEjz2LuJj2jYIyYgbshWnn0/YPDIvHLMeN+o
 cnlk2mkug8YY7hba+GZML5AXNExxdxFJ2FhQK9urm2zEGyAvPNRlc5ONJ g==;
X-CSE-ConnectionGUID: E0fE9L9aReu8zz2JVj0lpg==
X-CSE-MsgGUID: jiapAySYS4OoBiOUWLpRLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57219962"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="57219962"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 09:32:34 -0700
X-CSE-ConnectionGUID: DAZ+jMnZQNynEO+ct/S/2w==
X-CSE-MsgGUID: c21Su5wlSAii9eMvavp/hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="134128815"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 10 Apr 2025 09:32:19 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Apr 2025 19:32:18 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 00/19] drm: Eliminate redundant drm_format_info lookups
Date: Thu, 10 Apr 2025 19:31:59 +0300
Message-ID: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

I noticed a bunch of redundant (and rather expensive) drm_format_info
lookups in some traces recently. This series is an attempt to eliminate
them.

Ville Syrjälä (19):
  drm: Pass pixel_format+modifier to .get_format_info()
  drm: Pass pixel_format+modifier directly to drm_get_format_info()
  drm: Look up the format info earlier
  drm: Pass the format info to .fb_create()
  drm: Allow the caller to pass in the format info to
    drm_helper_mode_fill_fb_struct()
  drm/malidp: Pass along the format info from .fb_create()
    malidp_verify_afbc_framebuffer_size()
  drm/gem: Pass along the format info from .fb_create() to
    drm_helper_mode_fill_fb_struct()
  drm/gem/afbc: Eliminate redundant drm_get_format_info()
  drm/amdgpu: Pass along the format info from .fb_create() to
    drm_helper_mode_fill_fb_struct()
  drm/armada: Pass along the format info from .fb_create() to
    drm_helper_mode_fill_fb_struct()
  drm/exynos: Pass along the format info from .fb_create() to
    drm_helper_mode_fill_fb_struct()
  drm/gma500: Pass along the format info from .fb_create() to
    drm_helper_mode_fill_fb_struct()
  drm/i915: Pass along the format info from .fb_create() to
    drm_helper_mode_fill_fb_struct()
  drm/komeda: Pass along the format info from .fb_create() to
    drm_helper_mode_fill_fb_struct()
  drm/msm: Pass along the format info from .fb_create() to
    drm_helper_mode_fill_fb_struct()
  drm/tegra: Pass along the format info from .fb_create() to
    drm_helper_mode_fill_fb_struct()
  drm/virtio: Pass along the format info from .fb_create() to
    drm_helper_mode_fill_fb_struct()
  drm/vmwgfx: Pass along the format info from .fb_create() to
    drm_helper_mode_fill_fb_struct()
  drm: Make passing of format info to drm_helper_mode_fill_fb_struct()
    mandatory

 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  6 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.h   |  1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  4 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.h   |  2 +-
 .../arm/display/komeda/komeda_framebuffer.c   |  3 +-
 .../arm/display/komeda/komeda_framebuffer.h   |  1 +
 drivers/gpu/drm/arm/malidp_drv.c              | 12 +++---
 drivers/gpu/drm/armada/armada_fb.c            | 12 +++---
 drivers/gpu/drm/armada/armada_fb.h            |  4 +-
 drivers/gpu/drm/armada/armada_fbdev.c         |  5 ++-
 drivers/gpu/drm/drm_fourcc.c                  |  7 ++--
 drivers/gpu/drm/drm_framebuffer.c             | 27 ++++++-------
 drivers/gpu/drm/drm_gem_framebuffer_helper.c  | 38 ++++++++-----------
 drivers/gpu/drm/drm_modeset_helper.c          |  4 +-
 drivers/gpu/drm/exynos/exynos_drm_fb.c        |  7 ++--
 drivers/gpu/drm/exynos/exynos_drm_fb.h        |  1 +
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c     |  5 ++-
 drivers/gpu/drm/gma500/fbdev.c                |  5 ++-
 drivers/gpu/drm/gma500/framebuffer.c          | 14 ++++---
 drivers/gpu/drm/gma500/psb_drv.h              |  1 +
 drivers/gpu/drm/i915/display/intel_fb.c       | 18 +++++----
 drivers/gpu/drm/i915/display/intel_fb.h       |  5 ++-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c |  6 ++-
 .../drm/i915/display/intel_plane_initial.c    |  3 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  5 ++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  5 +--
 drivers/gpu/drm/msm/msm_drv.h                 |  3 +-
 drivers/gpu/drm/msm/msm_fb.c                  | 18 +++++----
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  9 +----
 drivers/gpu/drm/nouveau/nouveau_display.c     |  6 ++-
 drivers/gpu/drm/nouveau/nouveau_display.h     |  1 +
 drivers/gpu/drm/omapdrm/omap_fb.c             | 10 ++---
 drivers/gpu/drm/omapdrm/omap_fb.h             |  3 +-
 drivers/gpu/drm/qxl/qxl_display.c             |  3 +-
 drivers/gpu/drm/radeon/radeon_display.c       |  3 +-
 drivers/gpu/drm/radeon/radeon_fbdev.c         |  3 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |  3 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  |  3 +-
 .../gpu/drm/renesas/shmobile/shmob_drm_kms.c  |  3 +-
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c    | 11 ++----
 drivers/gpu/drm/tegra/drm.h                   |  2 +
 drivers/gpu/drm/tegra/fb.c                    |  7 ++--
 drivers/gpu/drm/tegra/fbdev.c                 |  4 +-
 drivers/gpu/drm/tests/drm_framebuffer_test.c  |  1 +
 drivers/gpu/drm/vc4/vc4_kms.c                 |  3 +-
 drivers/gpu/drm/virtio/virtgpu_display.c      |  6 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 15 +++++---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h           |  1 +
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c   |  6 ++-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  2 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c       |  3 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c             |  3 +-
 include/drm/drm_fourcc.h                      |  2 +-
 include/drm/drm_gem_framebuffer_helper.h      |  6 +++
 include/drm/drm_mode_config.h                 |  3 +-
 include/drm/drm_modeset_helper.h              |  2 +
 56 files changed, 207 insertions(+), 139 deletions(-)

-- 
2.49.0

