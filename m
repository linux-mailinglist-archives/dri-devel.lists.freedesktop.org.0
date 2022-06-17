Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F398E54FE82
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 22:48:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62587112034;
	Fri, 17 Jun 2022 20:47:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B47B910FD81
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 20:47:55 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id f65so4969194pgc.7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 13:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZkHcSooWDiFQAWanDp+t9iIhWojlq4TIuHk5USWu968=;
 b=EiW2jSIpWnSRYzvxKxkG6vi0w3xy/58QL63gbehgu6Xz2yKJ5Sf2Bfr8wBlOiAOaha
 VILTTueJVdvB68GFjLMbnvdjEe72h5g76xKMIkWXi1UtUr6Uxd0BlGdUaLInDbpIhzQI
 dl7bEPbJsPf6GuAIlyO0Neb7bK8WXwcCwwpIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZkHcSooWDiFQAWanDp+t9iIhWojlq4TIuHk5USWu968=;
 b=x8s7Q9ezP8mfNPBzUT2F3EJ4QhxSaJHy0l97EBkOe/8aDdr9vQ6xvD5jpUOjyDA5xj
 EgJIUji/Pc/HQmXDAw1AojQNFU1i/jYb1QIeApn0nM7rCDpYqUvpgq1BIuPL/qdBemxK
 RBk8d3yIzyoNWAoSLcKV5kyOR+baYFG5vzCRTcUYe/FAYW3aiYuKLtNY48dh05n+2ETZ
 K9GyHC9ZKN8cX08vQX7LIEASPjRTeYLL70hN6eETXgoufWjmD0MQnxVwkrXNWUMysW/9
 SVDEwAKLbFG6OEH7v9wyaPVKnxY8K/lR1wRyByMHTzRrk72JC/AUpNFJdQQTY66N62HJ
 CuFQ==
X-Gm-Message-State: AJIora+k2qcZIr5NTJjYWxoCYm7//+kKWb41/fy9oA2ZQ6Ew9Y6V0ZZi
 JFyriC1EKXf5l/y8XpPsd+7JCw==
X-Google-Smtp-Source: AGRyM1tviS+33tpMgDPQRa+qfam6sWYHX1/xJo9ZNWkAIGRMfkx8jNSbEbSqFZIiC7tLsFzZ8nSlnQ==
X-Received: by 2002:a05:6a02:201:b0:3fc:6071:a272 with SMTP id
 bh1-20020a056a02020100b003fc6071a272mr10732274pgb.518.1655498875212; 
 Fri, 17 Jun 2022 13:47:55 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:52e2:7dc8:1e20:f870])
 by smtp.gmail.com with ESMTPSA id
 z12-20020aa79f8c000000b0052089e1b88esm4098325pfr.192.2022.06.17.13.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 13:47:54 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 3/3] drm/msm/dp: Get rid of dp_ctrl_on_stream_phy_test_report()
Date: Fri, 17 Jun 2022 13:47:50 -0700
Message-Id: <20220617204750.2347797-4-swboyd@chromium.org>
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

This API isn't really more than a couple lines now that we don't store
the pixel_rate to the struct member. Inline it into the caller.

Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 40 ++++++++++++--------------------
 1 file changed, 15 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index e114521af2e9..d04fddb29fdf 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1582,34 +1582,15 @@ static bool dp_ctrl_send_phy_test_pattern(struct dp_ctrl_private *ctrl)
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
-	ret = dp_ctrl_enable_stream_clocks(ctrl, pixel_rate);
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
@@ -1624,12 +1605,21 @@ static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
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
+	ret = dp_ctrl_enable_stream_clocks(ctrl, pixel_rate);
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

