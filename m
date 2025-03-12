Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E071A5D701
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 08:13:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63CE910E6FE;
	Wed, 12 Mar 2025 07:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WrsQb809";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA8F10E702;
 Wed, 12 Mar 2025 07:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741763587; x=1773299587;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PI4WyCBqX/QbeSVYXbuEuZfDGflGj2YPh5DElUzkZ5I=;
 b=WrsQb80938/iKqe4aCyYOerEJnca0Jgv+oEY6EoDEqBxRYj42VY+e8ch
 LDcj/i2d7P7vo9Yf0IZeuOi8kdGl0uu0zgz8DWTpNlrPqvqdXmLuFrRi7
 LtPBPMbsW4UxVrYPsO/rYg0RBQCbo5tt55C4rfqd4KLvIemPrDw03jme3
 AU9P1c0HTRjs49wudFRunRx1oAyujNrvHCjlZGT7tyTQadH1J8Lix5T6Y
 VpNY71jnVYNhMjwRoacOAdmxuOnScEPoAcsvNDJRUEsdJXplZPh0FwuAP
 tnX73vxvWMP/maCI4Y4tlSlKHv/FwycKeq/D9wMHquiynAiAgLFveSByY A==;
X-CSE-ConnectionGUID: ZxtdwUbVTJWpfcjMMOqt4A==
X-CSE-MsgGUID: lgtr6xGtQuOe+Qel1Q94ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="65288822"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="65288822"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 00:13:07 -0700
X-CSE-ConnectionGUID: EJGlDVyiTPGemGNK62NZcQ==
X-CSE-MsgGUID: 6k2Gz/MQRY+I9WMZOjM8kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="120367141"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa006.fm.intel.com with ESMTP; 12 Mar 2025 00:13:03 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v4 13/23] drm/i915/color: Add framework to set colorop
Date: Wed, 12 Mar 2025 12:54:15 +0530
Message-ID: <20250312072425.3099205-14-uma.shankar@intel.com>
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

Add infrastructure to set colorop. We iterate through all the color ops
in a selected COLOR PIPELINE and set them one by one.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 31 ++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_color.h |  3 +++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index ebd202c91eb0..cf508094a038 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -4110,6 +4110,37 @@ struct intel_plane_colorop *intel_plane_colorop_create(enum intel_color_block id
 	return colorop;
 }
 
+static void apply_colorop(const struct drm_plane_state *plane_state,
+			  struct drm_colorop *colorop,
+			  u32 *plane_color_ctl)
+{
+}
+
+void intel_program_pipeline(const struct drm_plane_state *plane_state, u32 *plane_color_ctl)
+{
+	struct drm_colorop *colorop;
+
+	colorop = plane_state->color_pipeline;
+
+	while (colorop) {
+		struct drm_colorop_state *colorop_state;
+
+		if (!colorop)
+			return;
+
+		/* TODO this is probably wrong */
+		colorop_state = colorop->state;
+
+		if (!colorop_state)
+			return;
+
+		if (!colorop_state->bypass)
+			apply_colorop(plane_state, colorop, plane_color_ctl);
+
+		colorop = colorop->next;
+	}
+}
+
 int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_list *list)
 {
 	struct intel_plane_colorop *colorop;
diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
index 8a3bf5b79e39..7be2453eee0a 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -15,6 +15,7 @@ struct intel_display;
 struct intel_dsb;
 struct drm_property_blob;
 struct drm_plane;
+struct drm_plane_state;
 struct drm_prop_enum_list;
 enum intel_color_block;
 
@@ -47,5 +48,7 @@ struct intel_plane_colorop *intel_colorop_alloc(void);
 struct intel_plane_colorop *intel_plane_colorop_create(enum intel_color_block id);
 int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_list *list);
 int intel_plane_color_init(struct drm_plane *plane);
+void intel_program_pipeline(const struct drm_plane_state *plane_state,
+			    u32 *plane_color_ctl);
 
 #endif /* __INTEL_COLOR_H__ */
-- 
2.42.0

