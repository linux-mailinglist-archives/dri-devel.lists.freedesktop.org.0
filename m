Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8F115A662
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 11:29:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9DD6F4B1;
	Wed, 12 Feb 2020 10:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAB26F4B1;
 Wed, 12 Feb 2020 10:29:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Feb 2020 02:29:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; d="scan'208";a="434000948"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.154])
 by fmsmga006.fm.intel.com with ESMTP; 12 Feb 2020 02:29:34 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 5/5] drm/i915/hdcp: conversion to struct drm_device based
 logging macros.
Date: Wed, 12 Feb 2020 15:59:42 +0530
Message-Id: <20200212102942.26568-6-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200212102942.26568-1-ramalingam.c@intel.com>
References: <20200212102942.26568-1-ramalingam.c@intel.com>
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

Converts remaining instances of the printk based logging macros in
i915/display/intel_hdcp.c with the struct drm_device based macros
manually.

This is continuation of commit 65833c463886 ("drm/i915/hdcp: conversion
to struct drm_device based logging macros.")

v2:
  i915_dev_priv is used instead of drm_device for reusability [JaniN]

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
cc: Jani Nikula <jani.nikula@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 108 ++++++++++++----------
 1 file changed, 61 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index b35f50d4a0e9..c9841c82e213 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -43,6 +43,7 @@ static
 int intel_hdcp_read_valid_bksv(struct intel_digital_port *intel_dig_port,
 			       const struct intel_hdcp_shim *shim, u8 *bksv)
 {
+	struct drm_i915_private *i915 = to_i915(intel_dig_port->base.base.dev);
 	int ret, i, tries = 2;
 
 	/* HDCP spec states that we must retry the bksv if it is invalid */
@@ -54,7 +55,7 @@ int intel_hdcp_read_valid_bksv(struct intel_digital_port *intel_dig_port,
 			break;
 	}
 	if (i == tries) {
-		DRM_DEBUG_KMS("Bksv is invalid\n");
+		drm_dbg_kms(&i915->drm, "Bksv is invalid\n");
 		return -ENODEV;
 	}
 
@@ -485,8 +486,8 @@ int intel_hdcp_validate_v_prime(struct intel_connector *connector,
 			return ret;
 		sha_idx += sizeof(sha_text);
 	} else {
-		DRM_DEBUG_KMS("Invalid number of leftovers %d\n",
-			      sha_leftovers);
+		drm_dbg_kms(&dev_priv->drm, "Invalid number of leftovers %d\n",
+			    sha_leftovers);
 		return -EINVAL;
 	}
 
@@ -514,11 +515,11 @@ int intel_hdcp_validate_v_prime(struct intel_connector *connector,
 		       rep_ctl | HDCP_SHA1_COMPLETE_HASH);
 	if (intel_de_wait_for_set(dev_priv, HDCP_REP_CTL,
 				  HDCP_SHA1_COMPLETE, 1)) {
-		DRM_ERROR("Timed out waiting for SHA1 complete\n");
+		drm_err(&dev_priv->drm, "Timed out waiting for SHA1 complete\n");
 		return -ETIMEDOUT;
 	}
 	if (!(intel_de_read(dev_priv, HDCP_REP_CTL) & HDCP_SHA1_V_MATCH)) {
-		DRM_DEBUG_KMS("SHA-1 mismatch, HDCP failed\n");
+		drm_dbg_kms(&dev_priv->drm, "SHA-1 mismatch, HDCP failed\n");
 		return -ENXIO;
 	}
 
@@ -537,7 +538,8 @@ int intel_hdcp_auth_downstream(struct intel_connector *connector)
 
 	ret = intel_hdcp_poll_ksv_fifo(intel_dig_port, shim);
 	if (ret) {
-		DRM_DEBUG_KMS("KSV list failed to become ready (%d)\n", ret);
+		drm_dbg_kms(&dev_priv->drm,
+			    "KSV list failed to become ready (%d)\n", ret);
 		return ret;
 	}
 
@@ -547,7 +549,7 @@ int intel_hdcp_auth_downstream(struct intel_connector *connector)
 
 	if (DRM_HDCP_MAX_DEVICE_EXCEEDED(bstatus[0]) ||
 	    DRM_HDCP_MAX_CASCADE_EXCEEDED(bstatus[1])) {
-		DRM_DEBUG_KMS("Max Topology Limit Exceeded\n");
+		drm_dbg_kms(&dev_priv->drm, "Max Topology Limit Exceeded\n");
 		return -EPERM;
 	}
 
@@ -560,13 +562,14 @@ int intel_hdcp_auth_downstream(struct intel_connector *connector)
 	 */
 	num_downstream = DRM_HDCP_NUM_DOWNSTREAM(bstatus[0]);
 	if (num_downstream == 0) {
-		DRM_DEBUG_KMS("Repeater with zero downstream devices\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "Repeater with zero downstream devices\n");
 		return -EINVAL;
 	}
 
 	ksv_fifo = kcalloc(DRM_HDCP_KSV_LEN, num_downstream, GFP_KERNEL);
 	if (!ksv_fifo) {
-		DRM_DEBUG_KMS("Out of mem: ksv_fifo\n");
+		drm_dbg_kms(&dev_priv->drm, "Out of mem: ksv_fifo\n");
 		return -ENOMEM;
 	}
 
@@ -576,7 +579,7 @@ int intel_hdcp_auth_downstream(struct intel_connector *connector)
 
 	if (drm_hdcp_check_ksvs_revoked(&dev_priv->drm, ksv_fifo,
 					num_downstream)) {
-		DRM_ERROR("Revoked Ksv(s) in ksv_fifo\n");
+		drm_err(&dev_priv->drm, "Revoked Ksv(s) in ksv_fifo\n");
 		ret = -EPERM;
 		goto err;
 	}
@@ -594,12 +597,13 @@ int intel_hdcp_auth_downstream(struct intel_connector *connector)
 	}
 
 	if (i == tries) {
-		DRM_DEBUG_KMS("V Prime validation failed.(%d)\n", ret);
+		drm_dbg_kms(&dev_priv->drm,
+			    "V Prime validation failed.(%d)\n", ret);
 		goto err;
 	}
 
-	DRM_DEBUG_KMS("HDCP is enabled (%d downstream devices)\n",
-		      num_downstream);
+	drm_dbg_kms(&dev_priv->drm, "HDCP is enabled (%d downstream devices)\n",
+		    num_downstream);
 	ret = 0;
 err:
 	kfree(ksv_fifo);
@@ -642,7 +646,8 @@ static int intel_hdcp_auth(struct intel_connector *connector)
 		if (ret)
 			return ret;
 		if (!hdcp_capable) {
-			DRM_DEBUG_KMS("Panel is not HDCP capable\n");
+			drm_dbg_kms(&dev_priv->drm,
+				    "Panel is not HDCP capable\n");
 			return -EINVAL;
 		}
 	}
@@ -659,7 +664,7 @@ static int intel_hdcp_auth(struct intel_connector *connector)
 	if (intel_de_wait_for_set(dev_priv,
 				  HDCP_STATUS(dev_priv, cpu_transcoder, port),
 				  HDCP_STATUS_AN_READY, 1)) {
-		DRM_ERROR("Timed out waiting for An\n");
+		drm_err(&dev_priv->drm, "Timed out waiting for An\n");
 		return -ETIMEDOUT;
 	}
 
@@ -680,7 +685,7 @@ static int intel_hdcp_auth(struct intel_connector *connector)
 		return ret;
 
 	if (drm_hdcp_check_ksvs_revoked(&dev_priv->drm, bksv.shim, 1)) {
-		DRM_ERROR("BKSV is revoked\n");
+		drm_err(&dev_priv->drm, "BKSV is revoked\n");
 		return -EPERM;
 	}
 
@@ -706,7 +711,7 @@ static int intel_hdcp_auth(struct intel_connector *connector)
 	/* Wait for R0 ready */
 	if (wait_for(intel_de_read(dev_priv, HDCP_STATUS(dev_priv, cpu_transcoder, port)) &
 		     (HDCP_STATUS_R0_READY | HDCP_STATUS_ENC), 1)) {
-		DRM_ERROR("Timed out waiting for R0 ready\n");
+		drm_err(&dev_priv->drm, "Timed out waiting for R0 ready\n");
 		return -ETIMEDOUT;
 	}
 
@@ -743,8 +748,10 @@ static int intel_hdcp_auth(struct intel_connector *connector)
 	}
 
 	if (i == tries) {
-		DRM_DEBUG_KMS("Timed out waiting for Ri prime match (%x)\n",
-			      intel_de_read(dev_priv, HDCP_STATUS(dev_priv, cpu_transcoder, port)));
+		drm_dbg_kms(&dev_priv->drm,
+			    "Timed out waiting for Ri prime match (%x)\n",
+			    intel_de_read(dev_priv, HDCP_STATUS(dev_priv,
+					  cpu_transcoder, port)));
 		return -ETIMEDOUT;
 	}
 
