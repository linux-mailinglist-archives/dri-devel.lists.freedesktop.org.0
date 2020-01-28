Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B030A14C091
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 20:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B8E6F387;
	Tue, 28 Jan 2020 19:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376D86E118;
 Tue, 28 Jan 2020 19:06:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 10:28:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,374,1574150400"; d="scan'208";a="310821223"
Received: from plaxmina-desktop.iind.intel.com ([10.145.162.62])
 by fmsmga001.fm.intel.com with ESMTP; 28 Jan 2020 10:28:50 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ramalingam C <ramalingam.c@intel.com>
Subject: [Intel-gfx] [PATCH v5 13/21] drm/i915/display/hdmi: Make WARN* drm
 specific where drm_device ptr is available
Date: Tue, 28 Jan 2020 23:45:55 +0530
Message-Id: <20200128181603.27767-14-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200128181603.27767-1-pankaj.laxminarayan.bharadiya@intel.com>
References: <20200128181603.27767-1-pankaj.laxminarayan.bharadiya@intel.com>
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm specific WARN* calls include device information in the
backtrace, so we know what device the warnings originate from.

Covert all the calls of WARN* with device specific drm_WARN*
variants in functions where drm_device or drm_i915_private struct
pointer is readily available.

The conversion was done automatically with below coccinelle semantic
patch.

