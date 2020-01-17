Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6016F1411C0
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 20:31:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CAA6F8E8;
	Fri, 17 Jan 2020 19:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896BC6F8E6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 19:31:16 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id k15so6660110ybd.10
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 11:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UrSO/k55VdhipLaQRmQtE0SXT4vzZi3TKz+iaXCu8hE=;
 b=KNX6kbXgdCciMNskRxCEH816RtpHWp5fkXPT0+wpkAG4gOVz0iJ9ilveECPLsHIxn9
 KR86pznN262miJttjPT25cwE+QsfCeEat8KuTL5O918DiEXb51w5YszwTPp+1pKXMems
 Bu89t6z0fIRJQi0zAyPQJrOR42kBpZfKiMdViT0ahaLaf0A6hUEa8yqOsA77AxA8oWps
 RDB6nU1tubO/69dWg/dwp650y8AZFlkRuGk/F526BXf9+uUg3Fr24jYmCp2cQjPqSUMm
 mcKSiZmwRrTPZ3EtkWrFj4VHsQjwze/vkvDkr77TdJqOZibdNSHUBdb7KSKZfD0Z1bMR
 Q5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UrSO/k55VdhipLaQRmQtE0SXT4vzZi3TKz+iaXCu8hE=;
 b=DhfqSzEEpWsEy/8hpiJJUrvvYtbTuNQVEPv7Svw0bvMKGyG56ec5rE9tjhBoxZUjQW
 zo3mr5xOydprcLkAQMhOlfhJpHpe9FsA/GR5oQ3YyUqCp+lZVOFFn8pQdoiJTDtBN9Me
 dLmCt/wQ4y22nuvw1bXfiuauQCobebPDEcLMtVLNGQjPb1xg8Wrugdxctzs+nw3dq21w
 T1sogop7lY+ekfTiYK3bRHzICUVpl1NOYXYCghxXWy8YLMhyH8KBCKZrsTjWxekAoSnZ
 Ghe6jwiwOAlnMvKG9kATMdgmIvane3ZaewvWzkTithU9f3vgbpOgVObadOs6S1ZpXz7F
 mAKA==
X-Gm-Message-State: APjAAAUPiLnH91XexjPcfxt023wz9O5Qwc8lMs/t2OT0EUs5dxj7i6xU
 7Xf7hfwADjG9yXT9EWrnym7lEPdEQlveWg==
X-Google-Smtp-Source: APXvYqx6XFZvoT2aYrfDD87SYeb+dV2vjl/ivIGaP9z05+ZZQamQnExigN9n25MP/Dswl5qEqpp8LQ==
X-Received: by 2002:a5b:611:: with SMTP id d17mr29460821ybq.87.1579289475404; 
 Fri, 17 Jan 2020 11:31:15 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id e76sm11848968ywe.25.2020.01.17.11.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 11:31:15 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 08/12] drm/i915: Don't fully disable HDCP on a port if
 multiple pipes are using it
Date: Fri, 17 Jan 2020 14:30:59 -0500
Message-Id: <20200117193103.156821-9-sean@poorly.run>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200117193103.156821-1-sean@poorly.run>
References: <20200117193103.156821-1-sean@poorly.run>
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
Cc: daniel.vetter@ffwll.ch, rodrigo.vivi@intel.com,
 Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

This patch is required for HDCP over MST. If a port is being used for
multiple HDCP streams, we don't want to fully disable HDCP on a port if
one of them is disabled. Instead, we just disable the HDCP signalling on
that particular pipe and exit early. The last pipe to disable HDCP will
also bring down HDCP on the port.

In order to achieve this, we need to keep a refcount in intel_digital_port
and protect it using a new hdcp_mutex.

Cc: Ramalingam C <ramalingam.c@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20191203173638.94919-8-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20191212190230.188505-9-sean@poorly.run #v2

