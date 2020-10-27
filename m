Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F1929BE20
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 17:56:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C35B26EBD0;
	Tue, 27 Oct 2020 16:56:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97666EBB5;
 Tue, 27 Oct 2020 16:56:26 +0000 (UTC)
IronPort-SDR: dHiJXDgu5XRR4lixXR2Dmi72QNQYewxcDiA0thlfqznShgDnc/b1utEkajQkp2cczhZ2uIZ18p
 x69iZBp0uwOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9787"; a="147975842"
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; d="scan'208";a="147975842"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 09:56:26 -0700
IronPort-SDR: oS4C0nvRFfIwz0zpX7CWgq2E9+StrWGxr+zH6PH+Aanb7HTdP+Bj7JfMZ4cxm/UtIhsjs/DNb6
 BWPXt3UnPtKA==
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; d="scan'208";a="355613189"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2020 09:56:24 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 09/16] drm/i915/hdcp: Encapsulate hdcp_port_data to dig_port
Date: Tue, 27 Oct 2020 22:12:01 +0530
Message-Id: <20201027164208.10026-10-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201027164208.10026-1-anshuman.gupta@intel.com>
References: <20201027164208.10026-1-anshuman.gupta@intel.com>
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
Cc: jani.nikula@intel.com, uma.shankar@intel.com, seanpaul@chromium.org,
 Anshuman Gupta <anshuman.gupta@intel.com>, juston.li@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hdcp_port_data is specific to a port on which HDCP
encryption is getting enabled, so encapsulate it to
intel_digital_port.
This will be required to enable HDCP 2.2 stream encryption.

Cc: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c      |  2 +
 .../drm/i915/display/intel_display_types.h    |  5 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 56 +++++++++++--------
 3 files changed, 39 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 779603a38cfc..1bc6cf0b83ec 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4746,6 +4746,8 @@ static void intel_ddi_encoder_destroy(struct drm_encoder *encoder)
 	intel_dp_encoder_flush_work(encoder);
 
 	drm_encoder_cleanup(encoder);
