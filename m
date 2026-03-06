Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJl3HH4Mq2nCZgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 18:18:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E3C225D5E
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 18:18:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D49610ED9D;
	Fri,  6 Mar 2026 17:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UOtP8leo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE6B110E3D3;
 Fri,  6 Mar 2026 17:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772817531; x=1804353531;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lCGAXW7M4qGFaTVwSbXzj3Pic5surf8iqngwPvi9Tac=;
 b=UOtP8leoDx9kWUli01Dxkx0pDB+qPjcrPJOE9QPN4Yd5FvFgUg4Rh76c
 OnjWekHcQyfiYkfgK/ruH6HrmzQHQDXBFEV3Sv8+efTSDFr/pyHTbSZse
 qjQrCzhcutMp17dZu57mTlVn3zRmwtBPHZVMHPs1dVOuIHeWbGD++MvNv
 bfOsXoonMT+qodmDeegxR+hJwm7PIeLvcAWD42rNiGUlBMJVf+UFTMcST
 kC7herrLOxiX3ZBB0bZKo8AgsUK3wbOQc62WeQVCWTyGpaGUasAUF0yPT
 2GOVedpruYyLB1kcZBmkdDYfvBj314NyATNC2VmCXzyGqCgC/QDciWnwM Q==;
X-CSE-ConnectionGUID: XEodvkEtQmud2fJwZX9yVw==
X-CSE-MsgGUID: s4TgimwgRBG4qYKoUtGs2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77530740"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="77530740"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 09:18:50 -0800
X-CSE-ConnectionGUID: LR0l6mVCSpaZKs2hd7n7Sg==
X-CSE-MsgGUID: V4p30hxBQdGjxxrat3O7fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="216175082"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa010.fm.intel.com with ESMTP; 06 Mar 2026 09:18:46 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: harry.wentland@amd.com, louis.chauvet@bootlin.com, mwen@igalia.com,
 contact@emersion.fr, alex.hung@amd.com, daniels@collabora.com,
 uma.shankar@intel.com, maarten.lankhorst@intel.com,
 pekka.paalanen@collabora.com, pranay.samala@intel.com,
 swati2.sharma@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH 03/10] drm/i915/color: Program fixed-function CSC on SDR planes
Date: Fri,  6 Mar 2026 22:23:00 +0530
Message-Id: <20260306165307.3233194-4-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260306165307.3233194-1-chaitanya.kumar.borah@intel.com>
References: <20260306165307.3233194-1-chaitanya.kumar.borah@intel.com>
MIME-Version: 1.0
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
X-Rspamd-Queue-Id: D4E3C225D5E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chaitanya.kumar.borah@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Program the fixed-function CSC block for SDR planes based on the
DRM_COLOROP_CSC_FF state.

Track the bypass state explicitly as a boolean in the plane hw state
since bypass is managed separately from the CSC_FF enum value in the
colorop framework.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  2 ++
 drivers/gpu/drm/i915/display/intel_plane.c    | 12 ++++++--
 .../drm/i915/display/skl_universal_plane.c    | 30 +++++++++++++++++++
 3 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index e189f8c39ccb..02b1cee18e4a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -679,6 +679,8 @@ struct intel_plane_state {
 		enum drm_color_range color_range;
 		enum drm_scaling_filter scaling_filter;
 		struct drm_property_blob *ctm, *degamma_lut, *gamma_lut, *lut_3d;
+		enum drm_colorop_csc_ff_type csc_ff_type; /* For SDR plane */
+		bool csc_ff_enable;
 	} hw;
 
 	struct i915_vma *ggtt_vma;
diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index e06a0618b4c6..c271a0ceb94e 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -378,11 +378,19 @@ intel_plane_color_copy_uapi_to_hw_state(struct intel_plane_state *plane_state,
 	while (iter_colorop) {
 		for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
 			if (new_colorop_state->colorop == iter_colorop) {
-				blob = new_colorop_state->bypass ? NULL : new_colorop_state->data;
 				intel_colorop = to_intel_colorop(colorop);
-				changed |= intel_plane_colorop_replace_blob(plane_state,
+				if (intel_colorop->id == INTEL_PLANE_CB_CSC_FF) {
+					plane_state->hw.csc_ff_enable =
+						!new_colorop_state->bypass;
+					plane_state->hw.csc_ff_type =
+						new_colorop_state->csc_ff_type;
+				} else {
+					blob = new_colorop_state->bypass ?
+						NULL : new_colorop_state->data;
+					changed |= intel_plane_colorop_replace_blob(plane_state,
 									    intel_colorop,
 									    blob);
+				}
 			}
 		}
 		iter_colorop = iter_colorop->next;
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 677f1339b7f8..3d96975f97ae 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -1239,6 +1239,32 @@ static u32 glk_plane_color_ctl_crtc(const struct intel_crtc_state *crtc_state)
 	return plane_color_ctl;
 }
 
+static u32 intel_csc_ff_type_to_csc_mode(enum drm_colorop_csc_ff_type csc_ff_type,
+					 bool enable)
+{
+	u32 csc_mode = PLANE_COLOR_CSC_MODE_BYPASS;
+
+	if (enable) {
+		switch (csc_ff_type) {
+		case DRM_COLOROP_CSC_FF_YUV601_RGB601:
+			csc_mode = PLANE_COLOR_CSC_MODE_YUV601_TO_RGB601;
+			break;
+		case DRM_COLOROP_CSC_FF_YUV709_RGB709:
+			csc_mode = PLANE_COLOR_CSC_MODE_YUV709_TO_RGB709;
+			break;
+		case DRM_COLOROP_CSC_FF_YUV2020_RGB2020:
+			csc_mode = PLANE_COLOR_CSC_MODE_YUV2020_TO_RGB2020;
+			break;
+		case DRM_COLOROP_CSC_FF_RGB709_RGB2020:
+			csc_mode = PLANE_COLOR_CSC_MODE_RGB709_TO_RGB2020;
+			break;
+		default:
+			csc_mode = PLANE_COLOR_CSC_MODE_BYPASS;
+		}
+	}
+	return csc_mode;
+}
+
 static u32 glk_plane_color_ctl(const struct intel_plane_state *plane_state)
 {
 	struct intel_display *display = to_intel_display(plane_state);
@@ -1270,6 +1296,10 @@ static u32 glk_plane_color_ctl(const struct intel_plane_state *plane_state)
 			plane_color_ctl |= PLANE_COLOR_YUV_RANGE_CORRECTION_DISABLE;
 	}
 
+	if (!icl_is_hdr_plane(display, plane->id))
+		plane_color_ctl |= intel_csc_ff_type_to_csc_mode(plane_state->hw.csc_ff_type,
+								plane_state->hw.csc_ff_enable);
+
 	if (plane_state->force_black)
 		plane_color_ctl |= PLANE_COLOR_PLANE_CSC_ENABLE;
 
-- 
2.25.1

