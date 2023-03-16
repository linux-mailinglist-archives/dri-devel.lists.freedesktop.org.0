Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD7B6BD66B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 17:56:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A51910ED76;
	Thu, 16 Mar 2023 16:55:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5C610ED4C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 16:55:46 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id a32so2369816ljr.9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 09:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678985744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kyKsHi3GCpQsQBL3ZUsB7GqCNqmr8gVxqyeAbsz/AVg=;
 b=wTuCcYolc3CoCcRkxmZS4beqTe2yfeq82o2I2xPlbj27cu7+xbeX0xQQhOS38TxHsD
 TFh3Cixx9NI/FQI8ybwn1KvYwli+q4dbWy4THzzS8H/X71RzKgYoZCrRIxnd6LHhTEpr
 f+6BeHIqpPJCeTxDS38o5ODkKP2lKtAEvV3zeDYQDfh/whm2vGVvVu70UnIpVeP8EA/8
 ZJAW24l8lB34olAOnj4KByhKjsvHq2EZgzLxb8Es3lCx5pkrZ+XrO6tiqW8o/u0fcUrh
 M7KiyjA0kzMTCFVTRQzSDacKww479EszNPC3fSIP8GmABHElgR7L3OkXCirpeVS7D5EN
 M3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678985744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kyKsHi3GCpQsQBL3ZUsB7GqCNqmr8gVxqyeAbsz/AVg=;
 b=c54UbA4ImPKUdPJpX+QzE+ZuLB5wF5DqnJkDaJxyoJ6FBoy5fbBCRnajWLSq9qkLED
 IQEQQYstl7FDRyNnHgk20usJ1DTBDcihVJlLNzb9QmUe2FZH6n74m0bfgoB6IRtVf94r
 9XxJhYTXicZTRdEHHr86Q0teJ9Yd/r8DZeHfw3NKoaegiojUAowABOmruQo5paTD1tqw
 w+WwhxdqLJT4d7/w3XlWg8iX0QPWUolZqsGLSER3deA7c1k8RgxDAXzo76k9hHA3YpeU
 AHDjstvfLyZm5zm2gHRa9HYNT3SN0cEoO6fJUtnq0tGzBer8Wb2LyGmfjRoVaQ8prwvE
 URRQ==
X-Gm-Message-State: AO0yUKX3lPH2uQ9EYOpD+JvTGq9APppf4GMxqXpxNTNSTr93SGkY/Eni
 mmDILGpcFJH0w63ZoGWK9dU7QQ==
X-Google-Smtp-Source: AK7set8sD0oPMOoxk/ZYzXNrkBgG1RfEnqb5VAav3KS7JbdrKk235BorbYxdOgKDtnzWyx1DJ1IiYA==
X-Received: by 2002:a05:651c:1545:b0:290:6e3b:be34 with SMTP id
 y5-20020a05651c154500b002906e3bbe34mr2946716ljp.42.1678985744691; 
 Thu, 16 Mar 2023 09:55:44 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a2e9c52000000b002934b5d6a61sm2661ljj.121.2023.03.16.09.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:55:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [RFC PATCH v1 01/12] drm/atomic-helper: split not-scaling part of
 drm_atomic_helper_check_plane_state
Date: Thu, 16 Mar 2023 19:55:31 +0300
Message-Id: <20230316165542.4109764-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316165542.4109764-1-dmitry.baryshkov@linaro.org>
References: <20230316165542.4109764-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The helper drm_atomic_helper_check_plane_state() runs several checks on
plane src and dst rectangles, including the check whether required
scaling fits into the required margins. The msm driver would benefit
from having a function that does all these checks except the scaling
one. Split them into a new helper called
drm_atomic_helper_check_plane_noscale().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 85 ++++++++++++++++++++++-------
 include/drm/drm_atomic_helper.h     |  4 ++
 2 files changed, 68 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index d579fd8f7cb8..86c5e19c7bdb 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -825,11 +825,9 @@ drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
 EXPORT_SYMBOL(drm_atomic_helper_check_wb_encoder_state);
 
 /**
- * drm_atomic_helper_check_plane_state() - Check plane state for validity
+ * drm_atomic_helper_check_plane_noscale() - Check plane state for validity
  * @plane_state: plane state to check
  * @crtc_state: CRTC state to check
- * @min_scale: minimum @src:@dest scaling factor in 16.16 fixed point
- * @max_scale: maximum @src:@dest scaling factor in 16.16 fixed point
  * @can_position: is it legal to position the plane such that it
  *                doesn't cover the entire CRTC?  This will generally
  *                only be false for primary planes.
@@ -845,19 +843,16 @@ EXPORT_SYMBOL(drm_atomic_helper_check_wb_encoder_state);
  * RETURNS:
  * Zero if update appears valid, error code on failure
  */
