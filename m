Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1899A00E9
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 07:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38D010E16F;
	Wed, 16 Oct 2024 05:46:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jTSNtecw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DBC10E16F;
 Wed, 16 Oct 2024 05:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729057570; x=1760593570;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+VGO8xYtCs274xe+qwRMoj2QhadK+ds750eSJrEjvKQ=;
 b=jTSNtecwyVwgn5C1Rkae6NJ378xfo9G2Lin4wGs3aCcVRXjpm7/Pnn+w
 HxDdsFou9+F1AaqmkwtwKODIU51cc0fLLYnWU0laggX3WopbnBQVUtNj3
 WGc11keIGcgYhuBAvD3M0jTQMvAAyu2Xj5/u1S1U/scgvj75JdmGU9Ng2
 x5/OY2jc1JllHLjRY2DJptb8WVkenBdH1DWOu5vi1fynGCiAdrWuBuYcX
 uw3zoqxIMKUr3fk3F4tYtFptf2c9rhBhecvD7MN2w8KmEaiVZsboeTRr7
 LwBfXobC6wt0xX5oI34eZvAD17fVF4ydYg3dGNKGzysQMIXz7v2sgLSOW Q==;
X-CSE-ConnectionGUID: eGXkDlJcRyO+Ysaze4/JEQ==
X-CSE-MsgGUID: cbEJssCWQYa21wMr3EA/JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28583412"
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; d="scan'208";a="28583412"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 22:46:07 -0700
X-CSE-ConnectionGUID: IGoqWGvbRS2tRqe+vB1etw==
X-CSE-MsgGUID: UWtHA7kiRGOLNtK9r+84uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="82929159"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa003.jf.intel.com with ESMTP; 15 Oct 2024 22:46:05 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH] drm/i915/display: plane property for async supported modifiers
Date: Wed, 16 Oct 2024 11:06:26 +0530
Message-Id: <20241016053626.2850384-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
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

Create a i915 private plane property for sharing the async supported
modifiers to the user.
UMD related discussion requesting the same
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29618#note_2487123

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 .../gpu/drm/i915/display/intel_atomic_plane.c |  6 +++
 .../drm/i915/display/intel_display_types.h    |  4 ++
 .../drm/i915/display/skl_universal_plane.c    | 49 ++++++++++++++++++-
 3 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
index b7e462075ded..ef41b50cc765 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
@@ -117,6 +117,9 @@ intel_plane_duplicate_state(struct drm_plane *plane)
 	intel_state->dpt_vma = NULL;
 	intel_state->flags = 0;
 
+	if (intel_state->async_sup_modifiers)
+		drm_property_blob_get(intel_state->async_sup_modifiers);
+
 	/* add reference to fb */
 	if (intel_state->hw.fb)
 		drm_framebuffer_get(intel_state->hw.fb);
