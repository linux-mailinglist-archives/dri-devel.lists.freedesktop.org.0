Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BF99B5383
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 21:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487CC10E6FB;
	Tue, 29 Oct 2024 20:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ic6E70m7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D964710E6FC
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 20:28:35 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-539983beb19so7018196e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 13:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730233714; x=1730838514; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=okL6Htptn3WmNRDIbzbj3SlxrMQsUP6Is5kTunjhLD4=;
 b=ic6E70m7AAcQkyd+GP2000yWyr/pbhnuDhuTSrxGpdiNqq9ZqhYiktIPh6w6VYCMDZ
 e4bETv5mJ8sG1ABUsKqjplO1wGnEEwUWRyE9INDUuDqndcdZ3KbJfkPaPlA/IFOSAQBW
 d8SlbSSGgTWZ46SEY9gEnfKKPZYYqTG/8jqZXoiN9wItGJHCf/FoIrL5mgcfSovWfBCc
 Y7Ckd7ruTazZJyzBk1JPKjiZJj23yWka5Xfu2d32DbRbws3DCpTm4hoDu4oJLqqaqEgg
 7v8jqHVapp5ygnkrfq1gtt3eFG5Hr69q3ywAnfBZX9CMSSsCb/vdyT64Ft3hqyJT2ATB
 3AXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730233714; x=1730838514;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=okL6Htptn3WmNRDIbzbj3SlxrMQsUP6Is5kTunjhLD4=;
 b=SyM5RoS8qpCeIlZNMokL0sijAk+jMI9rHbekKm6SFkmGxfOcGXVkuxNMfZzczJZYYh
 YHEdyFKHdEDiVeFLEvTJmyNbMusRP6+JP7MZ0xo8whocpKpfVevruXoOU708dNUvtQrc
 ccoo5FA5eteqeEIyCLr3YjcYtIh//bhX1WuX0/ttMRXNFDxb7FCCn07kb80YY8izdlBt
 4IaSnK8AqT7ygspQ80+oamNqr5TTg4XOdPDXQJn20n/xI4/5Zwme8DXO64hoq9wEoOSC
 bCKfmLGLpVWB2+iuNEuYCC5/YGlLMg7E5eZN/mz0935us6sVJXNL1alsEIQ/fdlLIF/8
 73zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxHEoXD42gVUWNGWdiCkmK09XCXerBpqg+nWkOjuSNC7zAWvRjUJCFjFg6aGQ/uWJHWrE9eAGpSfc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvEUv19Ksob/ZxQqzDOF6xgDdR5bnW+N3fHlSmA1ura4NdPbwY
 aU6w/ogghLzXbFBRE+hiy88n8olSbZsAvwc0t4joW78F/PS0Y4HPWetsvxGp8JA=
X-Google-Smtp-Source: AGHT+IEGGoPq8Pa3p6m1L3sUcznppS2fepgRVEY6jETOOfJxL5W0VkhZKZXj/xj79xujkJe5wpdemQ==
X-Received: by 2002:a05:6512:3d14:b0:539:fc86:ce0e with SMTP id
 2adb3069b0e04-53b348e58c7mr6398176e87.35.1730233713882; 
 Tue, 29 Oct 2024 13:28:33 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53bb81a597fsm46449e87.96.2024.10.29.13.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 13:28:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 29 Oct 2024 22:28:25 +0200
Subject: [PATCH v2 2/3] drm/msm/dp: rename edp_ bridge functions and struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-msm-dp-rename-v2-2-13c5c03fad44@linaro.org>
References: <20241029-msm-dp-rename-v2-0-13c5c03fad44@linaro.org>
In-Reply-To: <20241029-msm-dp-rename-v2-0-13c5c03fad44@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6066;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=F+8jifR+xPt2YPVuJz3hU8WMRLTwfsEcnnvlZI6xjCs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnIUVs8pWc8w67OUVciezGOH4i6/g69J03OEa/G
 kCw7sVcWOSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyFFbAAKCRCLPIo+Aiko
 1W8pCACtflGcGZZiN1kFzjfpSrI1bUCnzAkG9wwFNa6jeRpIhPRHtnXsNmgSUJnhsjpyBZvMjtH
 Wwc5E9a540J0L6d9BzZvxzjVzzv4G0Gc4HU24yKauG5CdE2MZ1uCBTBjBBWn8w8lwtjWLMdsbzW
 OHhP9EfzDdvloKZkdDVe1ymT1Qe9XQ9lqduH1wO49a6qpmJO5K28+kVR2MYnhCrb5fh0XmqwkZU
 LQI8ZE6kIRbzyIyb1E/bULQZgKBYAS9tLl7hA2zV8iRHxgIAjnOn1yEsZvwhvnD3tdQZoTla2wt
 CL/5S6lDMMm0akifTXizP1Ak/+Yd+BJbcbZ08DtV+1+mBrZA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Follow the estalished prefix and rename eDP bridge symbols to use
