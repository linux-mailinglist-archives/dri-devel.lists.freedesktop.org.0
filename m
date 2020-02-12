Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6AA15A4E6
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 10:35:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D386E802;
	Wed, 12 Feb 2020 09:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1BC6E56D;
 Wed, 12 Feb 2020 09:35:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Feb 2020 01:35:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; d="scan'208";a="406240244"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.154])
 by orsmga005.jf.intel.com with ESMTP; 12 Feb 2020 01:35:05 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/5] drm/i915: terminate reauth at stream management failure
Date: Wed, 12 Feb 2020 15:05:13 +0530
Message-Id: <20200212093515.11700-4-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200212093515.11700-1-ramalingam.c@intel.com>
References: <20200212093515.11700-1-ramalingam.c@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As per the HDCP2.2 compliance test 1B-10 expectation, when stream
management for a repeater fails, we retry thrice and when it fails
in all retries, HDCP2.2 reauthentication aborted at kernel.

v2:
  seq_num_m++ is extended for steam management failures too.[Anshuman]
v3:
  use drm_dbg_kms instead of DRM_DEBUG_KMS [Anshuman]

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 75 ++++++++++++++---------
 1 file changed, 46 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 30e0a3aa9d57..5d1829455e93 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -1380,7 +1380,7 @@ static int hdcp2_session_key_exchange(struct intel_connector *connector)
 }
 
 static
-int hdcp2_propagate_stream_management_info(struct intel_connector *connector)
+int _hdcp2_propagate_stream_management_info(struct intel_connector *connector)
 {
 	struct intel_digital_port *intel_dig_port = intel_attached_dig_port(connector);
 	struct intel_hdcp *hdcp = &connector->hdcp;
@@ -1406,28 +1406,25 @@ int hdcp2_propagate_stream_management_info(struct intel_connector *connector)
 	ret = shim->write_2_2_msg(intel_dig_port, &msgs.stream_manage,
 				  sizeof(msgs.stream_manage));
 	if (ret < 0)
-		return ret;
+		goto err_exit;
 
 	ret = shim->read_2_2_msg(intel_dig_port, HDCP_2_2_REP_STREAM_READY,
 				 &msgs.stream_ready, sizeof(msgs.stream_ready));
 	if (ret < 0)
-		return ret;
+		goto err_exit;
 
 	hdcp->port_data.seq_num_m = hdcp->seq_num_m;
 	hdcp->port_data.streams[0].stream_type = hdcp->content_type;
-
 	ret = hdcp2_verify_mprime(connector, &msgs.stream_ready);
-	if (ret < 0)
-		return ret;
 
+err_exit:
 	hdcp->seq_num_m++;
-
 	if (hdcp->seq_num_m > HDCP_2_2_SEQ_NUM_MAX) {
 		DRM_DEBUG_KMS("seq_num_m roll over.\n");
-		return -1;
+		ret = -1;
 	}
 
-	return 0;
+	return ret;
 }
 
 static
@@ -1492,17 +1489,6 @@ int hdcp2_authenticate_repeater_topology(struct intel_connector *connector)
 	return 0;
 }
 
-static int hdcp2_authenticate_repeater(struct intel_connector *connector)
-{
-	int ret;
-
-	ret = hdcp2_authenticate_repeater_topology(connector);
-	if (ret < 0)
-		return ret;
-
-	return hdcp2_propagate_stream_management_info(connector);
-}
-
 static int hdcp2_authenticate_sink(struct intel_connector *connector)
 {
 	struct intel_digital_port *intel_dig_port = intel_attached_dig_port(connector);
@@ -1537,18 +1523,13 @@ static int hdcp2_authenticate_sink(struct intel_connector *connector)
 	}
 
 	if (hdcp->is_repeater) {
-		ret = hdcp2_authenticate_repeater(connector);
+		ret = hdcp2_authenticate_repeater_topology(connector);
 		if (ret < 0) {
 			DRM_DEBUG_KMS("Repeater Auth Failed. Err: %d\n", ret);
 			return ret;
 		}
 	}
 
-	hdcp->port_data.streams[0].stream_type = hdcp->content_type;
-	ret = hdcp2_authenticate_port(connector);
-	if (ret < 0)
-		return ret;
-
 	return ret;
 }
 
@@ -1626,14 +1607,50 @@ static int hdcp2_disable_encryption(struct intel_connector *connector)
 	return ret;
 }
 
+static int
+hdcp2_propagate_stream_management_info(struct intel_connector *connector)
+{
+	struct drm_device *drm = connector->base.dev;
+	int i, tries = 3, ret;
+
+	if (!connector->hdcp.is_repeater)
+		return 0;
+
+	for (i = 0; i < tries; i++) {
+		ret = _hdcp2_propagate_stream_management_info(connector);
+		if (!ret)
+			break;
+
+		drm_dbg_kms(drm,
+			    "HDCP2 stream management %d of %d Failed.(%d)\n",
+			    i + 1, tries, ret);
+	}
+
+	return ret;
+}
+
 static int hdcp2_authenticate_and_encrypt(struct intel_connector *connector)
 {
+	struct drm_device *drm = connector->base.dev;
+	struct intel_hdcp *hdcp = &connector->hdcp;
 	int ret, i, tries = 3;
 
 	for (i = 0; i < tries; i++) {
 		ret = hdcp2_authenticate_sink(connector);
-		if (!ret)
-			break;
+		if (!ret) {
+			ret = hdcp2_propagate_stream_management_info(connector);
+			if (!ret) {
+				hdcp->port_data.streams[0].stream_type =
+							hdcp->content_type;
+				ret = hdcp2_authenticate_port(connector);
+				if (!ret)
+					break;
+			} else {
+				drm_dbg_kms(drm,
+					    "HDCP2 stream management failed\n");
+				break;
+			}
+		}
 
 		/* Clearing the mei hdcp session */
 		DRM_DEBUG_KMS("HDCP2.2 Auth %d of %d Failed.(%d)\n",
@@ -1642,7 +1659,7 @@ static int hdcp2_authenticate_and_encrypt(struct intel_connector *connector)
 			DRM_DEBUG_KMS("Port deauth failed.\n");
 	}
 
-	if (i != tries) {
+	if (!ret) {
 		/*
 		 * Ensuring the required 200mSec min time interval between
 		 * Session Key Exchange and encryption.
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
