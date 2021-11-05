Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0216D445E47
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 04:05:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BE06E575;
	Fri,  5 Nov 2021 03:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583C06E558
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 03:05:10 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id bi29so7673581qkb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Nov 2021 20:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/UOvHyoagl75GJNLFLfXIN5UN6YQJamngzfB4da89M8=;
 b=VEn8cYVICJEjb1cYskbWWw77ZfIJA0bZeowhONV4r9M6J3r1Snao3Wg8Yb/pztPEjl
 3iuziQgpqopubCZmJXJ/bOeBjxADrNkzW9DtLHZ5TDeF3d86JPWrUZGJyaZPyTXRJ9NS
 0VJkAlG7Civz3DYfYKVH9Gi9unkIVM3jjZ+PD+CQrol+T+PUZ04hcb4rzDro3WVfwzrL
 7V+vBzLGX+0SHaTeQ4HdaYBFfB2Rx3emk70l5vLaUhlptsjNpMWLTC+0tTYa4IW3E1iQ
 /gaGLTWvSoYn0oOGkro+a2PiraLspHZjjXgKVMNNl3MDcxvUaoeBCbX+7twDcWvCSvTs
 m1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/UOvHyoagl75GJNLFLfXIN5UN6YQJamngzfB4da89M8=;
 b=m1LlGRmmECXuOH2nZxForPy83Gc/AD2o10ccdO7hYsHPIh5tFKnvG0K2yQpSp0aybz
 IOjwxJV+9z/vFCGfSmP0SKYK1T+o07J51i61jtbmkUEj1Y9QxTR1EBNANbEs0wSyCqEN
 KKWhpuvYp0rxSYzZYrl/dIGWfz/UBKgBNmcN3jxDw76djPaCONbl/uG3Y+U56htq48a4
 gLurusgDIRqFYfz4LlK/bhlDJtvJzulun7qOod1ZlxltK2tHh9NW9MxGGyPfCLVDNRKX
 NKQyq0/2ulWtGdLT7xGCjst/PKOQKTzH+DFyp9QwzZ3TVqZN/XNvdMXQjfbnyMDPAhKi
 8yCQ==
X-Gm-Message-State: AOAM531VL8gQ9t4vUCPrwmHzbGil6STdah5mDsOAtGwRD1UPe6VYX6qV
 qTndzMYj/4bEwTFvoiNhKoPVhfBfDpulgA==
X-Google-Smtp-Source: ABdhPJzw0HYsjGLi1k21yJZmtzvhYDuhBy2/1AACd6/q/3C2fIvC9SORIfL9kMMOuUYQ+SmAUPrggw==
X-Received: by 2002:a05:620a:4411:: with SMTP id
 v17mr43325133qkp.431.1636081508891; 
 Thu, 04 Nov 2021 20:05:08 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id w22sm4907586qto.15.2021.11.04.20.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:05:08 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v4 06/14] drm/i915/hdcp: Retain hdcp_capable return codes
Date: Thu,  4 Nov 2021 23:04:23 -0400
Message-Id: <20211105030434.2828845-7-sean@poorly.run>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211105030434.2828845-1-sean@poorly.run>
References: <20211105030434.2828845-1-sean@poorly.run>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, jani.nikula@intel.com,
 swboyd@chromium.org, David Airlie <airlied@linux.ie>,
 Sean Paul <seanpaul@chromium.org>, abhinavk@codeaurora.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, bjorn.andersson@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

The shim functions return error codes, but they are discarded in
intel_hdcp.c. This patch plumbs the return codes through so they are
properly handled.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-7-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-7-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-7-sean@poorly.run #v3

Changes in v2:
-None
Changes in v3:
-None
Changes in v4:
-None
---
 .../drm/i915/display/intel_display_debugfs.c  |  9 +++-
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 51 ++++++++++---------
 drivers/gpu/drm/i915/display/intel_hdcp.h     |  4 +-
 3 files changed, 37 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index d7d6dde518a3..ef3039fb1e0c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -643,6 +643,7 @@ static void intel_panel_info(struct seq_file *m, struct intel_panel *panel)
 static void intel_hdcp_info(struct seq_file *m,
 			    struct intel_connector *intel_connector)
 {
+	int ret;
 	bool hdcp_cap, hdcp2_cap;
 
 	if (!intel_connector->hdcp.shim) {
@@ -650,8 +651,12 @@ static void intel_hdcp_info(struct seq_file *m,
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
index 8fc830e38311..ac05d2c6d3e7 100644
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