msm_edp_ prefix, moving the edp to the end of the symbol name.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_drm.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 6a0840266c0f..d3e241ea6941 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -115,7 +115,7 @@ static const struct drm_bridge_funcs msm_dp_bridge_ops = {
 	.debugfs_init = msm_dp_bridge_debugfs_init,
 };
 
-static int edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
+static int msm_edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
 				   struct drm_bridge_state *bridge_state,
 				   struct drm_crtc_state *crtc_state,
 				   struct drm_connector_state *conn_state)
@@ -136,7 +136,7 @@ static int edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
 	return 0;
 }
 
-static void edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
+static void msm_edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 				     struct drm_bridge_state *old_bridge_state)
 {
 	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
@@ -147,7 +147,7 @@ static void edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 
 	/*
 	 * Check the old state of the crtc to determine if the panel
-	 * was put into psr state previously by the edp_bridge_atomic_disable.
+	 * was put into psr state previously by the msm_edp_bridge_atomic_disable.
 	 * If the panel is in psr, just exit psr state and skip the full
 	 * bridge enable sequence.
 	 */
@@ -166,7 +166,7 @@ static void edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	msm_dp_bridge_atomic_enable(drm_bridge, old_bridge_state);
 }
 
-static void edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
+static void msm_edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 				      struct drm_bridge_state *old_bridge_state)
 {
 	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
@@ -194,7 +194,7 @@ static void edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 	 * If old crtc state is active, then this is a display disable
 	 * call while the sink is in psr state. So, exit psr here.
 	 * The eDP controller will be disabled in the
-	 * edp_bridge_atomic_post_disable function.
+	 * msm_edp_bridge_atomic_post_disable function.
 	 *
 	 * We observed sink is stuck in self refresh if psr exit is skipped
 	 * when display disable occurs while the sink is in psr state.
@@ -211,7 +211,7 @@ static void edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 	msm_dp_bridge_atomic_disable(drm_bridge, old_bridge_state);
 }
 
-static void edp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
+static void msm_edp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 				struct drm_bridge_state *old_bridge_state)
 {
 	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
@@ -228,7 +228,7 @@ static void edp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 		return;
 
 	/*
-	 * Self refresh mode is already set in edp_bridge_atomic_disable.
+	 * Self refresh mode is already set in msm_edp_bridge_atomic_disable.
 	 */
 	if (new_crtc_state->self_refresh_active)
 		return;
@@ -237,13 +237,13 @@ static void edp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 }
 
 /**
- * edp_bridge_mode_valid - callback to determine if specified mode is valid
+ * msm_edp_bridge_mode_valid - callback to determine if specified mode is valid
  * @bridge: Pointer to drm bridge structure
  * @info: display info
  * @mode: Pointer to drm mode structure
  * Returns: Validity status for specified mode
  */
-static enum drm_mode_status edp_bridge_mode_valid(struct drm_bridge *bridge,
+static enum drm_mode_status msm_edp_bridge_mode_valid(struct drm_bridge *bridge,
 					  const struct drm_display_info *info,
 					  const struct drm_display_mode *mode)
 {
@@ -268,24 +268,24 @@ static enum drm_mode_status edp_bridge_mode_valid(struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
-static void edp_bridge_debugfs_init(struct drm_bridge *bridge, struct dentry *root)
+static void msm_edp_bridge_debugfs_init(struct drm_bridge *bridge, struct dentry *root)
 {
 	struct msm_dp *dp = to_dp_bridge(bridge)->msm_dp_display;
 
 	msm_dp_display_debugfs_init(dp, root, true);
 }
 
-static const struct drm_bridge_funcs edp_bridge_ops = {
-	.atomic_enable = edp_bridge_atomic_enable,
-	.atomic_disable = edp_bridge_atomic_disable,
-	.atomic_post_disable = edp_bridge_atomic_post_disable,
+static const struct drm_bridge_funcs msm_edp_bridge_ops = {
+	.atomic_enable = msm_edp_bridge_atomic_enable,
+	.atomic_disable = msm_edp_bridge_atomic_disable,
+	.atomic_post_disable = msm_edp_bridge_atomic_post_disable,
 	.mode_set = msm_dp_bridge_mode_set,
-	.mode_valid = edp_bridge_mode_valid,
+	.mode_valid = msm_edp_bridge_mode_valid,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_check = edp_bridge_atomic_check,
-	.debugfs_init = edp_bridge_debugfs_init,
+	.atomic_check = msm_edp_bridge_atomic_check,
+	.debugfs_init = msm_edp_bridge_debugfs_init,
 };
 
 int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
@@ -302,7 +302,7 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	msm_dp_bridge->msm_dp_display = msm_dp_display;
 
 	bridge = &msm_dp_bridge->bridge;
-	bridge->funcs = msm_dp_display->is_edp ? &edp_bridge_ops : &msm_dp_bridge_ops;
+	bridge->funcs = msm_dp_display->is_edp ? &msm_edp_bridge_ops : &msm_dp_bridge_ops;
 	bridge->type = msm_dp_display->connector_type;
 	bridge->ycbcr_420_allowed = yuv_supported;
 

-- 
2.39.5

