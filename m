Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 519612056A7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 18:00:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92FBC6E9D6;
	Tue, 23 Jun 2020 15:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0256E9E9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 15:59:45 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id p7so2569593qvl.4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 08:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WW8qZCA11ZKSPSFI9UqeEUGw7b7GDbXfXk2AYwQdKRI=;
 b=H6xN9CsdDvpDhdeFYGW7/ouG4C/z+/9z4/WKFGI3tX1XQ4igLh8HI/n0gccTgWytef
 54ltqpGZkDubn0CMPZu5Sslon/ylhUP7mZHVcdVzeDbrDlolWwsKeqnnSVkK2SY9dgtX
 fF4gS9nIeeDx2mqI0A9LgiCEm9r4FkQFrVlOmagY7LFTBPbfLohXiT5ibtsOgz8jRYkD
 inGoAY5hpberbLkfi9mVFLwz0J8f3arQQIGmombPb9664Rc9w9lqS4ypkb4HMU4B/S+/
 tuhmfwmPsgrRfbA2qAHlyCX8pCQhpBCgGW8S/BTRaTtJ2Sau9+R2OUbnsoAyoeqlKMoY
 Xmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WW8qZCA11ZKSPSFI9UqeEUGw7b7GDbXfXk2AYwQdKRI=;
 b=X5K++Y5uCu+o35PL8yH5UpuDcYwsONXZSjgh/6h+ReuRe+IhjG6tiBb/u7ky2uLwXT
 0bLDBr+O0Lt+5H7CHp58qhevaukSSWM1l2XiTPBYWzAAeae2m2fNs4E4w4eWdKzeB61j
 G0HgaMgeXFOIA+yuQgZ5JHY3TRyJzyWLkWWSEY5bUwo5SUM1P9HJ2g1mtG3yY1RnjWM8
 BVML41FEo98NcYUjnYHWzqDfmpsR07CsBecXWr2Noi8ZPE/dPlPamokaVbIwxIfifgf3
 9SB8gJIM+JhGE5bqdegcWMAukisR4h67X2nP7BSNzNYRskACafzGetJ5JcKMWgJqT95u
 F2FQ==
X-Gm-Message-State: AOAM5326q2fn0MCwtOsPVUc6w07oNmkkmz/B5DwUa4lTpl5Sg4RdmuEW
 Wz7aJCku3iY10ggRvj584tgIIXPIgXg=
X-Google-Smtp-Source: ABdhPJw0zkGqGiSc+wcCw9OIayQFQtA2XzOXKCvs+QSJtKtDl82gsZJ3LG3oRFA/rTAxZdmCGOhCow==
X-Received: by 2002:a0c:f80a:: with SMTP id r10mr11151032qvn.238.1592927984263; 
 Tue, 23 Jun 2020 08:59:44 -0700 (PDT)
Received: from localhost ([166.137.96.174])
 by smtp.gmail.com with ESMTPSA id t54sm1014904qte.24.2020.06.23.08.59.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Jun 2020 08:59:43 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 17/17] drm/i915: Add HDCP 1.4 support for MST connectors
Date: Tue, 23 Jun 2020 11:59:07 -0400
Message-Id: <20200623155907.22961-18-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200623155907.22961-1-sean@poorly.run>
References: <20200623155907.22961-1-sean@poorly.run>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Now that all the groundwork has been laid, we can turn on HDCP 1.4 over
MST. Everything except for toggling the HDCP signalling and HDCP 2.2
support is the same as the DP case, so we'll re-use those callbacks

Cc: Juston Li <juston.li@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20191203173638.94919-12-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20191212190230.188505-13-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20200117193103.156821-13-sean@poorly.run #v3
Link: https://patchwork.freedesktop.org/patch/msgid/20200218220242.107265-15-sean@poorly.run #v4
Link: https://patchwork.freedesktop.org/patch/msgid/20200305201236.152307-17-sean@poorly.run #v5
Link: https://patchwork.freedesktop.org/patch/msgid/20200429195502.39919-17-sean@poorly.run #v6

Changes in v2:
-Toggle HDCP from encoder disable/enable
-Don't disable HDCP on MST connector destroy, leave that for encoder
 disable, just ensure the check_work routine isn't running any longer
Changes in v3:
-Place the shim in the new intel_dp_hdcp.c file (Ville)
Changes in v4:
-Actually use the mst shim for mst connections (Juston)
-Use QUERY_STREAM_ENC_STATUS MST message to verify channel is encrypted
Changes in v5:
-Add sleep on disable signalling to match hdmi delay
Changes in v6:
-Disable HDCP over MST on GEN12+ since I'm unsure how it should work and I
 don't have hardware to test it
Changes in v7:
-Remove hdcp2 shims for MST in favor of skipping hdcp2 init (Ramalingam)
---
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 66 +++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_dp_mst.c  | 18 ++++++
 drivers/gpu/drm/i915/display/intel_hdcp.c    |  2 +-
 3 files changed, 84 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
index 43446a6cae8d..3f67bd27fc3c 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
@@ -7,10 +7,12 @@
  */
 
 #include <drm/drm_dp_helper.h>
+#include <drm/drm_dp_mst_helper.h>
 #include <drm/drm_hdcp.h>
 #include <drm/drm_print.h>
 
 #include "intel_display_types.h"
+#include "intel_ddi.h"
 #include "intel_dp.h"
 #include "intel_hdcp.h"
 
@@ -618,6 +620,65 @@ static const struct intel_hdcp_shim intel_dp_hdcp_shim = {
 	.protocol = HDCP_PROTOCOL_DP,
 };
 
