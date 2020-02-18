Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 200001635C0
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 23:04:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A4C6EAC0;
	Tue, 18 Feb 2020 22:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A816EAAC
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 22:03:43 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id b141so11313909ybg.10
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 14:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+DAThCAeUYnhUzxPv8jDEX6JPd0YiZKig6k4tZl+QAo=;
 b=H/hdcSEhPuLDk3Brb7FVKiU+YB49NWMYkTD9i4WitX9qV8ODpNUq1twCWnJdYCUpCi
 zp43xF8ZJn5t5ltIhUpPhSP5msauzgyf3zA/WAaJ/E92kHtYlYAMbIZLOBthR4KPzLhq
 929etzDgX2RQEqLoaT8jsi2f+BKCAI7FFcu4oEQ6ieGMYKSwjrQCAUl5RmlcZ1tQzrQn
 To3GAj1XpiVOnhNKB4VgbyAgpxcrcdHSgaK6oTouerbfLo99U10SJJ/Dp0UxBP6EO65f
 MrlDyqGetLEWbvoGv473ylsF6GfQH1p2NomK7Lqhh2BKW9B/gAVwb3uULwfmCzOqL3Hh
 DClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+DAThCAeUYnhUzxPv8jDEX6JPd0YiZKig6k4tZl+QAo=;
 b=YHUrXN1irIwi7ofb67MtRz7qJSFMBypGpFHDffATeyOU12fvvoy2d4K/i/wH+ifjYR
 btBFCHAUWi/VO6riejbIvDJVHO+sSn1Jmhj/nqshN/YW2wfuob6M9hA5pGs1dtVONpmS
 /hHIEqhysihGRZKfu0W5QaJCMH7+mdV8mwsn+Z7FkC7LRadPlakA86MEA9xU/5IpAwcZ
 Q+wOObD85dDVy/APHHjyExZKMcMvirvMN20jHHbJBSUVTzyAJh78b3WM26QeAN/UlumV
 40L5LCsNP91kqiGRcUnuGgsL1SU7FXYY9LLvJtkymWpIU6kzCVu4tWd7dJ63EZptMc/u
 RqEw==
X-Gm-Message-State: APjAAAW6HEVS8va6+zungwrdVUFTVdVlrwKQiPgpd1i2At5IR16f+56g
 Cp/MMvqHuQVECp51qhiJrlgHSHBp3P8=
X-Google-Smtp-Source: APXvYqzEAuvkd+G4QQeFWKapMGJPdBAGnJl61HvAW85IbzILkmMKpuAUrrU49ELabwbfVlvckA6/9g==
X-Received: by 2002:a25:e909:: with SMTP id n9mr21879196ybd.187.1582063422226; 
 Tue, 18 Feb 2020 14:03:42 -0800 (PST)
Received: from localhost ([2620:0:1013:11:1e1:4760:6ce4:fc64])
 by smtp.gmail.com with ESMTPSA id a12sm11440ywa.95.2020.02.18.14.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 14:03:41 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 10/14] drm/i915: Use ddi_update_pipe in intel_dp_mst
Date: Tue, 18 Feb 2020 17:02:38 -0500
Message-Id: <20200218220242.107265-11-sean@poorly.run>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200218220242.107265-1-sean@poorly.run>
References: <20200218220242.107265-1-sean@poorly.run>
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

Changes in v2:
-None
Changes in v3:
-None
Changes in v4:
-None
---
 drivers/gpu/drm/i915/display/intel_ddi.c    | 9 +++++----
 drivers/gpu/drm/i915/display/intel_dp.h     | 4 ++++
 drivers/gpu/drm/i915/display/intel_dp_mst.c | 1 +
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index e84315ce753cd..cd2eac53a3b06 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4108,12 +4108,13 @@ static void intel_ddi_update_pipe_dp(struct intel_encoder *encoder,
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
index 3da1660547888..0a028b58a8bed 100644
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
index d7bfa7c350e99..f44a58e14a736 100644
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
