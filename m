Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCE2376658
	for <lists+dri-devel@lfdr.de>; Fri,  7 May 2021 15:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A6776E151;
	Fri,  7 May 2021 13:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785436E151
 for <dri-devel@lists.freedesktop.org>; Fri,  7 May 2021 13:43:10 +0000 (UTC)
IronPort-SDR: K1xSSRWaeNwSl/FKyAek5OYinGp7xvQ5EoYzosIv5xTjmB+WJU99SzAW7CqQMDnHR0XRy+YMgE
 KEc1Tt4XOiNw==
X-IronPort-AV: E=McAfee;i="6200,9189,9977"; a="262668907"
X-IronPort-AV: E=Sophos;i="5.82,280,1613462400"; d="scan'208";a="262668907"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2021 06:43:10 -0700
IronPort-SDR: deAgfMCrvHjWS1Q9+afl2P553AphXudVU1emLOowf6dVLFuMnQja5s9KuLA97iUoMdikDrWG4P
 bAtUEZnN9g4Q==
X-IronPort-AV: E=Sophos;i="5.82,280,1613462400"; d="scan'208";a="622860354"
Received: from unknown (HELO Nischal-desktop.iind.intel.com) ([10.223.74.174])
 by fmsmga005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 06:43:08 -0700
From: Nischal Varide <nischal.varide@intel.com>
To: dri-devel@lists.freedesktop.org, nischal.varide@intel.com,
 uma.shankar@intel.com, ankit.k.nautiyal@intel.com
Subject: [RFC v2 1/1] drm/i915/display: New Property Creation for HDMI
Date: Fri,  7 May 2021 12:20:44 +0530
Message-Id: <20210507065044.23465-2-nischal.varide@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210507065044.23465-1-nischal.varide@intel.com>
References: <20210507065044.23465-1-nischal.varide@intel.com>
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

Right now the HDMI properties like vendor and product ids are hardcoded
in the function "intel_hdmi_compute_spd_infoframe()".

ret = hdmi_spd_infoframe_init(frame, "Intel", "Integrated gfx").

This patch enables the possibility of setting vendor and product id fields
of the Infoframe structure in the userspace instead of hardcoding in
the kernel, and this will help display manufacturers preload picture
configurations for the devices.

The changes has been tested by an IGT testcase which got floated.

v2: Edited the commit message on comments received (Ville, Jani)
v1: Create new property for vendor and product id of HDMI.

Signed-off-by: Nischal Varide <nischal.varide@intel.com>
---
 drivers/gpu/drm/i915/display/intel_atomic.c   | 14 +++++++++++++
 .../gpu/drm/i915/display/intel_connector.c    | 20 +++++++++++++++++++
 .../gpu/drm/i915/display/intel_connector.h    |  1 +
 .../drm/i915/display/intel_display_types.h    |  5 +++++
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 14 ++++++++++++-
 drivers/gpu/drm/i915/display/intel_hdmi.h     |  5 +++++
 drivers/gpu/drm/i915/i915_drv.h               |  1 +
 7 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
