Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2704A4FFEE
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B21410E7B1;
	Wed,  5 Mar 2025 13:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ol83w0Ps";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1187110E799;
 Wed,  5 Mar 2025 13:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741180496; x=1772716496;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c0KU9TC/5HjQGczoS/JWPvaWLNGLRl48rjSc2TTL5ck=;
 b=Ol83w0PsJVvoJW0h0j9GmjPq5HygBzhZiS8nDFKCnVtNPxuFcZSs+jYn
 AfqL9jMwOXO5Ivl5Hn+/F7mO0Y6qb+72UgzaBfcMMIdEo3GUPvTScgNF9
 u60IroQvjT6DlffaRa3H9wK99bGCKHLmq9TRdbPUVNl2Hld5dKoOIBne6
 DY/U8493u1SBA7DLcUPOCTsH4UpQYskEF4QjRN7NaGJ4Yo0C71f/D3Thk
 PHightAkmmC6JNulilmbj2Z3stRcQrPVcsaocuEhs1lxP2mhETyACR2wK
 3CfQw+s+iVhjl7uPRjFI0vP5J09PG34lK9kvpKZTTd1mfGgPeO3tiuttL g==;
X-CSE-ConnectionGUID: cVx88MZhTmmYhZlwNHKE7w==
X-CSE-MsgGUID: +wU1qSF6SpqfuCBL427P0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59685538"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="59685538"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 05:14:56 -0800
X-CSE-ConnectionGUID: 8YQzI3ffTLSVWPTbL13TbQ==
X-CSE-MsgGUID: +LRHIBUbR0i7qkr2SMnHxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="118701155"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa006.jf.intel.com with ESMTP; 05 Mar 2025 05:14:52 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 dmitry.baryshkov@linaro.org,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v3 12/23] drm/i915/color: Add and attach COLORPIPELINE plane property
Date: Wed,  5 Mar 2025 18:55:57 +0530
Message-ID: <20250305132608.2379253-13-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250305132608.2379253-1-uma.shankar@intel.com>
References: <20250305132608.2379253-1-uma.shankar@intel.com>
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

