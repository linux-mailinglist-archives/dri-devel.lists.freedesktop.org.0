Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C84D1411C2
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 20:31:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA476F8EB;
	Fri, 17 Jan 2020 19:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27DE6F8E5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 19:31:18 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id l22so14845375ywc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 11:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CVp0iaVlF0nO///15Pnb5sk5f0/+/YTOeu8+lpIkcpI=;
 b=bTt0dwHnq7o+7un24uht4HBmTSL8cB4Eljm2zHFM6I8UtVkuHG5aFd+mkUwW/YTR5q
 JTQIKYicadJKsmqvht0GG83CfJ1+0vrtntQ5cYL0nDs6jFxWSCuepMmaSsPonwHfpFwk
 6hzquhoAM+jy1n7X2zx6+JEKrJTDQtrrsXITBG+nspOWTpOqC9WJ3pkMEpR6J56wXFc5
 MrQm5yemEwaqDm/oOMH5MqNGCe3IRpRyC/bCOQpmCWRWB8KAbezbPasU28RF1cmQ65hB
 +5nK33vbzeK8hBXe+x872WTrPRnsnNmbiviUWM0EH6O2eRLgWZTv80E3ldw7qvAgMlIq
 ttBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CVp0iaVlF0nO///15Pnb5sk5f0/+/YTOeu8+lpIkcpI=;
 b=VPBkMnFmdXL9dHt2Ag8Nlb8czpF7N8u151DgLZ4suVPy7HBYi27m0Xj3L5qM7R4ZUz
 jRSr0XWIKfJBliCr1RWhn9bL7InuFh/NsHT5GnLySkN/YvUUJDPh3+xxuzXym3ScDarp
 8GXfnPKb9QH5hfxIqB7KioP/vaVUiqmyIxTqhaiy3MzLqvmVXCMZSZcZHzvfbE4NhBR0
 9/G2y1m5S2F9JAYb2GmyM/W7KNecC6HkbV7vkYSV6xUy//kaPH9PQP5DBgDZ939PIr5Y
 dZ+I84DuByGGInOZF1+8GonTfxDHHysSyz79iOcOEIEennlp0uZrtoaDCD1Qj/avERrl
 GPAQ==
X-Gm-Message-State: APjAAAU/Gr24I+3Yo9FNm0wADgUliabEEd3F27OPIwzDH1OMyqqWcocS
 aaJX+aIVhzNq0bWNPBwhzvu6SIvJwoss2A==
X-Google-Smtp-Source: APXvYqwEOd+XBNax5JSbaTr1u1iU6k+SMgutvsRrwm53mQnASW/cZEpkCCV4zdmD77M4FtTW5WVrzQ==
X-Received: by 2002:a81:ac47:: with SMTP id z7mr30597420ywj.42.1579289477811; 
 Fri, 17 Jan 2020 11:31:17 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id e185sm12292661ywa.33.2020.01.17.11.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 11:31:17 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 10/12] drm/i915: Use ddi_update_pipe in intel_dp_mst
Date: Fri, 17 Jan 2020 14:31:01 -0500
Message-Id: <20200117193103.156821-11-sean@poorly.run>
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

In order to act upon content_protection property changes, we'll need to
implement the .update_pipe() hook. We can re-use intel_ddi_update_pipe
for this

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20191203173638.94919-10-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20191212190230.188505-11-sean@poorly.run #v2

Changes in v2:
-None
Changes in v3:
-None
---
 drivers/gpu/drm/i915/display/intel_ddi.c    | 9 +++++----
 drivers/gpu/drm/i915/display/intel_dp.h     | 4 ++++
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 1 +
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 4073dd96b83e..43e935d3d86c 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4136,9 +4136,9 @@ static void intel_ddi_update_pipe_dp(struct intel_encoder *encoder,
 	intel_panel_update_backlight(encoder, crtc_state, conn_state);
 }
 
-static void intel_ddi_update_pipe(struct intel_encoder *encoder,
-				  const struct intel_crtc_state *crtc_state,
-				  const struct drm_connector_state *conn_state)
+void intel_ddi_update_pipe(struct intel_encoder *encoder,
+			   const struct intel_crtc_state *crtc_state,
+			   const struct drm_connector_state *conn_state)
 {
 	struct intel_connector *connector =
 				to_intel_connector(conn_state->connector);
@@ -4148,7 +4148,8 @@ static void intel_ddi_update_pipe(struct intel_encoder *encoder,
 			 conn_state->content_protection !=
 			 DRM_MODE_CONTENT_PROTECTION_UNDESIRED);
 
-	if (!intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI))
+	if (!intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI) &&
+	    !intel_encoder_is_mst(encoder))
 		intel_ddi_update_pipe_dp(encoder, crtc_state, conn_state);
 
 	/*
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 3da166054788..0a028b58a8be 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -125,4 +125,8 @@ static inline unsigned int intel_dp_unused_lane_mask(int lane_count)
 
 u32 intel_dp_mode_to_fec_clock(u32 mode_clock);
 
+void intel_ddi_update_pipe(struct intel_encoder *encoder,
+			   const struct intel_crtc_state *crtc_state,
+			   const struct drm_connector_state *conn_state);
+
 #endif /* __INTEL_DP_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index cba68c5a80fa..975d97989d3b 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -774,6 +774,7 @@ intel_dp_create_fake_mst_encoder(struct intel_digital_port *intel_dig_port, enum
 	intel_encoder->compute_config = intel_dp_mst_compute_config;
 	intel_encoder->disable = intel_mst_disable_dp;
 	intel_encoder->post_disable = intel_mst_post_disable_dp;
+	intel_encoder->update_pipe = intel_ddi_update_pipe;
 	intel_encoder->pre_pll_enable = intel_mst_pre_pll_enable_dp;
 	intel_encoder->pre_enable = intel_mst_pre_enable_dp;
 	intel_encoder->enable = intel_mst_enable_dp;
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
