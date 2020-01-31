Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE8A14F41D
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 22:47:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13A86FC16;
	Fri, 31 Jan 2020 21:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5026FC18;
 Fri, 31 Jan 2020 21:47:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 13:47:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,387,1574150400"; d="scan'208";a="262691501"
Received: from helsinki.fi.intel.com ([10.237.66.145])
 by fmsmga002.fm.intel.com with ESMTP; 31 Jan 2020 13:47:24 -0800
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 14/18] drm/i915: Add state readout for DP VSC SDP
Date: Fri, 31 Jan 2020 23:46:57 +0200
Message-Id: <20200131214701.1085737-15-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200131214701.1085737-1-gwan-gyeong.mun@intel.com>
References: <20200131214701.1085737-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Added state readout for DP VSC SDP and enabled state validation
for DP VSC SDP.

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c     |  1 +
 drivers/gpu/drm/i915/display/intel_display.c | 43 ++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index a9eaf7a6bc15..64e4edefa998 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4391,6 +4391,7 @@ void intel_ddi_get_config(struct intel_encoder *encoder,
 			     &pipe_config->infoframes.drm);
 
 	intel_read_dp_sdp(encoder, pipe_config, HDMI_PACKET_TYPE_GAMUT_METADATA);
+	intel_read_dp_sdp(encoder, pipe_config, DP_SDP_VSC);
 }
 
 static enum intel_output_type
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 7d298f14799d..d13f70596a84 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -13503,6 +13503,13 @@ intel_compare_infoframe(const union hdmi_infoframe *a,
 	return memcmp(a, b, sizeof(*a)) == 0;
 }
 
+static bool
+intel_compare_dp_vsc_sdp(const struct intel_dp_vsc_sdp *a,
+			 const struct intel_dp_vsc_sdp *b)
+{
+	return memcmp(a, b, sizeof(*a)) == 0;
+}
+
 static void
 pipe_config_infoframe_mismatch(struct drm_i915_private *dev_priv,
 			       bool fastset, const char *name,
@@ -13528,6 +13535,30 @@ pipe_config_infoframe_mismatch(struct drm_i915_private *dev_priv,
 	}
 }
 
+static void
+pipe_config_dp_vsc_sdp_mismatch(struct drm_i915_private *dev_priv,
+				bool fastset, const char *name,
+				const struct intel_dp_vsc_sdp *a,
+				const struct intel_dp_vsc_sdp *b)
+{
+	if (fastset) {
+		if (!drm_debug_enabled(DRM_UT_KMS))
+			return;
+
+		DRM_DEBUG_KMS("fastset mismatch in %s dp sdp\n", name);
+		DRM_DEBUG_KMS("expected:\n");
+		intel_dp_vsc_sdp_log(KERN_DEBUG, dev_priv->drm.dev, a);
+		DRM_DEBUG_KMS("found:\n");
+		intel_dp_vsc_sdp_log(KERN_DEBUG, dev_priv->drm.dev, b);
+	} else {
+		DRM_ERROR("mismatch in %s dp sdp\n", name);
+		DRM_ERROR("expected:\n");
+		intel_dp_vsc_sdp_log(KERN_ERR, dev_priv->drm.dev, a);
+		DRM_ERROR("found:\n");
+		intel_dp_vsc_sdp_log(KERN_ERR, dev_priv->drm.dev, b);
+	}
+}
+
 static void __printf(4, 5)
 pipe_config_mismatch(bool fastset, const struct intel_crtc *crtc,
 		     const char *name, const char *format, ...)
@@ -13729,6 +13760,17 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 	} \
 } while (0)
 
+#define PIPE_CONF_CHECK_DP_VSC_SDP(name) do { \
+	if (!intel_compare_dp_vsc_sdp(&current_config->infoframes.name, \
+				      &pipe_config->infoframes.name)) { \
+		pipe_config_dp_vsc_sdp_mismatch(dev_priv, fastset, __stringify(name), \
+						&current_config->infoframes.name, \
+						&pipe_config->infoframes.name); \
+		ret = false; \
+	} \
+} while (0)
+
+
 #define PIPE_CONF_CHECK_COLOR_LUT(name1, name2, bit_precision) do { \
 	if (current_config->name1 != pipe_config->name1) { \
 		pipe_config_mismatch(fastset, crtc, __stringify(name1), \
@@ -13902,6 +13944,7 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 	PIPE_CONF_CHECK_INFOFRAME(spd);
 	PIPE_CONF_CHECK_INFOFRAME(hdmi);
 	PIPE_CONF_CHECK_INFOFRAME(drm);
+	PIPE_CONF_CHECK_DP_VSC_SDP(vsc);
 
 	PIPE_CONF_CHECK_X(sync_mode_slaves_mask);
 	PIPE_CONF_CHECK_I(master_transcoder);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
