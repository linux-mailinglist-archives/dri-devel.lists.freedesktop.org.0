Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3407F741F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 13:44:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D663410E204;
	Fri, 24 Nov 2023 12:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E98E10E1F2;
 Fri, 24 Nov 2023 12:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700829876; x=1732365876;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v+jxSZJTFxEyHHnwP2evczv7VRFYUv1gkoBE9+3drEg=;
 b=L/TJpzZwKCnXmdWib+Vxu5vSGvUgya6yQvQa3AJrdEr6K/tHPso5A/lI
 pjxj60wkg/rmAwhXvWnRgeE4+p2v1xPOTXEReDnPr4hGgbgnX1924cuet
 O/J5pO3rANbLzQME+KWI/e4bOLF+WI/AxV103hBXiQAFv0vYaEOaw9D26
 D5Tcpz2aExiBYgwIopFC0/JCgvkn/+EO8NCij3IMcbrtEI4HHeQBbiOTo
 EbP/YFZpxehEqVEn9V/GCjHwhT2INwz0gqi5VrKzZZNp0gehsL1XugvSs
 EzPIk/L6fbKEzwsmofeiZ9phAMBkgHSh/qTz607nLzRC8miDdoCDz5Cak Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="396322618"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="396322618"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 04:44:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="891057756"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; d="scan'208";a="891057756"
Received: from dashah-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.41.230])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 04:44:34 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/8] drm/dp: switch drm_dp_vsc_sdp_log() to struct drm_printer
Date: Fri, 24 Nov 2023 14:44:00 +0200
Message-Id: <95f1e3981fa3c5304f3c74e82330f12983d35735.1700829750.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1700829750.git.jani.nikula@intel.com>
References: <cover.1700829750.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the existing drm printer infrastructure instead of local macros.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c       | 17 +++++-------
 .../drm/i915/display/intel_crtc_state_dump.c  |  5 ++--
 drivers/gpu/drm/i915/display/intel_display.c  | 27 +++++++++----------
 include/drm/display/drm_dp_helper.h           |  3 +--
 4 files changed, 23 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index d72b6f9a352c..1cf51a748022 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2898,22 +2898,19 @@ static const char *dp_content_type_get_name(enum dp_content_type content_type)
 	}
 }
 
-void drm_dp_vsc_sdp_log(const char *level, struct device *dev,
-			const struct drm_dp_vsc_sdp *vsc)
+void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc)
 {
-#define DP_SDP_LOG(fmt, ...) dev_printk(level, dev, fmt, ##__VA_ARGS__)
-	DP_SDP_LOG("DP SDP: %s, revision %u, length %u\n", "VSC",
+	drm_printf(p, "DP SDP: VSC, revision %u, length %u\n",
 		   vsc->revision, vsc->length);
-	DP_SDP_LOG("    pixelformat: %s\n",
+	drm_printf(p, "    pixelformat: %s\n",
 		   dp_pixelformat_get_name(vsc->pixelformat));
-	DP_SDP_LOG("    colorimetry: %s\n",
+	drm_printf(p, "    colorimetry: %s\n",
 		   dp_colorimetry_get_name(vsc->pixelformat, vsc->colorimetry));
-	DP_SDP_LOG("    bpc: %u\n", vsc->bpc);
-	DP_SDP_LOG("    dynamic range: %s\n",
+	drm_printf(p, "    bpc: %u\n", vsc->bpc);
+	drm_printf(p, "    dynamic range: %s\n",
 		   dp_dynamic_range_get_name(vsc->dynamic_range));
-	DP_SDP_LOG("    content type: %s\n",
+	drm_printf(p, "    content type: %s\n",
 		   dp_content_type_get_name(vsc->content_type));
-#undef DP_SDP_LOG
 }
 EXPORT_SYMBOL(drm_dp_vsc_sdp_log);
 
diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
index fbe89b6f038a..a6c55a357b13 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
@@ -55,10 +55,9 @@ static void
 intel_dump_dp_vsc_sdp(struct drm_i915_private *i915,
 		      const struct drm_dp_vsc_sdp *vsc)
 {
-	if (!drm_debug_enabled(DRM_UT_KMS))
-		return;
+	struct drm_printer p = drm_dbg_printer(&i915->drm, DRM_UT_KMS, NULL);
 
-	drm_dp_vsc_sdp_log(KERN_DEBUG, i915->drm.dev, vsc);
+	drm_dp_vsc_sdp_log(&p, vsc);
 }
 
 static void
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 5cf162628b95..5f05017570da 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -4799,28 +4799,27 @@ pipe_config_infoframe_mismatch(struct drm_i915_private *dev_priv,
 }
 
 static void
-pipe_config_dp_vsc_sdp_mismatch(struct drm_i915_private *dev_priv,
+pipe_config_dp_vsc_sdp_mismatch(struct drm_i915_private *i915,
 				bool fastset, const char *name,
 				const struct drm_dp_vsc_sdp *a,
 				const struct drm_dp_vsc_sdp *b)
 {
+	struct drm_printer p;
+
 	if (fastset) {
-		if (!drm_debug_enabled(DRM_UT_KMS))
-			return;
+		p = drm_dbg_printer(&i915->drm, DRM_UT_KMS, NULL);
 
-		drm_dbg_kms(&dev_priv->drm,
-			    "fastset requirement not met in %s dp sdp\n", name);
-		drm_dbg_kms(&dev_priv->drm, "expected:\n");
-		drm_dp_vsc_sdp_log(KERN_DEBUG, dev_priv->drm.dev, a);
-		drm_dbg_kms(&dev_priv->drm, "found:\n");
-		drm_dp_vsc_sdp_log(KERN_DEBUG, dev_priv->drm.dev, b);
+		drm_printf(&p, "fastset requirement not met in %s dp sdp\n", name);
 	} else {
-		drm_err(&dev_priv->drm, "mismatch in %s dp sdp\n", name);
-		drm_err(&dev_priv->drm, "expected:\n");
-		drm_dp_vsc_sdp_log(KERN_ERR, dev_priv->drm.dev, a);
-		drm_err(&dev_priv->drm, "found:\n");
-		drm_dp_vsc_sdp_log(KERN_ERR, dev_priv->drm.dev, b);
+		p = drm_err_printer(&i915->drm, NULL);
+
+		drm_printf(&p, "mismatch in %s dp sdp\n", name);
 	}
+
+	drm_printf(&p, "expected:\n");
+	drm_dp_vsc_sdp_log(&p, a);
+	drm_printf(&p, "found:\n");
+	drm_dp_vsc_sdp_log(&p, b);
 }
 
 /* Returns the length up to and including the last differing byte */
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 863b2e7add29..d02014a87f12 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -98,8 +98,7 @@ struct drm_dp_vsc_sdp {
 	enum dp_content_type content_type;
 };
 
-void drm_dp_vsc_sdp_log(const char *level, struct device *dev,
-			const struct drm_dp_vsc_sdp *vsc);
+void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc);
 
 int drm_dp_psr_setup_time(const u8 psr_cap[EDP_PSR_RECEIVER_CAP_SIZE]);
 
-- 
2.39.2