@@ -753,7 +760,7 @@ static int intel_hdcp_auth(struct intel_connector *connector)
 				  HDCP_STATUS(dev_priv, cpu_transcoder, port),
 				  HDCP_STATUS_ENC,
 				  ENCRYPT_STATUS_CHANGE_TIMEOUT_MS)) {
-		DRM_ERROR("Timed out waiting for encryption\n");
+		drm_err(&dev_priv->drm, "Timed out waiting for encryption\n");
 		return -ETIMEDOUT;
 	}
 
@@ -765,7 +772,7 @@ static int intel_hdcp_auth(struct intel_connector *connector)
 	if (repeater_present)
 		return intel_hdcp_auth_downstream(connector);
 
-	DRM_DEBUG_KMS("HDCP is enabled (no repeater present)\n");
+	drm_dbg_kms(&dev_priv->drm, "HDCP is enabled (no repeater present)\n");
 	return 0;
 }
 
@@ -1270,7 +1277,7 @@ static int hdcp2_authentication_key_exchange(struct intel_connector *connector)
 		return ret;
 
 	if (msgs.send_cert.rx_caps[0] != HDCP_2_2_RX_CAPS_VERSION_VAL) {
-		DRM_DEBUG_KMS("cert.rx_caps dont claim HDCP2.2\n");
+		drm_dbg_kms(&dev_priv->drm, "cert.rx_caps dont claim HDCP2.2\n");
 		return -EINVAL;
 	}
 
