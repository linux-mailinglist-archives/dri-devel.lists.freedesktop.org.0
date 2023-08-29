Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B816A78C378
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 13:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F6D10E2AE;
	Tue, 29 Aug 2023 11:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80DB10E2A3;
 Tue, 29 Aug 2023 11:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693309196; x=1724845196;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HoHx0Sh39HmaSJi/svS11oUKKvytvDsCj9rx4Gw5tRo=;
 b=muNTSHLg5qf8xI9WZcRIip0iT9tydsQ+j1Aj6/J3Jib417r1K2JdmYmU
 cGFmdYiMcQbNUmsOuSgFluGcVZUsmLS/qSelAko6bMT4KJ+p+KqKm7uJY
 buik5rg7qlJdpgiJnzmgC2sv25fzFJ5m79mh59o2bE+8ZK5x9sSV4mda6
 zwNg02o1uBDxCWidpTfeu/0iJKbw6H47jXI+h9vB6prqJdNKfvMUUsUgD
 0+KQf9aMhhIOhUvGEtlSrHwGzzX4PTH1ucqhpff5/TjzSklKWDjfJm60z
 SZ7g/7JD0LfHowPkocEzTeng9H+FAP1+SihiUwTJavV/Gmhuj0GqzHeVt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="378063954"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="378063954"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 04:39:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="738669095"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="738669095"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.153])
 by orsmga002.jf.intel.com with SMTP; 29 Aug 2023 04:39:54 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 29 Aug 2023 14:39:53 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 09/12] drm/i915/hdmi: Use connector->ddc everwhere
Date: Tue, 29 Aug 2023 14:39:17 +0300
Message-ID: <20230829113920.13713-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
References: <20230829113920.13713-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

