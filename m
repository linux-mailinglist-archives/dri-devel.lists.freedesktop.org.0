Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFC19B2F2C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 12:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E640110E47F;
	Mon, 28 Oct 2024 11:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ubgEsWUh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99CD10E47F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 11:49:23 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-539e8607c2aso4247047e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2024 04:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730116162; x=1730720962; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ywWb6UG3R7MbDFwKiKVkTMsZ23NPlCDkNt6Bjg3cqTk=;
 b=ubgEsWUhMXVvMEX6ekaKaAGY9b04CUHOFBZRQb8BVx+OUFCIlUrqqq17GWhqqcGVJY
 Z2JyRwK0+MLZ2m+fcGNhCoCzn1wL3PPuZnTx1LFyEqEk/wJg4b5fhw50ip0SP4r08TbF
 H0oite3dWgMB6a7ngHjiAgxyIUFqcqIS3s2mqg+ISKpaLiJkxOv+onHXZ7HpvLr+47wW
 etz7KMLo+AAwVt9lQNeUi9jKOMUBOktt780m+9a0yPzpA2OobVCLcL9li0hq35KtJdDX
 corX3rC9fG2vTdBkp7+WqyjJNHNfi5LqsS7YWNvv8S5dGnMu2ATsYtMcObkTvCi8mTyE
 QshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730116162; x=1730720962;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ywWb6UG3R7MbDFwKiKVkTMsZ23NPlCDkNt6Bjg3cqTk=;
 b=eLnguRUbEFtvbghx4tpMcKw30vbY/Qw/QxnIOIsPA1fkG0/BSu6x9ev8sCJRfLkdBk
 GdaMvwIxQ6YHBHusPFTV5rlJ4kXPzT6vYOJA2xvlE9upXQ/TrcSxC8p7S5NXdgqdsDCp
 +ZIdqEtxF3BwWJu+BKdsX1wdk5ApgSrGKxMeQr1lrLnmF3rTtTa3jWKzZ7rqocH6AMWq
 A+miT8M++LskoEVFROXZ1enPZJcdZtuVKmlGZ7oWipkeXTUgQFCuE4hrvBIg2hLljx3+
 e2AuZwws7KyBMb0tq2zqKv0ir3L8g99YAuZGVthlKe0t0oPoKr5/kiCrJa+kHeLROi8c
 kVew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXs4cZAFPgeHqObFL8K8tGviORsopBFfEmRJaY8K27SKHBuwykkyi2ERYxSbhp81ESehKSaAAiIE9A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwA699UKF6rpB6qcstrYEXAua7rmoXlfupoOyapt+P+95XXxptS
 AFLjdK+ZchMLZ4UEH7nxuLiMWRbyzpY4t9WLGLNGAnzQeNzolTmq6Ske3VOm3gI=
X-Google-Smtp-Source: AGHT+IHsK96DIputJTSrSnNgco0JesKaJqeZ6HX5dUgWhWKP0bivQgrJXq2ZKYwF5m6W07BmG80sYw==
X-Received: by 2002:a05:6512:3ba0:b0:52c:e17c:3741 with SMTP id
 2adb3069b0e04-53b348b7c07mr2947300e87.5.1730116161956; 
 Mon, 28 Oct 2024 04:49:21 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e10a5c6sm1042385e87.19.2024.10.28.04.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 04:49:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 28 Oct 2024 13:49:15 +0200
Subject: [PATCH 2/3] drm/msm/dp: rename edp_ bridge functions and struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-msm-dp-rename-v1-2-a2564e9457b0@linaro.org>
References: <20241028-msm-dp-rename-v1-0-a2564e9457b0@linaro.org>
In-Reply-To: <20241028-msm-dp-rename-v1-0-a2564e9457b0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6119;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=VcEaWSEj4fkAOPz67z969jHnCNLhbQcbOf0NHJf7h0k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnH3o93re7sCpk52kOEh8zbQcpdPG1Me4BLl5n7
 zlGXzsPuC6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZx96PQAKCRCLPIo+Aiko
 1WHHB/9RlC/AJyhc1rQ8t1qwPKTy9caNxibdStUe7hoyh2MrFwVMItiD8zpBzsFLBcCbsHX0axW
 KtZWH5yOxHdx2DTh4AaSd0K0VevhKCIZitqsyPNi6vZofxGe+aH5ak3MM8/f4XIT6yDHIpQCK/F
 R/tnSGLwvBrS7HZXM1Cr/eRK46WV9Farr3XouIxEYdApguiqlO9gOoJ6uWTf0fjuGwtiJvjEQKc
 i2e4uL58zIQU0w2qXhqhqXMxHplTZzJcdv8zNgIaoxMAoO9SrVJBp4NvNR+ovr6+Lgo2U5Zeph0
 U3ZU/jIN8HBkd1WQdDas/luESY8R7gUwaGybifQp8Y0jqh7m
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
msm_dp_ prefix, moving the edp to the end of the symbol name.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_drm.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 6a0840266c0f..ff9ce9b15234 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -115,7 +115,7 @@ static const struct drm_bridge_funcs msm_dp_bridge_ops = {
 	.debugfs_init = msm_dp_bridge_debugfs_init,
 };
 