Changes in v2:
- Move the toggle_signalling call into _intel_hdcp_disable so it's called from check_work
Changes in v3:
- None
---
 drivers/gpu/drm/i915/display/intel_ddi.c      |  3 ++
 .../drm/i915/display/intel_display_types.h    |  5 ++
 drivers/gpu/drm/i915/display/intel_dp.c       |  2 +
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 52 +++++++++++++++----
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  2 +
 5 files changed, 55 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index a90ce672d2cf..4073dd96b83e 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4815,6 +4815,9 @@ void intel_ddi_init(struct drm_i915_private *dev_priv, enum port port)
 
 	encoder = &intel_dig_port->base;
 
+	mutex_init(&intel_dig_port->hdcp_mutex);
+	intel_dig_port->num_hdcp_streams = 0;
+
 	drm_encoder_init(&dev_priv->drm, &encoder->base, &intel_ddi_funcs,
 			 DRM_MODE_ENCODER_TMDS, "DDI %c", port_name(port));
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 8a96fedefad3..b488e8b1478e 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1355,6 +1355,11 @@ struct intel_digital_port {
 	enum phy_fia tc_phy_fia;
 	u8 tc_phy_fia_idx;
 
+	/* protects num_hdcp_streams reference count */
+	struct mutex hdcp_mutex;
+	/* the number of pipes using HDCP signalling out of this port */
+	unsigned int num_hdcp_streams;
+
 	void (*write_infoframe)(struct intel_encoder *encoder,
 				const struct intel_crtc_state *crtc_state,
 				unsigned int type,
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 89501b7525a9..a91f65ba35a1 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -7583,6 +7583,8 @@ bool intel_dp_init(struct drm_i915_private *dev_priv,
 	intel_encoder = &intel_dig_port->base;
 	encoder = &intel_encoder->base;
 
+	mutex_init(&intel_dig_port->hdcp_mutex);
+
 	if (drm_encoder_init(&dev_priv->drm, &intel_encoder->base,
 			     &intel_dp_enc_funcs, DRM_MODE_ENCODER_TMDS,
 			     "DP %c", port_name(port)))
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index fabacfb1b644..dc83d81c6df0 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -779,6 +779,19 @@ static int _intel_hdcp_disable(struct intel_connector *connector)
 	DRM_DEBUG_KMS("[%s:%d] HDCP is being disabled...\n",
 		      connector->base.name, connector->base.base.id);
 
+	/*
+	 * If there are other connectors on this port using HDCP, don't disable
+	 * it. Instead, toggle the HDCP signalling off on that particular
+	 * connector/pipe and exit.
+	 */
+	if (intel_dig_port->num_hdcp_streams > 0) {
+		ret = hdcp->shim->toggle_signalling(intel_dig_port,
+						    cpu_transcoder, false);
+		if (ret)
+			DRM_ERROR("Failed to disable HDCP signalling\n");
+		return ret;
+	}
+
 	hdcp->hdcp_encrypted = false;
 	I915_WRITE(HDCP_CONF(dev_priv, cpu_transcoder, port), 0);
 	if (intel_de_wait_for_clear(dev_priv,
@@ -855,6 +868,7 @@ struct intel_connector *intel_hdcp_to_connector(struct intel_hdcp *hdcp)
 static void intel_hdcp_update_value(struct intel_connector *connector,
 				    u64 value, bool update_property)
 {
+	struct intel_digital_port *intel_dig_port = conn_to_dig_port(connector);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 
 	WARN_ON(!mutex_is_locked(&hdcp->mutex));
@@ -862,6 +876,15 @@ static void intel_hdcp_update_value(struct intel_connector *connector,
 	if (hdcp->value == value)
 		return;
 
+	WARN_ON(!mutex_is_locked(&intel_dig_port->hdcp_mutex));
+
+	if (hdcp->value == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
+		if (!WARN_ON(intel_dig_port->num_hdcp_streams == 0))
+			intel_dig_port->num_hdcp_streams--;
+	} else if (value == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
+		intel_dig_port->num_hdcp_streams++;
+	}
+
 	hdcp->value = value;
 	if (update_property) {
 		drm_connector_get(&connector->base);
@@ -880,6 +903,8 @@ static int intel_hdcp_check_link(struct intel_connector *connector)
 	int ret = 0;
 
 	mutex_lock(&hdcp->mutex);
+	mutex_lock(&intel_dig_port->hdcp_mutex);
+
 	cpu_transcoder = hdcp->cpu_transcoder;
 
 	/* Check_link valid only when HDCP1.4 is enabled */
@@ -931,6 +956,7 @@ static int intel_hdcp_check_link(struct intel_connector *connector)
 	}
 
 out:
+	mutex_unlock(&intel_dig_port->hdcp_mutex);
 	mutex_unlock(&hdcp->mutex);
 	return ret;
 }
@@ -1996,6 +2022,7 @@ int intel_hdcp_enable(struct intel_connector *connector,
 		      enum transcoder cpu_transcoder, u8 content_type)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct intel_digital_port *intel_dig_port = conn_to_dig_port(connector);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	unsigned long check_link_interval = DRM_HDCP_CHECK_PERIOD_MS;
 	int ret = -EINVAL;
@@ -2004,6 +2031,7 @@ int intel_hdcp_enable(struct intel_connector *connector,
 		return -ENOENT;
 
 	mutex_lock(&hdcp->mutex);
+	mutex_lock(&intel_dig_port->hdcp_mutex);
 	WARN_ON(hdcp->value == DRM_MODE_CONTENT_PROTECTION_ENABLED);
 	hdcp->content_type = content_type;
 
@@ -2038,12 +2066,14 @@ int intel_hdcp_enable(struct intel_connector *connector,
 					true);
 	}
 
+	mutex_unlock(&intel_dig_port->hdcp_mutex);
 	mutex_unlock(&hdcp->mutex);
 	return ret;
 }
 
 int intel_hdcp_disable(struct intel_connector *connector)
 {
+	struct intel_digital_port *intel_dig_port = conn_to_dig_port(connector);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	int ret = 0;
 
@@ -2051,17 +2081,21 @@ int intel_hdcp_disable(struct intel_connector *connector)
 		return -ENOENT;
 
 	mutex_lock(&hdcp->mutex);
+	mutex_lock(&intel_dig_port->hdcp_mutex);
 
-	if (hdcp->value != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
-		intel_hdcp_update_value(connector,
-					DRM_MODE_CONTENT_PROTECTION_UNDESIRED,
-					false);
-		if (hdcp->hdcp2_encrypted)
-			ret = _intel_hdcp2_disable(connector);
-		else if (hdcp->hdcp_encrypted)
-			ret = _intel_hdcp_disable(connector);
-	}
+	if (hdcp->value == DRM_MODE_CONTENT_PROTECTION_UNDESIRED)
+		goto out;
+
+	intel_hdcp_update_value(connector,
+				DRM_MODE_CONTENT_PROTECTION_UNDESIRED, false);
 
+	if (hdcp->hdcp2_encrypted)
+		ret = _intel_hdcp2_disable(connector);
+	else if (hdcp->hdcp_encrypted)
+		ret = _intel_hdcp_disable(connector);
+
+out:
+	mutex_unlock(&intel_dig_port->hdcp_mutex);
 	mutex_unlock(&hdcp->mutex);
 	cancel_delayed_work_sync(&hdcp->check_work);
 	return ret;
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 6b28c00d7289..68b648ec6abb 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -3252,6 +3252,8 @@ void intel_hdmi_init(struct drm_i915_private *dev_priv,
 
 	intel_encoder = &intel_dig_port->base;
 
+	mutex_init(&intel_dig_port->hdcp_mutex);
+
 	drm_encoder_init(&dev_priv->drm, &intel_encoder->base,
 			 &intel_hdmi_enc_funcs, DRM_MODE_ENCODER_TMDS,
 			 "HDMI %c", port_name(port));
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