We already populate connector->ddc for HDMI ports, but
so far we've not taken full advantage of it. Do that by
eliminating a bunch of intel_gmbus_get_adapter() lookups.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c  |  3 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c | 37 ++++++++---------------
 2 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index e6cc4dab3201..d86ce93fb57f 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4323,8 +4323,7 @@ static int intel_hdmi_reset_link(struct intel_encoder *encoder,
 	struct drm_i915_private *dev_priv = to_i915(encoder->base.dev);
 	struct intel_hdmi *hdmi = enc_to_intel_hdmi(encoder);
 	struct intel_connector *connector = hdmi->attached_connector;
-	struct i2c_adapter *ddc =
-		intel_gmbus_get_adapter(dev_priv, hdmi->ddc_bus);
+	struct i2c_adapter *ddc = connector->base.ddc;
 	struct drm_connector_state *conn_state;
 	struct intel_crtc_state *crtc_state;
 	struct intel_crtc *crtc;
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 82f9a40b34e3..efa9bb93cfb1 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -1240,7 +1240,7 @@ static void hsw_set_infoframes(struct intel_encoder *encoder,
 void intel_dp_dual_mode_set_tmds_output(struct intel_hdmi *hdmi, bool enable)
 {
 	struct drm_i915_private *dev_priv = intel_hdmi_to_i915(hdmi);
-	struct i2c_adapter *ddc = intel_gmbus_get_adapter(dev_priv, hdmi->ddc_bus);
+	struct i2c_adapter *ddc = hdmi->attached_connector->base.ddc;
 
 	if (hdmi->dp_dual_mode.type < DRM_DP_DUAL_MODE_TYPE2_DVI)
 		return;
@@ -1255,9 +1255,8 @@ void intel_dp_dual_mode_set_tmds_output(struct intel_hdmi *hdmi, bool enable)
 static int intel_hdmi_hdcp_read(struct intel_digital_port *dig_port,
 				unsigned int offset, void *buffer, size_t size)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
 	struct intel_hdmi *hdmi = &dig_port->hdmi;
-	struct i2c_adapter *ddc = intel_gmbus_get_adapter(i915, hdmi->ddc_bus);
+	struct i2c_adapter *ddc = hdmi->attached_connector->base.ddc;
 	int ret;
 	u8 start = offset & 0xff;
 	struct i2c_msg msgs[] = {
@@ -1283,9 +1282,8 @@ static int intel_hdmi_hdcp_read(struct intel_digital_port *dig_port,
 static int intel_hdmi_hdcp_write(struct intel_digital_port *dig_port,
 				 unsigned int offset, void *buffer, size_t size)
 {
-	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
 	struct intel_hdmi *hdmi = &dig_port->hdmi;
-	struct i2c_adapter *ddc = intel_gmbus_get_adapter(i915, hdmi->ddc_bus);
+	struct i2c_adapter *ddc = hdmi->attached_connector->base.ddc;
 	int ret;
 	u8 *write_buf;
 	struct i2c_msg msg;
@@ -1318,7 +1316,7 @@ int intel_hdmi_hdcp_write_an_aksv(struct intel_digital_port *dig_port,
 {
 	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
 	struct intel_hdmi *hdmi = &dig_port->hdmi;
-	struct i2c_adapter *ddc = intel_gmbus_get_adapter(i915, hdmi->ddc_bus);
+	struct i2c_adapter *ddc = hdmi->attached_connector->base.ddc;
 	int ret;
 
 	ret = intel_hdmi_hdcp_write(dig_port, DRM_HDCP_DDC_AN, an,
@@ -2398,8 +2396,10 @@ intel_hdmi_dp_dual_mode_detect(struct drm_connector *connector)
 	struct drm_i915_private *dev_priv = to_i915(connector->dev);
 	struct intel_hdmi *hdmi = intel_attached_hdmi(to_intel_connector(connector));
 	struct intel_encoder *encoder = &hdmi_to_dig_port(hdmi)->base;
-	struct i2c_adapter *ddc = intel_gmbus_get_adapter(dev_priv, hdmi->ddc_bus);
-	enum drm_dp_dual_mode_type type = drm_dp_dual_mode_detect(&dev_priv->drm, ddc);
+	struct i2c_adapter *ddc = connector->ddc;
+	enum drm_dp_dual_mode_type type;
+
+	type = drm_dp_dual_mode_detect(&dev_priv->drm, ddc);
 
 	/*
 	 * Type 1 DVI adaptors are not required to implement any
@@ -2447,7 +2447,7 @@ intel_hdmi_set_edid(struct drm_connector *connector)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->dev);
 	struct intel_hdmi *intel_hdmi = intel_attached_hdmi(to_intel_connector(connector));
-	struct i2c_adapter *ddc = intel_gmbus_get_adapter(dev_priv, intel_hdmi->ddc_bus);
+	struct i2c_adapter *ddc = connector->ddc;
 	intel_wakeref_t wakeref;
 	const struct drm_edid *drm_edid;
 	const struct edid *edid;
@@ -2544,19 +2544,10 @@ static int intel_hdmi_get_modes(struct drm_connector *connector)
 	return drm_edid_connector_add_modes(connector);
 }
 
-static struct i2c_adapter *
-intel_hdmi_get_i2c_adapter(struct drm_connector *connector)
-{
-	struct drm_i915_private *dev_priv = to_i915(connector->dev);
-	struct intel_hdmi *intel_hdmi = intel_attached_hdmi(to_intel_connector(connector));
-
-	return intel_gmbus_get_adapter(dev_priv, intel_hdmi->ddc_bus);
-}
-
 static void intel_hdmi_create_i2c_symlink(struct drm_connector *connector)
 {
 	struct drm_i915_private *i915 = to_i915(connector->dev);
-	struct i2c_adapter *ddc = intel_hdmi_get_i2c_adapter(connector);
+	struct i2c_adapter *ddc = connector->ddc;
 	struct kobject *i2c_kobj = &ddc->dev.kobj;
 	struct kobject *connector_kobj = &connector->kdev->kobj;
 	int ret;
@@ -2568,7 +2559,7 @@ static void intel_hdmi_create_i2c_symlink(struct drm_connector *connector)
 
 static void intel_hdmi_remove_i2c_symlink(struct drm_connector *connector)
 {
-	struct i2c_adapter *ddc = intel_hdmi_get_i2c_adapter(connector);
+	struct i2c_adapter *ddc = connector->ddc;
 	struct kobject *i2c_kobj = &ddc->dev.kobj;
 	struct kobject *connector_kobj = &connector->kdev->kobj;
 
@@ -3007,7 +2998,6 @@ void intel_hdmi_init_connector(struct intel_digital_port *dig_port,
 	struct intel_encoder *intel_encoder = &dig_port->base;
 	struct drm_device *dev = intel_encoder->base.dev;
 	struct drm_i915_private *dev_priv = to_i915(dev);
-	struct i2c_adapter *ddc;
 	enum port port = intel_encoder->port;
 	struct cec_connector_info conn_info;
 
@@ -3028,12 +3018,11 @@ void intel_hdmi_init_connector(struct intel_digital_port *dig_port,
 	if (!intel_hdmi->ddc_bus)
 		return;
 
-	ddc = intel_gmbus_get_adapter(dev_priv, intel_hdmi->ddc_bus);
-
 	drm_connector_init_with_ddc(dev, connector,
 				    &intel_hdmi_connector_funcs,
 				    DRM_MODE_CONNECTOR_HDMIA,
-				    ddc);
+				    intel_gmbus_get_adapter(dev_priv, intel_hdmi->ddc_bus));
+
 	drm_connector_helper_add(connector, &intel_hdmi_connector_helper_funcs);
 
 	if (DISPLAY_VER(dev_priv) < 12)
-- 
2.41.0

