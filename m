Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B296C2739
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 02:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3506D10E6B8;
	Tue, 21 Mar 2023 01:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D7D10E6AF
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 01:18:24 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id y20so17245275lfj.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 18:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679361503;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kyKsHi3GCpQsQBL3ZUsB7GqCNqmr8gVxqyeAbsz/AVg=;
 b=LAcWfLlNbVJI/jBqzT3qpnzVjMdHfGZMWvIDRAV3VjocoMGwSCV+Kj8wp1DT7u9ZTH
 Lhj3GjvF6smFm6cIf4URzb8H7cRSDLccWI1ZpQxHDkGaIuGAnhoMg29MyELACue2BwmC
 9pTkm9U64nW18OHr51H2P3Iq7VO/bLgQLdOz1MVTWrKto78XkjhnmyfKC71I+cPCKzXA
 PqpzZ8rV8H8wsqV9ni22c+Xsy+kNyp5fgvdTK3TnVmabZid1lHYkdKhaP/loLTpSjLgr
 5g8WeEyfZ7vQvto219sIFz0DCPKO6oWGcYeaUuGFNNyqNmBptYV/XxIiPCaQkT5vZgl3
 JDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679361503;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kyKsHi3GCpQsQBL3ZUsB7GqCNqmr8gVxqyeAbsz/AVg=;
 b=etyNiFuv6pyQik0ocrEFkxfuX28aZ4oTq1MmPZpOLt0dDWaw3IMLHB3B0Xsq8GOOMr
 4fDV/DIfR0v8K8XT9JfakkudaEHweDy2iszVsng4L1LaNDHaFUKTofRzK7/kVC8f+zUh
 z4SQo5Vgc2af+kQ2MWf20Mlaa1YADcdyp0ZeX7oLjzRQTjr+M1cAwXDYOzecSjwNd9KV
 lh9rtvOAptV2wRFUWFa26mmdABjbaAOMLWQlHmgrO/wIzMaGrH7lqe5k6mqJP4bIjykI
 iII/kdXOtClcARPTv4YWew9xNN6mlOGcUeoc+a+bSEDGrizffXJYyWfo2YpwJLLBMwDC
 9thg==
X-Gm-Message-State: AO0yUKUyBH7oXyUQIsVR4OiJaCxg1iveM8TcI0PEGyJq6Qy1UKKsFm+K
 5gaLsjR86GGoMEyOY2n/7ARaxw==
X-Google-Smtp-Source: AK7set8RWsq4Zrhl6918J+yefTewlO3hLlJHbTFge15wK46WfuTBOw3fO0GhCrbwotXebulBLCcsDA==
X-Received: by 2002:ac2:495e:0:b0:4a4:7be4:9baf with SMTP id
 o30-20020ac2495e000000b004a47be49bafmr262536lfi.59.1679361503228; 
 Mon, 20 Mar 2023 18:18:23 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c18-20020ac25312000000b004eaec70c68esm46863lfh.294.2023.03.20.18.18.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 18:18:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [RFC PATCH v2 01/13] drm/atomic-helper: split not-scaling part of
 drm_atomic_helper_check_plane_state
Date: Tue, 21 Mar 2023 04:18:09 +0300
Message-Id: <20230321011821.635977-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
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

