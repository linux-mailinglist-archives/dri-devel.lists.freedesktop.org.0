Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 630102C4FD9
	for <lists+dri-devel@lfdr.de>; Thu, 26 Nov 2020 08:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF2E6E5A3;
	Thu, 26 Nov 2020 07:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A0B6E865;
 Thu, 26 Nov 2020 07:52:11 +0000 (UTC)
IronPort-SDR: WSSKVbyC9ZayxwYDzNwvuqFv8aqhfRSxEYzWD2Vb5WSXkqNjJfpBLbvO+subR6trkDOxozZV7a
 bXasRmCZfL9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="152085009"
X-IronPort-AV: E=Sophos;i="5.78,371,1599548400"; d="scan'208";a="152085009"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2020 23:52:11 -0800
IronPort-SDR: 026Fx/VNIm/d7V9j22euPO3fbswFRT5Pp6sorEb1CgHttgd5NVG340PlPkEvsMa17gkQOezZcU
 MIXmvugRtJSQ==
X-IronPort-AV: E=Sophos;i="5.78,371,1599548400"; d="scan'208";a="535652621"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2020 23:52:08 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 17/18] drm/i915/hdcp: Support for HDCP 2.2 MST shim
 callbacks
Date: Thu, 26 Nov 2020 13:07:21 +0530
Message-Id: <20201126073722.19107-18-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201126073722.19107-1-anshuman.gupta@intel.com>
References: <20201126073722.19107-1-anshuman.gupta@intel.com>
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

Add support for HDCP 2.2 DP MST shim callback.
This adds existing DP HDCP shim callback for Link Authentication
and Encryption and HDCP 2.2 stream encryption
callback.

v2:
- Added a WARN_ON() instead of drm_err. [Uma]
- Cosmetic changes. [Uma]
v3:
- 's/port_data/hdcp_port_data' [Ram]
- skip redundant link check. [Ram]

