Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D4278C923
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72DC10E40D;
	Tue, 29 Aug 2023 15:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A96510E409;
 Tue, 29 Aug 2023 15:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324786; x=1724860786;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8FLbUJPdobfYe9GU9gw7M3bXy57hVNJSuvEc7LwC3GQ=;
 b=Lqn9XqIydwWhYNzDNVpXfM6XsyxnJfsiFqHPk7NAQp8FwgF7XHrOGpFb
 vAa/e/UvRyOH15/1TcI6g9BRPm4riXSkXnye5KUaxmczste0gh+tEdo0H
 264KBITfKbh1T6Lh4sK7qOiup1Z7F6SotcsKo9OAu7UCMLAX2V7hjPmfe
 GMZDxKYbPyG6/CqEHfph2n6qgWEOCW6hL8MgZ00/xfvgJSgH70XGGt0ch
 sOhGZEXp5WJMv5khBMcTrvCJquSWQOHlp9+mRaP4+ndsOALsGmPvNfcIv
 GmhDQgLIbTv2Jq1/HYOmnzc/b2LXS2t/raf6AFW9aoMEMzOx0Dn9z9vct Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769405"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769405"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:59:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688555052"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688555052"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:59:22 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 20/33] drm/i915/color: Add color pipelines to plane
Date: Tue, 29 Aug 2023 21:34:09 +0530
Message-ID: <20230829160422.1251087-21-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829160422.1251087-1-uma.shankar@intel.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Add supported plane color pipelines. To represent all
hardware blocks in their inactive state, we introduce a pipeline
called "no color pipeline" which is the default pipeline.
Add respective color pipelines for SDR and HDR planes. Create and
attach plane enum property "GET_COLOR_PIPELINE" to expose these
pipelines to userspace.

Co-developed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 31 +++++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_color.h |  3 ++-
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index a8c6be70c859..9f5d2cd0f97a 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3977,7 +3977,6 @@ struct drm_color_op color_pipeline_hdr[] = {
 	},
 };
 
-__maybe_unused
 static int intel_prepare_plane_color_pipeline(struct drm_plane *plane)
 {
 	struct drm_i915_private *i915 = to_i915(plane->dev);
@@ -4039,6 +4038,36 @@ static int intel_prepare_plane_color_pipeline(struct drm_plane *plane)
 	return ret;
 };
 
+__maybe_unused
+void intel_color_plane_init(struct drm_plane *plane)
+{
+	struct drm_i915_private *i915 = to_i915(plane->dev);
+
+	if (DISPLAY_VER(i915) < 13)
+		return;
+
+	drm_plane_create_get_color_pipeline_property(plane->dev, plane, 2);
+
+	intel_prepare_plane_color_pipeline(plane);
+
+	/*
+	 * default pipeline is set as 0 or "no color pipeline". All color h/w
+	 * blocks are disabled at this stage.
+	 */
+	drm_plane_add_color_pipeline(plane, "no color pipeline", NULL, 0);
+
+	if (icl_is_hdr_plane(i915, to_intel_plane(plane)->id))
+		drm_plane_add_color_pipeline(plane, "color pipeline hdr",
+					     color_pipeline_hdr,
+					     sizeof(color_pipeline_hdr));
+	else
+		drm_plane_add_color_pipeline(plane, "color pipeline sdr",
+					     color_pipeline_sdr,
+					     sizeof(color_pipeline_sdr));
+
+	drm_plane_attach_get_color_pipeline_property(plane);
+}
+
 void intel_color_crtc_init(struct intel_crtc *crtc)
 {
 	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
index 8002492be709..aa649d13c6fa 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -10,6 +10,7 @@
 
 struct intel_crtc_state;
 struct intel_crtc;
+struct drm_plane;
 struct drm_i915_private;
 struct drm_property_blob;
 
@@ -29,5 +30,5 @@ bool intel_color_lut_equal(const struct intel_crtc_state *crtc_state,
 			   const struct drm_property_blob *blob2,
 			   bool is_pre_csc_lut);
 void intel_color_assert_luts(const struct intel_crtc_state *crtc_state);
-
+void intel_color_plane_init(struct drm_plane *plane);
 #endif /* __INTEL_COLOR_H__ */
-- 
2.38.1

