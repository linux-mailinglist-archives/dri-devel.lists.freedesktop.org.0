Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6056B2D7713
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 14:56:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1AC6EE05;
	Fri, 11 Dec 2020 13:56:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8264A6EE03;
 Fri, 11 Dec 2020 13:56:51 +0000 (UTC)
IronPort-SDR: Xk/d4vvtnO+5H4Rd//YHYyrO4czG67M8oUYlpxQZDCEXSdXZCmC7q85Ce3prw/dRha2ysQcmO6
 SMog7B7Gf39A==
X-IronPort-AV: E=McAfee;i="6000,8403,9831"; a="162187709"
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="162187709"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 05:56:51 -0800
IronPort-SDR: 2yWhdCl8o1XNhcJFqV/8+dYNePCXs919ordgjoswOiOV1pbUPUK534bs3HL/Er4lf/HPbSJ8ET
 sCLook+DWzcQ==
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="409228386"
Received: from genxfsim-desktop.iind.intel.com ([10.223.74.178])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 05:56:48 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 08/19] drm/i915/hdcp: Configure HDCP1.4 MST steram
 encryption status
Date: Fri, 11 Dec 2020 19:12:33 +0530
Message-Id: <20201211134244.14588-9-anshuman.gupta@intel.com>
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

Enable HDCP 1.4 DP MST stream encryption.

Enable stream encryption once encryption is enabled on
the DP transport driving the link for each stream which
has requested encryption.

Disable stream encryption for each stream that no longer
requires encryption before disabling HDCP encryption on
the link.

v2:
- Added debug print for stream encryption.
- Disable the hdcp on port after disabling last stream
  encryption.
v3:
- Cosmetic change, removed the value less comment. [Uma]
v4:
- Split the Gen12 HDCP enablement patch. [Ram]
- Add connector details in drm_err.
v5:
- uniformity for connector detail in DMESG. [Ram]
- comments improvement. [Ram]

Cc: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
Tested-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdcp.c | 38 +++++++++++++++--------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 6e6465b4ecfa..fce444d69521 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -766,10 +766,17 @@ static int intel_hdcp_auth(struct intel_connector *connector)
 		return -ETIMEDOUT;
 	}
 
-	/*
-	 * XXX: If we have MST-connected devices, we need to enable encryption
-	 * on those as well.
-	 */
+	/* DP MST Auth Part 1 Step 2.a and Step 2.b */
+	if (shim->stream_encryption) {
+		ret = shim->stream_encryption(connector, true);
+		if (ret) {
+			drm_err(&dev_priv->drm, "[%s:%d] Failed to enable HDCP 1.4 stream enc\n",
+				connector->base.name, connector->base.base.id);
+			return ret;
+		}
+		drm_dbg_kms(&dev_priv->drm, "HDCP 1.4 transcoder: %s stream encrypted\n",
+			    transcoder_name(hdcp->stream_transcoder));
+	}
 
 	if (repeater_present)
 		return intel_hdcp_auth_downstream(connector);
@@ -791,18 +798,23 @@ static int _intel_hdcp_disable(struct intel_connector *connector)
 	drm_dbg_kms(&dev_priv->drm, "[%s:%d] HDCP is being disabled...\n",
 		    connector->base.name, connector->base.base.id);
 
+	if (hdcp->shim->stream_encryption) {
+		ret = hdcp->shim->stream_encryption(connector, false);
+		if (ret) {
+			drm_err(&dev_priv->drm, "[%s:%d] Failed to disable HDCP 1.4 stream enc\n",
+				connector->base.name, connector->base.base.id);
+			return ret;
+		}
+		drm_dbg_kms(&dev_priv->drm, "HDCP 1.4 transcoder: %s stream encryption disabled\n",
+			    transcoder_name(hdcp->stream_transcoder));
+	}
+
 	/*
-	 * If there are other connectors on this port using HDCP, don't disable
-	 * it. Instead, toggle the HDCP signalling off on that particular
-	 * connector/pipe and exit.
+	 * If there are other connectors on this port using HDCP, don't disable it
+	 * until it disabled HDCP encryption for all connectors in MST topology.
 	 */
-	if (dig_port->num_hdcp_streams > 0) {
-		ret = hdcp->shim->toggle_signalling(dig_port,
-						    cpu_transcoder, false);
-		if (ret)
-			DRM_ERROR("Failed to disable HDCP signalling\n");
+	if (dig_port->num_hdcp_streams > 0)
 		return ret;
-	}
 
 	hdcp->hdcp_encrypted = false;
 	intel_de_write(dev_priv, HDCP_CONF(dev_priv, cpu_transcoder, port), 0);
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
