Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFDAA4FFE1
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:14:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C15210E7A9;
	Wed,  5 Mar 2025 13:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OE3cuUTI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD5F410E797;
 Wed,  5 Mar 2025 13:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741180487; x=1772716487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CemSat/J9An2HLqe2BOKC7kZk5l2mDnugkMBiWXwY9s=;
 b=OE3cuUTID4fOIvOCB/bjtBTnuaSnzcoVwH9umTQsdnShBzCXtfc4Hd6O
 3d0umfm9UY0PWOCcXX5ZcePZ+8b+SMtqJvoUbAmpG3dOEzR4VaJbENLpg
 CyxzurmEzINkfCsv2jCaCKzPImRaq8lzItu1zKCxE3n6bjRgL+nEoJi+7
 5H6LjULElbYz69TR7IeMEBo1EOB+PCMQ6JHaVnlbBogrRf/gRqU6jSb8l
 Mt6XLXfOWNvNLAf7Ni0smk4N1O7QIkPQfudvPtt9URydSnofWkCeponzr
 D2/RCUND5F3emjQ1jecAHwIzI2oF7i8WUWuXXA/8XJDdnDfNfPcGVcD5y g==;
X-CSE-ConnectionGUID: m37Wgl+xThiz6em0Kq+YTA==
X-CSE-MsgGUID: /0elmc8jTVyrZyy4GsRYfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59685502"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="59685502"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 05:14:47 -0800
X-CSE-ConnectionGUID: Aj4dWFfUTvu/qappRYR1BQ==
X-CSE-MsgGUID: TrxuSIsbT6Cv7tXGse0+gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="118701137"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa006.jf.intel.com with ESMTP; 05 Mar 2025 05:14:42 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 dmitry.baryshkov@linaro.org,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v3 10/23] drm/i915/color: Add helper to create intel colorop
Date: Wed,  5 Mar 2025 18:55:55 +0530
Message-ID: <20250305132608.2379253-11-uma.shankar@intel.com>
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

