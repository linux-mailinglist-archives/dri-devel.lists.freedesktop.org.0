Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF6A293DBC
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 15:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5536ECC4;
	Tue, 20 Oct 2020 13:50:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312906ECC2;
 Tue, 20 Oct 2020 13:50:09 +0000 (UTC)
IronPort-SDR: 6VPu6McpwDbeG1SIUl5lrlv5sen/cbx4WkDOWR+ktzlopVcT866aVmHq+h1940EQjHpg/dJqYo
 0aIrKi8ZO8lA==
X-IronPort-AV: E=McAfee;i="6000,8403,9779"; a="184837550"
X-IronPort-AV: E=Sophos;i="5.77,397,1596524400"; d="scan'208";a="184837550"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 06:50:08 -0700
IronPort-SDR: xO88XNnHMWhMLF4wYpUhaB8NJrgBQFv4/xJqsIZzU8j4Nn4n3+R2BTwBopQIK7K5Whi9OrcrZB
 fISFzb+02FOA==
X-IronPort-AV: E=Sophos;i="5.77,397,1596524400"; d="scan'208";a="465935089"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 06:50:06 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 11/15] drm/i915/hdcp: mst streams support in hdcp port_data
Date: Tue, 20 Oct 2020 19:09:02 +0530
Message-Id: <20201020133906.23710-12-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201020133906.23710-1-anshuman.gupta@intel.com>
References: <20201020133906.23710-1-anshuman.gupta@intel.com>
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
Cc: jani.nikula@intel.com, seanpaul@chromium.org, juston.li@intel.com,
 Anshuman Gupta <anshuman.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for multiple mst stream in hdcp port data
which will be used by RepeaterAuthStreamManage msg and
HDCP 2.2 security f/w for m' validation.

v2:
Init the hdcp port data k for HDMI/DP SST strem.

Cc: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |   4 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 100 +++++++++++++++---
 2 files changed, 90 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index cde99ad969b3..fbdeaac17bc4 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1443,10 +1443,12 @@ struct intel_digital_port {
 	enum phy_fia tc_phy_fia;
 	u8 tc_phy_fia_idx;
 
-	/* protects num_hdcp_streams reference count, port_data */
+	/* protects num_hdcp_streams reference count, port_data and port_auth */
 	struct mutex hdcp_mutex;
 	/* the number of pipes using HDCP signalling out of this port */
 	unsigned int num_hdcp_streams;
+	/* port HDCP auth status */
+	bool port_auth;
 	/* HDCP port data need to pass to security f/w */
 	struct hdcp_port_data port_data;
 
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 1a6ac24efe2d..ef0e33cfbe8e 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -26,6 +26,62 @@
 #define KEY_LOAD_TRIES	5
 #define HDCP2_LC_RETRY_CNT			3
 
+static int intel_conn_to_vcpi(struct intel_connector *connector)
+{
+	/* For HDMI this is forced to be 0x0. For DP SST also this is 0x0. */
+	return connector->port	? connector->port->vcpi.vcpi : 0;
+}
+
+static int
+intel_hdcp_required_content_stream(struct intel_digital_port *dig_port)
+{
+	struct drm_connector_list_iter conn_iter;
+	struct intel_digital_port *conn_dig_port;
+	struct intel_connector *connector;
+	struct intel_hdcp *hdcp;
+	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
+	struct hdcp_port_data *data = &dig_port->port_data;
+	bool enforce_type0 = false;
+	int k;
+
+	if (dig_port->port_auth)
+		return 0;
+
+	drm_connector_list_iter_begin(&i915->drm, &conn_iter);
+	for_each_intel_connector_iter(connector, &conn_iter) {
+		if (!intel_encoder_is_mst(intel_attached_encoder(connector)))
+			continue;
+
+		conn_dig_port = intel_attached_dig_port(connector);
+		if (conn_dig_port != dig_port)
+			continue;
+
+		if (connector->base.status == connector_status_disconnected)
+			continue;
+
+		hdcp = &connector->hdcp;
+		if (!enforce_type0 && (hdcp->content_type && !intel_hdcp2_capable(connector)))
+			enforce_type0 = true;
+
+		data->streams[data->k].stream_id = intel_conn_to_vcpi(connector);
+		data->k++;
+
+		/* if there is only one active stream */
+		if (dig_port->dp.active_mst_links <= 1)
+			break;
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
+	if (drm_WARN_ON(&i915->drm, data->k > INTEL_NUM_PIPES(i915) || data->k == 0))
+		return -EINVAL;
+
+	for (k = 0; k < data->k; k++)
+		data->streams[k].stream_type =
+			enforce_type0 ? DRM_MODE_HDCP_CONTENT_TYPE0 : hdcp->content_type;
+
+	return 0;
+}
+
 static
 bool intel_hdcp_is_ksv_valid(u8 *ksv)
 {
@@ -1296,6 +1352,7 @@ static int hdcp2_authenticate_port(struct intel_connector *connector)
 	if (ret < 0)
 		drm_dbg_kms(&dev_priv->drm, "Enable hdcp auth failed. %d\n",
 			    ret);
+
 	mutex_unlock(&dev_priv->hdcp_comp_mutex);
 
 	return ret;
@@ -1477,13 +1534,14 @@ static
 int _hdcp2_propagate_stream_management_info(struct intel_connector *connector)
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
+	struct hdcp_port_data *data = &dig_port->port_data;
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	union {
 		struct hdcp2_rep_stream_manage stream_manage;
 		struct hdcp2_rep_stream_ready stream_ready;
 	} msgs;
 	const struct intel_hdcp_shim *shim = hdcp->shim;
-	int ret;
+	int ret, streams_size_delta, i;
 
 	if (connector->hdcp.seq_num_m > HDCP_2_2_SEQ_NUM_MAX)
 		return -ERANGE;
@@ -1493,15 +1551,18 @@ int _hdcp2_propagate_stream_management_info(struct intel_connector *connector)
 	drm_hdcp_cpu_to_be24(msgs.stream_manage.seq_num_m, hdcp->seq_num_m);
 
 	/* K no of streams is fixed as 1. Stored as big-endian. */
-	msgs.stream_manage.k = cpu_to_be16(1);
+	msgs.stream_manage.k = cpu_to_be16(data->k);
 
-	/* For HDMI this is forced to be 0x0. For DP SST also this is 0x0. */
-	msgs.stream_manage.streams[0].stream_id = 0;
-	msgs.stream_manage.streams[0].stream_type = hdcp->content_type;
+	for (i = 0; i < data->k; i++) {
+		msgs.stream_manage.streams[i].stream_id = data->streams[i].stream_id;
+		msgs.stream_manage.streams[i].stream_type = data->streams[i].stream_type;
+	}
 
+	streams_size_delta = HDCP_2_2_MAX_CONTENT_STREAMS_CNT *
+		sizeof(struct hdcp2_streamid_type) - data->k * sizeof(struct hdcp2_streamid_type);
 	/* Send it to Repeater */
 	ret = shim->write_2_2_msg(dig_port, &msgs.stream_manage,
-				  sizeof(msgs.stream_manage));
+				  sizeof(msgs.stream_manage) - streams_size_delta);
 	if (ret < 0)
 		goto out;
 
@@ -1510,8 +1571,7 @@ int _hdcp2_propagate_stream_management_info(struct intel_connector *connector)
 	if (ret < 0)
 		goto out;
 
-	dig_port->port_data.seq_num_m = hdcp->seq_num_m;
-	dig_port->port_data.streams[0].stream_type = hdcp->content_type;
+	data->seq_num_m = hdcp->seq_num_m;
 
 	ret = hdcp2_verify_mprime(connector, &msgs.stream_ready);
 
@@ -1672,6 +1732,7 @@ static int hdcp2_enable_encryption(struct intel_connector *connector)
 						 port),
 				    LINK_ENCRYPTION_STATUS,
 				    HDCP_ENCRYPT_STATUS_CHANGE_TIMEOUT_MS);
