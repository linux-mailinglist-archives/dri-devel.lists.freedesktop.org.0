Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EF7852935
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 07:42:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BBDE10E8FA;
	Tue, 13 Feb 2024 06:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nui7u64R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE2110E90C;
 Tue, 13 Feb 2024 06:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707806536; x=1739342536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9+i+3+iSzymsCHDxFOBYiATibLBrcnq+hQdah3XfQDQ=;
 b=Nui7u64R/msVo4WPDsakso1hRXcf5Ql8tQ9kNzSApKWpgXM0cCGFkEUg
 nopC55jBQD/Ws/gnjilJ5wLswLniWdHB3upcVcATWDVIKZMr7I9McGkud
 z+qVENKzVf8aB+kdQ9WF0klid7Ln+fnM7l8nYDeuUQzIHCBUj6QntppVL
 MkLq6xi/CsZ7k9Xsj7HUR9BlE9orclmosG/RV0S93gpYNeBXNyffR1/8l
 5H/oQt7w9oA7eMhQvwLDq+7u6QxIadsxFdKP2YtRdyxKqDsRLL0dZ5trb
 z3LPmKfEa/M8Q2GzD4guzcMeDac0HlxYQEFdQz1BaRLvXYDrgpcy8hWdW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="436948037"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="436948037"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:42:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7450456"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa003.jf.intel.com with ESMTP; 12 Feb 2024 22:42:09 -0800
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
Subject: [PATCH 15/28] drm/i915/color: Add helper to create intel colorop
Date: Tue, 13 Feb 2024 12:18:22 +0530
Message-ID: <20240213064835.139464-16-uma.shankar@intel.com>
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

Add intel colorop create helper

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 14 ++++++++++++++
 drivers/gpu/drm/i915/display/intel_color.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 949c2efe105f..e187135d4363 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3835,6 +3835,20 @@ struct intel_plane_colorop *intel_colorop_alloc(void)
 	return colorop;
 }
 
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
 	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
index e111d115724c..d03dad425671 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -12,6 +12,7 @@ struct intel_crtc_state;
 struct intel_crtc;
 struct drm_i915_private;
 struct drm_property_blob;
+enum intel_color_block;
 
 void intel_color_init_hooks(struct drm_i915_private *i915);
 int intel_color_init(struct drm_i915_private *i915);
@@ -32,5 +33,6 @@ bool intel_color_lut_equal(const struct intel_crtc_state *crtc_state,
 			   bool is_pre_csc_lut);
 void intel_color_assert_luts(const struct intel_crtc_state *crtc_state);
 struct intel_plane_colorop *intel_colorop_alloc(void);
+struct intel_plane_colorop *intel_plane_colorop_create(enum intel_color_block id);
 
 #endif /* __INTEL_COLOR_H__ */
-- 
2.42.0

