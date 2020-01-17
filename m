Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBD51411CB
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 20:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5C56F8EC;
	Fri, 17 Jan 2020 19:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EFE6F8EE
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 19:31:21 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id 192so14857146ywy.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 11:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EC0eVUirKQcmSVVw6pDzcfXPPPenb62+TYMFcLStUpE=;
 b=c4+lLtnKCyNtRyMBZH8U5GYJgmpwHO7ic5fYtmDvVwyq/nlVnQpv0/Lgv+WhSFFW3f
 hgKqJBJm/n17frXcxVVeyVlPKcVYdcdJ7qyBiXqfzASjAZX3Yq1HyBI7lDlUnZ80ugbn
 efMC4X9GCH3qbJ6OB4i6Ws4S/lEtkKEdjJW1xbf/rydk+/dHebEU1Oq2YCIeMphhU2Fy
 nbdZU20T2YdLkwoIc6mnbf9ctQ6Nys344IkjrHwDDI1LrM3UR4GXrAx4/sjIKrzPS1AP
 BQFvTKBOSTHyUi8bv8WgXb0oRr11K9W880AmypnRGBXQ45jMmr5HWr+RlEbYISTiv84x
 xc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EC0eVUirKQcmSVVw6pDzcfXPPPenb62+TYMFcLStUpE=;
 b=jP17bLIYwjuDd7LY2h0DyTWYZmv2vT6JM2+sn7o2Alh8epDdRBLPqY2Se2Yeda542F
 KTO0dmZcYYSTPizCfNTiQxlSMvViyhf8yXoSNwrCqExkGC7KQBCLa+dihFrQ2HFVQHhI
 S18gYDxo30qz366EeQphHnmd+34EL3fRVidoIpJWCOwWCBTExXzVr9svonRm3Db0pCOg
 gfuk+Gte4P1yHjhOaQOLbpxMGWrA2T1ZPs7QGOsfK1LVSNxnaLqO/TCzBtstR3uOCzou
 Tw+4gYY49MsnU9Dalyy7sKLSURXpD5Ar/uT08FWr+y2rTpQTkQFT9xnDR/pgzZTvzMgv
 HtwQ==
X-Gm-Message-State: APjAAAUGA6sUKsqbESTZQ54NLG2slZsmLDa1r41JTYxGVbl/5PAckl1D
 MHIrHS84DJ1qGBRyDhmi9mjANDtJ1pm6Ww==
X-Google-Smtp-Source: APXvYqysN6pmIgToA9k6RmMx/UJkh6PsWR7/yF2ET0GbzV/ZBabBe9iLLfSG1HmwnpOq6Goirmo8uA==
X-Received: by 2002:a81:9890:: with SMTP id
 p138mr32096229ywg.224.1579289480281; 
 Fri, 17 Jan 2020 11:31:20 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id a23sm11971803ywa.32.2020.01.17.11.31.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 11:31:19 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 12/12] drm/i915: Add HDCP 1.4 support for MST connectors
Date: Fri, 17 Jan 2020 14:31:03 -0500
Message-Id: <20200117193103.156821-13-sean@poorly.run>
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

Now that all the groundwork has been laid, we can turn on HDCP 1.4 over
MST. Everything except for toggling the HDCP signalling and HDCP 2.2
support is the same as the DP case, so we'll re-use those callbacks

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20191203173638.94919-12-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20191212190230.188505-13-sean@poorly.run #v2

Changes in v2:
- Toggle HDCP from encoder disable/enable
- Don't disable HDCP on MST connector destroy, leave that for encoder
  disable, just ensure the check_work routine isn't running any longer
Changes in v3:
- Place the shim in the new intel_dp_hdcp.c file (Ville)
---
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c | 78 +++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_dp_mst.c  | 14 ++++
 2 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
index 0b6d90980e90..a93ad675e7bb 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
@@ -11,6 +11,7 @@
 #include <drm/drm_print.h>
 
 #include "intel_display_types.h"
+#include "intel_ddi.h"
 #include "intel_dp.h"
 #include "intel_hdcp.h"
 
@@ -585,6 +586,78 @@ static const struct intel_hdcp_shim intel_dp_hdcp_shim = {
 	.protocol = HDCP_PROTOCOL_DP,
 };
 
