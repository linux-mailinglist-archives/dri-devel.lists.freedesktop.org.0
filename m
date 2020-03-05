Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4572117AF84
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 21:13:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B05A6EC26;
	Thu,  5 Mar 2020 20:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E7E16EC22
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 20:12:48 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id a132so6907317ywb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2020 12:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=giHzT/4sXPC+NO5EFIBEPlQDHpBWg8eSwlx54hJghrY=;
 b=TZJx0a5L0pKVSWzcBg9uKBUFgIjTiJND/eEtMyNpi2N2EB49ks1Isn+Og9Yw7Yo3og
 2kIgSM0UHeEdk6deUXXKS9SKR40GPqOxN+ItqbIPX54ZJVofhuf/f8J90vQaEAGTSybi
 +WjIx60hrvtocIo0RUA9I6XRqHkq4fiCmn1K1mwhnXvBkvsBrRZluLZRRbOOvTXfr7P3
 bVwvfa6mffljsQh9KnApoQzPJA/v/M+uHPcmlqoLd2vXjfCONFDADr/+ltz/yKqHApOy
 f1WcrN6C+eyqPUoSexV2HY90/sDirWLOA52ZAtKBqGk3i8wCPTBMwb4MQBiLUTKGJ98x
 2SXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=giHzT/4sXPC+NO5EFIBEPlQDHpBWg8eSwlx54hJghrY=;
 b=FCJ/apqHzpB24kOpCW2H2KlU2SAaUyzwPAqHc5+nKtG1BexhErD8eyjy0HEezMBINC
 /gxGRd2XFTXi/HMUGkBG5Jr5FZR/0nVVJaoBLivCv4huSI19Zk3YqaPYa5c1iinF1IQy
 AEz7UNTeInCW1xMY7ENfLRf1pt6mf92H3omfpa4yREEkQZiDUBFWMhENiPGVz+wBhBZe
 314V9wQpQvDJmNC3mCAoRjAx8KNBFes+9NNJuUdEpAnMvhFCzbKhIv7qmdaHzkvHxR66
 tBsjn8RplMVvE8qWAzDStGLecfaW78D9hzFBjpWjmb7q98+X9XH93smlE+QnIXu4YNsU
 9Ukw==
X-Gm-Message-State: ANhLgQ2D3ho3swoXPLrAFW7tWprhCvjB5RL0gfnt2GqmE2w0uIX3EodE
 0gCg6ias4+6lveJmcdrKemX5oj2JJo4=
X-Google-Smtp-Source: ADFU+vv1jZU67s//Af/VYL1hnbfcKf5tPvRujQNjC0xoCvMQILsj8FaRyQLkvCSRjtRvAvJF2smx4g==
X-Received: by 2002:a25:d405:: with SMTP id m5mr9354802ybf.411.1583439167285; 
 Thu, 05 Mar 2020 12:12:47 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id n38sm1404348ywh.14.2020.03.05.12.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 12:12:46 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 08/16] drm/i915: Don't fully disable HDCP on a port if
 multiple pipes are using it
Date: Thu,  5 Mar 2020 15:12:28 -0500
Message-Id: <20200305201236.152307-9-sean@poorly.run>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200305201236.152307-1-sean@poorly.run>
References: <20200305201236.152307-1-sean@poorly.run>
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
Cc: daniel.vetter@ffwll.ch, Sean Paul <seanpaul@chromium.org>,
 juston.li@intel.com, rodrigo.vivi@intel.com
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
Link: https://patchwork.freedesktop.org/patch/msgid/20200117193103.156821-9-sean@poorly.run #v3
Link: https://patchwork.freedesktop.org/patch/msgid/20200218220242.107265-9-sean@poorly.run #v4

Changes in v2:
-Move the toggle_signalling call into _intel_hdcp_disable so it's called from check_work
Changes in v3:
-None
Changes in v4:
-None
Changes in v5:
-Change WARN_ON to drm_WARN_ON
---
 drivers/gpu/drm/i915/display/intel_ddi.c      |  3 ++
 .../drm/i915/display/intel_display_types.h    |  5 ++
 drivers/gpu/drm/i915/display/intel_dp.c       |  2 +
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 53 +++++++++++++++----
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  2 +
 5 files changed, 56 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index d27f74c8f55d0..48910a2ceaaaa 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4452,6 +4452,9 @@ void intel_ddi_init(struct drm_i915_private *dev_priv, enum port port)
 	drm_encoder_init(&dev_priv->drm, &encoder->base, &intel_ddi_funcs,
 			 DRM_MODE_ENCODER_TMDS, "DDI %c", port_name(port));
 