index 45feaaddab26..4d38eeb9dd33 100644
--- a/drivers/gpu/drm/i915/display/intel_atomic.c
+++ b/drivers/gpu/drm/i915/display/intel_atomic.c
@@ -65,6 +65,9 @@ int intel_digital_connector_atomic_get_property(struct drm_connector *connector,
 		*val = intel_conn_state->force_audio;
 	else if (property == dev_priv->broadcast_rgb_property)
 		*val = intel_conn_state->broadcast_rgb;
+	else if (property ==  dev_priv->hdmi_vendor_product_property)
+		*val = (intel_conn_state->hdmi_vendor_product_blob)
+			? (intel_conn_state->hdmi_vendor_product_blob->base.id) : 0;
 	else {
 		drm_dbg_atomic(&dev_priv->drm,
 			       "Unknown property [PROP:%d:%s]\n",
@@ -93,6 +96,7 @@ int intel_digital_connector_atomic_set_property(struct drm_connector *connector,
 	struct drm_i915_private *dev_priv = to_i915(dev);
 	struct intel_digital_connector_state *intel_conn_state =
 		to_intel_digital_connector_state(state);
+	struct drm_property_blob *new_blob = NULL;
 
 	if (property == dev_priv->force_audio_property) {
 		intel_conn_state->force_audio = val;
@@ -104,6 +108,16 @@ int intel_digital_connector_atomic_set_property(struct drm_connector *connector,
 		return 0;
 	}
 
+	if (property ==  dev_priv->hdmi_vendor_product_property) {
+		new_blob = drm_property_lookup_blob(dev, val);
+		if (new_blob == NULL)
+			return -EINVAL;
+		if (drm_property_replace_blob
+			(&intel_conn_state->hdmi_vendor_product_blob, new_blob)) {
+			drm_property_blob_put(new_blob);
+			return 0;
+		}
+	}
 	drm_dbg_atomic(&dev_priv->drm, "Unknown property [PROP:%d:%s]\n",
 		       property->base.id, property->name);
 	return -EINVAL;
diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/drm/i915/display/intel_connector.c
index d5ceb7bdc14b..c4ce8f70e752 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.c
+++ b/drivers/gpu/drm/i915/display/intel_connector.c
@@ -269,6 +269,26 @@ intel_attach_broadcast_rgb_property(struct drm_connector *connector)
 	drm_object_attach_property(&connector->base, prop, 0);
 }
 
+void
+intel_attach_hdmi_vendor_product_property(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_i915_private *dev_priv = to_i915(dev);
+	struct drm_property *prop;
+
+	prop = dev_priv->hdmi_vendor_product_property;
+	if (!prop) {
+		prop = drm_property_create(dev, DRM_MODE_PROP_BLOB |
+			DRM_MODE_PROP_ATOMIC, "hdmi_vendor_product", 0);
+		if (!prop)
+			return;
+
+		dev_priv->hdmi_vendor_product_property = prop;
+	}
+
+	drm_object_attach_property(&connector->base, prop, 0);
+}
+
 void
 intel_attach_aspect_ratio_property(struct drm_connector *connector)
 {
diff --git a/drivers/gpu/drm/i915/display/intel_connector.h b/drivers/gpu/drm/i915/display/intel_connector.h
index 661a37a3c6d8..9e16e098f53a 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.h
+++ b/drivers/gpu/drm/i915/display/intel_connector.h
@@ -27,6 +27,7 @@ enum pipe intel_connector_get_pipe(struct intel_connector *connector);
 int intel_connector_update_modes(struct drm_connector *connector,
 				 struct edid *edid);
 int intel_ddc_get_modes(struct drm_connector *c, struct i2c_adapter *adapter);
+void intel_attach_hdmi_vendor_product_property(struct drm_connector *connector);
 void intel_attach_force_audio_property(struct drm_connector *connector);
 void intel_attach_broadcast_rgb_property(struct drm_connector *connector);
 void intel_attach_aspect_ratio_property(struct drm_connector *connector);
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 6d8cdaa36748..d29f54163044 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -549,6 +549,11 @@ struct intel_digital_connector_state {
 
 	enum hdmi_force_audio force_audio;
 	int broadcast_rgb;
+	/*
+	 * hdmi_infoframe metadata
+	 * DRM blob with hdmi vendor and product info
+	 */
+	struct drm_property_blob *hdmi_vendor_product_blob;
 };
 
 #define to_intel_digital_connector_state(x) container_of(x, struct intel_digital_connector_state, base)
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 28e297296160..6bda096b411d 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -762,6 +762,9 @@ intel_hdmi_compute_spd_infoframe(struct intel_encoder *encoder,
 {
 	struct hdmi_spd_infoframe *frame = &crtc_state->infoframes.spd.spd;
 	int ret;
+	struct hdmi_vendor_product_info *hdmi_vp_info;
+	struct intel_digital_connector_state *intel_conn_state =
+		to_intel_digital_connector_state(conn_state);
 
 	if (!crtc_state->has_infoframe)
 		return true;
@@ -769,7 +772,15 @@ intel_hdmi_compute_spd_infoframe(struct intel_encoder *encoder,
 	crtc_state->infoframes.enable |=
 		intel_hdmi_infoframe_enable(HDMI_INFOFRAME_TYPE_SPD);
 
-	ret = hdmi_spd_infoframe_init(frame, "Intel", "Integrated gfx");
+	if (!intel_conn_state->hdmi_vendor_product_blob) {
+		ret = hdmi_spd_infoframe_init(frame, "intel", "Integrated gfx");
+	} else {
+		if (intel_conn_state->hdmi_vendor_product_blob->data) {
+			hdmi_vp_info = intel_conn_state->hdmi_vendor_product_blob->data;
+			ret = hdmi_spd_infoframe_init(frame, hdmi_vp_info->vendor,
+					hdmi_vp_info->product);
+		}
+	}
 	if (drm_WARN_ON(encoder->base.dev, ret))
 		return false;
 
@@ -2456,6 +2467,7 @@ intel_hdmi_add_properties(struct intel_hdmi *intel_hdmi, struct drm_connector *c
 	intel_attach_force_audio_property(connector);
 	intel_attach_broadcast_rgb_property(connector);
 	intel_attach_aspect_ratio_property(connector);
+	intel_attach_hdmi_vendor_product_property(connector);
 
 	intel_attach_hdmi_colorspace_property(connector);
 	drm_connector_attach_content_type_property(connector);
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h b/drivers/gpu/drm/i915/display/intel_hdmi.h
index b43a180d007e..5be7179389d1 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.h
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
@@ -23,6 +23,11 @@ struct drm_connector_state;
 union hdmi_infoframe;
 enum port;
 
+/*Vendor Id and Product Id for the Hdmi property exported to Userspace*/
+struct hdmi_vendor_product_info {
+	char vendor[30];
+	char product[30];
+};
 void intel_hdmi_init_connector(struct intel_digital_port *dig_port,
 			       struct intel_connector *intel_connector);
 int intel_hdmi_compute_config(struct intel_encoder *encoder,
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 3cfa6effbb5f..9e3373c0f1eb 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1014,6 +1014,7 @@ struct drm_i915_private {
 
 	struct drm_property *broadcast_rgb_property;
 	struct drm_property *force_audio_property;
+	struct drm_property *hdmi_vendor_product_property;
 
 	/* hda/i915 audio component */
 	struct i915_audio_component *audio_component;
-- 
2.29.2

