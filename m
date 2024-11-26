Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1169D984D
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 14:20:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5312710E897;
	Tue, 26 Nov 2024 13:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JAuB/QjH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2638810E88A;
 Tue, 26 Nov 2024 13:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732627217; x=1764163217;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KIoR5H9PQcxEEwJJNmoVEtxlNskPgQoSyr5X2UVk4ac=;
 b=JAuB/QjHq6lyPe/uiMTYmbfBvDkaoYahHMY/AcMOxAwdr/RACSajEA9w
 gzNiApWnMkEpUjHqeqYE+cqujDvbljw4CD3k16qWsTxkIQxFJqOU0yB3p
 D+KqK4mQ+K3s0o5HaDT0xbaGoVLCBdkxb3PD93gTf/g2j9oK0v+wA7hR6
 WkFyfuAg7r1IPF6nV/Lvk4ChgJmTNRsUZi/i/JIhSehhNaSQFUvOFe2hU
 mczj/PGNgaxKtcorckqj/KXeXHTIolwS9bEYw7QMeDW+B/cTa3vp8H3xx
 zMqpstOuh+fMeGzJSz2BvVTi4xCACpMOURX9aOp/3K073R+nUHOykz4bV g==;
X-CSE-ConnectionGUID: DAD4oLgtS8SuepJ7i3Cd/g==
X-CSE-MsgGUID: qcHogdAMTCOChAtj+uembg==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="44170247"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="44170247"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 05:20:16 -0800
X-CSE-ConnectionGUID: CcAcq3Q6R3K6EBn2LtKDYw==
X-CSE-MsgGUID: Emql6SbfRhqpza9wtvRMvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="114874742"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2024 05:20:12 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v2 12/25] drm/i915/color: Add helper to create intel colorop
Date: Tue, 26 Nov 2024 18:57:17 +0530
Message-ID: <20241126132730.1192571-13-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20241126132730.1192571-1-uma.shankar@intel.com>
References: <20241126132730.1192571-1-uma.shankar@intel.com>
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
index 174753625bca..29a2463cbe7f 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3910,6 +3910,45 @@ static const struct intel_color_funcs ilk_color_funcs = {
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

