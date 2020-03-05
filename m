Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B4417AF83
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 21:13:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6CD6EC28;
	Thu,  5 Mar 2020 20:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960866EC22
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2020 20:12:50 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id d206so6852365ywa.12
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Mar 2020 12:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zeLIjhBH34QJINWJ32/W43zUmw1KCnIUV/c2ai2RHy0=;
 b=PoL6Jw5d8XQRt0ulFgbsKBDAnPQ5DTvc2IV4bp8w2dSvXZYiyqXgXfdauPEEg3e6eA
 xjezrIvTiQIKDhHI4eCl+ZOO2xWeo83LPDaPH4WZ1dDRFK0y1+b7AR0oGM7LDq5+FUwJ
 JA4VpeWoqLoiT5RlEO+vrMAQDltRR2608317TFsKk4fryHuEf6xPSgJwv2e0UdY4/GFO
 +ck2aD21+FoXmovplXCXRbiFJlkxG3uWJqr2PEvfDhBcOqpaPhn8qSA3cAp9bGZVsU25
 1SIQ/bV7YBkF/JGRcZGTzRWA7rVE0rwxw28co6VPmMmG4IkSvXXk4XeR5xd+D9Mk65ss
 70/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zeLIjhBH34QJINWJ32/W43zUmw1KCnIUV/c2ai2RHy0=;
 b=CIJYq4KXnF3eTbAiUDmhPnNThWqWj2ScRUWQz/3sjHhtJ17oOHcDtlQhSt9xJCyTgT
 A2p/7Fos5zUr20lpvfCwp3BqbnnFVmskyRN+/lj/2Q4ZtstSHkt6HDHS7KIJiBtv+GqA
 Ldomd3KSVXIBk7umCzw0JuaQo647gVxVxZUZ4OXVaVDUFevMSpvwjigWGmzLq5P8Sfag
 5q+bR23VDXu7Ja7SwrRnOTmco8FOEmtMgjy8OWQlBtOBk3j0cSahBt8d9d0nYy4dIH8J
 Ml2QiTMCLPbtUyl1P9sHU78LXOjJYNAIaSzT1BGi0cT5npu1NGko5yhyXNBZmU1tBLht
 AytA==
X-Gm-Message-State: ANhLgQ3xxedeZ4nInhu0JRLP1oLXyp321JWiupFKhYPLyZsQJcIk+Ll3
 tUGbL+DQgxInmE1ugf0fB8BIqWOlm1g=
X-Google-Smtp-Source: ADFU+vu0V1c6Jmj8zi2aC1IyV4WTV4sjjAgUMf3Uej5CGR8Wxrm2pASW+ywu16HqMuix9wwo9DmlNw==
X-Received: by 2002:a25:4e08:: with SMTP id c8mr9269604ybb.329.1583439169590; 
 Thu, 05 Mar 2020 12:12:49 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id g192sm12970500ywe.99.2020.03.05.12.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 12:12:49 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 10/16] drm/i915: Use ddi_update_pipe in intel_dp_mst
Date: Thu,  5 Mar 2020 15:12:30 -0500
Message-Id: <20200305201236.152307-11-sean@poorly.run>
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

In order to act upon content_protection property changes, we'll need to
implement the .update_pipe() hook. We can re-use intel_ddi_update_pipe
for this

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20191203173638.94919-10-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20191212190230.188505-11-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20200117193103.156821-11-sean@poorly.run #v3
Link: https://patchwork.freedesktop.org/patch/msgid/20200218220242.107265-11-sean@poorly.run #v4

Changes in v2:
-None
Changes in v3:
-None
Changes in v4:
-None
Changes in v5:
-None
---
 drivers/gpu/drm/i915/display/intel_ddi.c    | 9 +++++----
 drivers/gpu/drm/i915/display/intel_dp.h     | 4 ++++
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 1 +
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 48910a2ceaaaa..149937da20586 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3695,12 +3695,13 @@ static void intel_ddi_update_pipe_dp(struct intel_encoder *encoder,
 	intel_panel_update_backlight(encoder, crtc_state, conn_state);
 }
 
-static void intel_ddi_update_pipe(struct intel_encoder *encoder,
-				  const struct intel_crtc_state *crtc_state,
-				  const struct drm_connector_state *conn_state)
+void intel_ddi_update_pipe(struct intel_encoder *encoder,
+			   const struct intel_crtc_state *crtc_state,
+			   const struct drm_connector_state *conn_state)
 {
 
-	if (!intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI))
+	if (!intel_crtc_has_type(crtc_state, INTEL_OUTPUT_HDMI) &&
+	    !intel_encoder_is_mst(encoder))
 		intel_ddi_update_pipe_dp(encoder, crtc_state, conn_state);
 
 	intel_hdcp_update_pipe(encoder, crtc_state, conn_state);
diff --git a/drivers/gpu/drm/i915/display/intel_dp.h b/drivers/gpu/drm/i915/display/intel_dp.h
index 0c7be8ed1423a..ae4a1517632bf 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.h
+++ b/drivers/gpu/drm/i915/display/intel_dp.h
@@ -123,4 +123,8 @@ static inline unsigned int intel_dp_unused_lane_mask(int lane_count)
 
 u32 intel_dp_mode_to_fec_clock(u32 mode_clock);
 
+void intel_ddi_update_pipe(struct intel_encoder *encoder,
+			   const struct intel_crtc_state *crtc_state,
+			   const struct drm_connector_state *conn_state);
+
 #endif /* __INTEL_DP_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 39f5de9a8c7ce..af658c76125c1 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -787,6 +787,7 @@ intel_dp_create_fake_mst_encoder(struct intel_digital_port *intel_dig_port, enum
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