-int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
-					const struct drm_crtc_state *crtc_state,
-					int min_scale,
-					int max_scale,
-					bool can_position,
-					bool can_update_disabled)
+int drm_atomic_helper_check_plane_noscale(struct drm_plane_state *plane_state,
+					  const struct drm_crtc_state *crtc_state,
+					  bool can_position,
+					  bool can_update_disabled)
 {
 	struct drm_framebuffer *fb = plane_state->fb;
 	struct drm_rect *src = &plane_state->src;
 	struct drm_rect *dst = &plane_state->dst;
 	unsigned int rotation = plane_state->rotation;
 	struct drm_rect clip = {};
-	int hscale, vscale;
 
 	WARN_ON(plane_state->crtc && plane_state->crtc != crtc_state->crtc);
 
@@ -883,17 +878,6 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 
 	drm_rect_rotate(src, fb->width << 16, fb->height << 16, rotation);
 
-	/* Check scaling */
-	hscale = drm_rect_calc_hscale(src, dst, min_scale, max_scale);
-	vscale = drm_rect_calc_vscale(src, dst, min_scale, max_scale);
-	if (hscale < 0 || vscale < 0) {
-		drm_dbg_kms(plane_state->plane->dev,
-			    "Invalid scaling of plane\n");
-		drm_rect_debug_print("src: ", &plane_state->src, true);
-		drm_rect_debug_print("dst: ", &plane_state->dst, false);
-		return -ERANGE;
-	}
-
 	if (crtc_state->enable)
 		drm_mode_get_hv_timing(&crtc_state->mode, &clip.x2, &clip.y2);
 
@@ -921,6 +905,65 @@ int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 
 	return 0;
 }
+EXPORT_SYMBOL(drm_atomic_helper_check_plane_noscale);
+
+/**
+ * drm_atomic_helper_check_plane_state() - Check plane state for validity
+ * @plane_state: plane state to check
+ * @crtc_state: CRTC state to check
+ * @min_scale: minimum @src:@dest scaling factor in 16.16 fixed point
+ * @max_scale: maximum @src:@dest scaling factor in 16.16 fixed point
+ * @can_position: is it legal to position the plane such that it
+ *                doesn't cover the entire CRTC?  This will generally
+ *                only be false for primary planes.
+ * @can_update_disabled: can the plane be updated while the CRTC
+ *                       is disabled?
+ *
+ * Checks that a desired plane update is valid, and updates various
+ * bits of derived state (clipped coordinates etc.). Drivers that provide
+ * their own plane handling rather than helper-provided implementations may
+ * still wish to call this function to avoid duplication of error checking
+ * code.
+ *
+ * RETURNS:
+ * Zero if update appears valid, error code on failure
+ */
+int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
+					const struct drm_crtc_state *crtc_state,
+					int min_scale,
+					int max_scale,
+					bool can_position,
+					bool can_update_disabled)
+{
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_rect src;
+	struct drm_rect dst;
+	int hscale, vscale, ret;
+
+	ret = drm_atomic_helper_check_plane_noscale(plane_state, crtc_state, can_position, can_update_disabled);
+	if (ret < 0)
+		return ret;
+
+	if (!plane_state->visible)
+		return 0;
+
+	src = drm_plane_state_src(plane_state);
+	dst = drm_plane_state_dest(plane_state);
+
+	drm_rect_rotate(&src, fb->width << 16, fb->height << 16, plane_state->rotation);
+
+	hscale = drm_rect_calc_hscale(&src, &dst, min_scale, max_scale);
+	vscale = drm_rect_calc_vscale(&src, &dst, min_scale, max_scale);
+	if (hscale < 0 || vscale < 0) {
+		drm_dbg_kms(plane_state->plane->dev,
+			    "Invalid scaling of plane\n");
+		drm_rect_debug_print("src: ", &plane_state->src, true);
+		drm_rect_debug_print("dst: ", &plane_state->dst, false);
+		return -ERANGE;
+	}
+
+	return 0;
+}
 EXPORT_SYMBOL(drm_atomic_helper_check_plane_state);
 
 /**
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 33f982cd1a27..ebf95437431d 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -52,6 +52,10 @@ int drm_atomic_helper_check_modeset(struct drm_device *dev,
 int
 drm_atomic_helper_check_wb_encoder_state(struct drm_encoder *encoder,
 					 struct drm_connector_state *conn_state);
+int drm_atomic_helper_check_plane_noscale(struct drm_plane_state *plane_state,
+					  const struct drm_crtc_state *crtc_state,
+					  bool can_position,
+					  bool can_update_disabled);
 int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
 					const struct drm_crtc_state *crtc_state,
 					int min_scale,
-- 
2.30.2

