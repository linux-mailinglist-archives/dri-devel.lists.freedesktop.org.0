Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BD91ADCAB
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 13:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1446EBBA;
	Fri, 17 Apr 2020 11:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3B66EBB8;
 Fri, 17 Apr 2020 11:58:28 +0000 (UTC)
IronPort-SDR: nVfirB0KeVb5q7gvce5UjWtfY393mdFld8YCHrzqQC1irzYKILvWVRfGzXtVf+Djt9PKE4Anj1
 m24G6ys98Iag==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2020 04:58:28 -0700
IronPort-SDR: 5o+sNLW3BC0gYE1qIO0thJIrrRP46Iw/RvTPdm+X97FHJ26Mb7onxas6yDkrZ0bcEEzxXAKoOC
 2joFSHAqPHIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,394,1580803200"; d="scan'208";a="279492029"
Received: from elewis-mobl.ger.corp.intel.com (HELO
 helsinki.ger.corp.intel.com) ([10.251.94.8])
 by orsmga008.jf.intel.com with ESMTP; 17 Apr 2020 04:58:26 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 09/14] drm/i915: Add state readout for DP VSC SDP
Date: Fri, 17 Apr 2020 15:00:35 +0300
Message-Id: <20200417120040.3432332-10-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200417120040.3432332-1-gwan-gyeong.mun@intel.com>
References: <20200417120040.3432332-1-gwan-gyeong.mun@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, jani.nikula@intel.com,
 dri-devel@lists.freedesktop.org, uma.shankar@intel.com,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Added state readout for DP VSC SDP and enabled state validation
for DP VSC SDP.

v2: Minor style fix
v3: Replace a structure name to drm_dp_vsc_sdp from intel_dp_vsc_sdp
v4: Use struct drm_device logging macros
v10: Skip checking of VSC SDP when a crtc config has psr.

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c     |  1 +
 drivers/gpu/drm/i915/display/intel_display.c | 44 ++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 5dbb54b88d0e..bb26ea665540 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4218,6 +4218,7 @@ void intel_ddi_get_config(struct intel_encoder *encoder,
 		bdw_get_trans_port_sync_config(pipe_config);
 
 	intel_read_dp_sdp(encoder, pipe_config, HDMI_PACKET_TYPE_GAMUT_METADATA);
+	intel_read_dp_sdp(encoder, pipe_config, DP_SDP_VSC);
 }
 
 static enum intel_output_type
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 332d857ad455..2e20c3447cb6 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -13467,6 +13467,13 @@ intel_compare_infoframe(const union hdmi_infoframe *a,
 	return memcmp(a, b, sizeof(*a)) == 0;
 }
 
+static bool
+intel_compare_dp_vsc_sdp(const struct drm_dp_vsc_sdp *a,
+			 const struct drm_dp_vsc_sdp *b)
+{
+	return memcmp(a, b, sizeof(*a)) == 0;
+}
+
 static void
 pipe_config_infoframe_mismatch(struct drm_i915_private *dev_priv,
 			       bool fastset, const char *name,
@@ -13492,6 +13499,31 @@ pipe_config_infoframe_mismatch(struct drm_i915_private *dev_priv,
 	}
 }
 
+static void
+pipe_config_dp_vsc_sdp_mismatch(struct drm_i915_private *dev_priv,
+				bool fastset, const char *name,
+				const struct drm_dp_vsc_sdp *a,
+				const struct drm_dp_vsc_sdp *b)
+{
+	if (fastset) {
+		if (!drm_debug_enabled(DRM_UT_KMS))
+			return;
+
+		drm_dbg_kms(&dev_priv->drm,
+			    "fastset mismatch in %s dp sdp\n", name);
+		drm_dbg_kms(&dev_priv->drm, "expected:\n");
+		drm_dp_vsc_sdp_log(KERN_DEBUG, dev_priv->drm.dev, a);
+		drm_dbg_kms(&dev_priv->drm, "found:\n");
+		drm_dp_vsc_sdp_log(KERN_DEBUG, dev_priv->drm.dev, b);
+	} else {
+		drm_err(&dev_priv->drm, "mismatch in %s dp sdp\n", name);
+		drm_err(&dev_priv->drm, "expected:\n");
+		drm_dp_vsc_sdp_log(KERN_ERR, dev_priv->drm.dev, a);
+		drm_err(&dev_priv->drm, "found:\n");
+		drm_dp_vsc_sdp_log(KERN_ERR, dev_priv->drm.dev, b);
+	}
+}
+
 static void __printf(4, 5)
 pipe_config_mismatch(bool fastset, const struct intel_crtc *crtc,
 		     const char *name, const char *format, ...)
@@ -13693,6 +13725,17 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 	} \
 } while (0)
 
+#define PIPE_CONF_CHECK_DP_VSC_SDP(name) do { \
+	if (!current_config->has_psr && !pipe_config->has_psr && \
+	    !intel_compare_dp_vsc_sdp(&current_config->infoframes.name, \
+				      &pipe_config->infoframes.name)) { \
+		pipe_config_dp_vsc_sdp_mismatch(dev_priv, fastset, __stringify(name), \
+						&current_config->infoframes.name, \
+						&pipe_config->infoframes.name); \
+		ret = false; \
+	} \
+} while (0)
+
 #define PIPE_CONF_CHECK_COLOR_LUT(name1, name2, bit_precision) do { \
 	if (current_config->name1 != pipe_config->name1) { \
 		pipe_config_mismatch(fastset, crtc, __stringify(name1), \
@@ -13868,6 +13911,7 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
 	PIPE_CONF_CHECK_INFOFRAME(spd);
 	PIPE_CONF_CHECK_INFOFRAME(hdmi);
 	PIPE_CONF_CHECK_INFOFRAME(drm);
+	PIPE_CONF_CHECK_DP_VSC_SDP(vsc);
 
 	PIPE_CONF_CHECK_X(sync_mode_slaves_mask);
 	PIPE_CONF_CHECK_I(master_transcoder);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
