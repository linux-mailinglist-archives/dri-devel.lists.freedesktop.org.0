Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67574A3D704
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 11:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7509410E934;
	Thu, 20 Feb 2025 10:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JS1CPQGx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2665810E931;
 Thu, 20 Feb 2025 10:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740048167; x=1771584167;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gNjvEm6MWSbU4HJ3n7t7qiqfjf22D9eN9bT6xoPomwQ=;
 b=JS1CPQGxQKtkLpHQUkfe9XCmCkAZOoftlAYWu0bVQCm46As7m0riAh8u
 XSyBzyqGEtK1qhyYwxl7D3kP9/h06ZL3meynSjyRVjElQSnsSGPtdpVcg
 Z9jlj0zi6Cpe9lPv3A0MwpRgcsRAOpHOuutz1Upu2aj8dXI892ouuflRl
 6ymbi+q8Ajz5tIPq/kmtTSe6KchEEdLjV0N3aD7g7dqNHfKruC5ZMPx6E
 FwCWND6MZGzx6Hj57YgqWGSij1ERPJz9U7JMnUO5+5H+kY0m8034+CvPX
 WZmDgNgSEgopewj1rBHyYJUvjP2jtm3iho8w1i4UzahPYOI9Lbf8o7q7o w==;
X-CSE-ConnectionGUID: VXoeXATRQ0iWDGIU7PA4Mg==
X-CSE-MsgGUID: FbP4IgKlSQeBywLiNyuvNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51804880"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="51804880"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 02:42:47 -0800
X-CSE-ConnectionGUID: cJw6mhJUQK+b0S2J34JTLw==
X-CSE-MsgGUID: sMpiuOVAQUC8pgzGNUYq6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="119941947"
Received: from slindbla-desk.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.224])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 02:42:43 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, vinod.govindapillai@intel.com,
 ville.syrjala@linux.intel.com, santhosh.reddy.guddati@intel.com,
 jani.saarinen@intel.com
Subject: [PATCH v9 5/8] drm/i915/fbc: avoid calling fbc activate if fbc is
 active
Date: Thu, 20 Feb 2025 12:41:41 +0200
Message-ID: <20250220104144.207526-6-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250220104144.207526-1-vinod.govindapillai@intel.com>
References: <20250220104144.207526-1-vinod.govindapillai@intel.com>
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

If FBC is already active, we don't need to call FBC activate
routine again unless there are changes to the fences. So skip
this on all platforms that don't have fences. Any FBC register
updates done after enabling the dirty rect support in xe3 will
trigger nuke by FBC which is counter productive to the fbc
dirty rect feature.

The front buffer rendering sequence will call intel_fbc_flush()
and which will call intel_fbc_nuke() or intel_fbc_activate()
based on FBC status explicitly and won't get impacted by this
change.

v2: use HAS_FBC_DIRTY_RECT()
    move this functionality within intel_fbc_activate()

v3: update to intel_fbc_activate logic (Ville)
    update to the patch description

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbc.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index df05904bac8a..d2917e017e7b 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -739,8 +739,19 @@ static void intel_fbc_nuke(struct intel_fbc *fbc)
 
 static void intel_fbc_activate(struct intel_fbc *fbc)
 {
+	struct intel_display *display = fbc->display;
+
 	lockdep_assert_held(&fbc->lock);
 
+	/* only the fence can change for a flip nuke */
+	if (fbc->active && !intel_fbc_has_fences(display))
+		return;
+	/*
+	 * In case of FBC dirt rect, any updates to the FBC registers will
+	 * trigger the nuke.
+	 */
+	drm_WARN_ON(display->drm, fbc->active && HAS_FBC_DIRTY_RECT(display));
+
 	intel_fbc_hw_activate(fbc);
 	intel_fbc_nuke(fbc);
 
-- 
2.43.0