-static int edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
+static int msm_dp_bridge_atomic_check_edp(struct drm_bridge *drm_bridge,
 				   struct drm_bridge_state *bridge_state,
 				   struct drm_crtc_state *crtc_state,
 				   struct drm_connector_state *conn_state)
@@ -136,7 +136,7 @@ static int edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
 	return 0;
 }
 
-static void edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
+static void msm_dp_bridge_atomic_enable_edp(struct drm_bridge *drm_bridge,
 				     struct drm_bridge_state *old_bridge_state)
 {
 	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
@@ -147,7 +147,7 @@ static void edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 
 	/*
 	 * Check the old state of the crtc to determine if the panel
-	 * was put into psr state previously by the edp_bridge_atomic_disable.
+	 * was put into psr state previously by the msm_dp_bridge_atomic_disable_edp.
 	 * If the panel is in psr, just exit psr state and skip the full
 	 * bridge enable sequence.
 	 */
@@ -166,7 +166,7 @@ static void edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	msm_dp_bridge_atomic_enable(drm_bridge, old_bridge_state);
 }
 
-static void edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
+static void msm_dp_bridge_atomic_disable_edp(struct drm_bridge *drm_bridge,
 				      struct drm_bridge_state *old_bridge_state)
 {
 	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
@@ -194,7 +194,7 @@ static void edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 	 * If old crtc state is active, then this is a display disable
 	 * call while the sink is in psr state. So, exit psr here.
 	 * The eDP controller will be disabled in the
-	 * edp_bridge_atomic_post_disable function.
+	 * msm_dp_bridge_atomic_post_disable_edp function.
 	 *
 	 * We observed sink is stuck in self refresh if psr exit is skipped
 	 * when display disable occurs while the sink is in psr state.
@@ -211,7 +211,7 @@ static void edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 	msm_dp_bridge_atomic_disable(drm_bridge, old_bridge_state);
 }
 
-static void edp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
+static void msm_dp_bridge_atomic_post_disable_edp(struct drm_bridge *drm_bridge,
 				struct drm_bridge_state *old_bridge_state)
 {
 	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
@@ -228,7 +228,7 @@ static void edp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 		return;
 
 	/*
-	 * Self refresh mode is already set in edp_bridge_atomic_disable.
+	 * Self refresh mode is already set in msm_dp_bridge_atomic_disable_edp.
 	 */
 	if (new_crtc_state->self_refresh_active)
 		return;
@@ -237,13 +237,13 @@ static void edp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 }
 
 /**
- * edp_bridge_mode_valid - callback to determine if specified mode is valid
+ * msm_dp_bridge_mode_valid_edp - callback to determine if specified mode is valid
  * @bridge: Pointer to drm bridge structure
  * @info: display info
  * @mode: Pointer to drm mode structure
  * Returns: Validity status for specified mode
  */
-static enum drm_mode_status edp_bridge_mode_valid(struct drm_bridge *bridge,
+static enum drm_mode_status msm_dp_bridge_mode_valid_edp(struct drm_bridge *bridge,
 					  const struct drm_display_info *info,
 					  const struct drm_display_mode *mode)
 {
@@ -268,24 +268,24 @@ static enum drm_mode_status edp_bridge_mode_valid(struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
-static void edp_bridge_debugfs_init(struct drm_bridge *bridge, struct dentry *root)
+static void msm_dp_bridge_debugfs_init_edp(struct drm_bridge *bridge, struct dentry *root)
 {
 	struct msm_dp *dp = to_dp_bridge(bridge)->msm_dp_display;
 
 	msm_dp_display_debugfs_init(dp, root, true);
 }
 
-static const struct drm_bridge_funcs edp_bridge_ops = {
-	.atomic_enable = edp_bridge_atomic_enable,
-	.atomic_disable = edp_bridge_atomic_disable,
-	.atomic_post_disable = edp_bridge_atomic_post_disable,
+static const struct drm_bridge_funcs msm_dp_bridge_ops_edp = {
+	.atomic_enable = msm_dp_bridge_atomic_enable_edp,
+	.atomic_disable = msm_dp_bridge_atomic_disable_edp,
+	.atomic_post_disable = msm_dp_bridge_atomic_post_disable_edp,
 	.mode_set = msm_dp_bridge_mode_set,
-	.mode_valid = edp_bridge_mode_valid,
+	.mode_valid = msm_dp_bridge_mode_valid_edp,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_check = edp_bridge_atomic_check,
-	.debugfs_init = edp_bridge_debugfs_init,
+	.atomic_check = msm_dp_bridge_atomic_check_edp,
+	.debugfs_init = msm_dp_bridge_debugfs_init_edp,
 };
 
 int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
@@ -302,7 +302,7 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	msm_dp_bridge->msm_dp_display = msm_dp_display;
 
 	bridge = &msm_dp_bridge->bridge;
-	bridge->funcs = msm_dp_display->is_edp ? &edp_bridge_ops : &msm_dp_bridge_ops;
+	bridge->funcs = msm_dp_display->is_edp ? &msm_dp_bridge_ops_edp : &msm_dp_bridge_ops;
 	bridge->type = msm_dp_display->connector_type;
 	bridge->ycbcr_420_allowed = yuv_supported;
 

-- 
2.39.5

