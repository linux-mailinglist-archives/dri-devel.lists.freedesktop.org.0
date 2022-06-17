Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 554EA54FE7F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 22:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0E210FD81;
	Fri, 17 Jun 2022 20:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65F010FB57
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 20:47:53 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id 187so5087010pfu.9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 13:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ByN+wCXaOxi271nnEIZ20wtThFUPoDse0EkNhfr7LCE=;
 b=eIwcGaOBfUoWV4QGJeTDfvsmyotQRYQB6zsaQIRyV1maGpuVoPAlQB3RThmxv4Hos8
 jj4yc7Rufi0MaAymjjwUWqflreOIgzvMyGYd/Z4cQTmiokLd6qUkFa0MYo1Y1nee+b/g
 sf5w340ndmzZ6mbvxm9sfKgndB7bSzaASL6vI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ByN+wCXaOxi271nnEIZ20wtThFUPoDse0EkNhfr7LCE=;
 b=Ig6np5MyeOOvkZuQpAqEgaPK5H/hfmnUbBKSQBiAuuaODBvNmIRT0mNhggr1QXbdP9
 nhRRKlg8iz3tZDfPotygmZMM7m3ECNGoWRBUWbFrce+rg2HXWxd/oLQzkotsS3PX6vvu
 oe08jhWE2fAed4hgo7pkZO+M4d2w1yN7r0nA4xGRMQ7cEv2GNJj29hPM+80JdxwMbflK
 IgLN4iX8W1DaTmF/PRsnUFKt0d4QicaljCto6NxDV+KrxkODxRKs48Hmk0yBKKamHN37
 eFDHyoFWcmfnmBQ5QPp50x9VgBDKlV0Sf+WVSbOAcVahWKuOaA3N8Gao7Who8VEjZjOW
 Jmxw==
X-Gm-Message-State: AJIora8JB4Vm0EouDfrvmu+frQjKmIj6ajkyWeYfIzGOMg6IE3dGY4gQ
 ERdJQcYw72O0c14nkogkwAZurn4PfV7tgw==
X-Google-Smtp-Source: AGRyM1slGiViNrdzjVzcJOZuNc8QQfUtUDCVS+hnpTK9qGAD4qXmlvfW7+GU2rKzC3z/BPQ12WJFmQ==
X-Received: by 2002:a63:140e:0:b0:408:a923:1a81 with SMTP id
 u14-20020a63140e000000b00408a9231a81mr10419194pgl.358.1655498873182; 
 Fri, 17 Jun 2022 13:47:53 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:52e2:7dc8:1e20:f870])
 by smtp.gmail.com with ESMTPSA id
 z12-20020aa79f8c000000b0052089e1b88esm4098325pfr.192.2022.06.17.13.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 13:47:52 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 1/3] drm/msm/dp: Reorganize code to avoid forward declaration
Date: Fri, 17 Jun 2022 13:47:48 -0700
Message-Id: <20220617204750.2347797-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220617204750.2347797-1-swboyd@chromium.org>
References: <20220617204750.2347797-1-swboyd@chromium.org>
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
Cc: Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 patches@lists.linux.dev, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's move these functions around to avoid having to forward declare
dp_ctrl_on_stream_phy_test_report(). Also remove
dp_ctrl_reinitialize_mainlink() forward declaration because we're doing
that sort of task.

Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 104 +++++++++++++++----------------
 1 file changed, 50 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 703249384e7c..bd445e683cfc 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1238,8 +1238,6 @@ static int dp_ctrl_link_train_2(struct dp_ctrl_private *ctrl,
 	return -ETIMEDOUT;
 }
 
-static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl);
-
 static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
 			int *training_step)
 {
@@ -1534,38 +1532,6 @@ static int dp_ctrl_link_maintenance(struct dp_ctrl_private *ctrl)
 	return ret;
 }
 
-static int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl);
-
-static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
-{
-	int ret = 0;
-
-	if (!ctrl->link->phy_params.phy_test_pattern_sel) {
-		drm_dbg_dp(ctrl->drm_dev,
-			"no test pattern selected by sink\n");
-		return ret;
-	}
-
-	/*
-	 * The global reset will need DP link related clocks to be
-	 * running. Add the global reset just before disabling the
-	 * link clocks and core clocks.
-	 */
-	ret = dp_ctrl_off(&ctrl->dp_ctrl);
-	if (ret) {
-		DRM_ERROR("failed to disable DP controller\n");
-		return ret;
-	}
-
-	ret = dp_ctrl_on_link(&ctrl->dp_ctrl);
-	if (!ret)
-		ret = dp_ctrl_on_stream_phy_test_report(&ctrl->dp_ctrl);
-	else
-		DRM_ERROR("failed to enable DP link controller\n");
-
-	return ret;
-}
-
 static bool dp_ctrl_send_phy_test_pattern(struct dp_ctrl_private *ctrl)
 {
 	bool success = false;
@@ -1618,6 +1584,56 @@ static bool dp_ctrl_send_phy_test_pattern(struct dp_ctrl_private *ctrl)
 	return success;
 }
 
+static int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl)
+{
+	int ret;
+	struct dp_ctrl_private *ctrl;
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+
+	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
+
+	ret = dp_ctrl_enable_stream_clocks(ctrl);
+	if (ret) {
+		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
+		return ret;
+	}
+
+	dp_ctrl_send_phy_test_pattern(ctrl);
+
+	return 0;
+}
+
+static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
+{
+	int ret = 0;
+
+	if (!ctrl->link->phy_params.phy_test_pattern_sel) {
+		drm_dbg_dp(ctrl->drm_dev,
+			"no test pattern selected by sink\n");
+		return ret;
+	}
+
+	/*
+	 * The global reset will need DP link related clocks to be
+	 * running. Add the global reset just before disabling the
+	 * link clocks and core clocks.
+	 */
+	ret = dp_ctrl_off(&ctrl->dp_ctrl);
+	if (ret) {
+		DRM_ERROR("failed to disable DP controller\n");
+		return ret;
+	}
+
+	ret = dp_ctrl_on_link(&ctrl->dp_ctrl);
+	if (!ret)
+		ret = dp_ctrl_on_stream_phy_test_report(&ctrl->dp_ctrl);
+	else
+		DRM_ERROR("failed to enable DP link controller\n");
+
+	return ret;
+}
+
 void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl)
 {
 	struct dp_ctrl_private *ctrl;
@@ -1815,26 +1831,6 @@ static int dp_ctrl_link_retrain(struct dp_ctrl_private *ctrl)
 	return dp_ctrl_setup_main_link(ctrl, &training_step);
 }
 
-static int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl)
-{
-	int ret;
-	struct dp_ctrl_private *ctrl;
-
-	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
-
-	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
-
-	ret = dp_ctrl_enable_stream_clocks(ctrl);
-	if (ret) {
-		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
-		return ret;
-	}
-
-	dp_ctrl_send_phy_test_pattern(ctrl);
-
-	return 0;
-}
-
 int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
 {
 	int ret = 0;
-- 
https://chromeos.dev