+	if (dig_port)
+		kfree(dig_port->port_data.streams);
 	kfree(dig_port);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 59b8fc21e3e8..749c3a7e0b45 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -402,7 +402,6 @@ struct intel_hdcp {
 	 * content can flow only through a link protected by HDCP2.2.
 	 */
 	u8 content_type;
-	struct hdcp_port_data port_data;
 
 	bool is_paired;
 	bool is_repeater;
@@ -1446,10 +1445,12 @@ struct intel_digital_port {
 	enum phy_fia tc_phy_fia;
 	u8 tc_phy_fia_idx;
 
-	/* protects num_hdcp_streams reference count */
+	/* protects num_hdcp_streams reference count, port_data */
 	struct mutex hdcp_mutex;
 	/* the number of pipes using HDCP signalling out of this port */
 	unsigned int num_hdcp_streams;
+	/* HDCP port data need to pass to security f/w */
+	struct hdcp_port_data port_data;
 
 	void (*write_infoframe)(struct intel_encoder *encoder,
 				const struct intel_crtc_state *crtc_state,
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index b0f47687bc59..a5ec4f72f50f 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -15,6 +15,7 @@
 #include <drm/drm_hdcp.h>
 #include <drm/i915_component.h>
 
+#include "i915_drv.h"
 #include "i915_reg.h"
 #include "intel_display_power.h"
 #include "intel_display_types.h"
@@ -1028,7 +1029,8 @@ static int
 hdcp2_prepare_ake_init(struct intel_connector *connector,
 		       struct hdcp2_ake_init *ake_data)
 {
-	struct hdcp_port_data *data = &connector->hdcp.port_data;
+	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
+	struct hdcp_port_data *data = &dig_port->port_data;
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct i915_hdcp_comp_master *comp;
 	int ret;
@@ -1057,7 +1059,8 @@ hdcp2_verify_rx_cert_prepare_km(struct intel_connector *connector,
 				struct hdcp2_ake_no_stored_km *ek_pub_km,
 				size_t *msg_sz)
 {
-	struct hdcp_port_data *data = &connector->hdcp.port_data;
+	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
+	struct hdcp_port_data *data = &dig_port->port_data;
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct i915_hdcp_comp_master *comp;
 	int ret;
@@ -1084,7 +1087,8 @@ hdcp2_verify_rx_cert_prepare_km(struct intel_connector *connector,
 static int hdcp2_verify_hprime(struct intel_connector *connector,
 			       struct hdcp2_ake_send_hprime *rx_hprime)
 {
-	struct hdcp_port_data *data = &connector->hdcp.port_data;
+	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
+	struct hdcp_port_data *data = &dig_port->port_data;
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct i915_hdcp_comp_master *comp;
 	int ret;
@@ -1109,7 +1113,8 @@ static int
 hdcp2_store_pairing_info(struct intel_connector *connector,
 			 struct hdcp2_ake_send_pairing_info *pairing_info)
 {
-	struct hdcp_port_data *data = &connector->hdcp.port_data;
+	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
+	struct hdcp_port_data *data = &dig_port->port_data;
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct i915_hdcp_comp_master *comp;
 	int ret;
@@ -1135,7 +1140,8 @@ static int
 hdcp2_prepare_lc_init(struct intel_connector *connector,
 		      struct hdcp2_lc_init *lc_init)
 {
-	struct hdcp_port_data *data = &connector->hdcp.port_data;
+	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
+	struct hdcp_port_data *data = &dig_port->port_data;
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct i915_hdcp_comp_master *comp;
 	int ret;
@@ -1161,7 +1167,8 @@ static int
 hdcp2_verify_lprime(struct intel_connector *connector,
 		    struct hdcp2_lc_send_lprime *rx_lprime)
 {
-	struct hdcp_port_data *data = &connector->hdcp.port_data;
+	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
+	struct hdcp_port_data *data = &dig_port->port_data;
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct i915_hdcp_comp_master *comp;
 	int ret;
@@ -1186,7 +1193,8 @@ hdcp2_verify_lprime(struct intel_connector *connector,
 static int hdcp2_prepare_skey(struct intel_connector *connector,
 			      struct hdcp2_ske_send_eks *ske_data)
 {
-	struct hdcp_port_data *data = &connector->hdcp.port_data;
+	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
+	struct hdcp_port_data *data = &dig_port->port_data;
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct i915_hdcp_comp_master *comp;
 	int ret;
@@ -1214,7 +1222,8 @@ hdcp2_verify_rep_topology_prepare_ack(struct intel_connector *connector,
 								*rep_topology,
 				      struct hdcp2_rep_send_ack *rep_send_ack)
 {
-	struct hdcp_port_data *data = &connector->hdcp.port_data;
+	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
+	struct hdcp_port_data *data = &dig_port->port_data;
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct i915_hdcp_comp_master *comp;
 	int ret;
@@ -1242,7 +1251,8 @@ static int
 hdcp2_verify_mprime(struct intel_connector *connector,
 		    struct hdcp2_rep_stream_ready *stream_ready)
 {
-	struct hdcp_port_data *data = &connector->hdcp.port_data;
+	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
+	struct hdcp_port_data *data = &dig_port->port_data;
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct i915_hdcp_comp_master *comp;
 	int ret;
@@ -1265,7 +1275,8 @@ hdcp2_verify_mprime(struct intel_connector *connector,
 
 static int hdcp2_authenticate_port(struct intel_connector *connector)
 {
-	struct hdcp_port_data *data = &connector->hdcp.port_data;
+	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
+	struct hdcp_port_data *data = &dig_port->port_data;
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct i915_hdcp_comp_master *comp;
 	int ret;
@@ -1289,6 +1300,7 @@ static int hdcp2_authenticate_port(struct intel_connector *connector)
 
 static int hdcp2_close_mei_session(struct intel_connector *connector)
 {
+	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct i915_hdcp_comp_master *comp;
 	int ret;
@@ -1302,7 +1314,7 @@ static int hdcp2_close_mei_session(struct intel_connector *connector)
 	}
 
 	ret = comp->ops->close_hdcp_session(comp->mei_dev,
-					     &connector->hdcp.port_data);
+					     &dig_port->port_data);
 	mutex_unlock(&dev_priv->hdcp_comp_mutex);
 
 	return ret;
@@ -1495,8 +1507,9 @@ int _hdcp2_propagate_stream_management_info(struct intel_connector *connector)
 	if (ret < 0)
 		goto out;
 
-	hdcp->port_data.seq_num_m = hdcp->seq_num_m;
-	hdcp->port_data.streams[0].stream_type = hdcp->content_type;
+	dig_port->port_data.seq_num_m = hdcp->seq_num_m;
+	dig_port->port_data.streams[0].stream_type = hdcp->content_type;
+
 	ret = hdcp2_verify_mprime(connector, &msgs.stream_ready);
 
 out:
@@ -1728,7 +1741,9 @@ hdcp2_propagate_stream_management_info(struct intel_connector *connector)
 
 static int hdcp2_authenticate_and_encrypt(struct intel_connector *connector)
 {
+	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct hdcp_port_data *data = &dig_port->port_data;
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	int ret, i, tries = 3;
 
@@ -1742,8 +1757,7 @@ static int hdcp2_authenticate_and_encrypt(struct intel_connector *connector)
 					    ret);
 				break;
 			}
-			hdcp->port_data.streams[0].stream_type =
-							hdcp->content_type;
+			data->streams[0].stream_type = hdcp->content_type;
 			ret = hdcp2_authenticate_port(connector);
 			if (!ret)
 				break;
@@ -1986,8 +2000,8 @@ static int initialize_hdcp_port_data(struct intel_connector *connector,
 				     const struct intel_hdcp_shim *shim)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct hdcp_port_data *data = &dig_port->port_data;
 	struct intel_hdcp *hdcp = &connector->hdcp;
-	struct hdcp_port_data *data = &hdcp->port_data;
 	enum port port = dig_port->base.port;
 
 	if (INTEL_GEN(dev_priv) < 12)
@@ -2009,16 +2023,15 @@ static int initialize_hdcp_port_data(struct intel_connector *connector,
 	data->port_type = (u8)HDCP_PORT_TYPE_INTEGRATED;
 	data->protocol = (u8)shim->protocol;
 
-	data->k = 1;
 	if (!data->streams)
-		data->streams = kcalloc(data->k,
+		data->streams = kcalloc(INTEL_NUM_PIPES(dev_priv),
 					sizeof(struct hdcp2_streamid_type),
 					GFP_KERNEL);
 	if (!data->streams) {
 		drm_err(&dev_priv->drm, "Out of Memory\n");
 		return -ENOMEM;
 	}
-
+	/* For SST */
 	data->streams[0].stream_id = 0;
 	data->streams[0].stream_type = hdcp->content_type;
 
@@ -2097,7 +2110,7 @@ int intel_hdcp_init(struct intel_connector *connector,
 							 hdcp->hdcp2_supported);
 	if (ret) {
 		hdcp->hdcp2_supported = false;
-		kfree(hdcp->port_data.streams);
+		kfree(dig_port->port_data.streams);
 		return ret;
 	}
 
@@ -2137,7 +2150,7 @@ int intel_hdcp_enable(struct intel_connector *connector,
 	}
 
 	if (INTEL_GEN(dev_priv) >= 12)
-		hdcp->port_data.fw_tc = intel_get_mei_fw_tc(hdcp->cpu_transcoder);
+		dig_port->port_data.fw_tc = intel_get_mei_fw_tc(hdcp->cpu_transcoder);
 
 	/*
 	 * Considering that HDCP2.2 is more secure than HDCP1.4, If the setup
@@ -2307,7 +2320,6 @@ void intel_hdcp_cleanup(struct intel_connector *connector)
 	drm_WARN_ON(connector->base.dev, work_pending(&hdcp->prop_work));
 
 	mutex_lock(&hdcp->mutex);
-	kfree(hdcp->port_data.streams);
 	hdcp->shim = NULL;
 	mutex_unlock(&hdcp->mutex);
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