@@ -141,6 +144,9 @@ intel_plane_destroy_state(struct drm_plane *plane,
 	drm_WARN_ON(plane->dev, plane_state->ggtt_vma);
 	drm_WARN_ON(plane->dev, plane_state->dpt_vma);
 
+	if (plane_state->async_sup_modifiers)
+		drm_property_blob_put(plane_state->async_sup_modifiers);
+
 	__drm_atomic_helper_plane_destroy_state(&plane_state->uapi);
 	if (plane_state->hw.fb)
 		drm_framebuffer_put(plane_state->hw.fb);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 2bb1fa64da2f..a5a301ca521a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -683,6 +683,8 @@ struct intel_plane_state {
 	u64 ccval;
 
 	const char *no_fbc_reason;
+
+	struct drm_property_blob *async_sup_modifiers;
 };
 
 struct intel_initial_plane_config {
@@ -1435,6 +1437,8 @@ struct intel_plane {
 
 	struct intel_fbc *fbc;
 
+	struct drm_property *async_modifiers_property;
+
 	/*
 	 * NOTE: Do not place new plane state fields here (e.g., when adding
 	 * new plane properties).  New runtime state should now be placed in
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index 9557b08ca2e2..6790bdf00c8f 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2383,6 +2383,29 @@ static bool icl_plane_format_mod_supported(struct drm_plane *_plane,
 	}
 }
 
+static int intel_plane_get_property(struct drm_plane *plane,
+				    const struct drm_plane_state *state,
+				    struct drm_property *property,
+				    uint64_t *val)
+{
+	struct drm_i915_private *i915 = to_i915(plane->dev);
+	const struct intel_plane_state *intel_plane_state =
+		to_intel_plane_state(state);
+	struct intel_plane *intel_plane = to_intel_plane(plane);
+
+	if (property == intel_plane->async_modifiers_property) {
+		*val = intel_plane_state->async_sup_modifiers ?
+			intel_plane_state->async_sup_modifiers->base.id : 0;
+	} else {
+		drm_err(&i915->drm,
+			"Unknown property [PROP:%d:%s]\n",
+			property->base.id, property->name);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static bool tgl_plane_format_mod_supported(struct drm_plane *_plane,
 					   u32 format, u64 modifier)
 {
@@ -2442,6 +2465,7 @@ static const struct drm_plane_funcs skl_plane_funcs = {
 	.atomic_duplicate_state = intel_plane_duplicate_state,
 	.atomic_destroy_state = intel_plane_destroy_state,
 	.format_mod_supported = skl_plane_format_mod_supported,
+	.atomic_get_property = intel_plane_get_property,
 };
 
 static const struct drm_plane_funcs icl_plane_funcs = {
@@ -2451,6 +2475,7 @@ static const struct drm_plane_funcs icl_plane_funcs = {
 	.atomic_duplicate_state = intel_plane_duplicate_state,
 	.atomic_destroy_state = intel_plane_destroy_state,
 	.format_mod_supported = icl_plane_format_mod_supported,
+	.atomic_get_property = intel_plane_get_property,
 };
 
 static const struct drm_plane_funcs tgl_plane_funcs = {
@@ -2460,6 +2485,7 @@ static const struct drm_plane_funcs tgl_plane_funcs = {
 	.atomic_duplicate_state = intel_plane_duplicate_state,
 	.atomic_destroy_state = intel_plane_destroy_state,
 	.format_mod_supported = tgl_plane_format_mod_supported,
+	.atomic_get_property = intel_plane_get_property,
 };
 
 static void
@@ -2549,6 +2575,25 @@ static u8 skl_get_plane_caps(struct drm_i915_private *i915,
 	return caps;
 }
 
+static void intel_plane_attach_async_modifiers_property(struct intel_plane *intel_plane)
+{
+	struct drm_plane *plane = &intel_plane->base;
+	struct drm_device *dev = plane->dev;
+	struct drm_property *prop;
+
+	prop = intel_plane->async_modifiers_property;
+	if (!prop) {
+		prop = drm_property_create(dev, DRM_MODE_PROP_BLOB | DRM_MODE_PROP_ATOMIC,
+					   "Async Supported Modifiers", 0);
+		if (!prop)
+			return;
+
+		intel_plane->async_modifiers_property = prop;
+	}
+
+	drm_object_attach_property(&plane->base, prop, 0);
+}
+
 struct intel_plane *
 skl_universal_plane_create(struct drm_i915_private *dev_priv,
 			   enum pipe pipe, enum plane_id plane_id)
@@ -2694,10 +2739,12 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
 	if (DISPLAY_VER(dev_priv) >= 12)
 		drm_plane_enable_fb_damage_clips(&plane->base);
 
-	if (DISPLAY_VER(dev_priv) >= 11)
+	if (DISPLAY_VER(dev_priv) >= 11) {
 		drm_plane_create_scaling_filter_property(&plane->base,
 						BIT(DRM_SCALING_FILTER_DEFAULT) |
 						BIT(DRM_SCALING_FILTER_NEAREST_NEIGHBOR));
+		intel_plane_attach_async_modifiers_property(plane);
+	}
 
 	intel_plane_helper_add(plane);
 
-- 
2.25.1

