Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F28B07CBE
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 20:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C18210E3B6;
	Wed, 16 Jul 2025 18:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dJBD2xB3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA6510E3AA;
 Wed, 16 Jul 2025 18:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752690171; x=1784226171;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FHDwoXafW2EHGJky29nxGlUi8daOrDnkIt8lu7jdgoc=;
 b=dJBD2xB3uENG1DZJ2RZmBwO7iVELZklVBzsFkXnsxBUjkiMw3/Ci4KgT
 1a5MZ4vfpjJNW/ikf95vp1UL9iWb6/svqwQO4Hheim3q5jKVaX/daJExG
 vP7eC2I2feEaYGBotTPMjBBQKWG0yHMDeAK3Zeivla47N3EF94fwqs+9u
 Lk61RO8hUHCORWUEHceaDYiZt/84sjn1PByl9oQdr+t1g3/gwlalCmmf/
 VJvNQYk7T0jizY6HRvh/BYSJIUGL1cM8Rp+qRUWy45TyN9JlNtY8LWcaT
 9nAn0iCHIyGbgfG/RUvxF7wEM2sY+tgfTIcYNlO+IvpgWkQpdqGrN47Qx Q==;
X-CSE-ConnectionGUID: WQOhEih+SVSqyKyAopLZBw==
X-CSE-MsgGUID: sNDRFZ7ASD6h29o/yaVKeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58759286"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="58759286"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 11:22:50 -0700
X-CSE-ConnectionGUID: lKTtxHxVS9+OX48Sx0Cs/w==
X-CSE-MsgGUID: LGGLF8mxSieWdVNkz85fOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="163206469"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.254])
 by orviesa005.jf.intel.com with SMTP; 16 Jul 2025 11:22:48 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 16 Jul 2025 21:22:47 +0300
Date: Wed, 16 Jul 2025 21:22:47 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 00/19] drm: Eliminate redundant drm_format_info lookups
Message-ID: <aHft9-ilZiBE8JhI@intel.com>
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
X-Patchwork-Hint: comment
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

On Tue, Jul 01, 2025 at 12:07:03PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> I noticed a bunch of redundant (and rather expensive) drm_format_info
> lookups in some traces recently. This series is an attempt to eliminate
> them.
> 
> v2: Rebase
> 
> Ville Syrjälä (19):
>   drm: Pass pixel_format+modifier to .get_format_info()
>   drm: Pass pixel_format+modifier directly to drm_get_format_info()
>   drm: Look up the format info earlier
>   drm: Pass the format info to .fb_create()
>   drm: Allow the caller to pass in the format info to
>     drm_helper_mode_fill_fb_struct()
>   drm/malidp: Pass along the format info from .fb_create()
>     malidp_verify_afbc_framebuffer_size()
>   drm/gem: Pass along the format info from .fb_create() to
>     drm_helper_mode_fill_fb_struct()
>   drm/gem/afbc: Eliminate redundant drm_get_format_info()
>   drm/amdgpu: Pass along the format info from .fb_create() to
>     drm_helper_mode_fill_fb_struct()
>   drm/armada: Pass along the format info from .fb_create() to
>     drm_helper_mode_fill_fb_struct()
>   drm/exynos: Pass along the format info from .fb_create() to
>     drm_helper_mode_fill_fb_struct()
>   drm/gma500: Pass along the format info from .fb_create() to
>     drm_helper_mode_fill_fb_struct()
>   drm/i915: Pass along the format info from .fb_create() to
>     drm_helper_mode_fill_fb_struct()
>   drm/komeda: Pass along the format info from .fb_create() to
>     drm_helper_mode_fill_fb_struct()
>   drm/msm: Pass along the format info from .fb_create() to
>     drm_helper_mode_fill_fb_struct()
>   drm/tegra: Pass along the format info from .fb_create() to
>     drm_helper_mode_fill_fb_struct()
>   drm/virtio: Pass along the format info from .fb_create() to
>     drm_helper_mode_fill_fb_struct()
>   drm/vmwgfx: Pass along the format info from .fb_create() to
>     drm_helper_mode_fill_fb_struct()
>   drm: Make passing of format info to drm_helper_mode_fill_fb_struct()
>     mandatory

