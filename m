Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F2CA5D6FF
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 08:13:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBDF110E6EE;
	Wed, 12 Mar 2025 07:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NALUxFZU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A304D10E6FD;
 Wed, 12 Mar 2025 07:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741763583; x=1773299583;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c0KU9TC/5HjQGczoS/JWPvaWLNGLRl48rjSc2TTL5ck=;
 b=NALUxFZUmqwo3phtBMbS8UJ5+DhKNcvyW7pAeaTpaeXCfO0iMAeyFgpB
 fSEKphVwm2RINeOPXEldM3CImu2JgP03+922d9JaPDVc2FV0jUpOijfll
 FGlnzeiIRVNWCDwnyru9OGt+caQPa/Wt7YBuq6T38xPioTEgwkP+loKO2
 gPAL2aLGSD5TFuCqEsBN+eManNTfcfk39PTMjJOyyRjUJy0/tbc43NPqq
 c6B/ad7GQT1yvsHqwmzdASc6wQUnYfS/opR2xnrvCXAVbwc5chIJ493GR
 JF9VYl7yT7iDAFcJ5gb4TscbIAzIHBFaQOC+BghqtOuB3b68Amps+f/7v w==;
X-CSE-ConnectionGUID: 1x+tosizQ0+in/uBdpWreQ==
X-CSE-MsgGUID: SIIeLizRQd22g++WUduZTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="65288809"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="65288809"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 00:13:03 -0700
X-CSE-ConnectionGUID: igJofmyaTDK3zr9JSccQzw==
X-CSE-MsgGUID: C/wWjBAbRRyh41Pem4MWNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="120367112"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa006.fm.intel.com with ESMTP; 12 Mar 2025 00:12:59 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v4 12/23] drm/i915/color: Add and attach COLORPIPELINE plane property
Date: Wed, 12 Mar 2025 12:54:14 +0530
Message-ID: <20250312072425.3099205-13-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250312072425.3099205-1-uma.shankar@intel.com>
References: <20250312072425.3099205-1-uma.shankar@intel.com>
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

Add supported color pipelines and attach it to plane.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 42 ++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_color.h |  3 ++
 2 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index f86754cfbfef..ebd202c91eb0 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -4151,6 +4151,48 @@ int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_l
 	return 0;
 }
 
+int intel_plane_color_init(struct drm_plane *plane)
+{
+	struct drm_device *dev = plane->dev;
+	struct intel_display *display = to_intel_display(dev);
+	struct drm_property *prop;
+	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
+	int len = 0;
+	int ret;
+
+	/* Currently expose pipeline only for HDR planes*/
+	if (!icl_is_hdr_plane(display, to_intel_plane(plane)->id))
+		return 0;
+
+	/* Add "Bypass" (i.e. NULL) pipeline */
+	pipelines[len].type = 0;
+	pipelines[len].name = "Bypass";
+	len++;
+
+	/* Add pipeline consisting of transfer functions */
+	ret = intel_plane_tf_pipeline_init(plane, &pipelines[len]);
+	if (ret)
+		return ret;
+	len++;
+
+	/* Create COLOR_PIPELINE property and attach */
+	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC,
+					"COLOR_PIPELINE",
+					pipelines, len);
+	if (!prop)
+		return -ENOMEM;
+
+	plane->color_pipeline_property = prop;
+
+	drm_object_attach_property(&plane->base, prop, 0);
+
+	/* TODO check if needed */
+	if (plane->state)
+		plane->state->color_pipeline = NULL;
+
+	return 0;
+}
+
 void intel_color_crtc_init(struct intel_crtc *crtc)
 {
 	struct intel_display *display = to_intel_display(crtc);
diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
index abbc41d730a9..8a3bf5b79e39 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -18,6 +18,8 @@ struct drm_plane;
 struct drm_prop_enum_list;
 enum intel_color_block;
 
+#define MAX_COLOR_PIPELINES 5
+
 void intel_color_init_hooks(struct intel_display *display);
 int intel_color_init(struct intel_display *display);
 void intel_color_crtc_init(struct intel_crtc *crtc);
@@ -44,5 +46,6 @@ void intel_color_assert_luts(const struct intel_crtc_state *crtc_state);
 struct intel_plane_colorop *intel_colorop_alloc(void);
 struct intel_plane_colorop *intel_plane_colorop_create(enum intel_color_block id);
 int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_list *list);
+int intel_plane_color_init(struct drm_plane *plane);
 
 #endif /* __INTEL_COLOR_H__ */
-- 
2.42.0

