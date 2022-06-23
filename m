Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4383E556F67
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 02:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7B91135F6;
	Thu, 23 Jun 2022 00:25:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76CD1135F5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 00:25:46 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id f16so15959069pjj.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 17:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SygWKchO0k+y7yXsZh0lg7LZ0sosds739AKDKHLdzm8=;
 b=b3st9LQI8EUcf4vRZkN9FuY8JTgqSsuawrFH9hFAlJZTkVCtFxFALeeL3f82fotnXr
 6LDOe5qKxy8Vz+vQ0mmD1l7s+y6QJmxrb/atmlIsrpBBGx6kLWqfcw1LvOF5iyJO1MCP
 c2DKMugV/35nUO1ROV12YG7FUQWLGIYSHRSiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SygWKchO0k+y7yXsZh0lg7LZ0sosds739AKDKHLdzm8=;
 b=Nz/YVTCGKi+IORp3y/Pu7+Fq8oAE0loO0obuxtjemw9a6a2gGELET1FxOMDqKdPuN2
 CXbePqoCvH5BonyEXvBGHq/jz901pwy6H6+Oo2wr8EzAMaNjjekFYblZCCtVTiI1+J3u
 JV9ZDW3XsFuPdMQ2UQOSV4Pwx8Mf9D5uZIhPYf/et9WHoWq2wyF1z8V9ySCKJHe/2TKj
 oqucbDzy+vmPlxGoQg4Hp+IQu3c1G5rwhZKki8O0HuciQBpOjAXNtK7w+F+RGYANlgXh
 zhF/edY/vrq9zZv/EbNNoVu82Wqykul1pxjsS6d3f2dLptKVwBSneB1tebwzhRWrgr2h
 C03w==
X-Gm-Message-State: AJIora8Nb2gC16B9D64TpTIPimbzFavQE5arCqp0TyDXsbp26otqEo2h
 ySBSMZBDLHjGkYvg9EyHOKkZqg==
X-Google-Smtp-Source: AGRyM1vljkq/ZMbBKLNrU/5jd/GiIb1Avw040L4R6xvEuHNHC8lbPLZXn68o6WxIfLbKiAsrJ+bvnw==
X-Received: by 2002:a17:902:b216:b0:16a:854:e641 with SMTP id
 t22-20020a170902b21600b0016a0854e641mr29379561plr.154.1655943946136; 
 Wed, 22 Jun 2022 17:25:46 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f28c:6f86:743c:1c04])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a170903024100b00163fbb1eec5sm13332705plh.229.2022.06.22.17.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 17:25:45 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 3/3] drm/msm/dp: Get rid of
 dp_ctrl_on_stream_phy_test_report()
Date: Wed, 22 Jun 2022 17:25:40 -0700
Message-Id: <20220623002540.871994-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
In-Reply-To: <20220623002540.871994-1-swboyd@chromium.org>
References: <20220623002540.871994-1-swboyd@chromium.org>
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

This API isn't really more than a couple lines now that we don't store
the pixel_rate to the struct member. Inline it into the caller.

Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 44 ++++++++++++--------------------
 1 file changed, 17 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index feb26d4d6e97..e475f4ca078a 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1564,36 +1564,15 @@ static bool dp_ctrl_send_phy_test_pattern(struct dp_ctrl_private *ctrl)
 	return success;
 }
 
-static int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl)
+static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
 {
 	int ret;
-	struct dp_ctrl_private *ctrl;
 	unsigned long pixel_rate;
 
-	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
-
-	pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
-	dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel", pixel_rate * 1000);
-
-	ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, true);
-	if (ret) {
-		DRM_ERROR("Unable to start pixel clocks. ret=%d\n", ret);
-		return ret;
-	}
-
-	dp_ctrl_send_phy_test_pattern(ctrl);
-
-	return 0;
-}
-
-static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
-{
-	int ret = 0;
-
 	if (!ctrl->link->phy_params.phy_test_pattern_sel) {
 		drm_dbg_dp(ctrl->drm_dev,
 			"no test pattern selected by sink\n");
-		return ret;
+		return 0;
 	}
 
 	/*
@@ -1608,12 +1587,23 @@ static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
 	}
 
 	ret = dp_ctrl_on_link(&ctrl->dp_ctrl);
-	if (!ret)
-		ret = dp_ctrl_on_stream_phy_test_report(&ctrl->dp_ctrl);
-	else
+	if (ret) {
 		DRM_ERROR("failed to enable DP link controller\n");
+		return ret;
+	}
 
-	return ret;
+	pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
+	dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel", pixel_rate * 1000);
+
+	ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, true);
+	if (ret) {
+		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
+		return ret;
+	}
+
+	dp_ctrl_send_phy_test_pattern(ctrl);
+
+	return 0;
 }
 
 void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl)
-- 
https://chromeos.dev