+	dig_port->port_auth = true;
 
 	return ret;
 }
@@ -1746,11 +1807,9 @@ static int hdcp2_authenticate_and_encrypt(struct intel_connector *connector)
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
-	struct hdcp_port_data *data = &dig_port->port_data;
-	struct intel_hdcp *hdcp = &connector->hdcp;
-	int ret, i, tries = 3;
+	int ret = 0, i, tries = 3;
 
-	for (i = 0; i < tries; i++) {
+	for (i = 0; i < tries && !dig_port->port_auth; i++) {
 		ret = hdcp2_authenticate_sink(connector);
 		if (!ret) {
 			ret = hdcp2_propagate_stream_management_info(connector);
@@ -1760,7 +1819,7 @@ static int hdcp2_authenticate_and_encrypt(struct intel_connector *connector)
 					    ret);
 				break;
 			}
-			data->streams[0].stream_type = hdcp->content_type;
+
 			ret = hdcp2_authenticate_port(connector);
 			if (!ret)
 				break;
@@ -1795,7 +1854,9 @@ static int hdcp2_authenticate_and_encrypt(struct intel_connector *connector)
 
 static int _intel_hdcp2_enable(struct intel_connector *connector)
 {
+	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct hdcp_port_data *data = &dig_port->port_data;
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	int ret;
 
@@ -1803,6 +1864,15 @@ static int _intel_hdcp2_enable(struct intel_connector *connector)
 		    connector->base.name, connector->base.base.id,
 		    hdcp->content_type);
 
+	/* Stream which requires encryption */
+	if (!intel_encoder_is_mst(intel_attached_encoder(connector))) {
+		data->k = 1;
+	} else {
+		ret = intel_hdcp_required_content_stream(dig_port);
+		if (ret)
+			return ret;
+	}
+
 	ret = hdcp2_authenticate_and_encrypt(connector);
 	if (ret) {
 		drm_dbg_kms(&i915->drm, "HDCP2 Type%d  Enabling Failed. (%d)\n",
@@ -1820,7 +1890,9 @@ static int _intel_hdcp2_enable(struct intel_connector *connector)
 
 static int _intel_hdcp2_disable(struct intel_connector *connector)
 {
+	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct hdcp_port_data *data = &dig_port->port_data;
 	int ret;
 
 	drm_dbg_kms(&i915->drm, "[%s:%d] HDCP2.2 is being Disabled\n",
@@ -1832,6 +1904,8 @@ static int _intel_hdcp2_disable(struct intel_connector *connector)
 		drm_dbg_kms(&i915->drm, "Port deauth failed.\n");
 
 	connector->hdcp.hdcp2_encrypted = false;
+	dig_port->port_auth = false;
+	data->k = 0;
 
 	return ret;
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
