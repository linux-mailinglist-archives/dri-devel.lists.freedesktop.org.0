Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD77AF0F15
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC4910E68B;
	Wed,  2 Jul 2025 09:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mUmP52aL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3167210E668;
 Wed,  2 Jul 2025 09:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751447303; x=1782983303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=atvjfh29FvoRURe37UCeqGEzIFvStcVFeITG8BYb8Bg=;
 b=mUmP52aLFGlDnhuq9415g0Oro5a3im60XMfRhMUsAh9WNvU586zMePRs
 B2+H64200gScWUd3ajXu1VWZZNhvNsN20RY/V1JyMFLg30MPslu7qC42P
 pppipwpAVVxxcyMFkNOnZfs7fvUz/7AHU6cFWUAj2rua/GMFS+E5EBol9
 ts99A8Q/xrnmiAttdSr34Q7BV9zOnhednxSXhhJtY70VMJH5ktZI58NVV
 IbTqPlfZ19CfqXPZxn19EjWNyaZB38BK2LGRBKQ/qjNeXkwA54UikY73o
 IayBjr4lM3UdHl9OG8mOoRXfQ3XlJ6SPzxLZ5Yj1t+gP8/c6HDHv3VXXt w==;
X-CSE-ConnectionGUID: l/QuMGKwT2uV0+v/DmW6Ag==
X-CSE-MsgGUID: qBy9tIaYRTG8UOqNLkWLxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64427144"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64427144"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:08:22 -0700
X-CSE-ConnectionGUID: kIOt/FgcRLemOmS6ImMb8g==
X-CSE-MsgGUID: 1wUgYRWBTleuLo7tQznrDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="159536589"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2025 02:08:18 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v5 12/24] drm/i915/color: Add framework to program CSC
Date: Wed,  2 Jul 2025 14:49:24 +0530
Message-ID: <20250702091936.3004854-13-uma.shankar@intel.com>
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

Add framework to program CSC. It enables copying of matrix from uapi
to intel plane state. Also adding helper functions which will eventually
program values to hardware.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c    | 14 +++++++
 drivers/gpu/drm/i915/display/intel_color.h    |  4 +-
 .../drm/i915/display/intel_display_types.h    |  1 +
 drivers/gpu/drm/i915/display/intel_plane.c    | 39 +++++++++++++++++++
 4 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 363c9590c5c1..7c53572f729b 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3967,6 +3967,20 @@ static const struct intel_color_funcs ilk_color_funcs = {
 };
 
 /* TODO: Move to another file */
+static void
+intel_color_load_plane_csc_matrix(struct intel_dsb *dsb,
+				  const struct intel_plane_state *plane_state)
+{
+	/* CTM programming */
+}
+
+void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
+					const struct intel_plane_state *plane_state)
+{
+	if (plane_state->hw.ctm)
+		intel_color_load_plane_csc_matrix(dsb, plane_state);
+}
+
 struct intel_plane_colorop *intel_colorop_alloc(void)
 {
 	struct intel_plane_colorop *colorop;
diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
index c2561b86bb26..420d596dbbae 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -13,6 +13,7 @@ struct intel_crtc_state;
 struct intel_crtc;
 struct intel_display;
 struct intel_dsb;
+struct intel_plane_state;
 struct drm_property_blob;
 struct drm_plane;
 struct drm_prop_enum_list;
@@ -49,5 +50,6 @@ struct intel_plane_colorop *intel_colorop_alloc(void);
 struct intel_plane_colorop *intel_plane_colorop_create(enum intel_color_block id);
 int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_list *list);
 int intel_plane_color_init(struct drm_plane *plane);
-
+void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
+					const struct intel_plane_state *plane_state);
 #endif /* __INTEL_COLOR_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 4b5124a08cc9..c709df0cea9e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -634,6 +634,7 @@ struct intel_plane_state {
 		enum drm_color_encoding color_encoding;
 		enum drm_color_range color_range;
 		enum drm_scaling_filter scaling_filter;
+		struct drm_property_blob *ctm;
 	} hw;
 
 	struct i915_vma *ggtt_vma;
diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index 36fb07471deb..cc8f3e15c82e 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -380,6 +380,43 @@ intel_plane_copy_uapi_plane_damage(struct intel_plane_state *new_plane_state,
 		*damage = drm_plane_state_src(&new_uapi_plane_state->uapi);
 }
 
+static void
+intel_plane_colorop_replace_blob(struct intel_plane_state *plane_state,
+				 struct intel_plane_colorop *intel_colorop,
+				 struct drm_property_blob *blob)
+{
+	if (intel_colorop->id == CB_PLANE_CSC)
+		drm_property_replace_blob(&plane_state->hw.ctm, blob);
+}
+
+static void
+intel_plane_copy_uapi_to_hw_state_color(struct intel_plane_state *plane_state,
+					const struct intel_plane_state *from_plane_state,
+					struct intel_crtc *crtc)
+{
+	struct drm_colorop *iter_colorop, *colorop;
+	struct drm_colorop_state *new_colorop_state;
+	struct drm_atomic_state *state = plane_state->uapi.state;
+	struct intel_plane_colorop *intel_colorop;
+	struct drm_property_blob *blob;
+	int i = 0;
+
+	iter_colorop = plane_state->uapi.color_pipeline;
+
+	while (iter_colorop) {
+		for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+			if (new_colorop_state->colorop == iter_colorop) {
+				blob = new_colorop_state->bypass ? NULL : new_colorop_state->data;
+				intel_colorop = to_intel_plane_colorop(colorop);
+				intel_plane_colorop_replace_blob(plane_state,
+								 intel_colorop,
+								 blob);
+			}
+		}
+		iter_colorop = iter_colorop->next;
+	}
+}
+
 void intel_plane_copy_uapi_to_hw_state(struct intel_plane_state *plane_state,
 				       const struct intel_plane_state *from_plane_state,
 				       struct intel_crtc *crtc)
@@ -408,6 +445,8 @@ void intel_plane_copy_uapi_to_hw_state(struct intel_plane_state *plane_state,
 
 	plane_state->uapi.src = drm_plane_state_src(&from_plane_state->uapi);
 	plane_state->uapi.dst = drm_plane_state_dest(&from_plane_state->uapi);
+
+	intel_plane_copy_uapi_to_hw_state_color(plane_state, from_plane_state, crtc);
 }
 
 void intel_plane_copy_hw_state(struct intel_plane_state *plane_state,
-- 
2.42.0

