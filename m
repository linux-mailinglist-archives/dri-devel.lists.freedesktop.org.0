Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 310D3A34051
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 14:26:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C6110EAAA;
	Thu, 13 Feb 2025 13:26:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ctWlLZPz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEFD10EA9C;
 Thu, 13 Feb 2025 13:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739453201; x=1770989201;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vgkaz8SQZSCMAvUiKVVsXSwIY5jOv13S2nsfhXRekgM=;
 b=ctWlLZPzCECiGTd4UkwSNrOFjBCVBIL0YbKoJhPJx+DShI8zttooDhvC
 xqkmShWsEJuXw8MWKtvJP2aMJ9E7xL9iYOVQReIi+RjbzDMyxKlkDCC+U
 t1ixNo7Ogg/oRruyEYXtDBpqPa1yzuJZGC/MVW61DPP5Q7V+U/FQHb3/V
 JPsNfF06L0sm9FSyhX+IZGfObhweqlqWExgxlmtBM+g1j7aH3SgYL7XAn
 bqMYSzmnTDkQvalY3tU9J5beXBgY7v8FYAWyl+98G6efyV8XMn+v1gVHs
 gxeh4VO06uFqyCeajSf8pXz73LrzoOnsXzL0raIkYsh633QGHC9E3GCFk Q==;
X-CSE-ConnectionGUID: qUxogK3/TT+aTsKM91Xgsg==
X-CSE-MsgGUID: T3A2hpSGThqLQ6PEfkeviA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40025386"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40025386"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 05:26:40 -0800
X-CSE-ConnectionGUID: U+wGAQ2tRCaTSMiCOALoaw==
X-CSE-MsgGUID: b07jkHRmSDejqELzsVP76A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="113014318"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.251])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 05:26:37 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, vinod.govindapillai@intel.com,
 ville.syrjala@intel.com, santhosh.reddy.guddati@intel.com,
 jani.saarinen@intel.com
Subject: [PATCH v8 5/7] drm/i915/fbc: avoid calling fbc activate if fbc is
 active
Date: Thu, 13 Feb 2025 15:25:56 +0200
Message-ID: <20250213132559.136815-6-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250213132559.136815-1-vinod.govindapillai@intel.com>
References: <20250213132559.136815-1-vinod.govindapillai@intel.com>
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

