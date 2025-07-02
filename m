Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90599AF0F23
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AECB210E692;
	Wed,  2 Jul 2025 09:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XUotqYzX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE4D10E67F;
 Wed,  2 Jul 2025 09:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751447326; x=1782983326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ySOFyFpzhUQipwKICj37e+0iO3OnED32/IvQczxAn0E=;
 b=XUotqYzXpY9/WWnGWkP8VVTNgVjMA1FQmhHGVZbZf6mLyaVs8iMKrgEO
 emPb+LZw7K3jM+wFhJWmWdFr3k0pLBlquN7Ll0Ca9YKVohbOgVa2OBQ7N
 wiq+PBKVHNjcxQdMqHci412JBStKbnJzJmdPajUty5iniuohA7aquU2PV
 6i/vQ5pRLFsYGs8kFcCxXKnl+lP9vqjGb52q9SggcqURrV6AqaWHRRmPd
 290Z+D/v+sX1t1ACa+9fXHwYsvIVp5bbUNcaD7kxWuugVzudUxANfLy0T
 tU9wNYwB8IS4AKQBouE2Sf9l3rs0QIKkoV6wwYTuIvTmmzhh5E31VfrCF w==;
X-CSE-ConnectionGUID: 7FpfHGvHQfuiz1ln9p62Rw==
X-CSE-MsgGUID: m8EVsnDdT7KAQfZgQDCIMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64427209"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64427209"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:08:46 -0700
X-CSE-ConnectionGUID: LumL5iWFScq7YOrybEPR7A==
X-CSE-MsgGUID: IxUpl9sHTZelr0iTB1h/gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="159536693"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2025 02:08:42 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com
Subject: [v5 18/24] drm/i915/color: Add framework to program PRE/POST CSC LUT
Date: Wed,  2 Jul 2025 14:49:30 +0530
Message-ID: <20250702091936.3004854-19-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250702091936.3004854-1-uma.shankar@intel.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
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

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Add framework that will help in loading LUT to Pre/Post CSC color
blocks.

v2: Add dsb support

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c       | 16 ++++++++++++++++
 .../gpu/drm/i915/display/intel_display_types.h   |  2 +-
 drivers/gpu/drm/i915/display/intel_plane.c       |  4 ++++
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 25b992939e42..c7378af8fbdf 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -96,6 +96,10 @@ struct intel_color_funcs {
 	/* Plane CSC*/
 	void (*load_plane_csc_matrix)(struct intel_dsb *dsb,
 				      const struct intel_plane_state *plane_state);
+
+	/* Plane Pre/Post CSC */
+	void (*load_plane_luts)(struct intel_dsb *dsb,
+				const struct intel_plane_state *plane_state);
 };
 
 #define CTM_COEFF_SIGN	(1ULL << 63)
@@ -4091,11 +4095,23 @@ intel_color_load_plane_csc_matrix(struct intel_dsb *dsb,
 		display->funcs.color->load_plane_csc_matrix(dsb, plane_state);
 }
 
+static void
+intel_color_load_plane_luts(struct intel_dsb *dsb,
+			    const struct intel_plane_state *plane_state)
+{
+	struct intel_display *display = to_intel_display(plane_state);
+
+	if (display->funcs.color->load_plane_luts)
+		display->funcs.color->load_plane_luts(dsb, plane_state);
+}
+
 void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
 					const struct intel_plane_state *plane_state)
 {
 	if (plane_state->hw.ctm)
 		intel_color_load_plane_csc_matrix(dsb, plane_state);
+	if (plane_state->hw.degamma_lut || plane_state->hw.gamma_lut)
+		intel_color_load_plane_luts(dsb, plane_state);
 }
 
 struct intel_plane_colorop *intel_colorop_alloc(void)
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index c709df0cea9e..54b9680aa6f6 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -634,7 +634,7 @@ struct intel_plane_state {
 		enum drm_color_encoding color_encoding;
 		enum drm_color_range color_range;
 		enum drm_scaling_filter scaling_filter;
-		struct drm_property_blob *ctm;
+		struct drm_property_blob *ctm, *degamma_lut, *gamma_lut;
 	} hw;
 
 	struct i915_vma *ggtt_vma;
diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index cc8f3e15c82e..e6411fbfd613 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -387,6 +387,10 @@ intel_plane_colorop_replace_blob(struct intel_plane_state *plane_state,
 {
 	if (intel_colorop->id == CB_PLANE_CSC)
 		drm_property_replace_blob(&plane_state->hw.ctm, blob);
+	else if (intel_colorop->id == CB_PLANE_PRE_CSC_LUT)
+		drm_property_replace_blob(&plane_state->hw.degamma_lut, blob);
+	else if (intel_colorop->id == CB_PLANE_POST_CSC_LUT)
+		drm_property_replace_blob(&plane_state->hw.gamma_lut, blob);
 }
 
 static void
-- 
2.42.0

