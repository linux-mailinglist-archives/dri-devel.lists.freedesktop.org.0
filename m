Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ECD296F71
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 14:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439026F64A;
	Fri, 23 Oct 2020 12:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD0F6F645;
 Fri, 23 Oct 2020 12:35:52 +0000 (UTC)
IronPort-SDR: gloX8IZjGoJxok3Xulf6AHi4Qp0vt0gWf3uBVyK/2tJLYw4E0SZXfC3EoXZYT/RO0fpQ+JtrZp
 l/Z5G90W0a5g==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="252365731"
X-IronPort-AV: E=Sophos;i="5.77,408,1596524400"; d="scan'208";a="252365731"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2020 05:35:52 -0700
IronPort-SDR: k/CywYiBMtOStDRfC+jaXu/wK0FXxCTsj1wNHmKEfRMtP2ejD7bpxTbLEkSw7LgObdK9acoODy
 dr6WjilFhWyw==
X-IronPort-AV: E=Sophos;i="5.77,408,1596524400"; d="scan'208";a="423415836"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2020 05:35:49 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 16/16] drm/i915/hdcp: Enable HDCP 2.2 MST support
Date: Fri, 23 Oct 2020 17:51:12 +0530
Message-Id: <20201023122112.15265-17-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023122112.15265-1-anshuman.gupta@intel.com>
References: <20201023122112.15265-1-anshuman.gupta@intel.com>
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

Enable HDCP 2.2 over DP MST.

Cc: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 46 ++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 9dd08e2636e9..621c1a94c5ad 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -1698,6 +1698,32 @@ static int hdcp2_authenticate_sink(struct intel_connector *connector)
 	return ret;
 }
 
+static int hdcp2_enable_stream_encryption(struct intel_connector *connector)
+{
+	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
+	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct intel_hdcp *hdcp = &connector->hdcp;
+	enum transcoder cpu_transcoder = hdcp->cpu_transcoder;
+	enum port port = dig_port->base.port;
+	int ret = 0;
+
+	if (!(intel_de_read(dev_priv, HDCP2_STATUS(dev_priv, cpu_transcoder, port)) &
+			    LINK_ENCRYPTION_STATUS)) {
+		drm_err(&dev_priv->drm, "HDCP 2.2 Link is not encrypted\n");
+		return -EPERM;
+	}
+
+	if (hdcp->shim->stream_2_2_encryption) {
+		ret = hdcp->shim->stream_2_2_encryption(dig_port, true);
+		if (ret) {
+			drm_err(&dev_priv->drm, "Failed to enable HDCP 2.2 stream enc\n");
+			return ret;
+		}
+	}
+
+	return ret;
+}
+
 static int hdcp2_enable_encryption(struct intel_connector *connector)
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
@@ -1836,7 +1862,7 @@ static int hdcp2_authenticate_and_encrypt(struct intel_connector *connector)
 			drm_dbg_kms(&i915->drm, "Port deauth failed.\n");
 	}
 
-	if (!ret) {
+	if (!ret && !dig_port->port_auth) {
 		/*
 		 * Ensuring the required 200mSec min time interval between
 		 * Session Key Exchange and encryption.
@@ -1851,6 +1877,8 @@ static int hdcp2_authenticate_and_encrypt(struct intel_connector *connector)
 		}
 	}
 
+	ret = hdcp2_enable_stream_encryption(connector);
+
 	return ret;
 }
 
@@ -1896,11 +1924,23 @@ static int _intel_hdcp2_disable(struct intel_connector *connector)
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct drm_i915_private *i915 = to_i915(connector->base.dev);
 	struct hdcp_port_data *data = &dig_port->port_data;
+	struct intel_hdcp *hdcp = &connector->hdcp;
 	int ret;
 
 	drm_dbg_kms(&i915->drm, "[%s:%d] HDCP2.2 is being Disabled\n",
 		    connector->base.name, connector->base.base.id);
 
+	if (hdcp->shim->stream_2_2_encryption) {
+		ret = hdcp->shim->stream_2_2_encryption(dig_port, false);
+		if (ret) {
+			drm_err(&i915->drm, "Failed to disable HDCP 2.2 stream enc\n");
+			return ret;
+		}
+	}
+
+	if (dig_port->num_hdcp_streams > 0)
+		return ret;
+
 	ret = hdcp2_disable_encryption(connector);
 
 	if (hdcp2_deauthenticate_port(connector) < 0)
@@ -1924,6 +1964,7 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
 	int ret = 0;
 
 	mutex_lock(&hdcp->mutex);
+	mutex_lock(&dig_port->hdcp_mutex);
 	cpu_transcoder = hdcp->cpu_transcoder;
 
 	/* hdcp2_check_link is expected only when HDCP2.2 is Enabled */
@@ -2001,6 +2042,7 @@ static int intel_hdcp2_check_link(struct intel_connector *connector)
 	}
 
 out:
+	mutex_unlock(&dig_port->hdcp_mutex);
 	mutex_unlock(&hdcp->mutex);
 	return ret;
 }
@@ -2182,7 +2224,7 @@ int intel_hdcp_init(struct intel_connector *connector,
 	if (!shim)
 		return -EINVAL;
 
-	if (is_hdcp2_supported(dev_priv) && !connector->mst_port)
+	if (is_hdcp2_supported(dev_priv))
 		intel_hdcp2_init(connector, dig_port, shim);
 
 	ret =
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
