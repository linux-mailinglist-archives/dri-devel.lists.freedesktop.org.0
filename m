Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6C2A326CC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 14:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72AA210E89A;
	Wed, 12 Feb 2025 13:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M3LSgqPS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B3510E894;
 Wed, 12 Feb 2025 13:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739366110; x=1770902110;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=epvBaMwS+n7+h0pTkNBQWTF0M0xKSlEK3eNhXXCXc2A=;
 b=M3LSgqPSlSdYsWoyAmnfYQfnfwvWDKhDqmNrKsoAT7RwbswQgo6PolWC
 rCtODYoH7lkJNz0wzAhcC7O+vhzDjKKbXfMV5OqCBYtgt0lV0FvshRct0
 cqOm17NV2qkIdTLxdAjNlPQYrI1hlIJaOSYC6Qff/PvkIG2BsPd0joMb/
 M/yhzUXGdmieykK8aknFvUFg6uoj2ROhhqwQR3XtqEBsC4zcTdKl/yI9a
 kVIsQ+Ngdj9IVwdJOTjaJG+qWzrpURSPNuVSBw5QcOc9OE+FP1SZMmJk2
 sAD5UmbKXphfTEcG3ekiacBD0s6G/qOVfINayElomM+zdSg6wou2FhCKC g==;
X-CSE-ConnectionGUID: pXWUnizLQtm05p/xTOCWig==
X-CSE-MsgGUID: xsIGbieESm64K225h6CxVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51451582"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51451582"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 05:15:09 -0800
X-CSE-ConnectionGUID: 76y6UMFqRgigoh2tiXIv7Q==
X-CSE-MsgGUID: mN25ZK0qRCCkoWpRy9xeNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="112767929"
Received: from carterle-desk.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.178])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 05:15:07 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, vinod.govindapillai@intel.com,
 ville.syrjala@intel.com, santhosh.reddy.guddati@intel.com,
 jani.saarinen@intel.com
Subject: [PATCH v7 7/7] drm/i915/xe3: disable FBC if PSR2 selective fetch is
 enabled
Date: Wed, 12 Feb 2025 15:14:20 +0200
Message-ID: <20250212131420.60026-8-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250212131420.60026-1-vinod.govindapillai@intel.com>
References: <20250212131420.60026-1-vinod.govindapillai@intel.com>
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

It is not recommended to have both FBC dirty rect and PSR2
selective fetch be enabled at the same time. If PSR2 selective
fetch or panel replay is on, mark FBC as not possible.

v2: fix the condition to disable FBC if PSR2 enabled (Jani)

v3: use HAS_FBC_DIRTY_RECT()

Bspec: 68881
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 8c92953b53f5..ac70955444ea 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -1438,9 +1438,14 @@ static int intel_fbc_check_plane(struct intel_atomic_state *state,
 	 * Display 12+ is not supporting FBC with PSR2.
 	 * Recommendation is to keep this combination disabled
 	 * Bspec: 50422 HSD: 14010260002
+	 *
+	 * In Xe3, PSR2 selective fetch and FBC dirty rect feature cannot
+	 * coexist. So if PSR2 selective fetch is supported then mark that
+	 * FBC is not supported.
+	 * TODO: Need a logic to decide between PSR2 and FBC Dirty rect
 	 */
-	if (IS_DISPLAY_VER(display, 12, 14) && crtc_state->has_sel_update &&
-	    !crtc_state->has_panel_replay) {
+	if ((IS_DISPLAY_VER(display, 12, 14) || HAS_FBC_DIRTY_RECT(display)) &&
+	    crtc_state->has_sel_update && !crtc_state->has_panel_replay) {
 		plane_state->no_fbc_reason = "PSR2 enabled";
 		return 0;
 	}
-- 
2.43.0

