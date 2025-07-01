Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7CDAEF277
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 11:07:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A846210E542;
	Tue,  1 Jul 2025 09:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OW6gY3QN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320B010E426;
 Tue,  1 Jul 2025 09:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751360846; x=1782896846;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7IsDl6xI15SCVVYCG3Ahsj4Abb83DAIDkR7hyytCqXA=;
 b=OW6gY3QN7cb0Cresmh1dd6F5SaiXKPsvhOg0obvBF7KQeuG53fGYAGNV
 hKdRqQWo1mY4YX3onhuDgfne3//AarnDBjT/GpSeIO5ECE2mzAaQxOTcu
 J3AbgUHt9d/2fbVDKFAXBFU3lVVIWkqjK6mcCFmubw7HvTV2KOJ6Wg+ob
 /KPEPUqEVm+XgkAZNW2bUS2C/pkyUOinvlZ1rjH5dCe+KY1BVcZHVFnGG
 HrvaQP6nqHn4w89u8mCEuOYiNmXtKQQKn+wpvEox8YefijDONkBq/+UD6
 Dpo6Xel39ZSe1KYj5YTbGyFrBSgd83RKqQdZ3z/W3ZhVwhRJhpSv2yb/U A==;
X-CSE-ConnectionGUID: zkD37elcQQe/yrAGKuPQEA==
X-CSE-MsgGUID: tC+KcxHmRC+HnfGcrR571Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64218249"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="64218249"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 02:07:26 -0700
X-CSE-ConnectionGUID: nFBS+xQ/SYq9TQ9AqtKncw==
X-CSE-MsgGUID: eoNqW87aTR2v4MWLkMMDfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="159426839"
Received: from zzombora-mobl1.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.11])
 by orviesa005.jf.intel.com with SMTP; 01 Jul 2025 02:07:24 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Jul 2025 12:07:22 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH v2 00/19] drm: Eliminate redundant drm_format_info lookups
Date: Tue,  1 Jul 2025 12:07:03 +0300
Message-ID: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
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

v2: Rebase

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
 drivers/gpu/drm/drm_fourcc.c                  | 10 +++--
 drivers/gpu/drm/drm_framebuffer.c             | 27 ++++++------
 drivers/gpu/drm/drm_gem_framebuffer_helper.c  | 42 +++++++++----------
 drivers/gpu/drm/drm_modeset_helper.c          |  4 +-
 drivers/gpu/drm/exynos/exynos_drm_fb.c        |  7 ++--
 drivers/gpu/drm/exynos/exynos_drm_fb.h        |  1 +
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c     |  5 ++-
 drivers/gpu/drm/gma500/fbdev.c                |  5 ++-
 drivers/gpu/drm/gma500/framebuffer.c          | 14 ++++---
 drivers/gpu/drm/gma500/psb_drv.h              |  1 +
 drivers/gpu/drm/i915/display/intel_fb.c       | 20 +++++----
 drivers/gpu/drm/i915/display/intel_fb.h       |  5 ++-
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c |  6 ++-
 .../drm/i915/display/intel_plane_initial.c    |  3 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  5 ++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  5 +--
 drivers/gpu/drm/msm/msm_drv.h                 |  3 +-
 drivers/gpu/drm/msm/msm_fb.c                  | 18 ++++----
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  9 +---
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
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c    | 11 ++---
 drivers/gpu/drm/tegra/drm.h                   |  2 +
 drivers/gpu/drm/tegra/fb.c                    |  7 ++--
 drivers/gpu/drm/tegra/fbdev.c                 |  4 +-
 drivers/gpu/drm/tests/drm_framebuffer_test.c  |  1 +
 drivers/gpu/drm/vc4/vc4_kms.c                 |  3 +-
 drivers/gpu/drm/virtio/virtgpu_display.c      |  6 ++-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 15 ++++---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h           |  1 +
 drivers/gpu/drm/xe/display/intel_fbdev_fb.c   |  6 ++-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  2 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c       |  3 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c             |  3 +-
 include/drm/drm_fourcc.h                      |  3 +-
 include/drm/drm_gem_framebuffer_helper.h      |  6 +++
 include/drm/drm_mode_config.h                 |  3 +-
 include/drm/drm_modeset_helper.h              |  2 +
 56 files changed, 214 insertions(+), 142 deletions(-)

-- 
2.49.0