@@ -1279,7 +1286,7 @@ static int hdcp2_authentication_key_exchange(struct intel_connector *connector)
 	if (drm_hdcp_check_ksvs_revoked(&dev_priv->drm,
 					msgs.send_cert.cert_rx.receiver_id,
 					1)) {
-		DRM_ERROR("Receiver ID is revoked\n");
+		drm_err(&dev_priv->drm, "Receiver ID is revoked\n");
 		return -EPERM;
 	}
 
@@ -1446,7 +1453,7 @@ int hdcp2_authenticate_repeater_topology(struct intel_connector *connector)
 
 	if (HDCP_2_2_MAX_CASCADE_EXCEEDED(rx_info[1]) ||
 	    HDCP_2_2_MAX_DEVS_EXCEEDED(rx_info[1])) {
-		DRM_DEBUG_KMS("Topology Max Size Exceeded\n");
+		drm_dbg_kms(&dev_priv->drm, "Topology Max Size Exceeded\n");
 		return -EINVAL;
 	}
 
@@ -1456,7 +1463,7 @@ int hdcp2_authenticate_repeater_topology(struct intel_connector *connector)
 
 	if (seq_num_v < hdcp->seq_num_v) {
 		/* Roll over of the seq_num_v from repeater. Reauthenticate. */
-		DRM_DEBUG_KMS("Seq_num_v roll over.\n");
+		drm_dbg_kms(&dev_priv->drm, "Seq_num_v roll over.\n");
 		return -EINVAL;
 	}
 
@@ -1465,7 +1472,7 @@ int hdcp2_authenticate_repeater_topology(struct intel_connector *connector)
 	if (drm_hdcp_check_ksvs_revoked(&dev_priv->drm,
 					msgs.recvid_list.receiver_ids,
 					device_cnt)) {
-		DRM_ERROR("Revoked receiver ID(s) is in list\n");
+		drm_err(&dev_priv->drm, "Revoked receiver ID(s) is in list\n");
 		return -EPERM;
 	}
 
@@ -1487,25 +1494,27 @@ int hdcp2_authenticate_repeater_topology(struct intel_connector *connector)
 static int hdcp2_authenticate_sink(struct intel_connector *connector)
 {
 	struct intel_digital_port *intel_dig_port = intel_attached_dig_port(connector);
+	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	const struct intel_hdcp_shim *shim = hdcp->shim;
 	int ret;
 
 	ret = hdcp2_authentication_key_exchange(connector);
 	if (ret < 0) {
-		DRM_DEBUG_KMS("AKE Failed. Err : %d\n", ret);
+		drm_dbg_kms(&dev_priv->drm, "AKE Failed. Err : %d\n", ret);
 		return ret;
 	}
 
 	ret = hdcp2_locality_check(connector);
 	if (ret < 0) {
-		DRM_DEBUG_KMS("Locality Check failed. Err : %d\n", ret);
+		drm_dbg_kms(&dev_priv->drm,
+			    "Locality Check failed. Err : %d\n", ret);
 		return ret;
 	}
 
 	ret = hdcp2_session_key_exchange(connector);
 	if (ret < 0) {
-		DRM_DEBUG_KMS("SKE Failed. Err : %d\n", ret);
+		drm_dbg_kms(&dev_priv->drm, "SKE Failed. Err : %d\n", ret);
 		return ret;
 	}
 
@@ -1520,7 +1529,8 @@ static int hdcp2_authenticate_sink(struct intel_connector *connector)
 	if (hdcp->is_repeater) {
 		ret = hdcp2_authenticate_repeater_topology(connector);
 		if (ret < 0) {
-			DRM_DEBUG_KMS("Repeater Auth Failed. Err: %d\n", ret);
+			drm_dbg_kms(&dev_priv->drm,
+				    "Repeater Auth Failed. Err: %d\n", ret);
 			return ret;
 		}
 	}
@@ -1651,10 +1661,10 @@ static int hdcp2_authenticate_and_encrypt(struct intel_connector *connector)
 		}
 
 		/* Clearing the mei hdcp session */
