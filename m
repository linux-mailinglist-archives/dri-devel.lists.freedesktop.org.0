Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11498AF0F0D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A39D10E353;
	Wed,  2 Jul 2025 09:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ERyCPD5B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2480610E353;
 Wed,  2 Jul 2025 09:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751447293; x=1782983293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8adYojqLWsqgWO/5fvg386oeCjNy/0V5KtOgZFWBkQU=;
 b=ERyCPD5Bn+zqyIlVfgP5tGCoUPabm0tfWivRdRltTBK9xC4HJoutPr3K
 JH4HuVWMSyvbvusUGSz65eNvuDraWsEbo2R4BFMi5OcMrH4tFsqW8Abjm
 cIjc/QdWaccpO2wOGlgBosStaz9lZytgWzFKy8v1zud5WX2Kfbumt0hfj
 hhmw3DkMbTy+XkEmZLRoaUHpWSz12nrdhwlaS6WnBrVPDTB6ERbfe0A/B
 cm0InCLq26A1NcUDFclnhdhqPt0a2GtOfZAxPLtbw0/sD1ZWDWhAAtjXB
 a/fKATumM6QJnRQSEPKJ0po5QnlpOufUQYcPAAwgVIq2ES0IihciRLCWL A==;
X-CSE-ConnectionGUID: 5az6I4K3R8y5nccrJ2nLOw==
X-CSE-MsgGUID: O+Ucgap+RA2fAcuy1gnigw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64427060"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64427060"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:08:10 -0700
X-CSE-ConnectionGUID: C3FySaI9QvKxuNQICVLxuA==
X-CSE-MsgGUID: Krk9dzxsRT6KY7tD9LVXMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="159536510"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2025 02:08:06 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v5 09/24] drm/i915/color: Add helper to create intel colorop
Date: Wed,  2 Jul 2025 14:49:21 +0530
Message-ID: <20250702091936.3004854-10-uma.shankar@intel.com>
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

Add intel colorop create helper

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 39 ++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_color.h |  3 ++
 2 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 671db6926e4c..5f38a5ff541c 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3962,6 +3962,45 @@ static const struct intel_color_funcs ilk_color_funcs = {
 	.get_config = ilk_get_config,
 };
 
+/* TODO: Move to another file */
+struct intel_plane_colorop *intel_colorop_alloc(void)
+{
+	struct intel_plane_colorop *colorop;
+	struct intel_plane_colorop_state *colorop_state;
+
+	colorop = kzalloc(sizeof(*colorop), GFP_KERNEL);
+	if (!colorop)
+		return ERR_PTR(-ENOMEM);
+
+	colorop_state = kzalloc(sizeof(*colorop_state), GFP_KERNEL);
+	if (!colorop_state) {
+		kfree(colorop);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	/* TODO: Add color op reset
+	 * intel_colorop_state_reset(plane_state, plane);
+	 */
+
+	colorop->base.state = &colorop_state->uapi;
+
+	return colorop;
+}
+
+struct intel_plane_colorop *intel_plane_colorop_create(enum intel_color_block id)
+{
+	struct intel_plane_colorop *colorop;
+
+	colorop = intel_colorop_alloc();
+
+	if (IS_ERR(colorop))
+		return colorop;
+
+	colorop->id = id;
+
+	return colorop;
+}
+
 void intel_color_crtc_init(struct intel_crtc *crtc)
 {
 	struct intel_display *display = to_intel_display(crtc);
diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
index bf7a12ce9df0..f3c7cd694b99 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -14,6 +14,7 @@ struct intel_crtc;
 struct intel_display;
 struct intel_dsb;
 struct drm_property_blob;
+enum intel_color_block;
 
 void intel_color_init_hooks(struct intel_display *display);
 int intel_color_init(struct intel_display *display);
@@ -40,5 +41,7 @@ bool intel_color_lut_equal(const struct intel_crtc_state *crtc_state,
 			   const struct drm_property_blob *blob2,
 			   bool is_pre_csc_lut);
 void intel_color_assert_luts(const struct intel_crtc_state *crtc_state);
+struct intel_plane_colorop *intel_colorop_alloc(void);
+struct intel_plane_colorop *intel_plane_colorop_create(enum intel_color_block id);
 
 #endif /* __INTEL_COLOR_H__ */
-- 
2.42.0

