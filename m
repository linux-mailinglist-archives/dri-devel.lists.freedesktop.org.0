Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FB0852948
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 07:42:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972D310E9ED;
	Tue, 13 Feb 2024 06:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ix5ybioO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5673C10E9ED;
 Tue, 13 Feb 2024 06:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707806572; x=1739342572;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DyquDm+regLr1QktdCfviUuIDfE5EWHeiMr0DG+QZJs=;
 b=Ix5ybioOhLJoBTY06/9Ir3QMNLNEYmYUMY9yXNEYS0deWn5wn6wgeXLS
 9AsUb21Du8YNxqAKtu7D3LzMTnzFImaSLZirL/omMPSkZbuH2lJmWr4kD
 5C1lB9ro6a2gyHMvb6ci2fdOolSTUGIC5AwvNIBR6EX7mGPhqXY5Fq+YF
 lroZg7P4skCxeabhvnGge0CVe4CWRMusB0bY4mIEyfpgdoNvDdzjm3Z7i
 PXwvD6ov/vQHKnpxQHKUknSz509eiitU6FEgrnKryTpI0vq3oY+7yOi2C
 W+v1yvTtqSs6kHHEDoFmeQ5QyZ+7yl3tPamlZKI6OjFC4dqunfAj2N9TE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="436948146"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="436948146"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:42:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7450574"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa003.jf.intel.com with ESMTP; 12 Feb 2024 22:42:45 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, harry.wentland@amd.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, arthurgrillo@riseup.net, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com, sean@poorly.run,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH 20/28] drm/i915/color: Add callbacks to set plane CTM
Date: Tue, 13 Feb 2024 12:18:27 +0530
Message-ID: <20240213064835.139464-21-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240213064835.139464-1-uma.shankar@intel.com>
References: <20240213064835.139464-1-uma.shankar@intel.com>
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

Add callback to intel color functions for setting plane CTM.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 22 ++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_color.h |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 06268e89125e..8dc72ad25700 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -81,6 +81,10 @@ struct intel_color_funcs {
 	 * Read config other than LUTs and CSCs, before them. Optional.
 	 */
 	void (*get_config)(struct intel_crtc_state *crtc_state);
+
+	/* Plane CSC*/
+	void (*load_plane_csc_matrix)(const struct drm_plane_state *plane_state,
+				      const struct drm_property_blob *blob);
 };
 
 #define CTM_COEFF_SIGN	(1ULL << 63)
@@ -3684,6 +3688,15 @@ static void icl_read_luts(struct intel_crtc_state *crtc_state)
 	}
 }
 
+void intel_color_load_plane_csc_matrix(const struct drm_plane_state *plane_state,
+				       const struct drm_property_blob *blob)
+{
+	struct drm_i915_private *i915 = to_i915(plane_state->plane->dev);
+
+	if (i915->display.funcs.color->load_plane_csc_matrix)
+		i915->display.funcs.color->load_plane_csc_matrix(plane_state, blob);
+}
+
 static const struct intel_color_funcs chv_color_funcs = {
 	.color_check = chv_color_check,
 	.color_commit_arm = i9xx_color_commit_arm,
@@ -3953,6 +3966,15 @@ static void apply_colorop(const struct drm_plane_state *plane_state,
 			  struct drm_colorop *colorop,
 			  u32 *plane_color_ctl)
 {
+	struct drm_colorop_state *state = colorop->state;
+	struct intel_plane_colorop *intel_colorop = to_intel_plane_colorop(colorop);
+
+	if (colorop->type == DRM_COLOROP_CTM_3X3) {
+		/* TODO: use intel_color_op state data */
+		(*plane_color_ctl) |= PLANE_COLOR_PLANE_CSC_ENABLE;
+		if (state->data && intel_colorop->id == CB_PLANE_CSC)
+			intel_color_load_plane_csc_matrix(plane_state, state->data);
+	}
 }
 
 void intel_program_pipeline(const struct drm_plane_state *plane_state, u32 *plane_color_ctl)
diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
index bde880370ecc..3f1466f88c11 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -43,5 +43,7 @@ int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_l
 int intel_plane_color_init(struct drm_plane *plane);
 void intel_program_pipeline(const struct drm_plane_state *plane_state,
 			    u32 *plane_color_ctl);
+void intel_color_load_plane_csc_matrix(const struct drm_plane_state *plane_state,
+				       const struct drm_property_blob *blob);
 
 #endif /* __INTEL_COLOR_H__ */
-- 
2.42.0