+static int
+intel_dp_mst_hdcp_toggle_signalling(struct intel_digital_port *intel_dig_port,
+				    enum transcoder cpu_transcoder,
+				    bool enable)
+{
+	struct drm_i915_private *i915 = to_i915(intel_dig_port->base.base.dev);
+	int ret;
+
+	if (!enable)
+		usleep_range(6, 60); /* Bspec says >= 6us */
+
+	ret = intel_ddi_toggle_hdcp_signalling(&intel_dig_port->base,
+					       cpu_transcoder, enable);
+	if (ret)
+		drm_dbg_kms(&i915->drm, "%s HDCP signalling failed (%d)\n",
+			      enable ? "Enable" : "Disable", ret);
+	return ret;
+}
+
+static
+bool intel_dp_mst_hdcp_check_link(struct intel_digital_port *intel_dig_port,
+				  struct intel_connector *connector)
+{
+	struct drm_i915_private *i915 = to_i915(intel_dig_port->base.base.dev);
+	struct intel_dp *intel_dp = &intel_dig_port->dp;
+	struct drm_dp_query_stream_enc_status_ack_reply reply;
+	int ret;
+
+	if (!intel_dp_hdcp_check_link(intel_dig_port, connector))
+		return false;
+
+	ret = drm_dp_send_query_stream_enc_status(&intel_dp->mst_mgr,
+						  connector->port, &reply);
+	if (ret) {
+		drm_dbg_kms(&i915->drm,
+			    "[CONNECTOR:%d:%s] failed QSES ret=%d\n",
+			    connector->base.base.id, connector->base.name, ret);
+		return false;
+	}
+
+	return reply.auth_completed && reply.encryption_enabled;
+}
+
+static const struct intel_hdcp_shim intel_dp_mst_hdcp_shim = {
+	.write_an_aksv = intel_dp_hdcp_write_an_aksv,
+	.read_bksv = intel_dp_hdcp_read_bksv,
+	.read_bstatus = intel_dp_hdcp_read_bstatus,
+	.repeater_present = intel_dp_hdcp_repeater_present,
+	.read_ri_prime = intel_dp_hdcp_read_ri_prime,
+	.read_ksv_ready = intel_dp_hdcp_read_ksv_ready,
+	.read_ksv_fifo = intel_dp_hdcp_read_ksv_fifo,
+	.read_v_prime_part = intel_dp_hdcp_read_v_prime_part,
+	.toggle_signalling = intel_dp_mst_hdcp_toggle_signalling,
+	.check_link = intel_dp_mst_hdcp_check_link,
+	.hdcp_capable = intel_dp_hdcp_capable,
+
+	.protocol = HDCP_PROTOCOL_DP,
+};
+
 int intel_dp_init_hdcp(struct intel_digital_port *intel_dig_port,
 		       struct intel_connector *intel_connector)
 {
@@ -630,7 +691,10 @@ int intel_dp_init_hdcp(struct intel_digital_port *intel_dig_port,
 	if (!is_hdcp_supported(dev_priv, port))
 		return 0;
 
-	if (!intel_dp_is_edp(intel_dp))
+	if (intel_connector->mst_port)
+		return intel_hdcp_init(intel_connector, port,
+				       &intel_dp_mst_hdcp_shim);
+	else if (!intel_dp_is_edp(intel_dp))
 		return intel_hdcp_init(intel_connector, port,
 				       &intel_dp_hdcp_shim);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 0675825dcc20..abaaeeb963d2 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -37,6 +37,7 @@
 #include "intel_dp.h"
 #include "intel_dp_mst.h"
 #include "intel_dpio_phy.h"
+#include "intel_hdcp.h"
 
 static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 					    struct intel_crtc_state *crtc_state,
@@ -352,6 +353,8 @@ static void intel_mst_disable_dp(struct intel_atomic_state *state,
 	drm_dbg_kms(&i915->drm, "active links %d\n",
 		    intel_dp->active_mst_links);
 
+	intel_hdcp_disable(intel_mst->connector);
+
 	drm_dp_mst_reset_vcpi_slots(&intel_dp->mst_mgr, connector->port);
 
 	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr);
@@ -548,6 +551,13 @@ static void intel_mst_enable_dp(struct intel_atomic_state *state,
 
 	if (pipe_config->has_audio)
 		intel_audio_codec_enable(encoder, pipe_config, conn_state);
+
+	/* Enable hdcp if it's desired */
+	if (conn_state->content_protection ==
+	    DRM_MODE_CONTENT_PROTECTION_DESIRED)
+		intel_hdcp_enable(to_intel_connector(conn_state->connector),
+				  pipe_config->cpu_transcoder,
+				  (u8)conn_state->hdcp_content_type);
 }
 
 static bool intel_dp_mst_enc_get_hw_state(struct intel_encoder *encoder,
@@ -770,6 +780,14 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 	intel_attach_force_audio_property(connector);
 	intel_attach_broadcast_rgb_property(connector);
 
+
+	/* TODO: Figure out how to make HDCP work on GEN12+ */
+	if (INTEL_GEN(dev_priv) < 12) {
+		ret = intel_dp_init_hdcp(intel_dig_port, intel_connector);
+		if (ret)
+			DRM_DEBUG_KMS("HDCP init failed, skipping.\n");
+	}
+
 	/*
 	 * Reuse the prop from the SST connector because we're
 	 * not allowed to create new props after device registration.
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 6bd0e4616ee1..ddc9db8de2bc 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -2060,7 +2060,7 @@ int intel_hdcp_init(struct intel_connector *connector,
 	if (!shim)
 		return -EINVAL;
 
-	if (is_hdcp2_supported(dev_priv))
+	if (is_hdcp2_supported(dev_priv) && !connector->mst_port)
 		intel_hdcp2_init(connector, port, shim);
 
 	ret =
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
