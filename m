Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CBB852943
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 07:42:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6984810E999;
	Tue, 13 Feb 2024 06:42:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YTBgOBi1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF3C10E999;
 Tue, 13 Feb 2024 06:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707806565; x=1739342565;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=t002BZBhig4BuOS63N9Q9cvbB4gzTlY94w03LBUPYiQ=;
 b=YTBgOBi1eO3vzDxNaljHWVFeIFpn0UmIea8q7Jl3kUWVp7VtkTNFo18/
 XQVMYFcFo1HtFrwoWreEAqDvsIpKwapA0HppPaPMw7UAvIBvMcFr2NcBp
 EaSBaPnLcdli/u9j0p9/d09jotlXeguTWWBcPYWoO1Jf8dK6niATC60sN
 8KgmRnDiKEGItYGGa4qg/zsTHhgw6muFIncdm2DHwd7JtZgdW27O984+o
 H1xEU8/4ISZZscH0+YjTGvFT3Uouqub4T/rs+gbqdX1N3WxvDCGe/HngF
 ehTmj1+MBgMAQ9lQtdiv4mSwVtvKDJ2Rk1F4pIMT2FQNh6TPKfdQC13FL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="436948126"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="436948126"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:42:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7450561"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa003.jf.intel.com with ESMTP; 12 Feb 2024 22:42:38 -0800
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
Subject: [PATCH 19/28] drm/i915/color: Add framework to set colorop
Date: Tue, 13 Feb 2024 12:18:26 +0530
Message-ID: <20240213064835.139464-20-uma.shankar@intel.com>
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

Add infrastructure to set colorop. We iterate through all the color ops
in a selected COLOR PIPELINE and set them one by one.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 31 ++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_color.h |  3 +++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index d6d5e56b4f2c..06268e89125e 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3949,6 +3949,37 @@ struct intel_plane_colorop *intel_plane_colorop_create(enum intel_color_block id
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
 	struct intel_plane *intel_plane = to_intel_plane(plane);
diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
index df0e1f6be067..bde880370ecc 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -13,6 +13,7 @@ struct intel_crtc;
 struct drm_i915_private;
 struct drm_property_blob;
 struct drm_plane;
+struct drm_plane_state;
 struct drm_prop_enum_list;
 enum intel_color_block;
 
@@ -40,5 +41,7 @@ struct intel_plane_colorop *intel_colorop_alloc(void);
 struct intel_plane_colorop *intel_plane_colorop_create(enum intel_color_block id);
 int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_list *list);
 int intel_plane_color_init(struct drm_plane *plane);
+void intel_program_pipeline(const struct drm_plane_state *plane_state,
+			    u32 *plane_color_ctl);
 
 #endif /* __INTEL_COLOR_H__ */
-- 
2.42.0