+	mutex_init(&intel_dig_port->hdcp_mutex);
+	intel_dig_port->num_hdcp_streams = 0;
+
 	encoder->hotplug = intel_ddi_hotplug;
 	encoder->compute_output_type = intel_ddi_compute_output_type;
 	encoder->compute_config = intel_ddi_compute_config;
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index bd577f143469c..04161993e2038 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1388,6 +1388,11 @@ struct intel_digital_port {
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
index b2e92ecd1e0ff..4a38012a1fb03 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -7800,6 +7800,8 @@ bool intel_dp_init(struct drm_i915_private *dev_priv,
 	intel_encoder = &intel_dig_port->base;
 	encoder = &intel_encoder->base;
 
+	mutex_init(&intel_dig_port->hdcp_mutex);
+
 	if (drm_encoder_init(&dev_priv->drm, &intel_encoder->base,
 			     &intel_dp_enc_funcs, DRM_MODE_ENCODER_TMDS,
 			     "DP %c", port_name(port)))
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 9523ab6c65e0d..0ee29f88bab2d 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -803,6 +803,19 @@ static int _intel_hdcp_disable(struct intel_connector *connector)
 	drm_dbg_kms(&dev_priv->drm, "[%s:%d] HDCP is being disabled...\n",
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
 	intel_de_write(dev_priv, HDCP_CONF(dev_priv, cpu_transcoder, port), 0);
 	if (intel_de_wait_for_clear(dev_priv,
@@ -883,6 +896,8 @@ struct intel_connector *intel_hdcp_to_connector(struct intel_hdcp *hdcp)
 static void intel_hdcp_update_value(struct intel_connector *connector,
 				    u64 value, bool update_property)
 {
+	struct drm_device *dev = connector->base.dev;
+	struct intel_digital_port *intel_dig_port = intel_attached_dig_port(connector);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 
 	drm_WARN_ON(connector->base.dev, !mutex_is_locked(&hdcp->mutex));
@@ -890,6 +905,15 @@ static void intel_hdcp_update_value(struct intel_connector *connector,
 	if (hdcp->value == value)
 		return;
 
+	drm_WARN_ON(dev, !mutex_is_locked(&intel_dig_port->hdcp_mutex));
+
+	if (hdcp->value == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
+		if (!drm_WARN_ON(dev, intel_dig_port->num_hdcp_streams == 0))
+			intel_dig_port->num_hdcp_streams--;
+	} else if (value == DRM_MODE_CONTENT_PROTECTION_ENABLED) {
+		intel_dig_port->num_hdcp_streams++;
+	}
+
 	hdcp->value = value;
 	if (update_property) {
 		drm_connector_get(&connector->base);
@@ -908,6 +932,8 @@ static int intel_hdcp_check_link(struct intel_connector *connector)
 	int ret = 0;
 
 	mutex_lock(&hdcp->mutex);
+	mutex_lock(&intel_dig_port->hdcp_mutex);
+
 	cpu_transcoder = hdcp->cpu_transcoder;
 
 	/* Check_link valid only when HDCP1.4 is enabled */
@@ -961,6 +987,7 @@ static int intel_hdcp_check_link(struct intel_connector *connector)
 	}
 
 out:
+	mutex_unlock(&intel_dig_port->hdcp_mutex);
 	mutex_unlock(&hdcp->mutex);
 	return ret;
 }
@@ -2058,6 +2085,7 @@ int intel_hdcp_enable(struct intel_connector *connector,
 		      enum transcoder cpu_transcoder, u8 content_type)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	struct intel_digital_port *intel_dig_port = intel_attached_dig_port(connector);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	unsigned long check_link_interval = DRM_HDCP_CHECK_PERIOD_MS;
 	int ret = -EINVAL;
@@ -2066,6 +2094,7 @@ int intel_hdcp_enable(struct intel_connector *connector,
 		return -ENOENT;
 
 	mutex_lock(&hdcp->mutex);
+	mutex_lock(&intel_dig_port->hdcp_mutex);
 	drm_WARN_ON(&dev_priv->drm,
 		    hdcp->value == DRM_MODE_CONTENT_PROTECTION_ENABLED);
 	hdcp->content_type = content_type;
@@ -2100,12 +2129,14 @@ int intel_hdcp_enable(struct intel_connector *connector,
 					true);
 	}
 
+	mutex_unlock(&intel_dig_port->hdcp_mutex);
 	mutex_unlock(&hdcp->mutex);
 	return ret;
 }
 
 int intel_hdcp_disable(struct intel_connector *connector)
 {
+	struct intel_digital_port *intel_dig_port = intel_attached_dig_port(connector);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	int ret = 0;
 
@@ -2113,17 +2144,21 @@ int intel_hdcp_disable(struct intel_connector *connector)
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
index 51db3adb4bf1c..29149b59f9e40 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -3259,6 +3259,8 @@ void intel_hdmi_init(struct drm_i915_private *dev_priv,
 
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