+static int
+intel_dp_mst_hdcp_toggle_signalling(struct intel_digital_port *intel_dig_port,
+				    enum transcoder cpu_transcoder,
+				    bool enable)
+{
+	int ret;
+
+	ret = intel_ddi_toggle_hdcp_signalling(&intel_dig_port->base,
+					       cpu_transcoder, enable);
+	if (ret)
+		DRM_DEBUG_KMS("%s HDCP signalling failed (%d)\n",
+			      enable ? "Enable" : "Disable", ret);
+	return ret;
+}
+
+static
+int intel_dp_mst_hdcp2_write_msg(struct intel_digital_port *intel_dig_port,
+				 void *buf, size_t size)
+{
+	return -EOPNOTSUPP;
+}
+
+static
+int intel_dp_mst_hdcp2_read_msg(struct intel_digital_port *intel_dig_port,
+				u8 msg_id, void *buf, size_t size)
+{
+	return -EOPNOTSUPP;
+}
+
+static int
+intel_dp_mst_hdcp2_config_stream_type(struct intel_digital_port *intel_dig_port,
+				      bool is_repeater, u8 content_type)
+{
+	return -EOPNOTSUPP;
+}
+
+static
+int intel_dp_mst_hdcp2_check_link(struct intel_digital_port *intel_dig_port)
+{
+	return -EOPNOTSUPP;
+}
+
+static
+int intel_dp_mst_hdcp2_capable(struct intel_digital_port *intel_dig_port,
+			       bool *capable)
+{
+	*capable = false;
+	return 0;
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
+	.check_link = intel_dp_hdcp_check_link,
+	.hdcp_capable = intel_dp_hdcp_capable,
+
+	.write_2_2_msg = intel_dp_mst_hdcp2_write_msg,
+	.read_2_2_msg = intel_dp_mst_hdcp2_read_msg,
+	.config_stream_type = intel_dp_mst_hdcp2_config_stream_type,
+	.check_2_2_link = intel_dp_mst_hdcp2_check_link,
+	.hdcp_2_2_capable = intel_dp_mst_hdcp2_capable,
+
+	.protocol = HDCP_PROTOCOL_DP,
+};
+
 int intel_dp_init_hdcp(struct intel_digital_port *intel_dig_port,
 		       struct intel_connector *intel_connector)
 {
@@ -597,7 +670,10 @@ int intel_dp_init_hdcp(struct intel_digital_port *intel_dig_port,
 	if (!is_hdcp_supported(dev_priv, port))
 		return 0;
 
-	if (!intel_dp_is_edp(intel_dp))
+	if (!intel_encoder_is_mst(intel_encoder))
+		return intel_hdcp_init(intel_connector,
+				       &intel_dp_mst_hdcp_shim);
+	else if (!intel_dp_is_edp(intel_dp))
 		return intel_hdcp_init(intel_connector, &intel_dp_hdcp_shim);
 
 	return 0;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 975d97989d3b..00c2032c71ed 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -36,6 +36,7 @@
 #include "intel_dp.h"
 #include "intel_dp_mst.h"
 #include "intel_dpio_phy.h"
+#include "intel_hdcp.h"
 
 static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 					    struct intel_crtc_state *crtc_state,
@@ -326,6 +327,8 @@ static void intel_mst_disable_dp(struct intel_encoder *encoder,
 
 	DRM_DEBUG_KMS("active links %d\n", intel_dp->active_mst_links);
 
+	intel_hdcp_disable(intel_mst->connector);
+
 	drm_dp_mst_reset_vcpi_slots(&intel_dp->mst_mgr, connector->port);
 
 	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr);
@@ -497,6 +500,13 @@ static void intel_mst_enable_dp(struct intel_encoder *encoder,
 	drm_dp_update_payload_part2(&intel_dp->mst_mgr);
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
@@ -690,6 +700,10 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
 	intel_attach_force_audio_property(connector);
 	intel_attach_broadcast_rgb_property(connector);
 
+	ret = intel_dp_init_hdcp(intel_dig_port, intel_connector);
+	if (ret)
+		DRM_DEBUG_KMS("HDCP init failed, skipping.\n");
+
 	/*
 	 * Reuse the prop from the SST connector because we're
 	 * not allowed to create new props after device registration.
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
