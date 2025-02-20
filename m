Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66428A3D6FA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 11:42:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D2010E923;
	Thu, 20 Feb 2025 10:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GrH4cl+o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD34410E91F;
 Thu, 20 Feb 2025 10:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740048145; x=1771584145;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=biMKGB8Q3XhOzeDLaRUtxW6uxjpXXVziTWF2gU/tjz8=;
 b=GrH4cl+osPhE/qy7d3nowm1B4ly0yjHnEVfnslRIkqfSdv7eQFxxj3yy
 3RTV5LsgR97HBbXI4GzqbbfYe/Y9k0H4o8oJwiD+FNq56fh9gFibfJJNl
 U1fw+ykwl9zp0f/xvtVZUDDG3MrO6BjZx7scGfFPUi6onOdP5cnqZLoef
 0RJ2pN+/AHukn3RfSSPPrQm8Kf1JXDrSRodnpiM/wfSe7N31kTUu+5CsS
 NmpIafkiV/cNihMCRV0kzdXSAh/36kald3K0eeEG+V/pal6mSHMUZq7HA
 fr2na2uB4sEKoohe9NjdWcCokjLcY+3lQTPTepxIHsP413hfKLeyHvVkc A==;
X-CSE-ConnectionGUID: tO0L7hCKRX6OG0FKygNnmg==
X-CSE-MsgGUID: 2M95vMkVTQOjtmL00Ox5hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51804867"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="51804867"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 02:42:25 -0800
X-CSE-ConnectionGUID: EcF4jmMsQa6RYugytuMj2Q==
X-CSE-MsgGUID: PzpXFFeGRCSg9qGPdU09yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="119941902"
Received: from slindbla-desk.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.224])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 02:42:21 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, vinod.govindapillai@intel.com,
 ville.syrjala@linux.intel.com, santhosh.reddy.guddati@intel.com,
 jani.saarinen@intel.com
Subject: [PATCH v9 0/8] drm/i915/fbc: FBC Dirty rect feature support
Date: Thu, 20 Feb 2025 12:41:36 +0200
Message-ID: <20250220104144.207526-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Dirty rect support for FBC in xe3 onwards based on the comments after the
initial RFC series.

v2: Dirty rect related compute and storage moved to fbc state (Ville)

V3: Dont call fbc activate if FBC is already active

v4: Dirty rect compute and programming moved within DSB scope
    New changes are added as separate patches to make it easy for review
    But could be squashed if the reviews as ok.

v5: add HAS_FBC_DIRTY_RECT()
    FBC Damage area updates in 3 steps. 
    1. As part of plane_atomic_check() get, adjust coordinates and store
       the merged damage area in plane_state
    2. Atomic_commit, update merged damage are to fbc_state and prepare the
       damage area satifying all conditions
    3  update the FBC dirty rect registers as part of DSB commit.

v6: Use dmage_merged helper earlier to handle bigjoiner cases (Ville)
    Place the damage_merged handling code under HAS_FBC_DIRTY_RECT()
    Added a variable to check if the damage_merged received from
    the helper is valid. And if it is not valid, the FBC dirty rect
    is updated with full plane reqion.

v7: Reordering of the patches
    Updates to storage of damage to plane state as per comments from Ville
    Updates to dirty rect handling in FBC as per comments from Ville

v8: Patch subject and description updates
    Address to comments from Ville

v9: handle the first frame case. Once ack-ed could be squased in to the
    fbc dirty rect patch

Vinod Govindapillai (8):
  drm/damage-helper: add const qualifier in
    drm_atomic_helper_damage_merged()
  drm/i915/display: update and store the plane damage clips
  drm/i915/fbc: add register definitions for fbc dirty rect support
  drm/i915/fbc: introduce HAS_FBC_DIRTY_RECT() for FBC dirty rect
    support
  drm/i915/fbc: avoid calling fbc activate if fbc is active
  drm/i915/fbc: dirty rect support for FBC
  drm/i915/fbc: disable FBC if PSR2 selective fetch is enabled
  drm/i915/fbc: handle dirty rect coords for the first frame

 drivers/gpu/drm/drm_damage_helper.c           |   2 +-
 .../gpu/drm/i915/display/intel_atomic_plane.c |  32 ++++
 drivers/gpu/drm/i915/display/intel_display.c  |   3 +
 .../drm/i915/display/intel_display_device.h   |   1 +
 .../drm/i915/display/intel_display_types.h    |   2 +
 drivers/gpu/drm/i915/display/intel_fbc.c      | 157 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_fbc.h      |   5 +
 drivers/gpu/drm/i915/display/intel_fbc_regs.h |   9 +
 .../drm/i915/display/skl_universal_plane.c    |  46 ++++-
 include/drm/drm_damage_helper.h               |   2 +-
 10 files changed, 254 insertions(+), 5 deletions(-)

-- 
2.43.0

