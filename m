Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 923E0905D0C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 22:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1383310E8FC;
	Wed, 12 Jun 2024 20:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N+kQr+vu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBAB910E121;
 Wed, 12 Jun 2024 20:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718225237; x=1749761237;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AX8/vmrvVy5iiGq37QTBW4BhaAQsHZDEZtO502dghZo=;
 b=N+kQr+vu9zHZ+Ow4RkeqAS6nX8S2cQNvgzBeod1KWRu4manzVaTwANO1
 EPDJKaMbUZP+zEKMHpuRfpjNdroXLCXncLJOJ7NIGBk7mDnbg6XkmF0y1
 gQ56hJhvBnBoKiyP0LUqy0N7Bvv6HHPx6zfrSAQAl4H8ZN0NADVmx7v33
 yV8vXCQkGWgHA2noZSkOrDpnjwn0S7EFnQDNpeRskpvIcgk9jF4fTz79C
 SawjeChVebj/e9XZXPujP87oZN8IbljwWLRIAhvUMl2eo344puO5OF9HW
 tje9Vx7rIMFvpmsRhLOO6vg0glj/fKTU5Tdq3yYzDY9aO8bvz/a9iN19i w==;
X-CSE-ConnectionGUID: 3fUkJkC6RRiRs0xUq4aC0g==
X-CSE-MsgGUID: Yj8kG5zCTK6FTC9CoOcOfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14976499"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14976499"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 13:47:16 -0700
X-CSE-ConnectionGUID: zDZt2Q7ARPay2Si7tWz9Pw==
X-CSE-MsgGUID: 9ATVZrkvQrWjKRnZ4g5z+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="39863941"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 12 Jun 2024 13:47:13 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 12 Jun 2024 23:47:12 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/9] drm/i915: Polish plane surface alignment handling
Date: Wed, 12 Jun 2024 23:47:03 +0300
Message-ID: <20240612204712.31404-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
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

intel_surf_alignment() in particular has devolved into
a complete mess. Redesign the code so that we can handle
alignment restrictions in a nicer. Also adjust alignment
for TGL+ to actually match the hardware requirements.

v2: Drop the per-plane vma stuff as it was borked
    Don't temporarily remove the 2MiB DPT alignment for UV on TGL

Ville Syrjälä (9):
  drm: Rename drm_plane_check_pixel_format() to drm_plane_has_format()
  drm: Export drm_plane_has_format()
  drm/i915: Introduce the plane->min_alignment() vfunc
  drm/i915: Introduce fb->min_alignment
  drm/i915: Split cursor alignment to per-platform vfuncs
  drm/i915: Split pre-skl platforms out from intel_surf_alignment()
  drm/i915: Move intel_surf_alignment() into skl_univerals_plane.c
  drm/i915: Update plane alignment requirements for TGL+
  drm/i915: Nuke the TGL+ chroma plane tile row alignment stuff

 drivers/gpu/drm/drm_atomic.c                  |   7 +-
 drivers/gpu/drm/drm_crtc.c                    |   6 +-
 drivers/gpu/drm/drm_crtc_internal.h           |   2 -
 drivers/gpu/drm/drm_plane.c                   |  23 ++-
 drivers/gpu/drm/i915/display/i9xx_plane.c     |  75 ++++++++-
 drivers/gpu/drm/i915/display/intel_cursor.c   |  38 +++++
 .../drm/i915/display/intel_display_types.h    |   5 +
 drivers/gpu/drm/i915/display/intel_fb.c       | 151 ++++--------------
 drivers/gpu/drm/i915/display/intel_fb.h       |   3 -
 drivers/gpu/drm/i915/display/intel_fb_pin.c   |  39 +++--
 drivers/gpu/drm/i915/display/intel_fb_pin.h   |   3 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    |   5 +-
 drivers/gpu/drm/i915/display/intel_sprite.c   |  26 +++
 .../drm/i915/display/skl_universal_plane.c    |  85 +++++++++-
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   3 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   4 +-
 include/drm/drm_plane.h                       |   2 +
 17 files changed, 309 insertions(+), 168 deletions(-)

-- 
2.44.2

