Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A913A86617
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 21:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B2510EC69;
	Fri, 11 Apr 2025 19:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YsRBHAAa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2DC10E0F1;
 Fri, 11 Apr 2025 19:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744399187; x=1775935187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V+j4d850Mq2khPjFWQgzoFpnXCN+bjiYe4/bjT2HIgo=;
 b=YsRBHAAa9crxvfeniP7Ex2ZlxUtL8b+o6o+j8TF5NP5ZZd9G1nJM4VeR
 TsEk5Yq99LjOZShzIynXq8MRo5sU4oOchQ+XhsyyjHGiBP+WAz2b97xnU
 Du7JxaThtqdhcOZGxvhH4ylRTTn3x+RhHufLvxwynVQDL1SwJH7R+GkJc
 lTwbXd8h933V2AsWThFCEhlh06SzPCqClYFg5CaUemap3/v6uwiCMBzNh
 MUCZFzeMso4+LYjk26N+6IRFM0ySKJ0BGCNn6JwZGak9eG3414Fk/0MaP
 sfBS8MxQ26xQqjlKU1ljQZvNxPsncdxVmLaMo6eljbXdalCte31CPiowN Q==;
X-CSE-ConnectionGUID: m3qSWgj7RvOXyTz8ajduZA==
X-CSE-MsgGUID: bV5GR4ydRUmVkzgaLkUT5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="68450637"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="68450637"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 12:19:46 -0700
X-CSE-ConnectionGUID: btYCM5A5TjiRVyr7P+1ewQ==
X-CSE-MsgGUID: KR7Xwu4DSnuAqXF4BGAxhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="134431690"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 11 Apr 2025 12:19:43 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 11 Apr 2025 22:19:41 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 01/19] drm: Pass pixel_format+modifier to .get_format_info()
Date: Fri, 11 Apr 2025 22:19:41 +0300
Message-ID: <20250411191941.9198-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410163218.15130-2-ville.syrjala@linux.intel.com>
References: <20250410163218.15130-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Decouple .get_format_info() from struct drm_mode_fb_cmd2 and just
pass the pixel format+modifier combo in by hand.

We may want to use .get_format_info() outside of the normal
addfb paths where we won't have a struct drm_mode_fb_cmd2, and
creating a temporary one just for this seems silly.

v2: Fix intel_fb_get_format_info() docs (Laurent)

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <siqueira@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  4 ++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h   |  2 +-
 drivers/gpu/drm/drm_fourcc.c                          |  3 ++-
 drivers/gpu/drm/i915/display/intel_fb.c               | 11 ++++++-----
 drivers/gpu/drm/i915/display/intel_fb.h               |  2 +-
 include/drm/drm_mode_config.h                         |  2 +-
 6 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 3e0f45f1711c..69d715b6abd3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -92,9 +92,9 @@ enum dm_micro_swizzle {
 	MICRO_SWIZZLE_R = 3
 };
 
-const struct drm_format_info *amdgpu_dm_plane_get_format_info(const struct drm_mode_fb_cmd2 *cmd)
+const struct drm_format_info *amdgpu_dm_plane_get_format_info(u32 pixel_format, u64 modifier)
 {
-	return amdgpu_lookup_format_info(cmd->pixel_format, cmd->modifier[0]);
+	return amdgpu_lookup_format_info(pixel_format, modifier);
 }
 
 void amdgpu_dm_plane_fill_blending_from_plane_state(const struct drm_plane_state *plane_state,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
index 615d2ab2b803..ea2619b507db 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h
@@ -58,7 +58,7 @@ int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 			 unsigned long possible_crtcs,
 			 const struct dc_plane_cap *plane_cap);
 
-const struct drm_format_info *amdgpu_dm_plane_get_format_info(const struct drm_mode_fb_cmd2 *cmd);
+const struct drm_format_info *amdgpu_dm_plane_get_format_info(u32 pixel_format, u64 modifier);
 
 void amdgpu_dm_plane_fill_blending_from_plane_state(const struct drm_plane_state *plane_state,
 				    bool *per_pixel_alpha, bool *pre_multiplied_alpha,
diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index 3a94ca211f9c..f79fff8209fd 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -395,7 +395,8 @@ drm_get_format_info(struct drm_device *dev,
 	const struct drm_format_info *info = NULL;
 
 	if (dev->mode_config.funcs->get_format_info)
-		info = dev->mode_config.funcs->get_format_info(mode_cmd);
+		info = dev->mode_config.funcs->get_format_info(mode_cmd->pixel_format,
+							       mode_cmd->modifier[0]);
 
 	if (!info)
 		info = drm_format_info(mode_cmd->pixel_format);
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 2b0e0f220442..34a29488311f 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -421,21 +421,22 @@ unsigned int intel_fb_modifier_to_tiling(u64 fb_modifier)
 
 /**
  * intel_fb_get_format_info: Get a modifier specific format information
- * @cmd: FB add command structure
+ * @pixel_format: pixel format
+ * @modifier: modifier
  *
  * Returns:
- * Returns the format information for @cmd->pixel_format specific to @cmd->modifier[0],
+ * Returns the format information for @pixel_format specific to @modifier,
  * or %NULL if the modifier doesn't override the format.
  */
 const struct drm_format_info *
-intel_fb_get_format_info(const struct drm_mode_fb_cmd2 *cmd)
+intel_fb_get_format_info(u32 pixel_format, u64 modifier)
 {
-	const struct intel_modifier_desc *md = lookup_modifier_or_null(cmd->modifier[0]);
+	const struct intel_modifier_desc *md = lookup_modifier_or_null(modifier);
 
 	if (!md || !md->formats)
 		return NULL;
 
-	return lookup_format_info(md->formats, md->format_count, cmd->pixel_format);
+	return lookup_format_info(md->formats, md->format_count, pixel_format);
 }
 
 static bool plane_caps_contain_any(u8 caps, u8 mask)
diff --git a/drivers/gpu/drm/i915/display/intel_fb.h b/drivers/gpu/drm/i915/display/intel_fb.h
index bdd76b372957..7d1267fbeee2 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.h
+++ b/drivers/gpu/drm/i915/display/intel_fb.h
@@ -47,7 +47,7 @@ u64 *intel_fb_plane_get_modifiers(struct intel_display *display,
 bool intel_fb_plane_supports_modifier(struct intel_plane *plane, u64 modifier);
 
 const struct drm_format_info *
-intel_fb_get_format_info(const struct drm_mode_fb_cmd2 *cmd);
+intel_fb_get_format_info(u32 pixel_format, u64 modifier);
 
 bool
 intel_format_info_is_yuv_semiplanar(const struct drm_format_info *info,
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 4b8f0370b79b..6fca0362bc31 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -95,7 +95,7 @@ struct drm_mode_config_funcs {
 	 * The format information specific to the given fb metadata, or
 	 * NULL if none is found.
 	 */
-	const struct drm_format_info *(*get_format_info)(const struct drm_mode_fb_cmd2 *mode_cmd);
+	const struct drm_format_info *(*get_format_info)(u32 pixel_format, u64 modifier);
 
 	/**
 	 * @mode_valid:
-- 
2.49.0