-		DRM_DEBUG_KMS("HDCP2.2 Auth %d of %d Failed.(%d)\n",
-			      i + 1, tries, ret);
+		drm_dbg_kms(&i915->drm, "HDCP2.2 Auth %d of %d Failed.(%d)\n",
+			    i + 1, tries, ret);
 		if (hdcp2_deauthenticate_port(connector) < 0)
-			DRM_DEBUG_KMS("Port deauth failed.\n");
+			drm_dbg_kms(&i915->drm, "Port deauth failed.\n");
 	}
 
 	if (!ret) {
@@ -1665,9 +1675,10 @@ static int hdcp2_authenticate_and_encrypt(struct intel_connector *connector)
 		msleep(HDCP_2_2_DELAY_BEFORE_ENCRYPTION_EN);
 		ret = hdcp2_enable_encryption(connector);
 		if (ret < 0) {
-			DRM_DEBUG_KMS("Encryption Enable Failed.(%d)\n", ret);
+			drm_dbg_kms(&i915->drm,
+				    "Encryption Enable Failed.(%d)\n", ret);
 			if (hdcp2_deauthenticate_port(connector) < 0)
-				DRM_DEBUG_KMS("Port deauth failed.\n");
+				drm_dbg_kms(&i915->drm, "Port deauth failed.\n");
 		}
 	}
 
@@ -1676,23 +1687,24 @@ static int hdcp2_authenticate_and_encrypt(struct intel_connector *connector)
 
 static int _intel_hdcp2_enable(struct intel_connector *connector)
 {
+	struct drm_i915_private *i915 = to_i915(connector->base.dev);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	int ret;
 
-	DRM_DEBUG_KMS("[%s:%d] HDCP2.2 is being enabled. Type: %d\n",
-		      connector->base.name, connector->base.base.id,
-		      hdcp->content_type);
+	drm_dbg_kms(&i915->drm, "[%s:%d] HDCP2.2 is being enabled. Type: %d\n",
+		    connector->base.name, connector->base.base.id,
+		    hdcp->content_type);
 
 	ret = hdcp2_authenticate_and_encrypt(connector);
 	if (ret) {
-		DRM_DEBUG_KMS("HDCP2 Type%d  Enabling Failed. (%d)\n",
-			      hdcp->content_type, ret);
+		drm_dbg_kms(&i915->drm, "HDCP2 Type%d  Enabling Failed. (%d)\n",
+			    hdcp->content_type, ret);
 		return ret;
 	}
 
-	DRM_DEBUG_KMS("[%s:%d] HDCP2.2 is enabled. Type %d\n",
-		      connector->base.name, connector->base.base.id,
-		      hdcp->content_type);
+	drm_dbg_kms(&i915->drm, "[%s:%d] HDCP2.2 is enabled. Type %d\n",
+		    connector->base.name, connector->base.base.id,
+		    hdcp->content_type);
 
 	hdcp->hdcp2_encrypted = true;
 	return 0;
@@ -1700,15 +1712,16 @@ static int _intel_hdcp2_enable(struct intel_connector *connector)
 
 static int _intel_hdcp2_disable(struct intel_connector *connector)
 {
+	struct drm_i915_private *i915 = to_i915(connector->base.dev);
 	int ret;
 
-	DRM_DEBUG_KMS("[%s:%d] HDCP2.2 is being Disabled\n",
-		      connector->base.name, connector->base.base.id);
+	drm_dbg_kms(&i915->drm, "[%s:%d] HDCP2.2 is being Disabled\n",
+		    connector->base.name, connector->base.base.id);
 
 	ret = hdcp2_disable_encryption(connector);
 
 	if (hdcp2_deauthenticate_port(connector) < 0)
-		DRM_DEBUG_KMS("Port deauth failed.\n");
+		drm_dbg_kms(&i915->drm, "Port deauth failed.\n");
 
 	connector->hdcp.hdcp2_encrypted = false;
 
@@ -1950,12 +1963,13 @@ void intel_hdcp_component_init(struct drm_i915_private *dev_priv)
 static void intel_hdcp2_init(struct intel_connector *connector,
 			     const struct intel_hdcp_shim *shim)
 {
+	struct drm_i915_private *i915 = to_i915(connector->base.dev);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	int ret;
 
 	ret = initialize_hdcp_port_data(connector, shim);
 	if (ret) {
-		DRM_DEBUG_KMS("Mei hdcp data init failed\n");
+		drm_dbg_kms(&i915->drm, "Mei hdcp data init failed\n");
 		return;
 	}
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
