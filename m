Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E01B36C85CE
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 20:21:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D651410EC64;
	Fri, 24 Mar 2023 19:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD83D10EC61
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 19:21:16 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-54184571389so50994357b3.4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 12:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1679685676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PIYEvI2wg2lu9oowUUhESsvc0j1n7Y9hZ1EtidXwMKc=;
 b=dr2PpspjR/8y9dnUXNwrBO6nRLIyEc/2rKATRgRawct7rLQL3M4gqpXBwiAuEuU4vE
 LuIBBri+oDJpbjsJBZcU/hArIUQHrVpiQrW0y/MB0XTU0dSDZADNQbTow4BrSwMmDuih
 D4wTqQHoOLNrJi1QEf9yCUqQVJRUeXpOdm45M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679685676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PIYEvI2wg2lu9oowUUhESsvc0j1n7Y9hZ1EtidXwMKc=;
 b=ykejQ9WTJF7Ir/oiO3/qVF2LBsTI0wiE8lhuPK+lA9gqFoxgr67V4QUB2SyzrcnJr1
 QDKLzbM4NLq2MNJ14h6h0LZmwang8J7ldnr+OVgG90N4g56VdCP+CjW5wmF/zeIOpE/c
 FDZCOgtnkhMNbBZ6ZyhqIeaLxR2uY9qZzt2kDMGkm7SellaRML5IOuv1SV+6eCBjrVUi
 Wdm68qoV22ss4p6iRyAD2qaURqrSpptSts6h5UOM11PJ3aSAMQ768rBkQ/rl0yoW3POz
 Mogm2mYQjeKBrPayZOJlZQV8+jWt/CGE49fmeCgPjcKJWyPQBFa+7i/IYcSpICdStk6e
 rogQ==
X-Gm-Message-State: AAQBX9cM/qOUcx9ZQz3QUCuQBiAlyMgbvx5EJfRSPevZOW/uiWKcdopG
 vRZpVi5PXvbH7jkdUqGedijVtQ==
X-Google-Smtp-Source: AKy350YQtz1hv2p26+MRUi09CabQcRl5vZEipi+ipvcK5i8yRUgtjhgEtqa35MEb8Pp/ZxuQgH6C8Q==
X-Received: by 2002:a81:6705:0:b0:52e:f109:ba7a with SMTP id
 b5-20020a816705000000b0052ef109ba7amr2814269ywc.51.1679685675550; 
 Fri, 24 Mar 2023 12:21:15 -0700 (PDT)
Received: from localhost ([2620:0:1035:15:5509:ec45:2b32:b39f])
 by smtp.gmail.com with UTF8SMTPSA id
 u123-20020a817981000000b00545a08184a1sm570989ywc.49.2023.03.24.12.21.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 12:21:15 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
X-Google-Original-From: Mark Yacoub <markyacoub@google.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v7 06/10] drm/i915/hdcp: Retain hdcp_capable return codes
Date: Fri, 24 Mar 2023 15:20:53 -0400
Message-Id: <20230324192058.3916571-7-markyacoub@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230324192058.3916571-1-markyacoub@google.com>
References: <20230324192058.3916571-1-markyacoub@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: suraj.kandpal@intel.com, Jani Nikula <jani.nikula@intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, intel-gfx@lists.freedesktop.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

The shim functions return error codes, but they are discarded in
intel_hdcp.c. This patch plumbs the return codes through so they are
properly handled.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Mark Yacoub <markyacoub@chromium.org>

