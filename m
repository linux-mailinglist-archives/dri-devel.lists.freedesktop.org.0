Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E66EA49564
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 10:38:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CFD10EC4C;
	Fri, 28 Feb 2025 09:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iT3xxYLW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8486310EC49;
 Fri, 28 Feb 2025 09:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740735526; x=1772271526;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q/WLPl+7tZ9syP7+8hW8I4ho5QoP0emXFl/HyJuN2bk=;
 b=iT3xxYLWu+iVO/q9Spb5ZXSr2Wtea2Fj6gSXxizvi6RlEbM7OMUbMXpg
 k+f+fM+3XK4pxPymFwyODyxv8hsjzjp/5elrjQbGYLI3NSAgWUO5BSl1e
 yNCbsgekrkyh1OHQT85s9U+syNiwgDDkBP03oOhErnyF3gmGsv4GyUxSr
 58lH0Bs6niabGnPvqx5YfUuxSD7N9hG7Ed28BIMUU0CgQ8pOKMeN1vAVb
 pCs/wZPxYMavhKZXC9G1O5X2/tN/utzeu5I+MQhbXqIPYTYLF4INMb099
 r4rf1YnRc+o+sM3IRcAXS5DH9c20aOr3RDPP3VQf8Cm6xWHLFZZas0Jza Q==;
X-CSE-ConnectionGUID: VWd1oib8SluWdSLB2fuWZA==
X-CSE-MsgGUID: UP9Mw1e5T4OJJXQmBLEn1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="52293095"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="52293095"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 01:38:45 -0800
X-CSE-ConnectionGUID: KQKEru1qS4WxLr53RWlxGg==
X-CSE-MsgGUID: Gq5IK2D1SFGCOfV5YjtLEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="154466562"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.23])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 01:38:43 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, vinod.govindapillai@intel.com,
 jani.nikula@intel.com, jani.saarinen@intel.com
Subject: [PATCH v10 6/9] drm/i915/fbc: avoid calling fbc activate if fbc is
 active
Date: Fri, 28 Feb 2025 11:37:59 +0200
Message-ID: <20250228093802.27091-7-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250228093802.27091-1-vinod.govindapillai@intel.com>
References: <20250228093802.27091-1-vinod.govindapillai@intel.com>
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
index 33142427f121..ca44cec73fd2 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -734,8 +734,19 @@ static void intel_fbc_nuke(struct intel_fbc *fbc)
 
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