@rule1@
identifier func, T;
@@
func(...) {
...
struct drm_device *T = ...;
<...
(
-WARN(
+drm_WARN(T,
...)
|
-WARN_ON(
+drm_WARN_ON(T,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(T,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(T,
...)
)
...>
}

@rule2@
identifier func, T;
@@
func(struct drm_device *T,...) {
<...
(
-WARN(
+drm_WARN(T,
...)
|
-WARN_ON(
+drm_WARN_ON(T,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(T,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(T,
...)
)
...>
}

@rule3@
identifier func, T;
@@
func(...) {
...
struct drm_i915_private *T = ...;
<+...
(
-WARN(
+drm_WARN(&T->drm,
...)
|
-WARN_ON(
+drm_WARN_ON(&T->drm,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(&T->drm,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(&T->drm,
...)
)
...+>
}

@rule4@
identifier func, T;
@@
func(struct drm_i915_private *T,...) {
<+...
(
-WARN(
+drm_WARN(&T->drm,
...)
|
-WARN_ON(
+drm_WARN_ON(&T->drm,
...)
|
-WARN_ONCE(
+drm_WARN_ONCE(&T->drm,
...)
|
-WARN_ON_ONCE(
+drm_WARN_ON_ONCE(&T->drm,
...)
)
...+>
}

Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 52 +++++++++++++----------
 1 file changed, 29 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index ab13cf834cc4..e68bafb76cb1 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -72,17 +72,19 @@ assert_hdmi_port_disabled(struct intel_hdmi *intel_hdmi)
 
 	enabled_bits = HAS_DDI(dev_priv) ? DDI_BUF_CTL_ENABLE : SDVO_ENABLE;
 
-	WARN(intel_de_read(dev_priv, intel_hdmi->hdmi_reg) & enabled_bits,
-	     "HDMI port enabled, expecting disabled\n");
+	drm_WARN(dev,
+		 intel_de_read(dev_priv, intel_hdmi->hdmi_reg) & enabled_bits,
+		 "HDMI port enabled, expecting disabled\n");
 }
 
 static void
 assert_hdmi_transcoder_func_disabled(struct drm_i915_private *dev_priv,
 				     enum transcoder cpu_transcoder)
 {
-	WARN(intel_de_read(dev_priv, TRANS_DDI_FUNC_CTL(cpu_transcoder)) &
-	     TRANS_DDI_FUNC_ENABLE,
-	     "HDMI transcoder function enabled, expecting disabled\n");
+	drm_WARN(&dev_priv->drm,
+		 intel_de_read(dev_priv, TRANS_DDI_FUNC_CTL(cpu_transcoder)) &
+		 TRANS_DDI_FUNC_ENABLE,
+		 "HDMI transcoder function enabled, expecting disabled\n");
 }
 
 struct intel_hdmi *enc_to_intel_hdmi(struct intel_encoder *encoder)
@@ -218,7 +220,8 @@ static void g4x_write_infoframe(struct intel_encoder *encoder,
 	u32 val = intel_de_read(dev_priv, VIDEO_DIP_CTL);
 	int i;
 
-	WARN(!(val & VIDEO_DIP_ENABLE), "Writing DIP with CTL reg disabled\n");
+	drm_WARN(&dev_priv->drm, !(val & VIDEO_DIP_ENABLE),
+		 "Writing DIP with CTL reg disabled\n");
 
 	val &= ~(VIDEO_DIP_SELECT_MASK | 0xf); /* clear DIP data offset */
 	val |= g4x_infoframe_index(type);
@@ -291,7 +294,8 @@ static void ibx_write_infoframe(struct intel_encoder *encoder,
 	u32 val = intel_de_read(dev_priv, reg);
 	int i;
 
-	WARN(!(val & VIDEO_DIP_ENABLE), "Writing DIP with CTL reg disabled\n");
+	drm_WARN(&dev_priv->drm, !(val & VIDEO_DIP_ENABLE),
+		 "Writing DIP with CTL reg disabled\n");
 
 	val &= ~(VIDEO_DIP_SELECT_MASK | 0xf); /* clear DIP data offset */
 	val |= g4x_infoframe_index(type);
@@ -369,7 +373,8 @@ static void cpt_write_infoframe(struct intel_encoder *encoder,
 	u32 val = intel_de_read(dev_priv, reg);
 	int i;
 
-	WARN(!(val & VIDEO_DIP_ENABLE), "Writing DIP with CTL reg disabled\n");
+	drm_WARN(&dev_priv->drm, !(val & VIDEO_DIP_ENABLE),
+		 "Writing DIP with CTL reg disabled\n");
 
 	val &= ~(VIDEO_DIP_SELECT_MASK | 0xf); /* clear DIP data offset */
 	val |= g4x_infoframe_index(type);
@@ -446,7 +451,8 @@ static void vlv_write_infoframe(struct intel_encoder *encoder,
 	u32 val = intel_de_read(dev_priv, reg);
 	int i;
 
-	WARN(!(val & VIDEO_DIP_ENABLE), "Writing DIP with CTL reg disabled\n");
+	drm_WARN(&dev_priv->drm, !(val & VIDEO_DIP_ENABLE),
+		 "Writing DIP with CTL reg disabled\n");
 
 	val &= ~(VIDEO_DIP_SELECT_MASK | 0xf); /* clear DIP data offset */
 	val |= g4x_infoframe_index(type);
@@ -528,7 +534,7 @@ static void hsw_write_infoframe(struct intel_encoder *encoder,
 
 	data_size = hsw_dip_data_size(dev_priv, type);
 
-	WARN_ON(len > data_size);
+	drm_WARN_ON(&dev_priv->drm, len > data_size);
 
 	val &= ~hsw_infoframe_enable(type);
 	intel_de_write(dev_priv, ctl_reg, val);
@@ -852,7 +858,7 @@ intel_hdmi_compute_drm_infoframe(struct intel_encoder *encoder,
 	}
 
 	ret = hdmi_drm_infoframe_check(frame);
-	if (WARN_ON(ret))
+	if (drm_WARN_ON(&dev_priv->drm, ret))
 		return false;
 
 	return true;
@@ -1070,9 +1076,9 @@ static void ibx_set_infoframes(struct intel_encoder *encoder,
 	}
 
 	if (port != (val & VIDEO_DIP_PORT_MASK)) {
-		WARN(val & VIDEO_DIP_ENABLE,
-		     "DIP already enabled on port %c\n",
-		     (val & VIDEO_DIP_PORT_MASK) >> 29);
+		drm_WARN(&dev_priv->drm, val & VIDEO_DIP_ENABLE,
+			 "DIP already enabled on port %c\n",
+			 (val & VIDEO_DIP_PORT_MASK) >> 29);
 		val &= ~VIDEO_DIP_PORT_MASK;
 		val |= port;
 	}
@@ -1177,9 +1183,9 @@ static void vlv_set_infoframes(struct intel_encoder *encoder,
 	}
 
 	if (port != (val & VIDEO_DIP_PORT_MASK)) {
-		WARN(val & VIDEO_DIP_ENABLE,
-		     "DIP already enabled on port %c\n",
-		     (val & VIDEO_DIP_PORT_MASK) >> 29);
+		drm_WARN(&dev_priv->drm, val & VIDEO_DIP_ENABLE,
+			 "DIP already enabled on port %c\n",
+			 (val & VIDEO_DIP_PORT_MASK) >> 29);
 		val &= ~VIDEO_DIP_PORT_MASK;
 		val |= port;
 	}
@@ -3011,7 +3017,7 @@ static u8 icl_port_to_ddc_pin(struct drm_i915_private *dev_priv, enum port port)
 	else if (intel_phy_is_tc(dev_priv, phy))
 		return GMBUS_PIN_9_TC1_ICP + intel_port_to_tc(dev_priv, port);
 
-	WARN(1, "Unknown port:%c\n", port_name(port));
+	drm_WARN(&dev_priv->drm, 1, "Unknown port:%c\n", port_name(port));
 	return GMBUS_PIN_2_BXT;
 }
 
@@ -3148,13 +3154,13 @@ void intel_hdmi_init_connector(struct intel_digital_port *intel_dig_port,
 	DRM_DEBUG_KMS("Adding HDMI connector on [ENCODER:%d:%s]\n",
 		      intel_encoder->base.base.id, intel_encoder->base.name);
 
-	if (INTEL_GEN(dev_priv) < 12 && WARN_ON(port == PORT_A))
+	if (INTEL_GEN(dev_priv) < 12 && drm_WARN_ON(dev, port == PORT_A))
 		return;
 
-	if (WARN(intel_dig_port->max_lanes < 4,
-		 "Not enough lanes (%d) for HDMI on [ENCODER:%d:%s]\n",
-		 intel_dig_port->max_lanes, intel_encoder->base.base.id,
-		 intel_encoder->base.name))
+	if (drm_WARN(dev, intel_dig_port->max_lanes < 4,
+		     "Not enough lanes (%d) for HDMI on [ENCODER:%d:%s]\n",
+		     intel_dig_port->max_lanes, intel_encoder->base.base.id,
+		     intel_encoder->base.name))
 		return;
 
 	intel_hdmi->ddc_bus = intel_hdmi_ddc_pin(intel_encoder);
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
