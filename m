Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8AEA326BB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 14:14:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A88410E889;
	Wed, 12 Feb 2025 13:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U/LRl2v6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D58710E887;
 Wed, 12 Feb 2025 13:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739366083; x=1770902083;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=czqMcmyfD4P8y1MDZPBdqfE+X27sS3HLWdNCGoTj9ho=;
 b=U/LRl2v62MMuKeinbJOKQaJEywFUQg37gnDpj3x50BnZimwuW6lMP1fG
 JAMJUNg2IjDQxFCQ1rX97T2HaLYWCZWM6X+vrjJjEMCCGf6rF9yQzzb3/
 B86zTH1AN/0sxuWbZCDlGJwTWztcXWNgmUbxxrZBISHSSTbzqJ1Mf05a7
 8sOiZGvL0C8iafe2uLz7Fm5Us7dedL7+yJ/nFb3gXIGq656rbkk79OERl
 8dteeuQ0xUUmc00W+0SAF55Ig3RBIJbTSVqdbnK2XhqyqdJR8D6KK0m+1
 cKdLYWcC2tt07PhVMWK0Q6xVWy4xJZC9F16n6KjlgNaz7TmNtF2SrCx7Q g==;
X-CSE-ConnectionGUID: 2PUzTbx/Q1emP1pPNyvhqg==
X-CSE-MsgGUID: QkaNK6wOTtG9APdxdGgXSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51451512"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51451512"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 05:14:42 -0800
X-CSE-ConnectionGUID: UIy2zp/uQ66k4r7Sely29g==
X-CSE-MsgGUID: mvR0PC8/Rw6QbCo7IzalBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="112767736"
Received: from carterle-desk.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.178])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 05:14:39 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, vinod.govindapillai@intel.com,
 ville.syrjala@intel.com, santhosh.reddy.guddati@intel.com,
 jani.saarinen@intel.com
Subject: [PATCH v7 0/7] drm/i915/fbc: FBC Dirty rect feature support
Date: Wed, 12 Feb 2025 15:14:13 +0200
Message-ID: <20250212131420.60026-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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


Vinod Govindapillai (7):
  drm/damage-helper: add const qualifier in
    drm_atomic_helper_damage_merged()
  drm/i915/xe3: update and store the plane damage clips
  drm/i915/xe3: add register definitions for fbc dirty rect support
  drm/i915/xe3: introduce HAS_FBC_DIRTY_RECT() for FBC dirty rect
    support
  drm/i915/xe3: avoid calling fbc activate if fbc is active
  drm/i915/xe3: dirty rect support for FBC
  drm/i915/xe3: disable FBC if PSR2 selective fetch is enabled

 drivers/gpu/drm/drm_damage_helper.c           |   2 +-
 .../gpu/drm/i915/display/intel_atomic_plane.c |  34 ++++++
 drivers/gpu/drm/i915/display/intel_display.c  |   3 +
 .../drm/i915/display/intel_display_device.h   |   1 +
 .../drm/i915/display/intel_display_types.h    |   2 +
 drivers/gpu/drm/i915/display/intel_fbc.c      | 109 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_fbc.h      |   5 +
 drivers/gpu/drm/i915/display/intel_fbc_regs.h |   9 ++
 .../drm/i915/display/skl_universal_plane.c    |  46 +++++++-
 include/drm/drm_damage_helper.h               |   2 +-
 10 files changed, 208 insertions(+), 5 deletions(-)

-- 
2.43.0