Cc: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Tested-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 .../drm/i915/display/intel_display_types.h    |  4 +
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c  | 89 +++++++++++++++++--
 2 files changed, 85 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index bdeef5d2ce7a..a69120d8f9f6 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -374,6 +374,10 @@ struct intel_hdcp_shim {
 	int (*config_stream_type)(struct intel_digital_port *dig_port,
 				  bool is_repeater, u8 type);
 
+	/* Enable/Disable HDCP 2.2 stream encryption on DP MST Transport Link */
+	int (*stream_2_2_encryption)(struct intel_connector *connector,
+				     bool enable);
+
 	/* HDCP2.2 Link Integrity Check */
 	int (*check_2_2_link)(struct intel_digital_port *dig_port,
 			      struct intel_connector *connector);
diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
index 9ade1ad3a80c..33ec83dfe898 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
@@ -698,18 +698,14 @@ intel_dp_mst_hdcp_stream_encryption(struct intel_connector *connector,
 	return 0;
 }
 
-static
-bool intel_dp_mst_hdcp_check_link(struct intel_digital_port *dig_port,
-				  struct intel_connector *connector)
+static bool intel_dp_mst_get_qses_status(struct intel_digital_port *dig_port,
+					 struct intel_connector *connector)
 {
 	struct drm_i915_private *i915 = to_i915(dig_port->base.base.dev);
-	struct intel_dp *intel_dp = &dig_port->dp;
 	struct drm_dp_query_stream_enc_status_ack_reply reply;
+	struct intel_dp *intel_dp = &dig_port->dp;
 	int ret;
 
-	if (!intel_dp_hdcp_check_link(dig_port, connector))
-		return false;
-
 	ret = drm_dp_send_query_stream_enc_status(&intel_dp->mst_mgr,
 						  connector->port, &reply);
 	if (ret) {
@@ -726,6 +722,78 @@ bool intel_dp_mst_hdcp_check_link(struct intel_digital_port *dig_port,
 	return reply.auth_completed && reply.encryption_enabled;
 }
 
+static
+bool intel_dp_mst_hdcp_check_link(struct intel_digital_port *dig_port,
+				  struct intel_connector *connector)
+{
+	if (!intel_dp_hdcp_check_link(dig_port, connector))
+		return false;
+
+	return intel_dp_mst_get_qses_status(dig_port, connector);
+}
+
+static int
+intel_dp_mst_hdcp2_stream_encryption(struct intel_connector *connector,
+				     bool enable)
+{
+	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
+	struct drm_i915_private *i915 = to_i915(connector->base.dev);
+	struct intel_hdcp *hdcp = &connector->hdcp;
+	struct hdcp_port_data *data = &dig_port->hdcp_port_data;
+	enum port port = dig_port->base.port;
+	/* HDCP2.x register uses stream transcoder */
+	enum transcoder cpu_transcoder = hdcp->stream_transcoder;
+	int ret;
+
+	drm_WARN_ON(&i915->drm, enable &&
+		    !!(intel_de_read(i915, HDCP2_AUTH_STREAM(i915, cpu_transcoder, port))
+		    & AUTH_STREAM_TYPE) != data->streams[0].stream_type);
+
+	ret = intel_dp_mst_toggle_hdcp_stream_select(connector, enable);
+	if (ret)
+		return ret;
+
+	/* Wait for encryption confirmation */
+	if (intel_de_wait_for_register(i915,
+				       HDCP2_STREAM_STATUS(i915, cpu_transcoder, port),
+				       STREAM_ENCRYPTION_STATUS,
+				       enable ? STREAM_ENCRYPTION_STATUS : 0,
+				       HDCP_ENCRYPT_STATUS_CHANGE_TIMEOUT_MS)) {
+		drm_err(&i915->drm, "Timed out waiting for transcoder: %s stream encryption %s\n",
+			transcoder_name(cpu_transcoder), enable ? "enabled" : "disabled");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+/*
+ * DP v2.0 I.3.3 ignore the stream signature L' in QSES reply msg reply.
+ * I.3.5 MST source device may use a QSES msg to query downstream status
+ * for a particular stream.
+ */
+static
+int intel_dp_mst_hdcp2_check_link(struct intel_digital_port *dig_port,
+				  struct intel_connector *connector)
+{
+	struct intel_hdcp *hdcp = &connector->hdcp;
+	int ret;
+
+	/*
+	 * We do need to do the Link Check only for the connector involved with
+	 * HDCP port authentication and encryption.
+	 * We can re-use the hdcp->is_repeater flag to know that the connector
+	 * involved with HDCP port authentication and encryption.
+	 */
+	if (hdcp->is_repeater) {
+		ret = intel_dp_hdcp2_check_link(dig_port, connector);
+		if (ret)
+			return ret;
+	}
+
+	return intel_dp_mst_get_qses_status(dig_port, connector) ? 0 : -EINVAL;
+}
+
 static const struct intel_hdcp_shim intel_dp_mst_hdcp_shim = {
 	.write_an_aksv = intel_dp_hdcp_write_an_aksv,
 	.read_bksv = intel_dp_hdcp_read_bksv,
@@ -739,7 +807,12 @@ static const struct intel_hdcp_shim intel_dp_mst_hdcp_shim = {
 	.stream_encryption = intel_dp_mst_hdcp_stream_encryption,
 	.check_link = intel_dp_mst_hdcp_check_link,
 	.hdcp_capable = intel_dp_hdcp_capable,
-
+	.write_2_2_msg = intel_dp_hdcp2_write_msg,
+	.read_2_2_msg = intel_dp_hdcp2_read_msg,
+	.config_stream_type = intel_dp_hdcp2_config_stream_type,
+	.stream_2_2_encryption = intel_dp_mst_hdcp2_stream_encryption,
+	.check_2_2_link = intel_dp_mst_hdcp2_check_link,
+	.hdcp_2_2_capable = intel_dp_hdcp2_capable,
 	.protocol = HDCP_PROTOCOL_DP,
 };
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
