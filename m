Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8F5A326C6
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 14:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A93A10E897;
	Wed, 12 Feb 2025 13:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EEHYkBP2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E83A10E897;
 Wed, 12 Feb 2025 13:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739366102; x=1770902102;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z8HaHNA/EvnZCI6bP3CQij/7XIITDrWKT0BQwesX79E=;
 b=EEHYkBP235GzEX5DcrajtlIaMeJNZD1314FJuesnazisvRtokZP3XCxQ
 CL43WV5AgbySAk85akXzr3Wg5JM84S2DJENYAIxsQJd2Z5wgUBRbihjsH
 IKTdvjUBIWWhEmYItLr7Ftm9sKl0i9YaG55BMLEnRfWl5gVEYyqi3fa3u
 5vsV7MkUwN8s4S0jnDmT091EQ7Vt2HAnlWO97A1n91JESGyYSHm2h45i8
 8C122puyHXo1/jEZvXR2uLg5HyEqyMjHF+MRb4efChi5NUShuTunQ0+U+
 Xv/E7fNke1ucLDvx2H3BhvqJDMt/WdT+SMP02CAWiTPxAo6tCauSA5R4B w==;
X-CSE-ConnectionGUID: da1eJv9xSjyeVO7i7mMGtQ==
X-CSE-MsgGUID: q6WHlSKiRw6EjdqYnWhpjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51451567"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51451567"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 05:15:02 -0800
X-CSE-ConnectionGUID: 7/momobnRYO4YDvSqOtH1g==
X-CSE-MsgGUID: RLc999q8RLmi4nw+IxUzKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="112767865"
Received: from carterle-desk.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.178])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 05:15:00 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, vinod.govindapillai@intel.com,
 ville.syrjala@intel.com, santhosh.reddy.guddati@intel.com,
 jani.saarinen@intel.com
Subject: [PATCH v7 5/7] drm/i915/xe3: avoid calling fbc activate if fbc is
 active
Date: Wed, 12 Feb 2025 15:14:18 +0200
Message-ID: <20250212131420.60026-6-vinod.govindapillai@intel.com>
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

If FBC is already active, we don't need to call FBC activate
routine again. This is more relevant in case of dirty rect
support in FBC. Xe doesn't support legacy fences. Hence fence
programming also not required as part of this fbc_hw_activate.
Any FBC related register updates done after enabling the dirty
rect support in xe3 will trigger nuke by FBC HW. So avoid
calling fbc activate routine again if the FBC is already active.

The front buffer rendering sequence will call intel_fbc_flush()
and which will call intel_fbc_nuke() or intel_fbc_activate()
based on FBC status explicitly and won't get impacted by this
change.

v2: use HAS_FBC_DIRTY_RECT()
    move this functionality within intel_fbc_activate()

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index df05904bac8a..951dc81b7b97 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -739,8 +739,19 @@ static void intel_fbc_nuke(struct intel_fbc *fbc)
 
 static void intel_fbc_activate(struct intel_fbc *fbc)
 {
+	struct intel_display *display = fbc->display;
+
 	lockdep_assert_held(&fbc->lock);
 
+	/*
+	 * When dirty rectangle is enabled, any updates to FBC registers will
+	 * trigger nuke. So avoid calling intel_fbc_activate if fbc is already
+	 * active and for XE3 cases. Xe doesn't support legacy fences. So
+	 * no need to update the fences as well.
+	 */
+	if (HAS_FBC_DIRTY_RECT(display) && fbc->active)
+		return;
+
 	intel_fbc_hw_activate(fbc);
 	intel_fbc_nuke(fbc);
 
-- 
2.43.0

