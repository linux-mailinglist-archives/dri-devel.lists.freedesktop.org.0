Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5EC409B73
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 19:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4F46ECDD;
	Mon, 13 Sep 2021 17:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2216ECE6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 17:58:23 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id c10so11504207qko.11
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 10:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yTqdcV6/D35YCbmu26snPqQPhkNz36GFSnhcDh5Cg+E=;
 b=UY0gHts4FutrslcT24DyxmLeSyLe3KJbattHN+ULbp53B+MGceTSJUyh2xtuAdulrB
 kyRTUmWN+vshRTOOiVTCaVjG+//+bTzhDEY5inSaUbOLPBObIdeZ61vX9dcxhe9KGF+i
 gUJ2tI2DBph+/R7gw92QXocU9U2HUl8e/QsQMsT9MxJcmKdkkJzuRPtaoLsHbyJboFg5
 q1EaYB5aA48lBcNVZ3GvZsH2qLKrAmM1KoPSqD1U9mJ+60pGSPjhgi5XdfvukkGeNLD2
 OBDfVFaeV+dKwtCnhNShlmNdrwoc9jdwnYTMLi8IsBiIR9JmEE89mkl8lacofIntyIOH
 E6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yTqdcV6/D35YCbmu26snPqQPhkNz36GFSnhcDh5Cg+E=;
 b=YeJeHyA9viIHXYNdJCb6j2HcP0Rw9FtcO0BN/H30/dULiBhpIH4dSJllNSUxFaXgcg
 VlH1wsKIVUJbCG50Ei1xGXOGkKHYNsXkBf/LfA9SC1nhwCT3XoJPdDcwmCs8g2vLvke1
 ZETRra0oCSIrxvt7/lLlezHBKX+b2pRGhYxbsPrNt3RF/guiv6dJE/qxMhBi7BcVDZvB
 +C2RfObXRw2ltiqNsFs9OhnArIVmM7cDKCW7CgqMrcKiMnsqOGCCjLsW2nICFwJz/l99
 8FOck7wVlytuMMWATWtoh4InguTo4+5VoFNdA7jGNwe/rfNOoVnQd5q8anHmJCmxC4md
 gHNA==
X-Gm-Message-State: AOAM533tWcLAf5r5o1zqHGQVbPpzj1peuBdU1m8ZwosjLnoK5m1Uj0yI
 pPesibip8zHgkfgc5E/aSGXIzYyrGQUI6w==
X-Google-Smtp-Source: ABdhPJxTuxM1Uexy7UpllwF6LhJREXPxH2a000uLkrC+9ghVXo91SkvVJ9mhCrf5Y1WIsBNNmKvObQ==
X-Received: by 2002:a37:ea1a:: with SMTP id t26mr841970qkj.504.1631555902190; 
 Mon, 13 Sep 2021 10:58:22 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id j18sm5745936qkl.12.2021.09.13.10.58.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Sep 2021 10:58:21 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 06/14] drm/i915/hdcp: Retain hdcp_capable return codes
Date: Mon, 13 Sep 2021 13:57:37 -0400
Message-Id: <20210913175747.47456-7-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210913175747.47456-1-sean@poorly.run>
References: <20210913175747.47456-1-sean@poorly.run>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

The shim functions return error codes, but they are discarded in
intel_hdcp.c. This patch plumbs the return codes through so they are
properly handled.

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 .../drm/i915/display/intel_display_debugfs.c  |  9 +++-
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 51 ++++++++++---------
 drivers/gpu/drm/i915/display/intel_hdcp.h     |  4 +-
 3 files changed, 37 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 68f4ba8c46e7..5ffd31e9908f 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -644,6 +644,7 @@ static void intel_panel_info(struct seq_file *m, struct intel_panel *panel)
 static void intel_hdcp_info(struct seq_file *m,
 			    struct intel_connector *intel_connector)
 {
+	int ret;
 	bool hdcp_cap, hdcp2_cap;
 
 	if (!intel_connector->hdcp.shim) {
@@ -651,8 +652,12 @@ static void intel_hdcp_info(struct seq_file *m,
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
index af166baf8c71..59275919e7b9 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -153,50 +153,49 @@ int intel_hdcp_read_valid_bksv(struct intel_digital_port *dig_port,
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
 	mutex_lock(&dev_priv->hdcp_comp_mutex);
 	if (!dev_priv->hdcp_comp_added ||  !dev_priv->hdcp_master) {
 		mutex_unlock(&dev_priv->hdcp_comp_mutex);
-		return false;
+		return 0;
 	}
 	mutex_unlock(&dev_priv->hdcp_comp_mutex);
 
 	/* Sink's capability for HDCP2.2 */
-	hdcp->shim->hdcp_2_2_capable(dig_port, &capable);
-
-	return capable;
+	return hdcp->shim->hdcp_2_2_capable(dig_port, capable);
 }
 
 static bool intel_hdcp_in_use(struct drm_i915_private *dev_priv,
@@ -2332,6 +2331,7 @@ int intel_hdcp_enable(struct intel_connector *connector,
 	struct intel_digital_port *dig_port = intel_attached_dig_port(connector);
 	struct intel_hdcp *hdcp = &connector->hdcp;
 	unsigned long check_link_interval = DRM_HDCP_CHECK_PERIOD_MS;
+	bool capable;
 	int ret = -EINVAL;
 
 	if (!hdcp->shim)
@@ -2350,21 +2350,27 @@ int intel_hdcp_enable(struct intel_connector *connector,
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
@@ -2372,7 +2378,6 @@ int intel_hdcp_enable(struct intel_connector *connector,
 					true);
 	}
 
-out:
 	mutex_unlock(&dig_port->hdcp_mutex);
 	mutex_unlock(&hdcp->mutex);
 	return ret;
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.h b/drivers/gpu/drm/i915/display/intel_hdcp.h
index 7c5fd84a7b65..f06f6e5a2b1a 100644
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
Sean Paul, Software Engineer, Google / Chromium OS