Pushed to drm-misc-next. Thanks for the reviews and acks.

> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  6 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.h   |  1 +
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  4 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_plane.h   |  2 +-
>  .../arm/display/komeda/komeda_framebuffer.c   |  3 +-
>  .../arm/display/komeda/komeda_framebuffer.h   |  1 +
>  drivers/gpu/drm/arm/malidp_drv.c              | 12 +++---
>  drivers/gpu/drm/armada/armada_fb.c            | 12 +++---
>  drivers/gpu/drm/armada/armada_fb.h            |  4 +-
>  drivers/gpu/drm/armada/armada_fbdev.c         |  5 ++-
>  drivers/gpu/drm/drm_fourcc.c                  | 10 +++--
>  drivers/gpu/drm/drm_framebuffer.c             | 27 ++++++------
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c  | 42 +++++++++----------
>  drivers/gpu/drm/drm_modeset_helper.c          |  4 +-
>  drivers/gpu/drm/exynos/exynos_drm_fb.c        |  7 ++--
>  drivers/gpu/drm/exynos/exynos_drm_fb.h        |  1 +
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c     |  5 ++-
>  drivers/gpu/drm/gma500/fbdev.c                |  5 ++-
>  drivers/gpu/drm/gma500/framebuffer.c          | 14 ++++---
>  drivers/gpu/drm/gma500/psb_drv.h              |  1 +
>  drivers/gpu/drm/i915/display/intel_fb.c       | 20 +++++----
>  drivers/gpu/drm/i915/display/intel_fb.h       |  5 ++-
>  drivers/gpu/drm/i915/display/intel_fbdev_fb.c |  6 ++-
>  .../drm/i915/display/intel_plane_initial.c    |  3 +-
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  5 ++-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  5 +--
>  drivers/gpu/drm/msm/msm_drv.h                 |  3 +-
>  drivers/gpu/drm/msm/msm_fb.c                  | 18 ++++----
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  9 +---
>  drivers/gpu/drm/nouveau/nouveau_display.c     |  6 ++-
>  drivers/gpu/drm/nouveau/nouveau_display.h     |  1 +
>  drivers/gpu/drm/omapdrm/omap_fb.c             | 10 ++---
>  drivers/gpu/drm/omapdrm/omap_fb.h             |  3 +-
>  drivers/gpu/drm/qxl/qxl_display.c             |  3 +-
>  drivers/gpu/drm/radeon/radeon_display.c       |  3 +-
>  drivers/gpu/drm/radeon/radeon_fbdev.c         |  3 +-
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |  3 +-
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  |  3 +-
>  .../gpu/drm/renesas/shmobile/shmob_drm_kms.c  |  3 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_fb.c    | 11 ++---
>  drivers/gpu/drm/tegra/drm.h                   |  2 +
>  drivers/gpu/drm/tegra/fb.c                    |  7 ++--
>  drivers/gpu/drm/tegra/fbdev.c                 |  4 +-
>  drivers/gpu/drm/tests/drm_framebuffer_test.c  |  1 +
>  drivers/gpu/drm/vc4/vc4_kms.c                 |  3 +-
>  drivers/gpu/drm/virtio/virtgpu_display.c      |  6 ++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 15 ++++---
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h           |  1 +
>  drivers/gpu/drm/xe/display/intel_fbdev_fb.c   |  6 ++-
>  drivers/gpu/drm/xe/display/xe_plane_initial.c |  2 +-
>  drivers/gpu/drm/xen/xen_drm_front_kms.c       |  3 +-
>  drivers/gpu/drm/xlnx/zynqmp_kms.c             |  3 +-
>  include/drm/drm_fourcc.h                      |  3 +-
>  include/drm/drm_gem_framebuffer_helper.h      |  6 +++
>  include/drm/drm_mode_config.h                 |  3 +-
>  include/drm/drm_modeset_helper.h              |  2 +
>  56 files changed, 214 insertions(+), 142 deletions(-)
> 
> -- 
> 2.49.0

-- 
Ville Syrjälä
Intel
