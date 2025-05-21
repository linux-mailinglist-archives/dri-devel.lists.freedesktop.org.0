Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34341ABF367
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 13:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EB9112E60;
	Wed, 21 May 2025 11:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nLMoWGcq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FCD112E64;
 Wed, 21 May 2025 11:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747828431; x=1779364431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iDxAY40fZG0hlx2yCC15l+Na+ZJjf1gGJMCSSGjMoLo=;
 b=nLMoWGcqk2mUKxAiwK9rt3oyRXmCcfavY4dzzq2Atvx95WFe9FwWZsJ2
 eCmdja4OhVEsuU3A+AWFAGw68C0dtGlsXqhBVMBvI+srMxYs+4YiZb5nJ
 f3A3GOYswyal5OGkxlRY1RVMo5SO4yjqzR6985HooCcHzad6QR+wWi1T2
 bitv9nJnbZvoKPO/ijV/L4ZzbDXwr5jB0+LLh0kEYcuxpXq+kUOAixsDU
 dB6BBgZf2xgC3eZ5zS94bXOQmSZtddF0YuDUW+lBygLVA+/8xV8Z+lNI8
 O8E5e+OOdWndWHlnyQ2tFjrDTmOy9AtEjRKNSAGFjO7lX3kOTtQjQiwG6 g==;
X-CSE-ConnectionGUID: u7FuCMJITrS4ac78DEZLAg==
X-CSE-MsgGUID: 7ceRhyATQtiSqhtnqmjMNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="67217809"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="67217809"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 04:53:51 -0700
X-CSE-ConnectionGUID: wcwPJYY2TgC7lmOPwex6+g==
X-CSE-MsgGUID: jnBd+3k3SYOrL3KqAuWp0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="140452896"
Received: from abityuts-desk.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.119])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 04:53:49 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH v4 06/12] drm/i915/psr: Add interface to check if AUXLess ALPM
 is needed by PSR
Date: Wed, 21 May 2025 14:53:13 +0300
Message-ID: <20250521115319.2380655-7-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521115319.2380655-1-jouni.hogander@intel.com>
References: <20250521115319.2380655-1-jouni.hogander@intel.com>
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

Currently we spread ugly PSR details into ALPM code to check if AUXLess
ALPM is needed. Prepare to hide these details to PSR code by adding new
interface for checking if AUXLess ALPM is needed.

v2: remove kerneldoc comment

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 6 ++++++
 drivers/gpu/drm/i915/display/intel_psr.h | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 1072549649cd..38535e0d2496 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -4246,3 +4246,9 @@ bool intel_psr_needs_alpm(struct intel_dp *intel_dp, const struct intel_crtc_sta
 	return intel_dp_is_edp(intel_dp) && (crtc_state->has_sel_update ||
 					     crtc_state->has_panel_replay);
 }
+
+bool intel_psr_needs_alpm_aux_less(struct intel_dp *intel_dp,
+				   const struct intel_crtc_state *crtc_state)
+{
+	return intel_dp_is_edp(intel_dp) && crtc_state->has_panel_replay;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_psr.h b/drivers/gpu/drm/i915/display/intel_psr.h
index 73c3fa40844b..0cf53184f13f 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.h
+++ b/drivers/gpu/drm/i915/display/intel_psr.h
@@ -77,5 +77,7 @@ int intel_psr_min_vblank_delay(const struct intel_crtc_state *crtc_state);
 void intel_psr_connector_debugfs_add(struct intel_connector *connector);
 void intel_psr_debugfs_register(struct intel_display *display);
 bool intel_psr_needs_alpm(struct intel_dp *intel_dp, const struct intel_crtc_state *crtc_state);
+bool intel_psr_needs_alpm_aux_less(struct intel_dp *intel_dp,
+				   const struct intel_crtc_state *crtc_state);
 
 #endif /* __INTEL_PSR_H__ */
-- 
2.43.0

