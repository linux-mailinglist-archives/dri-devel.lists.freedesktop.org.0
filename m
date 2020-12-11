Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C74932D7716
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 14:57:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53176EE07;
	Fri, 11 Dec 2020 13:56:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190306EE09;
 Fri, 11 Dec 2020 13:56:58 +0000 (UTC)
IronPort-SDR: Tnr0S7pHWG8dTx6Mq8EJX0t4MAE19RtPHFMHsQ3QL/DAjEwB78HiCDXNnFQp0OJAoUoVA64Th8
 xutwIm+ZZ6Xg==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="162187718"
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="162187718"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 05:56:57 -0800
IronPort-SDR: LfZwC3QM015mxHvphcsAdzw6KqONSW4fA98YUMgpANhrVGhITYr0AKLLBES566FZwliFkDBA8Y
 1yhdy0beWytw==
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="409228409"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 05:56:54 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 10/19] drm/i915/hdcp: Pass dig_port to intel_hdcp_init
Date: Fri, 11 Dec 2020 19:12:35 +0530
Message-Id: <20201211134244.14588-11-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201211134244.14588-1-anshuman.gupta@intel.com>
References: <20201211134244.14588-1-anshuman.gupta@intel.com>
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
Cc: jani.nikula@intel.com, Karthik B S <karthik.b.s@intel.com>,
 uma.shankar@intel.com, seanpaul@chromium.org,
 Anshuman Gupta <anshuman.gupta@intel.com>, juston.li@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pass dig_port as an argument to intel_hdcp_init()
and intel_hdcp2_init().
This will be required for HDCP 2.2 stream encryption.

Cc: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
Tested-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c |  4 ++--
 drivers/gpu/drm/i915/display/intel_hdcp.c    | 12 +++++++-----
 drivers/gpu/drm/i915/display/intel_hdcp.h    |  4 +++-
 drivers/gpu/drm/i915/display/intel_hdmi.c    |  2 +-
 4 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
index 94c5462fa037..3f23f8b53dcd 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
@@ -755,10 +755,10 @@ int intel_dp_init_hdcp(struct intel_digital_port *dig_port,
 		return 0;
 
 	if (intel_connector->mst_port)
-		return intel_hdcp_init(intel_connector, port,
+		return intel_hdcp_init(intel_connector, dig_port,
 				       &intel_dp_mst_hdcp_shim);
 	else if (!intel_dp_is_edp(intel_dp))
-		return intel_hdcp_init(intel_connector, port,
+		return intel_hdcp_init(intel_connector, dig_port,
 				       &intel_dp_hdcp_shim);
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index fce444d69521..4ad086e7ec3c 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -1979,12 +1979,13 @@ static enum mei_fw_tc intel_get_mei_fw_tc(enum transcoder cpu_transcoder)
 }
 
 static int initialize_hdcp_port_data(struct intel_connector *connector,
-				     enum port port,
+				     struct intel_digital_port *dig_port,
 				     const struct intel_hdcp_shim *shim)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	struct hdcp_port_data *data = &hdcp->port_data;
+	enum port port = dig_port->base.port;
 
 	if (INTEL_GEN(dev_priv) < 12)
 		data->fw_ddi = intel_get_mei_fw_ddi_index(port);
@@ -2057,14 +2058,15 @@ void intel_hdcp_component_init(struct drm_i915_private *dev_priv)
 	}
 }
 
-static void intel_hdcp2_init(struct intel_connector *connector, enum port port,
+static void intel_hdcp2_init(struct intel_connector *connector,
+			     struct intel_digital_port *dig_port,
 			     const struct intel_hdcp_shim *shim)
 {
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	int ret;
 
-	ret = initialize_hdcp_port_data(connector, port, shim);
+	ret = initialize_hdcp_port_data(connector, dig_port, shim);
 	if (ret) {
 		drm_dbg_kms(&i915->drm, "Mei hdcp data init failed\n");
 		return;
@@ -2074,7 +2076,7 @@ static void intel_hdcp2_init(struct intel_connector *connector, enum port port,
 }
 
 int intel_hdcp_init(struct intel_connector *connector,
-		    enum port port,
+		    struct intel_digital_port *dig_port,
 		    const struct intel_hdcp_shim *shim)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
@@ -2085,7 +2087,7 @@ int intel_hdcp_init(struct intel_connector *connector,
 		return -EINVAL;
 
 	if (is_hdcp2_supported(dev_priv) && !connector->mst_port)
-		intel_hdcp2_init(connector, port, shim);
+		intel_hdcp2_init(connector, dig_port, shim);
 
 	ret =
 	drm_connector_attach_content_protection_property(&connector->base,
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.h b/drivers/gpu/drm/i915/display/intel_hdcp.h
index b912a3a0f5b8..8f53b0c7fe5c 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.h
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.h
@@ -18,13 +18,15 @@ struct intel_connector;
 struct intel_crtc_state;
 struct intel_encoder;
 struct intel_hdcp_shim;
+struct intel_digital_port;
 enum port;
 enum transcoder;
 
 void intel_hdcp_atomic_check(struct drm_connector *connector,
 			     struct drm_connector_state *old_state,
 			     struct drm_connector_state *new_state);
-int intel_hdcp_init(struct intel_connector *connector, enum port port,
+int intel_hdcp_init(struct intel_connector *connector,
+		    struct intel_digital_port *dig_port,
 		    const struct intel_hdcp_shim *hdcp_shim);
 int intel_hdcp_enable(struct intel_connector *connector,
 		      const struct intel_crtc_state *pipe_config, u8 content_type);
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index e07216142a15..25d76460f8f9 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -3292,7 +3292,7 @@ void intel_hdmi_init_connector(struct intel_digital_port *dig_port,
 	intel_hdmi->attached_connector = intel_connector;
 
 	if (is_hdcp_supported(dev_priv, port)) {
-		int ret = intel_hdcp_init(intel_connector, port,
+		int ret = intel_hdcp_init(intel_connector, dig_port,
 					  &intel_hdmi_hdcp_shim);
 		if (ret)
 			drm_dbg_kms(&dev_priv->drm,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
