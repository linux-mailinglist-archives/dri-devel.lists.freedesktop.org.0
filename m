Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A228CA5D6FB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 08:12:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E451610E6F9;
	Wed, 12 Mar 2025 07:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ID88LFDb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD61510E6ED;
 Wed, 12 Mar 2025 07:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741763577; x=1773299577;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CemSat/J9An2HLqe2BOKC7kZk5l2mDnugkMBiWXwY9s=;
 b=ID88LFDb1to4RFV/lenAZDRwxi43b598i2+Ginbrvtmuk3k2hllXHV9I
 LxCTe60UV2NBvONoh1OtQtYpkQfh5UTCtTf2dF/adCg3ctN0UzUZ/9F1L
 J2EAOuPUm3b7yUePMkHoElOi37jv2QXbTkm7HTpnSnxolXJ29jVsOsuYv
 6qZh8u3M0xtP7XUwAv5m4OXa2TM0MHjWhVU4/pkWiNHbShB95tlPXnszz
 /VZ1VPntw89LzQRoDDJ4UsLJDUN14Lw6mFsZPKpnB5lNFMM/BjzVINffk
 DfNx4X2aG/FDW4KM2fYE6ITZayY27rBe88V44w723O+yTjHJbaU0IBP1h g==;
X-CSE-ConnectionGUID: cq7Lqis5SPi+Hy2xEnNh0A==
X-CSE-MsgGUID: 2wvhiocTSIeJeE8M1TbSWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="65288789"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="65288789"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 00:12:56 -0700
X-CSE-ConnectionGUID: g9L/2y7uQyiSvL1rV3EFfg==
X-CSE-MsgGUID: XS9mrYiLSDGIAd6VPe1Rhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="120366918"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa006.fm.intel.com with ESMTP; 12 Mar 2025 00:12:52 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v4 10/23] drm/i915/color: Add helper to create intel colorop
Date: Wed, 12 Mar 2025 12:54:12 +0530
Message-ID: <20250312072425.3099205-11-uma.shankar@intel.com>
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

Add intel colorop create helper

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 39 ++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_color.h |  3 ++
 2 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index cfe14162231d..615f7bb9dc09 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3937,6 +3937,45 @@ static const struct intel_color_funcs ilk_color_funcs = {
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
index 9d66457c1e89..a9f229e37317 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -14,6 +14,7 @@ struct intel_crtc;
 struct intel_display;
 struct intel_dsb;
 struct drm_property_blob;
+enum intel_color_block;
 
 void intel_color_init_hooks(struct intel_display *display);
 int intel_color_init(struct intel_display *display);
@@ -38,5 +39,7 @@ bool intel_color_lut_equal(const struct intel_crtc_state *crtc_state,
 			   const struct drm_property_blob *blob2,
 			   bool is_pre_csc_lut);
 void intel_color_assert_luts(const struct intel_crtc_state *crtc_state);
+struct intel_plane_colorop *intel_colorop_alloc(void);
+struct intel_plane_colorop *intel_plane_colorop_create(enum intel_color_block id);
 
 #endif /* __INTEL_COLOR_H__ */
-- 
2.42.0