---
Changes in v2:
-None
Changes in v3:
-None
Changes in v4:
-None
Changes in v5:
-None
Changes in v6:
-Rebased
Changes in v7:
-None

 .../drm/i915/display/intel_display_debugfs.c  |  9 +++-
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 51 ++++++++++---------
 drivers/gpu/drm/i915/display/intel_hdcp.h     |  4 +-
 3 files changed, 37 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 7bcd90384a46d..a14b86a07e545 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -494,6 +494,7 @@ static void intel_panel_info(struct seq_file *m,
 static void intel_hdcp_info(struct seq_file *m,
 			    struct intel_connector *intel_connector)
 {
+	int ret;
 	bool hdcp_cap, hdcp2_cap;
 
 	if (!intel_connector->hdcp.shim) {
@@ -501,8 +502,12 @@ static void intel_hdcp_info(struct seq_file *m,
 		goto out;
 	}
 
-	hdcp_cap = intel_hdcp_capable(intel_connector);
-	hdcp2_cap = intel_hdcp2_capable(intel_connector);
+	ret = intel_hdcp_capable(intel_connector, &hdcp_cap);
+	if (ret)
+		hdcp_cap = false;
+	ret = intel_hdcp2_capable(intel_connector, &hdcp2_cap);
+	if (ret)
+		hdcp2_cap = false;
 
 	if (hdcp_cap)
 		seq_puts(m, "HDCP1.4 ");
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 0a20bc41be55d..61a862ae1f286 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -177,50 +177,49 @@ int intel_hdcp_read_valid_bksv(struct intel_digital_port *dig_port,
 }
 
 /* Is HDCP1.4 capable on Platform and Sink */
-bool intel_hdcp_capable(struct intel_connector *connector)
+int intel_hdcp_capable(struct intel_connector *connector, bool *capable)
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	const struct intel_hdcp_shim *shim = connector->hdcp.shim;
-	bool capable = false;
 	u8 bksv[5];
 
+	*capable = false;
+
 	if (!shim)
-		return capable;
+		return 0;
 
-	if (shim->hdcp_capable) {
-		shim->hdcp_capable(dig_port, &capable);
-	} else {
-		if (!intel_hdcp_read_valid_bksv(dig_port, shim, bksv))
-			capable = true;
-	}
+	if (shim->hdcp_capable)
+		return shim->hdcp_capable(dig_port, capable);
+
+	if (!intel_hdcp_read_valid_bksv(dig_port, shim, bksv))
+		*capable = true;
 
-	return capable;
+	return 0;
 }
 
 /* Is HDCP2.2 capable on Platform and Sink */
-bool intel_hdcp2_capable(struct intel_connector *connector)
+int intel_hdcp2_capable(struct intel_connector *connector, bool *capable)
 {
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct intel_hdcp *hdcp = &connector->hdcp;
-	bool capable = false;
+
+	*capable = false;
 
 	/* I915 support for HDCP2.2 */
 	if (!hdcp->hdcp2_supported)
-		return false;
+		return 0;
 
 	/* MEI interface is solid */
 	mutex_lock(&dev_priv->display.hdcp.comp_mutex);
 	if (!dev_priv->display.hdcp.comp_added ||  !dev_priv->display.hdcp.master) {
 		mutex_unlock(&dev_priv->display.hdcp.comp_mutex);
-		return false;
+		return 0;
 	}
 	mutex_unlock(&dev_priv->display.hdcp.comp_mutex);
 
 	/* Sink's capability for HDCP2.2 */
-	hdcp->shim->hdcp_2_2_capable(dig_port, &capable);
-
-	return capable;
+	return hdcp->shim->hdcp_2_2_capable(dig_port, capable);
 }
 
 static bool intel_hdcp_in_use(struct drm_i915_private *dev_priv,
@@ -2355,6 +2354,7 @@ int intel_hdcp_enable(struct intel_connector *connector,
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	unsigned long check_link_interval = DRM_HDCP_CHECK_PERIOD_MS;
+	bool capable;
 	int ret = -EINVAL;
 
 	if (!hdcp->shim)
@@ -2373,21 +2373,27 @@ int intel_hdcp_enable(struct intel_connector *connector,
 	 * Considering that HDCP2.2 is more secure than HDCP1.4, If the setup
 	 * is capable of HDCP2.2, it is preferred to use HDCP2.2.
 	 */
-	if (intel_hdcp2_capable(connector)) {
+	ret = intel_hdcp2_capable(connector, &capable);
+	if (capable) {
 		ret = _intel_hdcp2_enable(connector);
-		if (!ret)
+		if (!ret) {
 			check_link_interval = DRM_HDCP2_CHECK_PERIOD_MS;
+			goto out;
+		}
 	}
 
 	/*
 	 * When HDCP2.2 fails and Content Type is not Type1, HDCP1.4 will
 	 * be attempted.
 	 */
-	if (ret && intel_hdcp_capable(connector) &&
-	    hdcp->content_type != DRM_MODE_HDCP_CONTENT_TYPE1) {
+	ret = intel_hdcp_capable(connector, &capable);
+	if (ret)
+		goto out;
+
+	if (capable && hdcp->content_type != DRM_MODE_HDCP_CONTENT_TYPE1)
 		ret = _intel_hdcp_enable(connector);
-	}
 
+out:
 	if (!ret) {
 		schedule_delayed_work(&hdcp->check_work, check_link_interval);
 		intel_hdcp_update_value(connector,
@@ -2395,7 +2401,6 @@ int intel_hdcp_enable(struct intel_connector *connector,
 					true);
 	}
 
-out:
 	mutex_unlock(&dig_port->hdcp_mutex);
 	mutex_unlock(&hdcp->mutex);
 	return ret;
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.h b/drivers/gpu/drm/i915/display/intel_hdcp.h
index 7c5fd84a7b65a..f06f6e5a2b1ad 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.h
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.h
@@ -33,8 +33,8 @@ void intel_hdcp_update_pipe(struct intel_atomic_state *state,
 			    const struct intel_crtc_state *crtc_state,
 			    const struct drm_connector_state *conn_state);
 bool is_hdcp_supported(struct drm_i915_private *dev_priv, enum port port);
-bool intel_hdcp_capable(struct intel_connector *connector);
-bool intel_hdcp2_capable(struct intel_connector *connector);
+int intel_hdcp_capable(struct intel_connector *connector, bool *capable);
+int intel_hdcp2_capable(struct intel_connector *connector, bool *capable);
 void intel_hdcp_component_init(struct drm_i915_private *dev_priv);
 void intel_hdcp_component_fini(struct drm_i915_private *dev_priv);
 void intel_hdcp_cleanup(struct intel_connector *connector);
-- 
2.40.0.348.gf938b09366-goog

